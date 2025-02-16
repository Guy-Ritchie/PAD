# CUSTOM ALIAS'es...
# Custom alias definition

# Function to start jupyterlab with custom port
function start_jupyter_lab() {
  local port=${1:-4004}
  jupyter lab --port $port --ContentsManager.allow_hidden=True --no-browser
}
# function to create and activate a virtual environment
function create_and_activate_venv() {
  local venv_name=${1:-.venv}
  python -m venv $venv_name
  source "$venv_name/bin/activate"
}
# function to activate a virtual environment
function activate_venv() {
  # Find all potential virtual environment directories
  local venv_dirs=($(find . -maxdepth 1 -type d -name "*venv*" -o -name "*venv*"))

  # Filter to only valid venv directories (containing bin/activate)
  local valid_venvs=()
  for dir in $venv_dirs; do
    if [ -f "$dir/bin/activate" ]; then
      valid_venvs+=("$dir")
    fi
  done

  # Check if we found any valid venvs
  if (( ${#valid_venvs[@]} == 0 )); then
    echo "\033[31mNo virtual environments found.\033[0m"
    return 1
  fi

  # If only one venv found, activate it directly
  if (( ${#valid_venvs[@]} == 1 )); then
    source "${valid_venvs[1]}/bin/activate"
    echo "\033[32mVirtual environment activated: ${valid_venvs[1]}\033[0m"
    return 0
  fi

  # If multiple venvs found, let user choose
  echo "\033[33mMultiple virtual environments found. Please select one:\033[0m"
  local i=1
  for venv in $valid_venvs; do
    echo "\033[33m$i: $venv\033[0m"
    ((i++))
  done

  echo -n "\033[33mEnter the number of the virtual environment to activate: \033[0m"
  read choice

  # Validate choice
  if [[ "$choice" =~ ^[0-9]+$ ]] && (( choice >= 1 && choice <= ${#valid_venvs[@]} )); then
    source "${valid_venvs[$choice]}/bin/activate"
    echo "\033[32mVirtual environment activated: ${valid_venvs[$choice]}\033[0m"
    return 0
  else
    echo "\033[31mInvalid choice. Please try again.\033[0m"
    return 1
  fi
}

# Function to deactivate a virtual environment
function deactivate_venv() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    deactivate
    echo "\033[32mVirtual environment deactivated.\033[0m"
  else
    echo "\033[31mNo virtual environment currently active.\033[0m"
  fi
}

# Aliases
alias sjl="start_jupyter_lab"
alias cav="create_and_activate_venv"
alias av="activate_venv"
alias dv="deactivate_venv"


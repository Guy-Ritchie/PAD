
""""""
"" These are options I've set, that are usable on a base vim installation.
"" Options related to plugins, will come later on in the file.
""""""

" You can map a specific key to be the escape to any other key other than
" 'Esc' like so: here, we're mapping jj to Esc
" imap jj <Esc>

" Syntax highlighting
syntax on

"""
" Custom setting, copied from
" https://baeldung.com/linux/vim-last-edit-position
"""
" Retains cursor position at last opened/present line
" if has("autocmd")
"   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
" endif
" Same functionality can be achieved using 'farmergreg/vim-lastplace' plugin,
" so using it!

" Set FZF Default to Ripgrep (must install ripgrep)
" So, FZF is a fuzzy-finder, and we're using a tool called ripgrep to find files.
" You install the tool using sudo apt-get install ripgrep
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'

" Options are viewable by using :options
" Set viewable options using :set all
" Individual option related help can be accessed by doing :help <option-name>
set nocompatible
"set background=dark
set laststatus=2
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set wrap
set cursorline
" set undofile
set incsearch
set nu
" While scrolling through the file, scroll until last/first 7 lines
set so=7
" Sets a line at column 100 and highlights it in the specified color
" set colorcolumn=100
 "highlight ColorColumn ctermbg=2
" Trying out this typing to see how the colorcolumn value/option behaves, will this color text coming in after the column width of 100 differently? Let's check and see, will this color each 100 column width differently? Who knows? We'll figure it out!

""""""
"" Following this, the options are pertaining to vim-plug plugins installation, and customization.
""""""

" Plugins
call plug#begin('~/.vim/plugged')

" Coc - Code Completions
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Formatter
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Comment and uncomment lines
Plug 'preservim/nerdcommenter'

" Light and configurable statusline/tabline plugin for vim
" Plug 'itchyny/lightline.vim'

"Find, Filter, Preview, Pick. All lua, all the time.
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-tree/nvim-web-devicons'

" Markdown preview?
"Plug 'iamcco/markdown-preview.vim'

" Directory tree
Plug 'scrooloose/nerdtree'

" For using dev-icons
Plug 'ryanoasis/vim-devicons'

" Visualize undo history tree (in vim undo is not linear)
Plug 'mbbill/undotree'

" Syntax highliighting for languages
Plug 'sheerun/vim-polyglot'

" Fzf is a general-purpose command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" A inline git blame tool, inspired by gitlines for vim
Plug 'APZelos/blamer.nvim'

" Remember cursor position
Plug 'farmergreg/vim-lastplace'

" Python code Formatter
Plug 'ambv/black'

" lean & mean status/tabline for vim that's light as air
" basically status bar
Plug 'vim-airline/vim-airline'
" airline themes
Plug 'vim-airline/vim-airline-themes'

" Color schemes
" Basically is a colorscheme pack to try everything, and choose one of many
" themes
" Plug 'flazz/vim-colorschemes'

" Molokai colorscheme looks good!
Plug 'tomasr/molokai'

" OneDark theme also looks nice. Can choose between these two!
Plug 'joshdick/onedark.vim'

" Experimental! Just to try and install godot lang server
Plug 'habamax/vim-godot'

" Rust plugin
Plug 'rust-lang/rust.vim'

call plug#end()

""" Before you get starting using Prettier, ensure that you're running a
""" latest stable version of node.js
" You can do that using:
" 1. Cleaning the cache of node package manager:
"   sudo npm cache clean -f
" 2. Install the node package 'n' which will help you interactively manage
" your node versions:
"   sudo npm install -g n
" 3. Install the latest stable node version using the 'n' tool
"   sudo n stable
" 4. The command in itself will show you what to do next to complete
" configuring the latest stable version of node on your machine. In this
" instance it asked me to do:
"   hash -r # After verifying that node still is linked to the old
"   # installation!
" 5. You would have to install yarn, using:
"   npm install --global yarn
" 6. You will then be able to use prettier, with the cli that is configured
" below:
"""
" Setting the prettier cli executable path
let g:prettier#exec_cmd_path="~/.vim/plugged/vim-prettier/node_modules/prettier"
" Setting maximum line length that prettier will wrap on:
" this setting will consider a number or 'auto'
let g:prettier#config#print_width = 100 " default value is 'auto'

" Using the recommended setting as stated in vimawesome docs for enabling
" powerline fonts integration
" Vim-Airline settings
let g:airline_powerline_fonts=1
" Setting gui-font as recommended in vim-devicons wiki
set guifont=Iosevka\ 16
let g:airline#extensions#tabline#formatter='default'
" NOTE: PowerLine Fonts:
" Ensure that some powerline-font is installed!
" Iosevka supports powerline fonts. So, ensure that you have the font
" installed, and then also ensure that your terminal emulator supports those
" fonts!

"" Setting the colorscheme
" onedark colorscheme
"colorscheme onedark
" molokai colorscheme
colorscheme molokai

""" Custom Key-bindings
""" Took inspiration from: https://youtu.be/mbSaK3EOqO8
""" Kantan Coding - How To Make Vim Amazing From Scratch

"" Beginning of keybindings configuration
" Set mapleader to space
let mapleader=" "
" Open hotkeys help using 'space' and 'h
nmap <leader>h :vsplit ~/.vim/hotkeys<cr>
" Open NERDTree using 'space' and 't'
"nmap <leader>t :NERDTree<cr>
nmap <leader>t :NERDTreeToggle<cr>
" Open terminal on right
nmap <leader>` :vertical belowright term ++close zsh<cr>
nmap <leader><leader>` :below term ++close zsh<cr>
" nnoremap <leader><leader>c :call NERDComment(0,"toggle")<CR>
" vnoremap <leader><leader>c :call NERDComment(0,"toggle)<CR>
" NERDComment() has been depreciated, so we're using the newer one:
" nerdcommenter#Comment()
" Comment out lines/blocks using 'space' 'space' and 'c'
nnoremap <leader><leader>c :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap <leader><leader>c :call nerdcommenter#Comment(0,"toggle")<CR>
" Use 'space' and 'Tab' to switch to newer file opened
nnoremap <leader><Tab> :bnext<CR>
" Use 'space' 'Tab' and 'Tab' to switch to previously opened file
nnoremap <leader><Tab><Tab> :bprevious<CR>
" Files (runs $FZF_DEFAULT_COMMAND if defined)
nmap <leader><leader>f :Files<CR>
" Use 'space' and 'p' for prettier formatter
nmap <leader><leader>p :Prettier<cr>
" Trying to see what GFiles/Git Files does!
nnoremap <leader>g :GFiles<CR>
" To set wrap and nowrap
nmap <leader>z :set wrap<CR>
nmap <leader><leader>z :set nowrap<CR>

""" APZelos blamer config
""" Reference: https://github.com/APZelos/blamer.nvim
let g:blamer_enabled = 1
let g:blamer_delay = 2000
let g:blamer_prefix = ' ==> ' 
let g:blamer_date_format = '%d/%m/%y'
"highlight Blamer guifg=lightgrey


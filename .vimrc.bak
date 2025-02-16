
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Formatter
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Comment and uncomment lines
Plug 'preservim/nerdcommenter'

" Light and configurable statusline/tabline plugin for vim
" Plug 'itchyny/lightline.vim'

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


""""""""""""""""""coc nvim settings start""""""""""""""""""""""""""""""

" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=UTF-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

""""""""""""""""""coc nvim settings end""""""""""""""""""""""""""""""""

"" Setting the colorscheme
" onedark colorscheme
colorscheme onedark
" molokai colorscheme
"colorscheme molokai

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

" ============================================================================
" Vim-plug initialization
" ============================================================================
let vim_plug_just_installed = 0
let vim_plug_path = expand('$HOME/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
  echo "Installing Vim-plug..."
  silent !mkdir -p $HOME/.config/nvim/autoload
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
  :execute 'source '.fnameescape(vim_plug_path)
endif

" ============================================================================
" Active plugins
" ============================================================================
call plug#begin('~/.config/nvim/plugged')

" Main colorscheme
Plug 'sainnhe/edge'

" Startup Time Vim
Plug 'dstein64/vim-startuptime'

" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'

" Vim wiki
Plug 'vimwiki/vimwiki'

" Faster Colorizer Alternative
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" quick commenter
Plug 'preservim/nerdcommenter'

" vim-smoothie
Plug 'psliwka/vim-smoothie'

" Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Override configs by directory
Plug 'arielrossanigo/dir-configs-override.vim'

" Better file browser
Plug 'scrooloose/nerdtree'

" Class/module browser
Plug 'majutsushi/tagbar'

" Search results counter
Plug 'vim-scripts/IndexedSearch'

" Startify, fancy start screen for vim
Plug 'mhinz/vim-startify'

" Integrated Floating terminal
Plug 'voldikss/vim-floaterm'

" Airline status line
Plug 'vim-airline/vim-airline'

" Themes for Airline
Plug 'vim-airline/vim-airline-themes'

" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' 

" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'

" Completion from other opened files
Plug 'Shougo/context_filetype.vim'

" Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose'

" Indent text object
Plug 'michaeljsmith/vim-indent-object'

" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'

" Better language packs
Plug 'sheerun/vim-polyglot'

" Ack code search (requires ack installed in the system)
Plug 'mileszs/ack.vim'

" Paint css colors with the real color
Plug 'lilydjwg/colorizer'

" Generate html in a simple way
Plug 'mattn/emmet-vim'

" Git integration
Plug 'tpope/vim-fugitive'

" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'

" Linters
Plug 'neomake/neomake'

" Nice icons: Need to install patched font for this to work
Plug 'ryanoasis/vim-devicons'

" Distraction free programming
Plug 'junegunn/goyo.vim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'


" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()


" =============================================================================
" Automate the plugin install process if this is the first time nvim is ran
" =============================================================================
if vim_plug_just_installed
  echo ""
  echo "Installing all plugins for"$USER
  echo ""
  :PlugInstall
endif


" =============================================================================
" Custom commands and autocommands
" =============================================================================

" Kill all open buffers accepts for active one
command! KillAllButOne execute '%bdelete|edit #|normal `"'
command! VerticalAndSwitch :vs | :wincmd l
command! HorizontalAndSwitch :split | :wincmd j

" Make neovim see .js, .ts files as jsx, tsx files: FIX for coc-tsserver
autocmd FileType javascript set filetype=javascriptreact
autocmd FileType typescript set filetype=typescriptreact

" Set expand witdth for web based languages
autocmd FileType html setlocal ts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sw=2 expandtab
autocmd FileType scss setlocal ts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sw=2 expandtab
autocmd FileType javascriptreact setlocal ts=2 sw=2 expandtab
autocmd FileType typescript setlocal ts=2 sw=2 expandtab
autocmd FileType typescriptreact setlocal ts=2 sw=2 expandtab
autocmd FileType json setlocal ts=4 sw=4 expandtab
autocmd FileType vue setlocal ts=2 sw=2 expandtab
" Set expand width for Low level languages
autocmd FileType c setlocal ts=2 sw=2 expandtab
autocmd FileType h setlocal ts=2 sw=2 expandtab
autocmd FileType cpp setlocal ts=2 sw=2 expandtab
autocmd FileType hpp setlocal ts=2 sw=2 expandtab
autocmd FileType rs setlocal ts=2 sw=2 expandtab
" Set expand width for scripting languages
autocmd FileType sh setlocal ts=2 sw=2 expandtab
autocmd FileType zsh setlocal ts=2 sw=2 expandtab
autocmd FileType fish setlocal ts=2 sw=2 expandtab
autocmd FileType vim setlocal ts=2 sw=2 expandtab
autocmd FileType bash setlocal ts=2 sw=2 expandtab
autocmd FileType lisp setlocal ts=2 sw=2 expandtab
autocmd FileType pl setlocal ts=2 sw=2 expandtab
autocmd FileType py setlocal ts=4 sw=4 expandtab
" Set expand width to 2 for markdown
autocmd FileType md setlocal ts=2 sw=2 expandtab
autocmd FileType markdown setlocal ts=2 sw=2 expandtab


" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Recompile suckless programs. only for files that are config.h
autocmd BufWritePost config.h,config.def.h !sudo make install; make clean    

" Comile any latex document into pdf form
autocmd BufWritePost answers.tex !pdflatex answers.tex   

" Compile VIU markdown notes to pdf
autocmd BufWritePost notes.md !pandoc -s -o notes.pdf notes.md

" =============================================================================
" General Neovim settings and key mappings
" =============================================================================
" set leader key
let g:mapleader = "\<Space>"

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc> 

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Reload nvim config
nnoremap <leader>vr :source $MYVIMRC<CR>

" Open init.vim in current buffer
nnoremap <leader>vc :e $MYVIMRC<CR>

" Open custom.vim in current buffer
nnoremap <leader>vx :e $XDG_CONFIG_HOME/nvim/custom.vim<CR>

" Change Ctrl N mapping to Ctrl Space "
inoremap <C-space> <C-n>

" write and quit, no save
nnoremap <leader>wq :wq<CR>

" quit, no save
nnoremap <leader>q :q<CR>

" quit, abandon
nnoremap <leader>qq :q!<CR>

" buffer delete, only to be used on tabs
nnoremap <leader>bd :bdelete<CR>

" write current buffer
nnoremap <leader>w :w<CR>

" write all buffers
nnoremap <leader>wa :wa<CR>

" quit all
nnoremap <leader>qa :qa<CR>

" Split horizontally
nnoremap bb :HorizontalAndSwitch<CR>

" Split vertically 
nnoremap vv :VerticalAndSwitch<CR>

" Remap keys to move between splits easier
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"" Make vim scroll faster
set ttyfast
set mouse=a
set lazyredraw
" Set numbers
set nu
set nowrap
set relativenumber
set encoding=UTF-8
" set tabline to not display full path
set guitablabel=%t

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" remove ugly vertical lines on window division
set fillchars+=vert:\ 

" Global Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy "+yy

" Global Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" save as sudo, must configure ask pass helper
ca w!! w !sudo tee "%"

" tab navigation mappings
map tt :tabnew 
map <M-l> :tabn<CR>
imap <M-l> <ESC>:tabn<CR>
map <M-h> :tabp<CR>
imap <M-h> <ESC>:tabp<CR>

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" clear search results
nnoremap <silent> // :noh<CR>

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" fix problems with uncommon shells (fish, xonsh) and plugins running commands
set shell=$SHELL

" Ability to add python breakpoints
" (I use ipdb, but you can change it to whatever tool you use for debugging)
au FileType python map <silent> <leader>b Oimport ipdb; ipdb.set_trace()<esc>


" =============================================================================
" Set colorscheme and Color rendering workarounds
" =============================================================================
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

set background=dark
syntax enable

" Only for the edge colorscheme
let g:edge_style = 'default'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1
let g:edge_transparent_background = 1
let g:edge_diagnostic_line_highlight = 1
let g:edge_current_word = 'bold'

" use 256 colors when possible
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
  let &t_Co = 256
  colorscheme edge
else
  colorscheme quantum
endif

" =============================================================================
" Include custom configurations and plugin configurations
" =============================================================================
if filereadable(expand("~/.config/nvim/custom.vim"))
  source ~/.config/nvim/custom.vim
endif

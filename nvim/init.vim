"    compatible with neovim v0.7.2





" (De)Activations

syntax on			"syntax highlighting, see :help syntax
filetype plugin indent on	"file type detection, see :help filetype
set number			"line numbering
set wildmenu			"completion menu (ausprobieren was das ist)
set smartindent			"auto indent on new lines, see :help smartindent
set expandtab			"convert tabs to spaces
set showmatch			"highlight matching brackets or paranthesis
set wildmode=longest,list       "bash-like tab completions
set cursorline                  "highlight current cursor line
set clipboard=unnamedplus       "use system clipboad
set scrolloff=7                 "start scrolling 7 lines before cursor is top/bot
set colorcolumn=80		"set vertical line to column 80
highlight ColorColumn ctermbg=9	"display vertical line


" Improvements

set path+=**			"improve searching, see :help path
set backspace=indent,eol,start	"ensure proper backspace functionality
set undodir=~/.cache/nvim/undo	"allow undo after reopening files
set ttyfast                     "speed up scrolling in vim
set tabstop=4                   "tab is 4 characters long
set shiftwidth=4
set softtabstop=4


" Searching

set incsearch			"see search results while typing, see :incsear.
set ignorecase			"ignore case when searching
set hlsearch incsearch		"highlight previous search pattern with incsearch





" Keybindings                   "inoremap: insertmode, nnoremap: normmalmode

set splitright
set splitbelow

  "move lines of text up and down with ALT+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

  "move splitpanes
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

  "switch splitpanes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l




" Scripts

 "Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif





" Plugins                       "commands: :PlugInstall :PlugUpdate

call plug#begin("~/.config/nvim/plugged")
 Plug 'mhinz/vim-startify'      "add vim start page
 "Plug 'ryanoasis/vim-devicons' "dev icons for nerdtree
 "Plug 'scrooloose/nerdtree'    "file explorer
 Plug 'neovim/nvim-lspconfig'   "language server protocol
 Plug 'nvim-lua/completion-nvim'
 Plug 'sainnhe/sonokai'         "theme
 Plug 'itchyny/lightline.vim'   "bottom bar with vimmode, branch, filename
 Plug 'tpope/vim-fugitive'      "git integration for lightline
 Plug 'hrsh7th/nvim-cmp'        "autocomplete
 Plug 'hrsh7th/cmp-nvim-lsp'    "autocomplete
 Plug 'hrsh7th/cmp-buffer'      "autocomplete
 Plug 'hrsh7th/cmp-path'        "autocomplete
call plug#end()

  "theme vim-one
colorscheme sonokai

  "lightline
set showmode!                   "hide vim mode, since lighline shows it
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

  "call lua scripts that further customize plugins
lua require('lua_config')

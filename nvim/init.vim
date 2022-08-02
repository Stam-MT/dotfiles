"    compatible with neovim v0.7.2


" Settings                      "type :help <option> to get detailed info.
syntax on                       "syntax highlighting
filetype plugin indent on       "file type detection
set number                      "line numbering
set smartindent                 "indent } and lines after {. also # is at col 0
set expandtab                   "convert tabs to spaces
set showmatch                   "make opening bracket blink when closing it
set cursorline                  "highlight current cursor line
set clipboard=unnamedplus       "use system clipboad
set scrolloff=7                 "start scrolling 7 lines before cursor is top/bot
set colorcolumn=80              "set vertical line to column 80
set undodir=~/.cache/nvim/undo	"allow undo after reopening files
set tabstop=4                   "tab is visualized as 4 whitespaces
set shiftwidth=4                "tab size for autoindenting
set softtabstop=4               "tab size used when inserting a tab
set ignorecase                  "ignore case when searching
set splitright                  "on :vsp open new split right to current buffer
set splitbelow                  "on :sp open new split below current buffer


" Keybindings                   "_noremap: _ is the mode (insert, normal, viusal)

  "move lines of text up and down with ALT+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" Scripts

 "Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


" Plugins                       "commands: :PlugInstall :PlugUpdate

call plug#begin("~/.config/nvim/plugged")
 Plug 'mhinz/vim-startify'      "add vim start page
 Plug 'sainnhe/sonokai'         "theme
 Plug 'itchyny/lightline.vim'   "bottom bar with vimmode, branch, filename
 Plug 'tpope/vim-fugitive'      "git integration for lightline
 Plug 'neovim/nvim-lspconfig'   "language server protocol
 Plug 'hrsh7th/nvim-cmp'        "autocomplete
 Plug 'hrsh7th/cmp-nvim-lsp'    "autocomplete
 Plug 'hrsh7th/cmp-buffer'      "autocomplete
 Plug 'hrsh7th/cmp-path'        "autocomplete
call plug#end()

  "theme
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

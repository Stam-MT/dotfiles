
" Activations
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

" Deactiviations
"set swapfile!			"dont use swap files

" Improvements
set path+=**			"improve searching, see :help path
set backspace=indent,eol,start	"ensure proper backspace functionality
set undodir=~/.cache/nvim/undo	"allow undo after reopening files
set ttyfast                     "speed up scrolling in vim

" Searching
set incsearch			"see search results while typing, see :incsear.
set ignorecase			"ignore case when searching
set hlsearch incsearch		"highlight previous search pattern with incsearch



" Python
set colorcolumn=80		"show color when line reaches pep8 standards
highlight ColorColumn ctermbg=9	"display bright red bar at color column number



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



" Plugins                       "commands: :PlugInstall :PlugUpdate
call plug#begin("~/.config/nvim/plugged")
 Plug 'mhinz/vim-startify'      "add vim start page
 "Plug 'ryanoasis/vim-devicons' "dev icons for nerdtree
 "Plug 'scrooloose/nerdtree'    "file explorer
 Plug 'neovim/nvim-lspconfig'
 Plug 'nvim-lua/completion-nvim'
 Plug 'rakr/vim-one'
 Plug 'itchyny/lightline.vim'
 Plug 'tpope/vim-fugitive'      "git integration for lightline
call plug#end()

 "Script - Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

  "theme vim-one
colorscheme one
set background=dark

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

  "nvim-lspconfig
lua require('lua_config')
  " allow Tag/Shift Tab to cycle completion options
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_enable_fuzzy_match = 1
set completeopt=menuone,noinsert,noselect

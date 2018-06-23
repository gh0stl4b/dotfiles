" Vim-Plug 

call plug#begin()

	Plug 'tpope/vim-fugitive'
	Plug 'trusktr/seti.vim'
	Plug 'scrooloose/nerdtree'
	Plug 'tpope/vim-surround'
	Plug 'vim-airline/vim-airline'
	Plug 'plasticboy/vim-markdown'
	Plug 'fatih/vim-go'
	Plug 'mattn/emmet-vim'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'dylanaraps/wal.vim'
	Plug 'tpope/vim-repeat'
	Plug 'kien/ctrlp.vim'
	Plug 'scrooloose/syntastic'
	Plug 'stanangeloff/php.vim'
	Plug 'leafgarland/typescript-vim'
	Plug 'pangloss/vim-javascript'

call plug#end()
filetype plugin indent on

" End Vim-Plug 

" Vim Configs

"" Fuck arrow keys, man!
no <up> <Nop>
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>

"" Tabs
set number
set relativenumber

"" Text
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

"" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" Syntax
syntax on
colorscheme wal

"" Lightline
set laststatus=2
if !has('gui_running')
	set t_Co=256
endif
let g:lightline = {'colorscheme' : 'dracula'}
" let g:airline_powerline_fonts = 1

"" Emmet
let g:user_emmet_expandabbr_key = '<tab>'

"" PHP.vim
"g:php_syntax_extensions_enabled
"b:php_syntax_extensions_enabled

set backspace=2

" Language Specific

"" Javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

"" Typescript
let g:typescript_indent_disable = 1

"" Put at the very end of your .vimrc file. (PHP.vim)

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

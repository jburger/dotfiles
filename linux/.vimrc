" Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin management
Plugin 'VundleVim/Vundle.vim'

" good looks
Plugin 'noahfrederick/vim-noctu'
Plugin 'morhetz/gruvbox'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'bling/vim-airline'

" IDE features
Plugin 'vim-syntastic/syntastic'	"Linters
Plugin 'myint/syntastic-extras'		"More linters
Plugin 'tpope/vim-surround'			"Parens completion
Plugin 'rust-lang/rust.vim'			"Rust
" Plugin 'omnisharp/omnisharp-vim'	"C#
Plugin 'majutsushi/tagbar'			"ctags
Plugin 'Quramy/tsuquyomi' 			"typescript
Plugin 'valloric/youcompleteme'		"autocompletion

" Markdown
Plugin 'tpope/vim-markdown'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" File searching	
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-eunuch'
Plugin 'Shougo/denite.nvim'
"Plugin 'w0rp/ale'

call vundle#end()
filetype plugin indent on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" Key Mappings
let mapleader=","	" map leader key to ,
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> ,/ :nohlsearch<CR>
" CTRL+o for NERDTree
map <C-o> :NERDTreeToggle<CR>
" auto sudo
cmap w!! w !sudo tee % >/dev/null
" jump around windows with CTRL+HJKL
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" Options
set hidden					" allow switching buffers without saving
set nowrap					" don't wrap lines
set tabstop=4					" a tab is four spaces
set backspace=indent,eol,start			" allow backspacing over everything in insert mode
set autoindent					" always turn autoindent on
set copyindent					" copy the previous indentation on autoindenting
set number 					" always show line numbers
set relativenumber 				" Hybrid numbers
set shiftwidth=4				" autoindent gets 4 spaces
set shiftround					" use multiples of 4 when using < and >
set showmatch					" show matching parens
set ignorecase					" ignore case when searching
set smartcase					" ignore case if search pattern is all lowercase
set smarttab					" insert tabs on the start of a line according to shiftwwidth, not tabstop
set hlsearch					" highlight searchtersm
set incsearch					" show search matches as you type
set undolevels=1000				" keep all the things
set title					" change the terms title
set visualbell					" flash screen at me when I fuck up
set noerrorbells				" dont beep at me when I fuck up
set pastetoggle=<F2>

" Fonts, colors and trinkets
let g:airline#extensions#tabline#enabled=1
" gvim specific settings
if has("gui_running")
	let g:gruvbox_contrast_dark = 'medium'
	let g:gruvbox_improved_strings = 0
	colorscheme gruvbox
	set background=dark
	set guifont=Hack\ 9
	"if has ("gui_gtk2")
		"set guifont=Hack\ 14
	"elseif has ("gui_macvim")
		"set guifont=Monaco\ 14
	""elseif has ("gui_win32")
		"set guifont=Consolas\ 14
	"endif
else
"	colorscheme noctu
endif


" change numbering style depending on what mode we're in
if has('autocmd')
	augroup numbertoggle
		autocmd!
		autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
		autocmd BufLeave,FocusLost,InsertEnter	 * set norelativenumber
	augroup END	
endif

" paths
set rtp+=~/.fzf

" vim-markdown
let g:markdown_fenced_languages = ['html', 'python', 'csharp', 'bash=sh']

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


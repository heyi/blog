set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
Bundle 'surround.vim'
Bundle 'repeat.vim'
Bundle 'jquery'
Bundle 'Lokaltog/vim-powerline'
Bundle 'https://github.com/Lokaltog/vim-easymotion.git'
Bundle 'https://github.com/msanders/snipmate.vim.git'
Bundle 'https://github.com/hail2u/vim-css3-syntax.git'
Bundle 'https://github.com/plasticboy/vim-markdown.git'
Bundle 'https://github.com/gregsexton/MatchTag.git'
Bundle 'https://github.com/itchyny/calendar.vim.git'
Bundle 'ap/vim-css-color'
Bundle 'https://github.com/mhinz/vim-blockify.git'

Bundle 'https://github.com/tpope/vim-fugitive.git'
Bundle 'https://github.com/pangloss/vim-javascript.git'
Bundle 'gmarik/sudo-gui.vim'
Bundle 'https://github.com/kien/ctrlp.vim.git'
Bundle 'https://github.com/ervandew/supertab.git'
Bundle 'http://github.com/sjl/gundo.vim.git'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass he path to set the runtimepath properly.
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" scripts not on GitHub
Bundle 'taglist.vim'
Bundle 'ctags.vim'
Bundle 'https://github.com/vimwiki/vimwiki.git'
Bundle 'yankring.vim'
Bundle 'grep.vim'
Bundle 'https://github.com/scrooloose/nerdcommenter.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'https://github.com/vim-scripts/desertEx.git'
Bundle 'https://github.com/lukaszb/vim-web-indent.git'
Bundle 'https://github.com/vim-scripts/indenthtml.vim.git'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
Bundle 'https://github.com/othree/javascript-libraries-syntax.vim.git'
Bundle 'https://github.com/matthewsimo/angular-vim-snippets.git'

filetype plugin indent on     " required
syntax on
colorscheme molokai
set cmdheight=3
set tildeop
set hid
set autoread
set magic
set showmatch
set mat=2
set ww=<,>,h,l
set gcr=a:block-blinkon0
set guifont=Monaco:h12

" Change mapleader
let mapleader=","
" Fast saving
nmap <leader>s :w!<cr>

set expandtab
set shiftwidth=2
set smarttab

set lbr

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

set undofile
"set undodir

set nobackup
set nowb
set noswapfile

map <leader>bd :bd<cr>
map <leader>ba :1,300 bd!<cr>
map <leader>cx :close<cr>
map <left> :bp<cr>
map <right> :bp<cr>
map <leader>v :edit ~/.vimrc<cr>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
set noeol

set history=100
" Centralize backups, swapfiles and undo history
if exists("&undodir")
		set undodir=~/.vim/undo
endif

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
"if exists("&relativenumber")
"set relativenumber
"au BufReadPost * set relativenumber
"endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
		let save_cursor = getpos(".")
		let old_query = getreg('/')
		:%s/\s\+$//e
		call setpos('.', save_cursor)
		call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
au FileType javascript imap <c-t> console.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi
" Automatic commands
if has("autocmd")
		" Enable file type detection
		filetype on
		" Treat .json files as .js
		autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

let g:ctrlp_cmd = 'CtrlP'
map <leader>p :CtrlPMRUFiles<cr>
map <leader>e :e 
map <space> /
map <c-space> ?

let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = {
						\ 'dir':  '\v[\/]\.(git|hg|svn)$',
						\ 'file': '\v\.(exe|so|dll)$',
						\ 'link': 'some_bad_symbolic_links',
						\ }

let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

let g:vimwiki_ext2syntax = {'.md': 'markdown', 
						\ '.mkd': 'markdown',
						\ '.wiki': 'media'}
let g:vimwiki_use_calendar=1
let g:vimwiki_list = [{'path': '~/dropbox/快盘/vimwiki/',
						\ 'path_html': '~/dropbox/快盘/vimwiki/html/',
						\ 'template_path': '~/dropbox/快盘/vimwiki/template/',
						\ 'template_default': 'def_template',
						\ 'template_ext': '.html'}]
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code,red,center,left,right,h4,h5,h6,pre, table, tbody, th, tr, td, a'


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS _svn generated .svn'
let Grep_Default_Options = '-i -E -R'
let Grep_Default_Filelist = '*.htm *.js *.php'
let Grep_Skip_Files = '*.bak *~ *.pack.* *.min.* *.packed.* *-min.*'

" Move lines
nmap <C-Down> :<C-u>move .+1<CR>
nmap <C-Up> :<C-u>move .-2<CR>

imap <C-Down> <C-o>:<C-u>move .+1<CR>
imap <C-Up> <C-o>:<C-u>move .-2<CR>

vmap <C-Down> :move '>+1<CR>gv
vmap <C-Up> :move '<-2<CR>gv

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i

map <F4> :%s//gc<Left><Left><Left>
map <S-F4> :%s/<C-r><C-w>//gc<Left><Left><Left>
vmap <F4> y:execute "%s/".escape(@",'*[]/\')."//gc"<Left><Left><Left><Left>
set autochdir
let s:default_path = escape(&path, '\ ') " store default value of 'path'

" Always add the current file's directory to the path and tags list if not
" already there. Add it to the beginning to speed up searches.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path-=".s:default_path |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:default_path


map <Leader>cp :CtrlPBufTagAll<cr>
let g:cssColorVimDoNotMessMyUpdatetime = 1

autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType php noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType scss noremap <buffer> <c-f> :call CSSBeautify()<cr>

autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

let g:used_javascript_libs = 'angularjs,requirejs'

nnoremap <F5> :GundoToggle<CR>
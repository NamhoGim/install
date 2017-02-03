
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"" bundle installed 
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'vim-scripts/SyntaxRange'
Bundle 'flazz/vim-colorschemes'
Bundle 'derekwyatt/vim-scala'
Bundle 'will133/vim-dirdiff'


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '

call vundle#end()
filetype plugin indent on	" required

augroup Filetype
	au!
	au BufRead,BufNewFile	*{Makefile,makefile}*		set filetype=make
	au BufRead,BufNewFile	*.{ll,bc}					set filetype=llvm
	au BufRead,BufNewFile	*.td						set filetype=tablegen
	au BufRead,BufNewFile	*.rst						set filetype=rest
	au BufRead,BufNewFile	*.html						set filetype=html
	au BufRead,BufNewFile	*.tex						set filetype=tex
	au BufRead,BufNewFile	*.md						set filetype=markdown
	au BufRead,BufNewFile	*.{gnuplot,gp}				set filetype=gnuplot
	" au BufRead,BufNewFile config                    set filetype=config
	au BufRead,BufNewFile	*.cl						set filetype=opencl
	au BufRead,BufNewFile	*.{dat,data,csv}			set filetype=csv
	au BufRead,BufNewFile	*.gdb						set filetype=gdb
   	au BufRead,BufNewFile	*.python					set filetype=python
	au BufRead,BufNewFile	*.bb						set filetype=sh
	au BufRead,BufNewFile	*.bbclass					set filetype=python
	au BufRead,BufNewFile	*.isa						set filetype=cpp 
		\ | exec ":call SyntaxRange#Include('^def', '}}', 'python')"
	au BufRead,BufNewFile	*.{patch,diff}				set filetype=diff
		\ | set noexpandtab
augroup END

""basic settings
set number
set cindent
set laststatus=2
set hlsearch
set cursorline

""space set
set ts=4
set shiftwidth=4
set softtabstop=4

""set smarttab
set expandtab
autocmd FileType text
    \ set noexpandtab  |
    \ set ts=8

set backspace=indent,eol,start
set mouse=c
set title
set showcmd
set nobackup
set noswapfile
set tags+=./tags;$HOME "check the current folder for tags file

""searching 
set hlsearch
set incsearch
set ignorecase
set smartcase

syntax enable
colorscheme wombat256

"colorscheme default
au BufRead *
            \ if &filetype != 'svn' && line("'\"") > 0 && line("'\"") <= line("$") |
            \    exe "norm g'\"" |
            \ endif

let t:Comment="#"
let t:Uncomment="#"
let t:CommentEnd=''
let t:UncommentEnd=''
let t:Space=" "

augroup AutoComment
    au!
    au FileType c,cpp,verilog,php,javascript,html,idl,opencl,css
                \ let t:Comment='//'      |
                \ let t:Uncomment='\/\/'
    au FileType asm,sh,python,bash,ruby,perl
                \ let t:Comment='#'     |
                \ let t:Uncomment='#'
    au FileType tex
                \ let t:Comment='%'     |
                \ let t:Uncomment='%'   
    au FileType bib
                \ let t:Comment='%'     |
                \ let t:Uncomment='%'   |
                \ let t:Space=""
    au FileType vim
                \ let t:Comment='"'     |
                \ let t:Uncomment='"'
    au FileType ini,llvm
                \ let t:Comment=';'     |
                \ let t:Uncomment=';'   
    au FileType lua
                \ let t:Comment='--'     |
                \ let t:Uncomment='--'   
augroup END

if &diff
    set diffopt+=iwhite
endif

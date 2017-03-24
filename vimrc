let mapleader=" "
let g:netrw_liststyle=3                     " set default :Explore pane view to mode 3 (indents directories)
set nocompatible		                      	" choose no compatibility with legacy vi
filetype on
set omnifunc=syntaxcomplete#Complete
"set clipboard=unnamed
set timeoutlen=500                          " shortens delay caused by 'O' when creating a new line, whilst still being a reasonable time to enter leader key mappings

"" Vundle config
"set rtp+=/usr/local/share/vim/vim74/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'ntpeters/vim-better-whitespace'
  Plugin 'tpope/vim-fugitive'
  Plugin 'kien/ctrlp.vim'
  Plugin 'valloric/MatchTagAlways'
  Plugin 'tpope/vim-surround'
  Plugin 'mark-maxwell/vim-spec-split'
call vundle#end()

"" RSpec.vim mappings
"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
map <Leader>p :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"" spec-split.vim mappings
map <Leader>t :w \| :call RunAssocSpec()<CR>
map <Leader>r :call Vspec()<CR>
map <Leader>d :call Hspec()<CR>

"" Ctags mappings
map <Leader>c :!ctags --exclude=public --exclude=_html --exclude=tmp --exclude=log --exclude=coverage --exclude=vendor/bundle --exclude=node_modules --extra=+f -R *<CR>

"" Custom mappings
map <Leader>g :Gblame<CR>
map <Leader>/ :set cursorline!<CR>
map <Leader>e :Explore<CR>
map <Leader>z :noh<CR>

"" Pane & Navigation mappings
map <Leader>h <C-W>h
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>l <C-W>l

map <Leader>v :vs  <CR>
map <Leader>s :sp  <CR>
map <Leader>w :w  <CR>
map <Leader>q :q  <CR>
map <Leader>x :x  <CR>
map <Leader>n :tabnew  <CR>

map <Leader>= <C-W>=
map <Leader>_ <C-W>_
map <Leader>\| <C-W>\|

"" Visual
set background=dark
colorscheme solarized
syntax enable
"hi StatusLine ctermfg=202
hi StatuslineNC ctermfg=56
hi VertSplit ctermfg=56 ctermbg=56
set laststatus=2                            " always show status line
set statusline=%f                           " show complete file path
set statusline+=\ %m                        " show [+] when file is modified
set statusline+=%=                          " right align the following...
set statusline+=%P                          " show percentage through file
set statusline+=\ %l/%L                     " show current/total line number
set scrolloff=0                          " keep cursor centered (7777). Set to 0 to use zt, zg, L, etc.
set number                                  " show line numbers
set colorcolumn=80                          " 80 character ruler
hi ColorColumn ctermbg=0                    " 17 for dark blue, 52 for dark red
"set cursorline                              " highlight the current line
:hi CursorLine   cterm=NONE ctermbg=0       " 17 for dark blue

set encoding=utf-8
set showcmd			                          	" display incomplete commands. Useful for pairing
filetype plugin indent on	                	" load filetype plugins + indentation

"" Whitespace
set nowrap			                          	" don't wrap lines
set tabstop=2 shiftwidth=2	              	" a tab is 4 spaces (or set this to 4)
set expandtab			                         	" use spaces, not tabs (optional)
set backspace=indent,eol,start	          	" backspace through everything in insert mode

"" Searching
set hlsearch		                        		" highlight matches
set incsearch			                        	" incremental searching
set ignorecase			                       	" searches are case insensitive...
set smartcase		                        		" ...unless they start with a capital letter
:hi Search cterm=NONE ctermfg=grey ctermbg=57 " http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim?file=Xterm-color-table.png
:hi IncSearch cterm=NONE ctermfg=grey ctermbg=161

autocmd FileType * setlocal formatoptions-=cro " do not auto comment next line when the current line is commented

"" Ignore files (CtrlP & autocompletion)
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor,_html,doc

"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"" Prevent Vim creating files everywhere
set nobackup
set nowritebackup
set noswapfile

"" Splitting panes
set splitright                              " by default, open split to right instead of left
set splitbelow                              " by default, open split below instead of above

"" Saved macros
let @h=':%s/:\(.*\) => "\(.*\)"/\1: "\2"'   " convert old ruby hash to new syntax
let @i="mm{V}=j'm"                          " correctly indent current block of code
let @c="mm{j}kI#'m"                     " comment out the current block of code

let mapleader=","
let g:netrw_liststyle=3                     " set default :Explore pane view to mode 3 (indents directories)
let g:netrw_browse_split = 0                " using <cr> will open file in current window (replacing netrw explorer)
let g:netrw_winsize = 75                    " set initial size of windows created with v/o etc.
set nocompatible		                      	" choose no compatibility with legacy vi
set backspace=indent,eol,start
filetype on
set omnifunc=syntaxcomplete#Complete

syntax on

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
  Plugin 'ntpeters/vim-better-whitespace'
  Plugin 'tpope/vim-fugitive'
  Plugin 'kien/ctrlp.vim'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-surround'
  Plugin 'mark-maxwell/vim-spec-split'
  Plugin 'rodjek/vim-puppet'
  Plugin 'mileszs/ack.vim'
call vundle#end()

filetype plugin indent on	                	" load filetype plugins + indentation
set encoding=utf-8
set showcmd			                          	" display incomplete commands. Useful for pairing

au BufRead,BufNewFile *.pp   setfiletype puppet "enable vim-puppet to syntax highlight these files
let g:puppet_align_hashes = 0                   " no automatic hash alignment

"" Visual
colorscheme hybrid
set background=dark
hi Normal ctermbg=NONE                      " seems to reset and not take effect on load of file, but works separately
syntax enable
hi StatusLine ctermfg=16 ctermbg=9          " active statusline color
hi StatuslineNC ctermfg=16 ctermbg=242      " inactive statusline color
hi VertSplit ctermfg=0 ctermbg=NONE         " vertical split bar color
set fillchars+=vert:│                       " set vertical split character to form line
hi Visual cterm=bold ctermfg=0 ctermbg=36   " visual block selection color
set laststatus=2                            " always show status line
set statusline=%f                           " show complete file path
set statusline+=\ %m                        " show [+] when file is modified
set statusline+=%=                          " right align the following...
set statusline+=\ %l/%L                     " show current/total line number
set scrolloff=6                             " keep cursor centered (7777). Set to 0 to use zt, zg, L, etc.
set number                                  " show line numbers
set colorcolumn=80                          " 80 character ruler
hi ColorColumn ctermbg=0                    " vertical ruler color
hi CursorLine ctermfg=NONE ctermbg=0        " current line highlighting
hi LineNr ctermfg=239                       " line number color
hi TabLineFill ctermfg=16 ctermbg=0         " horizontal tab section separator
hi TabLine ctermfg=0 ctermbg=251            " unselected tab colors
hi TabLineSel ctermfg=43 ctermbg=235        " selected tab colors
hi Pmenu ctermfg=69 ctermbg=235             " set colors for autocomplete box

"" Cursor colors
if &term =~ "xterm\\|rxvt"
  " insert mode color (t_SI sent by vim when entering insert mode)
  let &t_SI = "\<Esc>]12;cyan\x7"
  " other modes color (t_EI sent by vim when leaving insert mode)
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

"" Whitespace
set nowrap			                          	" don't wrap lines
set tabstop=2 shiftwidth=2	              	" a tab is 4 spaces (or set this to 4)
set expandtab			                         	" use spaces, not tabs (optional)
highlight ExtraWhitespace ctermbg=161 " better whitespace plugin variable

"" Searching
set hlsearch		                        		" highlight matches
set incsearch			                        	" incremental searching
set ignorecase			                       	" searches are case insensitive...
set smartcase		                        		" ...unless they start with a capital letter
:hi Search cterm=NONE ctermfg=232 ctermbg=69
:hi IncSearch cterm=NONE ctermfg=69 ctermbg=232

"" Auto commmands
autocmd FileType * setlocal formatoptions-=cro " do not auto comment next line when the current line is commented
autocmd VimResized * wincmd =                  " automatically resize panes when terminal window size changes

"" Ignore files (CtrlP & autocompletion)
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor,_html,doc
set wildignorecase                          " case insensitive autocomplete

"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ackprg = 'ag --vimgrep'

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

"" bracketed-paste mode setting. Otherwise pasting in terminal adds extra characters after opening vim
set t_BE=

"" spec-split.vim mappings
map <Leader>t :w \| :call RunAssocSpec()<CR>
map <Leader>r :call Vspec()<CR>
map <Leader>d :call Hspec()<CR>

"" Ctags mappings
map <Leader>c :!ctags --exclude=public --exclude=_html --exclude=tmp --exclude=log --exclude=coverage --exclude=vendor/bundle --exclude=node_modules --extra=+f -R *<CR>

"" Pane & Navigation mappings
nmap <C-H> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

map <Leader>v :vs  <CR>
map <Leader>s :sp  <CR>
map <Leader>w :w  <CR>
map <Leader>q :q  <CR>
map <Leader>x :x  <CR>
map <Leader>n :tabnew  <CR>
map <Leader>1 1gt <CR>
map <Leader>2 2gt <CR>
map <Leader>3 3gt <CR>
map <Leader>4 4gt <CR>
map <Leader>5 5gt <CR>

map <Leader>= <C-W>=
map <Leader>_ <C-W>_
map <Leader>\| <C-W>\|

"" Expand ctags 'jump to definition' behaviour <C-W>] available by default: jump to definition in horizontal split
map <Leader><C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <Leader><C-t> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

map <Leader>e :Explore<CR>

"" Misc. mappings
map <Leader>f :!clear<CR>:Ack! <cword>*<CR>
map <Leader>g :!clear<CR>:grep --color <cword>*<CR>
map <Leader>G :Gblame<CR>
map <Leader>p "*p<CR>
map <Leader>z :noh<CR>
map <Leader>/ :set cursorline!<CR>

"" Insert mode mappings
imap <C-j> <CR>

"" Saved macros
let @h=':%s/:\(.*\) => "\(.*\)"/\1: "\2"'   " convert old ruby hash to new syntax
let @i="mm{V}=j'm"                          " correctly indent current block of code
let @c="mm{j}kc#'m"                     " comment out the current block of code
let @y=":let @+=@%"                       " copy the current filepath to the system clipboard
let @v=":e ~/.vimrc"
let @b=":e ~/.bashrc"

set nocompatible		                      	" choose no compatibility with legacy vi
filetype on
set omnifunc=syntaxcomplete#Complete

"" Vundle config
set rtp+=/usr/local/share/vim/vim74/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/vundle'
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'ntpeters/vim-better-whitespace'
  Plugin 'tpope/vim-fugitive'
  Plugin 'kien/ctrlp.vim'
call vundle#end()

"" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
"" Ctags mappings
map <Leader>c :!ctags --exclude=public --exclude=_html --exclude=tmp --exclude=log --exclude=coverage --exclude=vendor/bundle --extra=+f -R *<CR>

"" Visual
set background=dark
colorscheme solarized
syntax enable
set laststatus=2                            " always show status line
set statusline=%f                           " show complete file path
set statusline+=\ %m                        " show [+] when file is modified
set statusline+=%=                          " right align the following...
set statusline+=%P                          " show percentage through file
set statusline+=\ %l/%L                     " show current/total line number
set scrolloff=7777                          " keep cursor centered
"set sidescrolloff=7777                      " ^^^ horizontal
set number                                  " show line numbers
set colorcolumn=80                          " 80 character ruler
hi ColorColumn ctermbg=0                    " 17 for dark blue, 52 for dark red
set cursorline                              " highlight the current line
:hi CursorLine   cterm=NONE ctermbg=17

set encoding=utf-8
set showcmd			                          	" display incomplete commands
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
:hi Search cterm=NONE ctermfg=grey ctermbg=92 " http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim?file=Xterm-color-table.png

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

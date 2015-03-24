set nocompatible		                      	" choose no compatibility with legacy vi
filetype on

"" Vundle config
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/vundle'
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'ntpeters/vim-better-whitespace'
  Plugin 'tpope/vim-fugitive'
call vundle#end()

"" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"" Visual
set background=dark
colorscheme solarized
syntax enable
set laststatus=2                            " always show status line
set scrolloff=7777                          " keep cursor centered
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
set backspace=indent,eol,start	          	" backspace through everthing in insert mode

"" Searching
set hlsearch		                        		" highlight matches
set incsearch			                        	" incremental searching
set ignorecase			                       	" searches are case insensitive...
set smartcase		                        		" ...unless they start with a capital letter

"" Prevent Vim creating files everywhere
set nobackup
set nowritebackup
set noswapfile

"" Splitting panes
set splitright                              " by default, open split to right instead of left
set splitbelow                              " by default, open split below instead of above

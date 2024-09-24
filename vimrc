let mapleader=","
let g:netrw_liststyle=3                     " set default :Explore pane view to mode 3 (indents directories)
let g:netrw_browse_split = 0                " using <cr> will open file in current window (replacing netrw explorer)
let g:netrw_winsize = 75                    " set initial size of windows created with v/o etc.
set nocompatible		                      	" choose no compatibility with legacy vi
set backspace=indent,eol,start
filetype on
set omnifunc=syntaxcomplete#Complete

set regexpengine=0                          " set to 'auto' engine selection value. Prevents typescript files causing Vim to hang
syntax on

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
  Plugin 'hashivim/vim-terraform'
  Plugin 'jparise/vim-graphql'
  Plugin 'junegunn/fzf'
  Plugin 'junegunn/fzf.vim'
  Plugin 'kien/ctrlp.vim'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'mark-maxwell/vim-spec-split'
  Plugin 'mileszs/ack.vim'
  Plugin 'neoclide/coc.nvim'
  Plugin 'ntpeters/vim-better-whitespace'
  Plugin 'pangloss/vim-javascript'
  Plugin 'rodjek/vim-puppet'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-surround'
  Plugin 'mfussenegger/nvim-dap'
  "Plugin 'mfussenegger/nvim-dap-ui'
  Plugin 'nvim-neotest/nvim-nio'
  Plugin 'rcarriga/nvim-dap-ui'
  Plugin 'mxsdev/nvim-dap-vscode-js'
call vundle#end()

filetype plugin indent on	                	" load filetype plugins + indentation
set encoding=utf-8
set showcmd			                          	" display incomplete commands. Useful for pairing

au BufRead,BufNewFile *.pp   setfiletype puppet "enable vim-puppet to syntax highlight these files
let g:puppet_align_hashes = 0                   " no automatic hash alignment

"" Visual
hi Normal ctermbg=NONE                      " seems to reset and not take effect on load of file, but works separately
set background=dark
" Ensure old colors are used in Neovim >= v0.10
colorscheme vim
set notermguicolors

colorscheme hybrid
syntax enable
hi StatusLine ctermfg=16 ctermbg=9          " active statusline color
hi StatuslineNC ctermfg=16 ctermbg=242      " inactive statusline color
hi VertSplit ctermfg=0 ctermbg=NONE         " vertical split bar color
hi WinSeparator ctermfg=0 ctermbg=NONE      " vertical split bar color [NeoVim >= v0.10]
set fillchars+=vert:│                       " set vertical split character to form line
hi Visual cterm=bold ctermfg=4 ctermbg=0    " visual block selection color
set laststatus=2                            " always show status line
set statusline=%f                           " show complete file path
set statusline+=\ %m                        " show [+] when file is modified
set statusline+=%=                          " right align the following...
set statusline+=\ %l/%L                     " show current/total line number
set scrolloff=6                             " keep cursor centered (7777). Set to 0 to use zt, zg, L, etc.
set number                                  " show line numbers
set colorcolumn=80                          " 80 character ruler
hi ColorColumn ctermbg=0                    " vertical ruler color
hi LineNr ctermfg=239                       " line number color
hi CursorLine ctermfg=NONE ctermbg=0        " highlight current line bg to match vertical ruler
hi CursorLineNR ctermfg=9 ctermbg=NONE      " set current line color when cursorline is enabled
set cursorline                              " enable cursor line by default
hi TabLineFill ctermfg=16 ctermbg=0         " horizontal tab section separator
hi TabLine ctermfg=0 ctermbg=251            " unselected tab colors
hi TabLineSel ctermfg=0 ctermbg=43          " selected tab colors
hi Pmenu ctermfg=69 ctermbg=234             " set colors for autocomplete box
hi PmenuSel ctermfg=27 ctermbg=0
hi Title ctermfg=69 ctermbg=234

"" Cursor colors - `:help cursor-shape` for details
if &term =~ "xterm\\|rxvt"
  " insert mode color (t_SI sent by vim when entering insert mode)
  let &t_SI = "\<Esc>]12;purple\x7"
  " visual select mode color (t_SR sent by vim when entering replace mode)
  let &t_SR = "\<Esc>]12;cyan\x7"
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
highlight ExtraWhitespace ctermbg=196        " better whitespace plugin variable

"" Searching
set hlsearch		                        		" highlight matches
set incsearch			                        	" incremental searching
set ignorecase			                       	" searches are case insensitive...
set smartcase		                        		" ...unless they start with a capital letter
:hi Search cterm=NONE ctermfg=0 ctermbg=27
:hi IncSearch cterm=NONE ctermfg=0 ctermbg=29

"" Auto commmands
autocmd FileType * setlocal formatoptions-=cro " do not auto comment next line when the current line is commented
autocmd VimResized * wincmd =                  " automatically resize panes when terminal window size changes

"" Ignore files (CtrlP & autocompletion)
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor,_html,doc
set wildignorecase                          " case insensitive autocomplete
let g:ctrlp_show_hidden = 1                 " show hidden files

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
map <Leader>c :!ctags --exclude=public --exclude=_html --exclude=tmp --exclude=log --exclude=coverage --exclude=vendor/bundle --exclude=node_modules --extra=+f -R *<CR><CR>

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
map <Leader>1 1gt
map <Leader>2 2gt
map <Leader>3 3gt
map <Leader>4 4gt
map <Leader>5 5gt

map <Leader>= <C-W>=
map <Leader>_ <C-W>_
map <Leader>\| <C-W>\|
"" TODO: change leader shortcuts for expanding and resetting pane views as I'm always missing the defaults (maybe keep the above and add new ones?)

"" Expand ctags 'jump to definition' behaviour <C-W>] available by default: jump to definition in horizontal split
map <Leader><C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <Leader><C-t> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"" coc.vim suggestions accepted with <CR>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

map <Leader>e :Explore<CR>

"" Misc. mappings
map <Leader>f :!clear<CR>:Ack! <cword>*<CR>
map <Leader>a :Ag<CR>
map <Leader>g :!clear<CR>:grep --color <cword>*<CR>
map <Leader>G :Git blame<CR>
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

"" Lua code here until large enough to place in lua config directory or init.vim converted to init.lua
lua << EOF
local dap = require("dap")

-- Set keymaps to control the debugger
vim.keymap.set('n', '<leader>d', require 'dap'.continue)
vim.keymap.set('n', '<leader>7', require 'dap'.step_over)
vim.keymap.set('n', '<leader>8', require 'dap'.step_into)
vim.keymap.set('n', '<leader>9', require 'dap'.step_out)
vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)
vim.keymap.set('n', '<leader>B', function()
  require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)

-- echo $VIMRUNTIME -> /opt/homebrew/cellar/neovim/0.10.0/share/nvim/runtime/
debugger_home = os.getenv("HOME")
require("dap-vscode-js").setup({
-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
debugger_path = vim.fn.expand("~/Code/javascript/vscode-js-debug"), -- Path to vscode-js-debug installation.
-- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' }, -- which adapters to register in nvim-dap
-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

local js_based_languages = { "typescript", "javascript", "typescriptreact" }

-- Example starting setup taken from: https://miguelcrespo.co/posts/debugging-javascript-applications-with-neovim/
-- TODO: Use for inspiriation and decide if this is useful to tweak or remove it
for _, language in ipairs(js_based_languages) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    --{
    --  type = "pwa-node",
    --  request = "attach",
    --  name = "Attach",
    --  processId = require 'dap.utils'.pick_process,
    --  cwd = "${workspaceFolder}",
    --},
    -- TODO: add jest config block from nvim-dap-vscode-js github readme page
    -- TODO: try running a very basic hello world node app (i.e. not typescript / graphql)
    {
        type = 'pwa-node',
        request = 'attach',
        name = 'Attach to Node app',
        address = 'localhost',
        port = 25040,
        cwd = '${workspaceFolder}',
        restart = true,
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Start Chrome with \"localhost\"",
      url = "http://localhost:3000",
      webRoot = "${workspaceFolder}",
      userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
    }
  }
end

require("dapui").setup()
local dap, dapui = require("dap"), require("dapui")
EOF

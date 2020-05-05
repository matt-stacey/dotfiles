set laststatus=2        " always show status bar
set mouse=a             " allow mouse for scrolling/resizing

let mapleader=","       " leader is comma

" continue editing on the line you left off
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
set autoread            " auto read when file is changed from outside

"colorscheme badwolf     " awesome colorscheme
"colorscheme goodwolf    " kinda sucks (mostly b/w)
colorscheme molokai

syntax enable           " enable syntax processing

set autoindent          " auto indentation
set shiftwidth=4        " shift width with >>
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
filetype indent on      " load filetype-specific indent files

set number              " show line numbers
"set relativenumber      " relative to current line
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching [{()}]

set scrolloff=3         " number of lines to keep visible above/below cursor
set linebreak           " don't wrap mid-word
set wrap                " allow line wrapping

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " when searching
set smartcase           " ...but adding an uppercase makes it case-sensitive

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

" show end of line, tabs, trailing whitespace
set listchars=eol:$,tab:^_,trail:~,extends:>,precedes:<
set list

" nnoremap: normal mode, don't expand recursively
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" space open/closes folds
nnoremap <space> za

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" save session
nnoremap <leader>s :mksession<CR>

" copy or cut to external buffer
nnoremap <C-c> "+y
nnoremap <C-x> "+d

" save
nnoremap S :w<CR>

" save and exit
nnoremap X Q
nnoremap Q :wq<CR>

" exit without saving (requires CR for safety)
nnoremap O :q!

" inoremap: insert mode
" inverse tab
inoremap <S-tab> <C-d>

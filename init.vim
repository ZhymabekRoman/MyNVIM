" Plugins List
call plug#begin()
  " UI related
  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'machakann/vim-highlightedyank'
  Plug 'mhinz/vim-startify'
  Plug 'RRethy/vim-illuminate'
  Plug 'preservim/nerdtree'
  " Plug 'ryanoasis/vim-devicons'
  " Better Visual Guide
  Plug 'Yggdroot/indentLine'
  " Syntax check
  Plug 'w0rp/ale'
  " Autocomplete
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-jedi'
  " Formater
  Plug 'Chiel92/vim-autoformat'
call plug#end()
filetype plugin indent on

" Configurations Part
" UI configuration
" colorscheme onehalfdark
syntax on
" выделять строку, на которой находится курсор
set cursorline
syntax enable
set whichwrap+=<,>,[,]
set encoding=utf-8
set termencoding=utf-8
" set ambiwidth=double
" colorscheme
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard
" set background=dark
" True Color Support if it's avaiable in terminal
if has("termguicolors")
    set termguicolors
endif
if has("gui_running")
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif
set number
" set relativenumber
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw
" Turn off backup
" set nobackup
" set noswapfile
" set nowritebackup
" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase
" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4
set scrolloff=999
set nowrap
" Give more space for displaying messages.
set cmdheight=2
" allow quit via single keypress (Q)
map Q :qa<CR>
" vim-autoformat
noremap <F3> :Autoformat<CR>
" Show all whitespace as a character
" :set listchars=eol:⏎,tab:>-,trail:·,extends:>,precedes:<
:set listchars=tab:>-,space:·,nbsp:␣,trail:•,eol:⏎,precedes:«,extends:»
:set list
" NCM2
augroup NCM2
  autocmd!
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()
  " :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect
  " uncomment this block if you use vimtex for LaTex
  " autocmd Filetype tex call ncm2#register_source({
  "           \ 'name': 'vimtex',
  "           \ 'priority': 8,
  "           \ 'scope': ['tex'],
  "           \ 'mark': 'tex',
  "           \ 'word_pattern': '\w+',
  "           \ 'complete_pattern': g:vimtex#re#ncm2,
  "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
  "           \ })
    " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    set shortmess+=c

    " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
    inoremap <c-c> <ESC>

    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new
    " line.
    " inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

    " Use <TAB> to select the popup menu:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

augroup END
" Ale
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
" Airline
let g:airline_theme='deus'
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
"let airline#extensions#ale#error_symbol = 'E:'
"let airline#extensions#ale#warning_symbol = 'W:'
" использовать пропатченные шрифты
let g:airline_powerline_fonts = 0
" включить управление табами
let g:airline#extensions#tabline#enabled = 1
" всегда показывать tabline
let g:airline#extensions#tabline#tab_min_count = 0
"" такое же поведение, как и в sublime: если файл с уникальным именем - показывается только имя, если встречается файл с таким же именем, отображается также и директория
let g:airline#extensions#tabline#formatter = 'unique_tail'
" скрыть буферы
let g:airline#extensions#tabline#show_buffers = 0
" имя файла + расширение :help filename-modifiers
let g:airline#extensions#tabline#fnamemod = ':t'
" для закрытия вкладки мышью (мышью!?)
let g:airline#extensions#tabline#show_close_button = 1
" убираем разделитель для вкладок
let g:airline#extensions#tabline#left_alt_sep = ''
" отключаем tagbar
let g:airline#extensions#tagbar#enabled = 0
" показывать номер вкладки
let g:airline#extensions#tabline#show_tab_nr = 1
" показывать только номер вкладки
let g:airline#extensions#tabline#tab_nr_type = 1

let g:Illuminate_ftblacklist = ['nerdtree']

nmap <F6> :NERDTreeToggle<CR>
" Ctrl-Left or Ctrl-Right to go to the previous or next tabs
nnoremap <F3> :tabprevious<CR>
nnoremap <F9> :tabnext<CR>

let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '-m flake8 --ignore E501'
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 1

let g:Illuminate_delay = 100
" let g:highlightedyank_highlight_duration = 600

au TextYankPost * silent! lua vim.highlight.on_yank()

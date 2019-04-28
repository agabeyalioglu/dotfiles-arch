set nocompatible
let mapleader=","
set encoding=utf-8
set fileencoding=utf-8
filetype plugin indent on


"""""""""""" Colors
set t_Co=256
highlight Normal ctermbg=none
highlight NonText ctermbg=none
syntax on
set background=dark
colorscheme gruvbox


"""""""""""" Spaces and Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mappingt


"""""""""""" UI Config
set number
set showcmd " show command in bottom
set nocursorline
set wildmenu
set wildmode=longest:full,full
set lazyredraw
set showmatch " highlight matching parenthesis


"""""""""""" Searching
set ignorecase
set incsearch " search as char entered
set hlsearch " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>


"""""""""""" Folding
set foldenable " enable folding
set foldlevelstart=10 " open most fold by def
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level
" leader z to fold/unfold
nnoremap <leader>z za


"""""""""""" Custom Keymaps
"make wrapped lines more intuitive
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]


" Movement for split windows
nmap <silent> <C-K> :wincmd k<CR>
nmap <silent> <C-J> :wincmd j<CR>
nmap <silent> <C-H> :wincmd h<CR>
nmap <silent> <C-L> :wincmd l<CR>

" jk is escape
inoremap jk <esc>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" Buffer list"
nnoremap <leader>b :ls<CR>:buffer<Space>
nnoremap <leader><Tab> :bnext<CR>
nnoremap <leader><S-Tab> :bprevious<CR>
nnoremap <leader>bb :b#<CR>
nnoremap <leader>bd :bd<CR>

" Send current word to CtrlP
nmap <leader>f <C-P><C-\>w

" Toggle line numbers
nnoremap <leader>tn :call ToggleNumber()<CR>

" Map ,s to surround word ,sl to surr line
map <leader>s ysiw
map <leader>sl yss

" Duplicate line with alt d
execute "set <M-d>=\ed"
nnoremap <M-d> yyp

" Quick save and exit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>


""""""""""""  Backups
set nobackup
" Set vim to save the file on focus out.
au FocusLost * :wa

" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ execute 'normal! g`"zvzz' |
                \ endif
augroup END



""""""""""""  Vim-Airline
set laststatus=2

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline_section_c='%{getcwd()}/%t'

if !exists('g:airline_symbols')
    let g:airline_symbols ={}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"""""""""""" Vim-NerdTree
map <C-n> :NERDTreeToggle<CR>


"""""""""""" Vim-CtrlP
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
    \ },
  \ 'fallback': 'ag %s -l --nocolor -g ""'
  \ }

"""""""""""" Vim-Syntastic

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_c_compiler = "gcc"
let g:syntastic_c_gcc_args = " -Iinclude"

let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_include_dirs=['include']

"""""""""""" Vim-Ultisnip
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-h>"


"""""""""""" Vim-YCM
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_confirm_extra_conf = 0


"""""""""""" Vim-AutoPair
execute "set <M-p>=\ep"
execute "set <M-w>=\ew"
execute "set <M-n>=\en"
let g:AutoPairsShortcutFastWrap="<M-w>"
let g:AutoPairsFlyMode=1


""""""""""""  Custom Functions
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc


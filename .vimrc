set encoding=UTF-8
"enable mouse support"
set mouse=a

"enable syntax"
syntax enable
"enable line numbers"
set number

"highlight current line"
set cursorline

"timing for each updating vim"
set updatetime=100

"add theme dracula"
packadd! dracula
colorscheme dracula

"""HighLight Settings"""
hi Normal guibg=NONE ctermbg=NONE
"enable highlight search pattern "
set hlsearch

"enable smartcase search sensitivity"
set ignorecase
set smartcase
set linespace=2
"format"
set tabstop=2 shiftwidth=2 expandtab
retab

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""""Plugins""""
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'branch': 'release/0.x'
  \ }
Plug 'dense-analysis/ale' " Linting syntax checking and semantic errors
Plug 'tpope/vim-fugitive'
Plug 'vimsence/vimsence'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
"Plug 'ap/vim-css-color'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'yaegassy/coc-tailwindcss3', {'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons' " Icons
call plug#end()

"""Vim Settings - map"""
"copy in visual mode for system clipboard using ctrl + c
vmap <C-c> "+y 
nmap <f12> :bn<CR>
nmap <S-f12> :bp<CR>
"""Fzf settings"""

"FZF key bindings
nnoremap <C-f> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git -o -name dist \) -prune -o -print'

"""Coc Vim settings"""

"trigger to open popup completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"using Enter to confirm the selected item
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

filetype plugin indent on

"""Config Rust Lang"""
let g:rustfmt_autosave = 1

"""""""""" NerdTree-Git-Plugin
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0

"""""""""""' Prettier
let g:prettier#autoformat = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html Prettier
let g:prettier#autoformat_require_pragma = 0

""""NerdTree Settings""""
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['\.git$']

""""""""""""""""""""""""""""""""  config airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_symbols_branch = '⎇'

"""ALE Settings"""

" = Error  = Warning  = Hint"
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_open_list = 0
let g:ale_set_quickfix = 1


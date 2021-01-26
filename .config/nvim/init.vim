" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
    " colorschemes
    Plug 'chriskempson/base16-vim'
    Plug 'lifepillar/vim-solarized8'
    Plug 'morhetz/gruvbox'
    Plug 'sainnhe/sonokai'
    Plug 'tomasr/molokai'
    Plug 'vim-airline/vim-airline-themes'
    " NERDTree
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " utils
    Plug 'airblade/vim-rooter'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'liuchengxu/vista.vim'
    Plug 'pgdouyon/vim-evanesco'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    " lang
    Plug 'leafOfTree/vim-svelte-plugin'
    Plug 'lervag/vimtex'
    Plug 'neoclide/coc.nvim'
    Plug 'rust-lang/rust.vim'
    " Plug 'sheerun/vim-polyglot'
    Plug 'vim-syntastic/syntastic'
call plug#end()

" coc extensions
let g:coc_global_extensions = [
            \"coc-css",
            \"coc-cssmodules",
            \"coc-git",
            \"coc-go",
            \"coc-html",
            \"coc-json",
            \"coc-markdownlint",
            \"coc-prettier",
            \"coc-python",
            \"coc-rust-analyzer",
            \"coc-snippets",
            \"coc-sql",
            \"coc-svelte",
            \"coc-texlab",
            \"coc-tsserver",
            \"coc-vetur",
            \"coc-xml",
            \"coc-yaml",
            \]

" terminal mapping
tnoremap <Esc><Esc> <C-\><C-n>
nnoremap <C-t> :split\|terminal<CR>:setlocal number&<CR>

" open splits below / right
set splitbelow
set splitright

" display line numbering
set number
highlight LineNr ctermfg=grey

" tab -> spaces
set expandtab
set softtabstop=4
set shiftwidth=4

" highlight column #100
set wrap
set linebreak
set colorcolumn=100
highlight ColorColumn ctermbg=8 guibg=8

" highlight leading & trailing whitespaces
set list
set listchars

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" undo after close
set undofile

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" NERDTree
nmap <F7> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1
            \ && winnr('$') == 1
            \ && exists('b:NERDTree')
            \ && b:NERDTree.isTabTree()
            \ | quit | endif
let NERDTreeShowHidden=1

" fzf
"set rtp+=/usr/local/opt/fzf
nmap <F4> :History<CR>
nmap <F5> :Buffers<CR>
nmap <F6> :Files<CR>

" vista
nmap <F8> :Vista!!<CR>
let g:vista#renderer#enable_icon = 1
let g:vista_default_executive = 'coc'

" yank to clipboard
set clipboard=unnamedplus

" display
set termguicolors
set encoding=utf-8
syntax enable
filetype plugin indent on
set background=dark
let g:molokai_original = 1
" colorscheme molokai
colorscheme base16-monokai
highlight Comment cterm=italic gui=italic
" highlight Normal guibg=none ctermbg=none

" python
" let g:python3_host_prog = "/opt/local/bin/python3"
let g:python3_host_prog = "/opt/homebrew/bin/python3"


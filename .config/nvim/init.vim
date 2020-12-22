set encoding=utf-8

" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'rust-lang/rust.vim'
    Plug 'neoclide/coc.nvim'
    Plug 'liuchengxu/vista.vim'
    Plug 'evanleck/vim-svelte'
    Plug 'vim-syntastic/syntastic'
    Plug 'tomtom/tcomment_vim'
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
call plug#end()

" coc extensions
let g:coc_global_extensions = [
    \"coc-css",
    \"coc-cssmodules",
    \"coc-explorer",
    \"coc-git",
    \"coc-go",
    \"coc-html",
    \"coc-json",
    \"coc-markdownlint",
    \"coc-prettier",
    \"coc-python",
    \"coc-rust-analyzer",
    \"coc-snippets",
    \"coc-sourcekit",
    \"coc-sql",
    \"coc-svelte",
    \"coc-tabnine",
    \"coc-texlab",
    \"coc-tsserver",
    \"coc-vetur",
    \"coc-xml",
    \"coc-yaml",
\]
    " \"coc-graphql",

" display line numbering
set number
highlight LineNr ctermfg=grey

" tab -> spaces
set expandtab
set softtabstop=4
set shiftwidth=4

" highlight column #100
set colorcolumn=100
highlight ColorColumn ctermbg=8

" highlight leading & trailing whitespaces
set list
set listchars

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" coc-explorer
nmap <F7> :CocCommand explorer<CR>

" fzf
set rtp+=/usr/local/opt/fzf
nmap <F5> :History<CR>
nmap <F6> :Files<CR>

" vista
nmap <F8> :Vista!!<CR>
let g:vista#renderer#enable_icon = 1
let g:vista_default_executive = 'coc'

" syntax highlighting
syntax on

" rust
let g:rustfmt_autosave = 1

" python
let g:python3_host_prog = "/usr/local/bin/python3"

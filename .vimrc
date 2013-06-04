let mapleader=","

syntax on
set bs=2
set background=dark
set number
"tabs as x spaces and smart indent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set textwidth=82

"searching
set hlsearch
set incsearch

"show commands
set showcmd

"brackets
set showmatch
set mat=2

"toggle nerdtree
nmap <F5> :NERDTreeToggle<CR>
"toggle line numbers
nmap <F6> :set invnumber<CR>
"grep name under cursor
nnoremap <silent> <F7> :Rgrep<CR>
"toogle nopaste
set pastetoggle=<F8>
"jslint stuff
nmap <F12> :w<CR>:make<CR>:cope<CR>

"disable ex mode
map Q <Nop>

filetype plugin on

"auto jslint on write
autocmd BufWritePost *.js silent :make | :cope | :execute "normal \<C-L>"

"autocomplete stuff Ctrl-x Ctrl-o
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
let g:pydiction_location = '~/.vim/pydiction-1.2/complete-dict'

"autostart
"autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * NERDTreeMirror
let g:NERDTreeDirArrows=0

"grep configurations
let Grep_Default_Filelist = '*.js *.js.in *py *py.in *.css *.html *.html.in'
let Grep_Skip_Dirs = '.svn .git buildout build' 
let Grep_Skip_Files = '*.swp'


"ctrlp search files to open
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_cmd = 'CtrlPMixed'
"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 0
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*build/*,*buildout/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"adjust size of quickfix window based on content. [2-10]
au FileType qf call AdjustWindowHeight(2, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" Some macros
au FileType javascript inoremap <buffer> <Leader>f, function()<Space>{<CR>},<Esc>k$F(a

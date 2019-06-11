" autoload plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-vinegar'
Plug 'nightsense/stellarized'
Plug 'kaicataldo/material.vim'
Plug 'mxw/vim-jsx'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'airblade/vim-gitgutter'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

set background=dark
colorscheme material
let g:material_theme_style = 'palenight'

if !has('gui_running')
	set t_Co=256
endif

let g:lightline = { 'colorscheme': 'material_vim' }

set rtp+=/usr/local/opt/fzf
set textwidth=80                                                                 
set colorcolumn=+1                                                               
set cursorline                                                                   
set laststatus=2                                                                 
set number                                                                       
set wrap                                                                         
set visualbell                                                                   
set noerrorbells                                                                 
set hlsearch                                                                     
set incsearch                                                                    
set title                                                                        
set tabstop=2                                                                    
set softtabstop=0                                                                
set shiftwidth=2                                                                    
set smarttab                                                                     
set pastetoggle=<F2>                                                             
set background=dark                                                              
set t_Co=256
set backup
set backupdir=~/.vim/_backups
set directory=~/.vim/_swaps
set clipboard=unnamed

let g:jsx_ext_required = 0
highlight LineNr cterm=NONE ctermfg=green ctermbg=NONE

syn match   myTodo   contained   "\<\(TODO\|FIXME\):"
hi def link myTodo Todo

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }
function! LightLineFilename()
  return expand('%')
endfunction

set wildignore+=.git,.svn
set wildignore+=*.zip
set wildignore+=*.sw?
set wildignore+=.DS_Store

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.spec.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

augroup templates
	autocmd BufNewFile *.sh 0r ~/.vim/templates/shell.sh
augroup END
set backspace=indent,eol,start

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

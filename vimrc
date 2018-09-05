" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Jul 28
"

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
"source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

endif " has("autocmd")

set autoindent		" always set autoindenting on

syntax on

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

onoremap <silent> i/ :<C-U>normal! T/vt/<CR>
onoremap <silent> a/ :<C-U>normal! F/vf/<CR>
xnoremap <silent> i/ :<C-U>normal! T/vt/<CR>
xnoremap <silent> a/ :<C-U>normal! F/vf/<CR>

" moving between tabs
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

set tabstop=2
set shiftwidth=2
set relativenumber 
set number

" set path to dir of current file, current dir, and each dir under the current dir
set path=.,,**

set cursorline
hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

set hlsearch
nnoremap <C-s> :nohl<CR><C-s>:echo "Search Cleared"<CR>

nnoremap º :m .+1<CR>==
nnoremap ∆ :m .-2<CR>==

inoremap º <Esc>:m .+1<CR>==gi
inoremap ∆ <Esc>:m .-2<CR>==gi

vnoremap º :m '>+1<CR>gv=gv
vnoremap ∆ :m '<-2<CR>gv=gv

set clipboard=unnamed
map <C-n> :NERDTreeToggle<CR>
execute pathogen#infect()
filetype plugin indent on

set wildmenu
set wildmode=longest,list

let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.*.meta,*~     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.*.meta,*~  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
	  \ 'file': '\v\.(exe|so|dll|meta)$',
		  \ 'link': 'some_bad_symbolic_links',
			  \ }

set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files
set noundofile     "no undo files

autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))

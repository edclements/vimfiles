runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

set nocompatible
set foldlevelstart=99
set guioptions+=m		" menubar
set guioptions+=r		" right=hand scrollbar
set guioptions+=a		" autoselect
set guioptions-=T		" toolbar
set number				" line numbers
set spelllang=en_gb
set nospell
set textwidth=100
set autoindent
set history=50			" keep 50 lines of command line history
set ruler				" show the cursor position all the time
set showcmd				" display incomplete commands
set incsearch			" do incremental searching
set visualbell t_vb=	" turn off noisy bell
set tabstop=2
set shiftwidth=2
set expandtab			" replace tabs with spaces
set encoding=utf-8
set rtp+=~/.fzf

map! <S-Space> _

if &t_Co > 2 || has("gui_running")
	syntax on
  set background=dark
  colorscheme solarized
  set guifont=Monospace\ 9
  set t_Co=16
endif

if has("autocmd")
	filetype plugin indent on
endif

if has('mouse')
	set mouse=a
endif

function! CheckRailsView()
  if &filetype == 'eruby'
    if search('\%d60\%d37\%d35.*\%d37\%d62') == 0
      write
    else
      echohl ErrorMsg
      echo '<%# ~~~ %> found on single line'
      sleep
      echohl None
    end
  else " filetype is not eruby
    echohl ErrorMsg
    echo 'CheckRailsView() function is only intended for use with ruby files'
    sleep
    echohl None
  endif " check on filetype
endfunction " CheckRailsView()

function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()

" let g:dbext_default_profile_bbug_uk = 'type=MYSQL:user=root:passwd=:dbname=bbug_uk'

"set default help tags
"let thisfile = readfile($VIM."/vimfiles/doc/default/tags","b")
"call writefile(thisfile,$VIM."/vimfiles/doc/tags","b")

"au BufNewFile,BufRead *orc so ~/.vim/syntax/csound_orc.vim
"au BufNewFile,BufRead *sco so ~/.vim/syntax/csound_sco.vim
"au BufNewFile,BufRead *csd so ~/.vim/syntax/csound_csd.vim
"au BufNewFile,BufRead *.csd so ~/.vim/macros/csound_macros.vim
"au BufNewFile *.csd 0r ~/.vim/templates/template.csd
"au BufNewFile *.orc 0r ~/.vim/templates/template.orc

"autocmd BufNewFile * silent! 0r ~/.vim/templates/template/%:e.tpl
autocmd BufNewFile *.csd 0r ~/.vim/templates/template.csd
autocmd BufNewFile *.html 0r ~/.vim/templates/template.html
autocmd BufNewFile *.sh 0r ~/.vim/templates/template.sh

autocmd Filetype html,xml,xsl runtime scripts/closetag.vim
autocmd Filetype html set noignorecase

autocmd BufWritePre *.html.erb call CheckRailsView()

" autocmd BufWritePost *.coffee silent CoffeeMake!

" map [ to create gettext translation surrounding tags
autocmd Filetype eruby let b:surround_91 = "<%= _('\r') %>"

let g:syntastic_java_javac_classpath='$ANDROID_HOME/platforms/android-17/android.jar'
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['c','coffee','css','javascript','ruby','python','php'],
                           \ 'passive_filetypes': ['java'] }

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = ['htmlhint']
let g:syntastic_html_htmlhint_args = '--config ./.htmlhintrc'
" F keys
map <F9> :NERDTreeToggle<CR>

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

map <Leader>f :Files<CR>

cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>

let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"

" set window title in tmux
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))

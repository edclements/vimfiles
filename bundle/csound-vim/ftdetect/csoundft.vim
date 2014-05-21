au BufNewFile,BufRead *.orc,*.sco,*.csd,*.udo   set filetype=csound
au BufNewFile		*.csd	0r $HOME/.vim/bundle/csound-vim/templates/template.csd
au BufNewFile,BufRead	*.csd	so $HOME/.vim/bundle/csound-vim/macros/csound_macros.vim

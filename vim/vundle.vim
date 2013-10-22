filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 Bundle 'gmarik/vundle'

 Bundle 'scrooloose/nerdtree'

"Python plugins
 Bundle 'ivanov/vim-ipython'
 Bundle 'klen/python-mode'

"Latex
 Bundle 'http://git.code.sf.net/p/vim-latex/vim-latex'

 filetype plugin indent on     " required!

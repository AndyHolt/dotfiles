syntax enable
let g:solarized_termtrans = 1
colorscheme solarized

" yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>

set laststatus=2
" powerline status bar setup
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

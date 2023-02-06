" My vim dotfile
" last updated: 2023-02-03


" #### PLUGIN STUFF #### "
" this is needed for nerd-commenter (i think) and also vim-lexical
set nocompatible
filetype plugin on

" vim-plug here
call plug#begin()
" Colors
" TODO: other colors
Plug 'NLKNguyen/papercolor-theme'
Plug 'jaredgorski/SpaceCamp'
Plug 'pineapplegiant/spaceduck'

" generic stuff
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'chun-yang/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-markdown'
Plug 'jceb/vim-orgmode'
" Plug 'lervag/vimtex'

Plug 'christoomey/vim-tmux-navigator'

" writing stuff
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical'

" uhhhhhh
Plug 'chaimleib/vim-renpy'
call plug#end()

let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md  call pencil#init({'wrap': 'soft'})
                                \ | call lexical#init()
  autocmd FileType text,txt         call pencil#init({'wrap': 'soft'})
                                \ | call lexical#init({ 'spell': 0 })
  autocmd FileType rpy              call pencil#init({'wrap': 'soft'})
                                \ | call lexical#init()
augroup END

" autocmd FileType rpy setlocal commentstring=#\ %s
autocmd FileType rpy setlocal commentstring=balls

" this is for vim-pencil to work with airline
let g:airline_section_x = '%{PencilMode()}'

" weird font stuff for airline? i got from the following:
" https://vi.stackexchange.com/questions/3359/how-do-i-fix-the-status-bar-symbols-in-the-airline-plugin
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" let g:airline_symbols.linenr = 'ඞ'

" cool themes, badwolf, behelit

" #### PLUGIN STUFF #### "


set history=150                 " change how long command history is
set showcmd                     " show what keys were pressed
set cursorline                  " highlight the current line

" tab stuff
set tabstop=4 
set shiftwidth=4 
set softtabstop=4 
set expandtab
set autoindent                  " copy indent from previous line
set smartindent                 " does smart autoindenting with new line

set scrolloff=8                 " start scrolling 8 lines from bottom or top
set wildmenu                    " show partial matches with :help
set incsearch                   " show partial matches with searching

set ignorecase                  " ignore case when searching
set smartcase                   " but don't if there's capitals in the search

set number                      " show line numbers
set relativenumber              " makes numbers relative to current line

set bg=dark                     " tell vim the bg is dark, better color schemes?

syntax on                       " turn on syntax highlighting 
" set termguicolors               " enable true colors support 
" ^^^ this command sucks, it ruined the colors in tmux

" autocmd vimenter * ++nested colorscheme gruvbox
colorscheme PaperColor
" other colors: yowish, darkest-space, rizzle, gruvbox, papercolor, lamu,
" snazzy, everforest
let g:airline_theme='murmur'     " Airline colors, baby
" badwolf and soda are also pretty cool

" set clipboard=unnamed           " yanked text gets put in system clipboard
" set mouse=a                     " enable mouse support
" set title                       " idk
" set ruler                       " show the cursor position 
"                                 " (not needed with airline)

" map KEY KEYSTROKES
" let mapleader="KEY GOES HERE"
" map <leader>] :w!<CR>
nnoremap <silent> <leader>] :NERDTreeToggle<CR>
nnoremap <silent> <leader>c :execute "set colorcolumn="
                  \ . (&colorcolumn == "" ? "81" : "")<CR>
" taken from this guy:
"   https://vi.stackexchange.com/questions/17573/function-to-toggle-set-colorcolumn
" look into recursive stuff? idk
" nnoremap <silent> <leader>\ :.Commentary<CR>
" ^^ this one is kinda cringe and i dont do it
nnoremap <silent> <leader>t :terminal<CR><C-W>L

" from MIT's missing semseter, to prevent bad habits
" normal mode
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

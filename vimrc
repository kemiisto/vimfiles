"" General
set number          " Show line numbers
set linebreak       " Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
set textwidth=100   " Line wrap (number of cols)
set showmatch       " Highlight matching brace
set visualbell      " Use visual bell (no beeping)
 
set hlsearch    " Highlight all search results
set smartcase   " Enable smart-case search
set ignorecase  " Always case-insensitive
set incsearch   " Searches for strings incrementally
 
set autoindent      " Auto-indent new lines
set expandtab       " Use spaces instead of tabs
set shiftwidth=4    " Number of auto-indent spaces
set smartindent     " Enable smart-indent
set smarttab        " Enable smart-tabs
set softtabstop=4   " Number of spaces per Tab

"" Colorscheme
set t_Co=256
if has("unix")
  colorscheme Tomorrow-Night
endif

"" Advanced
execute pathogen#infect()

"============================================================================
" Turn on the ruler in the status line
"============================================================================

set ruler

"============================================================================
" Make % match angle brackets as well
"============================================================================

set matchpairs+=<:>
 
set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

let fortran_free_source=1 
syntax on
filetype on
filetype plugin indent on
au BufNewFile,BufRead *.m set filetype=oberon2

augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#111111
  autocmd BufEnter * match OverLength /\%100v.*/
augroup END

"============================================================================
" Make :help appear in a full-screen tab, instead of a window
"============================================================================

"Only apply to .txt files...
augroup HelpInTabs
  autocmd!
  autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

"Only apply to help files...
function! HelpInNewTab ()
  if &buftype == 'help'
    "Convert the help window to a tab...
    execute "normal \<C-W>T"
  endif
endfunction

"============================================================================
" Make AutoComplPop look for matches in exact same places as CTRL-N
"============================================================================
let g:acp_completeOption = '.,w,b,u,t,i'

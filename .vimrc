let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'

map <C-n> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set autoindent
filetype on
filetype plugin on
syntax on
set number
set ruler
set background=dark

set shiftwidth=4
set softtabstop=4

set wildmenu
set wildmode=list:longest,full

function! ReformatLLVM()
	let l = line(".")
	let c = col(".")

	norm ggVG
	visual! "clang-format -style=llvm"
	norm gg=G

	call cursor(l, c)
	norm zz
endfunction

map <C-K> :call ReformatLLVM()<CR>


let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'

syntax on
set number
set ruler
set background=dark

function! ReformatLLVM()
	let l = line(".")
	let c = col(".")

	norm ggVG
	visual! "clang-format -style=llvm"
	norm gg=G

	call cursor(l, c)
endfunction

map <C-K> :call ReformatLLVM()<CR>


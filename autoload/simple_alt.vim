let s:save_cpo = &cpo
set cpo&vim

function! simple_alt#Open(filename, extensionlist)
    for ext in a:extensionlist
        let alt_file = fnamemodify(a:filename, ':r').ext
        if len(glob(alt_file)) > 0
            execute 'edit '.alt_file
        endif
    endfor
endfunction

function! simple_alt#Alt()
    "Expand file in current buffer to full path
    let filename = expand("%:p")

    if stridx(l:filename, '.h') == -1
        call simple_alt#Open(l:filename, ['.h', '.hpp', '.h++'])
    else
        call simple_alt#Open(l:filename, ['.cpp', '.c++', '.cc', '.c'])
    endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

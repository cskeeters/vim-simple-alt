if get(g:, 'loaded_simple_alt', 0) == 1
    finish
endif
let g:loaded_simple_alt = 1

if v:version < 700
    echoerr "simple_alt is not compatible with version ".v:version." of vim."
    finish
endif

command -nargs=0 Alt :call simple_alt#Alt()

" vim: et ts=4 sts=4 sw=4

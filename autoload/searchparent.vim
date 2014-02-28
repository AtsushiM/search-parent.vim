"AUTHOR:   Atsushi Mizoue <asionfb@gmail.com>
"WEBSITE:  https://github.com/AtsushiM/search-parent.vim
"VERSION:  0.1
"LICENSE:  MIT

let s:save_cpo = &cpo
set cpo&vim

let g:search_parent_plugindir = expand('<sfile>:p:h:h').'/'

if !exists("g:search_parent_cdloop")
    let g:search_parent_cdloop = 5
endif

function! searchparent#File(filename)
    let i = 0
    let dir = expand('%:p:h').'/'
    while i < g:search_parent_cdloop
        if !filereadable(dir.a:filename)
            let i = i + 1
            let dir = dir.'../'
        else
            break
        endif
    endwhile

    if i != g:search_parent_cdloop
        return dir
    endif
    return ''
endfunction

let &cpo = s:save_cpo

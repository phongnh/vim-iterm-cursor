if exists('g:loaded_iterm_cursor')
    finish
endif

let g:loaded_iterm_cursor = 1

if has('nvim')
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
elseif has('cursorshape') && !has('gui_running')
    if $TERM_PROGRAM ==# 'iTerm.app'
        " Different cursors for Insert Mode vs Normal Mode for iTerm
        if exists("$TMUX")
            let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
            try
                let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
            catch
            endtry
            let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
        else
            let &t_SI = "\<Esc>]50;CursorShape=1\x7"
            try
                let &t_SR = "\<Esc>]50;CursorShape=2\x7"
            catch
            endtry
            let &t_EI = "\<Esc>]50;CursorShape=0\x7"
        endif
    endif
endif

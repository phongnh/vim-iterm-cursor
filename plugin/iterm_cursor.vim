if exists('g:loaded_iterm_cursor')
    finish
endif

let g:loaded_iterm_cursor = 1

if has('nvim')
    if !has('nvim-0.2.0')
        let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
    else
        " enable non-blinking mode-sensitive cursor
        " set guicursor=n-v-c:block-blinkon0,i-ci-ve:ver25-blinkon0,r-cr:hor20,o:hor50

        " enable blinking mode-sensitive cursor
        set guicursor=n-v-c:block-blinkon10,i-ci-ve:ver25-blinkon10,r-cr:hor20,o:hor50
    endif
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

if exists('g:loaded_iterm_settings') || $TERM_PROGRAM !=# 'iTerm.app'
    finish
endif

let g:loaded_iterm_settings = 1

" Cursor
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

" True Color
if !has('nvim') && has('patch-7.4.1770')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
if exists('+termguicolors')
    set termguicolors
elseif exists('+guicolors')
    set guicolors
endif

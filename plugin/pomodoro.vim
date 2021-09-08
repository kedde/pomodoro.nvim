if exists('g:loaded_pomodoro') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo " save user coptions

set cpo&vim           " reset them to defaults

" command to run our plugin
command! PomodoroStart lua require("pomodoro").pomodoroStart()
command! PomodoroStop lua require("pomodoro").pomodoroStop()
command! PomodoroStatus lua require("pomodoro").pomodoroStatus()

let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

let g:loaded_pomodoro = 1

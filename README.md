# pomodoro.nvim

A plugin written in lua, this is my first attempt to create a nvim-plugin.

## Install

Install using nvim package manager

``` lua
-- packer
use "kedde/pomodoro.nvim"
```

## Usage

This plugin can be used with a status line, like [lualine](https://github.com/hoob3rt/lualine.nvim)
or a notify plugin like [nvim-notify](https://github.com/rcarriga/nvim-notify) or a combination of them


### setup for lualine

e4b854
highlight NotifyERRORBorder guifg=#8A1F1F
TODO: print("    ")

``` lua

```

### setup for nvim-notify
``` lua

```

## Running 

``` bash
 nvim --cmd "set rtp+=$(pwd)" .

## running nvim without vimrc files and plugins
nvim -u NONE 

## running nvim without vimrc but still plugins
nvim -u NORC 

## start neovim no plugins
nvim --noplugin
```

## possible to use package manager to develop as well

packer:

``` lua
-- Local plugins can be included
use '~/code/pomodoro.nvim'
```

## ROADMAP

* [x] callback
* [x] posible to change the length of breaks and pomodoros configurable 
* [x] define callback frequency - possible to update lualine etc
* [x] lua line - example
* [ ] change the timer code - thinking of the -1 hack - can I just using something like  
      [vim.defer_fn](https://github.com/neovim/neovim/blob/master/src/nvim/lua/vim.lua#L396)
* [ ] update usage description
* [ ] Get times in mm:ss?
* [ ] log - instead of print
* [ ] lua test
* [ ] check - lua style
* [ ] Persist state between neovim instances - this will require we save date and time? 

would this be enough:

| number   | pomodoro        | time                 | work - item    |
| -------- |--------------   | -------------------- | -------------- |
|  1       | PomodoroStarted | yyyy-mm-dd-hh-mm-ss  |   work - item  |
|  2       | PomodoroStopped | yyyy-mm-dd-hh-mm-ss  |                |
|  3       | PomodoroBreak   | yyyy-mm-dd-hh-mm-ss  |                |


## lua tricks

``` lua
print(vim.inspect(luaTbl))
```

## references

* https://alpha2phi.medium.com/writing-neovim-plugins-a-beginner-guide-part-i-e169d5fd1a58

# pomodoro.nvim

A plugin written in lua, this is my first attempt to create a nvim-plugin.


## Install



## Usage


``` lua
-- packer
use "kedde\pomodoro.nvim"

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
* [ ] change the timer code - thinking of the -1 hack
* [ ] update usage description
* [ ] Get times in mm:ss?
* [ ] log
* [ ] lua test
* [ ] Persist state between neovim instances?

## lua tricks

``` lua
print(vim.inspect(luaTbl))
```

## references

* https://alpha2phi.medium.com/writing-neovim-plugins-a-beginner-guide-part-i-e169d5fd1a58

# duplic8r #
Quickly provision my favourite _command line_ environment.

## Background ##
Whenever I set up a new \*N\*X environment, it takes me a some time to get my environment 'just right'. I'm sick of it.

To fix it, I just run:
```sh
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/axler8r/decor8r/install/master/install.sh)"
```

It will configure my favourite FreeBSD, Linux and macOS shell environment.


## Table of Contents ##
* [Intsall](#install)
* [Use](#use)
* [Contribute](#contribute)
* [License](#license)
* [Notes](#notes)


## Install ##


## Use ##


## Contribute ##

### Copyright Waiver ###
### Authors ###


## License ##
This is free and unencumbered public domain software. For more information, see http://unlicense.org/ or the accompanying UNLICENSE file.


# NOTE:
I use zsh on my own workstations and servers.  By far the most
common shell I encounter in the wild is Bash.  In light of that,
the rules I make here for use of zsh applies to my usage profile.

I almost exclusively use zsh to perform tasks at the command line.
ZSH to makes my life easier.  I prefer to work from the shell and
not to grab the mouse to accomplish every task.

The most common activities I perform is:
* Use git
* Use docker
* Start and manage tmux sessions
* Use Neovim
* Update or upgrade my system
* Read man-pages
* SSH into other systems
* Start applicaitons like Visual Studio Code
* Run REPLs
* Compile source code
* Install, configure and uinstall shit using snap, apt or asdf
* cat, sed, awk and jq file content
* Download stuff with wget or curl
* Search for stuff
* Montior system activites or system health
* Perform filesystem related activities
* Manage virtual environments
* Occasionally experiment with interesting tech or whatever is new and shiny

Stuff I don't use zsh for is:
* Extensive scripting

Programming languages I like to use:
* Elixir/Erlang
* Python
* C#
* Rust
* Kotlin/Scala

Programming languages I like to investigate:
* Reason
* Nim


%% GOALS
* Know where to put what
* Keep files clean and minimalistic and easy to manage


%% STARTUP ORDER
When zsh starts it reads global configs that I don't fuck with
and the following ones I am interested in:
  ~/.zshenv   — allways. It is read every time I USE a shell like
                running a script.
  ~/.zprofile — if it is a login shell — i.e. I have logged in via
                ssh or GDM and opened a shell (terminal). Running
                a shell, not logged in, would be a script kicked
                off by cron at 03:00 while I am logged off and
                fast asleep in bed. In that case, ~/.zprofile will
                NOT be read. It is read every time I open a shell.
  ~/.zshrc    — if it is an interactive shell — i.e. I can type
                commands in a terminal and see the results. It is
                read every time I open a shell.
  ~/.zshlogin — if it is a login shell. It is read every time I
                open a shell.


## GUIDANCE ##
Check out THIS link:
  https://unix.stackexchange.com/questions/71253/               \
  what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout

## WHERE TO PUT WHAT ##
ONLY use files. ~/.zshenv and ~/.zshrc, unless instructions for
configuration purposes indicate that one of the other zsh config
files should be used.
* Environment variables go into ~/.zshenv
* PATH manipulation of any kind goes into ~/.zshenv
* Stuff related to shell use like PAGER and EDITOR goes into ~/.zshrc


## ORDER OF STUFF IN ~/.zshrc ##
* completion system
* shell options
* shit that is NOT a function, alias or prompt but has to do only with shell use like LS_COLORS or MANWIDTH
* funcitons   — split out into ~/.zshfunctions and source
* aliases     — split out into ~/.zshaliases and source
* prompt
* stuff that must happen after prompt is set

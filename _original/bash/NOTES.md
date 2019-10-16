# General information
+ An interactive shell has its standard input and standard error (and here - its standard output) connected to a terminal.
+ A non-interactive shell does not have any connectinos to stdin, stdout and stderr.
+ `/etc/profile` and `~/.profile` is called ONLY when you log in to an interactive shell - i.e. tty or pts.
+ `/etc/bashrc` and `~/.bashrc` is called EVERY time the bash interpreter is invoked.
+ `~/.profile` is NOT called if `~/.bash_profile` OR `~/.bash_login` exists.
+ When bash is started via gnome-terminal, xterm or konsole `/etc/profile,` `~/.profile,` `~/.bash_profile` and `~/.bash_login` is NOT read.
+ Put stuff you want to run ONCE in `~/.bash_profile` OR `~/.profile`.
+ Put system-wide environment variables and run start up scripts in `/etc/profile` for all shells.
+ Put user environment variables and run startup scripts in `~/.profile` for all shells.
+ Put bash-only environment variables and run startup scripts in `~/.bash_profile.`
+ Put bash-only aliases and functions in `~/.bashrc`.
+ Prefer `~/.profile` because zsh, ash and the like will also read it.
+ Put stuff you want to run EVERY TIME your shell does something (like spawn a subshell) into `~/.bashrc`.
+ If it is 'exported' it goes into `~/.profile`.
+ *PATH*s goes into `~/.profile`.
+ PS* goes into `~/.profile`.
+ Source `~/.profile` and `~/.bashrc` from `~/.bash_profile`.
+ Don''t bother with a `~/.bash_profile` or `~/.bash_login`.
+ **NB** If `~/.profile` exists, `~/.bashrc` is not sourced automatically - source it from `~/.profile` — this sounds like a contradiction.


# What does bash do when it starts?
From bash man pages...

When bash is invoked as an interactive login shell, or as a non-interactive shell with the `--login` option; it first reads and executes commands from the file `/etc/profile`, if that file exists, after reading that file, it looks for `~/.bash_profile`, `~/.bash_login`, and `~/.profile`, in that order, and reads and executes commands from the first one that exists and is readable, the `--noprofile` option may be used when the shell is started to inhibit this behaviour.

When a login shell exits, bash reads and executes commands from the file `~/.bash_logout`, if it exists.

When an interactive shell that is not a login shell is started; bash reads and executes commands from `/etc/bash.bashrc` and `~/.bashrc`, if these files exist. This may be inhibited by using the `--norc` option. The `--rcfile` file option will force bash to read and execute commands from file instead of `/etc/bash.bashrc` and `~/.bashrc`.

When started non-interactively, to run a shell script, for example, bash looks for `BASH_ENV`, expands it, uses value as the name of a file to read and execute. Bash behaves as follows:
``` bash
if [ -n "$BASH_ENV" ]
then
  . "$BASH_ENV"
fi
```
but the value of the PATH variable is not used to search for the file name.


# Files
File                  | Desription
                     -|-
/bin/bash             | The bash executable
/etc/profile          | The systemwide initialization file, executed for login shells
/etc/bash.bashrc      | The systemwide per-interactive-shell startup file
/etc/bash.bash.logout | The systemwide login shell cleanup file, executed when a login shell exits
~/.bash_profile       | The personal initialization file, executed for login shells
~/.bashrc             | The individual per-interactive-shell startup file
~/.bash_logout        | The individual login shell cleanup file, executed when a login shell exits
~/.inputrc            | Individual readline initialization file

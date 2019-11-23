#! /usr/bin/zsh

() {
    # If the separator and terminator characters does not display correctly,
    # download your favourite PowerLine patched font at
    # `https://github.com/powerline/fonts`.
    # I really like fantasque; get it at
    # `https://github.com/belluzj/fantasque-sans`.

    local LC_ALL="" LC_CTYPE="en_US.UTF-8" # TODO: Figure out why...
}

# SYMBOLS
typeset -A _SYMBOL
_SYMBOL[RHT]=$'\UE0B0' # , right hand terminator
_SYMBOL[RHS]=$'\UE0B1' # , right hand separator
_SYMBOL[LHT]=$'\UE0B2' # , left hand terminator
_SYMBOL[LHS]=$'\UE0B3' # , left hand separator
_SYMBOL[ELI]=$'\U2026' # …, ellipsis
_SYMBOL[GBR]=$'\UE0A0' # , git branch
_SYMBOL[GBA]=$'\u2292' # ⊞, git branch ahead
_SYMBOL[GBB]=$'\u229f' # ⊟, git branch behind
_SYMBOL[GBS]=$'\u2261' # ≡, git branch stack
_SYMBOL[GFM]='~'       # ~, git files modified
_SYMBOL[GFA]='+'       # +, git files added
_SYMBOL[GFR]='-'       # -, git files removed
_SYMBOL[GFU]='?'       # ?, git files not tracked
_SYMBOL[GFC]='!'       # !, git files conflict
_SYMBOL[RST]=' '       # space, the final frontier…

# TODO: investigate, should I use $bg instead?
# BACKGROUND
typeset -A _BACKGROUND
_BACKGROUND[BLA]="%K{black}"
_BACKGROUND[RED]="%K{red}"
_BACKGROUND[GRE]="%K{green}"
_BACKGROUND[YEL]="%K{yellow}"
_BACKGROUND[BLU]="%K{blue}"
_BACKGROUND[MAG]="%K{magenta}"
_BACKGROUND[CYA]="%K{cyan}"
_BACKGROUND[WHI]="%K{white}"
_BACKGROUND[RST]="%k"

# TODO: investigate, should I use $fg instead?
# FOREGROUND
typeset -A _FOREGROUND
_FOREGROUND[BLA]="%F{black}"
_FOREGROUND[RED]="%F{red}"
_FOREGROUND[GRE]="%F{green}"
_FOREGROUND[YEL]="%F{yellow}"
_FOREGROUND[BLU]="%F{blue}"
_FOREGROUND[MAG]="%F{magenta}"
_FOREGROUND[CYA]="%F{cyan}"
_FOREGROUND[WHI]="%F{white}"
_FOREGROUND[RST]="%f"

# CONSTANTS
readonly _EMPTY=""

# COLOURS
_BG=$_EMPTY
_FG=$_EMPTY
_bg=$_BG[RST]
_fg=$_FG[RST]


# zsh's current vi mode
#
# | Mode     | Display
# +----------+----------------------
# | Normal   | "N" green on black
# | Insert   | "I" black on yellow
# | Replace  | "R" black on red
# | Visual   | "V" black on cyan
#
_mode() {
    local _MODE=${_EMPTY}

    # TODO: implement

    echo ${_MODE}
}

__reset() {
    $_BG=$_EMPTY
    $_FG=$_EMPTY
    $_bg=$_BG[RST]
    $_fg=$_FG[RST]
}

__yellow_on_red() {
    _BG=$_BG$_BACKGROUND[RED]
    _FG=$_FG$_FOREGROUND[YEL]
}

__white_on_blue() {
    _BG=$_BG$_BACKGROUND[BLU]
    _FG=$_FG$_BACKGROUND[WHI]
}

__black_on_yellow() {
    _BG=$_BG$_BACKGROUND[YEL]
    _FG=$_FG$_FOREGROUND[BLA]
}

# current user
#
# | User ID | Display
# +---------+------------------------
# | 0       | <user> yellow on red
# | 1000    | <user> white on blue
# | else    | <user> black on yellow
#
_user() {
    local _USER=$_EMPTY

    __reset
    _USER=$_USER$_SYMBOL[SPC]
    if test $UID -eq 1000; then
        __white_on_blue
    elif test $UID -eq 0; then
        __yellow_on_red
    else
        __black_on_yellow
    fi
    _USER=$_USER$_BG$_FG%n$_fg$_bg

    echo ${_USER}
}

# current working directory
#
#   <path> black on green
#
_cwd() {
    local _CWD=${_EMPTY}

    # TODO: implement

    echo ${_CWD}
}

# current Python virtual environment (if present)
#
#   <venv_name> bold white on blue
#
_venv() {
    local _VENV=${_EMPTY}

    # TODO: implement

    echo ${_VENV}
}

# git information (if present)
#
# | Branch         | Display
# +----------------+------------------------------
# | Master         | "master",  grey on black
# | Develop        | "develop", green on black
# | Feature        | <name>,    black on cyan
# | Hotfix         | <name>,    yello on magenta
#
# | Branch Info    | Disply
# +----------------+------------------------------
# | Ignored        | "i"N
# | Added          | "+"N
# | Removed        | "-"N
# | Modified       | "~"N
# | Commits Ahead  | ""
# | Commits Behind | ""
#
# TODO: include hints for additions, removals and modifications
_git() {
    local _GIT=${_EMPTY}

    # TODO: implement

    echo ${_GIT}
}

# number of commands typed in this shell
#
#   <number> white on black
_ccc() {
    local _CCC

    # TODO: implement

    echo ${_CCC}
}

# last command exit (if not 0)
#
#   <exit_code> white on red
_status() {
    local _STATUS

    # TODO: implement

    echo ${_STATUS}
}

# Return the prompt to normal
_end() {

}

_prompt() {
    local _PROMPT=${_EMPTY}

    # TODO: implement

    # N > axl > ~/Projects/…/Blah > _koos > 10 >
    _mode    # vi mode indicator
    _user    # whoami
    _cwd     # whereami
    _venv    # which venv (opt)
    _git     # git info (opt) — rprompt
    _ccc     # necessary?
    _status  # last command exit status (opt)
    _end     # terminator
    echo ${_PROMPT}
}

_prompt2() {
    local _PROMPT2=${_EMPTY}

    # TODO: implement

    echo ${_PROMPT2}
}

_rprompt() {
    local _RPROMPT=${_EMPTY}

    # TODO: implement

    _git_branch
    _git_status
    _git_local_ahead
    _git_local_behind
    _git_stash

    echo ${_RPROMPT}
}

PROMPT="$(_prompt)"
PROMPT2="$(_prompt2)"
RPROMPT="$(_rprompt)"

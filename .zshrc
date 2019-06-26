# Set up the prompt

autoload -Uz promptinit
promptinit
prompt redhat
#prompt spaceship

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# rubenrua custom
bindkey ";5C" forward-word
bindkey ";5D" backward-word


alias dockercleanimages="docker image prune"
alias dockerclean="docker system prune"

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias e='emacs'
EDITOR=emacs

[ -f /usr/share/autojump/autojump.zsh ] && . /usr/share/autojump/autojump.zsh
[ -f ~/.cargo/env ] && . ~/.cargo/env


# Neat utils
# From https://twitter.com/mitsuhiko/status/1070784353360318464
# Rust tools bat+exa+ripgrep+skim and https://raw.githubusercontent.com/mitsuhiko/dotfiles/master/helpers/preview.sh
alias xl="exa --group-directories-first --classify --git"
alias xll="xl -l"
alias ske='f(){ x="$(sk --bind "ctrl-p:toggle-preview" --ansi --preview="preview.sh -v {}" )"; [[ $? -eq 0 ]] && emacs "$x" || true ; }; f'
alias rge='f(){ x="$(sk --bind "ctrl-p:toggle-preview" --ansi -i -c "rg --color=always --line-number \"{}\"" --preview="preview.sh -v {}" )"; [[ $? -eq 0 ]] && emacs "+$(echo $x|cut -d: -f2)" "$(echo $x|cut -d: -f1)" || true ; }; f'
export SKIM_DEFAULT_COMMAND="rg --files || find ."
alias cat=bat
alias pmkgitsync='/home/rubenrua/tmp/pumukit_pumukit/update.sh'

export LC_BYOBU=0

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'


# Like BASH
autoload -U colors
colors
PS1="%{$fg_bold[green]%}%n@%m%{$reset_color%}:%{$fg_bold[blue]%}%~ %(?.%{$fg_bold[green]%}✔.%{$fg_bold[red]%}✗ )%{$reset_color%}%  "

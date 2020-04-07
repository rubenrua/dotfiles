alias e='emacs'
export EDITOR=emacs

alias dockercleanimages="docker image prune"
alias dockerclean="docker system prune"

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias ..='cd ..'

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh

# Neat utils
# From https://twitter.com/mitsuhiko/status/1070784353360318464
# Rust tools bat+exa+ripgrep+skim and https://raw.githubusercontent.com/mitsuhiko/dotfiles/master/helpers/preview.sh
alias xl="exa --group-directories-first --classify --git"
alias xll="xl -l"
export SKIM_DEFAULT_COMMAND="rg --files || find ."
alias ske='f(){ x="$(sk --bind "ctrl-p:toggle-preview" --ansi --preview="preview.sh -v {}" )"; [[ $? -eq 0 ]] && emacs "$x" || true ; }; f'
alias rge='f(){ x="$(sk --bind "ctrl-p:toggle-preview" --ansi -i -c "rg --color=always --line-number \"{}\"" --preview="preview.sh -v {}" )"; [[ $? -eq 0 ]] && emacs "+$(echo $x|cut -d: -f2)" "$(echo $x|cut -d: -f1)" || true ; }; f'
source /home/rgonzalez/.cargo/env


function termianl-set-title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

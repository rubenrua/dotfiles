alias dockercleanimages="docker image prune"
alias dockerclean="docker system prune"

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


# Neat utils
# From https://twitter.com/mitsuhiko/status/1070784353360318464
# Rust tools bat+exa+ripgrep+skim and https://raw.githubusercontent.com/mitsuhiko/dotfiles/master/helpers/preview.sh
alias xl="exa --group-directories-first --classify --git"
alias xll="xl -l"
export SKIM_DEFAULT_COMMAND="rg --files || find ."
alias ske='f(){ x="$(sk --bind "ctrl-p:toggle-preview" --ansi --preview="preview.sh -v {}" --preview-window=up:50%:hidden)"; [[ $? -eq 0 ]] && emacs "$x" || true }; f'
alias rge='f(){ x="$(sk --bind "ctrl-p:toggle-preview" --ansi -i -c "rg --color=always --line-number \"{}\"" --preview="preview.sh -v {}" --preview-window=up:50%:hidden)"; [[ $? -eq 0 ]] && emacs "$(echo\
 $x|cut -d: -f1)" "+$(echo $x|cut -d: -f2)" || true }; f'

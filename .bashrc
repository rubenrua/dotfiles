alias dockercleancontainers="docker ps -a -notrunc| grep 'Exit' | awk '{print \$1}' | xargs --no-run-if-empty docker rm"
alias dockercleanimages="docker images -q -a | xargs --no-run-if-empty docker rmi"
 
alias dockerclean="dockercleancontainers && dockercleanimages"

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'


set TERM xterm-256color
set CDPATH . ~ ~/Desktop

set -gx PATH ~/bin /snap/bin /home/linuxbrew/.linuxbrew/bin ~/.local/bin ~/.kubectx ~/.fzf/bin $PATH
alias k="kubectl"
alias f="fzf --preview 'bat --style=numbers --color=always {}'"
alias vim="nvim"
alias r="R"

eval /home/muskuloes/miniconda3/bin/conda "shell.fish" "hook" $argv | source


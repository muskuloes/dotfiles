set -x TERM xterm-256color
set -x CDPATH . ~ ~/Desktop

set -gx PATH /snap/bin /usr/local/go/bin $HOME/bin /home/linuxbrew/.linuxbrew/bin $HOME/.local/bin $HOME/.krew/bin $HOME/.kubectx $HOME/.fzf/bin $HOME/go/bin $PATH
set -x EDITOR nvim
alias k="kubectl"
alias f="fzf --preview 'bat --style=numbers --color=always {}'"
alias vim="nvim"
alias r="R"

eval $HOME/miniconda3/bin/conda "shell.fish" "hook" $argv | source

set -x NNN_USE_EDITOR 1
set -x NNN_CONTEXT_COLORS '4564'
set -x NNN_BMS "u:$HOME/Desktop/lmu;D:$HOME/Downloads"
set -x NNN_PLUG 'o:fzopen;p:mocplay;d:diffs;m:nmount;n:notes;v:imgviu;t:imgthumb'
start_tmux

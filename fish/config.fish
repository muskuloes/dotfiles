set -x TERM xterm-256color
set -x CDPATH . ~ ~/Desktop

set -gx PATH $PATH /snap/bin /usr/local/go/bin $HOME/bin /home/linuxbrew/.linuxbrew/bin $HOME/.local/bin $HOME/.krew/bin $HOME/.kubectx $HOME/go/bin $HOME/.cargo/bin $HOME/.yarn/bin
set -gx EDITOR vim
set -gx VISUAL ewrap
set -gx NNN_BMS 'u:~/Desktop/uni;w:~/Desktop/work'
set -gx NNN_PLUG 'o:fzopen;v:imgview;u:getplugs'
set -gx NNN_COLORS '2134'
set -gx FZF_DEFAULT_COMMAND 'fd --type f'
set -gx FZF_DEFAULT_OPTS '--height 40% --bind 'ctrl-/:toggle-preview' --preview-window wrap --reverse'
set -gx FZF_CTRL_T_OPTS "--preview 'bat --style=numbers --color=always --line-range :500 {}'"

alias vim="nvim"
alias n="nnn -exC"
alias k="kubectl"
alias r="R"

# exa and bat need to be installed
alias ls="exa --long --header --git --group"
alias cat="bat"

set -g fish_user_paths "/home/linuxbrew/.linuxbrew/sbin" $fish_user_paths

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/muskuloes/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

alias getip='curl https://ipinfo.io/ip'

set -g theme_nerd_fonts yes
set -g theme_powerline_fonts yes
set -g theme_display_git yes

set -U theme_display_date no
set -U theme_project_dir_length 1


# Setting VI Mode
set theme_display_vi yes

# Rust Environment Variable
set fish_user_paths ~/.cargo/bin/ $PATH

alias p='python3'
alias reload='source ~/.config/fish/conf.d/omf.fish;tmux source-file ~/.tmux.conf'
alias fetch='neofetch'
alias dooms="~/.emacs.d/bin/doom sync"
alias gaa='git add -A'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'
alias .fish='vi ~/.config/fish/conf.d/omf.fish'
alias gtmlastmonth='gtm report -last-month -format timeline-hours'
alias gtmsummary='gtm report -last-month -format summary'
alias cl=clear
alias sl=ls
alias lsa='ls -la'
alias doom='~/.emacs.d/bin/doom'
alias python=python3
alias pip='pip3'
alias .vimrc='vim ~/.vimrc'
alias .tmux='vim ~/.tmux.conf'
alias tmuxrefresh='tmux source ~/.tmux.conf'
alias pin='ping www.google.de'
alias tmuxkill='tmux kill-session -a'
alias ls='ls -G1'
alias ll='ls -G'
alias simpleserver='python -m http.server 8000'
alias dropignore='xattr -w com.dropbox.ignored 1'
alias dc=docker-compose
# GTM Shortcuts
alias gtmbar='gtm report -format timeline-hours'

# LSCOLORS
 set -Ux LSCOLORS Gxfxcxdxbxegedabagacad

# Colors
set theme_color_scheme gruvbox
set fish_color_command green --bold
set fish_color_cancel red
set fish_color_param white

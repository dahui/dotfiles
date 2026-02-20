setopt extended_glob

#
# History configuration (from CachyOS Zsh config)
#

# Ignore commands that start with spaces and duplicates.
export HISTCONTROL=ignoreboth
# Don't add certain commands to the history file.
export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"
# Use custom `less` colors for `man` pages.
export LESS_TERMCAP_md="$(tput bold 2> /dev/null; tput setaf 2 2> /dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2> /dev/null)"
# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

#
# User configuration
#

# Load Zim Framework
ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  if [[ -f "/opt/homebrew/opt/zimfw/share/zimfw.zsh" ]]; then
    source /opt/homebrew/opt/zimfw/share/zimfw.zsh init
  elif [[ -f  "/usr/share/zimfw/zimfw.zsh" ]]; then
    source /usr/share/zimfw/zimfw.zsh init
  elif [[ -f "/home/linuxbrew/.linuxbrew/opt/zimfw/share/zimfw.zsh" ]]; then
    source /home/linuxbrew/.linuxbrew/opt/zimfw/share/zimfw.zsh init
  fi
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

#
# Custom exports and aliases
#

# Load Homebrew environment
if [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
  _evalcache /home/linuxbrew/.linuxbrew/bin/brew shellenv zsh
elif [[ -f "/opt/homebrew/bin/brew" ]]; then
  _evalcache /opt/homebrew/bin/brew shellenv
fi

# Generate our prompt
_evalcache starship init zsh

alias ls='eza -lah --color=always --icons=always --git --group-directories-first'
alias cat='bat'
alias claude="$HOME/.claude/local/claude"
# Make "kubecolor" borrow the same completion logic as "kubectl"
compdef kubecolor=kubectl
alias kubectl='kubecolor'

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR='code -w'

export FZF_DEFAULT_OPTS='--style full --ansi --preview "bat --style=numbers --color=always {}" --color "bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8" --color "fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC" --color "marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8" --color "selected-bg:#45475A" --color "border:#6C7086,label:#CDD6F4"'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export EZA_CONFIG_DIR=$XDG_CONFIG_HOME/eza/

# source local configs. (i.e. machine spacific, etc)
if [[ -d "$HOME/.zsh.local.d" ]]; then
  for file in $HOME/.zsh.local.d/*.sh; do
    [[ -f "$file" ]] && source "$file"
  done
fi

fastfetch
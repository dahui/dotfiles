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
  source /opt/homebrew/opt/zimfw/share/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

#
# Custom exports and aliases
#

# Load Homebrew environment
_evalcache /opt/homebrew/bin/brew shellenv
# Generate our prompt
_evalcache starship init zsh

PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
# alias ls='ls -h --color'
alias aws='aws --no-cli-pager'
alias ls='eza -lh --color=always --icons=always --git --group-directories-first'
alias cat='bat'
alias claude="/Users/606563/.claude/local/claude"
alias kubectl='kubecolor'

export $XDG_CONFIG_HOME="$HOME/.config"
export GOPATH="/Users/606563/dev/golang"
export EDITOR='code -w'
#export NVM_DIR="$HOME/.nvm"
#  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export NODE_EXTRA_CA_CERTS=~/.zscaler-cert.pem
export npm_config_python=`which python3`
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export FZF_DEFAULT_OPTS='--style full --ansi --preview "bat --style=numbers --color=always {}" --color "bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8" --color "fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC" --color "marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8" --color "selected-bg:#45475A" --color "border:#6C7086,label:#CDD6F4"'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export EZA_CONFIG_DIR=$XDG_CONFIG_HOME/eza/

# Make "kubecolor" borrow the same completion logic as "kubectl"
compdef kubecolor=kubectl

fastfetch
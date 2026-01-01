
set -l additional_paths '$HOME/.krew/bin' \
                     '$HOME/.nvm/versions/node/v20.19.4/bin' \
                     '/opt/homebrew/opt/coreutils/libexec/gnubin' \
                     '/opt/homebrew/bin' \
                     '/opt/homebrew/sbin' \
                     '/opt/homebrew/opt/coreutils/libexec/gnubin' \
                     '/usr/local/bin'

for ap in $additional_paths
    fish_add_path $ap
end

set -gx GOPATH $HOME/dev/golang
set -gx EDITOR 'code -w'
set -gx NODE_EXTRA_CA_CERTS $HOME/.zscaler-cert.pem
set -gx npm_config_python (which python3)
set -Ux XDG_CONFIG_HOME $HOME/.config

set -gx FZF_DEFAULT_OPTS '--style full --ansi --preview "bat --style=numbers --color=always {}" --color "bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8" --color "fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC" --color "marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8" --color "selected-bg:#45475A" --color "border:#6C7086,label:#CDD6F4"'
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -gx EZA_CONFIG_DIR $XDG_CONFIG_HOME/eza/

alias cat='bat'

if status is-interactive
    # Commands to run in interactive sessions can go here
  
  # Set up fzf key bindings
    fzf --fish | source
    starship init fish | source
end


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

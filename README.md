# dotfiles

A collection of personal configuration files managed with GNU Stow.

## Overview

This repository contains my dotfiles for various tools (shell, editor, terminal, etc.). All configuration is organized into separate stowable packages, making it easy to install, update, and manage across multiple machines.

## Features

- **Modular management** with GNU Stow
- **Cross‑platform** support (Linux, macOS, Windows)
- **Versioned** configuration for easy rollback
- **Simple install script** to symlink files into `~/`

## Installation

```bash
# Clone the repo
git clone https://github.com/dahui/dotfiles.git ~/.dotfiles

# Enter the directory
cd ~/.dotfiles

# Run the install script or use stow manually
./install.sh

# Or, using Stow directly:
stow */  # Will symlink all available packages into $HOME
```

## Usage

- Source the provided `shell/config.fish` or `shell/bash/config.bash` to enable custom functions and prompts.
- Activate the terminal configuration by launching your terminal emulator; Alacritty config is in `alacritty/alacritty.toml`.
- Explore individual packages under their respective directories.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This work is licensed under the MIT License. See the `LICENSE` file for details.
# dotfiles

Personal configuration using GNU Stow for installation

## Installation

1. Install GNU Stow
- Debian-based System
```sh
sudo apt update
sudo apt install stow
```
- Red Hat-based Systems
```sh
sudo dnf install stow
```
- Arch-based Systems
```sh
sudo pacman -S stow
```
2. Clone the repository
```sh
git clone https://github.com/Lmanangka/.dotfiles.git
```

## Usage

1. Navigate to .dotfiles directory
```sh
cd .dotfiles
```
2. Using Stow to manage config files

#### Example
- Use bash config
```sh
stow bash
```
- Use neovim config
```sh
stow nvim
```
- Use kitty config
```sh
stow kitty
```

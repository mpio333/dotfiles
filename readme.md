# Dotfiles - fzic

Dotfiles for Arch install with i3-gaps, i3blocks, kitty, zsh, tmux, ranger, neovim and base16 colors.

### Prerequisites

Git, alacritty, pure (zsh shell), neovim, vundle, i3, i3blocks, zsh, tmux, ranger, yarn..

### Installing

#####First time setup:

```
mkdir $HOME/.dotfiles
git init --bare $HOME/.dotfiles

alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' #in .zshrc

dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@github.com:anandpiyer/.dotfiles.git

cd $HOME
dotfiles add .tmux.conf
dotfiles commit -m "Add .tmux.conf"
dotfiles push
```

#####Install on new machine:

```
git clone --bare git@gitlab.com:fzic/dotfiles.git ~/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' #in .zshrc
config config status.showUntrackedFiles no
config checkout
```

### GTK and Icon Theme

#####Managed via lxappearance

```
sudo pacman -S lxappearance
```
#####GTK, Shades of Gray (arch)
https://www.opendesktop.org/p/1244058/

#####Icons, Papirus
https://www.opendesktop.org/p/1166289/
**Has harcode tray support

## Authors

* **Fray Zacarias**

## Acknowledgments

* https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html
* https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

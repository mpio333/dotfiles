# Dotfiles - fzic

Dotfiles for Arch install with i3-gaps, i3blocks, kitty, zsh, tmux, ranger, neovim and base16 colors.

### Prerequisites

Git, neovim, vundle, i3, i3blocks, zsh, tmux, ranger, yarn..

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
git clone --bare https://bitbucket.org/durdn/cfg.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```
## Authors

* **Fray Zacarias**

## Acknowledgments

* https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html
* https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

# The following lines were added by compinstall
zstyle :compinstall filename '/home/fzic/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

#Custom Options
export TERM="xterm-kitty"
export EDITOR='nvim'
autoload -Uz compinit && compinit -i
export RANGER_LOAD_DEFAULT_RC=FALSE

#Vi mode
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

#Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#Plugins
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.config/zsh/plugins/z/z.sh

#Pure Prompt Theme
fpath=( "$HOME/.config/zsh/themes/pure" $fpath )
autoload -U promptinit; promptinit
prompt pure

#Aliases
alias ls='ls --color -h --group-directories-first'
alias ll='ls -l'
alias vim=nvim
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

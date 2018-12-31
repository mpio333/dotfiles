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
# End of lines configured by zsh-newuser-install

#Custom Options
export PATH="$(du $HOME/.scripts/ | cut -f2 | tr '\n' ':')$PATH"
export TERM="xterm-256color"
export EDITOR='nvim'
export TERMINAL="alacritty"
export BROWSER="firefox"
export READER="zathura"
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
export RANGER_LOAD_DEFAULT_RC=FALSE
bindkey -e
setopt inc_append_history
setopt share_history
#Emulate bash behaviour with *
setopt nonomatch

#Vi mode
# function zle-line-init zle-keymap-select {
#     VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#     RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
#     zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select
# export KEYTIMEOUT=1

#Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#Plugins
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.config/zsh/plugins/zsh-colored-man-pages/colored-man-pages.plugin.zsh
source ~/.config/zsh/plugins/z/z.sh

# Functions for handling urls
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

#Base16 Shell Theme
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         eval "$("$BASE16_SHELL/profile_helper.sh")"

#Pure Prompt Theme
fpath=( "$HOME/.config/zsh/themes/pure" $fpath )
autoload -U promptinit; promptinit
PURE_PROMPT_VICMD_SYMBOL=
PURE_PROMPT_SYMBOL=
# prompt pure
prompt spaceship
# SPACESHIP_CHAR_SYMBOL=
SPACESHIP_CHAR_SYMBOL=
SPACESHIP_CHAR_SUFFIX=⠀
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_DIR_COLOR=12
SPACESHIP_EXEC_TIME_ELAPSED=60
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
  )

#Aliases
alias ls='ls --color -h --group-directories-first'
alias ll='ls -l'
alias vim=nvim
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ci3='vim ~/.config/i3/config'
alias ccomp='vim ~/.config/compton.conf'
alias cala='vim ~/.config/alacritty/alacritty.yml'
alias cran='vim ~/.config/ranger/rc.conf'
alias gdiff='git diff | diff-so-fancy'

#Wal Colorscheme
(cat ~/.cache/wal/sequences &)

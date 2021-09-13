# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/home/dolpheyn/.oh-my-zsh"
# export TERM=xterm-256color # For tmux color
export EDITOR=/usr/bin/nvim
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

export FZF_DEFAULT_COMMAND='fd --type f'

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# ------------- zsh-autosuggestions config ---------------
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=blue"
# --------------------------------------------------------


source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export LD_LIBRARY_PATH=/usr/lib
export PATH=/home/dolpheyn/.config/composer/vendor/laravel/installer/bin:$PATH
export PATH=/home/dolpheyn/.cargo/bin:$PATH
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export PATH=/home/dolpheyn/scripts:$PATH
export PATH=/home/dolpheyn/anaconda3/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias wiki="~/vimwiki && git add . && git commit -m 'notes' && git push"
alias v="nvim"
alias master="git checkout master"

# Git
alias ga="git add"
alias gap="git add --patch"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gs="git status"
alias gsv="git status -v"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

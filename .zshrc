# Connect to a detached tmux session if one exists, otherwise start a new one.
# Close the window when the session is exited.
#[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}

# Enable Powerlevel11k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/david/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for remote and local sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Personal aliases
alias c='clear'
alias ytdl='youtube-dl -x --audio-format mp3 --audio-quality 0'

# Git aliases
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gmm='git merge master'
alias gmd='git merge develop'
alias gpom='git push origin master'
alias gpod='git push origin develop'

# Move things to the trash rather than deleting them, and train
# myself not to use rm. (requires rmtrash to be installed)
alias del="trash"
alias rm="echo Use 'del' or '/bin/rm'"

# Use nvim instead of vi or vim
alias vi="nvim"
alias vim="nvim"

# Use vi mode in the shell
bindkey -v
bindkey -M vicmd '/' history-incremental-search-backward

# Rbenv init
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Cargo path
#export PATH="$HOME/.cargo/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Syntax highlighting
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# exa
alias ls='exa'
export PATH="/usr/local/opt/php@7.3/bin:$PATH"

# git-fuzzy (powered by fzf)
export PATH="/Users/david/Tools/git-fuzzy/bin:$PATH"
alias gf="git fuzzy"

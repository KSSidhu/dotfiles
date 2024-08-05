export PATH=/opt/homebrew/bin:$PATH

export EDITOR='nvim'

# ---- Eza (better ls) -----
alias ls="eza --icons=always --group-directories-first"
alias la="ls -a"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

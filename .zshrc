export PATH=/usr/local/bin:/opt/homebrew/bin:$HOME/bin:$HOME/.cargo/bin:/usr/local/go/bin:/Applications/WezTerm.app/Contents/MacOS:$HOME/.local/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    history-substring-search
    fzf-tab
)

source $ZSH/oh-my-zsh.sh

alias g="git"
alias ls="lsd"
alias v='nvim'
alias gs='git status'
alias ga='git add -- .'
alias p='pnpm'
alias n='npm'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source <(fzf --zsh)

# pip3 install neovim-remote --break-system-packages
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    alias nvim=nvr -cc split --remote-wait +'set bufhidden=wipe'
fi

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
    export VISUAL="nvim"
    export EDITOR="nvim"
fi

alias vim='nvim --listen /tmp/nvim-server.pipe'

# neofetch

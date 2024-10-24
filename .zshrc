export CARGO_HOME=$HOME/.cargo
export GOLANG_HOME=/usr/local/go
export WEZTERM_HOME=/Applications/WezTerm.app/Contents/MacOS
export PATH=$HOME/bin:$CARGO_HOME/bin:$GOLANG_HOME/bin:$WEZTERM_HOME:$PATH

export BREW_HOME=/opt/homebrew
export PATH=/opt/homebrew/bin:$PATH

export XDG_CONFIG_HOME="$HOME/.config"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    # history-substring-search
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

# alias vim='nvim --listen /tmp/nvim-server.pipe'

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "$(fnm env --use-on-cd --shell zsh)"
  eval "$(fnm completions --shell zsh)"
fi

function setproxy() {
  export {http,https}_proxy='http://127.0.0.1:7897'
}

function unsetproxy() {
  unset {http,https}_proxy
}

# neofetch

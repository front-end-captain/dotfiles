# dotfiles

## Download and Install 'clash-verge'

https://repo.trojan-cdn.com/clash-verge/LatestRelease/

## Setup for windows11 and WSL(Ubuntu)


### Install Powershell 7

```powershell
winget install --id Microsoft.Powershell --source winget
```

### Install Scoop(package manager)

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

For advanced installation options, check out the [Installer's Readme](https://github.com/ScoopInstaller/Install#readme).

### Install Prerequistites

```powershell
scoop install main/glow
scoop install main/ripgrep
scoop install main/fd
scoop install main/7zip
scoop install main/gcc
scoop install main/git
scoop install main/lazygit
scoop install main/lsd
scoop install main/make
scoop install main/neovim
scoop install main/vim
scoop install main/oh-my-posh
scoop install main/win32yank
scoop install main/winfetch
scoop install main/unzip
scoop install main/python

scoop install fzf
Install-Module -Name PsFzf -Scope CurrentUser -Force

scoop install fnm
```

## Install nerd fonts

```shell
git clone https://github.com/ryanoasis/nerd-fonts.git
```

## Build a firmware for a pinky 3
```shell
qmk compile -kb pinky/3 -km via --clean
```

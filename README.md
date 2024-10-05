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
scoop install main/git
scoop install main/glow main/ripgrep main/fd main/7zip main/gcc extras/lazygit main/lsd main/make main/neovim main/vim main/oh-my-posh main/win32yank main/winfetch main/unzip main/python fzf fnm

Install-Module -Name PsFzf -Scope CurrentUser -Force
Install-Module -Name posh-git -Scope CurrentUser -Force -AllowClobber
Install-Module -Name z -Scope CurrentUser -Force -SkipPublisherCheck -AllowClobber
Install-Module -Name psreadLine -Scope CurrentUser -Force -SkipPublisherCheck -AllowClobber
Install-module -Name Terminal-Icons -Scope CurrentUser -Force -SkipPublisherCheck -AllowClobber

```

## Install nerd fonts

```shell
git clone https://github.com/ryanoasis/nerd-fonts.git
```

## Build a firmware for a pinky 3
```shell
qmk compile -kb pinky/3 -km via --clean
```

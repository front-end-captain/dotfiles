# dotfiles

## Download and Install 'clash-verge'

https://repo.trojan-cdn.com/clash-verge/LatestRelease/

## Setup for windows11 and WSL(Ubuntu)

### Install Scoop(package manager)

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

For advanced installation options, check out the (Installer's Readme)[https://github.com/ScoopInstaller/Install#readme].

### Install Prerequistites

#### Glow
> markdown reader for the terminal with a TUI

```powershell
scoop install main/glow
```

#### fzf
```powershell
scoop install fzf
Install-Module -Name PsFzf -Scope CurrentUser -Force
```


## Install nerd fonts

```shell
git clone https://github.com/ryanoasis/nerd-fonts.git
```

## Build a firmware for a pinky 3
```shell
qmk compile -kb pinky/3 -km via --clean
```

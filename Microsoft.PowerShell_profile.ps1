# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.4
# ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

$Env:NVIM_CONFIG_HOME = "$Env:USERPROFILE\AppData\Local\nvim"

$Env:POSH_HOME = "$Env:USERPROFILE\AppData\Local\Programs\oh-my-posh"
$Env:POSH_THEMES_PATH = "$Env:POSH_HOME\themes"
$Env:Path += ";$Env:POSH_HOME\bin"

$Env:ANDROID_HOME = "$Env:USERPROFILE\AppData\Local\Android\Sdk"
$Env:AVD_HOME = "$Env:USERPROFILE\.android\avd"
$Env:JAVA_HOME = "C:\Program Files\Microsoft\jdk-17.0.12.7-hotspot"
$Env:MAVEN_HOME = "C:\Program Files\apache-maven-3.9.9"
$Env:GRADLE_HOME = "C:\Program Files\gradle-8.10"
$Env:Path += ";$env:ANDROID_HOME\emulator;$env:ANDROID_HOME\platform-tools;$Env:MAVEN_HOME\bin;$Env:GRADLE_HOME\bin"

$Env:SCOOP_HOME = "$Env:USERPROFILE\scoop"
$Env:CHOCO_HOME = "C:\ProgramData\chocolatey"
$Env:Path += ";$Env:SCOOP_HOME\shims;$Env:CHOCO_HOME\bin"

$env:GO111MODULE = "on"
$env:GOPROXY = "https://goproxy.cn"

# $env:NVM_IOJS_ORG_MIRROR = "https://npm.taobao.org/mirrors/node"

Import-Module PsFzf
Import-Module posh-git
Import-Module PSReadLine
Import-Module z
Import-Module Terminal-Icons

Set-PSReadlineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PSReadLineKeyHandler -Key "Ctrl+p" -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key "Ctrl+n" -Function HistorySearchForward
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

Set-Alias -Name v -Value nvim
Set-Alias -Name g -Value git
Set-Alias -Name l -Value lsd
Set-Alias -Name p -Value pnpm
Set-Alias -Name n -Value npm

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\bubblesextra.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\catppuccin.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\easy-term.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\gruvbox.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\kushal.omp.json" | Invoke-Expression

fnm env --use-on-cd | Out-String | Invoke-Expression

# winfetch


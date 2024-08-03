# ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

Import-Module posh-git
Import-Module oh-my-posh
Import-Module PSReadLine
Import-Module z
Import-Module Terminal-Icons

# oh-my-posh init pwsh --config ~/Documents/oh-my-posh/themes/bubblesextra.omp.json | Invoke-Expression
# oh-my-posh init pwsh --config ~/Documents/oh-my-posh/themes/catppuccin.omp.json | Invoke-Expression
# oh-my-posh init pwsh --config ~/Documents/oh-my-posh/themes/easy-term.omp.json | Invoke-Expression
oh-my-posh init pwsh --config ~/Documents/oh-my-posh/themes/gruvbox.omp.json| Invoke-Expression
# oh-my-posh init pwsh --config ~/Documents/oh-my-posh/themes/kushal.omp.json| Invoke-Expression

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key "Ctrl+p" -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key "Ctrl+n" -Function HistorySearchForward
Set-PSReadlineOption -EditMode Emacs

Set-Alias -Name v -Value nvim
Set-Alias -Name g -Value git
Set-Alias -Name l -Value lsd
# Set-Alias -Name ls -Value lsd

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function p {pnpm}
function v {nvim}
winfetch

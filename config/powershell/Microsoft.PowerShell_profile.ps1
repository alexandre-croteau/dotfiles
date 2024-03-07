oh-my-posh init pwsh --config "$env:USERPROFILE/.dotfiles/config/oh-my-posh/default.omp.json" | Invoke-Expression

function Open-Eza { & eza --long --header --icons --all }
New-Alias -Name "la" -Value "Open-Eza" -Description "Eza" -Option ReadOnly -Force
New-Alias -Name "ll" -Value "Open-Eza" -Description "Eza" -Option ReadOnly -Force

function Open-Neovim([string]$FileName) { & nvim $FileName }
New-Alias -Name "vi" -Value "Open-Neovim" -Description "Neovim" -Option ReadOnly -Force
New-Alias -Name "vim" -Value "Open-Neovim" -Description "Neovim" -Option ReadOnly -Force

function Open-Lazygit { & lazygit }
New-Alias -Name "laz" -Value "Open-Lazygit" -Description "Lazygit" -Option ReadOnly -Force
New-Alias -Name "lazy" -Value "Open-Lazygit" -Description "Lazygit" -Option ReadOnly -Force

if ($IsWindows) {
  Import-Module posh-git
}

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        dotnet complete --position $cursorPosition "$commandAst" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

# enable completion for scoop
Import-Module "$($(Get-Item $(Get-Command scoop.ps1).Path).Directory.Parent.FullName)\modules\scoop-completion"

# enable completion for gh
Invoke-Expression -Command $(gh completion -s powershell | Out-String)

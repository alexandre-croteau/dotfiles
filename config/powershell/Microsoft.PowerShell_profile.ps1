oh-my-posh init pwsh --config "$env:USERPROFILE/.dotfiles/config/oh-my-posh/default.omp.json" | Invoke-Expression

function Open-Eza { & eza --long --header --icons --all --sort=name --group-directories-first --hyperlink --ignore-glob '.DS_Store|?' }
New-Alias -Name "la" -Value "Open-Eza" -Description "Eza" -Option ReadOnly -Force
New-Alias -Name "ll" -Value "Open-Eza" -Description "Eza" -Option ReadOnly -Force

function Open-Neovim([string]$FileName) { & nvim $FileName }
New-Alias -Name "vi" -Value "Open-Neovim" -Description "Neovim" -Option ReadOnly -Force
New-Alias -Name "vim" -Value "Open-Neovim" -Description "Neovim" -Option ReadOnly -Force

function Open-Lazygit { & lazygit }
New-Alias -Name "laz" -Value "Open-Lazygit" -Description "Lazygit" -Option ReadOnly -Force
New-Alias -Name "lazy" -Value "Open-Lazygit" -Description "Lazygit" -Option ReadOnly -Force
New-Alias -Name "lz" -Value "Open-Lazygit" -Description "Lazygit" -Option ReadOnly -Force
New-Alias -Name "lg" -Value "Open-Lazygit" -Description "Lazygit" -Option ReadOnly -Force

function Open-Lazydocker { & lazydocker }
New-Alias -Name "ld" -Value "Open-Lazydocker" -Description "Lazydocker" -Option ReadOnly -Force

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        dotnet complete --position $cursorPosition "$commandAst" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

# enable completion for gh
Invoke-Expression -Command $(gh completion -s powershell | Out-String)

# Generate shell specific aliases for Copilot in the CLI
$GH_COPILOT_PROFILE = Join-Path -Path $(Split-Path -Path $PROFILE -Parent) -ChildPath "gh-copilot.ps1"
. $GH_COPILOT_PROFILE

if ($IsWindows) {
  Import-Module posh-git

  # enable completion for scoop
  Import-Module "$($(Get-Item $(Get-Command scoop.ps1).Path).Directory.Parent.FullName)\modules\scoop-completion"

  # enable gsudo
  Import-Module gsudoModule
}

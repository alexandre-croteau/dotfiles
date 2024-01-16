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

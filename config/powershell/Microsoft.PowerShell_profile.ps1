oh-my-posh init pwsh --config "../oh-my-posh/default.omp.json" | Invoke-Expression

function Open-Eza { & eza --long --header --icons --all }
New-Alias -Name "la" -Value "Open-Eza" -Description "eza aka exa" -Option ReadOnly -Force
New-Alias -Name "ll" -Value "Open-Eza" -Description "eza aka exa" -Option ReadOnly -Force

function Open-Neovim([string]$FileName) { & nvim $FileName }
New-Alias -Name "vi" -Value "Open-Neovim" -Description "neovim" -Option ReadOnly -Force
New-Alias -Name "vim" -Value "Open-Neovim" -Description "neovim" -Option ReadOnly -Force

if ($IsWindows) {
  Import-Module posh-git
}

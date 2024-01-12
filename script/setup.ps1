if ($IsWindows) {
  ### Powershell
  # https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.4#profile-types-and-locations
  New-Item -Path $PROFILE -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\config\powershell\Microsoft.PowerShell_profile.ps1" -Force

  ### Scoop
  Move-Item $env:USERPROFILE\.config\scoop $env:USERPROFILE\.config\scoop.bak -Force
  New-Item -Path "$env:USERPROFILE\.config\scoop" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\config\scoop" -Force

  ### Lazyvim
  # 1. Install LazyVim https://www.lazyvim.org/installation
  # Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak -Force
  # Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak -Force
  New-Item -Path "$env:LOCALAPPDATA\nvim" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\config\lazyvim" -Force

  ### Lazygit
  # https://github.com/jesseduffield/lazygit
  Move-Item $env:APPDATA\lazygit $env:APPDATA\lazygit.bak -Force
  New-Item -Path "$env:APPDATA\lazygit" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\config\lazygit" -Force
}

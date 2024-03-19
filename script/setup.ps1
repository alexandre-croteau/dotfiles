if ($IsWindows) {
  ### Powershell
  # https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.4#profile-types-and-locations
  New-Item -Path $PROFILE -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\config\powershell\Microsoft.PowerShell_profile.ps1" -Force

  ### Scoop
  # Move-Item $env:USERPROFILE\.config\scoop $env:USERPROFILE\.config\scoop.bak -Force
  New-Item -Path "$env:USERPROFILE\.config\scoop" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\config\scoop" -Force

  ### Lazyvim
  # 1. Install LazyVim https://www.lazyvim.org/installation
  # Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak -Force
  # Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak -Force
  New-Item -Path "$env:LOCALAPPDATA\nvim" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\config\lazyvim" -Force

  ### Git
	if (-not (Test-Path "$env:USERPROFILE\.dotfiles\git\gitconfig.symlink")) {
		Write-Host " - what is your github author name?"
		$git_authorname = Read-Host
		Write-Host " - what is your github author email?"
		$git_authoremail = Read-Host
		Write-Host " - what is your signing key?"
		$git_signingkey = Read-Host

		(Get-Content "$env:USERPROFILE\.dotfiles\git\gitconfig.symlink.example") `
      -replace "GIT_AUTHORNAME", $git_authorname `
			-replace "GIT_AUTHOREMAIL", $git_authoremail `
			-replace "GIT_SIGNINGKEY", $git_signingkey | Set-Content "$env:USERPROFILE\.dotfiles\git\gitconfig.symlink"
	}

  New-Item -Path "$env:USERPROFILE\.gitconfig" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\git\gitconfig.symlink" -Force

  ### Lazygit
  # https://github.com/jesseduffield/lazygit
  # Move-Item $env:APPDATA\lazygit $env:APPDATA\lazygit.bak -Force
  New-Item -Path "$env:APPDATA\lazygit" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\config\lazygit" -Force

  ### gh-dash
  New-Item -Path "$env:USERPROFILE\.config\gh-dash" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\config\gh-dash" -Force
}

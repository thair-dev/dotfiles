# install.ps1
#
# Windows Codex bootstrap script
#
# What this does:
# - Installs core CLI tools via winget
# - Installs Codex AGENTS.md configuration
#
# What this does NOT do:
# - Modify PATH
# - Perform heavy validation
# - Configure full environment
#
# Requirements:
# - Windows 11
# - PowerShell
# - winget (App Installer)
#
# Usage:
# 1. Open PowerShell (Run as Administrator if you encounter issues)
# 2. cd path\to\dotfiles
# 3. Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# 4. .\codex\install.ps1
# 5. Restart Codex

# -------------------------------
# Pre-checks
# -------------------------------

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error "winget not found. Install App Installer from Microsoft Store."
    exit 1
}

# -------------------------------
# Install tools
# -------------------------------

Write-Host ""
Write-Host "==> Installing core tools..."

$packages = @(
    "Git.Git",
    "BurntSushi.ripgrep.MSVC",
    "sharkdp.fd",
    "junegunn.fzf",
    "Python.Python.3.13",
    "astral-sh.uv"
)

foreach ($pkg in $packages) {
    Write-Host "Installing $pkg ..."
    winget install --id $pkg --exact --source winget --accept-package-agreements --accept-source-agreements

    if ($LASTEXITCODE -ne 0) {
        Write-Error "Failed to install $pkg"
        exit $LASTEXITCODE
    }
}

# -------------------------------
# Install Codex configuration
# -------------------------------

Write-Host ""
Write-Host "==> Installing Codex configuration..."

$codexDir = Join-Path $env:USERPROFILE ".codex"
New-Item -ItemType Directory -Force $codexDir | Out-Null

$source = Join-Path $PSScriptRoot "AGENTS.md"
$target = Join-Path $codexDir "AGENTS.md"

if (-not (Test-Path $source)) {
    Write-Error "Missing required file: $source"
    exit 1
}

Copy-Item $source $target -Force
Write-Host "Copied AGENTS.md to $target"

# -------------------------------
# Done
# -------------------------------

Write-Host ""
Write-Host "==> Done"
Write-Host ""
Write-Host "Next steps:"
Write-Host "- Fully quit Codex and start it again"
Write-Host "- Open a new Codex session after restart"
Write-Host ""

<#
PowerShell helper to initialize a git repo, commit, set branch, add remote, and push.
Usage: run from the repository root (where this script lives):
  cd 'c:\Users\carlr\Desktop\C.I.A-Site'
  .\scripts\git-push.ps1 -RemoteUrl 'https://github.com/LT-Arrow/C.I.A-Site.git'
#>
param(
  [Parameter(Mandatory=$false)]
  [string]$RemoteUrl = 'https://github.com/LT-Arrow/C.I.A-Site.git',

  [Parameter(Mandatory=$false)]
  [string]$CommitMessage = 'Initial commit'
)

function Check-Git {
  try {
    git --version | Out-Null
    return $true
  } catch {
    return $false
  }
}

if (-not (Check-Git)) {
  Write-Error "Git is not installed or not in PATH. Install Git for Windows: https://git-scm.com/download/win"
  exit 1
}

# Initialize if not already a git repo
if (-not (Test-Path .git)) {
  git init
} else {
  Write-Host ".git already exists — repository already initialized"
}

# Stage all
git add .

# Commit if there are staged changes - use porcelain status which is more reliable
$status = (git status --porcelain) -join "`n"
if ([string]::IsNullOrWhiteSpace($status)) {
  Write-Host 'No changes to commit (staged).'
} else {
  git commit -m "$CommitMessage"
}

# Set branch to main
# Set branch to main (if no commits exist this will be a no-op or return a message)
try {
  git branch -M main 2>$null
} catch {
  Write-Host "Could not set branch to main — it may already exist or another issue occurred."
}

# Add remote if not present
$existing = git remote | Select-String -Pattern '^origin$' -Quiet
if (-not $existing) {
  git remote add origin $RemoteUrl
} else {
  Write-Host "Remote 'origin' already exists. To change it run: git remote set-url origin <url>"
}

# Push
Write-Host "Attempting to push to origin main..."
$pushResult = & git push -u origin main 2>&1
if ($LASTEXITCODE -ne 0) {
  Write-Error "Push failed. Output:`n$pushResult`
Check authentication, network, and that a local branch named 'main' exists (you may need to commit first)."
  exit 1
} else {
  Write-Host "Push completed successfully."
}
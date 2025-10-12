<#
PowerShell helper: initialize a git repo (if needed), stage and commit files,
ensure branch 'main', add or replace remote 'origin', and push.

Usage (run from repository root):
  Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
  .\scripts\git-push.ps1 -RemoteUrl 'https://github.com/your/repo.git' -CommitMessage 'Initial commit' -ForceRemote

Parameters:
  -RemoteUrl     The URL to set for the 'origin' remote (default points to this repo).
  -CommitMessage Commit message for the initial commit (default: 'Initial commit').
  -ForceRemote   If present, will replace an existing 'origin' remote URL.
#>

param(
	[Parameter(Mandatory=$false)]
	[string]$RemoteUrl = 'https://github.com/LT-Arrow/C.I.A-Site.git',

	[Parameter(Mandatory=$false)]
	[string]$CommitMessage = 'Initial commit',

	[Parameter(Mandatory=$false)]
	[switch]$ForceRemote
)

function Find-Git {
	try { & git --version > $null 2>&1; return $true } catch {}
	try { $where = & where.exe git 2>$null; if ($where) { return $true } } catch {}

	$candidates = @(
		"$env:ProgramFiles\Git\cmd",
		"$env:ProgramFiles\Git\bin",
		"$env:ProgramFiles(x86)\Git\cmd",
		"$env:USERPROFILE\AppData\Local\Programs\Git\cmd"
	)

	foreach ($p in $candidates) {
		$exe = Join-Path $p 'git.exe'
		if (Test-Path $exe) {
			if (-not ($env:Path -split ';' | Where-Object { $_ -eq $p })) {
				$env:Path = "$($env:Path);$p"
				Write-Host "Temporarily added '$p' to PATH for this session."
			}
			return $true
		}
	}
	return $false
}

if (-not (Find-Git)) {
	Write-Error "Git not found. Install Git for Windows: https://git-scm.com/download/win"
	exit 1
}

Write-Host "Git found:"; & git --version

if (-not (Test-Path .git)) {
	& git init
	Write-Host "Initialized repository."
} else {
	Write-Host "Repository already initialized (.git exists)."
}

# Stage everything
& git add . 2>$null

# Check status
$status = (& git status --porcelain) -join "`n"
if ([string]::IsNullOrWhiteSpace($status)) {
	Write-Host "No changes detected."
} else {
	Write-Host "Changes detected:`n$status"
}

# Ensure there is at least one commit (create empty commit if none)
$hasCommits = $false
& git rev-parse --verify HEAD 2>$null
if ($LASTEXITCODE -eq 0) { $hasCommits = $true }

if ($hasCommits) {
	if (-not ([string]::IsNullOrWhiteSpace($status))) {
		& git commit -m $CommitMessage
	} else {
		Write-Host "Nothing to commit."
	}
} else {
	& git commit --allow-empty -m $CommitMessage
	Write-Host "Created empty initial commit."
}

# Ensure branch main exists and is current
& git branch -M main 2>$null
Write-Host "Branch set to main (if possible)."

# Remote handling
$remoteUrlExisting = $null
try { $remoteUrlExisting = (& git remote get-url origin 2>$null) -join "`n" } catch {}

if ($remoteUrlExisting) {
	Write-Host "Remote 'origin' exists: $remoteUrlExisting"
	if ($ForceRemote.IsPresent) {
		& git remote set-url origin $RemoteUrl
		Write-Host "Replaced origin with $RemoteUrl"
	} else {
		Write-Host "To replace origin, re-run with -ForceRemote"
	}
} else {
	& git remote add origin $RemoteUrl
	Write-Host "Added origin $RemoteUrl"
}

Write-Host "Pushing to origin main..."
$out = & git push -u origin main 2>&1
if ($LASTEXITCODE -ne 0) {
	Write-Error "Push failed. Output:`n$out"
	exit 1
} else {
	Write-Host "Push succeeded."
}

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
    <#
    git-push.ps1

    Minimal, well-formed PowerShell helper to initialize a repository, commit (creates an empty commit if none exist), set branch to 'main', add/replace origin, and push.

    Run from the repository root. Example:
      Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
      .\scripts\git-push.ps1 -RemoteUrl 'https://github.com/LT-Arrow/C.I.A-Site.git' -CommitMessage 'Initial commit' -ForceRemote:$true
    #>

    param(
      [string]$RemoteUrl = 'https://github.com/LT-Arrow/C.I.A-Site.git',
      [string]$CommitMessage = 'Initial commit',
      [bool]$ForceRemote = $false
    )

    function Find-Git {
      try { & git --version > $null; return $true } catch {}
      try { $where = & where.exe git 2>$null; if ($where) { return $true } } catch {}

      <#
      git-push.ps1

      Minimal, well-formed PowerShell helper to initialize a repository, commit (creates an empty commit if none exist), set branch to 'main', add/replace origin, and push.

      Run from the repository root. Example:
        Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
        .\scripts\git-push.ps1 -RemoteUrl 'https://github.com/LT-Arrow/C.I.A-Site.git' -CommitMessage 'Initial commit' -ForceRemote:$true
      #>

      param(
        [string]$RemoteUrl = 'https://github.com/LT-Arrow/C.I.A-Site.git',
        [string]$CommitMessage = 'Initial commit',
        [bool]$ForceRemote = $false
      )

      function Find-Git {
        try { & git --version > $null; return $true } catch {}
        try { $where = & where.exe git 2>$null; if ($where) { return $true } } catch {}

        <#
        git-push.ps1

        Minimal, well-formed PowerShell helper to initialize a repository, commit (creates an empty commit if none exist), set branch to 'main', add/replace origin, and push.

        Run from the repository root. Example:
          Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
          .\scripts\git-push.ps1 -RemoteUrl 'https://github.com/LT-Arrow/C.I.A-Site.git' -CommitMessage 'Initial commit' -ForceRemote:$true
        #>

        param(
          [string]$RemoteUrl = 'https://github.com/LT-Arrow/C.I.A-Site.git',
          [string]$CommitMessage = 'Initial commit',
          [bool]$ForceRemote = $false
        )

        function Find-Git {
          try { & git --version > $null; return $true } catch {}
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
                <#
                git-push.ps1

                Minimal, well-formed PowerShell helper to initialize a repository, commit (creates an empty commit if none exist), set branch to 'main', add/replace origin, and push.

                Run from the repository root. Example:
                  Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
                  .\scripts\git-push.ps1 -RemoteUrl 'https://github.com/LT-Arrow/C.I.A-Site.git' -CommitMessage 'Initial commit' -ForceRemote:$true
                #>

                param(
                  [string]$RemoteUrl = 'https://github.com/LT-Arrow/C.I.A-Site.git',
                  [string]$CommitMessage = 'Initial commit',
                  [bool]$ForceRemote = $false
                )

                function Find-Git {
                  try { & git --version > $null; return $true } catch {}
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
                        <#
                        git-push.ps1

                        Minimal, well-formed PowerShell helper to initialize a repository, commit (creates an empty commit if none exist), set branch to 'main', add/replace origin, and push.

                        Run from the repository root. Example:
                          Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
                          .\scripts\git-push.ps1 -RemoteUrl 'https://github.com/LT-Arrow/C.I.A-Site.git' -CommitMessage 'Initial commit' -ForceRemote:$true
                        #>

                        param(
                          [string]$RemoteUrl = 'https://github.com/LT-Arrow/C.I.A-Site.git',
                          [string]$CommitMessage = 'Initial commit',
                          [bool]$ForceRemote = $false
                        )

                        function Find-Git {
                          try { & git --version > $null; return $true } catch {}
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
                                <#
                                git-push.ps1

                                Minimal, well-formed PowerShell helper to initialize a repository, commit (creates an empty commit if none exist), set branch to 'main', add/replace origin, and push.

                                Run from the repository root. Example:
                                  Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
                                  .\scripts\git-push.ps1 -RemoteUrl 'https://github.com/LT-Arrow/C.I.A-Site.git' -CommitMessage 'Initial commit' -ForceRemote:$true
                                #>

                                param(
                                  [string]$RemoteUrl = 'https://github.com/LT-Arrow/C.I.A-Site.git',
                                  [string]$CommitMessage = 'Initial commit',
                                  [bool]$ForceRemote = $false
                                )

                                function Find-Git {
                                  try { & git --version > $null; return $true } catch {}
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
                                        <#
                                        git-push.ps1

                                        Minimal, well-formed PowerShell helper to initialize a repository, commit (creates an empty commit if none exist), set branch to 'main', add/replace origin, and push.

                                        Run from the repository root. Example:
                                          Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
                                          .\scripts\git-push.ps1 -RemoteUrl 'https://github.com/LT-Arrow/C.I.A-Site.git' -CommitMessage 'Initial commit' -ForceRemote:$true
                                        #>

                                        param(
                                          [string]$RemoteUrl = 'https://github.com/LT-Arrow/C.I.A-Site.git',
                                          [string]$CommitMessage = 'Initial commit',
                                          [bool]$ForceRemote = $false
                                        )

                                        function Find-Git {
                                          try { & git --version > $null; return $true } catch {}
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
                                        & git add .

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
                                            & git commit -m "$CommitMessage"
                                          } else {
                                            Write-Host "Nothing to commit."
                                          }
                                        } else {
                                          & git commit --allow-empty -m "$CommitMessage"
                                          Write-Host "Created empty initial commit."
                                        }

                                        # Ensure branch main exists and is current
                                        & git branch -M main 2>$null
                                        Write-Host "Branch set to main (if possible)."

                                        # Remote handling
                                        $exists = (& git remote) -match '^origin$'
                                        if ($exists) {
                                          Write-Host "Remote 'origin' exists."
                                          if ($ForceRemote) {
                                            & git remote set-url origin $RemoteUrl
                                            Write-Host "Replaced origin with $RemoteUrl"
                                          } else {
                                            Write-Host "To replace origin, re-run with -ForceRemote:$true"
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

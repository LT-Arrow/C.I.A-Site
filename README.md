# C.I.A-Site (skeleton)

This repository contains a minimal static site skeleton and a helper script to initialize and push the repository to GitHub from Windows PowerShell.

How to push locally (PowerShell):

```powershell
cd 'C:\Users\carlr\Desktop\C.I.A-Site'
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\git-push.ps1 -RemoteUrl 'https://github.com/your/repo.git' -CommitMessage 'Initial commit' -ForceRemote
```

If you prefer to run Git commands manually, run the usual sequence:

```powershell
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin <url>
git push -u origin main
```

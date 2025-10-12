# C.I.A-Site

Minimal static site structure for directives and field reports.

Structure:

- `index.html` — site home
- `directive.html` — directive listing page
- `styles.css` — site styles
- `admin/` — admin UI and `config.yml`
- `directives/` — markdown files for directives
- `fieldreports/`, `watchlogs/`, `uploads/` — data folders

How to commit and push locally (PowerShell):

```powershell
# install Git for Windows if not installed: https://git-scm.com/download/win
cd 'c:\Users\carlr\Desktop\C.I.A-Site'
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/LT-Arrow/C.I.A-Site.git
git push -u origin main
```

Authentication:
- Use Git Credential Manager (recommended) or a personal access token for HTTPS.
- Or set up SSH keys and use `git@github.com:LT-Arrow/C.I.A-Site.git` as the remote.

License: none provided — add one if needed.

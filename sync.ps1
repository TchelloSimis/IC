$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

Write-Host "Compiling PDF..." -ForegroundColor Cyan
latexmk -pdf -file-line-error -halt-on-error -interaction=nonstopmode main.tex
if ($LASTEXITCODE -ne 0) {
    Write-Host "Compilation failed! Aborting sync." -ForegroundColor Red
    exit 1
}

Write-Host "Syncing to GitHub..." -ForegroundColor Cyan
git add .
git commit -m "Auto-sync: $timestamp"
git push origin main
Write-Host "Done! PDF compiled and changes synced." -ForegroundColor Green

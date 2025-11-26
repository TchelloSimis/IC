$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Write-Host "Syncing to GitHub..." -ForegroundColor Cyan
git add .
git commit -m "Auto-sync: $timestamp"
git push origin main
Write-Host "Done! Changes synced." -ForegroundColor Green

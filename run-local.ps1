# HoANGU LMS - Run Local
# Chạy Frontend + Backend

param(
    [switch]$Frontend,
    [switch]$Backend,
    [switch]$All
)

$projectRoot = "D:\hoangu.techhave.com"
$backendRoot = "$projectRoot\src\backend"

if ($All -or (!$Frontend -and !$Backend)) {
    Write-Host "🚀 Starting Frontend..." -ForegroundColor Cyan
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $projectRoot; npm run dev"
    
    Write-Host "🚀 Starting Backend..." -ForegroundColor Cyan
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $backendRoot; npx tsx src/backend/index.ts"
    
    Write-Host ""
    Write-Host "✅ Both running!" -ForegroundColor Green
    Write-Host "   Frontend: http://localhost:5173" -ForegroundColor Yellow
    Write-Host "   Backend:  http://localhost:3000" -ForegroundColor Yellow
}
elseif ($Frontend) {
    Write-Host "🚀 Starting Frontend at http://localhost:5173..." -ForegroundColor Cyan
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $projectRoot; npm run dev"
}
elseif ($Backend) {
    Write-Host "🚀 Starting Backend at http://localhost:3000..." -ForegroundColor Cyan
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $backendRoot; npx tsx src/backend/index.ts"
}
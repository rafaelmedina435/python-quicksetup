# Simple script to activate virtual environment in terminal
# Authors: rafaelmedina435, Claude (Anthropic)

Write-Host "Python Virtual Environment Activator" -ForegroundColor Cyan
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host ""

# Validate if virtual environment exists
if (-Not (Test-Path ".venv")) {
    Write-Host "No virtual environment found in this project" -ForegroundColor Red
    Write-Host ""
    Write-Host "To create a virtual environment, run:" -ForegroundColor Yellow
    Write-Host ".\manager.bat" -ForegroundColor White
    Write-Host ""
    Write-Host "The manager will help you set up everything needed." -ForegroundColor Green
    Write-Host ""
    Write-Host "Press any key to exit..."
    Read-Host
    exit
}

# Activate the virtual environment
Write-Host "Activating virtual environment..." -ForegroundColor Yellow

if (Test-Path ".venv\Scripts\Activate.ps1") {
    try {
        # Activate the virtual environment
        . ".venv\Scripts\Activate.ps1"
        Write-Host "Virtual environment activated successfully" -ForegroundColor Green

        # Get Python version from environment
        if (Test-Path ".venv\Scripts\python.exe") {
            $venvPython = ".venv\Scripts\python.exe"
            $version = & $venvPython --version 2>$null
            if ($version) {
                Write-Host "Version: $($version.Trim())" -ForegroundColor Green
            }
        }

        Write-Host ""
        Write-Host "Terminal ready to work with Python" -ForegroundColor Green
        Write-Host "You will notice (.venv) at the beginning of your prompt" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Useful commands:" -ForegroundColor Cyan
        Write-Host "  python main.py          - Run main code" -ForegroundColor White
        Write-Host "  pip install package     - Install packages" -ForegroundColor White
        Write-Host "  pip list                - View installed packages" -ForegroundColor White
        Write-Host "  deactivate              - Deactivate environment" -ForegroundColor White
        Write-Host ""
        Write-Host "Starting interactive session..." -ForegroundColor Green
        Write-Host ""

        # Start a new interactive PowerShell session with the environment activated
        & powershell -NoExit -Command ". '.venv\Scripts\Activate.ps1'"

    } catch {
        Write-Host "Error activating virtual environment" -ForegroundColor Red
        Write-Host "Solution: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Press any key to exit..."
        Read-Host
        exit
    }
} else {
    Write-Host "Virtual environment activation script not found" -ForegroundColor Red
    Write-Host "Run .\manager.bat to recreate the environment" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Press any key to exit..."
    Read-Host
    exit
}

# Script ends here, but the new PowerShell session remains active
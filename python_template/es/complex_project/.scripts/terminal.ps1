# Script simple para activar entorno virtual en terminal
# Autores: rafaelmedina435, Claude (Anthropic)

Write-Host "Activador de Entorno Virtual Python" -ForegroundColor Cyan
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host ""

# Validar si existe el entorno virtual
if (-Not (Test-Path ".venv")) {
    Write-Host "No se encontro un entorno virtual en este proyecto" -ForegroundColor Red
    Write-Host ""
    Write-Host "Para crear un entorno virtual, ejecuta:" -ForegroundColor Yellow
    Write-Host ".\manager.bat" -ForegroundColor White
    Write-Host ""
    Write-Host "El gestor te ayudara a configurar todo lo necesario." -ForegroundColor Green
    Write-Host ""
    Write-Host "Presiona cualquier tecla para salir..."
    Read-Host
    exit
}

# Activar el entorno virtual
Write-Host "Activando entorno virtual..." -ForegroundColor Yellow

if (Test-Path ".venv\Scripts\Activate.ps1") {
    try {
        # Activar el entorno virtual
        . ".venv\Scripts\Activate.ps1"
        Write-Host "Entorno virtual activado exitosamente" -ForegroundColor Green

        # Obtener version de Python del entorno
        if (Test-Path ".venv\Scripts\python.exe") {
            $venvPython = ".venv\Scripts\python.exe"
            $version = & $venvPython --version 2>$null
            if ($version) {
                Write-Host "Version: $($version.Trim())" -ForegroundColor Green
            }
        }

        Write-Host ""
        Write-Host "Terminal lista para trabajar con Python" -ForegroundColor Green
        Write-Host "Notaras (.venv) al inicio de tu prompt" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Comandos utiles:" -ForegroundColor Cyan
        Write-Host "  python main.py          - Ejecutar codigo principal" -ForegroundColor White
        Write-Host "  pip install paquete     - Instalar paquetes" -ForegroundColor White
        Write-Host "  pip list                - Ver paquetes instalados" -ForegroundColor White
        Write-Host "  deactivate              - Desactivar entorno" -ForegroundColor White
        Write-Host ""
        Write-Host "Iniciando sesion interactiva..." -ForegroundColor Green
        Write-Host ""

        # Iniciar una nueva sesion de PowerShell interactiva con el entorno activado
        & powershell -NoExit -Command ". '.venv\Scripts\Activate.ps1'"

    } catch {
        Write-Host "Error al activar el entorno virtual" -ForegroundColor Red
        Write-Host "Solucion: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Presiona cualquier tecla para salir..."
        Read-Host
        exit
    }
} else {
    Write-Host "No se encontro el script de activacion del entorno virtual" -ForegroundColor Red
    Write-Host "Ejecuta .\manager.bat para recrear el entorno" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Presiona cualquier tecla para salir..."
    Read-Host
    exit
}

# El script termina aqui, pero la nueva sesion de PowerShell queda activa
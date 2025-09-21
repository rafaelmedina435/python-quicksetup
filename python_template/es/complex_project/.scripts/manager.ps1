# Script de gestion completa para proyectos Python
# Maneja configuracion, activacion y administracion del entorno virtual
#
# Autores: rafaelmedina435, Claude (Anthropic)

# Funcion para limpiar la pantalla
function Clear-Screen {
    Clear-Host
    Write-Host "Gestor de Entorno Virtual Python" -ForegroundColor Cyan
    Write-Host "===========================================" -ForegroundColor Cyan
    Write-Host ""
}

# Funcion para obtener la version de Python del entorno virtual
function Get-VenvPythonVersion {
    if (Test-Path ".venv") {
        try {
            $venvPython = ".venv\Scripts\python.exe"
            if (Test-Path $venvPython) {
                $version = & $venvPython --version 2>$null
                if ($version) {
                    return $version.Trim()
                }
            }
        } catch {
            # Ignorar errores
        }
    }
    return $null
}

# Funcion mejorada para detectar versiones de Python
function Get-PythonVersion {
    Write-Host "Detectando versiones de Python disponibles..." -ForegroundColor Yellow
    Write-Host ""

    $pythonVersions = @()

    # Metodo 1: Usar py launcher de Windows
    $ErrorActionPreference = "SilentlyContinue"
    $pyList = & py -0 2>$null
    $ErrorActionPreference = "Continue"

    if ($pyList -and $LASTEXITCODE -eq 0) {
        $lines = $pyList -split "`r`n|`n"
        foreach ($line in $lines) {
            $line = $line.Trim()
            if ($line -and $line -match "^-(\d+\.\d+)(?:-\d+)?\s+(.+)$") {
                $version = $matches[1]
                $path = $matches[2].Trim()
                $pythonVersions += @{Command = "py -$version"; Version = "Python $version"; Path = $path}
            }
        }
    }

    # Metodo 2: Buscar directamente en directorios comunes de Windows
    if ($pythonVersions.Count -eq 0) {
        $searchPaths = @(
            "$env:LOCALAPPDATA\Programs\Python\Python*\python.exe",
            "$env:PROGRAMFILES\Python*\python.exe",
            "$env:PROGRAMFILES(X86)\Python*\python.exe",
            "C:\Python*\python.exe"
        )

        foreach ($searchPath in $searchPaths) {
            $pythonExes = Get-ChildItem -Path $searchPath -ErrorAction SilentlyContinue
            foreach ($exe in $pythonExes) {
                try {
                    $version = & $exe.FullName --version 2>$null
                    if ($version -and $LASTEXITCODE -eq 0) {
                        $isDuplicate = $false
                        foreach ($existing in $pythonVersions) {
                            if ($existing.Version -eq $version.Trim()) {
                                $isDuplicate = $true
                                break
                            }
                        }
                        if (-not $isDuplicate) {
                            $pythonVersions += @{Command = $exe.FullName; Version = $version.Trim(); Path = $exe.FullName}
                        }
                    }
                } catch {
                    # Ignorar errores
                }
            }
        }
    }

    # Metodo 3: Usar comandos tradicionales en PATH
    if ($pythonVersions.Count -eq 0) {
        $commands = @("python", "python3", "python3.8", "python3.9", "python3.10", "python3.11", "python3.12", "python3.13")

        foreach ($cmd in $commands) {
            try {
                $ErrorActionPreference = "SilentlyContinue"
                $version = & $cmd --version 2>$null
                $ErrorActionPreference = "Continue"

                if ($version -and $LASTEXITCODE -eq 0) {
                    $isDuplicate = $false
                    foreach ($existing in $pythonVersions) {
                        if ($existing.Version -eq $version.Trim()) {
                            $isDuplicate = $true
                            break
                        }
                    }
                    if (-not $isDuplicate) {
                        $pythonVersions += @{Command = $cmd; Version = $version.Trim(); Path = ""}
                    }
                }
            } catch {
                # Ignorar errores silenciosamente
            }
        }
    }

    if ($pythonVersions.Count -eq 0) {
        Write-Host "No se encontraron versiones de Python instaladas" -ForegroundColor Red
        Write-Host "Instala Python desde https://python.org" -ForegroundColor Yellow
        return $null
    } elseif ($pythonVersions.Count -eq 1) {
        Write-Host "Se encontro una version: $($pythonVersions[0].Version)" -ForegroundColor Green
        Write-Host ""
        return $pythonVersions[0].Command
    } else {
        Write-Host "Se encontraron multiples versiones de Python:" -ForegroundColor Green
        Write-Host ""
        for ($i = 0; $i -lt $pythonVersions.Count; $i++) {
            $ver = $pythonVersions[$i]
            if ($ver.Path -and $ver.Path -ne "") {
                Write-Host "   $($i + 1). $($ver.Version) - $($ver.Path)" -ForegroundColor White
            } else {
                Write-Host "   $($i + 1). $($ver.Command) - $($ver.Version)" -ForegroundColor White
            }
        }
        Write-Host ""

        do {
            $selection = Read-Host "Selecciona una version (1-$($pythonVersions.Count))"
            try {
                $selectionNum = [int]$selection - 1
            } catch {
                $selectionNum = -1
            }

            if ($selectionNum -lt 0 -or $selectionNum -ge $pythonVersions.Count) {
                Write-Host "Opcion invalida. Intenta nuevamente." -ForegroundColor Red
            }
        } while ($selectionNum -lt 0 -or $selectionNum -ge $pythonVersions.Count)

        Write-Host "Usando: $($pythonVersions[$selectionNum].Version)" -ForegroundColor Green
        Write-Host ""
        return $pythonVersions[$selectionNum].Command
    }
}

# Funcion para guardar requirements.txt
function Save-Requirements {
    Write-Host "Guardando dependencias en requirements.txt..." -ForegroundColor Yellow

    try {
        python -m pip freeze > ./requirements.txt
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Dependencias guardadas exitosamente en requirements.txt" -ForegroundColor Green
        } else {
            Write-Host "Error al guardar las dependencias" -ForegroundColor Red
        }
    } catch {
        Write-Host "Error al ejecutar pip freeze" -ForegroundColor Red
    }

    Write-Host ""
    Write-Host "Presiona cualquier tecla para continuar..."
    Read-Host
}

# Funcion para instalar multiples paquetes
function Install-Packages {
    Clear-Screen
    Write-Host "Instalar Paquetes" -ForegroundColor Cyan
    Write-Host "===========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Puedes instalar uno o varios paquetes separados por espacios" -ForegroundColor Yellow
    Write-Host "Ejemplo: pandas numpy requests" -ForegroundColor Green
    Write-Host "Ejemplo: sqlalchemy" -ForegroundColor Green
    Write-Host ""

    $packages = Read-Host "Nombre(s) del/los paquete(s) a instalar"
    if ($packages) {
        Write-Host ""
        Write-Host "Instalando: $packages" -ForegroundColor Yellow

        # Separar paquetes por espacios y usar sintaxis correcta para pip
        $packageList = $packages -split '\s+' | Where-Object { $_.Trim() -ne "" }
        $installCommand = "python -m pip install " + ($packageList -join " ")

        Invoke-Expression $installCommand

        if ($LASTEXITCODE -eq 0) {
            Write-Host "Paquete(s) instalado(s) exitosamente" -ForegroundColor Green
            Write-Host ""

            $saveResponse = Read-Host "Deseas guardar estos paquetes en requirements.txt? (s/n)"
            if ($saveResponse -eq "s" -or $saveResponse -eq "S") {
                Write-Host ""
                Save-Requirements
            } else {
                Write-Host ""
                Write-Host "Paquete(s) instalado(s) pero no guardado(s) en requirements.txt" -ForegroundColor Yellow
                Write-Host ""
                Write-Host "Presiona cualquier tecla para continuar..."
                Read-Host
            }
        } else {
            Write-Host "Error al instalar el/los paquete(s)" -ForegroundColor Red
            Write-Host ""
            Write-Host "Presiona cualquier tecla para continuar..."
            Read-Host
        }
    }
}

# Funcion para mostrar y optionalmente guardar paquetes
function Show-SavePackages {
    Clear-Screen
    Write-Host "Paquetes instalados en el entorno:" -ForegroundColor Green
    Write-Host ""
    python -m pip list
    Write-Host ""

    $saveResponse = Read-Host "Deseas guardar estos paquetes en requirements.txt? (s/n)"
    if ($saveResponse -eq "s" -or $saveResponse -eq "S") {
        Write-Host ""
        Save-Requirements
    } else {
        Write-Host ""
        Write-Host "Presiona cualquier tecla para continuar..."
        Read-Host
    }
}

# Funcion para crear/recrear entorno virtual
function New-VirtualEnvironment {
    param([string]$Action = "create")

    Clear-Screen

    if ($Action -eq "recreate" -and (Test-Path ".venv")) {
        Write-Host "Se encontro un entorno virtual existente" -ForegroundColor Yellow
        Write-Host ""
        $response = Read-Host "Deseas eliminarlo y crear uno nuevo? (s/n)"

        if ($response -eq "s" -or $response -eq "S") {
            Write-Host ""
            Write-Host "Eliminando entorno virtual existente..." -ForegroundColor Yellow
            Remove-Item -Recurse -Force ".venv" -ErrorAction SilentlyContinue
            Write-Host "Entorno virtual eliminado" -ForegroundColor Green
            Write-Host ""
        } else {
            Write-Host "Operacion cancelada" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "Presiona cualquier tecla para continuar..."
            Read-Host
            return
        }
    }

    # Detectar versiones de Python disponibles
    $pythonCommand = Get-PythonVersion

    if ($pythonCommand -eq $null) {
        Write-Host "Presiona cualquier tecla para continuar..."
        Read-Host
        return
    }

    # Crear entorno virtual
    Write-Host "Creando entorno virtual..." -ForegroundColor Yellow
    & $pythonCommand -m venv .venv

    if ($LASTEXITCODE -eq 0) {
        Write-Host "Entorno virtual creado exitosamente" -ForegroundColor Green
    } else {
        Write-Host "Error al crear el entorno virtual" -ForegroundColor Red
        Write-Host ""
        Write-Host "Presiona cualquier tecla para continuar..."
        Read-Host
        return
    }

    # Activar entorno virtual
    Write-Host ""
    Write-Host "Activando entorno virtual..." -ForegroundColor Yellow

    if (Test-Path ".venv\Scripts\Activate.ps1") {
        try {
            . ".venv\Scripts\Activate.ps1"
            Write-Host "Entorno virtual activado" -ForegroundColor Green
        } catch {
            Write-Host "Error al activar el entorno virtual" -ForegroundColor Red
            Write-Host "Solucion: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "Presiona cualquier tecla para continuar..."
            Read-Host
            return
        }
    }

    # Actualizar pip
    Write-Host ""
    Write-Host "Actualizando pip..." -ForegroundColor Yellow
    python -m pip install --upgrade pip

    if ($LASTEXITCODE -eq 0) {
        Write-Host "pip actualizado exitosamente" -ForegroundColor Green
    }

    # Instalar paquetes desde requirements.txt si existe
    if (Test-Path "requirements.txt") {
        Write-Host ""
        Write-Host "Instalando paquetes desde requirements.txt..." -ForegroundColor Yellow
        python -m pip install -r requirements.txt

        if ($LASTEXITCODE -eq 0) {
            Write-Host "Paquetes instalados exitosamente" -ForegroundColor Green
        } else {
            Write-Host "Algunos paquetes no se pudieron instalar" -ForegroundColor Yellow
        }
    }

    Write-Host ""
    Write-Host "Configuracion completada!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Presiona cualquier tecla para continuar..."
    Read-Host
}

# Funcion para mostrar el menu principal
function Show-Menu {
    Clear-Screen

    # Mostrar estado del entorno virtual
    if (Test-Path ".venv") {
        $venvVersion = Get-VenvPythonVersion
        $versionText = if ($venvVersion) { " ($venvVersion)" } else { "" }

        Write-Host "Estado: Entorno virtual disponible$versionText" -ForegroundColor Green
        if ($env:VIRTUAL_ENV) {
            Write-Host "Estado: Entorno virtual ACTIVO" -ForegroundColor Green
        } else {
            Write-Host "Estado: Entorno virtual INACTIVO" -ForegroundColor Yellow
        }
    } else {
        Write-Host "Estado: Sin entorno virtual" -ForegroundColor Red
    }

    Write-Host ""
    Write-Host "Opciones disponibles:" -ForegroundColor White
    Write-Host "   1. Crear/Recrear entorno virtual" -ForegroundColor White
    Write-Host "   2. Ejecutar main.py" -ForegroundColor White
    Write-Host "   3. Instalar paquete nuevo" -ForegroundColor White
    Write-Host "   4. Mostrar/Guardar paquetes instalados" -ForegroundColor White
    Write-Host "   0. Salir y cerrar ventana" -ForegroundColor White
    Write-Host "===========================================" -ForegroundColor Cyan
}

# Inicio del script
Clear-Screen

# Verificar si Python esta instalado
try {
    $pythonVersion = python --version 2>&1
    Write-Host "Python detectado: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "Error: Python no esta instalado o no esta en el PATH" -ForegroundColor Red
    Write-Host "Instala Python desde https://python.org y asegurate de marcar 'Add to PATH'" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Presiona cualquier tecla para salir..."
    Read-Host
    exit
}

Write-Host ""

# Gestion inicial del entorno virtual
if (-Not (Test-Path ".venv")) {
    Write-Host "No se encontro un entorno virtual en este proyecto" -ForegroundColor Yellow
    Write-Host ""
    $createVenv = Read-Host "Deseas crear un entorno virtual ahora? (s/n)"

    if ($createVenv -eq "s" -or $createVenv -eq "S") {
        Write-Host ""
        New-VirtualEnvironment -Action "create"
    } else {
        Write-Host ""
        Write-Host "Presiona cualquier tecla para continuar..."
        Read-Host
    }
} else {
    # Activar automaticamente el entorno virtual existente
    if (-not $env:VIRTUAL_ENV) {
        try {
            . ".venv\Scripts\Activate.ps1"
            Write-Host "Entorno virtual activado automaticamente" -ForegroundColor Green
        } catch {
            Write-Host "No se pudo activar el entorno virtual automaticamente" -ForegroundColor Yellow
        }
    }
}

# Bucle principal del menu
while ($true) {
    Show-Menu
    Write-Host ""
    $opcion = Read-Host "Selecciona una opcion (0-4)"

    switch ($opcion) {
        "1" {
            New-VirtualEnvironment -Action "recreate"
        }
        "2" {
            Clear-Screen
            if (Test-Path "main.py") {
                Write-Host "Ejecutando main.py..." -ForegroundColor Green
                Write-Host ""
                python main.py
                Write-Host ""
                Write-Host "Ejecucion completada" -ForegroundColor Green
            } else {
                Write-Host "No se encontro el archivo main.py" -ForegroundColor Red
            }
            Write-Host ""
            Write-Host "Presiona cualquier tecla para continuar..."
            Read-Host
        }
        "3" {
            Install-Packages
        }
        "4" {
            Show-SavePackages
        }
        "0" {
            Clear-Screen
            Write-Host "Cerrando gestor y ventana..." -ForegroundColor Green
            Write-Host ""
            Start-Sleep -Seconds 1
            exit
        }
        default {
            Clear-Screen
            Write-Host "Opcion no valida. Por favor selecciona: 1, 2, 3, 4 o 0" -ForegroundColor Red
            Write-Host ""
            Write-Host "Presiona cualquier tecla para continuar..."
            Read-Host
        }
    }
}
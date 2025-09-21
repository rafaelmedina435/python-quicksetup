# Complete management script for Python projects
# Handles configuration, activation and virtual environment administration
#
# Authors: rafaelmedina435, Claude (Anthropic)

# Function to clear the screen
function Clear-Screen {
    Clear-Host
    Write-Host "Python Virtual Environment Manager" -ForegroundColor Cyan
    Write-Host "===========================================" -ForegroundColor Cyan
    Write-Host ""
}

# Function to get Python version from virtual environment
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
            # Ignore errors
        }
    }
    return $null
}

# Enhanced function to detect Python versions
function Get-PythonVersion {
    Write-Host "Detecting available Python versions..." -ForegroundColor Yellow
    Write-Host ""

    $pythonVersions = @()

    # Method 1: Use Windows py launcher
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

    # Method 2: Search directly in common Windows directories
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
                    # Ignore errors
                }
            }
        }
    }

    # Method 3: Use traditional commands in PATH
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
                # Ignore errors silently
            }
        }
    }

    if ($pythonVersions.Count -eq 0) {
        Write-Host "No Python versions found installed" -ForegroundColor Red
        Write-Host "Install Python from https://python.org" -ForegroundColor Yellow
        return $null
    } elseif ($pythonVersions.Count -eq 1) {
        Write-Host "Found one version: $($pythonVersions[0].Version)" -ForegroundColor Green
        Write-Host ""
        return $pythonVersions[0].Command
    } else {
        Write-Host "Found multiple Python versions:" -ForegroundColor Green
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
            $selection = Read-Host "Select a version (1-$($pythonVersions.Count))"
            try {
                $selectionNum = [int]$selection - 1
            } catch {
                $selectionNum = -1
            }

            if ($selectionNum -lt 0 -or $selectionNum -ge $pythonVersions.Count) {
                Write-Host "Invalid option. Try again." -ForegroundColor Red
            }
        } while ($selectionNum -lt 0 -or $selectionNum -ge $pythonVersions.Count)

        Write-Host "Using: $($pythonVersions[$selectionNum].Version)" -ForegroundColor Green
        Write-Host ""
        return $pythonVersions[$selectionNum].Command
    }
}

# Function to save requirements.txt
function Save-Requirements {
    Write-Host "Saving dependencies to requirements.txt..." -ForegroundColor Yellow

    try {
        python -m pip freeze > ./requirements.txt
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Dependencies saved successfully to requirements.txt" -ForegroundColor Green
        } else {
            Write-Host "Error saving dependencies" -ForegroundColor Red
        }
    } catch {
        Write-Host "Error executing pip freeze" -ForegroundColor Red
    }

    Write-Host ""
    Write-Host "Press any key to continue..."
    Read-Host
}

# Function to install multiple packages
function Install-Packages {
    Clear-Screen
    Write-Host "Install Packages" -ForegroundColor Cyan
    Write-Host "===========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "You can install one or several packages separated by spaces" -ForegroundColor Yellow
    Write-Host "Example: pandas numpy requests" -ForegroundColor Green
    Write-Host "Example: sqlalchemy" -ForegroundColor Green
    Write-Host ""

    $packages = Read-Host "Package name(s) to install"
    if ($packages) {
        Write-Host ""
        Write-Host "Installing: $packages" -ForegroundColor Yellow

        # Separate packages by spaces and use correct syntax for pip
        $packageList = $packages -split '\s+' | Where-Object { $_.Trim() -ne "" }
        $installCommand = "python -m pip install " + ($packageList -join " ")

        Invoke-Expression $installCommand

        if ($LASTEXITCODE -eq 0) {
            Write-Host "Package(s) installed successfully" -ForegroundColor Green
            Write-Host ""

            $saveResponse = Read-Host "Do you want to save these packages to requirements.txt? (y/n)"
            if ($saveResponse -eq "y" -or $saveResponse -eq "Y") {
                Write-Host ""
                Save-Requirements
            } else {
                Write-Host ""
                Write-Host "Package(s) installed but not saved to requirements.txt" -ForegroundColor Yellow
                Write-Host ""
                Write-Host "Press any key to continue..."
                Read-Host
            }
        } else {
            Write-Host "Error installing package(s)" -ForegroundColor Red
            Write-Host ""
            Write-Host "Press any key to continue..."
            Read-Host
        }
    }
}

# Function to show and optionally save packages
function Show-SavePackages {
    Clear-Screen
    Write-Host "Packages installed in the environment:" -ForegroundColor Green
    Write-Host ""
    python -m pip list
    Write-Host ""

    $saveResponse = Read-Host "Do you want to save these packages to requirements.txt? (y/n)"
    if ($saveResponse -eq "y" -or $saveResponse -eq "Y") {
        Write-Host ""
        Save-Requirements
    } else {
        Write-Host ""
        Write-Host "Press any key to continue..."
        Read-Host
    }
}

# Function to create/recreate virtual environment
function New-VirtualEnvironment {
    param([string]$Action = "create")

    Clear-Screen

    if ($Action -eq "recreate" -and (Test-Path ".venv")) {
        Write-Host "Found an existing virtual environment" -ForegroundColor Yellow
        Write-Host ""
        $response = Read-Host "Do you want to delete it and create a new one? (y/n)"

        if ($response -eq "y" -or $response -eq "Y") {
            Write-Host ""
            Write-Host "Removing existing virtual environment..." -ForegroundColor Yellow
            Remove-Item -Recurse -Force ".venv" -ErrorAction SilentlyContinue
            Write-Host "Virtual environment removed" -ForegroundColor Green
            Write-Host ""
        } else {
            Write-Host "Operation cancelled" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "Press any key to continue..."
            Read-Host
            return
        }
    }

    # Detect available Python versions
    $pythonCommand = Get-PythonVersion

    if ($pythonCommand -eq $null) {
        Write-Host "Press any key to continue..."
        Read-Host
        return
    }

    # Create virtual environment
    Write-Host "Creating virtual environment..." -ForegroundColor Yellow
    & $pythonCommand -m venv .venv

    if ($LASTEXITCODE -eq 0) {
        Write-Host "Virtual environment created successfully" -ForegroundColor Green
    } else {
        Write-Host "Error creating virtual environment" -ForegroundColor Red
        Write-Host ""
        Write-Host "Press any key to continue..."
        Read-Host
        return
    }

    # Activate virtual environment
    Write-Host ""
    Write-Host "Activating virtual environment..." -ForegroundColor Yellow

    if (Test-Path ".venv\Scripts\Activate.ps1") {
        try {
            . ".venv\Scripts\Activate.ps1"
            Write-Host "Virtual environment activated" -ForegroundColor Green
        } catch {
            Write-Host "Error activating virtual environment" -ForegroundColor Red
            Write-Host "Solution: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "Press any key to continue..."
            Read-Host
            return
        }
    }

    # Update pip
    Write-Host ""
    Write-Host "Updating pip..." -ForegroundColor Yellow
    python -m pip install --upgrade pip

    if ($LASTEXITCODE -eq 0) {
        Write-Host "pip updated successfully" -ForegroundColor Green
    }

    # Install packages from requirements.txt if it exists
    if (Test-Path "requirements.txt") {
        Write-Host ""
        Write-Host "Installing packages from requirements.txt..." -ForegroundColor Yellow
        python -m pip install -r requirements.txt

        if ($LASTEXITCODE -eq 0) {
            Write-Host "Packages installed successfully" -ForegroundColor Green
        } else {
            Write-Host "Some packages could not be installed" -ForegroundColor Yellow
        }
    }

    Write-Host ""
    Write-Host "Setup completed!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Press any key to continue..."
    Read-Host
}

# Function to show the main menu
function Show-Menu {
    Clear-Screen

    # Show virtual environment status
    if (Test-Path ".venv") {
        $venvVersion = Get-VenvPythonVersion
        $versionText = if ($venvVersion) { " ($venvVersion)" } else { "" }

        Write-Host "Status: Virtual environment available$versionText" -ForegroundColor Green
        if ($env:VIRTUAL_ENV) {
            Write-Host "Status: Virtual environment ACTIVE" -ForegroundColor Green
        } else {
            Write-Host "Status: Virtual environment INACTIVE" -ForegroundColor Yellow
        }
    } else {
        Write-Host "Status: No virtual environment" -ForegroundColor Red
    }

    Write-Host ""
    Write-Host "Available options:" -ForegroundColor White
    Write-Host "   1. Create/Recreate virtual environment" -ForegroundColor White
    Write-Host "   2. Run main.py" -ForegroundColor White
    Write-Host "   3. Install new package" -ForegroundColor White
    Write-Host "   4. Show/Save installed packages" -ForegroundColor White
    Write-Host "   0. Exit and close window" -ForegroundColor White
    Write-Host "===========================================" -ForegroundColor Cyan
}

# Start of script
Clear-Screen

# Check if Python is installed
try {
    $pythonVersion = python --version 2>&1
    Write-Host "Python detected: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "Error: Python is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Install Python from https://python.org and make sure to check 'Add to PATH'" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Press any key to exit..."
    Read-Host
    exit
}

Write-Host ""

# Initial virtual environment management
if (-Not (Test-Path ".venv")) {
    Write-Host "No virtual environment found in this project" -ForegroundColor Yellow
    Write-Host ""
    $createVenv = Read-Host "Do you want to create a virtual environment now? (y/n)"

    if ($createVenv -eq "y" -or $createVenv -eq "Y") {
        Write-Host ""
        New-VirtualEnvironment -Action "create"
    } else {
        Write-Host ""
        Write-Host "Press any key to continue..."
        Read-Host
    }
} else {
    # Automatically activate existing virtual environment
    if (-not $env:VIRTUAL_ENV) {
        try {
            . ".venv\Scripts\Activate.ps1"
            Write-Host "Virtual environment activated automatically" -ForegroundColor Green
        } catch {
            Write-Host "Could not activate virtual environment automatically" -ForegroundColor Yellow
        }
    }
}

# Main menu loop
while ($true) {
    Show-Menu
    Write-Host ""
    $option = Read-Host "Select an option (0-4)"

    switch ($option) {
        "1" {
            New-VirtualEnvironment -Action "recreate"
        }
        "2" {
            Clear-Screen
            if (Test-Path "main.py") {
                Write-Host "Running main.py..." -ForegroundColor Green
                Write-Host ""
                python main.py
                Write-Host ""
                Write-Host "Execution completed" -ForegroundColor Green
            } else {
                Write-Host "main.py file not found" -ForegroundColor Red
            }
            Write-Host ""
            Write-Host "Press any key to continue..."
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
            Write-Host "Closing manager and window..." -ForegroundColor Green
            Write-Host ""
            Start-Sleep -Seconds 1
            exit
        }
        default {
            Clear-Screen
            Write-Host "Invalid option. Please select: 1, 2, 3, 4 or 0" -ForegroundColor Red
            Write-Host ""
            Write-Host "Press any key to continue..."
            Read-Host
        }
    }
}
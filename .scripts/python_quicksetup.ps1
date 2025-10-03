# Python Quick Setup
#
# Powered by: rafaelmedina435 & Claude (Anthropic)
# Date: september 2025
# Version: 1.0

# CONFIGURACION DE PIP - Modifica estos valores segun tus necesidades
# PIP SETTINGS - Modify these paths according to your needs
$urlHost = ""                    # Ejemplo: "https://tu-servidor.com/simple/"
$trustedHost = ""               # Ejemplo: "tu-servidor.com"

# CONFIGURACION DE CARPETAS - Modifica estas rutas segun tus necesidades
# FOLDER CONFIGURATION – Modify these paths according to your needs
$pythonProjectsFolder = "C:\python_project"  # Carpeta donde se crearan los proyectos

# CONFIGURACION DE IDIOMA - Auto-deteccion basada en Windows
# LANGUAGE CONFIGURATION – Auto-detection based on Windows
# Forzar idioma: "es" para espanol, "en" para ingles, "" para auto-detectar
# Force language: "es" for Spanish, "en" for English, "" for auto-detect
$forceLanguage = ""
# Si las variables estan vacias, se usaran los valores por defecto de Python
# If the variables are empty, Python's default values will be used

# SISTEMA DE IDIOMAS - Detectar idioma del sistema
# LANGUAGE SYSTEM - Detect system language

function Get-SystemLanguage {
    if ($forceLanguage -ne "") {
        return $forceLanguage
    }

    try {
        return (Get-UICulture).TwoLetterISOLanguageName
    }
    catch {
        return "en"  # Fallback a ingles
    }
}

$currentLanguage = Get-SystemLanguage

# Diccionario de mensajes / Message dictionary

$messages = @{
    "es" = @{
        "title" = "=== PYTHON QUICK SETUP ==="
        "subtitle" = "Instalacion a nivel de usuario"
        "menu_1" = "1. Instalar Python"
        "menu_2" = "2. Listar versiones instaladas"
        "menu_3" = "3. Configurar espacio de trabajo"
        "menu_4" = "4. Crear entorno virtual (general)"
        "menu_5" = "5. Crear proyecto"
        "menu_6" = "6. Desinstalar Python"
        "menu_7" = "7. Cambiar idioma"
        "menu_8" = "8. Salir"
        "select_option" = "Selecciona una opcion (1-8)"
        "select_option_message" = "Selecciona una opcion"
        "invalid_option" = "Opcion no valida. Selecciona un numero del 1 al 8."
        "press_enter" = "Presiona Enter para continuar"
        "goodbye" = "Hasta luego!"
        "python_found" = "Python encontrado:"
        "python_not_found" = "Error: Python no esta instalado"
        "install_first" = "Instala Python primero usando la opcion 1"
        "completed" = "Completado"
        "error" = "Error"
        "python_versions" = "Versiones de Python disponibles:"
        "select_python" = "Selecciona la version de Python a usar"
        "python_selected" = "Python seleccionado:"
        "invalid_using_default" = "Opcion invalida. Usando Python por defecto..."
        "project_name" = "Nombre del proyecto"
        "project_type" = "Tipo de proyecto:"
        "basic_project" = "1. Proyecto basico"
        "complex_project" = "2. Proyecto complejo"
        "select_type" = "Selecciona el tipo (1-2)"
        "creating_project" = "Creando proyecto"
        "project_created" = "creado exitosamente!"
        "location" = "Ubicacion:"
        "type" = "Tipo:"
        "python_used" = "Python usado:"
        "activate_env" = "Para activar el entorno:"
        "navigate_to" = "Para navegar al proyecto:"
        "language_changed" = "Idioma cambiado a Espanol"
        "current_lang" = "Idioma actual: Espanol"
        "change_to_english" = "Cambiar a Ingles"
        "basic" = "Basico"
        "complex" = "Complejo"
        "install_python" = "--- INSTALAR PYTHON ---"
        "list_versions" = "--- VERSIONES DE PYTHON ---"
        "configure_workspace" = "--- CONFIGURAR ESPACIO DE TRABAJO ---"
        "create_venv_general" = "--- CREAR ENTORNO VIRTUAL (GENERAL) ---"
        "create_project" = "--- CREAR PROYECTO ---"
        "uninstall_python" = "--- DESINSTALAR PYTHON ---"
        "versions_found_system" = "Versiones de Python encontradas en el sistema:"
        "no_versions_found" = "No se encontraron versiones de Python instaladas"
        "updating_pip" = "Actualizando pip..."
        "creating_venv" = "Creando entorno virtual..."
        "installing_packages" = "Instalando paquetes..."
        "venv_configured" = "Entorno virtual configurado exitosamente!"
        "venv_location" = "Ubicacion del entorno virtual:"
        "no_python_found" = "No se encontraron versiones de Python instaladas"
        "versions_found" = "Versiones encontradas:"
        "exists_overwrite" = "ya existe. Deseas recrearlo? (s/n)"
        "recreate_question" = "ya existe. Deseas recrearlo? (s/n)"
        "deleting_previous" = "Eliminando entorno virtual anterior..."
        "creating_new" = "Creando nuevo entorno virtual..."
        "creating_folder" = "Creando carpeta:"
        "folder_exists" = "Carpeta del proyecto ya existe"
        "current_location" = "Ubicacion actual:"
        "installing_from_requirements" = "Instalando paquetes desde requirements.txt..."
        "packages_installed_from_req" = "Paquetes instalados desde requirements.txt:"
        "error_installing_requirements" = "Error instalando desde requirements.txt:"
        "requirements_not_found" = "No se encontro requirements.txt"
        "installing_basic_packages" = "Instalando paquetes basicos..."
        "generating_requirements" = "Generando requirements.txt..."
        "project_folder_exists" = "ya existe en"
        "creating_project_in" = "Creando proyecto"
        "en" = "en"
        "creating_venv_with" = "Creando entorno virtual con"
        "copying_basic_structure" = "Copiando estructura exacta del template basico..."
        "copying_complex_structure" = "Copiando estructura exacta del template complejo..."
        "template_not_found_creating" = "No se encontro template"
        "creando_estructura" = "creando estructura"
        "installing_basic_fallback" = "Instalando paquetes basicos como fallback..."
        "no_requirements_installing_basic" = "No se encontro requirements.txt, instalando paquetes basicos..."
        "pip_config" = "--- CONFIGURACION DE PIP ---"
        "workspace_config" = "Configuracion personalizada de las variables:"
        "url_configured" = "URL configurada:"
        "using_default" = "por defecto"
        "trusted_host" = "Host confiable:"
        "configure_pip_manually" = "Configurar pip manualmente:"
        "use_default_config" = "1. Usar configuracion por defecto de Python"
        "configure_manually" = "2. Configurar manualmente URL y trusted-host"
        "manual_pip_config" = "Configuracion manual de pip:"
        "url_host_prompt" = "URL del host (ej: https://tu-servidor.com/simple/) [dejar vacio para usar por defecto]"
        "trusted_host_prompt" = "Trusted host (ej: tu-servidor.com) [dejar vacio para usar por defecto]"
        "using_default_python_config" = "Usando configuracion por defecto de Python:"
        "configuring_pip" = "Configurando pip..."
        "config_applied" = "Configuracion aplicada:"
        "error_configuring_pip" = "Error al configurar pip:"
        "no_python_found_install" = "No se encontraron versiones de Python"
        "select_python_install" = "Selecciona la version de Python a instalar:"
        "python_310" = "1. Python 3.10.11 (LTS - Estable)"
        "python_311" = "2. Python 3.11.10 (Recomendada)"
        "python_312" = "3. Python 3.12.7 (Estable)"
        "python_313" = "4. Python 3.13.0 (Mas reciente)"
        "invalid_select_1_4" = "Opcion invalida. Selecciona un numero del 1 al 4."
        "will_install_user" = "Se instalara Python"
        "user_level_no_admin" = "a nivel de usuario (sin permisos de administrador)"
        "proceed_install" = "Deseas proceder con la instalacion? (s/n)"
        "downloading_python" = "Descargando Python"
        "installing_python_user" = "Instalando Python (solo para usuario actual)..."
        "python_installed_correctly" = "instalado correctamente!"
        "configuring_pip_auto" = "Configurando pip..."
        "pip_config_applied" = "Configuracion de pip aplicada"
        "could_not_configure_pip" = "No se pudo configurar pip automaticamente"
        "creating_venv_auto" = "Creando entorno virtual automaticamente..."
        "important_restart" = "IMPORTANTE: Reinicia PowerShell para usar Python desde cualquier ubicacion"
        "user_cancelled" = "El usuario cancelo la instalacion"
        "another_install" = "Otra instalacion esta en progreso"
        "platform_incompatible" = "Esta plataforma no es compatible"
        "unknown_install_error" = "Error desconocido en la instalacion"
        "install_cancelled" = "Instalacion cancelada"
        "error_download_install" = "Error en descarga/instalacion:"
        "must_specify_name" = "Error: Debes especificar un nombre para el proyecto"
        "venv_exists" = "Entorno virtual ya existe"
        "current_location_label" = "Ubicacion actual:"
        "configuring_basic" = "Configurando proyecto basico..."
        "configuring_complex" = "Configurando proyecto complejo..."
        "manually_created" = "creada manualmente"
        "invalid_creating_basic" = "Opcion invalida, creando proyecto basico"
        "installed" = "Instalado:"
        "no_python_versions_found" = "No se encontraron versiones de Python"
        "select_version_1_4" = "Selecciona una version (1-4)"
        "will_install_user_level" = "Se instalara Python"
        "user_level_no_admin_perms" = "a nivel de usuario (sin permisos de administrador)"
        "proceed_installation" = "Deseas proceder con la instalacion? (s/n)"
        "downloading" = "Descargando"
        "installing_user_only" = "Instalando Python (solo para usuario actual)..."
        "location_colon" = "Ubicacion:"
        "config_pip" = "Configurando pip..."
        "pip_config_applied_success" = "Configuracion de pip aplicada exitosamente"
        "could_not_config_pip_auto" = "No se pudo configurar pip automaticamente"
        "removing_previous_venv" = "Eliminando entorno virtual anterior..."
        "creating_venv_dots" = "Creando entorno virtual..."
        "venv_configured_at" = "Entorno virtual configurado en:"
        "to_activate" = "Para activar:"
        "important_restart_ps" = "IMPORTANTE: Reinicia PowerShell para usar Python desde cualquier ubicacion"
        "user_cancelled_install" = "El usuario cancelo la instalacion"
        "another_install_progress" = "Otra instalacion esta en progreso"
        "platform_not_compatible" = "Esta plataforma no es compatible"
        "unknown_error_install" = "Error desconocido en la instalacion"
        "installation_cancelled" = "Instalacion cancelada"
        "error_download_install_msg" = "Error en descarga/instalacion:"
        "invalid_option_1_4" = "Opcion invalida. Selecciona un numero del 1 al 4."
        "python_found_colon" = "Python encontrado:"
        "workspace_personal_config" = "Configuracion personalizada de las variables:"
        "url_config_colon" = "URL configurada:"
        "using_python_default_value" = "usando valor por defecto de Python"
        "trusted_host_config" = "Host confiable:"
        "trusted_host_colon" = "Host confiable:"
        "config_pip_manually" = "Configurar pip manualmente:"
        "use_python_default" = "1. Usar configuracion por defecto de Python"
        "config_manually_url" = "2. Configurar manualmente URL y trusted-host"
        "manual_pip_configuration" = "Configuracion manual de pip:"
        "using_python_default_label" = "Usando configuracion por defecto de Python:"
        "pip_successfully_applied" = "Configuracion de pip aplicada exitosamente"
        "url_label" = "URL:"
        "trusted_host_final" = "Host confiable:"
        "error_config_pip" = "Error al configurar pip:"
        "venv_location_label" = "Ubicacion del entorno virtual:"
        "creating_folder_colon" = "Creando carpeta:"
        "current_location_colon" = "Ubicacion actual:"
        "removing_previous" = "Eliminando entorno virtual anterior..."
        "creating_new_venv" = "Creando nuevo entorno virtual..."
        "req_not_found_folder" = "No se encontro requirements.txt en la carpeta del script"
        "specify_project_name" = "Error: Debes especificar un nombre para el proyecto"
        "user_level_installations" = "Instalaciones de Python a nivel de usuario:"
        "no_user_python_found" = "No se encontraron instalaciones de Python a nivel de usuario"
        "command_available" = "Comando disponible"
        "warning_remove_python" = "ADVERTENCIA: Esto eliminara Python del sistema"
        "sure_to_continue" = "Estas seguro de continuar? (s/n)"
        "searching_uninstallers" = "Buscando desinstaladores..."
        "found_uninstaller_for" = "Encontrado desinstalador para"
        "executing" = "Ejecutando:"
        "found_in_registry" = "Encontrado en registro:"
        "executing_uninstaller" = "Ejecutando desinstalador..."
        "found_package" = "Encontrado paquete:"
        "uninstalling_via_package" = "Desinstalando via Get-Package..."
        "uninstall_completed" = "Desinstalacion completada"
        "no_automatic_uninstallers" = "No se encontraron desinstaladores automaticos"
        "manual_uninstall_instructions" = "Ve a Configuracion > Aplicaciones para desinstalar manualmente"
        "search_python_apps" = "Busca 'Python' en la lista de aplicaciones"
        "uninstall_cancelled" = "Desinstalacion cancelada"
        "select_version_to_uninstall" = "Selecciona la version a desinstalar:"
        "exit_without_uninstall" = "Salir sin desinstalar"
        "set_main_python" = "Establecer Python principal en PATH"
        "select_main_python" = "Selecciona el Python que quieres establecer como principal:"
        "return_to_menu" = "Volver al menu principal"
        "python_set_as_main" = "Python establecido como principal en PATH"
        "error_setting_python" = "Error al establecer Python en PATH"
        "current_main_python" = "Python principal actual en PATH:"
        "replace_general_env" = "Quieres reemplazar el entorno virtual general con esta version? (s/n)"
        "make_main_python" = "Quieres convertirlo en el Python principal (PATH)? (s/n)"
        "create_new_project" = "Quieres crear un nuevo proyecto? (s/n)"
        "env_replaced" = "Entorno virtual general reemplazado"
        "python_set_main" = "Python establecido como principal"
        "redirect_project_flow" = "Redirigiendo al flujo de creacion de proyecto..."
        "installing_basic_pkgs" = "Instalando paquetes basicos..."
        "python_already_installed" = "Python version {0} ya esta instalado. Si gustas desinstala primero y vuelve a instalar la version que solicitas."
        "installation_skipped" = "Instalacion omitida"
        "installation_completed" = "Instalacion completada exitosamente"
        "no_previous_python_auto_path" = "No se encontraron versiones anteriores de Python. Estableciendo automaticamente como Python principal en PATH..."
        "experimental_warning" = "ADVERTENCIA: Python 3.13.0 es muy reciente (octubre 2024)"
        "experimental_warning_2" = "Algunas librerias pueden no ser compatibles todavia"
        "experimental_warning_3" = "Recomendado solo para desarrollo/testing, NO para produccion"
        "experimental_continue" = "Deseas continuar con la instalacion? (s/n)"
    }
    "en" = @{
        "title" = "=== PYTHON QUICK SETUP ==="
        "subtitle" = "User-level installation"
        "menu_1" = "1. Install Python"
        "menu_2" = "2. List installed versions"
        "menu_3" = "3. Configure workspace"
        "menu_4" = "4. Create virtual environment (general)"
        "menu_5" = "5. Create project"
        "menu_6" = "6. Uninstall Python"
        "menu_7" = "7. Change language"
        "menu_8" = "8. Exit"
        "select_option" = "Select an option (1-8)"
        "select_option_message" = "Select an option"
        "invalid_option" = "Invalid option. Select a number from 1 to 8."
        "press_enter" = "Press Enter to continue"
        "goodbye" = "Goodbye!"
        "python_found" = "Python found:"
        "python_not_found" = "Error: Python is not installed"
        "install_first" = "Install Python first using option 1"
        "completed" = "Completed"
        "error" = "Error"
        "python_versions" = "Available Python versions:"
        "select_python" = "Select the Python version to use"
        "python_selected" = "Python selected:"
        "invalid_using_default" = "Invalid option. Using default Python..."
        "project_name" = "Project name"
        "project_type" = "Project type:"
        "basic_project" = "1. Basic project"
        "complex_project" = "2. Complex project"
        "select_type" = "Select type (1-2)"
        "creating_project" = "Creating project"
        "project_created" = "created successfully!"
        "location" = "Location:"
        "type" = "Type:"
        "python_used" = "Python used:"
        "activate_env" = "To activate environment:"
        "navigate_to" = "To navigate to project:"
        "language_changed" = "Language changed to English"
        "current_lang" = "Current language: English"
        "change_to_spanish" = "Change to Spanish"
        "basic" = "Basic"
        "complex" = "Complex"
        "install_python" = "--- INSTALL PYTHON ---"
        "list_versions" = "--- PYTHON VERSIONS ---"
        "configure_workspace" = "--- CONFIGURE WORKSPACE ---"
        "create_venv_general" = "--- CREATE VIRTUAL ENVIRONMENT (GENERAL) ---"
        "create_project" = "--- CREATE PROJECT ---"
        "uninstall_python" = "--- UNINSTALL PYTHON ---"
        "versions_found_system" = "Python versions found on system:"
        "no_versions_found" = "No Python versions found installed"
        "updating_pip" = "Updating pip..."
        "creating_venv" = "Creating virtual environment..."
        "installing_packages" = "Installing packages..."
        "venv_configured" = "Virtual environment configured successfully!"
        "venv_location" = "Virtual environment location:"
        "no_python_found" = "No Python versions found installed"
        "versions_found" = "Versions found:"
        "exists_overwrite" = "already exists. Do you want to recreate it? (y/n)"
        "recreate_question" = "already exists. Do you want to recreate it? (y/n)"
        "deleting_previous" = "Removing previous virtual environment..."
        "creating_new" = "Creating new virtual environment..."
        "creating_folder" = "Creating folder:"
        "folder_exists" = "Project folder already exists"
        "current_location" = "Current location:"
        "installing_from_requirements" = "Installing packages from requirements.txt..."
        "packages_installed_from_req" = "Packages installed from requirements.txt:"
        "error_installing_requirements" = "Error installing from requirements.txt:"
        "requirements_not_found" = "requirements.txt not found"
        "installing_basic_packages" = "Installing basic packages..."
        "generating_requirements" = "Generating requirements.txt..."
        "project_folder_exists" = "already exists in"
        "creating_project_in" = "Creating project"
        "en" = "in"
        "creating_venv_with" = "Creating virtual environment with"
        "copying_basic_structure" = "Copying exact structure from basic template..."
        "copying_complex_structure" = "Copying exact structure from complex template..."
        "template_not_found_creating" = "Template not found, creating"
        "creando_estructura" = "structure"
        "installing_basic_fallback" = "Installing basic packages as fallback..."
        "no_requirements_installing_basic" = "requirements.txt not found, installing basic packages..."
        "pip_config" = "--- PIP CONFIGURATION ---"
        "workspace_config" = "Custom configuration from variables:"
        "url_configured" = "Configured URL:"
        "using_default" = "default"
        "trusted_host" = "Trusted host:"
        "configure_pip_manually" = "Configure pip manually:"
        "use_default_config" = "1. Use Python default configuration"
        "configure_manually" = "2. Configure URL and trusted-host manually"
        "manual_pip_config" = "Manual pip configuration:"
        "url_host_prompt" = "Host URL (e.g: https://your-server.com/simple/) [leave empty for default]"
        "trusted_host_prompt" = "Trusted host (e.g: your-server.com) [leave empty for default]"
        "using_default_python_config" = "Using Python default configuration:"
        "configuring_pip" = "Configuring pip..."
        "config_applied" = "Configuration applied:"
        "error_configuring_pip" = "Error configuring pip:"
        "no_python_found_install" = "No Python versions found"
        "select_python_install" = "Select Python version to install:"
        "python_310" = "1. Python 3.10.11 (LTS - Stable)"
        "python_311" = "2. Python 3.11.10 (Recommended)"
        "python_312" = "3. Python 3.12.7 (Stable)"
        "python_313" = "4. Python 3.13.0 (Latest)"
        "invalid_select_1_4" = "Invalid option. Select a number from 1 to 4."
        "will_install_user" = "Will install Python"
        "user_level_no_admin" = "at user level (no administrator permissions)"
        "proceed_install" = "Do you want to proceed with installation? (y/n)"
        "downloading_python" = "Downloading Python"
        "installing_python_user" = "Installing Python (current user only)..."
        "python_installed_correctly" = "installed successfully!"
        "configuring_pip_auto" = "Configuring pip..."
        "pip_config_applied" = "Pip configuration applied"
        "could_not_configure_pip" = "Could not configure pip automatically"
        "creating_venv_auto" = "Creating virtual environment automatically..."
        "important_restart" = "IMPORTANT: Restart PowerShell to use Python from any location"
        "user_cancelled" = "User cancelled installation"
        "another_install" = "Another installation is in progress"
        "platform_incompatible" = "This platform is not compatible"
        "unknown_install_error" = "Unknown installation error"
        "install_cancelled" = "Installation cancelled"
        "error_download_install" = "Error in download/installation:"
        "must_specify_name" = "Error: You must specify a project name"
        "venv_exists" = "Virtual environment already exists"
        "current_location_label" = "Current location:"
        "configuring_basic" = "Configuring basic project..."
        "configuring_complex" = "Configuring complex project..."
        "manually_created" = "created manually"
        "invalid_creating_basic" = "Invalid option, creating basic project"
        "installed" = "Installed:"
        "no_python_versions_found" = "No Python versions found"
        "select_version_1_4" = "Select a version (1-4)"
        "will_install_user_level" = "Will install Python"
        "user_level_no_admin_perms" = "at user level (no administrator permissions)"
        "proceed_installation" = "Do you want to proceed with installation? (y/n)"
        "downloading" = "Downloading"
        "installing_user_only" = "Installing Python (current user only)..."
        "location_colon" = "Location:"
        "config_pip" = "Configuring pip..."
        "pip_config_applied_success" = "Pip configuration applied successfully"
        "could_not_config_pip_auto" = "Could not configure pip automatically"
        "removing_previous_venv" = "Removing previous virtual environment..."
        "creating_venv_dots" = "Creating virtual environment..."
        "venv_configured_at" = "Virtual environment configured at:"
        "to_activate" = "To activate:"
        "important_restart_ps" = "IMPORTANT: Restart PowerShell to use Python from any location"
        "user_cancelled_install" = "User cancelled installation"
        "another_install_progress" = "Another installation is in progress"
        "platform_not_compatible" = "This platform is not compatible"
        "unknown_error_install" = "Unknown installation error"
        "installation_cancelled" = "Installation cancelled"
        "error_download_install_msg" = "Error in download/installation:"
        "invalid_option_1_4" = "Invalid option. Select a number from 1 to 4."
        "python_found_colon" = "Python found:"
        "workspace_personal_config" = "Custom configuration from variables:"
        "url_config_colon" = "Configured URL:"
        "using_python_default_value" = "using Python default value"
        "trusted_host_config" = "Trusted host:"
        "trusted_host_colon" = "Trusted host:"
        "config_pip_manually" = "Configure pip manually:"
        "use_python_default" = "1. Use Python default configuration"
        "config_manually_url" = "2. Configure URL and trusted-host manually"
        "manual_pip_configuration" = "Manual pip configuration:"
        "using_python_default_label" = "Using Python default configuration:"
        "pip_successfully_applied" = "Pip configuration applied successfully"
        "url_label" = "URL:"
        "trusted_host_final" = "Trusted host:"
        "error_config_pip" = "Error configuring pip:"
        "venv_location_label" = "Virtual environment location:"
        "creating_folder_colon" = "Creating folder:"
        "current_location_colon" = "Current location:"
        "removing_previous" = "Removing previous virtual environment..."
        "creating_new_venv" = "Creating new virtual environment..."
        "req_not_found_folder" = "requirements.txt not found in script folder"
        "specify_project_name" = "Error: You must specify a project name"
        "user_level_installations" = "User-level Python installations:"
        "no_user_python_found" = "No Python installations found at user level"
        "command_available" = "Command available"
        "warning_remove_python" = "WARNING: This will remove Python from the system"
        "sure_to_continue" = "Are you sure you want to continue? (y/n)"
        "searching_uninstallers" = "Searching for uninstallers..."
        "found_uninstaller_for" = "Found uninstaller for"
        "executing" = "Executing:"
        "found_in_registry" = "Found in registry:"
        "executing_uninstaller" = "Executing uninstaller..."
        "found_package" = "Found package:"
        "uninstalling_via_package" = "Uninstalling via Get-Package..."
        "uninstall_completed" = "Uninstall completed"
        "no_automatic_uninstallers" = "No automatic uninstallers found"
        "manual_uninstall_instructions" = "Go to Settings > Apps to uninstall manually"
        "search_python_apps" = "Search for 'Python' in the app list"
        "uninstall_cancelled" = "Uninstall cancelled"
        "select_version_to_uninstall" = "Select version to uninstall:"
        "exit_without_uninstall" = "Exit without uninstalling"
        "set_main_python" = "Set main Python in PATH"
        "select_main_python" = "Select the Python you want to set as main:"
        "return_to_menu" = "Return to main menu"
        "python_set_as_main" = "Python set as main in PATH"
        "error_setting_python" = "Error setting Python in PATH"
        "current_main_python" = "Current main Python in PATH:"
        "replace_general_env" = "Do you want to replace the general virtual environment with this version? (y/n)"
        "make_main_python" = "Do you want to make it the main Python (PATH)? (y/n)"
        "create_new_project" = "Do you want to create a new project? (y/n)"
        "env_replaced" = "General virtual environment replaced"
        "python_set_main" = "Python set as main"
        "redirect_project_flow" = "Redirecting to project creation flow..."
        "installing_basic_pkgs" = "Installing basic packages..."
        "python_already_installed" = "Python version {0} is already installed. Please uninstall first and then reinstall the version you request."
        "installation_skipped" = "Installation skipped"
        "installation_completed" = "Installation completed successfully"
        "no_previous_python_auto_path" = "No previous Python versions found. Automatically setting as main Python in PATH..."
        "experimental_warning" = "WARNING: Python 3.13.0 is very recent (October 2024)"
        "experimental_warning_2" = "Some libraries may not be compatible yet"
        "experimental_warning_3" = "Recommended only for development/testing, NOT for production"
        "experimental_continue" = "Do you want to continue with installation? (y/n)"
    }
}

# Funcion para obtener texto localizado / Function to retrieve localized text
function Get-LocalizedText {
    param([string]$key)

    if ($messages[$currentLanguage].ContainsKey($key)) {
        return $messages[$currentLanguage][$key]
    } else {
        # Fallback a ingles si no encuentra la clave
        # Fallback to English if the key is not found
        if ($messages["en"].ContainsKey($key)) {
            return $messages["en"][$key]
        } else {
            return $key  # Último fallback / Last fallback
        }
    }
}

Write-Host (Get-LocalizedText "title") -ForegroundColor Cyan
Write-Host (Get-LocalizedText "subtitle") -ForegroundColor Gray
Write-Host ""

# Funcion helper para detectar versiones de Python disponibles
# Helper function to detect available Python versions
function Get-AvailablePythonVersions {
    $foundVersions = @()

    # Buscar en comandos del sistema // Search in system commands
    $commands = @("python", "python3", "py")
    foreach ($cmd in $commands) {
        try {
            $version = & $cmd --version 2>$null
            if ($version) {
                $commandPath = (Get-Command $cmd -ErrorAction SilentlyContinue).Source
                $foundVersions += @{
                    'command' = $cmd
                    'version' = $version
                    'path' = $commandPath
                    'display' = "$cmd : $version"
                }
            }
        }
        catch { }
    }

    # Buscar en carpetas de instalacion // Search in installation folders
    $paths = @(
        "$env:LOCALAPPDATA\Programs\Python\Python*\python.exe",
        "$env:ProgramFiles\Python*\python.exe",
        "$env:ProgramFiles(x86)\Python*\python.exe"
    )

    foreach ($path in $paths) {
        try {
            $files = Get-ChildItem -Path $path -ErrorAction SilentlyContinue
            foreach ($file in $files) {
                try {
                    $version = & $file.FullName --version 2>$null
                    if ($version) {
                        $foundVersions += @{
                            'command' = $file.FullName
                            'version' = $version
                            'path' = $file.FullName
                            'display' = "$(Get-LocalizedText "installed") $version ($($file.FullName))"
                        }
                    }
                }
                catch { }
            }
        }
        catch { }
    }

    return $foundVersions
}

# Variable para manejar redireccion / Variable to handle redirection
$script:redirectToProject = $false

# Menu principal / Main menu
do {
    # Manejar redireccion al flujo de proyecto / Handle redirection to project flow
    if ($script:redirectToProject) {
        $script:redirectToProject = $false
        $option = "5"  # Ir directamente a crear proyecto / Go directly to create project
    } else {
        Write-Host (Get-LocalizedText "menu_1")
        Write-Host (Get-LocalizedText "menu_2")
        Write-Host (Get-LocalizedText "menu_3")
        Write-Host (Get-LocalizedText "menu_4")
        Write-Host (Get-LocalizedText "menu_5")
        Write-Host (Get-LocalizedText "menu_6")
        Write-Host (Get-LocalizedText "menu_7")
        Write-Host (Get-LocalizedText "menu_8")
        Write-Host ""
        $option = Read-Host (Get-LocalizedText "select_option")
    }

    switch ($option) {
        "1" {
            Write-Host "`n$(Get-LocalizedText "install_python")" -ForegroundColor Yellow
            
            # Listar versiones existentes primero / Enumerate existing versions first
            Write-Host "`n$(Get-LocalizedText "versions_found_system")"
            $foundVersions = @()
            
            # Buscar Python en comandos / Search in system Python commands
            $commands = @("python", "python3", "py")
            foreach ($cmd in $commands) {
                try {
                    $version = & $cmd --version 2>$null
                    if ($version) {
                        $foundVersions += "$cmd : $version"
                        Write-Host "  $cmd : $version" -ForegroundColor White
                    }
                }
                catch { }
            }
            
            # Buscar en carpetas comunes / Search in common folders
            $paths = @(
                "$env:LOCALAPPDATA\Programs\Python\Python*\python.exe",
                "$env:ProgramFiles\Python*\python.exe"
            )
            
            foreach ($path in $paths) {
                try {
                    $files = Get-ChildItem -Path $path -ErrorAction SilentlyContinue
                    foreach ($file in $files) {
                        try {
                            $version = & $file.FullName --version 2>$null
                            if ($version) {
                                $foundVersions += "$(Get-LocalizedText "installed") $version"
                                Write-Host "  $(Get-LocalizedText "installed") $version" -ForegroundColor White
                            }
                        }
                        catch { }
                    }
                }
                catch { }
            }
            
            if ($foundVersions.Count -eq 0) {
                Write-Host "  $(Get-LocalizedText "no_python_versions_found")" -ForegroundColor Red
            }
            
            # ============================================================
            # VERSIONES DE PYTHON - Lectura desde JSON o Hardcodeadas
            # Intenta leer desde python-versions.json primero
            # Si falla, usa versiones hardcodeadas como fallback
            # ============================================================

            # Intentar leer versiones desde JSON
            $jsonPath = Join-Path $PSScriptRoot "python-versions.json"
            $pythonVersions = @{}
            $useJsonVersions = $false

            if (Test-Path $jsonPath) {
                try {
                    $jsonContent = Get-Content $jsonPath -Raw -ErrorAction Stop | ConvertFrom-Json

                    # Convertir JSON a hashtable de PowerShell
                    foreach ($key in $jsonContent.versions.PSObject.Properties.Name) {
                        $ver = $jsonContent.versions.$key
                        $pythonVersions[$key] = @{
                            "version" = $ver.version
                            "url" = $ver.url
                            "folder" = $ver.folder
                            "status" = $ver.status
                            "label_es" = $ver.label_es
                            "label_en" = $ver.label_en
                            "eol" = $ver.eol
                            "warning" = $ver.warning
                        }
                    }
                    $useJsonVersions = $true
                    Write-Host "Versiones cargadas desde python-versions.json" -ForegroundColor Green
                }
                catch {
                    Write-Host "Error leyendo python-versions.json, usando versiones hardcodeadas" -ForegroundColor Yellow
                }
            }

            # Fallback: Versiones hardcodeadas si JSON no está disponible
            if (-not $useJsonVersions) {
                # ============================================================
                # VERSIONES FIJAS PARA ESTANDARIZACIÓN (FALLBACK)
                # Estas versiones NO se actualizan automáticamente.
                # Para garantizar que todas las máquinas tengan la misma versión,
                # solo actualizar manualmente cuando el equipo lo acuerde.
                # Última revisión: 2024-10-01
                # ============================================================
                $pythonVersions = @{
                    "1" = @{
                        "version" = "3.11.9"
                        "url" = "https://www.python.org/ftp/python/3.11.9/python-3.11.9-amd64.exe"
                        "folder" = "Python311"
                        "status" = "recommended"
                        "label_es" = "Recomendada - Producción estable (EOL: Oct 2027)"
                        "label_en" = "Recommended - Stable production (EOL: Oct 2027)"
                        "eol" = "2027-10-31"
                        "warning" = $false
                    }
                    "2" = @{
                        "version" = "3.12.7"
                        "url" = "https://www.python.org/ftp/python/3.12.7/python-3.12.7-amd64.exe"
                        "folder" = "Python312"
                        "status" = "stable"
                        "label_es" = "Moderna - Estable (EOL: Oct 2028)"
                        "label_en" = "Modern - Stable (EOL: Oct 2028)"
                        "eol" = "2028-10-31"
                        "warning" = $false
                    }
                    "3" = @{
                        "version" = "3.10.11"
                        "url" = "https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe"
                        "folder" = "Python310"
                        "status" = "mature"
                        "label_es" = "Madura - Compatibilidad legacy (EOL: Oct 2026)"
                        "label_en" = "Mature - Legacy compatible (EOL: Oct 2026)"
                        "eol" = "2026-10-31"
                        "warning" = $false
                    }
                    "4" = @{
                        "version" = "3.13.0"
                        "url" = "https://www.python.org/ftp/python/3.13.0/python-3.13.0-amd64.exe"
                        "folder" = "Python313"
                        "status" = "experimental"
                        "label_es" = "Experimental - Más reciente (EOL: Oct 2029)"
                        "label_en" = "Experimental - Latest (EOL: Oct 2029)"
                        "eol" = "2029-10-31"
                        "warning" = $true
                    }
                }
            }

            Write-Host ""
            Write-Host (Get-LocalizedText "select_python_install")

            # Mostrar versiones dinamicamente / Show versions dynamically
            foreach ($key in ($pythonVersions.Keys | Sort-Object)) {
                $pyVersion = $pythonVersions[$key]
                $label = if ($currentLanguage -eq "es") { $pyVersion.label_es } else { $pyVersion.label_en }
                Write-Host "$key. Python $($pyVersion.version) ($label)"
            }

            Write-Host ""
            $versionChoice = Read-Host (Get-LocalizedText "select_version_1_4")

            if ($pythonVersions.ContainsKey($versionChoice)) {
                $selectedPython = $pythonVersions[$versionChoice]

                # Mostrar advertencia si es una version experimental
                # Show warning if it's an experimental version
                if ($selectedPython.ContainsKey("warning") -and $selectedPython.warning) {
                    Write-Host "`n$(Get-LocalizedText "experimental_warning")" -ForegroundColor Yellow
                    Write-Host "$(Get-LocalizedText "experimental_warning_2")" -ForegroundColor Yellow
                    Write-Host "$(Get-LocalizedText "experimental_warning_3")" -ForegroundColor Red
                    Write-Host ""
                    $continueExperimental = Read-Host "$(Get-LocalizedText "experimental_continue")"
                    if ($continueExperimental -ne "s" -and $continueExperimental -ne "S" -and $continueExperimental -ne "y" -and $continueExperimental -ne "Y") {
                        Write-Host "$(Get-LocalizedText "installation_cancelled")" -ForegroundColor Yellow
                        Read-Host "`n$(Get-LocalizedText "press_enter")"
                        Clear-Host
                        continue
                    }
                }

                # Verificar si Python ya esta instalado / Check if Python is already installed
                $installDir = "$env:LOCALAPPDATA\Programs\Python\$($selectedPython.folder)"
                $pythonExePath = "$installDir\python.exe"

                if (Test-Path $pythonExePath) {
                    # Verificar version instalada / Verify installed version
                    try {
                        $installedVersion = & $pythonExePath --version 2>$null
                        if ($installedVersion -and $installedVersion -match $selectedPython.version) {
                            $messageFormatted = (Get-LocalizedText "python_already_installed") -f $selectedPython.version
                            Write-Host "`n$messageFormatted" -ForegroundColor Yellow
                            Write-Host "$(Get-LocalizedText "installation_skipped")" -ForegroundColor Gray
                            Read-Host "`n$(Get-LocalizedText "press_enter")"
                            Clear-Host
                            continue
                        }
                    }
                    catch { }
                }

                Write-Host ""
                Write-Host "$(Get-LocalizedText "will_install_user_level") $($selectedPython.version) $(Get-LocalizedText "user_level_no_admin_perms")"
                $continue = Read-Host "$(Get-LocalizedText "proceed_installation")"

                if ($continue -eq "s" -or $continue -eq "S" -or $continue -eq "y" -or $continue -eq "Y") {
                    # Descargar Python seleccionado / Download selected Python version
                    $url = $selectedPython.url
                    $installerFile = "$env:TEMP\python-installer.exe"

                try {
                    # Validar que la URL no este vacia / Validate that URL is not empty
                    if ([string]::IsNullOrEmpty($url)) {
                        throw "URL de descarga no valida / Download URL is invalid"
                    }

                    Write-Host "`n$(Get-LocalizedText "downloading") $($selectedPython.version)..." -NoNewline
                    Invoke-WebRequest -Uri $url -OutFile $installerFile -ErrorAction Stop
                    Write-Host " $(Get-LocalizedText "completed")" -ForegroundColor Green

                    Write-Host "$(Get-LocalizedText "installing_user_only")" -NoNewline

                    # Directorio de instalacion basado en la version seleccionada
                    # Installation directory based on selected version
                    $installDir = "$env:LOCALAPPDATA\Programs\Python\$($selectedPython.folder)"

                    # Argumentos especificos para instalacion de usuario / User-specific installation arguments
                    $arguments = @(
                        "/quiet"                    # Instalacion silenciosa // Silent installation
                        "InstallAllUsers=0"         # SOLO para usuario actual // User-only installation
                        "TargetDir=$installDir"     # Directorio de usuario // User directory
                        "DefaultJustForMeTargetDir=$installDir"  # Confirmar directorio // Confirm installation directory
                        "PrependPath=1"             # Agregar al PATH // Add to PATH
                        "Include_pip=1"             # Incluir pip // Include pip
                        "Include_tcltk=1"           # Incluir Tkinter // Include Tkinter
                        "Include_launcher=0"        # No incluir launcher (evita permisos) // Do not include launcher (avoids permission issues)
                        "InstallLauncherAllUsers=0" # Launcher solo para usuario // Launcher for current user only
                        "AssociateFiles=0"          # No asociar archivos // Do not associate file types
                        "Shortcuts=0"               # No crear accesos directos // Do not create shortcuts
                        "Include_doc=0"             # No incluir documentacion // Do not include documentation
                        "Include_dev=0"             # No incluir headers // Do not include headers
                        "Include_symbols=0"         # No incluir simbolos // Do not include symbols
                        "Include_test=0"            # No incluir tests // Do not include tests
                    )
                    
                    $process = Start-Process -FilePath $installerFile -ArgumentList $arguments -Wait -PassThru -NoNewWindow
                    
                    if ($process.ExitCode -eq 0) {
                        Write-Host " $(Get-LocalizedText "completed")" -ForegroundColor Green
                        Write-Host "`nPython $($selectedPython.version) $(Get-LocalizedText "python_installed_correctly")" -ForegroundColor Green
                        Write-Host "$(Get-LocalizedText "location_colon") $installDir" -ForegroundColor Cyan

                        # Definir ruta de Python para uso posterior // - Define Python path for later use

                        $pythonPath = "$installDir\python.exe"

                        # Configurar pip automaticamente si hay configuracion personalizada
                        # Automatically configure pip if custom settings are present
                        if ($urlHost -ne "" -or $trustedHost -ne "") {
                            Write-Host "`n$(Get-LocalizedText "config_pip")" -NoNewline
                            try {
                                
                                if ($urlHost -ne "") {
                                    & $pythonPath -m pip config --user set global.index $urlHost 2>$null
                                    & $pythonPath -m pip config --user set global.index-url $urlHost 2>$null
                                }
                                
                                if ($trustedHost -ne "") {
                                    & $pythonPath -m pip config --user set global.trusted-host $trustedHost 2>$null
                                }
                                
                                Write-Host " $(Get-LocalizedText "completed")" -ForegroundColor Green
                                Write-Host "$(Get-LocalizedText "pip_config_applied_success")" -ForegroundColor Cyan
                            }
                            catch {
                                Write-Host " Error" -ForegroundColor Red
                                Write-Host "$(Get-LocalizedText "could_not_config_pip_auto")" -ForegroundColor Yellow
                            }
                        }

                        # NUEVO FLUJO: Primero entorno virtual general y Python principal
                        # NEW FLOW: First virtual environment and main Python questions

                        # Preguntar si quiere reemplazar el entorno virtual general (PRIMERO)
                        # Ask if user wants to replace the general virtual environment (FIRST)
                        Write-Host ""
                        $replaceEnv = Read-Host "$(Get-LocalizedText "replace_general_env")"
                        if ($replaceEnv -eq "s" -or $replaceEnv -eq "S" -or $replaceEnv -eq "y" -or $replaceEnv -eq "Y") {
                            Write-Host "`n$(Get-LocalizedText "creating_venv_automatically")" -ForegroundColor Cyan
                            try {
                                $projectFolder = "C:\python_project"
                                if (!(Test-Path $projectFolder)) {
                                    New-Item -ItemType Directory -Path $projectFolder -Force | Out-Null
                                }

                                Set-Location $projectFolder

                                # Eliminar .venv si existe // Delete if .venv exist
                                if (Test-Path ".venv") {
                                    Write-Host (Get-LocalizedText "removing_previous_venv") -NoNewline
                                    Remove-Item ".venv" -Recurse -Force -ErrorAction SilentlyContinue
                                    Write-Host " $(Get-LocalizedText "completed")" -ForegroundColor Green
                                }

                                # Crear nuevo entorno virtual // Create a new virtual enviroment
                                Write-Host (Get-LocalizedText "creating_venv_dots") -NoNewline
                                & "$pythonPath" -m venv .venv
                                Write-Host " $(Get-LocalizedText "completed")" -ForegroundColor Green

                                # Actualizar pip en el entorno virtual // Upgrade pip in the virtual environment
                                $python = ".venv\Scripts\python.exe"
                                Write-Host (Get-LocalizedText "updating_pip")
                                & $python -m pip install --upgrade pip
                                Write-Host "$(Get-LocalizedText "completed")" -ForegroundColor Green

                                # Instalar paquetes basicos // Install basic packages
                                $packages = @("pandas", "sqlalchemy==1.4.5")
                                Write-Host (Get-LocalizedText "installing_basic_pkgs")
                                foreach ($package in $packages) {
                                    Write-Host "  Instalando $package..." -ForegroundColor Yellow
                                    & $python -m pip install $package
                                    Write-Host "  $package instalado exitosamente" -ForegroundColor Green
                                }
                                Write-Host "$(Get-LocalizedText "completed")" -ForegroundColor Green

                                Write-Host "`n$(Get-LocalizedText "env_replaced")" -ForegroundColor Green
                                Write-Host "$(Get-LocalizedText "venv_configured_at") $projectFolder" -ForegroundColor Green
                                Write-Host "$(Get-LocalizedText "to_activate") $projectFolder\.venv\Scripts\Activate.ps1" -ForegroundColor White
                            }
                            catch {
                                Write-Host " Error" -ForegroundColor Red
                                Write-Host "$(Get-LocalizedText "error"): $($_.Exception.Message)" -ForegroundColor Yellow
                            }
                        }

                        # Preguntar si quiere convertirlo en el Python principal (SEGUNDO)
                        # Ask if user wants to make it the main Python (SECOND)
                        Write-Host ""

                        # Si no habia versiones antes de la instalacion, hacerlo automaticamente
                        # If there were no versions before installation, do it automatically
                        if ($foundVersions.Count -eq 0) {
                            Write-Host "$(Get-LocalizedText "no_previous_python_auto_path")" -ForegroundColor Cyan
                            $makeMainPython = "s"
                        } else {
                            $makeMainPython = Read-Host "$(Get-LocalizedText "make_main_python")"
                        }

                        if ($makeMainPython -eq "s" -or $makeMainPython -eq "S" -or $makeMainPython -eq "y" -or $makeMainPython -eq "Y") {
                            try {
                                $pythonDir = Split-Path $pythonPath -Parent
                                $scriptsDir = Join-Path $pythonDir "Scripts"

                                # Obtener PATH actual del usuario // Get current user PATH
                                $currentUserPath = [Environment]::GetEnvironmentVariable("PATH", "User")

                                # Remover referencias anteriores de Python del PATH // Remove previous Python references from PATH
                                $pathEntries = $currentUserPath -split ";" | Where-Object { $_ -notmatch "Python\d+" }

                                # Agregar nuevo Python al inicio del PATH // Add new Python to the beginning of PATH
                                $newPath = @($pythonDir, $scriptsDir) + $pathEntries | Where-Object { $_ -ne "" } | Select-Object -Unique
                                $finalPath = $newPath -join ";"

                                # Establecer nuevo PATH // Set new PATH
                                [Environment]::SetEnvironmentVariable("PATH", $finalPath, "User")

                                Write-Host "`n$(Get-LocalizedText "python_set_main")" -ForegroundColor Green
                            }
                            catch {
                                Write-Host "`n$(Get-LocalizedText "error_setting_python")" -ForegroundColor Red
                                Write-Host "$(Get-LocalizedText "error"): $($_.Exception.Message)" -ForegroundColor Yellow
                            }
                        }

                        # Preguntar si quiere crear un nuevo proyecto (ÚLTIMO)
                        # Ask if user wants to create a new project (LAST)
                        Write-Host ""
                        $createProject = Read-Host "$(Get-LocalizedText "create_new_project")"
                        if ($createProject -eq "s" -or $createProject -eq "S" -or $createProject -eq "y" -or $createProject -eq "Y") {
                            Write-Host "`n$(Get-LocalizedText "redirect_project_flow")" -ForegroundColor Cyan
                            Start-Sleep -Seconds 2

                            # Redirigir al flujo de creacion de proyecto (opcion 5)
                            # Redirect to project creation flow (option 5)
                            $script:redirectToProject = $true
                        } else {
                            # Mensaje de instalacion completada si no quiere crear proyecto
                            # Installation completed message if user doesn't want to create project
                            Write-Host "`n$(Get-LocalizedText "installation_completed")" -ForegroundColor Green
                        }

                        Write-Host "`n$(Get-LocalizedText "important_restart_ps")" -ForegroundColor Yellow
                    } else {
                        Write-Host " Error (Codigo: $($process.ExitCode))" -ForegroundColor Red
                        
                        # Mensajes especificos de error // Specific error messages
                        switch ($process.ExitCode) {
                            1602 { Write-Host "$(Get-LocalizedText "user_cancelled_install")" -ForegroundColor Yellow }
                            1618 { Write-Host "$(Get-LocalizedText "another_install_progress")" -ForegroundColor Yellow }
                            1633 { Write-Host "$(Get-LocalizedText "platform_not_compatible")" -ForegroundColor Yellow }
                            default { Write-Host "$(Get-LocalizedText "unknown_error_install")" -ForegroundColor Yellow }
                        }
                    }
                    
                    # Limpiar archivo temporal
                    Remove-Item $installerFile -Force -ErrorAction SilentlyContinue
                }
                catch {
                    Write-Host " Error" -ForegroundColor Red
                    Write-Host "$(Get-LocalizedText "error_download_install_msg") $($_.Exception.Message)" -ForegroundColor Red
                }
                } else {
                    Write-Host "$(Get-LocalizedText "installation_cancelled")" -ForegroundColor Yellow
                }
            } else {
                Write-Host "`n$(Get-LocalizedText "invalid_option_1_4")" -ForegroundColor Red
            }
            
            Read-Host "`n$(Get-LocalizedText "press_enter")"
            Clear-Host
        }
        
        "2" {
            Write-Host "`n$(Get-LocalizedText "list_versions")" -ForegroundColor Yellow

            # Detectar todas las instalaciones de Python disponibles
            $availablePythons = Get-AvailablePythonVersions

            if ($availablePythons.Count -eq 0) {
                Write-Host "`n$(Get-LocalizedText "no_python_found")" -ForegroundColor Red
                Read-Host "`n$(Get-LocalizedText "press_enter")"
                Clear-Host
                continue
            }

            # Mostrar Python principal actual
            try {
                $currentMainPython = python --version 2>$null
                if ($currentMainPython) {
                    $currentMainPath = (Get-Command python -ErrorAction SilentlyContinue).Source
                    Write-Host "`n$(Get-LocalizedText "current_main_python")" -ForegroundColor Cyan
                    Write-Host "  $currentMainPython ($currentMainPath)" -ForegroundColor White
                }
            }
            catch { }

            # Mostrar todas las versiones encontradas
            Write-Host "`n$(Get-LocalizedText "versions_found")" -ForegroundColor Green
            for ($i = 0; $i -lt $availablePythons.Count; $i++) {
                Write-Host "  $($i + 1). $($availablePythons[$i].display)" -ForegroundColor White
            }

            # Opciones adicionales
            Write-Host "`n$(Get-LocalizedText "set_main_python")" -ForegroundColor Yellow
            Write-Host "  $($availablePythons.Count + 1). $(Get-LocalizedText "select_main_python")" -ForegroundColor Cyan
            Write-Host "  $($availablePythons.Count + 2). $(Get-LocalizedText "return_to_menu")" -ForegroundColor Gray

            Write-Host ""
            $choice = Read-Host "$(Get-LocalizedText "select_option_message") (1-$($availablePythons.Count + 2))"

            # Validar seleccion
            try {
                $selectedIndex = [int]$choice - 1

                if ($selectedIndex -eq ($availablePythons.Count + 1)) {
                    # Volver al menu principal
                    Clear-Host
                    continue
                }

                if ($selectedIndex -eq $availablePythons.Count) {
                    # Configurar Python principal
                    Write-Host "`n$(Get-LocalizedText "select_main_python")" -ForegroundColor Cyan
                    for ($i = 0; $i -lt $availablePythons.Count; $i++) {
                        Write-Host "  $($i + 1). $($availablePythons[$i].display)" -ForegroundColor White
                    }
                    Write-Host "  $($availablePythons.Count + 1). $(Get-LocalizedText "return_to_menu")" -ForegroundColor Gray

                    Write-Host ""
                    $pythonChoice = Read-Host "$(Get-LocalizedText "select_option_message") (1-$($availablePythons.Count + 1))"

                    try {
                        $pythonIndex = [int]$pythonChoice - 1

                        if ($pythonIndex -eq $availablePythons.Count) {
                            Clear-Host
                            continue
                        }

                        if ($pythonIndex -ge 0 -and $pythonIndex -lt $availablePythons.Count) {
                            $selectedPython = $availablePythons[$pythonIndex]

                            # Configurar PATH del usuario para el Python seleccionado
                            try {
                                $pythonDir = Split-Path $selectedPython.path -Parent
                                $scriptsDir = Join-Path $pythonDir "Scripts"

                                # Obtener PATH actual del usuario
                                $currentUserPath = [Environment]::GetEnvironmentVariable("PATH", "User")

                                # Remover referencias anteriores de Python del PATH
                                $pathEntries = $currentUserPath -split ";" | Where-Object { $_ -notmatch "Python\d+" }

                                # Agregar nuevo Python al inicio del PATH
                                $newPath = @($pythonDir, $scriptsDir) + $pathEntries | Where-Object { $_ -ne "" } | Select-Object -Unique
                                $finalPath = $newPath -join ";"

                                # Establecer nuevo PATH
                                [Environment]::SetEnvironmentVariable("PATH", $finalPath, "User")

                                Write-Host "`n$(Get-LocalizedText "python_set_as_main")" -ForegroundColor Green
                                Write-Host "$(Get-LocalizedText "python_selected") $($selectedPython.display)" -ForegroundColor Cyan
                                Write-Host "`n$(Get-LocalizedText "important_restart_ps")" -ForegroundColor Yellow
                            }
                            catch {
                                Write-Host "`n$(Get-LocalizedText "error_setting_python")" -ForegroundColor Red
                                Write-Host "$(Get-LocalizedText "error"): $($_.Exception.Message)" -ForegroundColor Yellow
                            }
                        } else {
                            Write-Host "`n$(Get-LocalizedText "invalid_option")" -ForegroundColor Red
                        }
                    }
                    catch {
                        Write-Host "`n$(Get-LocalizedText "invalid_option")" -ForegroundColor Red
                    }
                } else {
                    # Solo mostrar informacion de la version seleccionada
                    if ($selectedIndex -ge 0 -and $selectedIndex -lt $availablePythons.Count) {
                        $selectedPython = $availablePythons[$selectedIndex]
                        Write-Host "`n$(Get-LocalizedText "python_selected") $($selectedPython.display)" -ForegroundColor Green
                        Write-Host "$(Get-LocalizedText "location"): $($selectedPython.path)" -ForegroundColor Cyan
                    } else {
                        Write-Host "`n$(Get-LocalizedText "invalid_option")" -ForegroundColor Red
                    }
                }
            }
            catch {
                Write-Host "`n$(Get-LocalizedText "invalid_option")" -ForegroundColor Red
            }

            Read-Host "`n$(Get-LocalizedText "press_enter")"
            Clear-Host
        }

        "3" {
            Write-Host "`n$(Get-LocalizedText "configure_workspace")" -ForegroundColor Yellow
            
            # Verificar si Python existe // Check if Python exist
            try {
                $pythonVersion = python --version 2>$null
                if ($pythonVersion) {
                    Write-Host "$(Get-LocalizedText "python_found_colon") $pythonVersion" -ForegroundColor Green
                } else {
                    throw "No encontrado"
                }
            }
            catch {
                Write-Host (Get-LocalizedText "python_not_found") -ForegroundColor Red
                Write-Host (Get-LocalizedText "install_first") -ForegroundColor Yellow
                Read-Host (Get-LocalizedText "press_enter")
                Clear-Host
                continue
            }
            
            # Configuracion de pip directa // Direct PIP configuration
            Write-Host "`n$(Get-LocalizedText "pip_config")" -ForegroundColor Yellow

            # Mostrar configuracion actual // Show current configuration
            if ($urlHost -ne "" -or $trustedHost -ne "") {
                Write-Host "`n$(Get-LocalizedText "workspace_personal_config")" -ForegroundColor Cyan
                if ($urlHost -ne "") {
                    Write-Host "• $(Get-LocalizedText "url_config_colon") $urlHost" -ForegroundColor White
                } else {
                    Write-Host "• $(Get-LocalizedText "url_colon") $(Get-LocalizedText "using_python_default_value")" -ForegroundColor Gray
                }
                if ($trustedHost -ne "") {
                    Write-Host "• $(Get-LocalizedText "trusted_host_config") $trustedHost" -ForegroundColor White
                } else {
                    Write-Host "• $(Get-LocalizedText "trusted_host_colon") $(Get-LocalizedText "using_python_default_value")" -ForegroundColor Gray
                }
            } else {
                Write-Host "`n$(Get-LocalizedText "config_pip_manually")" -ForegroundColor Cyan
                Write-Host (Get-LocalizedText "use_python_default")
                Write-Host (Get-LocalizedText "config_manually_url")
                Write-Host ""
                $pipOption = Read-Host (Get-LocalizedText "select_option_message")

                if ($pipOption -eq "2") {
                    Write-Host "`n$(Get-LocalizedText "manual_pip_configuration")" -ForegroundColor Yellow
                    $customUrl = Read-Host (Get-LocalizedText "url_host_prompt")
                    $customTrustedHost = Read-Host (Get-LocalizedText "trusted_host_prompt")

                    $indexUrl = if ($customUrl -ne "") { $customUrl } else { "https://pypi.org/simple/" }
                    $trustedHostVar = if ($customTrustedHost -ne "") { $customTrustedHost } else { "pypi.org" }
                } else {
                    Write-Host "`n$(Get-LocalizedText "using_python_default_label")" -ForegroundColor Cyan
                    $indexUrl = "https://pypi.org/simple/"
                    $trustedHostVar = "pypi.org"
                }
            }

            # Si hay configuracion en variables, usarla // Use configuration from variables if available
            if ($urlHost -ne "" -or $trustedHost -ne "") {
                $indexUrl = if ($urlHost -ne "") { $urlHost } else { "https://pypi.org/simple/" }
                $trustedHostVar = if ($trustedHost -ne "") { $trustedHost } else { "pypi.org" }
            }

            Write-Host "`n$(Get-LocalizedText "configuring_pip")" -NoNewline

            try {
                # Configurar pip globalmente para el usuario // Configure pip globally for the current user
                if ($indexUrl -ne "") {
                    python -m pip config --user set global.index $indexUrl 2>$null
                    python -m pip config --user set global.index-url $indexUrl 2>$null
                }
                if ($trustedHostVar -ne "") {
                    python -m pip config --user set global.trusted-host $trustedHostVar 2>$null
                }

                Write-Host " $(Get-LocalizedText "completed")" -ForegroundColor Green
                Write-Host "`n$(Get-LocalizedText "pip_successfully_applied")" -ForegroundColor Green
                Write-Host "• $(Get-LocalizedText "url_label") $indexUrl" -ForegroundColor White
                Write-Host "• $(Get-LocalizedText "trusted_host_final") $trustedHostVar" -ForegroundColor White
            }
            catch {
                Write-Host " Error" -ForegroundColor Red
                Write-Host "$(Get-LocalizedText "error_config_pip") $($_.Exception.Message)" -ForegroundColor Red
            }

            Read-Host "`n$(Get-LocalizedText "press_enter")"
            Clear-Host
        }

        "4" {
            Write-Host "`n$(Get-LocalizedText "create_venv_general")" -ForegroundColor Yellow

            # Detectar versiones de Python disponibles // Detect available Python versions
            $availablePythons = Get-AvailablePythonVersions
            if ($availablePythons.Count -eq 0) {
                Write-Host "$(Get-LocalizedText "error"): $(Get-LocalizedText "no_python_found")" -ForegroundColor Red
                Write-Host (Get-LocalizedText "install_first") -ForegroundColor Yellow
                Read-Host (Get-LocalizedText "press_enter")
                Clear-Host
                continue
            }

            # Mostrar versiones disponibles y permitir seleccion // Display available versions and allow selection
            Write-Host "`n$(Get-LocalizedText "python_versions")" -ForegroundColor Cyan
            for ($i = 0; $i -lt $availablePythons.Count; $i++) {
                Write-Host "  $($i + 1). $($availablePythons[$i].display)" -ForegroundColor White
            }

            Write-Host ""
            $pythonChoice = Read-Host "$(Get-LocalizedText "select_python") (1-$($availablePythons.Count))"

            # Validar seleccion // Validate selection
            try {
                $selectedIndex = [int]$pythonChoice - 1
                if ($selectedIndex -lt 0 -or $selectedIndex -ge $availablePythons.Count) {
                    throw "Invalid option"
                }
                $selectedPython = $availablePythons[$selectedIndex].command
                $selectedPythonDisplay = $availablePythons[$selectedIndex].display
                Write-Host "$(Get-LocalizedText "python_selected") $selectedPythonDisplay" -ForegroundColor Green
            }
            catch {
                Write-Host (Get-LocalizedText "invalid_using_default") -ForegroundColor Yellow
                $selectedPython = "python"
                $selectedPythonDisplay = "python ($(Get-LocalizedText "using_default"))"
            }

            # Usar carpeta fija python_project // - Use fixed folder python_project
            $projectFolder = $pythonProjectsFolder
            Write-Host "`n$(Get-LocalizedText "venv_location_label") $projectFolder" -ForegroundColor Cyan

            # Crear carpeta si no existe // Change to the project directory
            if (!(Test-Path $projectFolder)) {
                Write-Host "$(Get-LocalizedText "creating_folder_colon") $projectFolder..." -NoNewline
                New-Item -ItemType Directory -Path $projectFolder -Force | Out-Null
                Write-Host " $(Get-LocalizedText "completed")" -ForegroundColor Green
            }

            # Cambiar a la carpeta del proyecto
            Set-Location $projectFolder
            Write-Host "$(Get-LocalizedText "current_location_colon") $projectFolder" -ForegroundColor Cyan

            # Crear entorno virtual // Create virtual environment
            # Eliminar .venv si existe para asegurar un entorno limpio // Delete .venv if exists to ensure clean environment
            if (Test-Path ".venv") {
                Write-Host (Get-LocalizedText "venv_exists") -ForegroundColor Yellow
                $overwrite = Read-Host (Get-LocalizedText "recreate_question")
                if ($overwrite -eq "s" -or $overwrite -eq "S" -or $overwrite -eq "y" -or $overwrite -eq "Y") {
                    Write-Host "$(Get-LocalizedText "removing_previous")" -NoNewline
                    Remove-Item ".venv" -Recurse -Force -ErrorAction SilentlyContinue
                    Write-Host " $(Get-LocalizedText "completed")" -ForegroundColor Green
                } else {
                    # Si el usuario no quiere recrear, continuar con el entorno existente
                    # If user doesn't want to recreate, continue with existing environment
                    Write-Host "$(Get-LocalizedText "venv_configured")" -ForegroundColor Green
                    Write-Host "$(Get-LocalizedText "location") $projectFolder" -ForegroundColor Cyan
                    Write-Host "$(Get-LocalizedText "python_used") $selectedPythonDisplay" -ForegroundColor Cyan
                    Write-Host "`n$(Get-LocalizedText "activate_env")"
                    Write-Host "$projectFolder\.venv\Scripts\Activate.ps1" -ForegroundColor White
                    Write-Host "`n$(Get-LocalizedText "navigate_to")"
                    Write-Host "cd `"$projectFolder`"" -ForegroundColor White

                    Read-Host "`n$(Get-LocalizedText "press_enter")"
                    Clear-Host
                    continue
                }
            }

            # Crear nuevo entorno virtual (siempre elimina primero si existia)
            Write-Host "$(Get-LocalizedText "creating_venv_with") $selectedPythonDisplay..." -NoNewline
            & $selectedPython -m venv .venv
            Write-Host " $(Get-LocalizedText "completed")" -ForegroundColor Green

            $python = ".venv\Scripts\python.exe"

            # Actualizar pip automaticamente // Automatically upgrade pip in the virtual environment
            Write-Host "$(Get-LocalizedText "updating_pip")"
            & $python -m pip install --upgrade pip
            Write-Host "$(Get-LocalizedText "completed")" -ForegroundColor Green

            # Instalar paquetes desde requirements.txt si existe // Install packages from requirements.txt if it exists
            $requirementsPath = Join-Path $PSScriptRoot "requirements.txt"
            if (Test-Path $requirementsPath) {
                Write-Host "$(Get-LocalizedText "installing_from_requirements")"
                try {
                    & $python -m pip install -r $requirementsPath
                    Write-Host "$(Get-LocalizedText "completed")" -ForegroundColor Green

                    # Mostrar paquetes instalados // Display installed packages
                    Write-Host "`n$(Get-LocalizedText "packages_installed_from_req")" -ForegroundColor Cyan
                    $installedPackages = & $python -m pip list --format=freeze | Where-Object { $_ -notmatch "^pip==" -and $_ -notmatch "^setuptools==" }
                    $installedPackages | ForEach-Object {
                        if ($_ -match "^([^=]+)==") {
                            Write-Host "• $($matches[1])" -ForegroundColor White
                        }
                    }
                }
                catch {
                    Write-Host " Error" -ForegroundColor Red
                    Write-Host "$(Get-LocalizedText "error_installing_requirements") $($_.Exception.Message)" -ForegroundColor Yellow
                }
            } else {
                Write-Host (Get-LocalizedText "req_not_found_folder") -ForegroundColor Yellow
            }

            Write-Host "`n$(Get-LocalizedText "venv_configured")" -ForegroundColor Green
            Write-Host "$(Get-LocalizedText "location") $projectFolder" -ForegroundColor Cyan
            Write-Host "$(Get-LocalizedText "python_used") $selectedPythonDisplay" -ForegroundColor Cyan
            Write-Host "`n$(Get-LocalizedText "activate_env")"
            Write-Host "$projectFolder\.venv\Scripts\Activate.ps1" -ForegroundColor White
            Write-Host "`n$(Get-LocalizedText "navigate_to")"
            Write-Host "cd `"$projectFolder`"" -ForegroundColor White

            Read-Host "`n$(Get-LocalizedText "press_enter")"
            Clear-Host
        }

        "5" {
            Write-Host "`n$(Get-LocalizedText "create_project")" -ForegroundColor Yellow

            # Detectar versiones de Python disponibles // Detect available Python versions
            $availablePythons = Get-AvailablePythonVersions
            if ($availablePythons.Count -eq 0) {
                Write-Host "$(Get-LocalizedText "error"): $(Get-LocalizedText "no_python_found")" -ForegroundColor Red
                Write-Host (Get-LocalizedText "install_first") -ForegroundColor Yellow
                Read-Host (Get-LocalizedText "press_enter")
                Clear-Host
                continue
            }

            # Mostrar versiones disponibles y permitir seleccion // Show available versions and allow selection
            Write-Host "`n$(Get-LocalizedText "python_versions")" -ForegroundColor Cyan
            for ($i = 0; $i -lt $availablePythons.Count; $i++) {
                Write-Host "  $($i + 1). $($availablePythons[$i].display)" -ForegroundColor White
            }

            Write-Host ""
            $pythonChoice = Read-Host "$(Get-LocalizedText "select_python") (1-$($availablePythons.Count))"

            # Validar seleccion // Validate selection
            try {
                $selectedIndex = [int]$pythonChoice - 1
                if ($selectedIndex -lt 0 -or $selectedIndex -ge $availablePythons.Count) {
                    throw "Opcion invalida"
                }
                $selectedPython = $availablePythons[$selectedIndex].command
                $selectedPythonDisplay = $availablePythons[$selectedIndex].display
                Write-Host "$(Get-LocalizedText "python_selected") $selectedPythonDisplay" -ForegroundColor Green
            }
            catch {
                Write-Host (Get-LocalizedText "invalid_using_default") -ForegroundColor Yellow
                $selectedPython = "python"
                $selectedPythonDisplay = "python ($(Get-LocalizedText "using_default"))"
            }

            # Solicitar nombre del proyecto // Prompt for project name
            $projectName = Read-Host "`n$(Get-LocalizedText "project_name")"
            if ($projectName -eq "") {
                Write-Host (Get-LocalizedText "specify_project_name") -ForegroundColor Red
                Read-Host (Get-LocalizedText "press_enter")
                Clear-Host
                continue
            }

            # Elegir tipo de proyecto // Choose project type
            Write-Host "`n$(Get-LocalizedText "project_type")" -ForegroundColor Cyan
            Write-Host (Get-LocalizedText "basic_project")
            Write-Host (Get-LocalizedText "complex_project")
            Write-Host ""
            $projectType = Read-Host (Get-LocalizedText "select_type")

            # Crear carpeta base de proyectos si no existe // Create base project folder if it doesn't exist
            if (!(Test-Path $pythonProjectsFolder)) {
                Write-Host "$(Get-LocalizedText "creating_folder") $pythonProjectsFolder..." -NoNewline
                New-Item -ItemType Directory -Path $pythonProjectsFolder -Force | Out-Null
                Write-Host " $(Get-LocalizedText "completed")" -ForegroundColor Green
            }

            # Crear carpeta del proyecto dentro de python_project // Create project folder inside python_project
            $projectPath = Join-Path $pythonProjectsFolder $projectName
            if (Test-Path $projectPath) {
                Write-Host "$(Get-LocalizedText "error"): La carpeta '$projectName' $(Get-LocalizedText "project_folder_exists") $pythonProjectsFolder" -ForegroundColor Red
                Read-Host "$(Get-LocalizedText "press_enter")"
                Clear-Host
                continue
            }

            Write-Host "$(Get-LocalizedText "creating_project_in") '$projectName' $(Get-LocalizedText "en") $pythonProjectsFolder..." -NoNewline
            New-Item -ItemType Directory -Path $projectPath -Force | Out-Null
            Set-Location $projectPath
            Write-Host " $(Get-LocalizedText "completed")" -ForegroundColor Green

            # Crear entorno virtual dentro del proyecto usando Python seleccionado
            # Create virtual environment inside project using selected Python
            # Eliminar .venv si existe para asegurar un entorno limpio
            # Delete .venv if exists to ensure clean environment
            if (Test-Path ".venv") {
                Write-Host "$(Get-LocalizedText "removing_previous")" -NoNewline
                Remove-Item ".venv" -Recurse -Force -ErrorAction SilentlyContinue
                Write-Host " $(Get-LocalizedText "completed")" -ForegroundColor Green
            }

            Write-Host "$(Get-LocalizedText "creating_venv_with") $selectedPythonDisplay..." -NoNewline
            & $selectedPython -m venv .venv
            Write-Host " $(Get-LocalizedText "completed")" -ForegroundColor Green

            $python = ".venv\Scripts\python.exe"
            $pip = ".venv\Scripts\pip.exe"

            # Actualizar pip // Upgrade pip in the virtual environment
            Write-Host "$(Get-LocalizedText "updating_pip")"
            & $python -m pip install --upgrade pip
            Write-Host "$(Get-LocalizedText "completed")" -ForegroundColor Green

            if ($projectType -eq "1") {
                # Proyecto basico // Basic project setup
                Write-Host "$(Get-LocalizedText "configuring_basic")" -ForegroundColor Cyan

                # Copiar estructura basica // Copy basic structure
                $basicPath = Join-Path $PSScriptRoot ".\..\python_template\$currentLanguage\basic_project"
                if (Test-Path $basicPath) {
                    Write-Host "$(Get-LocalizedText "copying_basic_structure")" -NoNewline
                    Copy-Item "$basicPath\*" -Destination . -Recurse -Force -ErrorAction SilentlyContinue
                    Write-Host " $(Get-LocalizedText "completed")" -ForegroundColor Green
                } else {
                    Write-Host "$(Get-LocalizedText "template_not_found_creating") basico, $(Get-LocalizedText "creando_estructura") basica..." -ForegroundColor Yellow
                    # Crear estructura basica manualmente como fallback
                    New-Item -ItemType Directory -Path "helpers" -Force | Out-Null

                    @"
# Proyecto: $projectName
# Tipo: Basico // Type: Basic

print("Hola desde $projectName!")
"@ | Out-File -FilePath "main.py" -Encoding UTF8

                    @"
# Helpers para $projectName

def saludo(nombre):
    return f"Hola, {nombre}!"
"@ | Out-File -FilePath "helpers\utils.py" -Encoding UTF8

                    Write-Host "Estructura basica $(Get-LocalizedText "manually_created")" -ForegroundColor Green
                }

                # Paquetes basicos para proyecto simple
                $packages = @("pandas")

            } elseif ($projectType -eq "2") {
                # Proyecto complejo
                Write-Host "$(Get-LocalizedText "configuring_complex")" -ForegroundColor Cyan

                # Copiar estructura compleja
                $complexPath = Join-Path $PSScriptRoot ".\..\python_template\$currentLanguage\complex_project"
                if (Test-Path $complexPath) {
                    Write-Host "$(Get-LocalizedText "copying_complex_structure")" -NoNewline
                    Copy-Item "$complexPath\*" -Destination . -Recurse -Force -ErrorAction SilentlyContinue
                    Write-Host " $(Get-LocalizedText "completed")" -ForegroundColor Green
                } else {
                    Write-Host "$(Get-LocalizedText "template_not_found_creating") complejo, $(Get-LocalizedText "creando_estructura") compleja..." -ForegroundColor Yellow
                    # Crear estructura compleja manualmente como fallback
                    @("data\insumos", "data\resultados", "data\logs", "notebooks", "helpers") | ForEach-Object {
                        New-Item -ItemType Directory -Path $_ -Force | Out-Null
                    }

                    @"
# Proyecto: $projectName
# Tipo: Complejo

import logging
import os

# Configurar logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def main():
    logger.info("Iniciando proyecto $projectName")
    print("Proyecto complejo: $projectName")

if __name__ == "__main__":
    main()
"@ | Out-File -FilePath "main.py" -Encoding UTF8

                    @"
# Helpers avanzados para $projectName

import logging

logger = logging.getLogger(__name__)

def procesar_datos(datos):
    logger.info("Procesando datos...")
    return datos

def exportar_resultados(result, formato="csv"):
    logger.info(f"Exportando en formato {formato}")
    return True
"@ | Out-File -FilePath "helpers\data_processor.py" -Encoding UTF8

                    Write-Host "Estructura compleja $(Get-LocalizedText "manually_created")" -ForegroundColor Green
                }

                # Paquetes avanzados para proyecto complejo
                $packages = @("pandas", "numpy", "matplotlib", "openpyxl", "jupyter")

            } else {
                Write-Host "$(Get-LocalizedText "invalid_creating_basic")" -ForegroundColor Yellow
                $packages = @("pandas")
            }

            # Instalar paquetes desde requirements.txt del proyecto si existe
            # Install packages from requirements.txt if it exists
            if (Test-Path "requirements.txt") {
                Write-Host "$(Get-LocalizedText "installing_from_requirements")..."
                try {
                    & $python -m pip install -r "requirements.txt"
                    Write-Host "$(Get-LocalizedText "completed")" -ForegroundColor Green

                    # Mostrar paquetes instalados // Display installed packages
                    Write-Host "`n$(Get-LocalizedText "packages_installed_from_req")" -ForegroundColor Cyan
                    $installedPackages = & $python -m pip list --format=freeze | Where-Object { $_ -notmatch "^pip==" -and $_ -notmatch "^setuptools==" }
                    $installedPackages | ForEach-Object {
                        if ($_ -match "^([^=]+)==") {
                            Write-Host "• $($matches[1])" -ForegroundColor White
                        }
                    }
                }
                catch {
                    Write-Host " Error" -ForegroundColor Red
                    Write-Host "$(Get-LocalizedText "error_installing_requirements") $($_.Exception.Message)" -ForegroundColor Yellow

                    # Fallback: instalar paquetes basicos manualmente
                    # Fallback: Manually install basic packages
                    Write-Host "$(Get-LocalizedText "installing_basic_fallback")"
                    if ($packages.Count -gt 0) {
                        foreach ($package in $packages) {
                            Write-Host "  Instalando $package..." -ForegroundColor Yellow
                            & $pip install $package
                            Write-Host "  $package instalado exitosamente" -ForegroundColor Green
                        }
                        Write-Host "$(Get-LocalizedText "completed")" -ForegroundColor Green
                    }
                }
            } else {
                # Si no hay requirements.txt, instalar paquetes basicos
                # If requirements.txt is missing, install basic packages
                Write-Host (Get-LocalizedText "no_requirements_installing_basic")
                if ($packages.Count -gt 0) {
                    foreach ($package in $packages) {
                        Write-Host "  Instalando $package..." -ForegroundColor Yellow
                        & $pip install $package
                        Write-Host "  $package instalado exitosamente" -ForegroundColor Green
                    }
                    Write-Host "$(Get-LocalizedText "completed")" -ForegroundColor Green
                }

                # Crear requirements.txt con los paquetes instalados // Generate requirements.txt with installed packages
                Write-Host "$(Get-LocalizedText "generating_requirements")" -NoNewline
                & $pip freeze | Out-File -FilePath "requirements.txt" -Encoding UTF8
                Write-Host " $(Get-LocalizedText "completed")" -ForegroundColor Green
            }

            Write-Host "`n$(Get-LocalizedText "creating_project") '$projectName' $(Get-LocalizedText "project_created")" -ForegroundColor Green
            Write-Host "$(Get-LocalizedText "location") $projectPath" -ForegroundColor Cyan
            Write-Host "$(Get-LocalizedText "type"): $(if ($projectType -eq '2') { Get-LocalizedText "complex" } else { Get-LocalizedText "basic" })" -ForegroundColor Cyan
            Write-Host "$(Get-LocalizedText "python_used") $selectedPythonDisplay" -ForegroundColor Cyan
            Write-Host "`n$(Get-LocalizedText "activate_env")"
            Write-Host "$projectPath\.venv\Scripts\Activate.ps1" -ForegroundColor White
            Write-Host "`n$(Get-LocalizedText "navigate_to")"
            Write-Host "cd `"$projectPath`"" -ForegroundColor White

            Read-Host "`n$(Get-LocalizedText "press_enter")"
            Clear-Host
        }

        "6" {
            Write-Host "`n--- $(Get-LocalizedText "menu_6") ---" -ForegroundColor Yellow

            # Detectar todas las instalaciones de Python disponibles
            $availablePythons = @()
            $pythonInstallations = @()

            # Buscar en directorio de usuario
            $userPath = "$env:LOCALAPPDATA\Programs\Python\Python*\python.exe"
            try {
                $userFiles = Get-ChildItem -Path $userPath -ErrorAction SilentlyContinue
                foreach ($file in $userFiles) {
                    try {
                        $version = & $file.FullName --version 2>$null
                        if ($version) {
                            $pythonFolder = Split-Path $file.DirectoryName -Leaf
                            $pythonInstallations += @{
                                'version' = $version
                                'path' = $file.FullName
                                'folder' = $pythonFolder
                                'directory' = $file.DirectoryName
                                'display' = "$version ($(Get-LocalizedText "user_level_installations"))"
                            }
                        }
                    }
                    catch { }
                }
            }
            catch { }

            # Verificar si hay comando python disponible
            try {
                $pythonCommand = python --version 2>$null
                if ($pythonCommand) {
                    $pythonInstallations += @{
                        'version' = $pythonCommand
                        'path' = (Get-Command python -ErrorAction SilentlyContinue).Source
                        'folder' = 'system'
                        'directory' = ''
                        'display' = "$pythonCommand ($(Get-LocalizedText "command_available"))"
                    }
                }
            }
            catch { }

            if ($pythonInstallations.Count -eq 0) {
                Write-Host "`n$(Get-LocalizedText "no_user_python_found")" -ForegroundColor Red
                Read-Host "`n$(Get-LocalizedText "press_enter")"
                Clear-Host
                continue
            }

            # Mostrar versiones disponibles para desinstalar
            Write-Host "`n$(Get-LocalizedText "select_version_to_uninstall")" -ForegroundColor Cyan
            for ($i = 0; $i -lt $pythonInstallations.Count; $i++) {
                Write-Host "  $($i + 1). $($pythonInstallations[$i].display)" -ForegroundColor White
            }
            Write-Host "  $($pythonInstallations.Count + 1). $(Get-LocalizedText "exit_without_uninstall")" -ForegroundColor Gray

            Write-Host ""
            $uninstallChoice = Read-Host "$(Get-LocalizedText "select_option_message") (1-$($pythonInstallations.Count + 1))"

            # Validar seleccion
            try {
                $selectedIndex = [int]$uninstallChoice - 1
                if ($selectedIndex -eq $pythonInstallations.Count) {
                    Write-Host "$(Get-LocalizedText "uninstall_cancelled")" -ForegroundColor Yellow
                    Read-Host "`n$(Get-LocalizedText "press_enter")"
                    Clear-Host
                    continue
                }

                if ($selectedIndex -lt 0 -or $selectedIndex -ge $pythonInstallations.Count) {
                    throw "Opcion invalida"
                }

                $selectedPython = $pythonInstallations[$selectedIndex]
                Write-Host "`n$(Get-LocalizedText "python_selected") $($selectedPython.display)" -ForegroundColor Green
            }
            catch {
                Write-Host "`n$(Get-LocalizedText "invalid_option")" -ForegroundColor Red
                Read-Host "`n$(Get-LocalizedText "press_enter")"
                Clear-Host
                continue
            }

            Write-Host "`n$(Get-LocalizedText "warning_remove_python")" -ForegroundColor Red
            $confirmAction = Read-Host "$(Get-LocalizedText "sure_to_continue")"

            if ($confirmAction -eq "s" -or $confirmAction -eq "S" -or $confirmAction -eq "y" -or $confirmAction -eq "Y") {
                $foundUninstaller = $false

                Write-Host "`n$(Get-LocalizedText "searching_uninstallers")" -ForegroundColor Cyan

                # Metodo 1: Buscar archivos uninstall.exe en la carpeta especifica
                if ($selectedPython.directory -ne "") {
                    $uninstallPaths = @(
                        "$($selectedPython.directory)\uninstall.exe",
                        "$($selectedPython.directory)\Uninstall.exe"
                    )

                    foreach ($path in $uninstallPaths) {
                        if (Test-Path $path) {
                            Write-Host "$(Get-LocalizedText "found_uninstaller_for") $($selectedPython.folder)" -ForegroundColor Green
                            Write-Host "$(Get-LocalizedText "executing") $(Split-Path $path -Leaf)..." -ForegroundColor Yellow
                            Start-Process -FilePath $path -Wait
                            $foundUninstaller = $true
                            break
                        }
                    }
                }

                # Metodo 2: Buscar en registro de usuario
                if (-not $foundUninstaller) {
                    try {
                        $regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*"
                        $programs = Get-ItemProperty $regPath -ErrorAction SilentlyContinue | Where-Object {
                            $_.DisplayName -like "*Python*" -and
                            $_.UninstallString -and
                            $_.DisplayName -like "*$($selectedPython.version.Split(' ')[1])*"
                        }

                        foreach ($program in $programs) {
                            if ($program.UninstallString) {
                                Write-Host "$(Get-LocalizedText "found_in_registry") $($program.DisplayName)" -ForegroundColor Green
                                Write-Host "$(Get-LocalizedText "executing_uninstaller")" -ForegroundColor Yellow

                                $uninstallCmd = $program.UninstallString
                                if ($uninstallCmd -match '"([^"]+)"') {
                                    $uninstallExe = $matches[1]
                                    Start-Process -FilePath $uninstallExe -Wait
                                    $foundUninstaller = $true
                                    break
                                }
                            }
                        }
                    }
                    catch { }
                }

                # Metodo 3: Buscar usando Get-Package
                if (-not $foundUninstaller) {
                    try {
                        $versionNum = $selectedPython.version.Split(' ')[1]
                        $packages = Get-Package -Name "*Python*" -ErrorAction SilentlyContinue | Where-Object { $_.Version -like "*$versionNum*" }

                        foreach ($package in $packages) {
                            Write-Host "$(Get-LocalizedText "found_package") $($package.Name)" -ForegroundColor Green
                            Write-Host "$(Get-LocalizedText "uninstalling_via_package")" -ForegroundColor Yellow
                            Uninstall-Package -Name $package.Name -Force -ErrorAction SilentlyContinue
                            $foundUninstaller = $true
                            break
                        }
                    }
                    catch { }
                }

                if ($foundUninstaller) {
                    Write-Host "`n$(Get-LocalizedText "uninstall_completed")" -ForegroundColor Green
                } else {
                    Write-Host "`n$(Get-LocalizedText "no_automatic_uninstallers")" -ForegroundColor Yellow
                    Write-Host "$(Get-LocalizedText "manual_uninstall_instructions")" -ForegroundColor Cyan
                    Write-Host "$(Get-LocalizedText "search_python_apps")" -ForegroundColor Cyan
                }
            } else {
                Write-Host "`n$(Get-LocalizedText "uninstall_cancelled")" -ForegroundColor Yellow
            }

            Read-Host "`n$(Get-LocalizedText "press_enter")"
            Clear-Host
        }

        "7" {
            Write-Host "`n--- CAMBIAR IDIOMA / CHANGE LANGUAGE ---" -ForegroundColor Yellow
            Write-Host (Get-LocalizedText "current_lang") -ForegroundColor Cyan
            Write-Host ""

            if ($currentLanguage -eq "es") {
                Write-Host "1. $(Get-LocalizedText "change_to_english")"
                Write-Host "2. Mantener Espanol"
            } else {
                Write-Host "1. $(Get-LocalizedText "change_to_spanish")"
                Write-Host "2. Keep English"
            }

            Write-Host ""
            $langChoice = Read-Host "Select / Selecciona (1-2)"

            if ($langChoice -eq "1") {
                if ($currentLanguage -eq "es") {
                    $currentLanguage = "en"
                    Write-Host "`n$(Get-LocalizedText "language_changed")" -ForegroundColor Green
                } else {
                    $currentLanguage = "es"
                    Write-Host "`n$(Get-LocalizedText "language_changed")" -ForegroundColor Green
                }
                Start-Sleep -Seconds 2
            }

            Clear-Host
            Write-Host (Get-LocalizedText "title") -ForegroundColor Cyan
            Write-Host (Get-LocalizedText "subtitle") -ForegroundColor Gray
            Write-Host ""
        }

        "8" {
            Write-Host "`n$(Get-LocalizedText "goodbye")" -ForegroundColor Green
        }

        default {
            Write-Host (Get-LocalizedText "invalid_option") -ForegroundColor Red
            Start-Sleep -Seconds 2
            Clear-Host
        }
    }

} while ($option -ne "8")

Write-Host "`nPython Manager Simple v1.0" -ForegroundColor Cyan
Write-Host "Powered by rafaelmedina435 & Claude" -ForegroundColor Gray
Write-Host "$(Get-LocalizedText "press_enter")" -ForegroundColor Gray
Read-Host
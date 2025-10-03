# 🐍 Python Quick Setup & Templates

> **Everything you need to start with Python professionally and without complications**
### [Visit our friendly web documentation.](https://python-quicksetup.netlify.app/)

## 🎯 What will you find here?

This repository contains **two complementary tools** that will allow you to work with Python professionally from day one:

### 🛠️ **Python Quick Setup** - Automatic installer
A script that installs and configures Python automatically, without administrator permissions, with bilingual support (Spanish/English).

### 📋 **Python Templates** - Professional templates
Ready-to-use templates in Spanish and English that include folder structure, automation scripts, and best practices.

---

## 🚀 Quick Start

### If you're **new to Python**:
1. **Install Python** with the automatic Manager
2. **Download** the Basic Template
3. **Start** programming following the guides

### If you already **have experience**:
1. **Use** the Complete Template directly
2. **Customize** according to your needs
3. **Enjoy** the professional structure


---

## 📦 Project Components

### 🔧 Python Quick Setup
**Automated script to install Python**

**Features:**
- ✅ No administrator permissions required
- ✅ **4 official versions with fixed releases for standardization**
  - Python 3.11.9 (Recommended - EOL: Oct 2027)
  - Python 3.12.7 (Modern - EOL: Oct 2028)
  - Python 3.10.11 (LTS - EOL: Oct 2026)
  - Python 3.13.0 (Experimental - EOL: Oct 2029) ⚠️
- ✅ **Version standardization guarantee** (all machines get the same version)
- ✅ Pre-installation validation (prevents duplicate installations)
- ✅ Automatic pip configuration
- ✅ Virtual environment creation and management
- ✅ Main Python PATH configuration
- ✅ Basic package installation
- ✅ Direct project creation integration
- ✅ Bilingual support (Spanish/English)
- ✅ Automatic system language detection

**When to use it?**
- You need to install Python for the first time
- You want to change Python version
- You work in teams that need the same configuration

### 📋 Python Templates
**Organized templates for professional projects**

#### 🌱 Basic Template
- **For**: Beginners and simple projects
- **Includes**: Basic structure, simple helpers, educational documentation
- **Ideal for**: Learning best practices, personal projects

#### 🏢 Complete Template
- **For**: Professional projects and data analysis
- **Includes**: Complete structure, advanced modules, integrated logging
- **Ideal for**: Work teams, data analysis, complex projects

---

## 📁 Repository Structure

```
python-quicksetup/
├── 📄 python_quicksetup.bat     # 🚀 Main launcher (double-click to run)
├── 📄 README.md                 # 📚 This file (English guide)
├── 📄 LICENSE                   # ⚖️ MIT License
├── 📄 .gitignore                # 🚫 Git ignore rules
│
├── 📁 .scripts/                 # 🔧 Core PowerShell scripts
│   ├── 📄 python_quicksetup.ps1 # ⚙️ Main Python installer script
│   └── 📄 requirements.txt      # 📦 Development dependencies
│
├── 📁 docs/                     # 📚 Documentation in multiple languages
│   ├── 📄 README_ES.md          # 📚 Spanish version of this guide
│
└── 📁 python_template/          # 📋 Professional Python project templates
    │
    ├── 📁 es/                   # 🇪🇸 Spanish templates
    │   ├── 📁 basic_project/    # 🌱 Basic Template (beginners)
    │   │   ├── 📄 main.py       # 🚀 Main application file
    │   │   ├── 📄 README.md     # 📚 Project guide in Spanish
    │   │   ├── 📄 requirements.txt # 📦 Python dependencies
    │   │   ├── 📄 manager.bat   # 🔧 Project manager launcher
    │   │   ├── 📄 terminal.bat  # ⚡ Quick terminal launcher
    │   │   ├── 📁 .scripts/     # 🔧 PowerShell automation scripts
    │   │   │   ├── 📄 manager.ps1  # ⚙️ Complete project manager
    │   │   │   └── 📄 terminal.ps1 # 🔄 Environment activator
    │   │   ├── 📁 helpers/      # 🛠️ Helper functions and utilities
    │   │   └── 📁 resultados/   # 📤 Results and outputs (Spanish)
    │   │
    │   └── 📁 complex_project/  # 🏢 Complete Template (professionals)
    │       ├── 📄 main.py       # 🚀 Main application file
    │       ├── 📄 README.md     # 📚 Project guide in Spanish
    │       ├── 📄 requirements.txt # 📦 Python dependencies
    │       ├── 📄 manager.bat   # 🔧 Project manager launcher
    │       ├── 📄 terminal.bat  # ⚡ Quick terminal launcher
    │       ├── 📁 .scripts/     # 🔧 PowerShell automation scripts
    │       │   ├── 📄 manager.ps1  # ⚙️ Advanced project manager
    │       │   └── 📄 terminal.ps1 # 🔄 Environment activator
    │       ├── 📁 helpers/      # 🛠️ Reusable modules and processors
    │       │   ├── 📄 data_processor.py # 📊 Data processing utilities
    │       │   └── 📄 file_manager.py   # 📁 File management utilities
    │       ├── 📁 data/         # 📊 Organized data folders
    │       │   ├── 📁 insumos/  # 📥 Input data (Spanish: inputs)
    │       │   ├── 📁 logs/     # 📋 Log files
    │       │   └── 📁 resultados/ # 📤 Results (Spanish)
    │       └── 📁 notebooks/    # 📓 Jupyter notebooks
    │
    └── 📁 en/                   # 🇺🇸 English templates
        ├── 📁 basic_project/    # 🌱 Basic Template (beginners)
        │   ├── 📄 main.py       # 🚀 Main application file
        │   ├── 📄 README.md     # 📚 Project guide in English
        │   ├── 📄 requirements.txt # 📦 Python dependencies
        │   ├── 📄 manager.bat   # 🔧 Project manager launcher
        │   ├── 📄 terminal.bat  # ⚡ Quick terminal launcher
        │   ├── 📁 .scripts/     # 🔧 PowerShell automation scripts
        │   │   ├── 📄 manager.ps1  # ⚙️ Complete project manager
        │   │   └── 📄 terminal.ps1 # 🔄 Environment activator
        │   └── 📁 helpers/      # 🛠️ Helper functions and utilities
        │
        └── 📁 complex_project/  # 🏢 Complete Template (professionals)
            ├── 📄 main.py       # 🚀 Main application file
            ├── 📄 README.md     # 📚 Project guide in English
            ├── 📄 requirements.txt # 📦 Python dependencies
            ├── 📄 manager.bat   # 🔧 Project manager launcher
            ├── 📄 terminal.bat  # ⚡ Quick terminal launcher
            ├── 📁 .scripts/     # 🔧 PowerShell automation scripts
            │   ├── 📄 manager.ps1  # ⚙️ Advanced project manager
            │   └── 📄 terminal.ps1 # 🔄 Environment activator
            ├── 📁 helpers/      # 🛠️ Reusable modules and processors
            ├── 📁 data/         # 📊 Organized data folders
            │   ├── 📁 input/    # 📥 Input data
            │   ├── 📁 logs/     # 📋 Log files
            │   └── 📁 result/   # 📤 Results
            └── 📁 notebooks/    # 📓 Jupyter notebooks
```

---

## 🔧 Technical Architecture & Design Decisions

### 💻 Why PowerShell instead of CMD?

**PowerShell was chosen over traditional CMD for several critical advantages:**

| Feature | PowerShell | CMD | Why it matters |
|---------|------------|-----|----------------|
| **Object handling** | ✅ Native objects | ❌ Text only | Better data processing and validation |
| **Error handling** | ✅ Advanced try/catch | ❌ Basic errorlevel | Robust error management and user feedback |
| **Cross-platform** | ✅ Windows/Linux/macOS | ❌ Windows only | Future compatibility and portability |
| **Scripting power** | ✅ Full programming language | ❌ Limited scripting | Complex automation and logic |
| **Security** | ✅ Execution policies | ❌ No built-in security | Controlled script execution |
| **Package management** | ✅ Native package handling | ❌ External tools needed | Seamless Python installation |

### 🚀 Why .bat launchers for PowerShell scripts?

**The `.bat` files serve as universal compatibility bridges throughout the project:**

- **🔓 RemoteSignedes execution policy restrictions** - Users don't need to modify system settings
- **⚡ One-click execution** - Double-click works for all users, regardless of PowerShell knowledge
- **🛡️ Security without complexity** - Temporary policy change only for specific scripts
- **📱 Universal compatibility** - Works on any Windows system without configuration
- **🎯 User-friendly** - Non-technical users can run without command line knowledge
- **🔧 Organized architecture** - PowerShell scripts hidden in `.scripts/` folders, clean user interface

**Architecture Pattern:**
```
project/
├── 📄 launcher.bat          # User-facing launcher
└── 📁 .scripts/             # Hidden PowerShell scripts
    └── 📄 actual_script.ps1  # The real PowerShell code
```

**Example implementation:**
```batch
start powershell.exe -ExecutionPolicy RemoteSigned -File "%~dp0\.scripts\python_quicksetup.ps1"
```

**Benefits of this separation:**
- **Clean user interface** - Users only see simple `.bat` files
- **Professional organization** - Technical scripts hidden in `.scripts/` folders
- **Easy maintenance** - PowerShell logic separated from launch mechanism
- **Consistent pattern** - Same structure across all project components

### 🔒 Security, Auditability & Quality Assurance

#### 🛡️ **Secure by Design**
- **No elevated privileges required** - Runs with standard user permissions
- **Transparent code** - All scripts are human-readable PowerShell
- **Local installation** - Downloads directly from python.org (official source)
- **No registry modifications** - User-space installation only
- **Execution policy aware** - Respects system security settings

#### 🔍 **Fully Auditable**
- **Open source** - Every line of code is inspectable
- **No compiled binaries** - No hidden functionality
- **Clear logging** - All actions are logged and visible
- **Predictable behavior** - No external dependencies or black boxes
- **Version controlled** - Full change history available

#### ⚙️ **Highly Customizable**
- **Modular design** - Each component can be modified independently
- **Configuration driven** - Easy to adapt for different organizations
- **Template based** - Create custom project templates easily
- **Language support** - Add new languages by copying existing structures
- **Environment flexible** - Works in corporate, educational, and personal environments

#### 🎯 **Deliberately Simple**
- **Single script installation** - No complex installers or setup wizards
- **Minimal dependencies** - Only requires Windows and PowerShell (built-in)
- **Self-contained** - Everything needed is included in the repository
- **Clear documentation** - Extensive guides in multiple languages
- **Fail-safe design** - Graceful handling of errors and edge cases

### 🌟 Benefits of This Architecture

1. **Corporate friendly** - IT departments can easily audit and approve
2. **Educational ready** - Teachers can confidently use in classrooms
3. **Developer efficient** - Minimal setup time, maximum productivity
4. **Future proof** - Built on modern, supported technologies
5. **Globally accessible** - Multi-language support from day one

---

## 🎯 Which Template to choose?

### 🌱 **Basic Template** - `basic_project/`
**Perfect if:**
- You're starting with Python
- You have a simple or personal project
- You want to learn best practices gradually
- You prefer to start with the minimum necessary

**It offers you:**
- Simple and clear structure
- Interactive project manager (manager.ps1)
- Quick environment activator (terminal.ps1)
- Step-by-step educational examples
- Detailed guide for beginners

### 🏢 **Complete Template** - `complex_project/`
**Perfect if:**
- You work in professional teams
- You perform complex data analysis
- You need robust organizational structure
- You handle multiple types of files and results

**It offers you:**
- Clear separation of data, scripts, and results
- Advanced project manager with full automation
- Quick terminal activation for daily work
- Jupyter notebooks support
- Integrated logging and validations
- Documented professional workflow

---

## 📋 Usage Guide

### 1️⃣ **Install Python** (if you don't have it)
```batch
# Double-click the main launcher
python_quicksetup.bat
```

**Alternative methods:**
```powershell
# From PowerShell (if you prefer command line)
.\.scripts\python_quicksetup.ps1
```

#### 📊 What does the script do automatically?

```
🚀 Run python_quicksetup.ps1
         ↓
🌍 Detect system language
         ↓
📋 Show Python versions with recommendations (LTS, Recommended, Latest)
         ↓
🔍 Check if selected version already exists
         ↓
⬇️ Download & install Python (if not installed)
         ↓
⚙️ Configure virtual environment (optional)
         ↓
🔧 Set as main Python in PATH (optional)
         ↓
📁 Create new project (optional - redirects to creation flow)
         ↓
✅ Ready to code!
```

> 📖 **More details**: The script will guide you step by step in your preferred language

### 2️⃣ **Choose Template**
- Read `python_template/README.md` to compare both templates
- Go to `es/` for Spanish or `en/` for English
- Choose `basic_project/` or `complex_project/` according to your level

### 3️⃣ **Configure Project**
```batch
# In the chosen template folder - Double-click these files:
manager.bat     # Complete project manager (setup, packages, config)
terminal.bat    # Quick environment activation (daily use)
```

**Alternative command line usage:**
```powershell
# From PowerShell (if you prefer command line)
.\.scripts\manager.ps1     # Complete project manager
.\.scripts\terminal.ps1    # Quick environment activation
```

### 4️⃣ **Start Programming**
- Follow the instructions of your template's specific README
- Use the included automation scripts
- Enjoy programming without manual configurations

---

## 🔒 Version Standardization Policy

### Why fixed versions?

This tool uses **fixed Python versions** intentionally to guarantee standardization across teams and organizations.

### The Problem with "Always Latest"

Imagine deploying to 300 machines:
- **Day 1 (Machines 1-100):** Python 3.12.4 installed ✅
- **Day 15 (Machines 101-200):** Python 3.12.5 released and installed ⚠️
- **Day 30 (Machines 201-300):** Python 3.12.7 released and installed ⚠️
- **Result:** 3 different Python versions in production 😱

### Our Solution

**Fixed versions that only update when YOU decide:**
- All machines install **exactly the same version**
- No surprises or "works on my machine" issues
- Security patches applied through planned updates
- Full control over when to upgrade

### For Teams and Organizations

1. **Keep the fixed versions** - Don't modify them automatically
2. **All installations get identical Python** - Guaranteed consistency
3. **Plan updates as a team** - Update manually when ready
4. **Document your version** - Each project records its Python version

### When to Update Versions

**Recommended update schedule:**
- Review every **6 months** (April and October)
- Only update for critical security patches
- Test thoroughly before rollout
- Document changes in CHANGELOG.md

### How to Update Versions

**Method 1: Update JSON file** (Recommended) ⭐

1. Edit `.scripts/python-versions.json`
2. Update version numbers, URLs, and labels
3. Update `metadata.last_updated` date
4. Test the installation
5. Commit changes to Git

**Example:**
```json
{
  "metadata": {
    "last_updated": "2024-10-01",  ← Update this date
    "next_review": "2025-04-01"
  },
  "versions": {
    "1": {
      "version": "3.11.9",  ← Change version here
      "url": "https://...",  ← Update URL
      "label_es": "Recomendada - Producción estable (EOL: Oct 2027)"
    }
  }
}
```

**Method 2: Update PowerShell script** (Fallback)

If `python-versions.json` is not available, edit `.scripts/python_quicksetup.ps1` (lines 665-705)

**Centralized Management:**
- Keep `python-versions.json` in Git repository
- Can be hosted on internal server for enterprise deployments
- Script automatically falls back to hardcoded versions if JSON is missing

### Version Compatibility Within Minor Releases

**Within the same minor version (e.g., 3.12.x):**
- 3.12.4 → 3.12.7: **100% compatible** (only bugfixes)
- No breaking changes between patches
- Safe to upgrade within minor version

**Between minor versions (e.g., 3.11.x → 3.12.x):**
- May have new features
- Rare breaking changes
- Test before deploying

### Current Official Versions

| Version | Status | EOL Date | Use Case |
|---------|--------|----------|----------|
| **3.11.9** | Recommended - Stable production | Oct 2027 | Most teams (80% of cases) |
| **3.12.7** | Modern - Stable | Oct 2028 | Latest features + performance |
| **3.10.11** | Mature - Legacy compatible | Oct 2026 | Older projects / migration |
| **3.13.0** | Experimental - Latest | Oct 2029 | Development/testing only ⚠️ |

**Last version review:** October 2024

---

## 💡 Advantages of using this set

### ❌ **Without these tools:**
- Manual and error-prone installation
- Different configuration on each computer
- Disorganized and hard-to-share code
- Time wasted on technical configuration
- Complicated collaboration

### ✅ **With these tools:**
- **Automated installation** in minutes
- **Consistent configuration** on all computers
- **Professional code** from day 1
- **Frictionless collaboration** between teams
- **Focus on solving problems**, not configuring

---

## 🛠️ System Requirements

- **Windows 10/11** with PowerShell
- **Internet connection** (to download Python)
- **Normal user permissions** (no administrator needed)
- **~200 MB of free** disk space

---

## 🆘 Problems? Questions?

### 📚 **Specific documentation:**
- `README.md` in `python_template/` - Complete template guide
- `README.md` in `en/basic_project/` - Basic template guide
- `README.md` in `en/complex_project/` - Complete template guide

### 🔧 **Common problems:**
- **Scripts don't run**: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`
- **Python not found**: Reinstall with "Add to PATH" checked
- **Modules not found**: Verify that the virtual environment is activated

### 💡 **Tips:**
- Start with the Basic Template if you're a beginner
- Read completely your chosen template's README
- Automation scripts save you a lot of time
- Always update `requirements.txt` after installing packages

---

## 🎯 Ideal For

- **🎓 Students** who want to learn best practices from the start
- **👔 Professionals** migrating from Excel to Python
- **👥 Teams** that need configuration consistency
- **📊 Analysts** who process data regularly
- **💼 Consultants** who deliver organized projects
- **🏢 Companies** that adopt Python gradually

---

## 🏆 What you get

### ⚡ **Speed**
- Complete setup in less than 5 minutes
- No complicated manual configurations

### 🎯 **Professionalism**
- Organized and consistent structure
- Best practices integrated from the start

### 👥 **Collaboration**
- Same environment on all computers
- Clear and complete documentation

### 📈 **Scalability**
- Easy migration from basic to complete template
- Structure that grows with your needs

---

## Project History
Python Quick Setup was born from a real need: the frustration of setting up Python from scratch on each new work team.

### 🎯 The Problem
- Complicated and error-prone manual installations
- Different configurations on each computer
- Time wasted explaining the same thing over and over
- New developers taking days to have a functional environment
- Projects that "worked on my machine" but not on others
### 💡 The Solution
- Automated script that installs Python without administrator permissions
- Professional templates with best practices included
- Consistent configuration on any Windows
- New members productive in less than 30 minutes
- Bilingual support for international teams
### 🚀 Project Evolution
- What started as a simple script to install Python became a complete tool suite:
- Version 0.1: Basic installation script
- Version 0.5: Added bilingual support and automatic language detection
- Version 0.8: Professional templates with automation scripts
- Version 1.0: Complete suite with validations, smart recommendations and comprehensive documentation


---

## ⚖️ License and Disclaimer

### License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

### Disclaimer
**IMPORTANT:** This software is provided "as is" without warranties of any kind.

- ✅ **Free use:** You can use, modify and distribute this software
- ✅ **Open source:** Available to the community
- ⚠️ **No warranties:** We are not responsible for problems derived from use
- ⚠️ **Use at your own risk:** Test in non-critical environments first

### Commercial Support
Need custom implementation or enterprise support?
[Contact me for professional services](mailto:rafaelmedina435@outlook.com)

### Credits
Developed by **Rafael Medina** with assistance from **Claude (Anthropic)**.
**Version:** 1.0 | September 2025

---

💡 **Ready to start?** Begin by installing Python with the automatic Manager and then choose your ideal template.

*Created with ❤️ to facilitate professional work with Python*
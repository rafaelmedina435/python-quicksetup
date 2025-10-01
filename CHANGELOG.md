# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2024-10-01

### Added
- **Version standardization policy** for enterprise/team deployments
- **Centralized version management with JSON file** (`.scripts/python-versions.json`)
  - Easier version updates without editing PowerShell code
  - Supports Git versioning for version control
  - Can be hosted on internal servers for enterprise deployments
  - Automatic fallback to hardcoded versions if JSON is missing
- End-of-Life (EOL) dates in version labels for better planning
- Comprehensive documentation section about version standardization
- Explanatory comments in code about fixed version strategy
- Version update schedule recommendation (6-month review cycle)
- Detailed guide on how to update official versions (JSON method + PowerShell fallback)

### Changed
- **Updated to 4 official Python versions** with clear categorization
  - Python 3.11.10 (Recommended - Stable production)
  - Python 3.12.7 (Modern - Stable)
  - Python 3.10.15 (Mature - Legacy compatible)
  - Python 3.13.0 (Experimental - Latest) ⚠️
- **Improved version labels** for better clarity
  - Removed incorrect "LTS" terminology (Python doesn't have official LTS)
  - Added descriptive labels based on maturity and use case
  - Clearer guidance for users choosing versions
- **Reordered versions** to show recommended version first
- Updated version labels to include EOL dates
- Improved version descriptions with use case guidance
- Added experimental version warning system for Python 3.13.0

### Fixed
- Corrected Python 3.11.9 → 3.11.10 (3.11.9 doesn't exist)
- Corrected Python 3.12.9 → 3.12.7 (3.12.9 doesn't exist)
- Updated download URLs to match corrected versions

### Removed
- None (Python 3.13.0 kept as experimental option with warnings)

### Security
- Fixed version strategy prevents version drift across deployments
- Ensures all machines get tested, verified Python versions
- Controlled update schedule for security patches

## [1.0.0] - 2025-09-21

### Added
- Complete Python Quick Setup & Templates project
- Automatic Python installer script without administrator permissions
- Bilingual support (Spanish/English) with automatic system language detection
- Professional project templates (Basic and Complex)
- Interactive project managers (manager.ps1) for both templates
- Quick terminal activators (terminal.ps1) for environment management
- Multiple Python versions support (3.10 to 3.13) with smart recommendations
- Dynamic version display (LTS, Recommended, Stable, Latest)
- Pre-installation validation to prevent duplicate installations
- Automatic pip configuration and virtual environment management
- Comprehensive documentation in both languages
- Security-focused execution with RemoteSigned policy management
- Universal .bat launchers for PowerShell script execution

### Changed
- Improved security and functionality across the codebase
- Enhanced Windows system language detection mechanism
- Better execution policy handling for PowerShell scripts

### Fixed
- Resolved dual PowerShell window opening issue when executing .bat files
- Corrected paths for virtual environments and requirements.txt files
- Improved verbosity when installing packages with python_quicksetup.ps1
- Fixed routing issues for templates and environment paths

## [0.8.0] - 2025-09-20

### Added
- New project structure with .bat launchers for better PowerShell script execution
- Secure execution implementation for python_quicksetup.ps1, manager.ps1, and terminal.ps1
- Enhanced manager and terminal PowerShell scripts
- Updated comprehensive documentation

### Removed
- Web version documentation (separated into independent project)

### Changed
- Improved template routing and path handling
- Updated Python version availability and recommendations
- Enhanced documentation structure and clarity

## [0.5.0] - 2025-09-20

### Added
- Bilingual support (Spanish/English)
- Automatic system language detection
- Localized project templates for both languages
- Language-specific documentation and guides

### Changed
- Restructured project to support multiple languages
- Enhanced user experience with native language support

## [0.1.0] - 2025-09-20

### Added
- Initial stable beta version
- Basic Python installation script
- Core functionality for automated Python setup
- Virtual environment management
- Basic project structure templates

---

## Version History Summary

### 🚀 Major Milestones

- **v1.1.0** - Version standardization for enterprise deployments
- **v1.0.0** - Production-ready release with complete bilingual support
- **v0.8.0** - Security enhancements and structural improvements
- **v0.5.0** - Bilingual support implementation
- **v0.1.0** - Initial stable beta release

### 🔧 Key Features by Version

| Version | Python Install | Templates | Languages | Security | Documentation | Standardization |
|---------|----------------|-----------|-----------|----------|---------------|-----------------|
| v1.1.0  | ✅ Advanced    | ✅ Pro    | 🇪🇸🇺🇸    | 🔒 High   | 📚 Complete  | ⭐ Enterprise   |
| v1.0.0  | ✅ Advanced    | ✅ Pro    | 🇪🇸🇺🇸    | 🔒 High   | 📚 Complete  | ❌ Basic        |
| v0.8.0  | ✅ Enhanced    | ✅ Basic  | 🇪🇸🇺🇸    | 🔒 Good   | 📚 Good      | ❌ None         |
| v0.5.0  | ✅ Basic       | ⚡ Minimal | 🇪🇸🇺🇸    | 🔒 Basic  | 📚 Basic     | ❌ None         |
| v0.1.0  | ✅ Core        | ❌        | 🇺🇸       | 🔒 Basic  | 📚 Minimal   | ❌ None         |

### 🎯 Project Evolution

This project evolved from a simple Python installation script to a comprehensive enterprise toolkit:

1. **Phase 1** (v0.1.0): Core installation functionality
2. **Phase 2** (v0.5.0): International support and localization
3. **Phase 3** (v0.8.0): Security hardening and structural improvements
4. **Phase 4** (v1.0.0): Production-ready with complete feature set
5. **Phase 5** (v1.1.0): Enterprise standardization and team deployment focus

### 🔮 Future Roadmap

- Cross-platform support (Linux/macOS)
- GUI installer option
- Custom template generator
- Enterprise configuration management
- Automatic dependency conflict resolution

---

## Contributing

When contributing to this project, please:

1. Follow the existing commit message format: `Type: Description`
2. Update this CHANGELOG.md with your changes
3. Test changes on both Spanish and English templates
4. Ensure PowerShell scripts maintain security best practices

## Support

- **Documentation**: [README.md](README.md)
- **Issues**: [GitHub Issues](https://github.com/your-repo/python-quicksetup/issues)
- **Contact**: rafaelmedina435@outlook.com

---

*Developed by Rafael Medina with assistance from Claude (Anthropic)*
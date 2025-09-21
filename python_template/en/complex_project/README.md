# 🏢 My Python Project - Complete Template
### [Visit our friendly web documentation.](https://python-quicksetup.netlify.app/)
> **For professional projects, data analysis and team collaboration**

## 📋 Project Description

**Complete this section with specific information about your project:**
- What analysis do you perform?
- What data do you process?
- What are the objectives?
- Who uses the results?

## 📁 Project Structure

```
my_project/
├── 📁 data/
│   ├── 📁 input/           # 📥 Original files (.xlsx, .csv, .json)
│   ├── 📁 result/          # 📤 Processed files and final reports
│   └── 📁 logs/             # 📋 Execution logs (auto-generated)
├── 📁 notebooks/            # 📊 Exploratory analysis and documentation
├── 📁 helpers/              # 🛠️ Reusable functions and custom modules
├── 📄 main.py              # 🚀 Main entry point of the project
├── 📄 requirements.txt     # 📦 Project dependencies (CRITICAL)
├── 📄 manager.ps1          # ⚙️ Complete project manager (setup, packages, etc.)
├── 📄 terminal.ps1         # 🔄 Quick work environment activation
└── 📄 README.md           # 📚 This documentation
```

## 🚀 Quick Start

### 1. Initial setup (only the first time)
```powershell
# Configure everything automatically
.\manager.ps1
```

### 2. Install recommended dependencies
```powershell
# Essential packages for data analysis
pip install pandas numpy matplotlib seaborn

# For working with Excel
pip install openpyxl xlsxwriter

# For interactive notebooks
pip install jupyter ipykernel

# For APIs and web scraping
pip install requests beautifulsoup4

# Save all dependencies
.\manager.ps1
```

### 3. Start the project
```powershell
# Run the main program
python main.py

# Or open Jupyter for interactive analysis
jupyter notebook
```

## 📊 Professional Workflow

### 📥 1. Data preparation
- Place original files in `data/insumos/`
- Never modify original files
- Use descriptive names: `sales_january_2024.xlsx`

### 🔬 2. Exploratory analysis
- Create notebooks in `notebooks/` to explore data
- Use names like: `01_initial_exploration.ipynb`
- Document important findings

### 🛠️ 3. Function development
- Create reusable functions in `helpers/`
- One function = One specific purpose
- Document parameters and return values

### 🎯 4. Main processing
- Use `main.py` to orchestrate the entire process
- Implement logging for tracking
- Save results in `data/resultados/`

### 📤 5. Results delivery
- Export final reports to `data/resultados/`
- Include date in names: `sales_report_2024-03-15.xlsx`
- Document methodology in notebooks

## 🗂️ File Conventions

### 📥 data/insumos/
- `sales_YYYY-MM-DD.xlsx` - Sales data
- `customers_updated.csv` - Customer database
- `config_parameters.json` - Configurations

### 📤 data/resultados/
- `final_report_YYYY-MM-DD.xlsx` - Executive reports
- `processed_data_YYYY-MM-DD.csv` - Clean datasets
- `charts/` - Folder for images and charts

### 📊 notebooks/
- `01_initial_exploration.ipynb` - First analysis
- `02_data_cleaning.ipynb` - Processing
- `03_advanced_analysis.ipynb` - Insights
- `99_final_report.ipynb` - Presentation

### 🛠️ helpers/
- `data_processor.py` - Processing functions
- `file_manager.py` - File management
- `visualization.py` - Chart functions
- `utilities.py` - General utilities

## 📝 Naming Conventions

### Basic rules for names
- **Simple and clear names**: Use names that explain what they do
- **No spaces**: Use underscores instead of spaces
- **Lowercase**: Everything in lowercase letters
- **No accents**: Avoid accents and special characters
- **In English**: Preferable for compatibility

### Examples for professional projects

**For data files:**
- ✅ `sales_january_2024.xlsx`
- ✅ `customers_active.csv`
- ❌ `Sales January 2024.xlsx`
- ❌ `customers-historical.csv`

**For scripts and modules:**
- ✅ `data_processor.py`
- ✅ `generate_report.py`
- ❌ `Data Processor.py`
- ❌ `generateReport.py`

**For variables in analysis:**
```python
# ✅ Correct
df_sales = pd.read_csv('sales.csv')
total_revenue = df_sales['price'].sum()
top_products = df_sales.nlargest(10, 'quantity')

# ❌ Avoid
dfSales = pd.read_csv('sales.csv')
totalRevenue = df_sales['price'].sum()
TopProducts = df_sales.nlargest(10, 'quantity')
```

**For analysis functions:**
```python
# ✅ Correct
def calculate_monthly_growth(data):
    return data.pct_change() * 100

def clean_customer_data(df):
    return df.dropna().reset_index(drop=True)

# ❌ Avoid
def CalculateMonthlyGrowth(data):
    pass

def cleanCustomerData(df):
    pass
```

## ⭐ Professional Best Practices

### 🥇 Data Management
- **Never modify original files**
- Use copies for experimentation
- Implement data validations
- Document transformations

### 🥈 Clean Code
- Small and specific functions
- Descriptive variable names
- Comments in complex parts
- Consistency in code style

### 🥉 Collaboration
- Update requirements.txt religiously
- Use descriptive commit messages
- Document important decisions
- Share knowledge in notebooks

### 🏅 Reproducibility
- Fix versions in requirements.txt
- Always use relative paths
- Set seeds for randomness
- Test in different environments

### 🎯 Professionalism
- Implement error handling
- Use logging instead of prints
- Validate inputs and outputs
- Create basic tests when possible

## 🔄 Daily Workflow

### 🌅 When starting the day:
```powershell
# 1. Activate environment
.\terminal.ps1

# 2. Verify structure
python main.py

# 3. Open tools
jupyter notebook
# or code . (if using VS Code)
```

### 💼 During work:
1. **Explore** in notebooks
2. **Develop** functions in helpers
3. **Process** data with main.py
4. **Validate** results
5. **Document** process

### 🌙 When finishing:
```powershell
# If you installed something new
.\manager.ps1

# Commit changes (if using Git)
# git add .
# git commit -m "Description of changes"
```

## 🔧 Automation Scripts

| Script | Purpose | When to use |
|--------|---------|-------------|
| `manager.ps1` | Complete project management (setup, packages, config) | Initial setup and dependency management |
| `terminal.ps1` | Activate work environment | When starting each session |

## 🆘 Advanced Troubleshooting

### ❌ PowerShell permissions error
```powershell
# As normal user (not admin)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### ❌ Jupyter problems
```powershell
# Install project-specific kernel
python -m ipykernel install --user --name=venv --display-name "My Project"

# Change kernel in Jupyter: Kernel > Change kernel > My Project
```

### ❌ Import errors
```powershell
# Check active environment
where python
# Should show venv path

# Reinstall problematic package
pip uninstall problematic_package
pip install problematic_package
```

### ❌ Memory problems with large data
- Process data in chunks with pandas
- Use specific `dtype` to reduce memory
- Consider `dask` for very large datasets

## 📚 Learning Resources for Python

### Official documentation
- [Python.org - Official tutorial](https://docs.python.org/3/tutorial/) - Complete official guide
- [Python.org - Language reference](https://docs.python.org/3/reference/) - Technical documentation

### Recommended learning sites
- [Real Python](https://realpython.com/) - Practical tutorials and projects
- [GeeksforGeeks Python](https://www.geeksforgeeks.org/python-programming-language/) - Concepts and examples
- [W3Schools Python](https://www.w3schools.com/python/) - Interactive basic course
- [Automate the Boring Stuff](https://automatetheboringstuff.com/) - Practical Python

### Specialized resources for data analysis
- [Pandas User Guide](https://pandas.pydata.org/docs/user_guide/) - Data manipulation
- [NumPy Documentation](https://numpy.org/doc/stable/user/) - Numerical computing
- [Matplotlib Tutorials](https://matplotlib.org/stable/tutorials/) - Basic graphics
- [Seaborn Gallery](https://seaborn.pydata.org/examples/) - Statistical visualization
- [Jupyter Documentation](https://jupyter.org/documentation) - Interactive notebooks

### Advanced tools
- [Plotly](https://plotly.com/python/) - Interactive charts
- [Altair](https://altair-viz.github.io/) - Statistical graphics
- [Bokeh](https://docs.bokeh.org/) - Web applications
- [Scikit-learn](https://scikit-learn.org/stable/) - Machine learning
- [Requests](https://docs.python-requests.org/en/latest/) - APIs and web scraping

### YouTube channels (in English)
- [Corey Schafer](https://www.youtube.com/@coreyms) - Python tutorials
- [Programming with Mosh](https://www.youtube.com/@programmingwithmosh) - Beginner-friendly
- [Tech With Tim](https://www.youtube.com/@TechWithTim) - Python projects
- [Data School](https://www.youtube.com/@dataschool) - Data Science with Python

### Best practices and development
- [Python Style Guide (PEP 8)](https://pep8.org/) - Code style
- [Effective Python](https://effectivepython.com/) - Advanced techniques
- [Clean Code in Python](https://realpython.com/python-code-quality/) - Clean code

## 🎯 Complete Project Checklist

### ✅ Setup
- [ ] Virtual environment created and activated
- [ ] Dependencies installed and saved
- [ ] Folder structure verified
- [ ] Logging configured

### ✅ Development
- [ ] Data loaded in data/insumos/
- [ ] Exploratory analysis documented
- [ ] Functions created in helpers/
- [ ] Main process implemented

### ✅ Quality
- [ ] Code commented and clean
- [ ] Validations implemented
- [ ] Errors handled appropriately
- [ ] Results validated

### ✅ Delivery
- [ ] Results in data/resultados/
- [ ] Documentation updated
- [ ] Requirements.txt updated
- [ ] Project tested in another environment

---

## 📝 Project Information

**Complete this section with specific details:**

### 👥 Team
- **Responsible**: Your name
- **Collaborators**: List of people
- **Stakeholders**: Who uses the results

### 📅 Timeline
- **Start**: Start date
- **Important milestones**: Key dates
- **Delivery**: Deadline

### 🔗 Important Links
- **Data source**: Where to get the data
- **External documentation**: Relevant links
- **Contacts**: Key project people

### 📋 Development Notes
- **Technical decisions**: Why certain decisions were made
- **Known limitations**: What doesn't work perfectly
- **Future improvements**: Ideas for next versions

---

💡 **Remember:** A well-documented project is a successful project.

## Authors

- rafaelmedina435
- Claude (Anthropic)
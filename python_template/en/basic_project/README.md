# 🐍 My Python Project - Basic Template

### [Visit our friendly web documentation.](https://python-quicksetup.netlify.app/)
> **For users who are starting with Python and want to learn best practices**

## 📋 Project Description

**Complete this section with information about your project:**
- What does this project do?
- Why is it important?
- What problem does it solve?

## 🚀 Quick Start

### 1. Main Project Manager
```powershell
# Run this to manage your Python project
.\manager.ps1
```

The script automatically:
- 🔍 Detects if you need to create a virtual environment
- 🐍 Lets you choose the Python version
- ⚡ Activates the environment automatically
- 📱 Gives you an interactive menu to work

### 2. Quick Terminal (Optional)
```powershell
# To quickly activate the environment and work in terminal
.\terminal.ps1
```

### 3. Using the manager menu

**Available options:**
- **1. Create/Recreate virtual environment** - Set up or update your environment
- **2. Run main.py** - Execute your main code
- **3. Install new package** - Install pandas, numpy, etc.
- **4. Show/Save installed packages** - View and save dependencies
- **0. Exit and close window** - End the session

### 4. Start programming
- Edit `main.py` with your code
- Use option 2 from the menu to run it

## 📁 Project Files

| File | Description | When to use it? |
|---------|-------------|-----------------|
| `manager.ps1` | 🎛️ Main project manager | Whenever you work on the project |
| `terminal.ps1` | ⚡ Quick environment activator | For quick terminal session |
| `main.py` | 🐍 Your main code | Every day |
| `helpers/helpers.py` | 🔧 Reusable functions | When you need common functions |
| `requirements.txt` | 📦 List of required packages | When sharing the project |
| `README.md` | 📚 This documentation | To remember how everything works |

## Naming Conventions

### Basic rules for names
- **Simple and clear names**: Use names that explain what they do
- **No spaces**: Use underscores instead of spaces
- **Lowercase**: Everything in lowercase letters
- **No accents**: Avoid accents and special characters
- **In English**: Preferable for compatibility

### Practical examples

**For projects:**
- ✅ `sales_analysis`
- ✅ `telegram_bot`
- ❌ `Sales Analysis`
- ❌ `My Project`

**For files:**
- ✅ `process_data.py`
- ✅ `config_database.py`
- ❌ `Process Data.py`
- ❌ `configuration_bd.py`

**For variables:**
```python
# ✅ Correct
user_name = "John"
product_list = []
total_price = 100.50

# ❌ Avoid
User Name = "John"
productList = []
totalPrice = 100.50
```

**For functions:**
```python
# ✅ Correct
def calculate_average(numbers):
    return sum(numbers) / len(numbers)

def get_user_data():
    pass

# ❌ Avoid
def CalculateAverage(numbers):
    pass

def getUserData():
    pass
```

## The 5 Golden Rules

### Rule #1: Always use virtual environments
- One project = One virtual environment
- Never install packages "globally"
- The manager.ps1 takes care of activating automatically

### Rule #2: Update requirements.txt religiously
- Installed something new? Use option 4 from the menu to save it
- No requirements.txt = No collaboration possible
- It's your "recipe" for others to replicate your work

### Rule #3: Document your code
- Comment the complicated parts
- Use descriptive variable names
- Explain the "why", not just the "what"

### Rule #4: Keep code organized
- One function = One task
- Group similar code
- Use imports at the beginning of the file

### Rule #5: Share correctly
- Always include requirements.txt
- Test that your code works on another computer
- Write clear instructions

## Daily Workflow

### When starting the day:
1. Open terminal in project folder
2. Run: `.\manager.ps1`
3. The environment activates automatically
4. Use the menu to work

### When installing something new:
1. Use option 3 from the manager menu
2. Type the packages: `pandas numpy matplotlib`
3. The script asks if you want to save to requirements.txt
4. Continue working

### When sharing your project:
1. Verify that requirements.txt is updated
2. Share entire folder
3. Other person runs `.\manager.ps1`
4. The manager automatically installs from requirements.txt

## Troubleshooting

### "Cannot execute scripts"
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### "Python not recognized"
- Reinstall Python from python.org
- Check "Add Python to PATH"
- Restart terminal

### Environment doesn't activate
- Run `.\manager.ps1` option 1 to recreate
- Verify that `.venv` folder exists

### "Module not found"
- Make sure environment is activated (.venv)
- Use option 3 from manager to install
- Save to requirements with option 4

## What are Helpers?

**Helpers** are small and useful functions you can reuse in your project:

### What are they for?
- **Avoid repeating code**: Write a function once, use it many times
- **Better organization**: Cleaner and easier to understand code
- **Save time**: Ready functions for common tasks
- **Easier maintenance**: If you need to change something, do it in one place

### Examples in helpers.py
```python
# Instead of writing this many times:
total = sum(numbers)
average = total / len(numbers)

# Use the helper:
from helpers import calculate_statistics
stats = calculate_statistics(numbers)
print(f"Average: {stats['average']}")
```

### Tip for beginners
Every time you notice you're copying and pasting code, it's time to create a helper!

---



## Learning Resources for Python

### Official documentation
- [Python.org - Official tutorial](https://docs.python.org/3/tutorial/) - Complete official guide
- [Python.org - Language reference](https://docs.python.org/3/reference/) - Technical documentation

### Recommended learning sites
- [Real Python](https://realpython.com/) - Practical tutorials and projects
- [GeeksforGeeks Python](https://www.geeksforgeeks.org/python-programming-language/) - Concepts and examples
- [W3Schools Python](https://www.w3schools.com/python/) - Interactive basic course
- [Automate the Boring Stuff](https://automatetheboringstuff.com/) - Practical Python

### Specific libraries
- [Pandas - Data analysis](https://pandas.pydata.org/docs/user_guide/index.html)
- [NumPy - Numerical computing](https://numpy.org/doc/stable/user/)
- [Matplotlib - Graphics](https://matplotlib.org/stable/tutorials/index.html)
- [Requests - Simple HTTP](https://docs.python-requests.org/en/latest/)

### YouTube channels (in English)
- [Corey Schafer](https://www.youtube.com/@coreyms) - Python tutorials
- [Programming with Mosh](https://www.youtube.com/@programmingwithmosh) - Beginner-friendly
- [Tech With Tim](https://www.youtube.com/@TechWithTim) - Python projects

Once you feel comfortable with this basic template, consider migrating to the **Complete Template** which includes:
- Professional folder structure
- Separation between data, scripts and results
- Organized Jupyter notebooks
- Reusable helpers

---

## Project Notes

**Use this space to write down important things about your specific project:**

- Important dates:
- Useful links:
- Team contacts:
- Decisions made:

---

**Remember:** This README is a living document. Update it as your project grows.

## Authors

- rafaelmedina435
- Claude (Anthropic)
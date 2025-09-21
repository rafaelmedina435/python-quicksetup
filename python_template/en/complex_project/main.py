#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Complete Template - main.py
===========================

Main project file with professional structure.
This file orchestrates the different parts of the project.

Author: Your name
Date: {current_date}
Project: My Complete Python Project
"""

import os
import sys
from pathlib import Path

# Add helpers directory to path for importing custom modules
sys.path.append(str(Path(__file__).parent / "helpers"))

# Standard imports
from datetime import datetime
import logging

# Third-party imports (uncomment as needed)
# import pandas as pd
# import numpy as np
# import matplotlib.pyplot as plt

# Local imports (uncomment when you create the modules)
# from helpers.data_processor import DataProcessor
# from helpers.file_manager import FileManager

def setup_logging():
    """
    Configure the logging system for the project.
    Logs are saved in the data/logs/ folder
    """
    # Create logs directory if it doesn't exist
    log_dir = Path("data/logs")
    log_dir.mkdir(parents=True, exist_ok=True)

    # Configure logging
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
        handlers=[
            logging.FileHandler(log_dir / f"project_{datetime.now().strftime('%Y%m%d')}.log"),
            logging.StreamHandler()
        ]
    )
    return logging.getLogger(__name__)

def verify_project_structure():
    """
    Verify that all necessary folders exist.
    Create them if they don't exist.
    """
    required_folders = [
        "data/inputs",
        "data/results",
        "data/logs",
        "notebooks",
        "scripts",
        "helpers"
    ]

    print("📁 Verifying project structure...")
    for folder in required_folders:
        Path(folder).mkdir(parents=True, exist_ok=True)
        print(f"   ✅ {folder}")

    print("✅ Project structure verified")

def show_project_info():
    """
    Show general project information.
    """
    print("🏢 Complete Template - Professional Python Project")
    print("=" * 50)
    print(f"📅 Date: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print(f"📂 Directory: {Path.cwd()}")
    print(f"🐍 Python: {sys.version.split()[0]}")
    print("=" * 50)

def data_processing_example():
    """
    Example of how to structure data processing.
    """
    print("\n📊 Data processing example:")
    print("   → Input data goes in: data/inputs/")
    print("   → Results are saved in: data/results/")
    print("   → Logs are stored in: data/logs/")

    # Example workflow
    print("\n🔄 Recommended workflow:")
    print("   1. Load data from data/inputs/")
    print("   2. Process using functions from helpers/")
    print("   3. Save results in data/results/")
    print("   4. Document in notebooks/")

def pandas_example():
    """
    More advanced example using pandas for data analysis.
    """
    print("\n📈 Advanced example with pandas:")
    print("   (Requires: pip install pandas openpyxl)")

    # Uncomment when you have pandas installed:
    # try:
    #     import pandas as pd
    #
    #     # Create example data
    #     example_data = {
    #         'Date': pd.date_range('2024-01-01', periods=10),
    #         'Sales': [100, 150, 200, 175, 300, 250, 400, 350, 500, 450],
    #         'Product': ['A', 'B', 'A', 'C', 'B', 'A', 'C', 'B', 'A', 'C']
    #     }
    #
    #     df = pd.DataFrame(example_data)
    #
    #     # Save in data/results/
    #     output_path = Path("data/results/example_data.xlsx")
    #     df.to_excel(output_path, index=False)
    #
    #     print(f"   ✅ Data saved to: {output_path}")
    #     print(f"   📊 Rows processed: {len(df)}")
    #
    # except ImportError:
    #     print("   ⚠️ Pandas not installed. Run: pip install pandas openpyxl")

def main():
    """
    Main function of the program.
    Coordinates all project operations.
    """
    # Configure logging
    logger = setup_logging()
    logger.info("Starting application")

    # Show information
    show_project_info()

    # Verify structure
    verify_project_structure()

    # Usage examples
    data_processing_example()
    pandas_example()

    print("\n🎉 Program executed successfully!")
    print("\n💡 Next steps:")
    print("   1. Install packages: pip install pandas numpy matplotlib openpyxl")
    print("   2. Save dependencies: .\\save_packages.ps1")
    print("   3. Explore notebooks in: notebooks/")
    print("   4. Create reusable functions in: helpers/")
    print("   5. Read README.md for complete guide")

    logger.info("Application finished successfully")

# Execute main program
if __name__ == "__main__":
    main()
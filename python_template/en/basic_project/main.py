#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Basic Template - main.py
========================

This is your main file where you'll write your code.
Here are some basic examples to get you started.

Author: Your name
Date: {current_date}
Project: My Python Project
"""

import os
import sys
from pathlib import Path

# Add helpers to path to use our functions
sys.path.append(str(Path(__file__).parent / "helpers"))

# Basic imports (uncomment the ones you need)
# import pandas as pd
# import numpy as np
# import matplotlib.pyplot as plt
from datetime import datetime

# Import our helper functions
from helpers import greet, calculate_statistics, save_result

def initial_greeting():
    """
    Example function that shows an initial greeting.
    """
    print("🐍 Welcome to your Python project!")
    print("=" * 40)
    print("📝 This is your main.py file")
    print("💡 Edit this code according to your needs")
    print("=" * 40)

def basic_example():
    """
    Basic example of Python operations using helpers.
    """
    print("\n📊 Basic example with helpers:")

    # Use helper function
    message = greet("Anna")
    print(f"   {message}")

    # Basic variables
    numbers = [10, 25, 30, 15, 45, 20, 35]
    print(f"   Number list: {numbers}")

    # Use helper to calculate statistics
    stats = calculate_statistics(numbers)
    print(f"   📈 Average: {stats['average']:.2f}")
    print(f"   📊 Maximum: {stats['maximum']}")
    print(f"   📉 Minimum: {stats['minimum']}")

def input_example():
    """
    Example of user interaction using helpers.
    """
    print("\n💬 Interaction example:")
    name = input("   What's your name? ")

    # Use helper to create personalized message
    personalized_message = greet(name)
    print(f"   {personalized_message}")

def save_data_example():
    """
    Example of how to save results using helpers.
    """
    print("\n💾 Save data example:")

    # Create some example data
    example_data = {
        'date': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
        'user': 'Test user',
        'processed_numbers': [1, 2, 3, 4, 5],
        'statistics': calculate_statistics([1, 2, 3, 4, 5])
    }

    # Use helper to save
    created_file = save_result(example_data, "example_results")
    print(f"   ✅ Data saved to: {created_file}")

def pandas_example():
    """
    Basic example with pandas (requires: pip install pandas).
    Uncomment this code when you install pandas.
    """
    print("\n📈 Pandas example:")
    print("   (Install pandas first: pip install pandas)")

    # Uncomment these lines when you have pandas installed:
    # import pandas as pd
    #
    # # Create a simple DataFrame
    # data = {
    #     'Name': ['Anna', 'Carlos', 'Maria'],
    #     'Age': [25, 30, 35],
    #     'City': ['Madrid', 'Barcelona', 'Valencia']
    # }
    # df = pd.DataFrame(data)
    # print("   📋 DataFrame created:")
    # print(df.to_string(index=False))
    #
    # # Save using helper
    # excel_file = save_result(df, "people_data", format="excel")
    # print(f"   💾 Excel saved: {excel_file}")

def main():
    """
    Main function of the program.
    """
    initial_greeting()
    basic_example()
    input_example()
    save_data_example()
    pandas_example()

    print("\n🎉 Program executed successfully!")
    print("\n💡 Next steps:")
    print("   1. Install packages: pip install pandas numpy matplotlib")
    print("   2. Save dependencies: .\\save_packages.ps1")
    print("   3. Check the helpers/helpers.py file for more functions")
    print("   4. Edit this file according to your project")
    print("   5. Read the README.md for more information")

# Execute the main program
if __name__ == "__main__":
    main()
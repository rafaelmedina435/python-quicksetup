#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
helpers.py - Basic Template
===========================

Useful and reusable functions for your project.
This file contains simple examples of helper functions.

What are helpers?
- Small functions that you write once and reuse many times
- Code that repeats in several places
- Utilities that simplify common tasks

Author: Your name
Date: {current_date}
"""

import json
from datetime import datetime
from pathlib import Path


def greet(name):
    """
    Creates a personalized greeting.

    Usage example:
    >>> message = greet("Anna")
    >>> print(message)
    Hello Anna! 👋 Welcome to the project.

    Parameters:
    -----------
    name : str
        The name of the person to greet

    Returns:
    --------
    str : Personalized greeting message
    """
    return f"Hello {name}! 👋 Welcome to the project."


def calculate_statistics(numbers):
    """
    Calculates basic statistics from a list of numbers.

    Usage example:
    >>> stats = calculate_statistics([1, 2, 3, 4, 5])
    >>> print(f"Average: {stats['average']}")
    Average: 3.0

    Parameters:
    -----------
    numbers : list
        List of numbers to calculate statistics

    Returns:
    --------
    dict : Dictionary with basic statistics
    """
    if not numbers:
        return {
            'average': 0,
            'sum': 0,
            'count': 0,
            'maximum': None,
            'minimum': None
        }

    return {
        'average': sum(numbers) / len(numbers),
        'sum': sum(numbers),
        'count': len(numbers),
        'maximum': max(numbers),
        'minimum': min(numbers)
    }


def clean_text(text):
    """
    Cleans text by removing extra spaces and converting to lowercase.

    Usage example:
    >>> clean_text = clean_text("  HELLO WORLD  ")
    >>> print(clean_text)
    hello world

    Parameters:
    -----------
    text : str
        Text to clean

    Returns:
    --------
    str : Clean text
    """
    if not isinstance(text, str):
        return str(text)

    return text.strip().lower()


def is_even_number(number):
    """
    Checks if a number is even.

    Usage example:
    >>> is_even_number(4)
    True
    >>> is_even_number(5)
    False

    Parameters:
    -----------
    number : int
        Number to check

    Returns:
    --------
    bool : True if even, False if odd
    """
    try:
        return int(number) % 2 == 0
    except (ValueError, TypeError):
        return False


def create_folder_if_not_exists(folder_path):
    """
    Creates a folder if it doesn't exist.

    Usage example:
    >>> create_folder_if_not_exists("results")
    >>> print("Folder ready to use")

    Parameters:
    -----------
    folder_path : str
        Path of the folder to create

    Returns:
    --------
    bool : True if the folder exists or was created successfully
    """
    try:
        Path(folder_path).mkdir(parents=True, exist_ok=True)
        return True
    except Exception as e:
        print(f"Error creating folder {folder_path}: {e}")
        return False


def save_result(data, filename, format="json"):
    """
    Saves data to a file with automatic timestamp.

    Usage example:
    >>> data = {"message": "Hello world", "date": "2024-03-15"}
    >>> file = save_result(data, "my_result")
    >>> print(f"Saved to: {file}")

    Parameters:
    -----------
    data : dict, list, or pandas.DataFrame
        Data to save
    filename : str
        Base filename (without extension)
    format : str
        File format: "json", "txt", "excel"

    Returns:
    --------
    str : Path of the created file
    """
    # Create results folder if it doesn't exist
    results_folder = "results"
    create_folder_if_not_exists(results_folder)

    # Add timestamp to name
    timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')

    try:
        if format.lower() == "json":
            full_name = f"{filename}_{timestamp}.json"
            full_path = Path(results_folder) / full_name

            with open(full_path, 'w', encoding='utf-8') as f:
                json.dump(data, f, indent=2, ensure_ascii=False, default=str)

        elif format.lower() == "txt":
            full_name = f"{filename}_{timestamp}.txt"
            full_path = Path(results_folder) / full_name

            with open(full_path, 'w', encoding='utf-8') as f:
                if isinstance(data, dict):
                    for key, value in data.items():
                        f.write(f"{key}: {value}\n")
                else:
                    f.write(str(data))

        elif format.lower() == "excel":
            # Only works if you have pandas installed
            try:
                import pandas as pd
                full_name = f"{filename}_{timestamp}.xlsx"
                full_path = Path(results_folder) / full_name

                if isinstance(data, dict):
                    # Convert dict to DataFrame
                    df = pd.DataFrame([data])
                elif hasattr(data, 'to_excel'):
                    # Already a DataFrame
                    df = data
                else:
                    # Convert to DataFrame as possible
                    df = pd.DataFrame(data)

                df.to_excel(full_path, index=False)

            except ImportError:
                print("⚠️ pandas is not installed. Saving as JSON...")
                return save_result(data, filename, "json")

        else:
            raise ValueError(f"Unsupported format: {format}")

        print(f"✅ File saved: {full_path}")
        return str(full_path)

    except Exception as e:
        print(f"❌ Error saving file: {e}")
        return None


def get_current_date():
    """
    Gets the current date and time in readable format.

    Usage example:
    >>> date = get_current_date()
    >>> print(date)
    2024-03-15 14:30:25

    Returns:
    --------
    str : Current date and time
    """
    return datetime.now().strftime('%Y-%m-%d %H:%M:%S')


def count_words(text):
    """
    Counts words in a text.

    Usage example:
    >>> count = count_words("Hello world Python")
    >>> print(f"Words: {count}")
    Words: 3

    Parameters:
    -----------
    text : str
        Text to count words

    Returns:
    --------
    int : Number of words
    """
    if not isinstance(text, str):
        return 0

    return len(text.strip().split())


def filter_even_numbers(number_list):
    """
    Filters only even numbers from a list.

    Usage example:
    >>> evens = filter_even_numbers([1, 2, 3, 4, 5, 6])
    >>> print(evens)
    [2, 4, 6]

    Parameters:
    -----------
    number_list : list
        List of numbers to filter

    Returns:
    --------
    list : List with only even numbers
    """
    return [num for num in number_list if is_even_number(num)]


# Example of how to use the functions
if __name__ == "__main__":
    print("🧪 Testing helper functions...")
    print("=" * 40)

    # Test greeting
    message = greet("Test User")
    print(f"1. {message}")

    # Test statistics
    example_numbers = [10, 20, 30, 40, 50]
    stats = calculate_statistics(example_numbers)
    print(f"2. Statistics of {example_numbers}:")
    print(f"   Average: {stats['average']}")
    print(f"   Maximum: {stats['maximum']}")

    # Test even filter
    all_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    only_evens = filter_even_numbers(all_numbers)
    print(f"3. Even numbers in {all_numbers}: {only_evens}")

    # Test saving
    test_data = {
        'date': get_current_date(),
        'message': 'Successful test',
        'statistics': stats
    }
    created_file = save_result(test_data, "helper_test")
    print(f"4. File saved: {created_file}")

    print("\n🎉 All functions work correctly!")
    print("💡 Now you can use these functions in main.py")
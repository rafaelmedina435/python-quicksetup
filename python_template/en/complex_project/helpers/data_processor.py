#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
data_processor.py
=================

Module with reusable functions for data processing.
Includes validations, transformations and data cleaning.

Author: Your name
Date: {current_date}
"""

import pandas as pd
import numpy as np
from datetime import datetime
from pathlib import Path
import logging

# Configure logging
logger = logging.getLogger(__name__)


def validate_dataframe(df, dataset_name="Dataset"):
    """
    Validates a DataFrame and reports common issues.

    Parameters:
    -----------
    df : pandas.DataFrame
        DataFrame to validate
    dataset_name : str
        Descriptive name of the dataset for reports

    Returns:
    --------
    dict : Dictionary with validation report
    """
    report = {
        'dataset': dataset_name,
        'rows': len(df),
        'columns': len(df.columns),
        'null_values': df.isnull().sum().sum(),
        'duplicates': df.duplicated().sum(),
        'memory_mb': df.memory_usage(deep=True).sum() / (1024 ** 2),
        'columns_with_nulls': df.columns[df.isnull().any()].tolist(),
        'data_types': df.dtypes.to_dict()
    }

    logger.info(f"Validation completed for {dataset_name}")
    logger.info(f"  - Dimensions: {report['rows']} rows x {report['columns']} columns")
    logger.info(f"  - Null values: {report['null_values']}")
    logger.info(f"  - Duplicates: {report['duplicates']}")

    return report


def clean_column_names(df):
    """
    Cleans and standardizes column names.

    Parameters:
    -----------
    df : pandas.DataFrame
        DataFrame with columns to clean

    Returns:
    --------
    pandas.DataFrame : DataFrame with clean columns
    """
    df_clean = df.copy()

    # Clean column names
    df_clean.columns = (df_clean.columns
                        .str.strip()  # Remove spaces
                        .str.lower()  # Lowercase
                        .str.replace(' ', '_')  # Spaces to underscores
                        .str.replace('[^a-zA-Z0-9_]', '', regex=True)  # Only alphanumeric and _
                        .str.replace('_+', '_', regex=True)  # Multiple _ to single _
                        .str.strip('_'))  # Remove _ at start/end

    logger.info(f"Column names cleaned: {list(df_clean.columns)}")
    return df_clean


def detect_outliers_iqr(series, multiplier=1.5):
    """
    Detects outliers using the IQR (Interquartile Range) method.

    Parameters:
    -----------
    series : pandas.Series
        Numeric series to analyze
    multiplier : float
        Multiplier for IQR range (default: 1.5)

    Returns:
    --------
    dict : Information about detected outliers
    """
    if not pd.api.types.is_numeric_dtype(series):
        logger.warning(f"Series {series.name} is not numeric, skipping outlier detection")
        return None

    Q1 = series.quantile(0.25)
    Q3 = series.quantile(0.75)
    IQR = Q3 - Q1

    lower_bound = Q1 - multiplier * IQR
    upper_bound = Q3 + multiplier * IQR

    outliers_mask = (series < lower_bound) | (series > upper_bound)
    outliers = series[outliers_mask]

    result = {
        'column': series.name,
        'total_values': len(series),
        'outliers_detected': len(outliers),
        'outliers_percentage': (len(outliers) / len(series)) * 100,
        'lower_bound': lower_bound,
        'upper_bound': upper_bound,
        'outlier_values': outliers.tolist(),
        'outlier_indices': outliers.index.tolist()
    }

    logger.info(f"Outliers in {series.name}: {len(outliers)} ({result['outliers_percentage']:.1f}%)")
    return result


def process_dates(df, date_column, date_format=None):
    """
    Converts a column to datetime format and extracts useful components.

    Parameters:
    -----------
    df : pandas.DataFrame
        DataFrame containing the date column
    date_column : str
        Name of the column with dates
    date_format : str, optional
        Specific date format (e.g., '%Y-%m-%d')

    Returns:
    --------
    pandas.DataFrame : DataFrame with processed date columns
    """
    df_processed = df.copy()

    try:
        # Convert to datetime
        if date_format:
            df_processed[date_column] = pd.to_datetime(df_processed[date_column],
                                                       format=date_format)
        else:
            df_processed[date_column] = pd.to_datetime(df_processed[date_column])

        # Extract useful components
        date_col = df_processed[date_column]
        base_name = date_column.replace('_date', '').replace('date_', '')

        df_processed[f'{base_name}_year'] = date_col.dt.year
        df_processed[f'{base_name}_month'] = date_col.dt.month
        df_processed[f'{base_name}_day'] = date_col.dt.day
        df_processed[f'{base_name}_day_name'] = date_col.dt.day_name()
        df_processed[f'{base_name}_quarter'] = date_col.dt.quarter
        df_processed[f'{base_name}_is_weekend'] = date_col.dt.weekday >= 5

        logger.info(f"Column {date_column} processed successfully")
        logger.info(f"  - Range: {date_col.min()} to {date_col.max()}")
        logger.info(f"  - Columns created: year, month, day, day_name, quarter, is_weekend")

    except Exception as e:
        logger.error(f"Error processing dates in column {date_column}: {str(e)}")
        raise

    return df_processed


def create_executive_summary(df, numeric_columns=None, categorical_columns=None):
    """
    Creates a complete executive summary of the DataFrame.

    Parameters:
    -----------
    df : pandas.DataFrame
        DataFrame to summarize
    numeric_columns : list, optional
        List of specific numeric columns to analyze
    categorical_columns : list, optional
        List of specific categorical columns to analyze

    Returns:
    --------
    dict : Dictionary with executive summary
    """
    # Auto-detect columns if not specified
    if numeric_columns is None:
        numeric_columns = df.select_dtypes(include=[np.number]).columns.tolist()

    if categorical_columns is None:
        categorical_columns = df.select_dtypes(include=['object', 'category']).columns.tolist()

    summary = {
        'general_information': {
            'rows': len(df),
            'columns': len(df.columns),
            'memory_mb': df.memory_usage(deep=True).sum() / (1024 ** 2),
            'analysis_date': datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        },
        'data_quality': {
            'total_null_values': df.isnull().sum().sum(),
            'duplicate_rows': df.duplicated().sum(),
            'completeness_percentage': ((df.size - df.isnull().sum().sum()) / df.size) * 100
        },
        'numeric_columns': {},
        'categorical_columns': {}
    }

    # Analysis of numeric columns
    for col in numeric_columns:
        if col in df.columns:
            series = df[col].dropna()
            summary['numeric_columns'][col] = {
                'count': len(series),
                'mean': series.mean(),
                'std': series.std(),
                'min': series.min(),
                'max': series.max(),
                'q25': series.quantile(0.25),
                'q50': series.quantile(0.50),
                'q75': series.quantile(0.75),
                'null_values': df[col].isnull().sum()
            }

    # Analysis of categorical columns
    for col in categorical_columns:
        if col in df.columns:
            value_counts = df[col].value_counts()
            summary['categorical_columns'][col] = {
                'unique_values': df[col].nunique(),
                'most_frequent_value': value_counts.index[0] if len(value_counts) > 0 else None,
                'max_frequency': value_counts.iloc[0] if len(value_counts) > 0 else 0,
                'null_values': df[col].isnull().sum(),
                'top_5_values': value_counts.head().to_dict()
            }

    logger.info("Executive summary generated successfully")
    return summary


def export_clean_data(df, filename, destination_folder="../data/resultados"):
    """
    Exports the clean DataFrame to Excel with timestamp.

    Parameters:
    -----------
    df : pandas.DataFrame
        DataFrame to export
    filename : str
        Base filename (without extension)
    destination_folder : str
        Folder where to save the file

    Returns:
    --------
    str : Complete path of saved file
    """
    # Create folder if it doesn't exist
    Path(destination_folder).mkdir(parents=True, exist_ok=True)

    # Generate name with timestamp
    timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
    complete_name = f"{filename}_{timestamp}.xlsx"
    complete_path = Path(destination_folder) / complete_name

    # Export
    df.to_excel(complete_path, index=False)

    logger.info(f"Data exported successfully: {complete_path}")
    return str(complete_path)


# Additional utility functions
def print_pretty_summary(summary_dict):
    """
    Prints a summary in a readable and organized way.
    """
    print("EXECUTIVE SUMMARY")
    print("=" * 50)

    # General information
    info = summary_dict['general_information']
    print(f"Dimensions: {info['rows']:,} rows × {info['columns']} columns")
    print(f"Memory: {info['memory_mb']:.2f} MB")
    print(f"Analysis: {info['analysis_date']}")
    print()

    # Data quality
    quality = summary_dict['data_quality']
    print("DATA QUALITY")
    print("-" * 30)
    print(f"Null values: {quality['total_null_values']:,}")
    print(f"Duplicate rows: {quality['duplicate_rows']:,}")
    print(f"Completeness: {quality['completeness_percentage']:.1f}%")
    print()

    # Numeric columns
    if summary_dict['numeric_columns']:
        print("NUMERIC COLUMNS")
        print("-" * 30)
        for col, stats in summary_dict['numeric_columns'].items():
            print(f"{col}: μ={stats['mean']:.2f}, σ={stats['std']:.2f}, range=[{stats['min']:.2f}, {stats['max']:.2f}]")
        print()

    # Categorical columns
    if summary_dict['categorical_columns']:
        print("CATEGORICAL COLUMNS")
        print("-" * 30)
        for col, stats in summary_dict['categorical_columns'].items():
            print(f"{col}: {stats['unique_values']} unique values, most frequent: '{stats['most_frequent_value']}'")


if __name__ == "__main__":
    # Test code
    print("Testing data_processor module...")

    # Create example data
    sample_data = pd.DataFrame({
        'date': pd.date_range('2024-01-01', periods=100),
        'sales': np.random.randint(100, 1000, 100),
        'PRODUCT ': ['A', 'B', 'C'] * 33 + ['A'],  # Intentional spaces and capitals
        'region': ['North', 'South', 'Center'] * 33 + ['North']
    })

    # Introduce some nulls and duplicates for testing
    sample_data.loc[5, 'sales'] = np.nan
    sample_data.loc[10] = sample_data.loc[0]  # Duplicate

    print("Sample data created")

    # Test functions
    report = validate_dataframe(sample_data, "Test Data")
    clean_data = clean_column_names(sample_data)
    sales_outliers = detect_outliers_iqr(clean_data['sales'])
    data_with_dates = process_dates(clean_data, 'date')
    summary = create_executive_summary(data_with_dates)

    print_pretty_summary(summary)

    print("\nAll functions tested successfully!")
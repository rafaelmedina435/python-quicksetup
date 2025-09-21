#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
file_manager.py
===============

Module for intelligent file management in data projects.
Includes automatic loading, validation and file organization.

Author: Your name
Date: {current_date}
"""

import pandas as pd
import json
from pathlib import Path
from datetime import datetime
import logging
import shutil
from typing import List, Dict, Optional, Union

# Configure logging
logger = logging.getLogger(__name__)


class FileManager:
    """
    File manager for data projects with advanced functionalities.
    """

    def __init__(self, project_directory: str = "."):
        """
        Initializes the file manager.

        Parameters:
        -----------
        project_directory : str
            Path to the project root directory
        """
        self.project_directory = Path(project_directory)
        self.input_directory = self.project_directory / "data" / "input"
        self.results_directory = self.project_directory / "data" / "resultados"
        self.logs_directory = self.project_directory / "data" / "logs"

        # Create directories if they don't exist
        self._create_directory_structure()

        logger.info(f"FileManager initialized in: {self.project_directory}")

    def _create_directory_structure(self):
        """Creates the necessary directory structure."""
        directories = [
            self.input_directory,
            self.results_directory,
            self.logs_directory
        ]

        for directory in directories:
            directory.mkdir(parents=True, exist_ok=True)

        logger.debug("Directory structure verified")

    def list_files(self, directory: str = "input", extension: str = None) -> List[Path]:
        """
        Lists files in a specific directory.

        Parameters:
        -----------
        directory : str
            Directory to list ('input', 'result', 'logs')
        extension : str, optional
            Filter by extension (e.g., '.xlsx', '.csv')

        Returns:
        --------
        List[Path] : List of file paths
        """
        directory_map = {
            'input': self.input_directory,
            'result': self.results_directory,
            'logs': self.logs_directory
        }

        if directory not in directory_map:
            raise ValueError(f"Directory must be one of: {list(directory_map.keys())}")

        path = directory_map[directory]
        pattern = f"*{extension}" if extension else "*"
        files = list(path.glob(pattern))

        logger.info(f"Found {len(files)} files in {directory}")
        return files

    def load_file_auto(self, filename: str, directory: str = "input") -> pd.DataFrame:
        """
        Automatically loads a file detecting its format.

        Parameters:
        -----------
        filename : str
            Name of the file to load
        directory : str
            Directory where to search ('input', 'result')

        Returns:
        --------
        pd.DataFrame : DataFrame with loaded data
        """
        directory_map = {
            'input': self.input_directory,
            'result': self.results_directory
        }

        file_path = directory_map[directory] / filename

        if not file_path.exists():
            raise FileNotFoundError(f"File not found: {file_path}")

        # Detect format and load
        extension = file_path.suffix.lower()

        try:
            if extension in ['.xlsx', '.xls']:
                df = pd.read_excel(file_path)
                logger.info(f"Excel file loaded: {filename}")

            elif extension == '.csv':
                # Try to detect delimiter
                df = self._load_csv_intelligent(file_path)
                logger.info(f"CSV file loaded: {filename}")

            elif extension == '.json':
                df = pd.read_json(file_path)
                logger.info(f"JSON file loaded: {filename}")

            elif extension in ['.txt', '.tsv']:
                df = pd.read_csv(file_path, sep='\t')
                logger.info(f"Text file loaded: {filename}")

            else:
                raise ValueError(f"Unsupported file format: {extension}")

            # Validate loading
            logger.info(f"  - Dimensions: {df.shape[0]} rows × {df.shape[1]} columns")
            logger.info(f"  - Memory: {df.memory_usage(deep=True).sum() / (1024 ** 2):.2f} MB")

            return df

        except Exception as e:
            logger.error(f"Error loading file {filename}: {str(e)}")
            raise

    def _load_csv_intelligent(self, file_path: Path) -> pd.DataFrame:
        """
        Loads a CSV automatically detecting delimiter and encoding.
        """
        delimiters = [',', ';', '\t', '|']
        encodings = ['utf-8', 'latin-1', 'cp1252']

        for encoding in encodings:
            for delim in delimiters:
                try:
                    df = pd.read_csv(file_path, sep=delim, encoding=encoding, nrows=5)
                    if df.shape[1] > 1:  # If it has more than one column, probably correct
                        # Load complete file
                        complete_df = pd.read_csv(file_path, sep=delim, encoding=encoding)
                        logger.debug(f"CSV loaded with delimiter '{delim}' and encoding '{encoding}'")
                        return complete_df
                except:
                    continue

        # If nothing works, use default configuration
        logger.warning("Could not detect CSV format, using default configuration")
        return pd.read_csv(file_path)

    def save_dataframe(self, df: pd.DataFrame, filename: str,
                      include_timestamp: bool = True,
                      format: str = 'xlsx') -> Path:
        """
        Saves a DataFrame in the results directory.

        Parameters:
        -----------
        df : pd.DataFrame
            DataFrame to save
        filename : str
            Base filename (without extension)
        include_timestamp : bool
            Whether to include timestamp in the name
        format : str
            Output format ('xlsx', 'csv', 'json')

        Returns:
        --------
        Path : Complete path of saved file
        """
        # Generate complete name
        if include_timestamp:
            timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
            complete_name = f"{filename}_{timestamp}.{format}"
        else:
            complete_name = f"{filename}.{format}"

        complete_path = self.results_directory / complete_name

        # Save according to format
        try:
            if format == 'xlsx':
                df.to_excel(complete_path, index=False)
            elif format == 'csv':
                df.to_csv(complete_path, index=False, encoding='utf-8')
            elif format == 'json':
                df.to_json(complete_path, orient='records', indent=2, force_ascii=False)
            else:
                raise ValueError(f"Unsupported format: {format}")

            logger.info(f"DataFrame saved: {complete_path}")
            logger.info(f"  - Format: {format.upper()}")
            logger.info(f"  - Dimensions: {df.shape[0]} rows × {df.shape[1]} columns")

            return complete_path

        except Exception as e:
            logger.error(f"Error saving file: {str(e)}")
            raise

    def create_backup(self, source_directory: str = "result") -> Path:
        """
        Creates a compressed backup of a directory.

        Parameters:
        -----------
        source_directory : str
            Directory to backup ('input', 'result')

        Returns:
        --------
        Path : Path of created backup file
        """
        directory_map = {
            'input': self.input_directory,
            'result': self.results_directory
        }

        if source_directory not in directory_map:
            raise ValueError(f"Directory must be one of: {list(directory_map.keys())}")

        source = directory_map[source_directory]
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        backup_name = f"backup_{source_directory}_{timestamp}"
        backup_path = self.project_directory / f"{backup_name}.zip"

        # Create backup
        shutil.make_archive(str(backup_path.with_suffix('')), 'zip', str(source))

        logger.info(f"Backup created: {backup_path}")
        return backup_path

    def organize_files_by_date(self, directory: str = "result"):
        """
        Organizes files in subdirectories by creation date.

        Parameters:
        -----------
        directory : str
            Directory to organize ('result')
        """
        if directory != "result":
            raise ValueError("Only 'result' directory can be organized")

        files = self.list_files(directory)
        files_moved = 0

        for file in files:
            if file.is_file():
                # Get creation date
                creation_date = datetime.fromtimestamp(file.stat().st_ctime)
                date_folder = creation_date.strftime('%Y-%m')

                # Create month folder if doesn't exist
                destination_folder = self.results_directory / date_folder
                destination_folder.mkdir(exist_ok=True)

                # Move file
                new_path = destination_folder / file.name
                if not new_path.exists():
                    shutil.move(str(file), str(new_path))
                    files_moved += 1

        logger.info(f"Files organized: {files_moved} files moved")

    def generate_files_report(self) -> Dict:
        """
        Generates a complete report about project files.

        Returns:
        --------
        Dict : Report with file statistics
        """
        report = {
            'report_date': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
            'project_directory': str(self.project_directory),
            'directories': {}
        }

        # Analyze each directory
        directories = {
            'input': self.input_directory,
            'result': self.results_directory,
            'logs': self.logs_directory
        }

        for name, path in directories.items():
            if path.exists():
                files = list(path.rglob('*'))
                files_only = [f for f in files if f.is_file()]

                # Statistics by extension
                extensions = {}
                total_size = 0

                for file in files_only:
                    ext = file.suffix.lower() or 'no_extension'
                    if ext not in extensions:
                        extensions[ext] = {'count': 0, 'size_mb': 0}

                    file_size = file.stat().st_size
                    extensions[ext]['count'] += 1
                    extensions[ext]['size_mb'] += file_size / (1024 ** 2)
                    total_size += file_size

                report['directories'][name] = {
                    'total_files': len(files_only),
                    'total_folders': len([f for f in files if f.is_dir()]),
                    'total_size_mb': total_size / (1024 ** 2),
                    'extensions': extensions,
                    'newest_file': max(files_only,
                                      key=lambda x: x.stat().st_mtime).name if files_only else None,
                    'oldest_file': min(files_only,
                                      key=lambda x: x.stat().st_mtime).name if files_only else None
                }

        logger.info("Files report generated")
        return report

    def clean_temporary_files(self, pattern: str = "temp_*", days_old: int = 7):
        """
        Cleans temporary or old files.

        Parameters:
        -----------
        pattern : str
            Pattern of filenames to clean
        days_old : int
            Delete files older than this number of days
        """
        import time

        files_deleted = 0
        time_limit = time.time() - (days_old * 24 * 60 * 60)

        for directory in [self.results_directory, self.logs_directory]:
            for file in directory.glob(pattern):
                if file.is_file() and file.stat().st_mtime < time_limit:
                    try:
                        file.unlink()
                        files_deleted += 1
                        logger.debug(f"File deleted: {file.name}")
                    except Exception as e:
                        logger.error(f"Error deleting {file.name}: {str(e)}")

        logger.info(f"Cleanup completed: {files_deleted} files deleted")

    def export_metadata(self, filename: str = "project_metadata"):
        """
        Exports project metadata to JSON.

        Parameters:
        -----------
        filename : str
            Base filename for metadata file
        """
        report = self.generate_files_report()

        # Add additional information
        metadata = {
            'files_report': report,
            'configuration': {
                'project_directory': str(self.project_directory),
                'structure_created': True,
                'python_version': f"{__import__('sys').version_info.major}.{__import__('sys').version_info.minor}",
                'creation_timestamp': datetime.now().isoformat()
            }
        }

        # Save metadata
        metadata_path = self.project_directory / f"{filename}.json"

        with open(metadata_path, 'w', encoding='utf-8') as f:
            json.dump(metadata, f, indent=2, ensure_ascii=False, default=str)

        logger.info(f"Metadata exported: {metadata_path}")
        return metadata_path


# Independent utility functions
def find_similar_files(directory: Path, base_name: str, threshold: float = 0.8) -> List[Path]:
    """
    Finds files with similar names using approximate matching.

    Parameters:
    -----------
    directory : Path
        Directory where to search
    base_name : str
        Base name to compare
    threshold : float
        Similarity threshold (0-1)

    Returns:
    --------
    List[Path] : List of similar files
    """
    from difflib import SequenceMatcher

    similar_files = []

    for file in directory.glob('*'):
        if file.is_file():
            # Compare names without extension
            name_without_ext = file.stem.lower()
            base_name_lower = base_name.lower()

            similarity = SequenceMatcher(None, base_name_lower, name_without_ext).ratio()

            if similarity >= threshold:
                similar_files.append((file, similarity))

    # Sort by similarity descending
    similar_files.sort(key=lambda x: x[1], reverse=True)

    return [file for file, _ in similar_files]


def validate_file_integrity(file_path: Path) -> Dict:
    """
    Validates the integrity of a data file.

    Parameters:
    -----------
    file_path : Path
        Path to file to validate

    Returns:
    --------
    Dict : Validation report
    """
    report = {
        'file': str(file_path),
        'exists': file_path.exists(),
        'is_file': file_path.is_file() if file_path.exists() else False,
        'size_bytes': file_path.stat().st_size if file_path.exists() else 0,
        'extension': file_path.suffix.lower(),
        'readable': False,
        'rows': 0,
        'columns': 0,
        'errors': []
    }

    if not report['exists']:
        report['errors'].append("File does not exist")
        return report

    if not report['is_file']:
        report['errors'].append("Path does not point to a file")
        return report

    if report['size_bytes'] == 0:
        report['errors'].append("Empty file")
        return report

    # Try to read the file
    try:
        if report['extension'] in ['.xlsx', '.xls']:
            df = pd.read_excel(file_path, nrows=5)
        elif report['extension'] == '.csv':
            df = pd.read_csv(file_path, nrows=5)
        elif report['extension'] == '.json':
            df = pd.read_json(file_path, nrows=5)
        else:
            report['errors'].append(f"Unsupported format: {report['extension']}")
            return report

        report['readable'] = True
        report['rows'] = len(df)
        report['columns'] = len(df.columns)

    except Exception as e:
        report['errors'].append(f"Error reading file: {str(e)}")

    return report


if __name__ == "__main__":
    # Test code
    print("Testing FileManager module...")

    # Create instance
    fm = FileManager()

    # Create test file
    test_data = pd.DataFrame({
        'date': pd.date_range('2024-01-01', periods=50),
        'value': range(50),
        'category': ['A', 'B'] * 25
    })

    # Test save
    saved_path = fm.save_dataframe(test_data, "test_data", format="xlsx")
    print(f"File saved: {saved_path}")

    # Test load
    loaded_df = fm.load_file_auto(saved_path.name, directory="result")
    print(f"File loaded: {loaded_df.shape}")

    # Generate report
    report = fm.generate_files_report()
    print("Report generated")

    # Export metadata
    fm.export_metadata()
    print("Metadata exported")

    print("\nFileManager tested successfully!")
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
file_manager.py
===============

Módulo para gestión inteligente de archivos en proyectos de datos.
Incluye carga automática, validación y organización de archivos.

Autor: Tu nombre
Fecha: {fecha_actual}
"""

import pandas as pd
import json
from pathlib import Path
from datetime import datetime
import logging
import shutil
from typing import List, Dict, Optional, Union

# Configurar logging
logger = logging.getLogger(__name__)


class FileManager:
    """
    Gestor de archivos para proyectos de datos con funcionalidades avanzadas.
    """

    def __init__(self, directorio_proyecto: str = "."):
        """
        Inicializa el gestor de archivos.

        Parameters:
        -----------
        directorio_proyecto : str
            Ruta al directorio raíz del proyecto
        """
        self.directorio_proyecto = Path(directorio_proyecto)
        self.directorio_insumos = self.directorio_proyecto / "data" / "input"
        self.directorio_resultados = self.directorio_proyecto / "data" / "result"
        self.directorio_logs = self.directorio_proyecto / "data" / "logs"

        # Crear directorios si no existen
        self._crear_estructura_directorios()

        logger.info(f"FileManager inicializado en: {self.directorio_proyecto}")

    def _crear_estructura_directorios(self):
        """Crea la estructura de directorios necesaria."""
        directorios = [
            self.directorio_insumos,
            self.directorio_resultados,
            self.directorio_logs
        ]

        for directorio in directorios:
            directorio.mkdir(parents=True, exist_ok=True)

        logger.debug("Estructura de directorios verificada")

    def listar_archivos(self, directorio: str = "input", extension: str = None) -> List[Path]:
        """
        Lista archivos en un directorio específico.

        Parameters:
        -----------
        directorio : str
            Directorio a listar ('input', 'result', 'logs')
        extension : str, optional
            Filtrar por extensión (ej: '.xlsx', '.csv')

        Returns:
        --------
        List[Path] : Lista de rutas de archivos
        """
        directorio_map = {
            'input': self.directorio_insumos,
            'result': self.directorio_resultados,
            'logs': self.directorio_logs
        }

        if directorio not in directorio_map:
            raise ValueError(f"Directorio debe ser uno de: {list(directorio_map.keys())}")

        ruta = directorio_map[directorio]
        patron = f"*{extension}" if extension else "*"
        archivos = list(ruta.glob(patron))

        logger.info(f"Encontrados {len(archivos)} archivos en {directorio}")
        return archivos

    def cargar_archivo_auto(self, nombre_archivo: str, directorio: str = "input") -> pd.DataFrame:
        """
        Carga automáticamente un archivo detectando su formato.

        Parameters:
        -----------
        nombre_archivo : str
            Nombre del archivo a cargar
        directorio : str
            Directorio donde buscar ('input', 'result')

        Returns:
        --------
        pd.DataFrame : DataFrame con los datos cargados
        """
        directorio_map = {
            'input': self.directorio_insumos,
            'result': self.directorio_resultados
        }

        ruta_archivo = directorio_map[directorio] / nombre_archivo

        if not ruta_archivo.exists():
            raise FileNotFoundError(f"Archivo no encontrado: {ruta_archivo}")

        # Detectar formato y cargar
        extension = ruta_archivo.suffix.lower()

        try:
            if extension in ['.xlsx', '.xls']:
                df = pd.read_excel(ruta_archivo)
                logger.info(f"Archivo Excel cargado: {nombre_archivo}")

            elif extension == '.csv':
                # Intentar detectar delimitador
                df = self._cargar_csv_inteligente(ruta_archivo)
                logger.info(f"Archivo CSV cargado: {nombre_archivo}")

            elif extension == '.json':
                df = pd.read_json(ruta_archivo)
                logger.info(f"Archivo JSON cargado: {nombre_archivo}")

            elif extension in ['.txt', '.tsv']:
                df = pd.read_csv(ruta_archivo, sep='\t')
                logger.info(f"Archivo de texto cargado: {nombre_archivo}")

            else:
                raise ValueError(f"Formato de archivo no soportado: {extension}")

            # Validar carga
            logger.info(f"  - Dimensiones: {df.shape[0]} filas × {df.shape[1]} columnas")
            logger.info(f"  - Memoria: {df.memory_usage(deep=True).sum() / (1024 ** 2):.2f} MB")

            return df

        except Exception as e:
            logger.error(f"Error cargando archivo {nombre_archivo}: {str(e)}")
            raise

    def _cargar_csv_inteligente(self, ruta_archivo: Path) -> pd.DataFrame:
        """
        Carga un CSV detectando automáticamente el delimitador y encoding.
        """
        delimitadores = [',', ';', '\t', '|']
        encodings = ['utf-8', 'latin-1', 'cp1252']

        for encoding in encodings:
            for delim in delimitadores:
                try:
                    df = pd.read_csv(ruta_archivo, sep=delim, encoding=encoding, nrows=5)
                    if df.shape[1] > 1:  # Si tiene más de una columna, probablemente es correcto
                        # Cargar el archivo completo
                        df_completo = pd.read_csv(ruta_archivo, sep=delim, encoding=encoding)
                        logger.debug(f"CSV cargado con delimitador '{delim}' y encoding '{encoding}'")
                        return df_completo
                except:
                    continue

        # Si nada funciona, usar configuración por defecto
        logger.warning("No se pudo detectar formato CSV, usando configuración por defecto")
        return pd.read_csv(ruta_archivo)

    def guardar_dataframe(self, df: pd.DataFrame, nombre_archivo: str,
                          incluir_timestamp: bool = True,
                          formato: str = 'xlsx') -> Path:
        """
        Guarda un DataFrame en el directorio de result.

        Parameters:
        -----------
        df : pd.DataFrame
            DataFrame a guardar
        nombre_archivo : str
            Nombre base del archivo (sin extensión)
        incluir_timestamp : bool
            Si incluir timestamp en el nombre
        formato : str
            Formato de salida ('xlsx', 'csv', 'json')

        Returns:
        --------
        Path : Ruta completa del archivo guardado
        """
        # Generar nombre completo
        if incluir_timestamp:
            timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
            nombre_completo = f"{nombre_archivo}_{timestamp}.{formato}"
        else:
            nombre_completo = f"{nombre_archivo}.{formato}"

        ruta_completa = self.directorio_resultados / nombre_completo

        # Guardar según formato
        try:
            if formato == 'xlsx':
                df.to_excel(ruta_completa, index=False)
            elif formato == 'csv':
                df.to_csv(ruta_completa, index=False, encoding='utf-8')
            elif formato == 'json':
                df.to_json(ruta_completa, orient='records', indent=2, force_ascii=False)
            else:
                raise ValueError(f"Formato no soportado: {formato}")

            logger.info(f"DataFrame guardado: {ruta_completa}")
            logger.info(f"  - Formato: {formato.upper()}")
            logger.info(f"  - Dimensiones: {df.shape[0]} filas × {df.shape[1]} columnas")

            return ruta_completa

        except Exception as e:
            logger.error(f"Error guardando archivo: {str(e)}")
            raise

    def crear_backup(self, directorio_origen: str = "result") -> Path:
        """
        Crea un backup comprimido de un directorio.

        Parameters:
        -----------
        directorio_origen : str
            Directorio a respaldar ('input', 'result')

        Returns:
        --------
        Path : Ruta del archivo de backup creado
        """
        directorio_map = {
            'input': self.directorio_insumos,
            'result': self.directorio_resultados
        }

        if directorio_origen not in directorio_map:
            raise ValueError(f"Directorio debe ser uno de: {list(directorio_map.keys())}")

        origen = directorio_map[directorio_origen]
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        nombre_backup = f"backup_{directorio_origen}_{timestamp}"
        ruta_backup = self.directorio_proyecto / f"{nombre_backup}.zip"

        # Crear backup
        shutil.make_archive(str(ruta_backup.with_suffix('')), 'zip', str(origen))

        logger.info(f"Backup creado: {ruta_backup}")
        return ruta_backup

    def organizar_archivos_por_fecha(self, directorio: str = "result"):
        """
        Organiza archivos en subdirectorios por fecha de creación.

        Parameters:
        -----------
        directorio : str
            Directorio a organizar ('result')
        """
        if directorio != "result":
            raise ValueError("Solo se puede organizar el directorio 'result'")

        archivos = self.listar_archivos(directorio)
        archivos_movidos = 0

        for archivo in archivos:
            if archivo.is_file():
                # Obtener fecha de creación
                fecha_creacion = datetime.fromtimestamp(archivo.stat().st_ctime)
                carpeta_fecha = fecha_creacion.strftime('%Y-%m')

                # Crear carpeta por mes si no existe
                carpeta_destino = self.directorio_resultados / carpeta_fecha
                carpeta_destino.mkdir(exist_ok=True)

                # Mover archivo
                nuevo_path = carpeta_destino / archivo.name
                if not nuevo_path.exists():
                    shutil.move(str(archivo), str(nuevo_path))
                    archivos_movidos += 1

        logger.info(f"Archivos organizados: {archivos_movidos} archivos movidos")

    def generar_reporte_archivos(self) -> Dict:
        """
        Genera un reporte completo sobre los archivos del proyecto.

        Returns:
        --------
        Dict : Reporte con estadísticas de archivos
        """
        reporte = {
            'fecha_reporte': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
            'directorio_proyecto': str(self.directorio_proyecto),
            'directorios': {}
        }

        # Analizar cada directorio
        directorios = {
            'input': self.directorio_insumos,
            'result': self.directorio_resultados,
            'logs': self.directorio_logs
        }

        for nombre, ruta in directorios.items():
            if ruta.exists():
                archivos = list(ruta.rglob('*'))
                archivos_solo = [f for f in archivos if f.is_file()]

                # Estadísticas por extensión
                extensiones = {}
                tamaño_total = 0

                for archivo in archivos_solo:
                    ext = archivo.suffix.lower() or 'sin_extension'
                    if ext not in extensiones:
                        extensiones[ext] = {'count': 0, 'tamaño_mb': 0}

                    tamaño_archivo = archivo.stat().st_size
                    extensiones[ext]['count'] += 1
                    extensiones[ext]['tamaño_mb'] += tamaño_archivo / (1024 ** 2)
                    tamaño_total += tamaño_archivo

                reporte['directorios'][nombre] = {
                    'total_archivos': len(archivos_solo),
                    'total_carpetas': len([f for f in archivos if f.is_dir()]),
                    'tamaño_total_mb': tamaño_total / (1024 ** 2),
                    'extensiones': extensiones,
                    'archivo_mas_reciente': max(archivos_solo,
                                                key=lambda x: x.stat().st_mtime).name if archivos_solo else None,
                    'archivo_mas_antiguo': min(archivos_solo,
                                               key=lambda x: x.stat().st_mtime).name if archivos_solo else None
                }

        logger.info("Reporte de archivos generado")
        return reporte

    def limpiar_archivos_temporales(self, patron: str = "temp_*", dias_antiguedad: int = 7):
        """
        Limpia archivos temporales o antiguos.

        Parameters:
        -----------
        patron : str
            Patrón de nombres de archivo a limpiar
        dias_antiguedad : int
            Eliminar archivos más antiguos que este número de días
        """
        import time

        archivos_eliminados = 0
        limite_tiempo = time.time() - (dias_antiguedad * 24 * 60 * 60)

        for directorio in [self.directorio_resultados, self.directorio_logs]:
            for archivo in directorio.glob(patron):
                if archivo.is_file() and archivo.stat().st_mtime < limite_tiempo:
                    try:
                        archivo.unlink()
                        archivos_eliminados += 1
                        logger.debug(f"Archivo eliminado: {archivo.name}")
                    except Exception as e:
                        logger.error(f"Error eliminando {archivo.name}: {str(e)}")

        logger.info(f"Limpieza completada: {archivos_eliminados} archivos eliminados")

    def exportar_metadatos(self, nombre_archivo: str = "metadatos_proyecto"):
        """
        Exporta metadatos del proyecto a JSON.

        Parameters:
        -----------
        nombre_archivo : str
            Nombre base del archivo de metadatos
        """
        reporte = self.generar_reporte_archivos()

        # Agregar información adicional
        metadatos = {
            'reporte_archivos': reporte,
            'configuracion': {
                'directorio_proyecto': str(self.directorio_proyecto),
                'estructura_creada': True,
                'version_python': f"{__import__('sys').version_info.major}.{__import__('sys').version_info.minor}",
                'timestamp_creacion': datetime.now().isoformat()
            }
        }

        # Guardar metadatos
        ruta_metadatos = self.directorio_proyecto / f"{nombre_archivo}.json"

        with open(ruta_metadatos, 'w', encoding='utf-8') as f:
            json.dump(metadatos, f, indent=2, ensure_ascii=False, default=str)

        logger.info(f"Metadatos exportados: {ruta_metadatos}")
        return ruta_metadatos


# Funciones de utilidad independientes
def encontrar_archivos_similares(directorio: Path, nombre_base: str, threshold: float = 0.8) -> List[Path]:
    """
    Encuentra archivos con nombres similares usando coincidencia aproximada.

    Parameters:
    -----------
    directorio : Path
        Directorio donde buscar
    nombre_base : str
        Nombre base para comparar
    threshold : float
        Umbral de similitud (0-1)

    Returns:
    --------
    List[Path] : Lista de archivos similares
    """
    from difflib import SequenceMatcher

    archivos_similares = []

    for archivo in directorio.glob('*'):
        if archivo.is_file():
            # Comparar nombres sin extensión
            nombre_sin_ext = archivo.stem.lower()
            nombre_base_lower = nombre_base.lower()

            similitud = SequenceMatcher(None, nombre_base_lower, nombre_sin_ext).ratio()

            if similitud >= threshold:
                archivos_similares.append((archivo, similitud))

    # Ordenar por similitud descendente
    archivos_similares.sort(key=lambda x: x[1], reverse=True)

    return [archivo for archivo, _ in archivos_similares]


def validar_integridad_archivo(ruta_archivo: Path) -> Dict:
    """
    Valida la integridad de un archivo de datos.

    Parameters:
    -----------
    ruta_archivo : Path
        Ruta al archivo a validar

    Returns:
    --------
    Dict : Reporte de validación
    """
    reporte = {
        'archivo': str(ruta_archivo),
        'existe': ruta_archivo.exists(),
        'es_archivo': ruta_archivo.is_file() if ruta_archivo.exists() else False,
        'tamaño_bytes': ruta_archivo.stat().st_size if ruta_archivo.exists() else 0,
        'extension': ruta_archivo.suffix.lower(),
        'legible': False,
        'filas': 0,
        'columnas': 0,
        'errores': []
    }

    if not reporte['existe']:
        reporte['errores'].append("Archivo no existe")
        return reporte

    if not reporte['es_archivo']:
        reporte['errores'].append("La ruta no apunta a un archivo")
        return reporte

    if reporte['tamaño_bytes'] == 0:
        reporte['errores'].append("Archivo vacío")
        return reporte

    # Intentar leer el archivo
    try:
        if reporte['extension'] in ['.xlsx', '.xls']:
            df = pd.read_excel(ruta_archivo, nrows=5)
        elif reporte['extension'] == '.csv':
            df = pd.read_csv(ruta_archivo, nrows=5)
        elif reporte['extension'] == '.json':
            df = pd.read_json(ruta_archivo, nrows=5)
        else:
            reporte['errores'].append(f"Formato no soportado: {reporte['extension']}")
            return reporte

        reporte['legible'] = True
        reporte['filas'] = len(df)
        reporte['columnas'] = len(df.columns)

    except Exception as e:
        reporte['errores'].append(f"Error leyendo archivo: {str(e)}")

    return reporte


if __name__ == "__main__":
    # Código de prueba
    print("🧪 Probando módulo FileManager...")

    # Crear instancia
    fm = FileManager()

    # Crear archivo de prueba
    datos_prueba = pd.DataFrame({
        'fecha': pd.date_range('2024-01-01', periods=50),
        'valor': range(50),
        'categoria': ['A', 'B'] * 25
    })

    # Probar guardar
    ruta_guardada = fm.guardar_dataframe(datos_prueba, "datos_prueba", formato="xlsx")
    print(f"✅ Archivo guardado: {ruta_guardada}")

    # Probar cargar
    df_cargado = fm.cargar_archivo_auto(ruta_guardada.name, directorio="result")
    print(f"✅ Archivo cargado: {df_cargado.shape}")

    # Generar reporte
    reporte = fm.generar_reporte_archivos()
    print("✅ Reporte generado")

    # Exportar metadatos
    fm.exportar_metadatos()
    print("✅ Metadatos exportados")

    print("\n🎉 FileManager probado exitosamente!")
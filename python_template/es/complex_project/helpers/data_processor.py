#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
data_processor.py
=================

Módulo con funciones reutilizables para procesamiento de datos.
Incluye validaciones, transformaciones y limpieza de datos.

Autor: Tu nombre
Fecha: {fecha_actual}
"""

import pandas as pd
import numpy as np
from datetime import datetime
from pathlib import Path
import logging

# Configurar logging
logger = logging.getLogger(__name__)


def validar_dataframe(df, nombre_dataset="Dataset"):
    """
    Valida un DataFrame y reporta problemas comunes.

    Parameters:
    -----------
    df : pandas.DataFrame
        DataFrame a validar
    nombre_dataset : str
        Nombre descriptivo del dataset para los reportes

    Returns:
    --------
    dict : Diccionario con el reporte de validación
    """
    reporte = {
        'dataset': nombre_dataset,
        'filas': len(df),
        'columnas': len(df.columns),
        'valores_nulos': df.isnull().sum().sum(),
        'duplicados': df.duplicated().sum(),
        'memoria_mb': df.memory_usage(deep=True).sum() / (1024 ** 2),
        'columnas_con_nulos': df.columns[df.isnull().any()].tolist(),
        'tipos_datos': df.dtypes.to_dict()
    }

    logger.info(f"Validación completada para {nombre_dataset}")
    logger.info(f"  - Dimensiones: {reporte['filas']} filas x {reporte['columnas']} columnas")
    logger.info(f"  - Valores nulos: {reporte['valores_nulos']}")
    logger.info(f"  - Duplicados: {reporte['duplicados']}")

    return reporte


def limpiar_nombres_columnas(df):
    """
    Limpia y estandariza los nombres de columnas.

    Parameters:
    -----------
    df : pandas.DataFrame
        DataFrame con columnas a limpiar

    Returns:
    --------
    pandas.DataFrame : DataFrame con columnas limpias
    """
    df_clean = df.copy()

    # Limpiar nombres de columnas
    df_clean.columns = (df_clean.columns
                        .str.strip()  # Quitar espacios
                        .str.lower()  # Minúsculas
                        .str.replace(' ', '_')  # Espacios por guiones bajos
                        .str.replace('[^a-zA-Z0-9_]', '', regex=True)  # Solo alfanuméricos y _
                        .str.replace('_+', '_', regex=True)  # Múltiples _ por uno solo
                        .str.strip('_'))  # Quitar _ al inicio/final

    logger.info(f"Nombres de columnas limpiados: {list(df_clean.columns)}")
    return df_clean


def detectar_outliers_iqr(serie, multiplicador=1.5):
    """
    Detecta outliers usando el método IQR (Rango Intercuartil).

    Parameters:
    -----------
    serie : pandas.Series
        Serie numérica para analizar
    multiplicador : float
        Multiplicador para el rango IQR (default: 1.5)

    Returns:
    --------
    dict : Información sobre outliers detectados
    """
    if not pd.api.types.is_numeric_dtype(serie):
        logger.warning(f"La serie {serie.name} no es numérica, saltando detección de outliers")
        return None

    Q1 = serie.quantile(0.25)
    Q3 = serie.quantile(0.75)
    IQR = Q3 - Q1

    limite_inferior = Q1 - multiplicador * IQR
    limite_superior = Q3 + multiplicador * IQR

    outliers_mask = (serie < limite_inferior) | (serie > limite_superior)
    outliers = serie[outliers_mask]

    resultado = {
        'columna': serie.name,
        'total_valores': len(serie),
        'outliers_detectados': len(outliers),
        'porcentaje_outliers': (len(outliers) / len(serie)) * 100,
        'limite_inferior': limite_inferior,
        'limite_superior': limite_superior,
        'valores_outliers': outliers.tolist(),
        'indices_outliers': outliers.index.tolist()
    }

    logger.info(f"Outliers en {serie.name}: {len(outliers)} ({resultado['porcentaje_outliers']:.1f}%)")
    return resultado


def procesar_fechas(df, columna_fecha, formato_fecha=None):
    """
    Convierte una columna a formato datetime y extrae componentes útiles.

    Parameters:
    -----------
    df : pandas.DataFrame
        DataFrame que contiene la columna de fecha
    columna_fecha : str
        Nombre de la columna con fechas
    formato_fecha : str, optional
        Formato específico de fecha (ej: '%Y-%m-%d')

    Returns:
    --------
    pandas.DataFrame : DataFrame con columnas de fecha procesadas
    """
    df_processed = df.copy()

    try:
        # Convertir a datetime
        if formato_fecha:
            df_processed[columna_fecha] = pd.to_datetime(df_processed[columna_fecha],
                                                         format=formato_fecha)
        else:
            df_processed[columna_fecha] = pd.to_datetime(df_processed[columna_fecha])

        # Extraer componentes útiles
        fecha_col = df_processed[columna_fecha]
        base_name = columna_fecha.replace('_fecha', '').replace('fecha_', '')

        df_processed[f'{base_name}_año'] = fecha_col.dt.year
        df_processed[f'{base_name}_mes'] = fecha_col.dt.month
        df_processed[f'{base_name}_dia'] = fecha_col.dt.day
        df_processed[f'{base_name}_dia_semana'] = fecha_col.dt.day_name()
        df_processed[f'{base_name}_trimestre'] = fecha_col.dt.quarter
        df_processed[f'{base_name}_es_fin_semana'] = fecha_col.dt.weekday >= 5

        logger.info(f"Columna {columna_fecha} procesada correctamente")
        logger.info(f"  - Rango: {fecha_col.min()} a {fecha_col.max()}")
        logger.info(f"  - Columnas creadas: año, mes, día, día_semana, trimestre, es_fin_semana")

    except Exception as e:
        logger.error(f"Error procesando fechas en columna {columna_fecha}: {str(e)}")
        raise

    return df_processed


def crear_resumen_ejecutivo(df, columnas_numericas=None, columnas_categoricas=None):
    """
    Crea un resumen ejecutivo completo del DataFrame.

    Parameters:
    -----------
    df : pandas.DataFrame
        DataFrame a resumir
    columnas_numericas : list, optional
        Lista de columnas numéricas específicas a analizar
    columnas_categoricas : list, optional
        Lista de columnas categóricas específicas a analizar

    Returns:
    --------
    dict : Diccionario con el resumen ejecutivo
    """
    # Detectar columnas automáticamente si no se especifican
    if columnas_numericas is None:
        columnas_numericas = df.select_dtypes(include=[np.number]).columns.tolist()

    if columnas_categoricas is None:
        columnas_categoricas = df.select_dtypes(include=['object', 'category']).columns.tolist()

    resumen = {
        'informacion_general': {
            'filas': len(df),
            'columnas': len(df.columns),
            'memoria_mb': df.memory_usage(deep=True).sum() / (1024 ** 2),
            'fecha_analisis': datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        },
        'calidad_datos': {
            'valores_nulos_total': df.isnull().sum().sum(),
            'filas_duplicadas': df.duplicated().sum(),
            'completitud_porcentaje': ((df.size - df.isnull().sum().sum()) / df.size) * 100
        },
        'columnas_numericas': {},
        'columnas_categoricas': {}
    }

    # Análisis de columnas numéricas
    for col in columnas_numericas:
        if col in df.columns:
            serie = df[col].dropna()
            resumen['columnas_numericas'][col] = {
                'count': len(serie),
                'mean': serie.mean(),
                'std': serie.std(),
                'min': serie.min(),
                'max': serie.max(),
                'q25': serie.quantile(0.25),
                'q50': serie.quantile(0.50),
                'q75': serie.quantile(0.75),
                'valores_nulos': df[col].isnull().sum()
            }

    # Análisis de columnas categóricas
    for col in columnas_categoricas:
        if col in df.columns:
            value_counts = df[col].value_counts()
            resumen['columnas_categoricas'][col] = {
                'valores_unicos': df[col].nunique(),
                'valor_mas_frecuente': value_counts.index[0] if len(value_counts) > 0 else None,
                'frecuencia_max': value_counts.iloc[0] if len(value_counts) > 0 else 0,
                'valores_nulos': df[col].isnull().sum(),
                'top_5_valores': value_counts.head().to_dict()
            }

    logger.info("Resumen ejecutivo generado correctamente")
    return resumen


def exportar_datos_limpios(df, nombre_archivo, carpeta_destino="../data/result"):
    """
    Exporta el DataFrame limpio a Excel con timestamp.

    Parameters:
    -----------
    df : pandas.DataFrame
        DataFrame a exportar
    nombre_archivo : str
        Nombre base del archivo (sin extensión)
    carpeta_destino : str
        Carpeta donde guardar el archivo

    Returns:
    --------
    str : Ruta completa del archivo guardado
    """
    # Crear carpeta si no existe
    Path(carpeta_destino).mkdir(parents=True, exist_ok=True)

    # Generar nombre con timestamp
    timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
    nombre_completo = f"{nombre_archivo}_{timestamp}.xlsx"
    ruta_completa = Path(carpeta_destino) / nombre_completo

    # Exportar
    df.to_excel(ruta_completa, index=False)

    logger.info(f"Datos exportados exitosamente: {ruta_completa}")
    return str(ruta_completa)


# Funciones de utilidad adicionales
def imprimir_resumen_bonito(resumen_dict):
    """
    Imprime un resumen de forma legible y organizada.
    """
    print("📊 RESUMEN EJECUTIVO")
    print("=" * 50)

    # Información general
    info = resumen_dict['informacion_general']
    print(f"📋 Dimensiones: {info['filas']:,} filas × {info['columnas']} columnas")
    print(f"💾 Memoria: {info['memoria_mb']:.2f} MB")
    print(f"📅 Análisis: {info['fecha_analisis']}")
    print()

    # Calidad de datos
    calidad = resumen_dict['calidad_datos']
    print("🔍 CALIDAD DE DATOS")
    print("-" * 30)
    print(f"❌ Valores nulos: {calidad['valores_nulos_total']:,}")
    print(f"🔄 Filas duplicadas: {calidad['filas_duplicadas']:,}")
    print(f"✅ Completitud: {calidad['completitud_porcentaje']:.1f}%")
    print()

    # Columnas numéricas
    if resumen_dict['columnas_numericas']:
        print("📊 COLUMNAS NUMÉRICAS")
        print("-" * 30)
        for col, stats in resumen_dict['columnas_numericas'].items():
            print(f"{col}: μ={stats['mean']:.2f}, σ={stats['std']:.2f}, rango=[{stats['min']:.2f}, {stats['max']:.2f}]")
        print()

    # Columnas categóricas
    if resumen_dict['columnas_categoricas']:
        print("📋 COLUMNAS CATEGÓRICAS")
        print("-" * 30)
        for col, stats in resumen_dict['columnas_categoricas'].items():
            print(f"{col}: {stats['valores_unicos']} valores únicos, más frecuente: '{stats['valor_mas_frecuente']}'")


if __name__ == "__main__":
    # Código de prueba
    print("🧪 Probando módulo data_processor...")

    # Crear datos de ejemplo
    datos_ejemplo = pd.DataFrame({
        'fecha': pd.date_range('2024-01-01', periods=100),
        'ventas': np.random.randint(100, 1000, 100),
        'PRODUCTO ': ['A', 'B', 'C'] * 33 + ['A'],  # Espacios y mayúsculas intencionales
        'región': ['Norte', 'Sur', 'Centro'] * 33 + ['Norte']
    })

    # Introducir algunos nulos y duplicados para probar
    datos_ejemplo.loc[5, 'ventas'] = np.nan
    datos_ejemplo.loc[10] = datos_ejemplo.loc[0]  # Duplicado

    print("✅ Datos de ejemplo creados")

    # Probar funciones
    reporte = validar_dataframe(datos_ejemplo, "Datos de Prueba")
    datos_limpios = limpiar_nombres_columnas(datos_ejemplo)
    outliers_ventas = detectar_outliers_iqr(datos_limpios['ventas'])
    datos_con_fechas = procesar_fechas(datos_limpios, 'fecha')
    resumen = crear_resumen_ejecutivo(datos_con_fechas)

    imprimir_resumen_bonito(resumen)

    print("\n🎉 Todas las funciones probadas exitosamente!")
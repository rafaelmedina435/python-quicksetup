#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Template Completo - main.py
===========================

Archivo principal del proyecto con estructura profesional.
Este archivo orquesta las diferentes partes del proyecto.

Autor: Tu nombre
Fecha: {fecha_actual}
Proyecto: Mi Proyecto Python Completo
"""

import os
import sys
from pathlib import Path

# Agregar el directorio helpers al path para importar módulos personalizados
sys.path.append(str(Path(__file__).parent / "helpers"))

# Importaciones estándar
from datetime import datetime
import logging

# Importaciones de terceros (descomenta según necesites)
# import pandas as pd
# import numpy as np
# import matplotlib.pyplot as plt

# Importaciones locales (descomenta cuando crees los módulos)
# from helpers.data_processor import DataProcessor
# from helpers.file_manager import FileManager

def configurar_logging():
    """
    Configura el sistema de logging para el proyecto.
    Los logs se guardan en la carpeta data/logs/
    """
    # Crear directorio de logs si no existe
    log_dir = Path("data/logs")
    log_dir.mkdir(parents=True, exist_ok=True)

    # Configurar logging
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
        handlers=[
            logging.FileHandler(log_dir / f"proyecto_{datetime.now().strftime('%Y%m%d')}.log"),
            logging.StreamHandler()
        ]
    )
    return logging.getLogger(__name__)

def verificar_estructura_proyecto():
    """
    Verifica que todas las carpetas necesarias existan.
    Las crea si no existen.
    """
    carpetas_necesarias = [
        "data/input",
        "data/result",
        "data/logs",
        "notebooks",
        "scripts",
        "helpers"
    ]

    print("📁 Verificando estructura del proyecto...")
    for carpeta in carpetas_necesarias:
        Path(carpeta).mkdir(parents=True, exist_ok=True)
        print(f"   ✅ {carpeta}")

    print("✅ Estructura del proyecto verificada")

def mostrar_info_proyecto():
    """
    Muestra información general del proyecto.
    """
    print("🏢 Template Completo - Proyecto Python Profesional")
    print("=" * 50)
    print(f"📅 Fecha: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print(f"📂 Directorio: {Path.cwd()}")
    print(f"🐍 Python: {sys.version.split()[0]}")
    print("=" * 50)

def ejemplo_procesamiento_datos():
    """
    Ejemplo de cómo estructurar el procesamiento de datos.
    """
    print("\n📊 Ejemplo de procesamiento de datos:")
    print("   → Los datos de entrada van en: data/input/")
    print("   → Los result se guardan en: data/result/")
    print("   → Los logs se almacenan en: data/logs/")

    # Ejemplo de flujo de trabajo
    print("\n🔄 Flujo de trabajo recomendado:")
    print("   1. Cargar datos desde data/input/")
    print("   2. Procesar usando funciones de helpers/")
    print("   3. Guardar result en data/result/")
    print("   4. Documentar en notebooks/")

def ejemplo_con_pandas():
    """
    Ejemplo más avanzado usando pandas para análisis de datos.
    """
    print("\n📈 Ejemplo avanzado con pandas:")
    print("   (Requiere: pip install pandas openpyxl)")

    # Descomenta cuando tengas pandas instalado:
    # try:
    #     import pandas as pd
    #
    #     # Crear datos de ejemplo
    #     datos_ejemplo = {
    #         'Fecha': pd.date_range('2024-01-01', periods=10),
    #         'Ventas': [100, 150, 200, 175, 300, 250, 400, 350, 500, 450],
    #         'Producto': ['A', 'B', 'A', 'C', 'B', 'A', 'C', 'B', 'A', 'C']
    #     }
    #
    #     df = pd.DataFrame(datos_ejemplo)
    #
    #     # Guardar en data/result/
    #     output_path = Path("data/result/datos_ejemplo.xlsx")
    #     df.to_excel(output_path, index=False)
    #
    #     print(f"   ✅ Datos guardados en: {output_path}")
    #     print(f"   📊 Filas procesadas: {len(df)}")
    #
    # except ImportError:
    #     print("   ⚠️ Pandas no instalado. Ejecuta: pip install pandas openpyxl")

def main():
    """
    Función principal del programa.
    Coordina todas las operaciones del proyecto.
    """
    # Configurar logging
    logger = configurar_logging()
    logger.info("Iniciando aplicación")

    # Mostrar información
    mostrar_info_proyecto()

    # Verificar estructura
    verificar_estructura_proyecto()

    # Ejemplos de uso
    ejemplo_procesamiento_datos()
    ejemplo_con_pandas()

    print("\n🎉 ¡Programa ejecutado correctamente!")
    print("\n💡 Próximos pasos:")
    print("   1. Instala paquetes: pip install pandas numpy matplotlib openpyxl")
    print("   2. Guarda dependencias: .\\save_packages.ps1")
    print("   3. Explora los notebooks en: notebooks/")
    print("   4. Crea funciones reutilizables en: helpers/")
    print("   5. Lee el README.md para la guía completa")

    logger.info("Aplicación finalizada exitosamente")

# Ejecutar el programa principal
if __name__ == "__main__":
    main()
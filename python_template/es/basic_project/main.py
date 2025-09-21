#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Template Básico - main.py
=========================

Este es tu archivo principal donde escribirás tu código.
Aquí tienes algunos ejemplos básicos para empezar.

Autor: Tu nombre
Fecha: {fecha_actual}
Proyecto: Mi Proyecto Python
"""

import os
import sys
from pathlib import Path

# Agregar helpers al path para usar nuestras funciones
sys.path.append(str(Path(__file__).parent / "helpers"))

# Importaciones básicas (descomenta las que necesites)
# import pandas as pd
# import numpy as np
# import matplotlib.pyplot as plt
from datetime import datetime

# Importar nuestras funciones helpers
from helpers import saludar, calcular_estadisticas, guardar_resultado

def saludo_inicial():
    """
    Función de ejemplo que muestra un saludo inicial.
    """
    print("🐍 ¡Bienvenido a tu proyecto Python!")
    print("=" * 40)
    print("📝 Este es tu archivo main.py")
    print("💡 Edita este código según tus necesidades")
    print("=" * 40)

def ejemplo_basico():
    """
    Ejemplo básico de operaciones en Python usando helpers.
    """
    print("\n📊 Ejemplo básico con helpers:")

    # Usar función del helper
    mensaje = saludar("Ana")
    print(f"   {mensaje}")

    # Variables básicas
    numeros = [10, 25, 30, 15, 45, 20, 35]
    print(f"   Lista de números: {numeros}")

    # Usar helper para calcular estadísticas
    stats = calcular_estadisticas(numeros)
    print(f"   📈 Promedio: {stats['promedio']:.2f}")
    print(f"   📊 Máximo: {stats['maximo']}")
    print(f"   📉 Mínimo: {stats['minimo']}")

def ejemplo_con_input():
    """
    Ejemplo de interacción con el usuario usando helpers.
    """
    print("\n💬 Ejemplo de interacción:")
    nombre = input("   ¿Cómo te llamas? ")

    # Usar helper para crear mensaje personalizado
    mensaje_personalizado = saludar(nombre)
    print(f"   {mensaje_personalizado}")

def ejemplo_guardar_datos():
    """
    Ejemplo de cómo guardar resultado usando helpers.
    """
    print("\n💾 Ejemplo de guardar datos:")

    # Crear algunos datos de ejemplo
    datos_ejemplo = {
        'fecha': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
        'usuario': 'Usuario de prueba',
        'numeros_procesados': [1, 2, 3, 4, 5],
        'estadisticas': calcular_estadisticas([1, 2, 3, 4, 5])
    }

    # Usar helper para guardar
    archivo_creado = guardar_resultado(datos_ejemplo, "resultados_ejemplo")
    print(f"   ✅ Datos guardados en: {archivo_creado}")

def ejemplo_pandas():
    """
    Ejemplo básico con pandas (requiere: pip install pandas).
    Descomenta este código cuando instales pandas.
    """
    print("\n📈 Ejemplo con pandas:")
    print("   (Instala pandas primero: pip install pandas)")

    # Descomenta estas líneas cuando tengas pandas instalado:
    # import pandas as pd
    #
    # # Crear un DataFrame simple
    # datos = {
    #     'Nombre': ['Ana', 'Carlos', 'María'],
    #     'Edad': [25, 30, 35],
    #     'Ciudad': ['Madrid', 'Barcelona', 'Valencia']
    # }
    # df = pd.DataFrame(datos)
    # print("   📋 DataFrame creado:")
    # print(df.to_string(index=False))
    #
    # # Guardar usando helper
    # archivo_excel = guardar_resultado(df, "datos_personas", formato="excel")
    # print(f"   💾 Excel guardado: {archivo_excel}")

def main():
    """
    Función principal del programa.
    """
    saludo_inicial()
    ejemplo_basico()
    ejemplo_con_input()
    ejemplo_guardar_datos()
    ejemplo_pandas()

    print("\n🎉 ¡Programa ejecutado correctamente!")
    print("\n💡 Próximos pasos:")
    print("   1. Instala paquetes: pip install pandas numpy matplotlib")
    print("   2. Guarda dependencias: .\\save_packages.ps1")
    print("   3. Mira el archivo helpers/helpers.py para más funciones")
    print("   4. Edita este archivo según tu proyecto")
    print("   5. Lee el README.md para más información")

# Ejecutar el programa principal
if __name__ == "__main__":
    main()
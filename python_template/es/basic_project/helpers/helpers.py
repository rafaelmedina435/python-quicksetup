#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
helpers.py - Template Básico
============================

Funciones útiles y reutilizables para tu proyecto.
Este archivo contiene ejemplos simples de funciones helpers.

¿Qué son los helpers?
- Funciones pequeñas que haces una vez y reutilizas muchas veces
- Código que se repite en varios lugares
- Utilidades que simplifican tareas comunes

Autor: Tu nombre
Fecha: {fecha_actual}
"""

import json
from datetime import datetime
from pathlib import Path


def saludar(nombre):
    """
    Crea un saludo personalizado.

    Ejemplo de uso:
    >>> mensaje = saludar("Ana")
    >>> print(mensaje)
    ¡Hola Ana! 👋 Bienvenido/a al proyecto.

    Parámetros:
    -----------
    nombre : str
        El nombre de la persona a saludar

    Retorna:
    --------
    str : Mensaje de saludo personalizado
    """
    return f"¡Hola {nombre}! 👋 Bienvenido/a al proyecto."


def calcular_estadisticas(numeros):
    """
    Calcula estadísticas básicas de una lista de números.

    Ejemplo de uso:
    >>> stats = calcular_estadisticas([1, 2, 3, 4, 5])
    >>> print(f"Promedio: {stats['promedio']}")
    Promedio: 3.0

    Parámetros:
    -----------
    numeros : list
        Lista de números para calcular estadísticas

    Retorna:
    --------
    dict : Diccionario con estadísticas básicas
    """
    if not numeros:
        return {
            'promedio': 0,
            'suma': 0,
            'cantidad': 0,
            'maximo': None,
            'minimo': None
        }

    return {
        'promedio': sum(numeros) / len(numeros),
        'suma': sum(numeros),
        'cantidad': len(numeros),
        'maximo': max(numeros),
        'minimo': min(numeros)
    }


def limpiar_texto(texto):
    """
    Limpia un texto eliminando espacios extra y convirtiendo a minúsculas.

    Ejemplo de uso:
    >>> texto_limpio = limpiar_texto("  HOLA MUNDO  ")
    >>> print(texto_limpio)
    hola mundo

    Parámetros:
    -----------
    texto : str
        Texto a limpiar

    Retorna:
    --------
    str : Texto limpio
    """
    if not isinstance(texto, str):
        return str(texto)

    return texto.strip().lower()


def es_numero_par(numero):
    """
    Verifica si un número es par.

    Ejemplo de uso:
    >>> es_numero_par(4)
    True
    >>> es_numero_par(5)
    False

    Parámetros:
    -----------
    numero : int
        Número a verificar

    Retorna:
    --------
    bool : True si es par, False si es impar
    """
    try:
        return int(numero) % 2 == 0
    except (ValueError, TypeError):
        return False


def crear_carpeta_si_no_existe(ruta_carpeta):
    """
    Crea una carpeta si no existe.

    Ejemplo de uso:
    >>> crear_carpeta_si_no_existe("result")
    >>> print("Carpeta lista para usar")

    Parámetros:
    -----------
    ruta_carpeta : str
        Ruta de la carpeta a crear

    Retorna:
    --------
    bool : True si la carpeta existe o fue creada exitosamente
    """
    try:
        Path(ruta_carpeta).mkdir(parents=True, exist_ok=True)
        return True
    except Exception as e:
        print(f"Error creando carpeta {ruta_carpeta}: {e}")
        return False


def guardar_resultado(datos, nombre_archivo, formato="json"):
    """
    Guarda datos en un archivo con timestamp automático.

    Ejemplo de uso:
    >>> datos = {"mensaje": "Hola mundo", "fecha": "2024-03-15"}
    >>> archivo = guardar_resultado(datos, "mi_resultado")
    >>> print(f"Guardado en: {archivo}")

    Parámetros:
    -----------
    datos : dict, list, o pandas.DataFrame
        Datos a guardar
    nombre_archivo : str
        Nombre base del archivo (sin extensión)
    formato : str
        Formato del archivo: "json", "txt", "excel"

    Retorna:
    --------
    str : Ruta del archivo creado
    """
    # Crear carpeta de result si no existe
    carpeta_resultados = "result"
    crear_carpeta_si_no_existe(carpeta_resultados)

    # Agregar timestamp al nombre
    timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')

    try:
        if formato.lower() == "json":
            nombre_completo = f"{nombre_archivo}_{timestamp}.json"
            ruta_completa = Path(carpeta_resultados) / nombre_completo

            with open(ruta_completa, 'w', encoding='utf-8') as f:
                json.dump(datos, f, indent=2, ensure_ascii=False, default=str)

        elif formato.lower() == "txt":
            nombre_completo = f"{nombre_archivo}_{timestamp}.txt"
            ruta_completa = Path(carpeta_resultados) / nombre_completo

            with open(ruta_completa, 'w', encoding='utf-8') as f:
                if isinstance(datos, dict):
                    for clave, valor in datos.items():
                        f.write(f"{clave}: {valor}\n")
                else:
                    f.write(str(datos))

        elif formato.lower() == "excel":
            # Solo funciona si tienes pandas instalado
            try:
                import pandas as pd
                nombre_completo = f"{nombre_archivo}_{timestamp}.xlsx"
                ruta_completa = Path(carpeta_resultados) / nombre_completo

                if isinstance(datos, dict):
                    # Convertir dict a DataFrame
                    df = pd.DataFrame([datos])
                elif hasattr(datos, 'to_excel'):
                    # Ya es un DataFrame
                    df = datos
                else:
                    # Convertir a DataFrame como sea posible
                    df = pd.DataFrame(datos)

                df.to_excel(ruta_completa, index=False)

            except ImportError:
                print("⚠️ pandas no está instalado. Guardando como JSON...")
                return guardar_resultado(datos, nombre_archivo, "json")

        else:
            raise ValueError(f"Formato no soportado: {formato}")

        print(f"✅ Archivo guardado: {ruta_completa}")
        return str(ruta_completa)

    except Exception as e:
        print(f"❌ Error guardando archivo: {e}")
        return None


def obtener_fecha_actual():
    """
    Obtiene la fecha y hora actual en formato legible.

    Ejemplo de uso:
    >>> fecha = obtener_fecha_actual()
    >>> print(fecha)
    2024-03-15 14:30:25

    Retorna:
    --------
    str : Fecha y hora actual
    """
    return datetime.now().strftime('%Y-%m-%d %H:%M:%S')


def contar_palabras(texto):
    """
    Cuenta las palabras en un texto.

    Ejemplo de uso:
    >>> cantidad = contar_palabras("Hola mundo Python")
    >>> print(f"Palabras: {cantidad}")
    Palabras: 3

    Parámetros:
    -----------
    texto : str
        Texto para contar palabras

    Retorna:
    --------
    int : Número de palabras
    """
    if not isinstance(texto, str):
        return 0

    return len(texto.strip().split())


def filtrar_numeros_pares(lista_numeros):
    """
    Filtra solo los números pares de una lista.

    Ejemplo de uso:
    >>> pares = filtrar_numeros_pares([1, 2, 3, 4, 5, 6])
    >>> print(pares)
    [2, 4, 6]

    Parámetros:
    -----------
    lista_numeros : list
        Lista de números a filtrar

    Retorna:
    --------
    list : Lista solo con números pares
    """
    return [num for num in lista_numeros if es_numero_par(num)]


# Ejemplo de cómo usar las funciones
if __name__ == "__main__":
    print("🧪 Probando funciones helpers...")
    print("=" * 40)

    # Probar saludo
    mensaje = saludar("Usuario de Prueba")
    print(f"1. {mensaje}")

    # Probar estadísticas
    numeros_ejemplo = [10, 20, 30, 40, 50]
    stats = calcular_estadisticas(numeros_ejemplo)
    print(f"2. Estadísticas de {numeros_ejemplo}:")
    print(f"   Promedio: {stats['promedio']}")
    print(f"   Máximo: {stats['maximo']}")

    # Probar filtro de pares
    todos_numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    solo_pares = filtrar_numeros_pares(todos_numeros)
    print(f"3. Números pares en {todos_numeros}: {solo_pares}")

    # Probar guardado
    datos_prueba = {
        'fecha': obtener_fecha_actual(),
        'mensaje': 'Prueba exitosa',
        'estadisticas': stats
    }
    archivo_creado = guardar_resultado(datos_prueba, "prueba_helpers")
    print(f"4. Archivo guardado: {archivo_creado}")

    print("\n🎉 ¡Todas las funciones funcionan correctamente!")
    print("💡 Ahora puedes usar estas funciones en main.py")
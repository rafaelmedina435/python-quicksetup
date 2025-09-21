# 🐍 Mi Proyecto Python - Template Básico

> **Para usuarios que están empezando con Python y quieren aprender las mejores prácticas**
### [Visita nuestra amigable documentación version web](https://python-quicksetup.netlify.app/)

## 📋 Descripción del Proyecto

**Completa esta sección con información sobre tu proyecto:**
- ¿Qué hace este proyecto?
- ¿Por qué es importante?
- ¿Qué problema resuelve?

## 🚀 Inicio Rápido

### 1. Gestor Principal de Proyecto
```powershell
# Ejecuta esto para gestionar tu proyecto Python
.\manager.ps1
```

El script automáticamente:
- 🔍 Detecta si necesitas crear un entorno virtual
- 🐍 Te permite elegir la versión de Python
- ⚡ Activa el entorno automáticamente
- 📱 Te da un menú interactivo para trabajar

### 2. Terminal Rápido (Opcional)
```powershell
# Para activar rápidamente el entorno y trabajar en terminal
.\terminal.ps1
```

### 3. Usando el menú del gestor

**Opciones disponibles:**
- **1. Crear/Recrear entorno virtual** - Configura o actualiza tu entorno
- **2. Ejecutar main.py** - Corre tu código principal
- **3. Instalar paquete nuevo** - Instala pandas, numpy, etc.
- **4. Mostrar/Guardar paquetes instalados** - Ve y guarda dependencias
- **0. Salir y cerrar ventana** - Termina la sesión

### 4. Empieza a programar
- Edita `main.py` con tu código
- Usa opción 2 del menú para ejecutarlo

## 📁 Archivos del Proyecto

| Archivo | Descripción | ¿Cuándo usarlo? |
|---------|-------------|-----------------|
| `manager.ps1` | 🎛️ Gestor principal del proyecto | Siempre que trabajes en el proyecto |
| `terminal.ps1` | ⚡ Activador rápido de entorno | Para sesión rápida de terminal |
| `main.py` | 🐍 Tu código principal | Todos los días |
| `helpers/helpers.py` | 🔧 Funciones reutilizables | Cuando necesites funciones comunes |
| `requirements.txt` | 📦 Lista de paquetes necesarios | Cuando compartas el proyecto |
| `README.md` | 📚 Esta documentación | Para recordar cómo funciona todo |

## Convenciones de Nomenclatura

### Reglas basicas para nombres
- **Nombres sencillos y claros**: Usa nombres que expliquen que hace
- **Sin espacios**: Usa guiones bajos en lugar de espacios
- **En minusculas**: Todo en letras minusculas
- **Sin tildes**: Evita acentos y caracteres especiales
- **En ingles**: Preferible para compatibilidad

### Ejemplos practicos

**Para proyectos:**
- ✅ `analisis_ventas`
- ✅ `bot_telegram`
- ❌ `Análisis de Ventas`
- ❌ `Mi Proyecto`

**Para archivos:**
- ✅ `procesar_datos.py`
- ✅ `config_database.py`
- ❌ `Procesar Datos.py`
- ❌ `configuración_bd.py`

**Para variables:**
```python
# ✅ Correcto
nombre_usuario = "Juan"
lista_productos = []
precio_total = 100.50

# ❌ Evitar
Nombre Usuario = "Juan"
listaProductos = []
precioTotal = 100.50
```

**Para funciones:**
```python
# ✅ Correcto
def calcular_promedio(numeros):
    return sum(numeros) / len(numeros)

def obtener_datos_usuario():
    pass

# ❌ Evitar
def CalcularPromedio(numeros):
    pass

def obtenerDatosUsuario():
    pass
```

## Las 5 Reglas de Oro

### Regla #1: Siempre usa entornos virtuales
- Un proyecto = Un entorno virtual
- Nunca instales paquetes "globalmente"
- El manager.ps1 se encarga de activar automaticamente

### Regla #2: Actualiza requirements.txt religiosamente
- Instalaste algo nuevo? Usa opcion 4 del menu para guardarlo
- Sin requirements.txt = Sin colaboracion posible
- Es tu "receta" para que otros puedan replicar tu trabajo

### Regla #3: Documenta tu codigo
- Comenta las partes complicadas
- Usa nombres de variables descriptivos
- Explica el "por que", no solo el "que"

### Regla #4: Manten el codigo organizado
- Una funcion = Una tarea
- Agrupa codigo similar
- Usa imports al inicio del archivo

### Regla #5: Comparte correctamente
- Siempre incluye requirements.txt
- Testa que tu codigo funciona en otro equipo
- Escribe instrucciones claras

## Flujo de Trabajo Diario

### Al empezar el dia:
1. Abre terminal en la carpeta del proyecto
2. Ejecuta: `.\manager.ps1`
3. El entorno se activa automaticamente
4. Usa el menu para trabajar

### Al instalar algo nuevo:
1. Usa opcion 3 del menu del gestor
2. Escribe los paquetes: `pandas numpy matplotlib`
3. El script te pregunta si quieres guardar en requirements.txt
4. Continua trabajando

### Al compartir tu proyecto:
1. Verifica que requirements.txt este actualizado
2. Comparte toda la carpeta
3. La otra persona ejecuta `.\manager.ps1`
4. El gestor instala automaticamente desde requirements.txt

## Solucion de Problemas

### "No se puede ejecutar scripts"
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### "Python no reconocido"
- Reinstala Python desde python.org
- Marca "Add Python to PATH"
- Reinicia la terminal

### El entorno no se activa
- Ejecuta `.\manager.ps1` opcion 1 para recrear
- Verifica que existe la carpeta `.venv`

### "Modulo no encontrado"
- Asegurate de que el entorno este activado (.venv)
- Usa opcion 3 del gestor para instalar
- Guarda en requirements con opcion 4

## Que son los Helpers?

Los **helpers** son funciones pequenas y utiles que puedes reutilizar en tu proyecto:

### Para que sirven?
- **Evitar repetir codigo**: Escribes una funcion una vez, la usas muchas veces
- **Organizar mejor**: Codigo mas limpio y facil de entender
- **Ahorrar tiempo**: Funciones listas para tareas comunes
- **Facilitar mantenimiento**: Si necesitas cambiar algo, lo haces en un solo lugar

### Ejemplos en helpers.py
```python
# En lugar de escribir esto muchas veces:
suma = sum(numeros)
promedio = suma / len(numeros)

# Usas el helper:
from helpers import calcular_estadisticas
stats = calcular_estadisticas(numeros)
print(f"Promedio: {stats['promedio']}")
```

### Tip para principiantes
Cada vez que notes que estas copiando y pegando codigo, es momento de crear un helper!

---

## Recursos para Aprender Python

### Documentacion oficial
- [Python.org - Tutorial oficial](https://docs.python.org/es/3/tutorial/) - Guia oficial completa
- [Python.org - Referencia del lenguaje](https://docs.python.org/3/reference/) - Documentacion tecnica

### Sitios de aprendizaje recomendados
- [Real Python](https://realpython.com/) - Tutoriales practicos y proyectos
- [GeeksforGeeks Python](https://www.geeksforgeeks.org/python-programming-language/) - Conceptos y ejemplos
- [W3Schools Python](https://www.w3schools.com/python/) - Curso interactivo basico
- [Automate the Boring Stuff](https://automatetheboringstuff.com/) - Python practico

### Librerias especificas
- [Pandas - Analisis de datos](https://pandas.pydata.org/docs/user_guide/index.html)
- [NumPy - Computacion numerica](https://numpy.org/doc/stable/user/)
- [Matplotlib - Graficos](https://matplotlib.org/stable/tutorials/index.html)
- [Requests - HTTP simple](https://docs.python-requests.org/en/latest/)

### Canales de YouTube (en espanol)
- [MoureDev](https://www.youtube.com/@mouredev) - Programacion general
- [Codigo Facilito](https://www.youtube.com/@codigofacilito) - Tutoriales Python
- [Platzi](https://www.youtube.com/@platzi) - Cursos completos

Una vez que te sientas comodo/a con este template basico, considera migrar al **Template Completo** que incluye:
- Estructura de carpetas profesional
- Separacion entre datos, scripts y resultados
- Notebooks de Jupyter organizados
- Helpers reutilizables

---

## Notas del Proyecto

**Usa este espacio para anotar cosas importantes sobre tu proyecto especifico:**

- Fechas importantes:
- Enlaces utiles:
- Contactos del equipo:
- Decisiones tomadas:

---

**Recuerda:** Este README es un documento vivo. Actualizalo conforme tu proyecto crezca.

## Autores

- rafaelmedina435
- Claude (Anthropic)
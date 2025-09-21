# 🏢 Mi Proyecto Python - Template Completo

> **Para proyectos profesionales, análisis de datos y colaboración en equipo**
### [Visita nuestra amigable documentación version web](https://python-quicksetup.netlify.app/)

## 📋 Descripción del Proyecto

**Completa esta sección con información específica de tu proyecto:**
- ¿Qué análisis realizas?
- ¿Qué datos procesas?
- ¿Cuáles son los objetivos?
- ¿Quién usa los resultados?

## 📁 Estructura del Proyecto

```
mi_proyecto/
├── 📁 data/
│   ├── 📁 insumos/          # 📥 Archivos originales (.xlsx, .csv, .json)
│   ├── 📁 resultados/       # 📤 Archivos procesados y reportes finales
│   └── 📁 logs/             # 📋 Registros de ejecución (auto-generados)
├── 📁 notebooks/            # 📊 Análisis exploratorio y documentación
├── 📁 helpers/              # 🛠️ Funciones reutilizables y módulos personalizados
├── 📄 main.py              # 🚀 Punto de entrada principal del proyecto
├── 📄 requirements.txt     # 📦 Dependencias del proyecto (CRÍTICO)
├── 📄 manager.ps1          # ⚙️ Gestor completo del proyecto (setup, packages, etc.)
├── 📄 terminal.ps1         # 🔄 Activacion rapida del entorno de trabajo
└── 📄 README.md           # 📚 Esta documentación
```

## 🚀 Inicio Rápido

### 1. Configuración inicial (solo la primera vez)
```powershell
# Configura todo automáticamente
.\manager.ps1
```

### 2. Instala las dependencias recomendadas
```powershell
# Paquetes esenciales para análisis de datos
pip install pandas numpy matplotlib seaborn

# Para trabajar con Excel
pip install openpyxl xlsxwriter

# Para notebooks interactivos
pip install jupyter ipykernel

# Para APIs y web scraping
pip install requests beautifulsoup4

# Guarda todas las dependencias
.\manager.ps1
```

### 3. Inicia el proyecto
```powershell
# Ejecuta el programa principal
python main.py

# O abre Jupyter para análisis interactivo
jupyter notebook
```

## 📊 Flujo de Trabajo Profesional

### 📥 1. Preparación de datos
- Coloca archivos originales en `data/insumos/`
- Nunca modifiques los archivos originales
- Usa nombres descriptivos: `ventas_enero_2024.xlsx`

### 🔬 2. Análisis exploratorio
- Crea notebooks en `notebooks/` para explorar datos
- Usa nombres como: `01_exploracion_inicial.ipynb`
- Documenta hallazgos importantes

### 🛠️ 3. Desarrollo de funciones
- Crea funciones reutilizables en `helpers/`
- Una función = Un propósito específico
- Documenta parámetros y valores de retorno

### 🎯 4. Procesamiento principal
- Usa `main.py` para orquestar todo el proceso
- Implementa logging para seguimiento
- Guarda resultados en `data/resultados/`

### 📤 5. Entrega de resultados
- Exporta reportes finales a `data/resultados/`
- Incluye fecha en nombres: `reporte_ventas_2024-03-15.xlsx`
- Documenta metodología en notebooks

## 🗂️ Convenciones de Archivos

### 📥 data/insumos/
- `ventas_YYYY-MM-DD.xlsx` - Datos de ventas
- `clientes_actualizados.csv` - Base de clientes
- `parametros_config.json` - Configuraciones

### 📤 data/resultados/
- `reporte_final_YYYY-MM-DD.xlsx` - Reportes ejecutivos
- `datos_procesados_YYYY-MM-DD.csv` - Datasets limpios
- `graficos/` - Carpeta para imágenes y charts

### 📊 notebooks/
- `01_exploracion_inicial.ipynb` - Primer análisis
- `02_limpieza_datos.ipynb` - Procesamiento
- `03_analisis_avanzado.ipynb` - Insights
- `99_reporte_final.ipynb` - Presentación

### 🛠️ helpers/
- `data_processor.py` - Funciones de procesamiento
- `file_manager.py` - Gestión de archivos
- `visualization.py` - Funciones de gráficos
- `utilities.py` - Utilidades generales

## 📝 Convenciones de Nomenclatura

### Reglas basicas para nombres
- **Nombres sencillos y claros**: Usa nombres que expliquen que hace
- **Sin espacios**: Usa guiones bajos en lugar de espacios
- **En minusculas**: Todo en letras minusculas
- **Sin tildes**: Evita acentos y caracteres especiales
- **En ingles**: Preferible para compatibilidad

### Ejemplos para proyectos profesionales

**Para archivos de datos:**
- ✅ `ventas_enero_2024.xlsx`
- ✅ `clientes_activos.csv`
- ❌ `Ventas Enero 2024.xlsx`
- ❌ `clientes_históricos.csv`

**Para scripts y modulos:**
- ✅ `data_processor.py`
- ✅ `generate_report.py`
- ❌ `Data Processor.py`
- ❌ `generar_reporte.py`

**Para variables en analisis:**
```python
# ✅ Correcto
df_ventas = pd.read_csv('ventas.csv')
total_revenue = df_ventas['precio'].sum()
top_products = df_ventas.nlargest(10, 'cantidad')

# ❌ Evitar
dfVentas = pd.read_csv('ventas.csv')
totalRevenue = df_ventas['precio'].sum()
TopProducts = df_ventas.nlargest(10, 'cantidad')
```

**Para funciones de analisis:**
```python
# ✅ Correcto
def calculate_monthly_growth(data):
    return data.pct_change() * 100

def clean_customer_data(df):
    return df.dropna().reset_index(drop=True)

# ❌ Evitar
def CalculateMonthlyGrowth(data):
    pass

def limpiarDatosCliente(df):
    pass
```

## ⭐ Mejores Prácticas Profesionales

### 🥇 Gestión de Datos
- **Nunca modifiques archivos originales**
- Usa copias para experimentar
- Implementa validaciones de datos
- Documenta transformaciones

### 🥈 Código Limpio
- Funciones pequeñas y específicas
- Nombres descriptivos de variables
- Comentarios en partes complejas
- Consistencia en estilo de código

### 🥉 Colaboración
- Actualiza requirements.txt religiosamente
- Usa mensajes de commit descriptivos
- Documenta decisiones importantes
- Comparte conocimiento en notebooks

### 🏅 Reproducibilidad
- Fija versiones en requirements.txt
- Usa rutas relativas siempre
- Configura seeds para aleatoriedad
- Testa en diferentes entornos

### 🎯 Profesionalismo
- Implementa manejo de errores
- Usa logging en lugar de prints
- Valida inputs y outputs
- Crea tests básicos cuando sea posible

## 🔄 Flujo de Trabajo Diario

### 🌅 Al empezar el día:
```powershell
# 1. Activar entorno
.\terminal.ps1

# 2. Verificar estructura
python main.py

# 3. Abrir herramientas
jupyter notebook
# o code . (si usas VS Code)
```

### 💼 Durante el trabajo:
1. **Explorar** en notebooks
2. **Desarrollar** funciones en helpers
3. **Procesar** datos con main.py
4. **Validar** resultados
5. **Documentar** proceso

### 🌙 Al finalizar:
```powershell
# Si instalaste algo nuevo
.\manager.ps1

# Commit cambios (si usas Git)
# git add .
# git commit -m "Descripción de cambios"
```

## 🔧 Scripts de Automatización

| Script | Propósito | Cuándo usar |
|--------|-----------|-------------|
| `manager.ps1` | Gestión completa del proyecto (setup, packages, config) | Setup inicial y gestión de dependencias |
| `terminal.ps1` | Activar entorno de trabajo | Al empezar cada sesión |

## 🆘 Solución de Problemas Avanzados

### ❌ Error de permisos PowerShell
```powershell
# Como usuario normal (no admin)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### ❌ Problemas con Jupyter
```powershell
# Instalar kernel específico del proyecto
python -m ipykernel install --user --name=venv --display-name "Mi Proyecto"

# Cambiar kernel en Jupyter: Kernel > Change kernel > Mi Proyecto
```

### ❌ Errores de importación
```powershell
# Verificar entorno activo
where python
# Debe mostrar la ruta del venv

# Reinstalar paquete problemático
pip uninstall paquete_problematico
pip install paquete_problematico
```

### ❌ Problemas de memoria con datos grandes
- Procesa datos en chunks con pandas
- Usa `dtype` específicos para reducir memoria
- Considera `dask` para datasets muy grandes

## 📚 Recursos para Aprender Python

### Documentacion oficial
- [Python.org - Tutorial oficial](https://docs.python.org/es/3/tutorial/) - Guia oficial completa
- [Python.org - Referencia del lenguaje](https://docs.python.org/3/reference/) - Documentacion tecnica

### Sitios de aprendizaje recomendados
- [Real Python](https://realpython.com/) - Tutoriales practicos y proyectos
- [GeeksforGeeks Python](https://www.geeksforgeeks.org/python-programming-language/) - Conceptos y ejemplos
- [W3Schools Python](https://www.w3schools.com/python/) - Curso interactivo basico
- [Automate the Boring Stuff](https://automatetheboringstuff.com/) - Python practico

### Recursos especializados para analisis de datos
- [Pandas User Guide](https://pandas.pydata.org/docs/user_guide/) - Manipulacion de datos
- [NumPy Documentation](https://numpy.org/doc/stable/user/) - Computacion numerica
- [Matplotlib Tutorials](https://matplotlib.org/stable/tutorials/) - Graficos basicos
- [Seaborn Gallery](https://seaborn.pydata.org/examples/) - Visualizacion estadistica
- [Jupyter Documentation](https://jupyter.org/documentation) - Notebooks interactivos

### Herramientas avanzadas
- [Plotly](https://plotly.com/python/) - Gráficos interactivos
- [Altair](https://altair-viz.github.io/) - Gráficos estadísticos
- [Bokeh](https://docs.bokeh.org/) - Aplicaciones web
- [Scikit-learn](https://scikit-learn.org/stable/) - Machine learning
- [Requests](https://docs.python-requests.org/en/latest/) - APIs y web scraping

### Canales de YouTube (en espanol)
- [MoureDev](https://www.youtube.com/@mouredev) - Programacion general
- [Codigo Facilito](https://www.youtube.com/@codigofacilito) - Tutoriales Python
- [Platzi](https://www.youtube.com/@platzi) - Cursos completos
- [Dot CSV](https://www.youtube.com/@DotCSV) - Data Science y ML

### Buenas practicas y desarrollo
- [Python Style Guide (PEP 8)](https://pep8.org/) - Estilo de codigo
- [Effective Python](https://effectivepython.com/) - Tecnicas avanzadas
- [Clean Code in Python](https://realpython.com/python-code-quality/) - Codigo limpio

## 🎯 Checklist de Proyecto Completo

### ✅ Configuración
- [ ] Entorno virtual creado y activado
- [ ] Dependencias instaladas y guardadas
- [ ] Estructura de carpetas verificada
- [ ] Logging configurado

### ✅ Desarrollo  
- [ ] Datos cargados en data/insumos/
- [ ] Análisis exploratorio documentado
- [ ] Funciones creadas en helpers/
- [ ] Proceso principal implementado

### ✅ Calidad
- [ ] Código comentado y limpio
- [ ] Validaciones implementadas
- [ ] Errores manejados apropiadamente
- [ ] Resultados validados

### ✅ Entrega
- [ ] Resultados en data/resultados/
- [ ] Documentación actualizada
- [ ] Requirements.txt actualizado
- [ ] Proyecto probado en otro entorno

---

## 📝 Información del Proyecto

**Completa esta sección con detalles específicos:**

### 👥 Equipo
- **Responsable**: Tu nombre
- **Colaboradores**: Lista de personas
- **Stakeholders**: Quién usa los resultados

### 📅 Timeline
- **Inicio**: Fecha de inicio
- **Hitos importantes**: Fechas clave
- **Entrega**: Fecha límite

### 🔗 Enlaces Importantes
- **Datos fuente**: Donde obtener los datos
- **Documentación externa**: Enlaces relevantes
- **Contactos**: Personas clave del proyecto

### 📋 Notas de Desarrollo
- **Decisiones técnicas**: Por qué se tomaron ciertas decisiones
- **Limitaciones conocidas**: Qué no funciona perfecto
- **Mejoras futuras**: Ideas para versiones siguientes

---

💡 **Recuerda:** Un proyecto bien documentado es un proyecto exitoso.

## Autores

- rafaelmedina435
- Claude (Anthropic)
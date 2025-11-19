<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-19T21:04:12+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "es"
}
-->
# Ejemplo de Aplicación en Contenedor - API Simple con Flask

**Ruta de Aprendizaje:** Principiante ⭐ | **Tiempo:** 25-35 minutos | **Costo:** $0-15/mes

Una API REST completa y funcional en Python Flask desplegada en Azure Container Apps utilizando Azure Developer CLI (azd). Este ejemplo demuestra los conceptos básicos de despliegue en contenedores, autoescalado y monitoreo.

## 🎯 Lo que Aprenderás

- Desplegar una aplicación en contenedor de Python en Azure
- Configurar autoescalado con escala a cero
- Implementar sondas de salud y verificaciones de preparación
- Monitorear registros y métricas de la aplicación
- Usar Azure Developer CLI para un despliegue rápido

## 📦 Qué Incluye

✅ **Aplicación Flask** - API REST completa con operaciones CRUD (`src/app.py`)  
✅ **Dockerfile** - Configuración de contenedor lista para producción  
✅ **Infraestructura Bicep** - Entorno de Container Apps y despliegue de la API  
✅ **Configuración de AZD** - Configuración para despliegue con un solo comando  
✅ **Sondas de Salud** - Sondas de vida y preparación configuradas  
✅ **Autoescalado** - 0-10 réplicas basado en carga HTTP  

## Arquitectura

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## Requisitos Previos

### Obligatorios
- **Azure Developer CLI (azd)** - [Guía de instalación](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Suscripción de Azure** - [Cuenta gratuita](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Instalar Docker](https://www.docker.com/products/docker-desktop/) (para pruebas locales)

### Verificar Requisitos Previos

```bash
# Verificar la versión de azd (necesita 1.5.0 o superior)
azd version

# Verificar inicio de sesión en Azure
azd auth login

# Verificar Docker (opcional, para pruebas locales)
docker --version
```

## ⏱️ Cronograma de Despliegue

| Fase | Duración | Qué Sucede |
|------|----------|------------|
| Configuración del entorno | 30 segundos | Crear entorno azd |
| Construir contenedor | 2-3 minutos | Construcción Docker de la app Flask |
| Provisión de infraestructura | 3-5 minutos | Crear Container Apps, registro, monitoreo |
| Desplegar aplicación | 2-3 minutos | Subir imagen y desplegar en Container Apps |
| **Total** | **8-12 minutos** | Despliegue completo listo |

## Inicio Rápido

```bash
# Navegar al ejemplo
cd examples/container-app/simple-flask-api

# Inicializar el entorno (elegir un nombre único)
azd env new myflaskapi

# Desplegar todo (infraestructura + aplicación)
azd up
# Se te pedirá que:
# 1. Selecciones la suscripción de Azure
# 2. Elijas la ubicación (por ejemplo, eastus2)
# 3. Esperes de 8 a 12 minutos para el despliegue

# Obtén tu endpoint de API
azd env get-values

# Probar la API
curl $(azd env get-value API_ENDPOINT)/health
```

**Salida Esperada:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Verificar Despliegue

### Paso 1: Verificar Estado del Despliegue

```bash
# Ver servicios desplegados
azd show

# La salida esperada muestra:
# - Servicio: api
# - Punto final: https://ca-api-[env].xxx.azurecontainerapps.io
# - Estado: En ejecución
```

### Paso 2: Probar los Endpoints de la API

```bash
# Obtener el endpoint de la API
API_URL=$(azd env get-value API_ENDPOINT)

# Probar la salud
curl $API_URL/health

# Probar el endpoint raíz
curl $API_URL/

# Crear un elemento
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Obtener todos los elementos
curl $API_URL/api/items
```

**Criterios de Éxito:**
- ✅ El endpoint de salud devuelve HTTP 200
- ✅ El endpoint raíz muestra información de la API
- ✅ POST crea un elemento y devuelve HTTP 201
- ✅ GET devuelve los elementos creados

### Paso 3: Ver Registros

```bash
# Transmitir registros en vivo
azd logs api --follow

# Deberías ver:
# - Mensajes de inicio de Gunicorn
# - Registros de solicitudes HTTP
# - Registros de información de la aplicación
```

## Estructura del Proyecto

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## Endpoints de la API

| Endpoint | Método | Descripción |
|----------|--------|-------------|
| `/health` | GET | Verificación de salud |
| `/api/items` | GET | Listar todos los elementos |
| `/api/items` | POST | Crear un nuevo elemento |
| `/api/items/{id}` | GET | Obtener un elemento específico |
| `/api/items/{id}` | PUT | Actualizar un elemento |
| `/api/items/{id}` | DELETE | Eliminar un elemento |

## Configuración

### Variables de Entorno

```bash
# Establecer configuración personalizada
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Configuración de Escalado

La API se escala automáticamente según el tráfico HTTP:
- **Réplicas Mínimas**: 0 (se escala a cero cuando está inactiva)
- **Réplicas Máximas**: 10
- **Solicitudes Concurrentes por Réplica**: 50

## Desarrollo

### Ejecutar Localmente

```bash
# Instalar dependencias
cd src
pip install -r requirements.txt

# Ejecutar la aplicación
python app.py

# Probar localmente
curl http://localhost:8000/health
```

### Construir y Probar el Contenedor

```bash
# Construir imagen de Docker
docker build -t flask-api:local ./src

# Ejecutar contenedor localmente
docker run -p 8000:8000 flask-api:local

# Probar contenedor
curl http://localhost:8000/health
```

## Despliegue

### Despliegue Completo

```bash
# Desplegar infraestructura y aplicación
azd up
```

### Despliegue Solo de Código

```bash
# Implementar solo el código de la aplicación (infraestructura sin cambios)
azd deploy api
```

### Actualizar Configuración

```bash
# Actualizar variables de entorno
azd env set API_KEY "new-api-key"

# Reimplementar con nueva configuración
azd deploy api
```

## Monitoreo

### Ver Registros

```bash
# Transmitir registros en vivo
azd logs api --follow

# Ver las últimas 100 líneas
azd logs api --tail 100
```

### Monitorear Métricas

```bash
# Abrir el panel de Azure Monitor
azd monitor --overview

# Ver métricas específicas
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Pruebas

### Verificación de Salud

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Respuesta esperada:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Crear Elemento

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Obtener Todos los Elementos

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Optimización de Costos

Este despliegue utiliza escala a cero, por lo que solo pagas cuando la API está procesando solicitudes:

- **Costo en inactividad**: ~$0/mes (escalado a cero)
- **Costo activo**: ~$0.000024/segundo por réplica
- **Costo mensual esperado** (uso ligero): $5-15

### Reducir Costos Aún Más

```bash
# Reducir el número máximo de réplicas para desarrollo
azd env set MAX_REPLICAS 3

# Usar un tiempo de espera inactivo más corto
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutos
```

## Solución de Problemas

### El Contenedor No Inicia

```bash
# Verificar los registros del contenedor
azd logs api --tail 100

# Verificar que las imágenes de Docker se construyan localmente
docker build -t test ./src
```

### La API No Es Accesible

```bash
# Verificar que el ingreso es externo
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Tiempos de Respuesta Altos

```bash
# Verificar el uso de CPU/Memoria
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Escalar los recursos si es necesario
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Limpieza

```bash
# Eliminar todos los recursos
azd down --force --purge
```

## Próximos Pasos

### Ampliar Este Ejemplo

1. **Agregar Base de Datos** - Integrar Azure Cosmos DB o SQL Database  
   ```bash
   # Agregar el módulo de Cosmos DB a infra/main.bicep
   # Actualizar app.py con la conexión a la base de datos
   ```

2. **Agregar Autenticación** - Implementar Azure AD o claves API  
   ```python
   # Agregar middleware de autenticación a app.py
   from functools import wraps
   ```

3. **Configurar CI/CD** - Flujo de trabajo con GitHub Actions  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Agregar Identidad Administrada** - Acceso seguro a servicios de Azure  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Ejemplos Relacionados

- **[Aplicación con Base de Datos](../../../../../examples/database-app)** - Ejemplo completo con SQL Database  
- **[Microservicios](../../../../../examples/container-app/microservices)** - Arquitectura de múltiples servicios  
- **[Guía Maestra de Container Apps](../README.md)** - Todos los patrones de contenedores  

### Recursos de Aprendizaje

- 📚 [Curso AZD para Principiantes](../../../README.md) - Página principal del curso  
- 📚 [Patrones de Container Apps](../README.md) - Más patrones de despliegue  
- 📚 [Galería de Plantillas AZD](https://azure.github.io/awesome-azd/) - Plantillas de la comunidad  

## Recursos Adicionales

### Documentación
- **[Documentación de Flask](https://flask.palletsprojects.com/)** - Guía del framework Flask  
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Documentación oficial de Azure  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referencia de comandos azd  

### Tutoriales
- **[Inicio Rápido de Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Despliega tu primera app  
- **[Python en Azure](https://learn.microsoft.com/azure/developer/python/)** - Guía de desarrollo en Python  
- **[Lenguaje Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infraestructura como código  

### Herramientas
- **[Portal de Azure](https://portal.azure.com)** - Gestiona recursos visualmente  
- **[Extensión de Azure para VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integración con el IDE  

---

**🎉 ¡Felicidades!** Has desplegado una API Flask lista para producción en Azure Container Apps con autoescalado y monitoreo.

**¿Preguntas?** [Abre un issue](https://github.com/microsoft/AZD-for-beginners/issues) o consulta las [Preguntas Frecuentes](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
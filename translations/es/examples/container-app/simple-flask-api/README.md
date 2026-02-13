# Simple Flask API - Ejemplo de Container App

**Ruta de aprendizaje:** Principiante ⭐ | **Tiempo:** 25-35 minutos | **Costo:** $0-15/month

Una API REST completa y funcional en Python Flask desplegada en Azure Container Apps usando Azure Developer CLI (azd). Este ejemplo demuestra despliegue de contenedores, autoescalado y conceptos básicos de monitorización.

## 🎯 Qué aprenderás

- Desplegar una aplicación de Python en contenedores en Azure
- Configurar autoescalado con scale-to-zero
- Implementar sondas de salud y comprobaciones de readiness
- Monitorizar registros y métricas de la aplicación
- Usar Azure Developer CLI para despliegues rápidos

## 📦 Qué incluye

✅ **Flask Application** - API REST completa con operaciones CRUD (`src/app.py`)  
✅ **Dockerfile** - Configuración de contenedor lista para producción  
✅ **Bicep Infrastructure** - Entorno de Container Apps y despliegue de la API  
✅ **AZD Configuration** - Configuración de despliegue con un solo comando  
✅ **Health Probes** - Comprobaciones de liveness y readiness configuradas  
✅ **Auto-scaling** - 0-10 réplicas según la carga HTTP  

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

## Requisitos previos

### Requisitos
- **Azure Developer CLI (azd)** - [Guía de instalación](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Cuenta gratuita](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Instalar Docker](https://www.docker.com/products/docker-desktop/) (para pruebas locales)

### Verificar requisitos previos

```bash
# Comprobar la versión de azd (se necesita 1.5.0 o superior)
azd version

# Verificar el inicio de sesión en Azure
azd auth login

# Comprobar Docker (opcional, para pruebas locales)
docker --version
```

## ⏱️ Cronograma de despliegue

| Phase | Duration | What Happens |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Complete deployment ready |

## Inicio rápido

```bash
# Navega al ejemplo
cd examples/container-app/simple-flask-api

# Inicializa el entorno (elige un nombre único)
azd env new myflaskapi

# Despliega todo (infraestructura + aplicación)
azd up
# Se te pedirá que:
# 1. Selecciona la suscripción de Azure
# 2. Elige la ubicación (p. ej., eastus2)
# 3. Espera 8-12 minutos para el despliegue

# Obtén el endpoint de tu API
azd env get-values

# Prueba la API
curl $(azd env get-value API_ENDPOINT)/health
```

**Salida esperada:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Verificar despliegue

### Paso 1: Comprobar el estado del despliegue

```bash
# Ver servicios desplegados
azd show

# La salida esperada muestra:
# - Servicio: api
# - Punto de enlace: https://ca-api-[env].xxx.azurecontainerapps.io
# - Estado: En ejecución
```

### Paso 2: Probar los endpoints de la API

```bash
# Obtener el endpoint de la API
API_URL=$(azd env get-value API_ENDPOINT)

# Comprobar el estado de salud
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

**Criterios de éxito:**
- ✅ El endpoint de health devuelve HTTP 200
- ✅ El endpoint raíz muestra información de la API
- ✅ POST crea un elemento y devuelve HTTP 201
- ✅ GET devuelve los elementos creados

### Paso 3: Ver registros

```bash
# Transmitir registros en vivo con azd monitor
azd monitor --logs

# O use la CLI de Azure:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Debería ver:
# - Mensajes de inicio de Gunicorn
# - Registros de solicitudes HTTP
# - Registros de información de la aplicación
```

## Estructura del proyecto

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

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Comprobación de salud |
| `/api/items` | GET | Listar todos los elementos |
| `/api/items` | POST | Crear nuevo elemento |
| `/api/items/{id}` | GET | Obtener elemento específico |
| `/api/items/{id}` | PUT | Actualizar elemento |
| `/api/items/{id}` | DELETE | Eliminar elemento |

## Configuración

### Variables de entorno

```bash
# Establecer configuración personalizada
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Configuración de escalado

La API escala automáticamente según el tráfico HTTP:
- **Replicas mínimas**: 0 (se reduce a cero cuando está inactiva)
- **Réplicas máximas**: 10
- **Solicitudes concurrentes por réplica**: 50

## Desarrollo

### Ejecutar localmente

```bash
# Instalar dependencias
cd src
pip install -r requirements.txt

# Ejecutar la aplicación
python app.py

# Probar localmente
curl http://localhost:8000/health
```

### Construir y probar el contenedor

```bash
# Construir la imagen de Docker
docker build -t flask-api:local ./src

# Ejecutar el contenedor localmente
docker run -p 8000:8000 flask-api:local

# Probar el contenedor
curl http://localhost:8000/health
```

## Despliegue

### Despliegue completo

```bash
# Desplegar la infraestructura y la aplicación
azd up
```

### Despliegue solo de código

```bash
# Desplegar solo el código de la aplicación (infraestructura sin cambios)
azd deploy api
```

### Actualizar configuración

```bash
# Actualizar variables de entorno
azd env set API_KEY "new-api-key"

# Volver a desplegar con la nueva configuración
azd deploy api
```

## Monitorización

### Ver registros

```bash
# Transmitir registros en vivo con azd monitor
azd monitor --logs

# O usa la CLI de Azure para Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Ver las últimas 100 líneas
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Supervisar métricas

```bash
# Abrir el panel de Azure Monitor
azd monitor --overview

# Ver métricas específicas
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Pruebas

### Comprobación de salud

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

### Crear elemento

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Obtener todos los elementos

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Optimización de costos

Este despliegue utiliza scale-to-zero, por lo que solo pagas cuando la API está procesando solicitudes:

- **Costo en reposo**: ~$0/month (scaled to zero)
- **Costo activo**: ~$0.000024/second per replica
- **Costo mensual estimado** (uso ligero): $5-15

### Reducir costos aún más

```bash
# Reducir el número máximo de réplicas para desarrollo
azd env set MAX_REPLICAS 3

# Usar un tiempo de espera de inactividad más corto
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutos
```

## Solución de problemas

### El contenedor no inicia

```bash
# Comprobar los registros del contenedor usando Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Verificar que la imagen de Docker se construye localmente
docker build -t test ./src
```

### API no accesible

```bash
# Verificar que el ingress sea externo
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Tiempos de respuesta altos

```bash
# Comprobar el uso de CPU/memoria
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

## Próximos pasos

### Ampliar este ejemplo

1. **Agregar base de datos** - Integrar Azure Cosmos DB o SQL Database
   ```bash
   # Agregar módulo de Cosmos DB a infra/main.bicep
   # Actualizar app.py con la conexión a la base de datos
   ```

2. **Agregar autenticación** - Implementar Azure AD o claves de API
   ```python
   # Agregar middleware de autenticación a app.py
   from functools import wraps
   ```

3. **Configurar CI/CD** - Flujo de trabajo de GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Agregar identidad administrada** - Asegurar el acceso a servicios de Azure
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Ejemplos relacionados

- **[Aplicación de base de datos](../../../../../examples/database-app)** - Ejemplo completo con SQL Database
- **[Microservicios](../../../../../examples/container-app/microservices)** - Arquitectura de microservicios
- **[Container Apps Master Guide](../README.md)** - Todos los patrones de contenedores

### Recursos de aprendizaje

- 📚 [Curso AZD para principiantes](../../../README.md) - Página principal del curso
- 📚 [Patrones de Container Apps](../README.md) - Más patrones de despliegue
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Plantillas de la comunidad

## Recursos adicionales

### Documentación
- **[Documentación de Flask](https://flask.palletsprojects.com/)** - Guía del framework Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Documentación oficial de Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referencia de comandos azd

### Tutoriales
- **[Guía rápida de Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Desplegar tu primera app
- **[Python en Azure](https://learn.microsoft.com/azure/developer/python/)** - Guía de desarrollo en Python
- **[Lenguaje Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infraestructura como código

### Herramientas
- **[Azure Portal](https://portal.azure.com)** - Administrar recursos visualmente
- **[Extensión de Azure para VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integración con el IDE

---

**🎉 ¡Felicidades!** Has desplegado una API Flask lista para producción en Azure Container Apps con autoescalado y monitorización.

**¿Preguntas?** [Abrir un issue](https://github.com/microsoft/AZD-for-beginners/issues) o consulta las [Preguntas frecuentes](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Aviso legal:
Este documento ha sido traducido usando el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la exactitud, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un humano. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan derivarse del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
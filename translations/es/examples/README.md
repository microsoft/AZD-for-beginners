# Ejemplos - Plantillas y Configuraciones Prácticas de AZD

**Aprender con Ejemplos - Organizado por Capítulo**
- **📚 Inicio del curso**: [AZD For Beginners](../README.md)
- **📖 Mapeo de Capítulos**: Ejemplos organizados por complejidad de aprendizaje
- **🚀 Ejemplo Local**: [Solución Multi-Agente Minorista](retail-scenario.md)
- **🤖 Ejemplos de IA Externos**: Enlaces a repositorios Azure Samples

> **📍 IMPORTANTE: Ejemplos Locales vs Externos**  
> Este repositorio contiene **4 ejemplos locales completos** con implementaciones completas:  
> - **Microsoft Foundry Models Chat** (despliegue gpt-4.1 con interfaz de chat)  
> - **Container Apps** (API Flask simple + Microservicios)  
> - **Aplicación de Base de Datos** (Web + Base de Datos SQL)  
> - **Retail Multi-Agent** (Solución de IA Empresarial)  
>  
> Ejemplos adicionales son **referencias externas** a repositorios Azure-Samples que puedes clonar.

## Introducción

Este directorio proporciona ejemplos prácticos y referencias para ayudarte a aprender Azure Developer CLI mediante práctica práctica. El escenario Retail Multi-Agent es una implementación completa y lista para producción incluida en este repositorio. Los ejemplos adicionales hacen referencia a Azure Samples oficiales que demuestran varios patrones de AZD.

### Leyenda de Clasificación de Complejidad

- ⭐ **Principiante** - Conceptos básicos, servicio único, 15-30 minutos
- ⭐⭐ **Intermedio** - Múltiples servicios, integración con base de datos, 30-60 minutos
- ⭐⭐⭐ **Avanzado** - Arquitectura compleja, integración de IA, 1-2 horas
- ⭐⭐⭐⭐ **Experto** - Listo para producción, patrones empresariales, 2+ horas

## 🎯 Qué hay realmente en este repositorio

### ✅ Implementación Local (Lista para Usar)

#### [Aplicación de Chat Microsoft Foundry Models](azure-openai-chat/README.md) 🆕
**Despliegue completo gpt-4.1 con interfaz de chat incluido en este repositorio**

- **Ubicación:** `examples/azure-openai-chat/`
- **Complejidad:** ⭐⭐ (Intermedio)
- **Qué incluye:**
  - Despliegue completo de Microsoft Foundry Models (gpt-4.1)
  - Interfaz de chat por línea de comandos en Python
  - Integración con Key Vault para claves API seguras
  - Plantillas de infraestructura en Bicep
  - Seguimiento de uso de tokens y costos
  - Limitación de tasa y manejo de errores

**Inicio Rápido:**
```bash
# Navega a example
cd examples/azure-openai-chat

# Despliega todo
azd up

# Instala dependencias y comienza a chatear
pip install -r src/requirements.txt
python src/chat.py
```

**Tecnologías:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Ejemplos de Container App](container-app/README.md) 🆕
**Ejemplos completos de despliegue de contenedores incluidos en este repositorio**

- **Ubicación:** `examples/container-app/`
- **Complejidad:** ⭐-⭐⭐⭐⭐ (Principiante a Avanzado)
- **Qué incluye:**
  - [Master Guide](container-app/README.md) - Visión general completa de despliegues de contenedores
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Ejemplo básico de API REST
  - [Microservices Architecture](../../../examples/container-app/microservices) - Despliegue multi-servicio listo para producción
  - Patrones de Inicio Rápido, Producción y Avanzados
  - Monitoreo, seguridad y optimización de costos

**Inicio Rápido:**
```bash
# Ver la guía maestra
cd examples/container-app

# Desplegar una API Flask simple
cd simple-flask-api
azd up

# Desplegar un ejemplo de microservicios
cd ../microservices
azd up
```

**Tecnologías:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Solución Multi-Agente Minorista](retail-scenario.md) 🆕
**Implementación completa y lista para producción incluida en este repositorio**

- **Ubicación:** `examples/retail-multiagent-arm-template/`
- **Complejidad:** ⭐⭐⭐⭐ (Avanzado)
- **Qué incluye:**
  - Plantilla completa de despliegue ARM
  - Arquitectura multi-agente (Cliente + Inventario)
  - Integración con Microsoft Foundry Models
  - Búsqueda de IA con RAG
  - Monitoreo integral
  - Script de despliegue con un clic

**Inicio Rápido:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tecnologías:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Muestras Externas de Azure (Clonar para Usar)

Los siguientes ejemplos se mantienen en repositorios oficiales de Azure-Samples. Clónalos para explorar diferentes patrones de AZD:

### Aplicaciones Simples (Capítulos 1-2)

| Plantilla | Repositorio | Complejidad | Servicios |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-servicio, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Cómo usar:**
```bash
# Clona cualquier ejemplo
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Despliega
azd up
```

### Ejemplos de Aplicaciones de IA (Capítulos 2, 5, 8)

| Plantilla | Repositorio | Complejidad | Enfoque |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | despliegue gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat de IA básico |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Marco de agentes |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Patrón RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | IA empresarial |

### Base de Datos y Patrones Avanzados (Capítulos 3-8)

| Plantilla | Repositorio | Complejidad | Enfoque |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integración de base de datos |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-servicio |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Objetivos de Aprendizaje

Al trabajar con estos ejemplos, tú:
- Practicarás flujos de trabajo de Azure Developer CLI con escenarios de aplicación realistas
- Entenderás diferentes arquitecturas de aplicaciones y sus implementaciones azd
- Dominarás patrones de Infrastructure as Code para varios servicios de Azure
- Aplicarás gestión de configuración y estrategias de despliegue específicas por entorno
- Implementarás patrones de monitoreo, seguridad y escalado en contextos prácticos
- Adquirirás experiencia en resolución de problemas y depuración de escenarios de despliegue reales

## Resultados de Aprendizaje

Al completar estos ejemplos, serás capaz de:
- Desplegar diversos tipos de aplicaciones usando Azure Developer CLI con confianza
- Adaptar las plantillas proporcionadas a los requisitos de tu propia aplicación
- Diseñar e implementar patrones de infraestructura personalizados usando Bicep
- Configurar aplicaciones multi-servicio complejas con dependencias adecuadas
- Aplicar buenas prácticas de seguridad, monitoreo y rendimiento en escenarios reales
- Solucionar y optimizar despliegues basándote en experiencia práctica

## Estructura del Directorio

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Ejemplos de Inicio Rápido

> **💡 ¿Nuevo en AZD?** Comienza con el ejemplo #1 (Flask API) - toma ~20 minutos y enseña conceptos clave.

### Para Principiantes
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Despliega una API REST simple con escala a cero  
   **Tiempo:** 20-25 minutos | **Costo:** $0-5/mes  
   **Aprenderás:** Flujo de trabajo básico de azd, containerización, sondas de salud  
   **Resultado esperado:** Punto de enlace API funcional que devuelve "Hello, World!" con monitoreo

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Despliega una aplicación web Node.js Express con MongoDB  
   **Tiempo:** 25-35 minutos | **Costo:** $10-30/mes  
   **Aprenderás:** Integración de base de datos, variables de entorno, cadenas de conexión  
   **Resultado esperado:** Aplicación de lista de tareas con funcionalidad crear/leer/actualizar/eliminar

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Aloja un sitio estático React con Azure Static Web Apps  
   **Tiempo:** 20-30 minutos | **Costo:** $0-10/mes  
   **Aprenderás:** Hosting estático, funciones serverless, despliegue CDN  
   **Resultado esperado:** UI en React con backend API, SSL automático, CDN global

### Para Usuarios Intermedios
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Despliega gpt-4.1 con interfaz de chat y gestión segura de claves API  
   **Tiempo:** 35-45 minutos | **Costo:** $50-200/mes  
   **Aprenderás:** Despliegue de Microsoft Foundry Models, integración con Key Vault, seguimiento de tokens  
   **Resultado esperado:** Aplicación de chat funcional con gpt-4.1 y monitoreo de costos

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Arquitectura multi-servicio lista para producción  
   **Tiempo:** 45-60 minutos | **Costo:** $50-150/mes  
   **Aprenderás:** Comunicación entre servicios, encolamiento de mensajes, rastreo distribuido  
   **Resultado esperado:** Sistema de 2 servicios (API Gateway + Servicio de Productos) con monitoreo

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplicación web con API en C# y Azure SQL Database  
   **Tiempo:** 30-45 minutos | **Costo:** $20-80/mes  
   **Aprenderás:** Entity Framework, migraciones de base de datos, seguridad de conexión  
   **Resultado esperado:** API en C# con backend en Azure SQL, despliegue automático de esquema

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Azure Functions en Python con triggers HTTP y Cosmos DB  
   **Tiempo:** 30-40 minutos | **Costo:** $10-40/mes  
   **Aprenderás:** Arquitectura orientada a eventos, escalado serverless, integración NoSQL  
   **Resultado esperado:** App de funciones que responde a solicitudes HTTP con almacenamiento en Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplicación Java multi-servicio con Container Apps y API gateway  
   **Tiempo:** 60-90 minutos | **Costo:** $80-200/mes  
   **Aprenderás:** Despliegue de Spring Boot, service mesh, balanceo de carga  
   **Resultado esperado:** Sistema Java multi-servicio con descubrimiento de servicios y enrutamiento

### Plantillas Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Despliegue completo gpt-4.1 con interfaz de chat  
   **Tiempo:** 35-45 minutos | **Costo:** $50-200/mes  
   **Resultado esperado:** Aplicación de chat funcional con seguimiento de tokens y monitoreo de costos

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplicación de chat inteligente con arquitectura RAG  
   **Tiempo:** 60-90 minutos | **Costo:** $100-300/mes  
   **Resultado esperado:** Interfaz de chat con RAG y búsqueda de documentos con citas

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Análisis de documentos usando servicios de IA de Azure  
   **Tiempo:** 40-60 minutos | **Costo:** $20-80/mes  
   **Resultado esperado:** API que extrae texto, tablas y entidades de documentos subidos

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Flujo de trabajo MLOps con Azure Machine Learning  
   **Tiempo:** 2-3 horas | **Costo:** $150-500/mes  
   **Resultado esperado:** Pipeline de ML automatizado con entrenamiento, despliegue y monitoreo

### Escenarios del Mundo Real

#### **Solución Multi-Agente Minorista** 🆕
**[Guía de Implementación Completa](./retail-scenario.md)**

Una solución integral y lista para producción de soporte al cliente multi-agente que demuestra despliegue de aplicaciones de IA de grado empresarial con AZD. Este escenario ofrece:

- **Arquitectura Completa**: Sistema multi-agente con agentes especializados en servicio al cliente y gestión de inventario
- **Infraestructura de Producción**: Despliegues multirregión de Microsoft Foundry Models, AI Search, Container Apps, y monitoreo integral
- **Plantilla ARM lista para desplegar**: Despliegue con un clic con múltiples modos de configuración (Minimal/Standard/Premium)
- **Funciones Avanzadas**: Validación de seguridad mediante red teaming, marco de evaluación de agentes, optimización de costos y guías de solución de problemas
- **Contexto Empresarial Real**: Caso de uso de atención al cliente para minoristas con carga de archivos, integración de búsqueda y escalado dinámico

**Tecnologías**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complejidad**: ⭐⭐⭐⭐ (Avanzado - Listo para Producción Empresarial)

**Perfecto para**: Desarrolladores de IA, arquitectos de soluciones y equipos que construyen sistemas multiagente en producción

**Inicio Rápido**: Despliegue la solución completa en menos de 30 minutos usando la plantilla ARM incluida con `./deploy.sh -g myResourceGroup`

## 📋 Instrucciones de Uso

### Requisitos Previos

Antes de ejecutar cualquier ejemplo:
- ✅ Suscripción de Azure con acceso de Owner o Contributor
- ✅ Azure Developer CLI instalado ([Guía de instalación](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop en ejecución (para ejemplos con contenedores)
- ✅ Cuotas de Azure apropiadas (ver requisitos específicos de cada ejemplo)

> **💰 Advertencia de Costos:** Todos los ejemplos crean recursos reales en Azure que generan cargos. Consulte los archivos README individuales para estimaciones de costos. Recuerde ejecutar `azd down` cuando termine para evitar costos continuos.

### Ejecutar Ejemplos Localmente

1. **Clonar o Copiar el Ejemplo**
   ```bash
   # Navegar al ejemplo deseado
   cd examples/simple-web-app
   ```

2. **Inicializar el Entorno AZD**
   ```bash
   # Inicializar con plantilla existente
   azd init
   
   # O crear un nuevo entorno
   azd env new my-environment
   ```

3. **Configurar el Entorno**
   ```bash
   # Establecer las variables requeridas
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Desplegar**
   ```bash
   # Desplegar la infraestructura y la aplicación
   azd up
   ```

5. **Verificar el Despliegue**
   ```bash
   # Obtener puntos de conexión del servicio
   azd env get-values
   
   # Probar el punto de conexión (ejemplo)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Indicadores de Éxito Esperados:**
   - ✅ `azd up` se completa sin errores
   - ✅ El endpoint del servicio devuelve HTTP 200
   - ✅ Azure Portal muestra "Running" status
   - ✅ Application Insights recibe telemetría

> **⚠️ ¿Problemas?** Consulte [Problemas Comunes](../docs/chapter-07-troubleshooting/common-issues.md) para la solución de problemas de despliegue

### Adaptar Ejemplos

Cada ejemplo incluye:
- **README.md** - Instrucciones detalladas de configuración y personalización
- **azure.yaml** - Configuración AZD con comentarios
- **infra/** - Plantillas Bicep con explicaciones de parámetros
- **src/** - Código de ejemplo de la aplicación
- **scripts/** - Scripts auxiliares para tareas comunes

## 🎯 Objetivos de Aprendizaje

### Categorías de Ejemplos

#### **Despliegues Básicos**
- Aplicaciones de servicio único
- Patrones de infraestructura sencillos
- Gestión básica de configuración
- Entornos de desarrollo rentables

#### **Escenarios Avanzados**
- Arquitecturas de múltiples servicios
- Configuraciones de red complejas
- Patrones de integración de bases de datos
- Implementaciones de seguridad y cumplimiento

#### **Patrones Listos para Producción**
- Configuraciones de alta disponibilidad
- Monitoreo y observabilidad
- Integración CI/CD
- Planes de recuperación ante desastres

## 📖 Descripciones de Ejemplos

### Simple Web App - Node.js Express
**Tecnologías**: Node.js, Express, MongoDB, Container Apps  
**Complejidad**: Principiante  
**Conceptos**: Despliegue básico, API REST, integración con base de datos NoSQL

### Static Website - React SPA
**Tecnologías**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complejidad**: Principiante  
**Conceptos**: Hosting estático, backend serverless, desarrollo web moderno

### Container App - Python Flask
**Tecnologías**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complejidad**: Principiante  
**Conceptos**: Contenerización, API REST, scale-to-zero, probes de salud, monitoreo  
**Ubicación**: [Ejemplo Local](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Tecnologías**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complejidad**: Avanzado  
**Conceptos**: Arquitectura de múltiples servicios, comunicación entre servicios, encolado de mensajes, tracing distribuido  
**Ubicación**: [Ejemplo Local](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Tecnologías**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complejidad**: Intermedio  
**Conceptos**: Entity Framework, conexiones a bases de datos, desarrollo de web API

### Serverless Function - Python Azure Functions
**Tecnologías**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complejidad**: Intermedio  
**Conceptos**: Arquitectura orientada a eventos, computación serverless, desarrollo full-stack

### Microservices - Java Spring Boot
**Tecnologías**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complejidad**: Intermedio  
**Conceptos**: Comunicación entre microservicios, sistemas distribuidos, patrones empresariales

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Tecnologías**: Microsoft Foundry Models, Azure AI Search, App Service  
**Complejidad**: Intermedio  
**Conceptos**: Arquitectura RAG, búsqueda vectorial, integración de LLM

#### AI Document Processing
**Tecnologías**: Azure AI Document Intelligence, Storage, Functions  
**Complejidad**: Intermedio  
**Conceptos**: Análisis de documentos, OCR, extracción de datos

#### Machine Learning Pipeline
**Tecnologías**: Azure ML, MLOps, Container Registry  
**Complejidad**: Avanzado  
**Conceptos**: Entrenamiento de modelos, pipelines de despliegue, monitoreo

## 🛠 Ejemplos de Configuración

El directorio `configurations/` contiene componentes reutilizables:

### Configuraciones de Entorno
- Ajustes para entorno de desarrollo
- Configuraciones para entorno de staging
- Configuraciones listas para producción
- Configuraciones de despliegue multirregión

### Módulos Bicep
- Componentes de infraestructura reutilizables
- Patrones comunes de recursos
- Plantillas con endurecimiento de seguridad
- Configuraciones optimizadas para costos

### Scripts Auxiliares
- Automatización de configuración de entorno
- Scripts de migración de bases de datos
- Herramientas de validación de despliegue
- Utilidades de monitoreo de costos

## 🔧 Guía de Personalización

### Adaptar Ejemplos para Su Caso de Uso

1. **Revisar Requisitos Previos**
   - Verificar requisitos de servicios de Azure
   - Comprobar límites de suscripción
   - Entender las implicaciones de costos

2. **Modificar Configuración**
   - Actualizar definiciones de servicio en `azure.yaml`
   - Personalizar plantillas Bicep
   - Ajustar variables de entorno

3. **Probar Exhaustivamente**
   - Desplegar primero en entorno de desarrollo
   - Validar funcionalidad
   - Probar escalado y rendimiento

4. **Revisión de Seguridad**
   - Revisar controles de acceso
   - Implementar gestión de secretos
   - Habilitar monitoreo y alertas

## 📊 Matriz Comparativa

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Ruta de Aprendizaje

### Progresión Recomendada

1. **Comenzar con la Simple Web App**
   - Aprender conceptos básicos de AZD
   - Entender el flujo de despliegue
   - Practicar la gestión de entornos

2. **Probar el Sitio Estático**
   - Explorar diferentes opciones de hosting
   - Aprender sobre integración CDN
   - Entender la configuración DNS

3. **Pasar a Container App**
   - Aprender conceptos básicos de contenerización
   - Entender conceptos de escalado
   - Practicar con Docker

4. **Agregar Integración de Bases de Datos**
   - Aprender aprovisionamiento de bases de datos
   - Entender cadenas de conexión
   - Practicar gestión de secretos

5. **Explorar Serverless**
   - Entender arquitectura orientada a eventos
   - Aprender sobre triggers y bindings
   - Practicar con APIs

6. **Construir Microservicios**
   - Aprender comunicación entre servicios
   - Entender sistemas distribuidos
   - Practicar despliegues complejos

## 🔍 Encontrar el Ejemplo Adecuado

### Por Stack Tecnológico
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Por Patrón de Arquitectura
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolítico**: Node.js Express Todo, C# Web API + SQL
- **Estático + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservicios**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Contenerizado**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **Impulsado por IA**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Arquitectura Multi-Agente**: **Retail Multi-Agent Solution**
- **Empresa Multi-Servicio**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Por Nivel de Complejidad
- **Principiante**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermedio**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Avanzado**: ML Pipeline
- **Listo para Producción Empresarial**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (Sistema multiagente completo con despliegue mediante plantilla ARM)

## 📚 Recursos Adicionales

### Enlaces de Documentación
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Ejemplos de la Comunidad
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplicación web React con API en C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Trabajo de Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Funciones de Azure con Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Mejores prácticas
- [Marco Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Marco de adopción en la nube](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuir con ejemplos

¿Tienes un ejemplo útil para compartir? ¡Damos la bienvenida a las contribuciones!

### Pautas de envío
1. Sigue la estructura de directorios establecida
2. Incluye un README.md completo
3. Agrega comentarios a los archivos de configuración
4. Prueba a fondo antes de enviar
5. Incluye estimaciones de costos y requisitos previos

### Estructura de plantilla de ejemplo
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Consejo profesional**: Comienza con el ejemplo más sencillo que coincida con tu pila tecnológica, luego avanza gradualmente hacia escenarios más complejos. Cada ejemplo se basa en conceptos de los anteriores!

## 🚀 ¿Listo para comenzar?

### Tu ruta de aprendizaje

1. **¿Principiante absoluto?** → Comienza con [API de Flask](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **¿Tienes conocimientos básicos de AZD?** → Prueba [Microservicios](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **¿Construyendo aplicaciones de IA?** → Comienza con [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) o explora [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ horas)
4. **¿Necesitas una pila tecnológica específica?** → Usa la sección [Encontrar el ejemplo adecuado](#-finding-the-right-example) arriba

### Siguientes pasos

- ✅ Revisa los [Requisitos previos](#requisitos-previos) más arriba
- ✅ Elige un ejemplo que coincida con tu nivel de habilidad (ver la [Leyenda de complejidad](#leyenda-de-clasificación-de-complejidad))
- ✅ Lee detenidamente el README del ejemplo antes de desplegar
- ✅ Ponte un recordatorio para ejecutar `azd down` después de las pruebas
- ✅ Comparte tu experiencia mediante GitHub Issues o Discussions

### ¿Necesitas ayuda?

- 📖 [FAQ](../resources/faq.md) - Preguntas comunes respondidas
- 🐛 [Guía de resolución de problemas](../docs/chapter-07-troubleshooting/common-issues.md) - Soluciona problemas de despliegue
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Pregunta a la comunidad
- 📚 [Guía de estudio](../resources/study-guide.md) - Refuerza tu aprendizaje

---

**Navegación**
- **📚 Inicio del curso**: [AZD para principiantes](../README.md)
- **📖 Materiales de estudio**: [Guía de estudio](../resources/study-guide.md) | [Hoja de referencia rápida](../resources/cheat-sheet.md) | [Glosario](../resources/glossary.md)
- **🔧 Recursos**: [FAQ](../resources/faq.md) | [Resolución de problemas](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Última actualización: noviembre 2025 | [Reportar problemas](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuir con ejemplos](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Ejemplos - Plantillas y Configuraciones Prácticas de AZD

**Aprender por Ejemplo - Organizado por Capítulo**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../README.md)
- **📖 Mapeo por Capítulos**: Ejemplos organizados por complejidad de aprendizaje
- **🚀 Ejemplo Local**: [Solución Minorista Multi-Agente](retail-scenario.md)
- **🤖 Ejemplos Externos de IA**: Enlaces a repositorios de Azure Samples

> **📍 IMPORTANTE: Ejemplos Locales vs Externos**  
> Este repositorio contiene **4 ejemplos locales completos** con implementaciones completas:  
> - **Azure OpenAI Chat** (implementación de GPT-4 con interfaz de chat)  
> - **Container Apps** (API Flask simple + Microservicios)  
> - **Aplicación con Base de Datos** (Web + Base de Datos SQL)  
> - **Retail Multi-Agent** (Solución de IA empresarial)  
>  
> Ejemplos adicionales son **referencias externas** a repositorios de Azure-Samples que puedes clonar.

## Introducción

Este directorio proporciona ejemplos prácticos y referencias para ayudarte a aprender Azure Developer CLI mediante práctica práctica. El escenario Retail Multi-Agent es una implementación completa y lista para producción incluida en este repositorio. Ejemplos adicionales hacen referencia a Azure Samples oficiales que demuestran varios patrones de AZD.

### Leyenda de Clasificación de Complejidad

- ⭐ **Principiante** - Conceptos básicos, servicio único, 15-30 minutos
- ⭐⭐ **Intermedio** - Múltiples servicios, integración de base de datos, 30-60 minutos
- ⭐⭐⭐ **Avanzado** - Arquitectura compleja, integración de IA, 1-2 horas
- ⭐⭐⭐⭐ **Experto** - Listo para producción, patrones empresariales, 2+ horas

## 🎯 Qué Hay Realmente en Este Repositorio

### ✅ Implementación Local (Lista para Usar)

#### [Aplicación de Chat Azure OpenAI](azure-openai-chat/README.md) 🆕
**Implementación completa de GPT-4 con interfaz de chat incluida en este repo**

- **Ubicación:** `examples/azure-openai-chat/`
- **Complejidad:** ⭐⭐ (Intermedio)
- **Incluye:**
  - Implementación completa de Azure OpenAI (GPT-4)
  - Interfaz de chat de línea de comandos en Python
  - Integración con Key Vault para claves de API seguras
  - Plantillas de infraestructura en Bicep
  - Uso de tokens y seguimiento de costos
  - Limitación de tasa y manejo de errores

**Inicio Rápido:**
```bash
# Navegar al ejemplo
cd examples/azure-openai-chat

# Desplegar todo
azd up

# Instalar dependencias y comenzar a chatear
pip install -r src/requirements.txt
python src/chat.py
```

**Tecnologías:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Ejemplos de Container App](container-app/README.md) 🆕
**Ejemplos integrales de despliegue de contenedores incluidos en este repo**

- **Ubicación:** `examples/container-app/`
- **Complejidad:** ⭐-⭐⭐⭐⭐ (Principiante a Avanzado)
- **Incluye:**
  - [Guía Maestra](container-app/README.md) - Visión completa de despliegues de contenedores
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Ejemplo básico de API REST
  - [Arquitectura de Microservicios](../../../examples/container-app/microservices) - Despliegue multi-servicio listo para producción
  - Patrones de Inicio Rápido, Producción y Avanzados
  - Monitoreo, seguridad y optimización de costos

**Inicio Rápido:**
```bash
# Ver la guía maestra
cd examples/container-app

# Desplegar una API simple de Flask
cd simple-flask-api
azd up

# Desplegar un ejemplo de microservicios
cd ../microservices
azd up
```

**Tecnologías:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Solución Minorista Multi-Agente](retail-scenario.md) 🆕
**Implementación completa lista para producción incluida en este repo**

- **Ubicación:** `examples/retail-multiagent-arm-template/`
- **Complejidad:** ⭐⭐⭐⭐ (Avanzado)
- **Incluye:**
  - Plantilla de despliegue ARM completa
  - Arquitectura multi-agente (Cliente + Inventario)
  - Integración con Azure OpenAI
  - Búsqueda AI con RAG
  - Monitoreo integral
  - Script de despliegue con un solo clic

**Inicio Rápido:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tecnologías:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Ejemplos Externos de Azure Samples (Clonar para Usar)

Los siguientes ejemplos se mantienen en repositorios oficiales de Azure-Samples. Clónalos para explorar diferentes patrones de AZD:

### Aplicaciones Simples (Capítulos 1-2)

| Plantilla | Repositorio | Complejidad | Servicios |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservicios** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-servicio, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Cómo usar:**
```bash
# Clonar cualquier ejemplo
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Desplegar
azd up
```

### Ejemplos de Aplicaciones de IA (Capítulos 2, 5, 8)

| Plantilla | Repositorio | Complejidad | Enfoque |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Implementación GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat de IA básico |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework de agentes |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Patrón RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | IA empresarial |

### Base de Datos y Patrones Avanzados (Capítulos 3-8)

| Plantilla | Repositorio | Complejidad | Enfoque |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integración de base de datos |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Microservicios Java** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-servicio |
| **Pipeline de ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Objetivos de Aprendizaje

Al trabajar con estos ejemplos, podrás:
- Practicar flujos de trabajo de Azure Developer CLI con escenarios de aplicaciones realistas
- Comprender diferentes arquitecturas de aplicaciones y sus implementaciones con azd
- Dominar patrones de Infrastructure as Code para varios servicios de Azure
- Aplicar gestión de configuración y estrategias de despliegue específicas por entorno
- Implementar patrones de monitoreo, seguridad y escalado en contextos prácticos
- Adquirir experiencia en resolución de problemas y depuración de escenarios de despliegue reales

## Resultados de Aprendizaje

Al completar estos ejemplos, serás capaz de:
- Desplegar varios tipos de aplicaciones usando Azure Developer CLI con confianza
- Adaptar las plantillas proporcionadas a los requisitos de tu propia aplicación
- Diseñar e implementar patrones de infraestructura personalizados usando Bicep
- Configurar aplicaciones complejas multi-servicio con dependencias adecuadas
- Aplicar prácticas recomendadas de seguridad, monitoreo y rendimiento en escenarios reales
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
   **Aprenderás:** Flujo de trabajo básico de azd, conteinerización, probes de salud  
   **Resultado Esperado:** Endpoint de API funcional que devuelve "Hello, World!" con monitoreo

2. **[Aplicación Web Simple - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Despliega una aplicación web Node.js Express con MongoDB  
   **Tiempo:** 25-35 minutos | **Costo:** $10-30/mes  
   **Aprenderás:** Integración de base de datos, variables de entorno, cadenas de conexión  
   **Resultado Esperado:** Aplicación de lista de tareas con funcionalidad de crear/leer/actualizar/eliminar

3. **[Sitio Estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Aloja un sitio estático React con Azure Static Web Apps  
   **Tiempo:** 20-30 minutos | **Costo:** $0-10/mes  
   **Aprenderás:** Alojamiento estático, funciones serverless, despliegue en CDN  
   **Resultado Esperado:** Interfaz React con backend API, SSL automático, CDN global

### Para Usuarios Intermedios
4. **[Aplicación de Chat Azure OpenAI](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Despliega GPT-4 con interfaz de chat y gestión segura de claves de API  
   **Tiempo:** 35-45 minutos | **Costo:** $50-200/mes  
   **Aprenderás:** Despliegue de Azure OpenAI, integración con Key Vault, seguimiento de tokens  
   **Resultado Esperado:** Aplicación de chat funcional con GPT-4 y monitoreo de costos

5. **[Container App - Microservicios](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Arquitectura multi-servicio lista para producción  
   **Tiempo:** 45-60 minutos | **Costo:** $50-150/mes  
   **Aprenderás:** Comunicación entre servicios, encolamiento de mensajes, trazado distribuido  
   **Resultado Esperado:** Sistema de 2 servicios (API Gateway + Servicio de Productos) con monitoreo

6. **[Aplicación con Base de Datos - C# con Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplicación web con API en C# y Azure SQL Database  
   **Tiempo:** 30-45 minutos | **Costo:** $20-80/mes  
   **Aprenderás:** Entity Framework, migraciones de base de datos, seguridad de conexión  
   **Resultado Esperado:** API en C# con backend en Azure SQL, despliegue automático de esquema

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Azure Functions en Python con triggers HTTP y Cosmos DB  
   **Tiempo:** 30-40 minutos | **Costo:** $10-40/mes  
   **Aprenderás:** Arquitectura orientada a eventos, escalado serverless, integración NoSQL  
   **Resultado Esperado:** Aplicación Function que responde a solicitudes HTTP con almacenamiento en Cosmos DB

8. **[Microservicios - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplicación Java multi-servicio con Container Apps y gateway API  
   **Tiempo:** 60-90 minutos | **Costo:** $80-200/mes  
   **Aprenderás:** Despliegue de Spring Boot, malla de servicios, balanceo de carga  
   **Resultado Esperado:** Sistema Java multi-servicio con descubrimiento de servicios y enrutamiento

### Plantillas Microsoft Foundry

1. **[Aplicación de Chat Azure OpenAI - Ejemplo Local](../../../examples/azure-openai-chat)** ⭐⭐  
   Implementación completa de GPT-4 con interfaz de chat  
   **Tiempo:** 35-45 minutos | **Costo:** $50-200/mes  
   **Resultado Esperado:** Aplicación de chat funcional con seguimiento de tokens y monitoreo de costos

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplicación de chat inteligente con arquitectura RAG  
   **Tiempo:** 60-90 minutos | **Costo:** $100-300/mes  
   **Resultado Esperado:** Interfaz de chat potenciada por RAG con búsqueda de documentos y citas

3. **[Procesamiento de Documentos con IA](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Análisis de documentos usando servicios de Azure AI  
   **Tiempo:** 40-60 minutos | **Costo:** $20-80/mes  
   **Resultado Esperado:** API que extrae texto, tablas y entidades de documentos subidos

4. **[Pipeline de Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Flujo de trabajo MLOps con Azure Machine Learning  
   **Tiempo:** 2-3 horas | **Costo:** $150-500/mes  
   **Resultado Esperado:** Pipeline de ML automatizado con entrenamiento, despliegue y monitoreo

### Escenarios del Mundo Real

#### **Solución Minorista Multi-Agente** 🆕
**[Guía de Implementación Completa](./retail-scenario.md)**

Una solución integral, lista para producción, de atención al cliente multi-agente que demuestra el despliegue de aplicaciones de IA de nivel empresarial con AZD. Este escenario proporciona:

- **Arquitectura Completa**: Sistema multi-agente con agentes especializados en servicio al cliente y gestión de inventario
- **Production Infrastructure**: Implementaciones multi-región de Azure OpenAI, Azure AI Search, Container Apps y monitorización completa
- **Ready-to-Deploy ARM Template**: Implementación con un clic con múltiples modos de configuración (Minimal/Standard/Premium)
- **Advanced Features**: Validación de seguridad red teaming, marco de evaluación de agentes, optimización de costos y guías de solución de problemas
- **Real Business Context**: Caso de uso de soporte al cliente para minoristas con cargas de archivos, integración de búsqueda y escalado dinámico

**Technologies**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Avanzado - Listo para Producción Empresarial)

**Perfect for**: Desarrolladores de IA, arquitectos de soluciones y equipos que construyen sistemas multi-agente en producción

**Quick Start**: Despliega la solución completa en menos de 30 minutos usando la plantilla ARM incluida con `./deploy.sh -g myResourceGroup`

## 📋 Instrucciones de uso

### Prerrequisitos

Antes de ejecutar cualquier ejemplo:
- ✅ Suscripción de Azure con acceso de Owner o Contributor
- ✅ Azure Developer CLI instalado ([Guía de instalación](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop ejecutándose (para ejemplos con contenedores)
- ✅ Cuotas de Azure apropiadas (ver requisitos específicos del ejemplo)

> **💰 Advertencia de costos:** Todos los ejemplos crean recursos reales en Azure que generan cargos. Consulta los README individuales para estimaciones de costos. Recuerda ejecutar `azd down` cuando termines para evitar costos continuos.

### Ejecutar ejemplos localmente

1. **Clonar o copiar el ejemplo**
   ```bash
   # Navegar al ejemplo deseado
   cd examples/simple-web-app
   ```

2. **Inicializar el entorno AZD**
   ```bash
   # Inicializar con plantilla existente
   azd init
   
   # O crear un nuevo entorno
   azd env new my-environment
   ```

3. **Configurar el entorno**
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

5. **Verificar el despliegue**
   ```bash
   # Obtener puntos finales del servicio
   azd env get-values
   
   # Probar el punto final (ejemplo)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Indicadores de éxito esperados:**
   - ✅ `azd up` se completa sin errores
   - ✅ El endpoint del servicio devuelve HTTP 200
   - ✅ El Portal de Azure muestra estado "Running"
   - ✅ Application Insights recibiendo telemetría

> **⚠️ ¿Problemas?** Consulta [Problemas comunes](../docs/chapter-07-troubleshooting/common-issues.md) para la solución de problemas de despliegue

### Adaptar los ejemplos

Cada ejemplo incluye:
- **README.md** - Instrucciones detalladas de configuración y personalización
- **azure.yaml** - Configuración AZD con comentarios
- **infra/** - Plantillas Bicep con explicación de parámetros
- **src/** - Código de la aplicación de ejemplo
- **scripts/** - Scripts auxiliares para tareas comunes

## 🎯 Objetivos de aprendizaje

### Categorías de ejemplos

#### **Despliegues básicos**
- Aplicaciones de servicio único
- Patrones de infraestructura simples
- Gestión de configuración básica
- Entornos de desarrollo económicos

#### **Escenarios avanzados**
- Arquitecturas multi-servicio
- Configuraciones de red complejas
- Patrones de integración de bases de datos
- Implementaciones de seguridad y cumplimiento

#### **Patrones listos para producción**
- Configuraciones de alta disponibilidad
- Monitorización y observabilidad
- Integración CI/CD
- Planes de recuperación ante desastres

## 📖 Descripciones de ejemplos

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Principiante  
**Concepts**: Despliegue básico, API REST, integración con base de datos NoSQL

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Principiante  
**Concepts**: Hosting estático, backend serverless, desarrollo web moderno

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Principiante  
**Concepts**: Contenerización, API REST, scale-to-zero, health probes, monitorización  
**Location**: [Ejemplo local](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Avanzado  
**Concepts**: Arquitectura multi-servicio, comunicación entre servicios, encolado de mensajes, trazado distribuido  
**Location**: [Ejemplo local](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Intermedio  
**Concepts**: Entity Framework, conexiones a bases de datos, desarrollo de API web

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Intermedio  
**Concepts**: Arquitectura orientada a eventos, computación serverless, desarrollo full-stack

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Intermedio  
**Concepts**: Comunicación entre microservicios, sistemas distribuidos, patrones empresariales

### Microsoft Foundry Examples

#### Azure OpenAI Chat App
**Technologies**: Azure OpenAI, Cognitive Search, App Service  
**Complexity**: Intermedio  
**Concepts**: Arquitectura RAG, búsqueda vectorial, integración de LLM

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Intermedio  
**Concepts**: Análisis de documentos, OCR, extracción de datos

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Avanzado  
**Concepts**: Entrenamiento de modelos, pipelines de despliegue, monitorización

## 🛠 Ejemplos de configuración

El directorio `configurations/` contiene componentes reutilizables:

### Configuraciones de entorno
- Configuraciones para entorno de desarrollo
- Configuraciones para entorno de staging
- Configuraciones listas para producción
- Configuraciones de despliegue multi-región

### Módulos Bicep
- Componentes de infraestructura reutilizables
- Patrones comunes de recursos
- Plantillas con endurecimiento de seguridad
- Configuraciones optimizadas para costos

### Scripts auxiliares
- Automatización de configuración de entorno
- Scripts de migración de base de datos
- Herramientas de validación de despliegue
- Utilidades de monitorización de costos

## 🔧 Guía de personalización

### Adaptar los ejemplos a tu caso de uso

1. **Revisar prerrequisitos**
   - Verificar requisitos de servicios de Azure
   - Comprobar límites de suscripción
   - Entender implicaciones de costos

2. **Modificar la configuración**
   - Actualizar definiciones de servicios en `azure.yaml`
   - Personalizar plantillas Bicep
   - Ajustar variables de entorno

3. **Probar exhaustivamente**
   - Desplegar primero en entorno de desarrollo
   - Validar funcionalidad
   - Probar escalado y rendimiento

4. **Revisión de seguridad**
   - Revisar controles de acceso
   - Implementar gestión de secretos
   - Habilitar monitorización y alertas

## 📊 Matriz comparativa

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Local) | 2 | ❌ | Key Vault | Completo | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Básico | Completo | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Empresarial | Avanzado | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Básico | Básico | ⭐ |
| React SPA + Functions | 3 | ✅ | Básico | Completo | ⭐ |
| Python Flask Container | 2 | ❌ | Básico | Completo | ⭐ |
| C# Web API + SQL | 2 | ✅ | Completo | Completo | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Completo | Completo | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Completo | Completo | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Completo | Completo | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Básico | Completo | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Completo | Completo | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Empresarial** | **Avanzado** | **⭐⭐⭐⭐** |

## 🎓 Ruta de aprendizaje

### Progresión recomendada

1. **Comienza con la Simple Web App**
   - Aprender conceptos básicos de AZD
   - Entender el flujo de despliegue
   - Practicar gestión de entornos

2. **Prueba el sitio estático**
   - Explorar diferentes opciones de hosting
   - Aprender sobre integración con CDN
   - Entender la configuración DNS

3. **Avanza al Container App**
   - Aprender conceptos básicos de contenerización
   - Entender conceptos de escalado
   - Practicar con Docker

4. **Añade integración de base de datos**
   - Aprender aprovisionamiento de bases de datos
   - Entender cadenas de conexión
   - Practicar gestión de secretos

5. **Explora Serverless**
   - Entender arquitectura orientada a eventos
   - Aprender sobre triggers y bindings
   - Practicar con APIs

6. **Construye microservicios**
   - Aprender comunicación entre servicios
   - Entender sistemas distribuidos
   - Practicar despliegues complejos

## 🔍 Encontrar el ejemplo adecuado

### Por stack tecnológico
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Bases de datos**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Sistemas Multi-Agente**: **Retail Multi-Agent Solution**
- **Integración OpenAI**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Producción empresarial**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Por patrón de arquitectura
- **API REST simple**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolítico**: Node.js Express Todo, C# Web API + SQL
- **Estático + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservicios**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Contenerizado**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **Potenciado por IA**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Arquitectura multi-agente**: **Retail Multi-Agent Solution**
- **Servicios empresariales multi-servicio**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Por nivel de complejidad
- **Principiante**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermedio**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Avanzado**: ML Pipeline
- **Listo para producción empresarial**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-servicio con encolado de mensajes), **Retail Multi-Agent Solution** (Sistema multi-agente completo con despliegue mediante plantilla ARM)

## 📚 Recursos adicionales

### Enlaces de documentación
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Ejemplos de la comunidad
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplicación Todo con Node.js y PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplicación Web React con API en C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Trabajo de Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Funciones de Azure con Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Buenas prácticas
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuir con ejemplos

¿Tienes un ejemplo útil para compartir? ¡Aceptamos contribuciones!

### Directrices de envío
1. Sigue la estructura de directorios establecida
2. Incluye un README.md completo
3. Agrega comentarios a los archivos de configuración
4. Prueba exhaustivamente antes de enviar
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

**Consejo profesional**: Comienza con el ejemplo más simple que se ajuste a tu stack tecnológico, luego avanza gradualmente hacia escenarios más complejos. ¡Cada ejemplo se basa en conceptos de los anteriores!

## 🚀 ¿Listo para comenzar?

### Tu ruta de aprendizaje

1. **¿Principiante completo?** → Comienza con [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **¿Tienes conocimientos básicos de AZD?** → Prueba [Microservicios](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **¿Construyendo aplicaciones de IA?** → Comienza con [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) o explora [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ horas)
4. **¿Necesitas una pila tecnológica específica?** → Usa la sección [Encontrar el ejemplo adecuado](../../../examples) arriba

### Próximos pasos

- ✅ Revisa [Requisitos previos](../../../examples) arriba
- ✅ Elige un ejemplo que coincida con tu nivel de habilidad (ver [Leyenda de complejidad](../../../examples))
- ✅ Lee el README del ejemplo detenidamente antes de desplegar
- ✅ Programa un recordatorio para ejecutar `azd down` después de las pruebas
- ✅ Comparte tu experiencia mediante Issues o Discussions de GitHub

### ¿Necesitas ayuda?

- 📖 [FAQ](../resources/faq.md) - Preguntas frecuentes respondidas
- 🐛 [Guía de solución de problemas](../docs/chapter-07-troubleshooting/common-issues.md) - Soluciona problemas de despliegue
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Pregunta a la comunidad
- 📚 [Guía de estudio](../resources/study-guide.md) - Refuerza tu aprendizaje

---

**Navegación**
- **📚 Inicio del curso**: [AZD For Beginners](../README.md)
- **📖 Materiales de estudio**: [Guía de estudio](../resources/study-guide.md) | [Hoja de referencia](../resources/cheat-sheet.md) | [Glosario](../resources/glossary.md)
- **🔧 Recursos**: [FAQ](../resources/faq.md) | [Solución de problemas](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Última actualización: noviembre de 2025 | [Informar problemas](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuir con ejemplos](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Descargo de responsabilidad:
Este documento ha sido traducido mediante el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por personas. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan derivarse del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
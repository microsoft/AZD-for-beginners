<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a896781acb2a7bebb3c4c66c4f46e7f",
  "translation_date": "2025-11-19T20:20:05+00:00",
  "source_file": "examples/README.md",
  "language_code": "es"
}
-->
# Ejemplos - Plantillas y Configuraciones Prácticas de AZD

**Aprender con Ejemplos - Organizados por Capítulo**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../README.md)
- **📖 Mapeo de Capítulos**: Ejemplos organizados por complejidad de aprendizaje
- **🚀 Ejemplo Local**: [Solución Minorista Multi-Agente](retail-scenario.md)
- **🤖 Ejemplos de IA Externos**: Enlaces a repositorios de Azure Samples

> **📍 IMPORTANTE: Ejemplos Locales vs Externos**  
> Este repositorio contiene **4 ejemplos locales completos** con implementaciones completas:  
> - **Azure OpenAI Chat** (Despliegue de GPT-4 con interfaz de chat)  
> - **Container Apps** (API Flask simple + Microservicios)  
> - **Aplicación de Base de Datos** (Web + Base de Datos SQL)  
> - **Multi-Agente Minorista** (Solución de IA Empresarial)  
>  
> Ejemplos adicionales son **referencias externas** a repositorios de Azure-Samples que puedes clonar.

## Introducción

Este directorio proporciona ejemplos prácticos y referencias para ayudarte a aprender Azure Developer CLI mediante práctica directa. El escenario Multi-Agente Minorista es una implementación completa y lista para producción incluida en este repositorio. Ejemplos adicionales hacen referencia a Azure Samples oficiales que demuestran varios patrones de AZD.

### Leyenda de Complejidad

- ⭐ **Principiante** - Conceptos básicos, servicio único, 15-30 minutos
- ⭐⭐ **Intermedio** - Múltiples servicios, integración de base de datos, 30-60 minutos
- ⭐⭐⭐ **Avanzado** - Arquitectura compleja, integración de IA, 1-2 horas
- ⭐⭐⭐⭐ **Experto** - Listo para producción, patrones empresariales, 2+ horas

## 🎯 ¿Qué hay realmente en este repositorio?

### ✅ Implementación Local (Lista para Usar)

#### [Aplicación de Chat Azure OpenAI](azure-openai-chat/README.md) 🆕
**Despliegue completo de GPT-4 con interfaz de chat incluido en este repositorio**

- **Ubicación:** `examples/azure-openai-chat/`
- **Complejidad:** ⭐⭐ (Intermedio)
- **Qué incluye:**
  - Despliegue completo de Azure OpenAI (GPT-4)
  - Interfaz de chat en línea de comandos en Python
  - Integración con Key Vault para claves API seguras
  - Plantillas de infraestructura Bicep
  - Seguimiento de uso de tokens y costos
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

#### [Ejemplos de Aplicaciones en Contenedores](container-app/README.md) 🆕
**Ejemplos completos de despliegue de contenedores incluidos en este repositorio**

- **Ubicación:** `examples/container-app/`
- **Complejidad:** ⭐-⭐⭐⭐⭐ (Principiante a Avanzado)
- **Qué incluye:**
  - [Guía Maestra](container-app/README.md) - Resumen completo de despliegues de contenedores
  - [API Flask Simple](../../../examples/container-app/simple-flask-api) - Ejemplo básico de API REST
  - [Arquitectura de Microservicios](../../../examples/container-app/microservices) - Despliegue multi-servicio listo para producción
  - Patrones de Inicio Rápido, Producción y Avanzados
  - Monitoreo, seguridad y optimización de costos

**Inicio Rápido:**
```bash
# Ver guía maestra
cd examples/container-app

# Implementar API Flask simple
cd simple-flask-api
azd up

# Implementar ejemplo de microservicios
cd ../microservices
azd up
```

**Tecnologías:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Solución Multi-Agente Minorista](retail-scenario.md) 🆕
**Implementación completa lista para producción incluida en este repositorio**

- **Ubicación:** `examples/retail-multiagent-arm-template/`
- **Complejidad:** ⭐⭐⭐⭐ (Avanzado)
- **Qué incluye:**
  - Plantilla completa de despliegue ARM
  - Arquitectura multi-agente (Cliente + Inventario)
  - Integración con Azure OpenAI
  - Búsqueda con IA utilizando RAG
  - Monitoreo completo
  - Script de despliegue con un solo clic

**Inicio Rápido:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tecnologías:** Azure OpenAI, Búsqueda con IA, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Ejemplos Externos de Azure Samples (Clonar para Usar)

Los siguientes ejemplos se mantienen en repositorios oficiales de Azure-Samples. Clónalos para explorar diferentes patrones de AZD:

### Aplicaciones Simples (Capítulos 1-2)

| Plantilla | Repositorio | Complejidad | Servicios |
|:---------|:-----------|:-----------|:---------|
| **API Flask en Python** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservicios** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-servicio, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Contenedor Flask en Python** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Cómo usar:**
```bash
# Clona cualquier ejemplo
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Desplegar
azd up
```

### Ejemplos de Aplicaciones de IA (Capítulos 2, 5, 8)

| Plantilla | Repositorio | Complejidad | Enfoque |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Despliegue de GPT-4 |
| **Inicio Rápido de Chat IA** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat IA básico |
| **Agentes de IA** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Marco de agentes |
| **Demo de Búsqueda + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Patrón RAG |
| **Chat Contoso** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | IA Empresarial |

### Base de Datos y Patrones Avanzados (Capítulos 3-8)

| Plantilla | Repositorio | Complejidad | Enfoque |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integración de base de datos |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL sin servidor |
| **Microservicios en Java** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-servicio |
| **Pipeline de ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Objetivos de Aprendizaje

Al trabajar con estos ejemplos, aprenderás:
- Practicar flujos de trabajo de Azure Developer CLI con escenarios de aplicaciones realistas
- Comprender diferentes arquitecturas de aplicaciones y sus implementaciones en azd
- Dominar patrones de Infraestructura como Código para varios servicios de Azure
- Aplicar gestión de configuración y estrategias de despliegue específicas por entorno
- Implementar patrones de monitoreo, seguridad y escalabilidad en contextos prácticos
- Adquirir experiencia en resolución de problemas y depuración de escenarios de despliegue reales

## Resultados de Aprendizaje

Al completar estos ejemplos, serás capaz de:
- Desplegar varios tipos de aplicaciones utilizando Azure Developer CLI con confianza
- Adaptar las plantillas proporcionadas a tus propios requisitos de aplicación
- Diseñar e implementar patrones de infraestructura personalizados utilizando Bicep
- Configurar aplicaciones complejas multi-servicio con dependencias adecuadas
- Aplicar mejores prácticas de seguridad, monitoreo y rendimiento en escenarios reales
- Resolver problemas y optimizar despliegues basados en experiencia práctica

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

> **💡 ¿Nuevo en AZD?** Comienza con el ejemplo #1 (API Flask) - toma ~20 minutos y enseña conceptos básicos.

### Para Principiantes
1. **[Aplicación en Contenedor - API Flask en Python](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Despliega una API REST simple con escala a cero  
   **Tiempo:** 20-25 minutos | **Costo:** $0-5/mes  
   **Aprenderás:** Flujo de trabajo básico de azd, contenedorización, sondas de salud  
   **Resultado Esperado:** Endpoint de API funcional que devuelve "Hello, World!" con monitoreo

2. **[Aplicación Web Simple - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Despliega una aplicación web Node.js Express con MongoDB  
   **Tiempo:** 25-35 minutos | **Costo:** $10-30/mes  
   **Aprenderás:** Integración de base de datos, variables de entorno, cadenas de conexión  
   **Resultado Esperado:** Aplicación de lista de tareas con funcionalidad de crear/leer/actualizar/eliminar

3. **[Sitio Web Estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Aloja un sitio web estático React con Azure Static Web Apps  
   **Tiempo:** 20-30 minutos | **Costo:** $0-10/mes  
   **Aprenderás:** Hosting estático, funciones sin servidor, despliegue CDN  
   **Resultado Esperado:** Interfaz React con backend API, SSL automático, CDN global

### Para Usuarios Intermedios
4. **[Aplicación de Chat Azure OpenAI](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Despliega GPT-4 con interfaz de chat y gestión segura de claves API  
   **Tiempo:** 35-45 minutos | **Costo:** $50-200/mes  
   **Aprenderás:** Despliegue de Azure OpenAI, integración con Key Vault, seguimiento de tokens  
   **Resultado Esperado:** Aplicación de chat funcional con GPT-4 y monitoreo de costos

5. **[Aplicación en Contenedor - Microservicios](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Arquitectura multi-servicio lista para producción  
   **Tiempo:** 45-60 minutos | **Costo:** $50-150/mes  
   **Aprenderás:** Comunicación entre servicios, colas de mensajes, trazabilidad distribuida  
   **Resultado Esperado:** Sistema de 2 servicios (API Gateway + Servicio de Productos) con monitoreo

6. **[Aplicación de Base de Datos - C# con Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplicación web con API en C# y Base de Datos Azure SQL  
   **Tiempo:** 30-45 minutos | **Costo:** $20-80/mes  
   **Aprenderás:** Entity Framework, migraciones de base de datos, seguridad de conexión  
   **Resultado Esperado:** API en C# con backend Azure SQL, despliegue automático de esquema

7. **[Función Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Funciones Azure en Python con disparadores HTTP y Cosmos DB  
   **Tiempo:** 30-40 minutos | **Costo:** $10-40/mes  
   **Aprenderás:** Arquitectura basada en eventos, escalado sin servidor, integración NoSQL  
   **Resultado Esperado:** Aplicación de funciones que responde a solicitudes HTTP con almacenamiento en Cosmos DB

8. **[Microservicios - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplicación Java multi-servicio con Container Apps y API Gateway  
   **Tiempo:** 60-90 minutos | **Costo:** $80-200/mes  
   **Aprenderás:** Despliegue de Spring Boot, malla de servicios, balanceo de carga  
   **Resultado Esperado:** Sistema Java multi-servicio con descubrimiento de servicios y enrutamiento

### Plantillas de Fundición de Azure AI

1. **[Aplicación de Chat Azure OpenAI - Ejemplo Local](../../../examples/azure-openai-chat)** ⭐⭐  
   Despliegue completo de GPT-4 con interfaz de chat  
   **Tiempo:** 35-45 minutos | **Costo:** $50-200/mes  
   **Resultado Esperado:** Aplicación de chat funcional con seguimiento de tokens y monitoreo de costos

2. **[Demo de Búsqueda + OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplicación de chat inteligente con arquitectura RAG  
   **Tiempo:** 60-90 minutos | **Costo:** $100-300/mes  
   **Resultado Esperado:** Interfaz de chat impulsada por RAG con búsqueda de documentos y citas

3. **[Procesamiento de Documentos IA](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Análisis de documentos utilizando servicios de Azure AI  
   **Tiempo:** 40-60 minutos | **Costo:** $20-80/mes  
   **Resultado Esperado:** API que extrae texto, tablas y entidades de documentos cargados

4. **[Pipeline de Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Flujo de trabajo MLOps con Azure Machine Learning  
   **Tiempo:** 2-3 horas | **Costo:** $150-500/mes  
   **Resultado Esperado:** Pipeline de ML automatizado con entrenamiento, despliegue y monitoreo

### Escenarios del Mundo Real

#### **Solución Multi-Agente Minorista** 🆕
**[Guía Completa de Implementación](./retail-scenario.md)**

Una solución integral y lista para producción de soporte al cliente multi-agente que demuestra el despliegue de aplicaciones de IA de nivel empresarial con AZD. Este escenario proporciona:

- **Arquitectura Completa**: Sistema multi-agente con agentes especializados en servicio al cliente y gestión de inventario
- **Infraestructura de Producción**: Implementaciones de Azure OpenAI en múltiples regiones, Búsqueda AI, Aplicaciones en Contenedores y monitoreo integral  
- **Plantilla ARM Lista para Desplegar**: Despliegue con un clic con múltiples modos de configuración (Mínimo/Estándar/Premium)  
- **Características Avanzadas**: Validación de seguridad red teaming, marco de evaluación de agentes, optimización de costos y guías de solución de problemas  
- **Contexto Real de Negocios**: Caso de uso de soporte al cliente para minoristas con carga de archivos, integración de búsqueda y escalado dinámico  

**Tecnologías**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Aplicaciones en Contenedores, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Complejidad**: ⭐⭐⭐⭐ (Avanzado - Listo para Producción Empresarial)  

**Perfecto para**: Desarrolladores de IA, arquitectos de soluciones y equipos que construyen sistemas multiagente en producción  

**Inicio Rápido**: Despliega la solución completa en menos de 30 minutos usando la plantilla ARM incluida con `./deploy.sh -g myResourceGroup`  

## 📋 Instrucciones de Uso  

### Requisitos Previos  

Antes de ejecutar cualquier ejemplo:  
- ✅ Suscripción de Azure con acceso de Propietario o Colaborador  
- ✅ CLI de Azure Developer instalada ([Guía de Instalación](../docs/getting-started/installation.md))  
- ✅ Docker Desktop en ejecución (para ejemplos de contenedores)  
- ✅ Cuotas de Azure adecuadas (ver requisitos específicos de cada ejemplo)  

> **💰 Advertencia de Costos:** Todos los ejemplos crean recursos reales de Azure que generan cargos. Consulta los archivos README individuales para estimaciones de costos. Recuerda ejecutar `azd down` al finalizar para evitar costos continuos.  

### Ejecutar Ejemplos Localmente  

1. **Clonar o Copiar Ejemplo**  
   ```bash
   # Navegar al ejemplo deseado
   cd examples/simple-web-app
   ```
  
2. **Inicializar Entorno AZD**  
   ```bash
   # Inicializar con la plantilla existente
   azd init
   
   # O crear un nuevo entorno
   azd env new my-environment
   ```
  
3. **Configurar Entorno**  
   ```bash
   # Establecer las variables requeridas
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Desplegar**  
   ```bash
   # Desplegar infraestructura y aplicación
   azd up
   ```
  
5. **Verificar Despliegue**  
   ```bash
   # Obtener puntos finales del servicio
   azd env get-values
   
   # Probar el punto final (ejemplo)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Indicadores de Éxito Esperados:**  
   - ✅ `azd up` se completa sin errores  
   - ✅ El endpoint del servicio devuelve HTTP 200  
   - ✅ El Portal de Azure muestra el estado "En Ejecución"  
   - ✅ Application Insights recibe telemetría  

> **⚠️ ¿Problemas?** Consulta [Problemas Comunes](../docs/troubleshooting/common-issues.md) para solución de problemas de despliegue  

### Adaptar Ejemplos  

Cada ejemplo incluye:  
- **README.md** - Instrucciones detalladas de configuración y personalización  
- **azure.yaml** - Configuración de AZD con comentarios  
- **infra/** - Plantillas Bicep con explicaciones de parámetros  
- **src/** - Código de aplicación de ejemplo  
- **scripts/** - Scripts auxiliares para tareas comunes  

## 🎯 Objetivos de Aprendizaje  

### Categorías de Ejemplo  

#### **Despliegues Básicos**  
- Aplicaciones de un solo servicio  
- Patrones de infraestructura simples  
- Gestión básica de configuración  
- Configuraciones económicas para desarrollo  

#### **Escenarios Avanzados**  
- Arquitecturas de múltiples servicios  
- Configuraciones complejas de red  
- Patrones de integración de bases de datos  
- Implementaciones de seguridad y cumplimiento  

#### **Patrones Listos para Producción**  
- Configuraciones de alta disponibilidad  
- Monitoreo y observabilidad  
- Integración CI/CD  
- Configuraciones de recuperación ante desastres  

## 📖 Descripciones de Ejemplo  

### Aplicación Web Simple - Node.js Express  
**Tecnologías**: Node.js, Express, MongoDB, Aplicaciones en Contenedores  
**Complejidad**: Principiante  
**Conceptos**: Despliegue básico, API REST, integración con base de datos NoSQL  

### Sitio Web Estático - React SPA  
**Tecnologías**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complejidad**: Principiante  
**Conceptos**: Hosting estático, backend sin servidor, desarrollo web moderno  

### Aplicación en Contenedor - Python Flask  
**Tecnologías**: Python Flask, Docker, Aplicaciones en Contenedores, Registro de Contenedores, Application Insights  
**Complejidad**: Principiante  
**Conceptos**: Contenerización, API REST, escalado a cero, sondas de salud, monitoreo  
**Ubicación**: [Ejemplo Local](../../../examples/container-app/simple-flask-api)  

### Aplicación en Contenedor - Arquitectura de Microservicios  
**Tecnologías**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Aplicaciones en Contenedores  
**Complejidad**: Avanzado  
**Conceptos**: Arquitectura de múltiples servicios, comunicación entre servicios, colas de mensajes, trazabilidad distribuida  
**Ubicación**: [Ejemplo Local](../../../examples/container-app/microservices)  

### Aplicación con Base de Datos - C# con Azure SQL  
**Tecnologías**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complejidad**: Intermedio  
**Conceptos**: Entity Framework, conexiones a bases de datos, desarrollo de API web  

### Función Sin Servidor - Python Azure Functions  
**Tecnologías**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complejidad**: Intermedio  
**Conceptos**: Arquitectura basada en eventos, computación sin servidor, desarrollo full-stack  

### Microservicios - Java Spring Boot  
**Tecnologías**: Java Spring Boot, Aplicaciones en Contenedores, Service Bus, API Gateway  
**Complejidad**: Intermedio  
**Conceptos**: Comunicación entre microservicios, sistemas distribuidos, patrones empresariales  

### Ejemplos de Azure AI Foundry  

#### Aplicación de Chat con Azure OpenAI  
**Tecnologías**: Azure OpenAI, Cognitive Search, App Service  
**Complejidad**: Intermedio  
**Conceptos**: Arquitectura RAG, búsqueda vectorial, integración con LLM  

#### Procesamiento de Documentos con IA  
**Tecnologías**: Azure AI Document Intelligence, Storage, Functions  
**Complejidad**: Intermedio  
**Conceptos**: Análisis de documentos, OCR, extracción de datos  

#### Pipeline de Machine Learning  
**Tecnologías**: Azure ML, MLOps, Registro de Contenedores  
**Complejidad**: Avanzado  
**Conceptos**: Entrenamiento de modelos, pipelines de despliegue, monitoreo  

## 🛠 Ejemplos de Configuración  

El directorio `configurations/` contiene componentes reutilizables:  

### Configuraciones de Entorno  
- Configuraciones para entornos de desarrollo  
- Configuraciones para entornos de staging  
- Configuraciones listas para producción  
- Configuraciones de despliegue en múltiples regiones  

### Módulos Bicep  
- Componentes de infraestructura reutilizables  
- Patrones comunes de recursos  
- Plantillas reforzadas en seguridad  
- Configuraciones optimizadas en costos  

### Scripts Auxiliares  
- Automatización de configuración de entornos  
- Scripts de migración de bases de datos  
- Herramientas de validación de despliegue  
- Utilidades de monitoreo de costos  

## 🔧 Guía de Personalización  

### Adaptar Ejemplos a Tu Caso de Uso  

1. **Revisar Requisitos Previos**  
   - Verificar requisitos de servicios de Azure  
   - Confirmar límites de suscripción  
   - Comprender las implicaciones de costos  

2. **Modificar Configuración**  
   - Actualizar definiciones de servicios en `azure.yaml`  
   - Personalizar plantillas Bicep  
   - Ajustar variables de entorno  

3. **Probar Exhaustivamente**  
   - Desplegar primero en un entorno de desarrollo  
   - Validar funcionalidad  
   - Probar escalado y rendimiento  

4. **Revisión de Seguridad**  
   - Revisar controles de acceso  
   - Implementar gestión de secretos  
   - Habilitar monitoreo y alertas  

## 📊 Matriz Comparativa  

| Ejemplo | Servicios | Base de Datos | Autenticación | Monitoreo | Complejidad |  
|---------|-----------|---------------|---------------|-----------|-------------|  
| **Azure OpenAI Chat** (Local) | 2 | ❌ | Key Vault | Completo | ⭐⭐ |  
| **Python Flask API** (Local) | 1 | ❌ | Básico | Completo | ⭐ |  
| **Microservicios** (Local) | 5+ | ✅ | Empresarial | Avanzado | ⭐⭐⭐⭐ |  
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

## 🎓 Ruta de Aprendizaje  

### Progresión Recomendada  

1. **Comienza con Aplicación Web Simple**  
   - Aprende conceptos básicos de AZD  
   - Comprende el flujo de trabajo de despliegue  
   - Practica la gestión de entornos  

2. **Prueba Sitio Web Estático**  
   - Explora diferentes opciones de hosting  
   - Aprende sobre integración de CDN  
   - Comprende la configuración de DNS  

3. **Avanza a Aplicación en Contenedor**  
   - Aprende conceptos básicos de contenerización  
   - Comprende conceptos de escalado  
   - Practica con Docker  

4. **Agrega Integración con Base de Datos**  
   - Aprende aprovisionamiento de bases de datos  
   - Comprende cadenas de conexión  
   - Practica gestión de secretos  

5. **Explora Sin Servidor**  
   - Comprende arquitectura basada en eventos  
   - Aprende sobre disparadores y enlaces  
   - Practica con APIs  

6. **Construye Microservicios**  
   - Aprende comunicación entre servicios  
   - Comprende sistemas distribuidos  
   - Practica despliegues complejos  

## 🔍 Encontrar el Ejemplo Adecuado  

### Por Stack Tecnológico  
- **Aplicaciones en Contenedores**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservicios (Local)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservicios API Gateway (Local)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservicios Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservicios Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Go**: [Microservicios User Service (Local)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **Contenedores**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservicios (Local)](../../../examples/container-app/microservices), Java Microservices  
- **Bases de Datos**: [Microservicios (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **IA/ML**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Sistemas Multiagente**: **Retail Multi-Agent Solution**  
- **Integración OpenAI**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Producción Empresarial**: [Microservicios (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Por Patrón de Arquitectura  
- **API REST Simple**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)  
- **Monolítico**: Node.js Express Todo, C# Web API + SQL  
- **Estático + Sin Servidor**: React SPA + Functions, Python Functions + SPA  
- **Microservicios**: [Microservicios de Producción (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **Contenerizado**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservicios (Local)](../../../examples/container-app/microservices)  
- **Impulsado por IA**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Arquitectura Multiagente**: **Retail Multi-Agent Solution**  
- **Multi-Servicio Empresarial**: [Microservicios (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Por Nivel de Complejidad  
- **Principiante**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Intermedio**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing  
- **Avanzado**: ML Pipeline  
- **Listo para Producción Empresarial**: [Microservicios (Local)](../../../examples/container-app/microservices) (Multi-servicio con colas de mensajes), **Retail Multi-Agent Solution** (Sistema multiagente completo con despliegue ARM)  

## 📚 Recursos Adicionales  

### Enlaces de Documentación  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Plantillas AZD de Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [Documentación de Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centro de Arquitectura de Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Ejemplos de la Comunidad  
- [Plantillas AZD de Azure Samples](https://github.com/Azure-Samples/azd-templates)  
- [Plantillas de Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [Galería de CLI para Desarrolladores de Azure](https://azure.github.io/awesome-azd/)  
- [Aplicación Todo con C# y Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Aplicación Todo con Python y MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Aplicación Todo con Node.js y PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplicación web React con API en C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Trabajo en Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions con Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Mejores Prácticas
- [Marco de Arquitectura Bien Diseñada de Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Marco de Adopción de la Nube](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Ejemplos de Contribución

¿Tienes un ejemplo útil para compartir? ¡Aceptamos contribuciones!

### Directrices para la Presentación
1. Sigue la estructura de directorios establecida
2. Incluye un README.md completo
3. Agrega comentarios a los archivos de configuración
4. Prueba exhaustivamente antes de enviar
5. Incluye estimaciones de costos y requisitos previos

### Estructura de Plantilla de Ejemplo
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

**Consejo Profesional**: Comienza con el ejemplo más sencillo que se ajuste a tu stack tecnológico, luego avanza gradualmente hacia escenarios más complejos. ¡Cada ejemplo se basa en conceptos de los anteriores!

## 🚀 ¿Listo para Comenzar?

### Tu Ruta de Aprendizaje

1. **¿Eres completamente principiante?** → Comienza con [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minutos)
2. **¿Tienes conocimientos básicos de AZD?** → Prueba [Microservicios](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minutos)
3. **¿Estás construyendo aplicaciones de IA?** → Comienza con [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minutos) o explora [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, más de 2 horas)
4. **¿Necesitas un stack tecnológico específico?** → Usa la sección [Encontrar el Ejemplo Correcto](../../../examples) arriba

### Próximos Pasos

- ✅ Revisa los [Requisitos Previos](../../../examples) arriba
- ✅ Elige un ejemplo que coincida con tu nivel de habilidad (ver [Leyenda de Complejidad](../../../examples))
- ✅ Lee detenidamente el README del ejemplo antes de desplegar
- ✅ Configura un recordatorio para ejecutar `azd down` después de probar
- ✅ Comparte tu experiencia a través de Issues o Discussions en GitHub

### ¿Necesitas Ayuda?

- 📖 [FAQ](../resources/faq.md) - Respuestas a preguntas comunes
- 🐛 [Guía de Solución de Problemas](../docs/troubleshooting/common-issues.md) - Soluciona problemas de despliegue
- 💬 [Discusiones en GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Pregunta a la comunidad
- 📚 [Guía de Estudio](../resources/study-guide.md) - Refuerza tu aprendizaje

---

**Navegación**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../README.md)
- **📖 Materiales de Estudio**: [Guía de Estudio](../resources/study-guide.md) | [Hoja de Referencia](../resources/cheat-sheet.md) | [Glosario](../resources/glossary.md)
- **🔧 Recursos**: [FAQ](../resources/faq.md) | [Solución de Problemas](../docs/troubleshooting/common-issues.md)

---

*Última Actualización: Noviembre 2025 | [Reportar Problemas](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuir Ejemplos](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Ejemplos - Plantillas y Configuraciones Prácticas de AZD

**Aprender con Ejemplos - Organizado por Capítulo**
- **📚 Inicio del curso**: [AZD para principiantes](../README.md)
- **📖 Mapeo de capítulos**: Ejemplos organizados por complejidad de aprendizaje
- **🚀 Ejemplo local**: [Solución minorista multiagente](retail-scenario.md)
- **🤖 Ejemplos externos de IA**: Enlaces a repositorios de Azure Samples

> **📍 IMPORTANTE: Ejemplos locales vs externos**  
> Este repositorio contiene **4 ejemplos locales completos** con implementaciones completas:  
> - **Microsoft Foundry Models Chat** (despliegue gpt-4.1 con interfaz de chat)  
> - **Container Apps** (API Flask simple + microservicios)  
> - **Aplicación de base de datos** (Web + base de datos SQL)  
> - **Retail Multi-Agent** (solución empresarial de IA)  
>  
> Ejemplos adicionales son **referencias externas** a repositorios Azure-Samples que puedes clonar.

## Introducción

Este directorio proporciona ejemplos prácticos y referencias para ayudarte a aprender Azure Developer CLI mediante práctica directa. El escenario Retail Multi-Agent es una implementación completa y lista para producción incluida en este repositorio. Ejemplos adicionales hacen referencia a Azure Samples oficiales que demuestran varios patrones de AZD.

### Leyenda de valoración de complejidad

- ⭐ **Principiante** - Conceptos básicos, servicio único, 15-30 minutos
- ⭐⭐ **Intermedio** - Múltiples servicios, integración de base de datos, 30-60 minutos
- ⭐⭐⭐ **Avanzado** - Arquitectura compleja, integración de IA, 1-2 horas
- ⭐⭐⭐⭐ **Experto** - Listo para producción, patrones empresariales, 2+ horas

## 🎯 Qué hay realmente en este repositorio

### ✅ Implementación local (lista para usar)

#### [Aplicación de chat Microsoft Foundry Models](azure-openai-chat/README.md) 🆕
**Despliegue completo de gpt-4.1 con interfaz de chat incluido en este repo**

- **Ubicación:** `examples/azure-openai-chat/`
- **Complejidad:** ⭐⭐ (Intermedio)
- **Incluye:**
  - Despliegue completo de Microsoft Foundry Models (gpt-4.1)
  - Interfaz de chat por línea de comandos en Python
  - Integración con Key Vault para claves API seguras
  - Plantillas de infraestructura Bicep
  - Seguimiento de uso de tokens y costos
  - Limitación de tasa y manejo de errores

**Inicio rápido:**
```bash
# Navegar a ejemplo
cd examples/azure-openai-chat

# Desplegar todo
azd up

# Instalar dependencias y comenzar a chatear
pip install -r src/requirements.txt
python src/chat.py
```

**Tecnologías:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Ejemplos de Container App](container-app/README.md) 🆕
**Ejemplos completos de despliegue de contenedores incluidos en este repo**

- **Ubicación:** `examples/container-app/`
- **Complejidad:** ⭐-⭐⭐⭐⭐ (De principiante a avanzado)
- **Incluye:**
  - [Guía maestra](container-app/README.md) - Vista general completa de despliegues de contenedores
  - [API Flask simple](../../../examples/container-app/simple-flask-api) - Ejemplo básico de API REST
  - [Arquitectura de microservicios](../../../examples/container-app/microservices) - Despliegue multi-servicio listo para producción
  - Inicio rápido, patrones de producción y avanzados
  - Monitorización, seguridad y optimización de costos

**Inicio rápido:**
```bash
# Ver guía principal
cd examples/container-app

# Desplegar API simple de Flask
cd simple-flask-api
azd up

# Ejemplo de despliegue de microservicios
cd ../microservices
azd up
```

**Tecnologías:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Solución minorista multiagente](retail-scenario.md) 🆕
**Implementación completa lista para producción incluida en este repo**

- **Ubicación:** `examples/retail-multiagent-arm-template/`
- **Complejidad:** ⭐⭐⭐⭐ (Avanzado)
- **Incluye:**
  - Plantilla ARM completa para despliegue
  - Arquitectura multiagente (Cliente + Inventario)
  - Integración Microsoft Foundry Models
  - Búsqueda AI con RAG
  - Monitorización integral
  - Script de despliegue con un clic

**Inicio rápido:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tecnologías:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Azure Samples externos (Clonar para usar)

Los siguientes ejemplos se mantienen en repositorios oficiales Azure-Samples. Clónalos para explorar diferentes patrones de AZD:

### Aplicaciones simples (Capítulos 1-2)

| Plantilla | Repositorio | Complejidad | Servicios |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservicios** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-servicio, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Cómo usar:**
```bash
# Clona cualquier ejemplo
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Desplegar
azd up
```

### Ejemplos de aplicaciones de IA (Capítulos 2, 5, 8)

| Plantilla | Repositorio | Complejidad | Enfoque |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | despliegue gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | chat básico de IA |
| **Agentes IA** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | framework de agentes |
| **Demo Search + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | patrón RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | IA empresarial |

### Base de datos y patrones avanzados (Capítulos 3-8)

| Plantilla | Repositorio | Complejidad | Enfoque |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | integración de base de datos |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Microservicios Java** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | multi-servicio |
| **Pipeline ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Objetivos de aprendizaje

Al trabajar con estos ejemplos, podrás:
- Practicar los flujos de trabajo de Azure Developer CLI con escenarios realistas de aplicaciones
- Comprender diferentes arquitecturas de aplicaciones y sus implementaciones con azd
- Dominar patrones de Infraestructura como Código para varios servicios de Azure
- Aplicar gestión de configuración y estrategias de despliegue específicas para entornos
- Implementar patrones prácticos de monitorización, seguridad y escalado
- Adquirir experiencia en resolución de problemas y depuración de escenarios reales de despliegue

## Resultados del aprendizaje

Al completar estos ejemplos, podrás:
- Desplegar con confianza distintos tipos de aplicaciones usando Azure Developer CLI
- Adaptar plantillas proporcionadas a los requerimientos de tus propias aplicaciones
- Diseñar e implementar patrones de infraestructura personalizados usando Bicep
- Configurar aplicaciones multi-servicios complejas con dependencias adecuadas
- Aplicar buenas prácticas de seguridad, monitorización y rendimiento en escenarios reales
- Diagnosticar y optimizar despliegues basándote en experiencia práctica

## Estructura del directorio

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

## Ejemplos de inicio rápido

> **💡 ¿Nuevo en AZD?** Comienza con el ejemplo #1 (API Flask) - toma ~20 minutos y enseña conceptos básicos.

### Para principiantes
1. **[Container App - API Python Flask](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Despliega una API REST simple con escala a cero  
   **Tiempo:** 20-25 minutos | **Costo:** $0-5/mes  
   **Aprenderás:** Flujo básico de azd, containerización, pruebas de sanidad  
   **Resultado esperado:** Punto final API funcionando que devuelve "Hello, World!" con monitorización

2. **[Aplicación web simple - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Despliega una aplicación web Node.js Express con MongoDB  
   **Tiempo:** 25-35 minutos | **Costo:** $10-30/mes  
   **Aprenderás:** Integración de base de datos, variables de entorno, cadenas de conexión  
   **Resultado esperado:** App de lista de tareas con funcionalidades de crear/leer/actualizar/eliminar

3. **[Sitio web estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hospeda sitio web estático React con Azure Static Web Apps  
   **Tiempo:** 20-30 minutos | **Costo:** $0-10/mes  
   **Aprenderás:** Hospedaje estático, funciones serverless, despliegue CDN  
   **Resultado esperado:** UI React con backend API, SSL automático, CDN global

### Para usuarios intermedios
4. **[Aplicación de chat Microsoft Foundry Models](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Despliegue gpt-4.1 con interfaz de chat y gestión segura de claves API  
   **Tiempo:** 35-45 minutos | **Costo:** $50-200/mes  
   **Aprenderás:** Despliegue de Microsoft Foundry Models, integración Key Vault, seguimiento de tokens  
   **Resultado esperado:** Aplicación de chat funcional con gpt-4.1 y monitorización de costos

5. **[Container App - Microservicios](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Arquitectura multi-servicio lista para producción  
   **Tiempo:** 45-60 minutos | **Costo:** $50-150/mes  
   **Aprenderás:** Comunicación de servicios, colas de mensajes, trazabilidad distribuida  
   **Resultado esperado:** Sistema de 2 servicios (API Gateway + Product Service) con monitorización

6. **[Aplicación de base de datos - C# con Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplicación web con API C# y base de datos Azure SQL  
   **Tiempo:** 30-45 minutos | **Costo:** $20-80/mes  
   **Aprenderás:** Entity Framework, migraciones de base de datos, seguridad en conexiones  
   **Resultado esperado:** API C# con backend Azure SQL, despliegue automático de esquemas

7. **[Función serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Azure Functions en Python con disparadores HTTP y Cosmos DB  
   **Tiempo:** 30-40 minutos | **Costo:** $10-40/mes  
   **Aprenderás:** Arquitectura basada en eventos, escalado serverless, integración NoSQL  
   **Resultado esperado:** App de función que responde a peticiones HTTP con almacenamiento en Cosmos DB

8. **[Microservicios - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplicación Java multi-servicio con Container Apps y gateway API  
   **Tiempo:** 60-90 minutos | **Costo:** $80-200/mes  
   **Aprenderás:** Despliegue Spring Boot, malla de servicios, balanceo de carga  
   **Resultado esperado:** Sistema Java multi-servicio con descubrimiento y enrutamiento de servicios

### Plantillas Microsoft Foundry

1. **[App de chat Microsoft Foundry Models - Ejemplo local](../../../examples/azure-openai-chat)** ⭐⭐  
   Despliegue completo gpt-4.1 con interfaz de chat  
   **Tiempo:** 35-45 minutos | **Costo:** $50-200/mes  
   **Resultado esperado:** Aplicación de chat funcionando con seguimiento de tokens y costos

2. **[Demo Azure Search + OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplicación inteligente de chat con arquitectura RAG  
   **Tiempo:** 60-90 minutos | **Costo:** $100-300/mes  
   **Resultado esperado:** Interfaz de chat potenciada por RAG con búsqueda de documentos y citas

3. **[Procesamiento de documentos IA](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Análisis de documentos usando servicios de Azure IA  
   **Tiempo:** 40-60 minutos | **Costo:** $20-80/mes  
   **Resultado esperado:** API que extrae texto, tablas y entidades de documentos cargados

4. **[Pipeline de Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Flujo MLOps con Azure Machine Learning  
   **Tiempo:** 2-3 horas | **Costo:** $150-500/mes  
   **Resultado esperado:** Pipeline ML automatizado con entrenamiento, despliegue y monitorización

### Escenarios del mundo real

#### **Solución minorista multiagente** 🆕
**[Guía completa de implementación](./retail-scenario.md)**

Una solución completa y lista para producción de soporte al cliente multiagente que demuestra despliegue de aplicaciones IA empresariales con AZD. Este escenario ofrece:
- **Arquitectura Completa**: Sistema multiagente con agentes especializados en atención al cliente y gestión de inventario  
- **Infraestructura de Producción**: Despliegues de Microsoft Foundry Models en múltiples regiones, Azure AI Search, Container Apps y monitoreo integral  
- **Plantilla ARM Lista para Desplegar**: Despliegue con un solo clic con múltiples modos de configuración (Mínimo/Estándar/Premium)  
- **Características Avanzadas**: Validación de seguridad red teaming, marco de evaluación de agentes, optimización de costos y guías de solución de problemas  
- **Contexto Empresarial Real**: Caso de uso de soporte al cliente minorista con carga de archivos, integración de búsquedas y escalado dinámico  

**Tecnologías**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Complejidad**: ⭐⭐⭐⭐ (Avanzado - Listo para Producción Empresarial)  

**Ideal para**: Desarrolladores de IA, arquitectos de soluciones y equipos que construyen sistemas multiagente en producción  

**Inicio Rápido**: Despliegue la solución completa en menos de 30 minutos usando la plantilla ARM incluida con `./deploy.sh -g myResourceGroup`  

## 📋 Instrucciones de Uso  

### Prerrequisitos  

Antes de ejecutar cualquier ejemplo:  
- ✅ Suscripción de Azure con acceso de Propietario o Colaborador  
- ✅ Azure Developer CLI instalado ([Guía de Instalación](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop en ejecución (para ejemplos con contenedores)  
- ✅ Cuotas apropiadas en Azure (ver requisitos específicos de cada ejemplo)  

> **💰 Advertencia de Costos:** Todos los ejemplos crean recursos reales en Azure que generan cargos. Consulte los archivos README individuales para estimaciones de costos. Recuerde ejecutar `azd down` cuando termine para evitar costos continuos.  

### Ejecutar Ejemplos Localmente  

1. **Clonar o Copiar Ejemplo**  
   ```bash
   # Navegar al ejemplo deseado
   cd examples/simple-web-app
   ```
  
2. **Inicializar Entorno AZD**  
   ```bash
   # Inicializar con plantilla existente
   azd init
   
   # O crear un nuevo entorno
   azd env new my-environment
   ```
  
3. **Configurar Entorno**  
   ```bash
   # Establecer variables requeridas
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
   - ✅ `azd up` finaliza sin errores  
   - ✅ El endpoint del servicio devuelve HTTP 200  
   - ✅ Azure Portal muestra el estado "Running"  
   - ✅ Application Insights recibe telemetría  

> **⚠️ ¿Problemas?** Consulte [Problemas Comunes](../docs/chapter-07-troubleshooting/common-issues.md) para solución de problemas de despliegue  

### Adaptar Ejemplos  

Cada ejemplo incluye:  
- **README.md** - Instrucciones detalladas de configuración y personalización  
- **azure.yaml** - Configuración AZD con comentarios  
- **infra/** - Plantillas Bicep con explicaciones de parámetros  
- **src/** - Código de aplicación de ejemplo  
- **scripts/** - Scripts auxiliares para tareas comunes  

## 🎯 Objetivos de Aprendizaje  

### Categorías de Ejemplos  

#### **Despliegues Básicos**  
- Aplicaciones de servicio único  
- Patrones simples de infraestructura  
- Gestión básica de configuración  
- Configuraciones económicas para desarrollo  

#### **Escenarios Avanzados**  
- Arquitecturas multi-servicio  
- Configuraciones de redes complejas  
- Patrones de integración con bases de datos  
- Implementaciones de seguridad y cumplimiento  

#### **Patrones Listos para Producción**  
- Configuraciones de alta disponibilidad  
- Monitoreo y observabilidad  
- Integración CI/CD  
- Configuraciones de recuperación ante desastres  

## 📖 Descripciones de Ejemplos  

### Aplicación Web Simple - Node.js Express  
**Tecnologías**: Node.js, Express, MongoDB, Container Apps  
**Complejidad**: Principiante  
**Conceptos**: Despliegue básico, API REST, integración con base de datos NoSQL  

### Sitio Web Estático - React SPA  
**Tecnologías**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complejidad**: Principiante  
**Conceptos**: Hosting estático, backend serverless, desarrollo web moderno  

### Container App - Python Flask  
**Tecnologías**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complejidad**: Principiante  
**Conceptos**: Contenerización, API REST, escala a cero, sondas de salud, monitoreo  
**Ubicación**: [Ejemplo Local](../../../examples/container-app/simple-flask-api)  

### Container App - Arquitectura de Microservicios  
**Tecnologías**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complejidad**: Avanzado  
**Conceptos**: Arquitectura multi-servicio, comunicación entre servicios, colas de mensajes, trazabilidad distribuida  
**Ubicación**: [Ejemplo Local](../../../examples/container-app/microservices)  

### Aplicación con Base de Datos - C# con Azure SQL  
**Tecnologías**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complejidad**: Intermedio  
**Conceptos**: Entity Framework, conexiones a base de datos, desarrollo de API web  

### Función Serverless - Python Azure Functions  
**Tecnologías**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complejidad**: Intermedio  
**Conceptos**: Arquitectura orientada a eventos, computación serverless, desarrollo full-stack  

### Microservicios - Java Spring Boot  
**Tecnologías**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complejidad**: Intermedio  
**Conceptos**: Comunicación entre microservicios, sistemas distribuidos, patrones empresariales  

### Ejemplos de Microsoft Foundry  

#### Aplicación de Chat con Microsoft Foundry Models  
**Tecnologías**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complejidad**: Intermedio  
**Conceptos**: Arquitectura RAG, búsqueda vectorial, integración con LLM  

#### Procesamiento de Documentos con IA  
**Tecnologías**: Azure AI Document Intelligence, Storage, Functions  
**Complejidad**: Intermedio  
**Conceptos**: Análisis de documentos, OCR, extracción de datos  

#### Pipeline de Machine Learning  
**Tecnologías**: Azure ML, MLOps, Container Registry  
**Complejidad**: Avanzado  
**Conceptos**: Entrenamiento de modelos, pipelines de despliegue, monitoreo  

## 🛠 Ejemplos de Configuraciones  

El directorio `configurations/` contiene componentes reutilizables:  

### Configuraciones de Entorno  
- Ajustes para entorno de desarrollo  
- Configuraciones para entorno de pruebas (staging)  
- Configuraciones listas para producción  
- Configuraciones para despliegue multi-región  

### Módulos Bicep  
- Componentes reutilizables de infraestructura  
- Patrones comunes de recursos  
- Plantillas reforzadas en seguridad  
- Configuraciones optimizadas en costos  

### Scripts de Ayuda  
- Automatización de configuración de entornos  
- Scripts de migración de bases de datos  
- Herramientas para validación de despliegues  
- Utilidades para monitoreo de costos  

## 🔧 Guía de Personalización  

### Adaptar Ejemplos a Tu Caso de Uso  

1. **Revisar Prerrequisitos**  
   - Verificar requerimientos de servicios de Azure  
   - Confirmar límites de suscripción  
   - Entender implicaciones de costos  

2. **Modificar Configuración**  
   - Actualizar definiciones de servicio en `azure.yaml`  
   - Personalizar plantillas Bicep  
   - Ajustar variables de entorno  

3. **Probar Exhaustivamente**  
   - Desplegar primero en entorno de desarrollo  
   - Validar funcionalidad  
   - Probar escalabilidad y desempeño  

4. **Revisar Seguridad**  
   - Revisar controles de acceso  
   - Implementar gestión de secretos  
   - Activar monitoreo y alertas  

## 📊 Matriz de Comparación  

| Ejemplo | Servicios | Base de Datos | Auth | Monitoreo | Complejidad |  
|---------|-----------|--------------|------|-----------|-------------|  
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Completo | ⭐⭐ |  
| **Python Flask API** (Local) | 1 | ❌ | Básico | Completo | ⭐ |  
| **Microservicios** (Local) | 5+ | ✅ | Empresarial | Avanzado | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Básico | Básico | ⭐ |  
| React SPA + Functions | 3 | ✅ | Básico | Completo | ⭐ |  
| Python Flask Container | 2 | ❌ | Básico | Completo | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Completo | Completo | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Completo | Completo | ⭐⭐ |  
| Java Microservicios | 5+ | ✅ | Completo | Completo | ⭐⭐ |  
| Microsoft Foundry Models Chat | 3 | ✅ | Completo | Completo | ⭐⭐⭐ |  
| AI Document Processing | 2 | ❌ | Básico | Completo | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | Completo | Completo | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Empresarial** | **Avanzado** | **⭐⭐⭐⭐** |  

## 🎓 Ruta de Aprendizaje  

### Progresión Recomendada  

1. **Comenzar con Aplicación Web Simple**  
   - Aprender conceptos básicos de AZD  
   - Entender flujo de despliegue  
   - Practicar gestión de entornos  

2. **Probar Sitio Web Estático**  
   - Explorar opciones de hosting  
   - Aprender integración con CDN  
   - Entender configuración DNS  

3. **Pasar a Container App**  
   - Aprender fundamentos de contenerización  
   - Comprender conceptos de escalamiento  
   - Practicar con Docker  

4. **Agregar Integración de Base de Datos**  
   - Aprender aprovisionamiento de bases de datos  
   - Entender cadenas de conexión  
   - Practicar gestión de secretos  

5. **Explorar Serverless**  
   - Comprender arquitectura orientada a eventos  
   - Aprender sobre triggers y bindings  
   - Practicar con APIs  

6. **Construir Microservicios**  
   - Aprender comunicación entre servicios  
   - Entender sistemas distribuidos  
   - Practicar despliegues complejos  

## 🔍 Encontrar el Ejemplo Correcto  

### Por Stack Tecnológico  
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservicios (Local)](../../../examples/container-app/microservices), Java Microservicios  
- **Node.js**: Node.js Express Todo App, [Microservicios API Gateway (Local)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservicios Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservicios Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [Microservicios User Service (Local)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservicios  
- **React**: React SPA + Functions  
- **Contenedores**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservicios (Local)](../../../examples/container-app/microservices), Java Microservicios  
- **Bases de Datos**: [Microservicios (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **IA/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Sistemas Multiagente**: **Retail Multi-Agent Solution**  
- **Integración OpenAI**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Producción Empresarial**: [Microservicios (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Por Patrón de Arquitectura  
- **API REST Simple**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)  
- **Monolítico**: Node.js Express Todo, C# Web API + SQL  
- **Estático + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Microservicios**: [Microservicios en Producción (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservicios  
- **Contenerizado**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservicios (Local)](../../../examples/container-app/microservices)  
- **Impulsado por IA**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Arquitectura Multiagente**: **Retail Multi-Agent Solution**  
- **Multi-servicio Empresarial**: [Microservicios (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Por Nivel de Complejidad  
- **Principiante**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Intermedio**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservicios, Microsoft Foundry Models Chat App, AI Document Processing  
- **Avanzado**: ML Pipeline  
- **Listo para Producción Empresarial**: [Microservicios (Local)](../../../examples/container-app/microservices) (Multi-servicio con colas de mensajes), **Retail Multi-Agent Solution** (Sistema multiagente completo con plantilla ARM para despliegue)  

## 📚 Recursos Adicionales  

### Enlaces a Documentación  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Plantillas Microsoft Foundry AZD](https://github.com/Azure/ai-foundry-templates)  
- [Documentación Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centro de Arquitectura Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Ejemplos de la Comunidad  
- [Plantillas AZD de Azure Samples](https://github.com/Azure-Samples/azd-templates)
- [Plantillas Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galería Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [App de tareas con C# y Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [App de tareas con Python y MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [App de tareas con Node.js y PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [App web React con API en C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Trabajo de Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions con Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Mejores Prácticas
- [Marco de trabajo Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Marco de adopción de la nube](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuir con Ejemplos

¿Tienes un ejemplo útil para compartir? ¡Damos la bienvenida a las contribuciones!

### Pautas para Envío
1. Sigue la estructura de directorios establecida
2. Incluye un README.md completo
3. Añade comentarios en los archivos de configuración
4. Prueba exhaustivamente antes de enviar
5. Incluye estimaciones de costos y prerrequisitos

### Estructura del Ejemplo de Plantilla
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

**Consejo Profesional**: Comienza con el ejemplo más simple que coincida con tu stack tecnológico, luego avanza gradualmente hacia escenarios más complejos. ¡Cada ejemplo se basa en conceptos del anterior!

## 🚀 ¿Listo para comenzar?

### Tu Ruta de Aprendizaje

1. **¿Principiante completo?** → Comienza con [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 mins)
2. **¿Tienes conocimientos básicos de AZD?** → Prueba [Microservicios](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 mins)
3. **¿Construyendo aplicaciones de IA?** → Comienza con [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 mins) o explora [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ horas)
4. **¿Necesitas un stack tecnológico específico?** → Usa la sección de [Encontrar el Ejemplo Correcto](../../../examples) más arriba

### Próximos Pasos

- ✅ Revisa los [Prerrequisitos](../../../examples) más arriba
- ✅ Elige un ejemplo que coincida con tu nivel de habilidad (ver [Leyenda de Complejidad](../../../examples))
- ✅ Lee cuidadosamente el README del ejemplo antes de desplegar
- ✅ Programa un recordatorio para ejecutar `azd down` tras las pruebas
- ✅ Comparte tu experiencia vía Issues o Discussions de GitHub

### ¿Necesitas Ayuda?

- 📖 [Preguntas Frecuentes](../resources/faq.md) - Respuestas a preguntas comunes
- 🐛 [Guía de Resolución de Problemas](../docs/chapter-07-troubleshooting/common-issues.md) - Soluciona problemas de despliegue
- 💬 [Discusiones en GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Pregunta a la comunidad
- 📚 [Guía de Estudio](../resources/study-guide.md) - Refuerza tu aprendizaje

---

**Navegación**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../README.md)
- **📖 Materiales de Estudio**: [Guía de Estudio](../resources/study-guide.md) | [Hoja de Referencia](../resources/cheat-sheet.md) | [Glosario](../resources/glossary.md)
- **🔧 Recursos**: [Preguntas Frecuentes](../resources/faq.md) | [Resolución de Problemas](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Última actualización: noviembre de 2025 | [Reportar problemas](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuir con ejemplos](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso legal**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas derivados del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
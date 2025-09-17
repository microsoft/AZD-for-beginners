<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T15:08:06+00:00",
  "source_file": "examples/README.md",
  "language_code": "es"
}
-->
# Ejemplos - Plantillas y Configuraciones Prácticas de AZD

**Aprender con Ejemplos - Organizado por Capítulo**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../README.md)
- **📖 Mapeo de Capítulos**: Ejemplos organizados por complejidad de aprendizaje
- **🚀 Comienza Simple**: [Ejemplos del Capítulo 1](../../../examples)
- **🤖 Ejemplos de IA**: [Capítulos 2 y 5 Soluciones de IA](../../../examples)

## Introducción

Este directorio contiene ejemplos prácticos, plantillas y escenarios del mundo real para ayudarte a aprender Azure Developer CLI mediante práctica directa. Cada ejemplo incluye código funcional completo, plantillas de infraestructura e instrucciones detalladas para diferentes arquitecturas de aplicaciones y patrones de despliegue.

## Objetivos de Aprendizaje

Al trabajar con estos ejemplos, podrás:
- Practicar flujos de trabajo de Azure Developer CLI con escenarios de aplicaciones realistas
- Comprender diferentes arquitecturas de aplicaciones y sus implementaciones con azd
- Dominar patrones de Infraestructura como Código para varios servicios de Azure
- Aplicar estrategias de gestión de configuración y despliegue específicas para cada entorno
- Implementar patrones de monitoreo, seguridad y escalabilidad en contextos prácticos
- Adquirir experiencia en resolución de problemas y depuración de escenarios reales de despliegue

## Resultados de Aprendizaje

Al completar estos ejemplos, serás capaz de:
- Desplegar diferentes tipos de aplicaciones usando Azure Developer CLI con confianza
- Adaptar las plantillas proporcionadas a tus propios requisitos de aplicación
- Diseñar e implementar patrones de infraestructura personalizados usando Bicep
- Configurar aplicaciones complejas de múltiples servicios con dependencias adecuadas
- Aplicar mejores prácticas de seguridad, monitoreo y rendimiento en escenarios reales
- Resolver problemas y optimizar despliegues basándote en experiencia práctica

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

### Para Principiantes
1. **[Aplicación Web Simple - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Despliega una aplicación web Node.js Express con MongoDB
2. **[Sitio Web Estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Aloja un sitio web estático React con Azure Static Web Apps
3. **[Aplicación en Contenedor - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Despliega una aplicación Python Flask en contenedor

### Para Usuarios Intermedios
4. **[Aplicación con Base de Datos - C# con Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Aplicación web con API en C# y base de datos Azure SQL
5. **[Función Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Funciones de Azure en Python con disparadores HTTP y Cosmos DB
6. **[Microservicios - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Aplicación Java de múltiples servicios con Container Apps y API Gateway

### Plantillas de Azure AI Foundry

1. **[Aplicación de Chat con Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Aplicación de chat inteligente con Azure OpenAI
2. **[Procesamiento de Documentos con IA](https://github.com/Azure-Samples/azure-ai-document-processing)** - Análisis de documentos usando servicios de Azure AI
3. **[Pipeline de Machine Learning](https://github.com/Azure-Samples/mlops-v2)** - Flujo de trabajo MLOps con Azure Machine Learning

### Escenarios del Mundo Real

#### **Solución Multi-Agente para Retail** 🆕
**[Guía Completa de Implementación](./retail-scenario.md)**

Una solución integral de soporte al cliente multi-agente lista para producción que demuestra el despliegue de aplicaciones de IA de nivel empresarial con AZD. Este escenario incluye:

- **Arquitectura Completa**: Sistema multi-agente con agentes especializados en servicio al cliente y gestión de inventario
- **Infraestructura de Producción**: Despliegues de Azure OpenAI en múltiples regiones, AI Search, Container Apps y monitoreo completo
- **Plantilla ARM Lista para Desplegar**: Despliegue con un clic y múltiples modos de configuración (Mínimo/Estándar/Premium)
- **Características Avanzadas**: Validación de seguridad con red teaming, marco de evaluación de agentes, optimización de costos y guías de resolución de problemas
- **Contexto Empresarial Real**: Caso de uso de soporte al cliente para minoristas con carga de archivos, integración de búsqueda y escalado dinámico

**Tecnologías**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complejidad**: ⭐⭐⭐⭐ (Avanzado - Listo para Producción Empresarial)

**Perfecto para**: Desarrolladores de IA, arquitectos de soluciones y equipos que construyen sistemas multi-agente de producción

**Inicio Rápido**: Despliega la solución completa en menos de 30 minutos usando la plantilla ARM incluida con `./deploy.sh -g myResourceGroup`

## 📋 Instrucciones de Uso

### Ejecutar Ejemplos Localmente

1. **Clonar o Copiar Ejemplo**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inicializar Entorno AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Configurar Entorno**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Desplegar**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Adaptar Ejemplos

Cada ejemplo incluye:
- **README.md** - Instrucciones detalladas de configuración y personalización
- **azure.yaml** - Configuración de AZD con comentarios
- **infra/** - Plantillas Bicep con explicaciones de parámetros
- **src/** - Código de aplicación de muestra
- **scripts/** - Scripts auxiliares para tareas comunes

## 🎯 Objetivos de Aprendizaje

### Categorías de Ejemplos

#### **Despliegues Básicos**
- Aplicaciones de un solo servicio
- Patrones de infraestructura simples
- Gestión básica de configuración
- Configuraciones de desarrollo rentables

#### **Escenarios Avanzados**
- Arquitecturas de múltiples servicios
- Configuraciones de red complejas
- Patrones de integración de bases de datos
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
**Conceptos**: Despliegue básico, REST API, integración de base de datos NoSQL

### Sitio Web Estático - React SPA
**Tecnologías**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complejidad**: Principiante  
**Conceptos**: Hosting estático, backend serverless, desarrollo web moderno

### Aplicación en Contenedor - Python Flask
**Tecnologías**: Python Flask, Docker, Container Apps, Container Registry  
**Complejidad**: Principiante  
**Conceptos**: Contenerización, arquitectura de microservicios, desarrollo de API

### Aplicación con Base de Datos - C# con Azure SQL
**Tecnologías**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complejidad**: Intermedio  
**Conceptos**: Entity Framework, conexiones de base de datos, desarrollo de API web

### Función Serverless - Python Azure Functions
**Tecnologías**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complejidad**: Intermedio  
**Conceptos**: Arquitectura basada en eventos, computación serverless, desarrollo full-stack

### Microservicios - Java Spring Boot
**Tecnologías**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complejidad**: Intermedio  
**Conceptos**: Comunicación entre microservicios, sistemas distribuidos, patrones empresariales

### Ejemplos de Azure AI Foundry

#### Aplicación de Chat con Azure OpenAI
**Tecnologías**: Azure OpenAI, Cognitive Search, App Service  
**Complejidad**: Intermedio  
**Conceptos**: Arquitectura RAG, búsqueda vectorial, integración de LLM

#### Procesamiento de Documentos con IA
**Tecnologías**: Azure AI Document Intelligence, Storage, Functions  
**Complejidad**: Intermedio  
**Conceptos**: Análisis de documentos, OCR, extracción de datos

#### Pipeline de Machine Learning
**Tecnologías**: Azure ML, MLOps, Container Registry  
**Complejidad**: Avanzado  
**Conceptos**: Entrenamiento de modelos, pipelines de despliegue, monitoreo

## 🛠 Ejemplos de Configuración

El directorio `configurations/` contiene componentes reutilizables:

### Configuraciones de Entorno
- Configuraciones de entorno de desarrollo
- Configuraciones de entorno de staging
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

1. **Revisar Requisitos**
   - Verifica los requisitos de servicios de Azure
   - Confirma los límites de suscripción
   - Comprende las implicaciones de costos

2. **Modificar Configuración**
   - Actualiza las definiciones de servicios en `azure.yaml`
   - Personaliza las plantillas Bicep
   - Ajusta las variables de entorno

3. **Probar Exhaustivamente**
   - Despliega primero en el entorno de desarrollo
   - Valida la funcionalidad
   - Prueba escalabilidad y rendimiento

4. **Revisión de Seguridad**
   - Revisa controles de acceso
   - Implementa gestión de secretos
   - Habilita monitoreo y alertas

## 📊 Matriz Comparativa

| Ejemplo | Servicios | Base de Datos | Autenticación | Monitoreo | Complejidad |
|---------|----------|---------------|---------------|-----------|-------------|
| Node.js Express Todo | 2 | ✅ | Básico | Básico | ⭐ |
| React SPA + Functions | 3 | ✅ | Básico | Completo | ⭐ |
| Python Flask Container | 2 | ❌ | Básico | Completo | ⭐ |
| C# Web API + SQL | 2 | ✅ | Completo | Completo | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Completo | Completo | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Completo | Completo | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Completo | Completo | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Básico | Completo | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Completo | Completo | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Empresarial** | **Avanzado** | **⭐⭐⭐⭐** |

## 🎓 Ruta de Aprendizaje

### Progresión Recomendada

1. **Comienza con Aplicación Web Simple**
   - Aprende conceptos básicos de AZD
   - Comprende el flujo de trabajo de despliegue
   - Practica gestión de entornos

2. **Prueba Sitio Web Estático**
   - Explora diferentes opciones de hosting
   - Aprende sobre integración de CDN
   - Comprende configuración de DNS

3. **Avanza a Aplicación en Contenedor**
   - Aprende fundamentos de contenerización
   - Comprende conceptos de escalabilidad
   - Practica con Docker

4. **Añade Integración de Base de Datos**
   - Aprende aprovisionamiento de bases de datos
   - Comprende cadenas de conexión
   - Practica gestión de secretos

5. **Explora Serverless**
   - Comprende arquitectura basada en eventos
   - Aprende sobre disparadores y enlaces
   - Practica con APIs

6. **Construye Microservicios**
   - Aprende comunicación entre servicios
   - Comprende sistemas distribuidos
   - Practica despliegues complejos

## 🔍 Encontrar el Ejemplo Adecuado

### Por Stack Tecnológico
- **Node.js**: Aplicación Todo Node.js Express
- **Python**: Aplicación Python Flask en Contenedor, Python Functions + SPA
- **C#**: C# Web API + Base de Datos SQL, Aplicación de Chat con Azure OpenAI, Pipeline de ML
- **Java**: Microservicios Java Spring Boot
- **React**: React SPA + Functions
- **Contenedores**: Aplicación Python Flask en Contenedor, Microservicios Java
- **Bases de Datos**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **IA/ML**: Aplicación de Chat con Azure OpenAI, Procesamiento de Documentos con IA, Pipeline de ML, **Solución Multi-Agente para Retail**
- **Sistemas Multi-Agente**: **Solución Multi-Agente para Retail**
- **Producción Empresarial**: **Solución Multi-Agente para Retail**

### Por Patrón de Arquitectura
- **Monolítico**: Node.js Express Todo, C# Web API + SQL
- **Estático + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservicios**: Microservicios Java Spring Boot
- **Contenerizado**: Aplicación Python Flask en Contenedor
- **Impulsado por IA**: Aplicación de Chat con Azure OpenAI, Procesamiento de Documentos con IA, Pipeline de ML, **Solución Multi-Agente para Retail**
- **Arquitectura Multi-Agente**: **Solución Multi-Agente para Retail**
- **Multi-Servicio Empresarial**: **Solución Multi-Agente para Retail**

### Por Nivel de Complejidad
- **Principiante**: Node.js Express Todo, React SPA + Functions, Aplicación Python Flask en Contenedor
- **Intermedio**: C# Web API + SQL, Python Functions + SPA, Microservicios Java, Aplicación de Chat con Azure OpenAI, Procesamiento de Documentos con IA
- **Avanzado**: Pipeline de ML
- **Listo para Producción Empresarial**: **Solución Multi-Agente para Retail** (Sistema multi-agente completo con despliegue mediante plantilla ARM)

## 📚 Recursos Adicionales

### Enlaces de Documentación
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Plantillas AZD de Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Documentación de Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centro de Arquitectura de Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Ejemplos de la Comunidad
- [Plantillas AZD de Azure Samples](https://github.com/Azure-Samples/azd-templates)
- [Plantillas de Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galería de Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Aplicación Todo con C# y Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Aplicación Todo con Python y MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplicación Todo con Node.js y PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplicación Web React con API en C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Trabajo de Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions con Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Mejores Prácticas
- [Marco de Arquitectura Bien Diseñada de Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Marco de Adopción de la Nube](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Ejemplos de Contribución

¿Tienes un ejemplo útil para compartir? ¡Aceptamos contribuciones!

### Directrices para Envíos
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

**Próximos Pasos**: 
- Elige un ejemplo que se ajuste a tu nivel de habilidad
- Sigue las instrucciones de configuración en el README del ejemplo
- Experimenta con personalizaciones
- Comparte tus aprendizajes con la comunidad

---

**Navegación**
- **Lección Anterior**: [Guía de Estudio](../resources/study-guide.md)
- **Volver a**: [README Principal](../README.md)

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.
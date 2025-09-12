<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee9a026a572535444287d531dbd75d78",
  "translation_date": "2025-09-12T17:02:39+00:00",
  "source_file": "README.md",
  "language_code": "es"
}
-->
# AZD Para Principiantes

![AZD-para-principiantes](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.es.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)  

![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)  

Sigue estos pasos para comenzar a usar estos recursos:  
1. **Haz un Fork del Repositorio**: Haz clic en [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **Clona el Repositorio**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**Únete a las comunidades de Azure Discord y conecta con expertos y otros desarrolladores**](https://discord.com/invite/ByRwuEEgH4)  

### Soporte Multilingüe

#### Disponible a través de GitHub Action (Automatizado y Siempre Actualizado)

[Francés](../fr/README.md) | [Español](./README.md) | [Alemán](../de/README.md) | [Ruso](../ru/README.md) | [Árabe](../ar/README.md) | [Persa (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chino (Simplificado)](../zh/README.md) | [Chino (Tradicional, Macao)](../mo/README.md) | [Chino (Tradicional, Hong Kong)](../hk/README.md) | [Chino (Tradicional, Taiwán)](../tw/README.md) | [Japonés](../ja/README.md) | [Coreano](../ko/README.md) | [Hindi](../hi/README.md) | [Bengalí](../bn/README.md) | [Maratí](../mr/README.md) | [Nepalí](../ne/README.md) | [Panyabí (Gurmukhi)](../pa/README.md) | [Portugués (Portugal)](../pt/README.md) | [Portugués (Brasil)](../br/README.md) | [Italiano](../it/README.md) | [Polaco](../pl/README.md) | [Turco](../tr/README.md) | [Griego](../el/README.md) | [Tailandés](../th/README.md) | [Sueco](../sv/README.md) | [Danés](../da/README.md) | [Noruego](../no/README.md) | [Finlandés](../fi/README.md) | [Holandés](../nl/README.md) | [Hebreo](../he/README.md) | [Vietnamita](../vi/README.md) | [Indonesio](../id/README.md) | [Malayo](../ms/README.md) | [Tagalo (Filipino)](../tl/README.md) | [Suajili](../sw/README.md) | [Húngaro](../hu/README.md) | [Checo](../cs/README.md) | [Eslovaco](../sk/README.md) | [Rumano](../ro/README.md) | [Búlgaro](../bg/README.md) | [Serbio (Cirílico)](../sr/README.md) | [Croata](../hr/README.md) | [Esloveno](../sl/README.md) | [Ucraniano](../uk/README.md) | [Birmano (Myanmar)](../my/README.md)  

**Si deseas que se admitan idiomas adicionales, consulta la lista [aquí](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## Introducción

Bienvenido a la guía completa para Azure Developer CLI (azd). Este repositorio está diseñado para ayudar a desarrolladores de todos los niveles, desde estudiantes hasta profesionales, a aprender y dominar Azure Developer CLI para implementaciones eficientes en la nube, **con un enfoque especial en la implementación de aplicaciones de IA utilizando Azure AI Foundry**. Este recurso de aprendizaje estructurado proporciona experiencia práctica con implementaciones en la nube de Azure, resolución de problemas comunes e implementación de mejores prácticas para despliegues exitosos de plantillas AZD.

### **Por Qué Esta Guía Es Importante para Desarrolladores de IA**
Según nuestra reciente encuesta en la comunidad de Discord de Azure AI Foundry, **el 45% de los desarrolladores están interesados en usar AZD para cargas de trabajo de IA**, pero enfrentan desafíos con:  
- Arquitecturas complejas de IA con múltiples servicios  
- Mejores prácticas para implementaciones de IA en producción  
- Integración y configuración de servicios de Azure AI  
- Optimización de costos para cargas de trabajo de IA  
- Resolución de problemas específicos de implementación de IA  

## Objetivos de Aprendizaje

Al trabajar con este repositorio, aprenderás:  
- Dominar los fundamentos y conceptos principales de Azure Developer CLI  
- Implementar y aprovisionar recursos de Azure utilizando Infraestructura como Código  
- Desarrollar habilidades para resolver problemas comunes de implementación con AZD  
- Comprender la validación previa a la implementación y la planificación de capacidad  
- Implementar mejores prácticas de seguridad y estrategias de optimización de costos  
- Ganar confianza en el despliegue de aplicaciones listas para producción en Azure  

## Resultados de Aprendizaje

Después de completar este curso, serás capaz de:  
- Instalar, configurar y usar Azure Developer CLI con éxito  
- Crear e implementar aplicaciones utilizando plantillas AZD  
- Resolver problemas de autenticación, infraestructura y despliegue  
- Realizar verificaciones previas a la implementación, incluida la planificación de capacidad y selección de SKU  
- Implementar mejores prácticas de monitoreo, seguridad y gestión de costos  
- Integrar flujos de trabajo de AZD en pipelines de CI/CD  

## Tabla de Contenidos

- [¿Qué es Azure Developer CLI?](../..)  
- [Inicio Rápido](../..)  
- [Ruta de Aprendizaje](../..)  
  - [Para Desarrolladores de IA (¡Recomendado Comenzar Aquí!)](../..)  
  - [Para Estudiantes y Principiantes](../..)  
  - [Para Desarrolladores](../..)  
  - [Para Ingenieros DevOps](../..)  
- [Documentación](../..)  
  - [Primeros Pasos](../..)  
  - [Despliegue y Aprovisionamiento](../..)  
  - [Verificaciones Previas a la Implementación](../..)  
  - [IA y Azure AI Foundry](../..)  
  - [Resolución de Problemas](../..)  
- [Ejemplos y Plantillas](../..)  
  - [Destacado: Plantillas de Azure AI Foundry](../..)  
  - [Destacado: Escenarios E2E de Azure AI Foundry](../..)  
  - [Plantillas Adicionales de AZD](../..)  
  - [Laboratorios Prácticos y Talleres](../..)  
- [Recursos](../..)  
- [Contribuir](../..)  
- [Soporte](../..)  
- [Comunidad](../..)  

## ¿Qué es Azure Developer CLI?

Azure Developer CLI (azd) es una interfaz de línea de comandos centrada en el desarrollador que acelera el proceso de creación e implementación de aplicaciones en Azure. Proporciona:  

- **Despliegues basados en plantillas** - Usa plantillas preconstruidas para patrones comunes de aplicaciones  
- **Infraestructura como Código** - Gestiona recursos de Azure utilizando Bicep o Terraform  
- **Flujos de trabajo integrados** - Aprovisiona, implementa y monitorea aplicaciones de manera fluida  
- **Amigable para desarrolladores** - Optimizado para la productividad y experiencia del desarrollador  

### **AZD + Azure AI Foundry: Perfecto para Implementaciones de IA**

**¿Por qué AZD para soluciones de IA?** AZD aborda los principales desafíos que enfrentan los desarrolladores de IA:  

- **Plantillas listas para IA** - Plantillas preconfiguradas para Azure OpenAI, Cognitive Services y cargas de trabajo de ML  
- **Implementaciones de IA seguras** - Patrones de seguridad integrados para servicios de IA, claves API y puntos finales de modelos  
- **Patrones de IA en producción** - Mejores prácticas para implementaciones de aplicaciones de IA escalables y rentables  
- **Flujos de trabajo de IA de extremo a extremo** - Desde el desarrollo de modelos hasta la implementación en producción con monitoreo adecuado  
- **Optimización de costos** - Estrategias inteligentes de asignación y escalado de recursos para cargas de trabajo de IA  
- **Integración con Azure AI Foundry** - Conexión fluida al catálogo de modelos y puntos finales de AI Foundry  

## Inicio Rápido

### Prerrequisitos  
- Suscripción a Azure  
- Azure CLI instalado  
- Git (para clonar plantillas)  

### Instalación  
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```  

### Tu Primer Despliegue  
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```  

### Tu Primer Despliegue de IA  
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```  

## Ruta de Aprendizaje

### Para Desarrolladores de IA (¡Recomendado Comenzar Aquí!)  
1. **Inicio Rápido**: Prueba la plantilla [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)  
2. **Aprende los Fundamentos**: [AZD Basics](docs/getting-started/azd-basics.md) + [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)  
3. **Práctica Práctica**: Completa el [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md)  
4. **Listo para Producción**: Revisa [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md)  
5. **Avanzado**: Implementa la plantilla empresarial [contoso-chat](https://github.com/Azure-Samples/contoso-chat)  

### Para Estudiantes y Principiantes  
1. Comienza con [AZD Basics](docs/getting-started/azd-basics.md)  
2. Sigue la [Guía de Instalación](docs/getting-started/installation.md)  
3. Completa [Tu Primer Proyecto](docs/getting-started/first-project.md)  
4. Practica con el [Ejemplo de Aplicación Web Simple](../../examples/simple-web-app)  

### Para Desarrolladores  
1. Revisa la [Guía de Configuración](docs/getting-started/configuration.md)  
2. Estudia la [Guía de Despliegue](docs/deployment/deployment-guide.md)  
3. Trabaja con el [Ejemplo de Aplicación de Base de Datos](../../examples/database-app)  
4. Explora el [Ejemplo de Aplicación en Contenedor](../../examples/container-app)  

### Para Ingenieros DevOps  
1. Domina el [Aprovisionamiento de Recursos](docs/deployment/provisioning.md)  
2. Implementa [Verificaciones Previas](docs/pre-deployment/preflight-checks.md)  
3. Practica la [Planificación de Capacidad](docs/pre-deployment/capacity-planning.md)  
4. Avanzado: [Ejemplo de Microservicios](../../examples/microservices)  

## Documentación

### Primeros Pasos  
- [**AZD Basics**](docs/getting-started/azd-basics.md) - Conceptos y terminología principales  
- [**Instalación y Configuración**](docs/getting-started/installation.md) - Guías de instalación específicas por plataforma  
- [**Configuración**](docs/getting-started/configuration.md) - Configuración del entorno y autenticación  
- [**Tu Primer Proyecto**](docs/getting-started/first-project.md) - Tutorial paso a paso  

### Despliegue y Aprovisionamiento  
- [**Guía de Despliegue**](docs/deployment/deployment-guide.md) - Flujos de trabajo completos de despliegue  
- [**Aprovisionamiento de Recursos**](docs/deployment/provisioning.md) - Gestión de recursos de Azure  

### Verificaciones Previas a la Implementación  
- [**Planificación de Capacidad**](docs/pre-deployment/capacity-planning.md) - Validación de capacidad de recursos de Azure  
- [**Selección de SKU**](docs/pre-deployment/sku-selection.md) - Elección de los SKU adecuados de Azure  
- [**Verificaciones Previas**](docs/pre-deployment/preflight-checks.md) - Scripts de validación automatizados  

### IA y Azure AI Foundry  
- [**Integración con Azure AI Foundry**](docs/ai-foundry/azure-ai-foundry-integration.md) - Conecta AZD con los servicios de Azure AI Foundry  
- [**Patrones de Despliegue de Modelos de IA**](docs/ai-foundry/ai-model-deployment.md) - Implementa y gestiona modelos de IA con AZD  
- [**Laboratorio de Taller de IA**](docs/ai-foundry/ai-workshop-lab.md) - Laboratorio práctico: Haciendo soluciones de IA listas para AZD  
- [**Mejores Prácticas para IA en Producción**](docs/ai-foundry/production-ai-practices.md) - Seguridad, escalado y monitoreo para cargas de trabajo de IA  

### Resolución de Problemas  
- [**Problemas Comunes**](docs/troubleshooting/common-issues.md) - Problemas frecuentes y soluciones  
- [**Guía de Depuración**](docs/troubleshooting/debugging.md) - Estrategias paso a paso para depurar
- [**Solución de Problemas Específicos de IA**](docs/troubleshooting/ai-troubleshooting.md) - Problemas de servicio de IA y despliegue de modelos

## Ejemplos y Plantillas

### [Destacado: Plantillas de Azure AI Foundry](https://ai.azure.com/resource/build/templates)
**¡Comienza aquí si estás desplegando aplicaciones de IA!**

| Plantilla | Descripción | Complejidad | Servicios |
|----------|-------------|------------|----------|
| [**Comienza con chat de IA**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Crea y despliega una aplicación de chat básica integrada con tus datos e información de telemetría usando Azure Container Apps |⭐⭐ | AzureOpenAI + API de Inferencia de Modelos de Azure AI + Azure AI Search + Azure Container Apps + Application Insights |
| [**Comienza con agentes de IA**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Crea y despliega una aplicación básica de agentes con acciones e información de telemetría usando Azure Container Apps. |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Automatización de flujo de trabajo con múltiples agentes**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Mejora la planificación de tareas y la automatización mediante la orquestación y gestión de un grupo de agentes de IA.|⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Genera documentos a partir de tus datos**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Acelera la generación de documentos como contratos, facturas y propuestas de inversión encontrando y resumiendo información relevante de tus datos. |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Servicios de Azure AI + Azure CosmosDB|
| [**Mejora reuniones con clientes usando agentes**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Migra código heredado a lenguajes modernos aprovechando un equipo de agentes. |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Moderniza tu código con agentes**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Crea y despliega una aplicación de chat básica integrada con tus datos e información de telemetría usando Azure Container Apps |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Construye tu agente conversacional**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Aprovecha la comprensión conversacional avanzada para crear y mejorar chatbots y agentes con flujos de trabajo deterministas y controlados por humanos. |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Descubre información a partir de datos conversacionales**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Mejora la eficiencia de centros de contacto descubriendo información a partir de grandes conjuntos de datos de audio y texto usando capacidades avanzadas de comprensión de contenido. |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Procesamiento de contenido multimodal**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Procesa reclamaciones, facturas, contratos y otros documentos de manera rápida y precisa extrayendo información de contenido no estructurado y mapeándola a un formato estructurado. Esta plantilla admite texto, imágenes, tablas y gráficos. |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Destacado: Escenarios E2E de Azure AI Foundry
**¡Comienza aquí si estás desplegando aplicaciones de IA!**

| Plantilla | Descripción | Complejidad | Servicios |
|----------|-------------|------------|----------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Interfaz de chat simple con Azure OpenAI | ⭐ | AzureOpenAI + Container Apps |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Aplicación de chat habilitada para RAG con Azure OpenAI | ⭐⭐ | AzureOpenAI + Search + App Service |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Análisis de documentos con servicios de IA | ⭐⭐ | Azure Document Intelligence + Functions |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Marco de agentes de IA con llamadas a funciones | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chat empresarial con orquestación de IA | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |

### Plantillas adicionales de AZD
- [**Directorio de Ejemplos**](examples/README.md) - Ejemplos prácticos, plantillas y escenarios reales
- [**Plantillas AZD de Azure-Samples**](https://github.com/Azure-Samples/azd-templates) - Plantillas de muestra oficiales de Microsoft  
- [**Galería Awesome AZD**](https://azure.github.io/awesome-azd/) - Plantillas contribuidas por la comunidad

### Laboratorios Prácticos y Talleres
- [**Laboratorio de Taller de IA**](docs/ai-foundry/ai-workshop-lab.md) - **NUEVO**: Haz que tus soluciones de IA sean desplegables con AZD
- [**Taller AZD para Principiantes**](workshop/README.md) - Enfoque en el despliegue de plantillas de agentes de IA con AZD

## Recursos

### Referencias Rápidas
- [**Hoja de Trucos de Comandos**](resources/cheat-sheet.md) - Comandos esenciales de azd
- [**Glosario**](resources/glossary.md) - Terminología de Azure y azd
- [**Preguntas Frecuentes**](resources/faq.md) - Preguntas frecuentes
- [**Guía de Estudio**](resources/study-guide.md) - Objetivos de aprendizaje y ejercicios prácticos

### Recursos Externos
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitectura de Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculadora de Precios de Azure](https://azure.microsoft.com/pricing/calculator/)
- [Estado de Azure](https://status.azure.com/)

## Contribuir

¡Aceptamos contribuciones! Por favor, lee nuestra [Guía de Contribución](CONTRIBUTING.md) para detalles sobre:
- Cómo enviar problemas y solicitudes de características
- Directrices para contribuciones de código
- Mejoras en la documentación
- Estándares de la comunidad

## Soporte

- **Problemas**: [Reporta errores y solicita características](https://github.com/microsoft/azd-for-beginners/issues)
- **Discusiones**: [Preguntas y discusiones en la comunidad de Discord de Microsoft Azure](https://discord.gg/microsoft-azure)
- **Soporte Específico de IA**: Únete al [canal #Azure](https://discord.gg/microsoft-azure) para discusiones sobre AZD + AI Foundry
- **Correo Electrónico**: Para consultas privadas
- **Microsoft Learn**: [Documentación oficial de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Perspectivas de la Comunidad en Discord de Azure AI Foundry

**Resultados de Encuestas en el Canal #Azure:**
- **45%** de los desarrolladores quieren usar AZD para cargas de trabajo de IA
- **Principales desafíos**: Despliegues de múltiples servicios, gestión de credenciales, preparación para producción
- **Más solicitado**: Plantillas específicas de IA, guías de solución de problemas, mejores prácticas

**Únete a nuestra comunidad para:**
- Compartir tus experiencias con AZD + IA y obtener ayuda
- Acceder a vistas previas de nuevas plantillas de IA
- Contribuir a las mejores prácticas de despliegue de IA
- Influir en el desarrollo futuro de características de AZD + IA

## Licencia

Este proyecto está licenciado bajo la Licencia MIT - consulta el archivo [LICENSE](../../LICENSE) para más detalles.

## Otros Cursos

¡Nuestro equipo produce otros cursos! Echa un vistazo:

- [**NUEVO** Protocolo de Contexto de Modelos (MCP) para Principiantes](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Agentes de IA para Principiantes](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [IA Generativa para Principiantes usando .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [IA Generativa para Principiantes](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [IA Generativa para Principiantes usando Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML para Principiantes](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Ciencia de Datos para Principiantes](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [IA para Principiantes](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Ciberseguridad para Principiantes](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Desarrollo Web para Principiantes](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT para Principiantes](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [Desarrollo XR para Principiantes](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Dominando GitHub Copilot para Programación en Pareja con IA](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Dominando GitHub Copilot para Desarrolladores de C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Elige tu propia aventura con Copilot](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**Navegación**
- **Próxima Lección**: [Conceptos Básicos de AZD](docs/getting-started/azd-basics.md)

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.
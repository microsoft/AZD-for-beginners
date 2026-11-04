# AZD para Principiantes: Un Viaje de Aprendizaje Estructurado

![AZD-para-principiantes](../../translated_images/es/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traducciones Automáticas (Siempre Actualizadas)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Árabe](../ar/README.md) | [Bengalí](../bn/README.md) | [Búlgaro](../bg/README.md) | [Birmano (Myanmar)](../my/README.md) | [Chino (Simplificado)](../zh-CN/README.md) | [Chino (Tradicional, Hong Kong)](../zh-HK/README.md) | [Chino (Tradicional, Macao)](../zh-MO/README.md) | [Chino (Tradicional, Taiwán)](../zh-TW/README.md) | [Croata](../hr/README.md) | [Checo](../cs/README.md) | [Danés](../da/README.md) | [Neerlandés](../nl/README.md) | [Estonio](../et/README.md) | [Finés](../fi/README.md) | [Francés](../fr/README.md) | [Alemán](../de/README.md) | [Griego](../el/README.md) | [Hebreo](../he/README.md) | [Hindi](../hi/README.md) | [Húngaro](../hu/README.md) | [Indonesio](../id/README.md) | [Italiano](../it/README.md) | [Japonés](../ja/README.md) | [Kannada](../kn/README.md) | [Jemer](../km/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malayo](../ms/README.md) | [Malabar](../ml/README.md) | [Manipuri (Meitei Mayek)](../mni/README.md) | [Maratí](../mr/README.md) | [Nepalí](../ne/README.md) | [Pidgin Nigeriano](../pcm/README.md) | [Noruego](../no/README.md) | [Persa (Farsi)](../fa/README.md) | [Polaco](../pl/README.md) | [Portugués (Brasil)](../pt-BR/README.md) | [Portugués (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumano](../ro/README.md) | [Ruso](../ru/README.md) | [Serbio (Cirílico)](../sr/README.md) | [Eslovaco](../sk/README.md) | [Esloveno](../sl/README.md) | [Español](./README.md) | [Swahili](../sw/README.md) | [Sueco](../sv/README.md) | [Tagalo (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Tailandés](../th/README.md) | [Turco](../tr/README.md) | [Ucraniano](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **¿Prefieres clonar localmente?**
>
> Este repositorio incluye traducciones en más de 50 idiomas, lo que aumenta significativamente el tamaño de la descarga. Para clonar sin traducciones, usa checkout escaso:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Esto te da todo lo que necesitas para completar el curso con una descarga mucho más rápida.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Novedades en azd Hoy

> 📌 Este curso está validado contra **`azd 1.27.1`** (julio 2026). Ejecuta `azd version` para verificar tu compilación, y `azd upgrade` para obtener la versión más reciente.

Azure Developer CLI ha evolucionado más allá de las aplicaciones web tradicionales y las API. Hoy, azd es la herramienta única para desplegar **cualquier** aplicación en Azure—incluyendo aplicaciones impulsadas por IA y agentes inteligentes.

Esto es lo que significa para ti:

- **Los agentes de IA ahora son cargas de trabajo de primera clase en azd.** Puedes inicializar, desplegar y gestionar proyectos de agentes de IA usando el mismo flujo `azd init` → `azd up` que ya conoces.
- **Un ciclo de vida completo de agente desde la CLI.** La extensión `azure.ai.agents` ahora cubre todo el proceso—`azd ai agent init` para crear la estructura, `azd ai agent invoke` para probar (con salida de tiempos de respuesta), `azd ai agent eval generate` y `azd ai agent optimize` para medir y mejorar la calidad, y `azd ai agent delete` para limpiar.
- **Más bloques constructores de IA.** Nuevas extensiones en vista previa—`azure.ai.skills` y `azure.ai.connections`—te permiten gestionar habilidades reutilizables de agentes y conexiones Foundry directamente con azd.
- **Integración con Microsoft Foundry** que incorpora despliegue de modelos, hospedaje de agentes y configuración de servicios de IA directamente en el ecosistema de plantillas azd.
- **Mejoras en las operaciones básicas diarias.** Las versiones recientes hicieron que `azd init` sea idempotente (seguro de ejecutar varias veces), que `azd auth login` limpie automáticamente tokens obsoletos, y añadieron un amigable mensaje de configuración inicial `azd tool`.
- **El flujo principal no ha cambiado.** Ya sea que despliegues una aplicación de tareas, un microservicio o una solución de IA con múltiples agentes, los comandos son los mismos.

> **Nota para usuarios de Aspire:** Microsoft ahora se refiere al producto simplemente como **Aspire** (anteriormente ".NET Aspire"). El soporte de azd para Aspire no ha cambiado—solo se actualizó el nombre.

Si has usado azd antes, el soporte para IA es una extensión natural—no una herramienta separada ni un camino avanzado. Si comienzas de cero, aprenderás un flujo que funciona para todo.

---

## 🚀 ¿Qué es Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** es una herramienta de línea de comandos amigable para desarrolladores que facilita el despliegue de aplicaciones en Azure. En lugar de crear y conectar manualmente docenas de recursos de Azure, puedes desplegar aplicaciones completas con un solo comando.

### La Magia de `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

**¡Eso es todo!** No más clics en el Portal de Azure, ni plantillas ARM complejas para aprender primero, ni configuraciones manuales - sólo aplicaciones funcionando en Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: ¿Cuál es la Diferencia?

Esta es la pregunta más común entre principiantes. Aquí está la respuesta sencilla:

| Característica | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Propósito** | Gestionar recursos individuales de Azure | Desplegar aplicaciones completas |
| **Mentalidad** | Enfocado en infraestructura | Enfocado en aplicaciones |
| **Ejemplo** | `az webapp create --name myapp...` | `azd up` |
| **Curva de aprendizaje** | Debe conocer los servicios de Azure | Solo conoce tu aplicación |
| **Ideal para** | DevOps, Infraestructura | Desarrolladores, Prototipado |

### Analogía Simple

- **Azure CLI** es como tener todas las herramientas para construir una casa - martillos, sierras, clavos. Puedes construir cualquier cosa, pero necesitas conocer construcción.
- **Azure Developer CLI** es como contratar un contratista - describes lo que quieres, y ellos se encargan de la construcción.

### Cuándo Usar Cada Uno

| Escenario | Usa Esto |
|----------|----------|
| "Quiero desplegar mi aplicación web rápidamente" | `azd up` |
| "Necesito crear solo una cuenta de almacenamiento" | `az storage account create` |
| "Estoy construyendo una aplicación completa de IA" | `azd init --template azure-search-openai-demo` |
| "Necesito depurar un recurso específico de Azure" | `az resource show` |
| "Quiero un despliegue listo para producción en minutos" | `azd up --environment production` |

### ¡Trabajan Juntos!

AZD usa Azure CLI internamente. Puedes usar ambos:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Encuentra Plantillas en Awesome AZD

¡No empieces desde cero! **Awesome AZD** es la colección comunitaria de plantillas listas para desplegar:

| Recurso | Descripción |
|----------|-------------|
| 🔗 [**Galería Awesome AZD**](https://azure.github.io/awesome-azd/) | Explora más de 200 plantillas con despliegue con un clic |
| 🔗 [**Enviar una Plantilla**](https://github.com/Azure/awesome-azd/issues) | Contribuye con tu propia plantilla a la comunidad |
| 🔗 [**Repositorio GitHub**](https://github.com/Azure/awesome-azd) | Marca con estrella y explora el código fuente |

### Plantillas de IA Populares de Awesome AZD

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Comenzando en 3 Pasos

Antes de empezar, asegúrate de que tu máquina está lista para la plantilla que deseas desplegar:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Si alguna comprobación requerida falla, corrígela primero y luego continúa con el inicio rápido.

### Paso 1: Instala AZD (2 minutos)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Paso 2: Autentícate para AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Si no estás seguro de cuál necesitas, sigue el flujo completo de configuración en [Instalación y Configuración](docs/chapter-01-foundation/installation.md#authentication-setup).

### Paso 3: Despliega tu Primera Aplicación

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 ¡Eso es todo!** Tu aplicación ya está en vivo en Azure.

### Limpieza (¡No lo olvides!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cómo Usar Este Curso

Este curso está diseñado para un **aprendizaje progresivo** - comienza donde te sientas cómodo y avanza:

| Tu Experiencia | Comienza Aquí |
|-----------------|------------|
| **Nuevo en Azure** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Conoces Azure, nuevo en AZD** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Quieres desplegar aplicaciones de IA** | [Capítulo 2: Desarrollo con IA primero](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Quieres práctica práctica** | [🎓 Taller Interactivo](workshop/README.md) - laboratorio guiado de 3-4 horas |
| **Necesitas patrones de producción** | [Capítulo 8: Producción y Empresa](#-chapter-8-production--enterprise-patterns) |

### Configuración Rápida

1. **Haz un Fork de Este Repositorio**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clónalo**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obtén Ayuda**: [Comunidad Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **¿Prefieres clonar localmente?**

> Este repositorio incluye traducciones en más de 50 idiomas, lo que aumenta significativamente el tamaño de la descarga. Para clonar sin traducciones, usa checkout escaso:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Esto te da todo lo que necesitas para completar el curso con una descarga mucho más rápida.


## Resumen del Curso

Domina Azure Developer CLI (azd) mediante capítulos estructurados diseñados para un aprendizaje progresivo. **Enfoque especial en el despliegue de aplicaciones de IA con integración Microsoft Foundry.**

### Por Qué Este Curso es Esencial para Desarrolladores Modernos

Basado en información de la comunidad Microsoft Foundry Discord, **el 45% de los desarrolladores quieren usar AZD para cargas de trabajo de IA** pero enfrentan desafíos con:
- Arquitecturas complejas de IA con múltiples servicios
- Mejores prácticas para despliegue de IA en producción  
- Integración y configuración del servicio de IA en Azure
- Optimización de costos para cargas de trabajo de IA
- Resolución de problemas específicos en despliegues de IA

### Objetivos de Aprendizaje

Al completar este curso estructurado, podrás:
- **Dominar los Fundamentos de AZD**: Conceptos clave, instalación y configuración
- **Desplegar Aplicaciones de IA**: Usar AZD con los servicios Microsoft Foundry
- **Implementar Infraestructura como Código**: Gestiona recursos de Azure con plantillas Bicep
- **Solucionar Problemas de Despliegue**: Resuelve problemas comunes y depura errores
- **Optimizar para Producción**: Seguridad, escalabilidad, monitoreo y gestión de costos
- **Construir Soluciones Multi-Agente**: Despliega arquitecturas complejas de IA

## Antes de Comenzar: Cuentas, Acceso y Suposiciones

Antes de iniciar el Capítulo 1, asegúrate de tener lo siguiente. Los pasos de instalación en esta guía asumen que estas bases ya están cubiertas.

- **Una suscripción a Azure**: Puedes usar una suscripción existente de tu trabajo o tu cuenta personal, o crear una [prueba gratuita](https://aka.ms/azurefreetrial) para comenzar.
- **Permiso para crear recursos en Azure**: Para la mayoría de los ejercicios, debes tener al menos acceso de **Colaborador** en la suscripción o grupo de recursos objetivo. Algunos capítulos también asumen que puedes crear grupos de recursos, identidades administradas y asignaciones RBAC.
- [**Una cuenta de GitHub**](https://github.com): Es útil para bifurcar el repositorio, seguir tus propios cambios y usar GitHub Codespaces para el taller.
- **Requisitos previos del entorno de plantillas**: Algunas plantillas requieren herramientas locales como Node.js, Python, Java o Docker. Ejecuta el validador de configuración antes de comenzar para detectar herramientas faltantes temprano.
- **Familiaridad básica con terminal**: No necesitas ser un experto, pero debes sentirte cómodo ejecutando comandos como `git clone`, `azd auth login` y `azd up`.

> **¿Trabajas en una suscripción empresarial?**
> Si tu entorno de Azure es administrado por un administrador, confirma previamente que puedas desplegar recursos en la suscripción o grupo de recursos que planeas usar. Si no, solicita una suscripción sandbox o acceso de Colaborador antes de comenzar.

> **¿Nuevo en Azure?**
> Comienza con una suscripción de prueba o de pago por uso propia en https://aka.ms/azurefreetrial para completar los ejercicios de principio a fin sin esperar aprobaciones a nivel de inquilino.

## 🗺️ Mapa del Curso: Navegación Rápida por Capítulo

Cada capítulo tiene un README dedicado con objetivos de aprendizaje, inicios rápidos y ejercicios:

| Capítulo | Tema | Lecciones | Duración | Complejidad |
|---------|-------|---------|----------|------------|
| **[Cap 1: Fundamentos](docs/chapter-01-foundation/README.md)** | Introducción | [Conceptos Básicos de AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalación](docs/chapter-01-foundation/installation.md) &#124; [Primer Proyecto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap 2: Desarrollo IA](docs/chapter-02-ai-development/README.md)** | Aplicaciones IA-First | [Integración Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agentes IA](docs/chapter-02-ai-development/agents.md) &#124; [Despliegue de Modelos](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Taller](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Cap 3: Configuración](docs/chapter-03-configuration/README.md)** | Autenticación y Seguridad | [Configuración](docs/chapter-03-configuration/configuration.md) &#124; [Autenticación y Seguridad](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap 4: Infraestructura](docs/chapter-04-infrastructure/README.md)** | IaC y Despliegue | [Guía de Despliegue](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Aprovisionamiento](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Cap 5: Multi-Agente](docs/chapter-05-multi-agent/README.md)** | Soluciones Agente IA | [Escenario Retail](examples/retail-scenario.md) &#124; [Patrones de Coordinación](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Cap 6: Pre-Despliegue](docs/chapter-06-pre-deployment/README.md)** | Planificación y Validación | [Chequeos Previos](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planificación de Capacidad](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Selección de SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Cap 7: Solución de Problemas](docs/chapter-07-troubleshooting/README.md)** | Depuración y Corrección | [Problemas Comunes](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Depuración](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemas IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Cap 8: Producción](docs/chapter-08-production/README.md)** | Patrones Empresariales | [Buenas Prácticas de Producción](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Taller](workshop/README.md)** | Laboratorio Práctico | [Introducción](workshop/docs/instructions/0-Introduction.md) &#124; [Selección](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validación](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Desconstrucción](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuración](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalización](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Desmontaje](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Cierre](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Duración Total del Curso:** ~10-14 horas | **Progresión de Habilidades:** Principiante → Preparado para Producción

---

## 📚 Capítulos de Aprendizaje

*Selecciona tu ruta de aprendizaje según nivel de experiencia y objetivos*

### 🚀 Capítulo 1: Fundamentos y Comienzo Rápido
**Requisitos Previos**: Suscripción a Azure, conocimientos básicos de línea de comandos  
**Duración**: 30-45 minutos  
**Complejidad**: ⭐

#### Qué Aprenderás
- Fundamentos del Azure Developer CLI
- Instalación de AZD en tu plataforma
- Tu primer despliegue exitoso

#### Recursos de Aprendizaje
- **🎯 Comienza Aquí**: [¿Qué es Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoría**: [Conceptos Básicos de AZD](docs/chapter-01-foundation/azd-basics.md) - Conceptos y terminología clave
- **⚙️ Configuración**: [Instalación & Configuración](docs/chapter-01-foundation/installation.md) - Guías específicas de plataforma
- **🛠️ Práctica**: [Tu Primer Proyecto](docs/chapter-01-foundation/first-project.md) - Tutorial paso a paso
- **📋 Referencia Rápida**: [Hoja de Comandos](resources/cheat-sheet.md)

#### Ejercicios Prácticos
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Resultado del Capítulo**: Desplegar exitosamente una aplicación web sencilla en Azure usando AZD

**✅ Validación del Éxito:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Tiempo Estimado:** 30-45 minutos  
**📈 Nivel de Habilidad Después:** Puede desplegar aplicaciones básicas de forma independiente
**📈 Nivel de Habilidad Después:** Puede desplegar aplicaciones básicas de forma independiente

---

### 🤖 Capítulo 2: Desarrollo IA-First (Recomendado para Desarrolladores de IA)
**Requisitos Previos**: Capítulo 1 completado  
**Duración**: 1-2 horas  
**Complejidad**: ⭐⭐

#### Qué Aprenderás
- Integración Microsoft Foundry con AZD
- Despliegue de aplicaciones potenciadas con IA
- Configuraciones de servicios de IA

#### Recursos de Aprendizaje
- **🎯 Comienza Aquí**: [Integración Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agentes IA**: [Guía de Agentes IA](docs/chapter-02-ai-development/agents.md) - Despliega agentes inteligentes con AZD
- **📖 Patrones**: [Despliegue de Modelos IA](docs/chapter-02-ai-development/ai-model-deployment.md) - Despliega y gestiona modelos IA
- **🛠️ Taller**: [Laboratorio Taller IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Prepara tus soluciones IA con AZD
- **🎥 Guía Interactiva**: [Materiales del Taller](workshop/README.md) - Aprendizaje en navegador con MkDocs * Entorno DevContainer
- **📋 Plantillas**: [Plantillas Microsoft Foundry](#featured-microsoft-foundry-templates)
- **📝 Ejemplos**: [Ejemplos de Despliegue AZD](examples/README.md)

#### Ejercicios Prácticos
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Resultado del Capítulo**: Desplegar y configurar una aplicación de chat potencia por IA con capacidades RAG

**✅ Validación del Éxito:**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 Tiempo Estimado:** 1-2 horas  
**📈 Nivel de Habilidad Después:** Puede desplegar y configurar aplicaciones IA listas para producción  
**💰 Conciencia de Costos:** Entiende costos de desarrollo $80-150/mes, costos de producción $300-3500/mes

#### 💰 Consideraciones de Costos para Despliegues IA

**Ambiente de Desarrollo (Estimado $80-150/mes):**
- Modelos Microsoft Foundry (Pago por uso): $0-50/mes (según uso de tokens)
- Búsqueda AI (nivel Básico): $75/mes
- Aplicaciones en Contenedor (Consumo): $0-20/mes
- Almacenamiento (Estándar): $1-5/mes

**Ambiente de Producción (Estimado $300-3,500+/mes):**
- Modelos Microsoft Foundry (PTU para rendimiento consistente): $3,000+/mes O pagar por uso con volumen alto
- Búsqueda AI (nivel Estándar): $250/mes
- Aplicaciones en Contenedor (Dedicado): $50-100/mes
- Application Insights: $5-50/mes
- Almacenamiento (Premium): $10-50/mes

**💡 Consejos para Optimización de Costos:**
- Usa modelos Microsoft Foundry de **Nivel Gratuito** para aprendizaje (Azure OpenAI incluye 50,000 tokens/mes)
- Ejecuta `azd down` para desalocar recursos cuando no estés desarrollando activamente
- Comienza con facturación basada en consumo, solo actualiza a PTU para producción
- Usa `azd provision --preview` para estimar costos antes del despliegue
- Habilita autoescalado: paga solo por el uso real

**Monitoreo de Costos:**
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capítulo 3: Configuración y Autenticación
**Requisitos Previos**: Capítulo 1 completado  
**Duración**: 45-60 minutos  
**Complejidad**: ⭐⭐

#### Qué Aprenderás
- Configuración y gestión de entornos
- Mejores prácticas de autenticación y seguridad
- Nomenclatura y organización de recursos

#### Recursos de Aprendizaje
- **📖 Configuración**: [Guía de Configuración](docs/chapter-03-configuration/configuration.md) - Preparación del entorno
- **🔐 Seguridad**: [Patrones de autenticación e identidad administrada](docs/chapter-03-configuration/authsecurity.md) - Patrones de autenticación
- **📝 Ejemplos**: [Ejemplo de Aplicación de Base de Datos](examples/database-app/README.md) - Ejemplos AZD de base de datos

#### Ejercicios Prácticos
- Configurar múltiples entornos (desarrollo, pruebas, producción)
- Configurar autenticación con identidad administrada
- Implementar configuraciones específicas para cada entorno

**💡 Resultado del Capítulo**: Gestionar múltiples entornos con autenticación y seguridad adecuadas

---

### 🏗️ Capítulo 4: Infraestructura como Código y Despliegue
**Requisitos Previos**: Capítulos 1-3 completados  
**Duración**: 1-1.5 horas  
**Complejidad**: ⭐⭐⭐

#### Qué Aprenderás
- Patrones avanzados de despliegue
- Infraestructura como Código con Bicep
- Estrategias de aprovisionamiento de recursos

#### Recursos de Aprendizaje
- **📖 Despliegue**: [Guía de Despliegue](docs/chapter-04-infrastructure/deployment-guide.md) - Flujo de trabajo completo
- **🏗️ Aprovisionamiento**: [Aprovisionamiento de Recursos](docs/chapter-04-infrastructure/provisioning.md) - Gestión de recursos en Azure
- **📝 Ejemplos**: [Ejemplo de Aplicación en Contenedor](../../examples/container-app) - Despliegues con contenedores

#### Ejercicios Prácticos
- Crear plantillas Bicep personalizadas
- Desplegar aplicaciones multi-servicio
- Implementar estrategias de despliegue blue-green

**💡 Resultado del Capítulo**: Desplegar aplicaciones complejas multi-servicio usando plantillas de infraestructura personalizadas

---

### 🎯 Capítulo 5: Soluciones Multi-Agente de IA (Avanzado)
**Requisitos Previos**: Capítulos 1-2 completados  
**Duración**: 2-3 horas  
**Complejidad**: ⭐⭐⭐⭐

#### Qué Aprenderás
- Patrones arquitectónicos multi-agente
- Orquestación y coordinación de agentes
- Despliegues IA listos para producción

#### Recursos de Aprendizaje
- **🤖 Proyecto Destacado**: [Solución Multi-Agente para Retail](examples/retail-scenario.md) - Implementación completa
- **🛠️ Plantillas ARM**: [Paquete de Plantillas ARM](../../examples/retail-multiagent-arm-template) - Despliegue con un clic
- **📖 Arquitectura**: [Patrones de coordinación multi-agente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patrones

#### Ejercicios Prácticos
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Resultado del Capítulo**: Desplegar y gestionar una solución IA multi-agente lista para producción con agentes de Clientes e Inventario

---

### 🔍 Capítulo 6: Validación y Planificación Previa al Despliegue
**Requisitos Previos**: Capítulo 4 completado  
**Duración**: 1 hora  
**Complejidad**: ⭐⭐

#### Qué Aprenderás
- Planificación de capacidad y validación de recursos
- Estrategias de selección de SKU
- Chequeos previos y automatización

#### Recursos de Aprendizaje
- **📊 Planificación**: [Capacidad de Planificación](docs/chapter-06-pre-deployment/capacity-planning.md) - Validación de recursos
- **💰 Selección**: [Selección de SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Elecciones rentables
- **✅ Validación**: [Verificaciones previas](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatizados

#### Ejercicios Prácticos
- Ejecutar scripts de validación de capacidad
- Optimizar selecciones de SKU para el costo
- Implementar verificaciones automatizadas antes del despliegue

**💡 Resultado del Capítulo**: Validar y optimizar despliegues antes de la ejecución

---

### 🚨 Capítulo 7: Solución de Problemas y Depuración
**Requisitos Previos**: Cualquier capítulo de despliegue completado  
**Duración**: 1-1.5 horas  
**Complejidad**: ⭐⭐

#### Qué Aprenderás
- Enfoques sistemáticos para depuración
- Problemas comunes y soluciones
- Solución de problemas específica para IA

#### Recursos de Aprendizaje
- **🔧 Problemas Comunes**: [Problemas Comunes](docs/chapter-07-troubleshooting/common-issues.md) - FAQ y soluciones
- **🕵️ Depuración**: [Guía de Depuración](docs/chapter-07-troubleshooting/debugging.md) - Estrategias paso a paso
- **🤖 Problemas con IA**: [Solución de Problemas Específica para IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemas con servicios de IA

#### Ejercicios Prácticos
- Diagnosticar fallos de despliegue
- Resolver problemas de autenticación
- Depurar conectividad de servicios de IA

**💡 Resultado del Capítulo**: Diagnosticar y resolver de forma independiente problemas comunes de despliegue

---

### 🏢 Capítulo 8: Patrones de Producción y Empresariales
**Requisitos Previos**: Capítulos 1-4 completados  
**Duración**: 2-3 horas  
**Complejidad**: ⭐⭐⭐⭐

#### Qué Aprenderás
- Estrategias de despliegue en producción
- Patrones de seguridad empresarial
- Monitoreo y optimización de costos

#### Recursos de Aprendizaje
- **🏭 Producción**: [Mejores Prácticas para IA en Producción](docs/chapter-08-production/production-ai-practices.md) - Patrones empresariales
- **📝 Ejemplos**: [Ejemplo de Microservicios](../../examples/microservices) - Arquitecturas complejas
- **📊 Monitoreo**: [Integración de Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitoreo

#### Ejercicios Prácticos
- Implementar patrones de seguridad empresarial
- Configurar monitoreo integral
- Desplegar en producción con gobernanza adecuada

**💡 Resultado del Capítulo**: Desplegar aplicaciones listas para empresa con capacidades completas de producción

---

## 🎓 Resumen del Taller: Experiencia de Aprendizaje Práctica

> **⚠️ ESTADO DEL TALLER: Desarrollo Activo**  
> Los materiales del taller están siendo desarrollados y refinados actualmente. Los módulos principales funcionan, pero algunas secciones avanzadas están incompletas. Estamos trabajando activamente para completar todo el contenido. [Seguir progreso →](workshop/README.md)

### Materiales Interactivos del Taller
**Aprendizaje práctico integral con herramientas basadas en navegador y ejercicios guiados**

Nuestros materiales brindan una experiencia de aprendizaje interactiva y estructurada que complementa el currículo basado en capítulos anterior. El taller está diseñado tanto para aprendizaje autodirigido como para sesiones con instructor.

#### 🛠️ Características del Taller
- **Interfaz basada en navegador**: Taller completo potenciado por MkDocs con búsqueda, copia y funciones de tema
- **Integración con GitHub Codespaces**: Configuración del entorno de desarrollo con un clic
- **Ruta de Aprendizaje Estructurada**: Ejercicios guiados en 8 módulos (3-4 horas en total)
- **Metodología Progresiva**: Introducción → Selección → Validación → Deconstrucción → Configuración → Personalización → Desmontaje → Resumen
- **Entorno DevContainer Interactivo**: Herramientas y dependencias preconfiguradas

#### 📚 Estructura de Módulos del Taller
El taller sigue una **metodología progresiva de 8 módulos** que te lleva desde el descubrimiento hasta la maestría en despliegue:

| Módulo | Tema | Qué Harás | Duración |
|--------|-------|----------------|----------|
| **0. Introducción** | Resumen del Taller | Entender objetivos de aprendizaje, requisitos previos y estructura del taller | 15 min |
| **1. Selección** | Descubrimiento de Plantillas | Explorar plantillas AZD y seleccionar la plantilla AI adecuada para tu escenario | 20 min |
| **2. Validación** | Desplegar y Verificar | Desplegar la plantilla con `azd up` y validar que la infraestructura funciona | 30 min |
| **3. Deconstrucción** | Entender la Estructura | Usar GitHub Copilot para explorar la arquitectura de la plantilla, archivos Bicep y organización del código | 30 min |
| **4. Configuración** | Profundización en azure.yaml | Dominar la configuración `azure.yaml`, hooks del ciclo de vida y variables de entorno | 30 min |
| **5. Personalización** | Hazlo Tuyo | Habilitar Búsqueda AI, trazabilidad, evaluación y personalizar para tu escenario | 45 min |
| **6. Desmontaje** | Limpieza | Desprovisionar recursos de forma segura con `azd down --purge` | 15 min |
| **7. Resumen** | Próximos Pasos | Revisar logros, conceptos clave y continuar tu camino de aprendizaje | 15 min |

**Flujo del Taller:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Comenzando con el Taller
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Resultados de Aprendizaje del Taller
Al completar el taller, los participantes:
- **Desplegar Aplicaciones AI en Producción**: Usar AZD con servicios Microsoft Foundry
- **Dominar Arquitecturas Multi-Agente**: Implementar soluciones coordinadas de agentes AI
- **Implementar Mejores Prácticas de Seguridad**: Configurar autenticación y control de acceso
- **Optimizar para Escala**: Diseñar despliegues rentables y de alto rendimiento
- **Solucionar Problemas de Despliegue**: Resolver problemas comunes de forma independiente

#### 📖 Recursos del Taller
- **🎥 Guía Interactiva**: [Materiales del Taller](workshop/README.md) - Entorno de aprendizaje basado en navegador
- **📋 Instrucciones Módulo a Módulo**:
  - [0. Introducción](workshop/docs/instructions/0-Introduction.md) - Resumen y objetivos del taller
  - [1. Selección](workshop/docs/instructions/1-Select-AI-Template.md) - Buscar y seleccionar plantillas AI
  - [2. Validación](workshop/docs/instructions/2-Validate-AI-Template.md) - Desplegar y verificar plantillas
  - [3. Deconstrucción](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorar arquitectura de plantillas
  - [4. Configuración](workshop/docs/instructions/4-Configure-AI-Template.md) - Dominar azure.yaml
  - [5. Personalización](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizar para tu escenario
  - [6. Desmontaje](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Limpiar recursos
  - [7. Resumen](workshop/docs/instructions/7-Wrap-up.md) - Revisión y próximos pasos
- **🛠️ Laboratorio del Taller AI**: [Laboratorio AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Ejercicios enfocados en IA
- **💡 Inicio Rápido**: [Guía de Configuración del Taller](workshop/README.md#quick-start) - Configuración del entorno

**Perfecto para**: Capacitación corporativa, cursos universitarios, aprendizaje autodirigido y bootcamps para desarrolladores.

---

## 📖 Profundización: Capacidades de AZD

Más allá de lo básico, AZD ofrece funciones potentes para despliegues en producción:

- **Despliegues basados en plantillas** - Usar plantillas preconstruidas para patrones comunes de aplicaciones
- **Infraestructura como Código** - Gestionar recursos Azure usando Bicep o Terraform  
- **Flujos de trabajo integrados** - Provisionar, desplegar y monitorear aplicaciones sin interrupciones
- **Amigable para desarrolladores** - Optimizado para productividad y experiencia del desarrollador

### **AZD + Microsoft Foundry: Perfecto para Despliegues AI**

**¿Por qué AZD para soluciones de IA?** AZD aborda los principales desafíos que enfrentan los desarrolladores de IA:

- **Plantillas listas para IA** - Plantillas preconfiguradas para Microsoft Foundry Models, servicios Azure AI y cargas ML
- **Despliegues seguros de IA** - Patrones de seguridad incorporados para servicios IA, claves API y endpoints de modelos  
- **Patrones de IA para producción** - Mejores prácticas para despliegues escalables y rentables de aplicaciones IA
- **Flujos de trabajo IA de extremo a extremo** - Desde desarrollo de modelos hasta despliegue en producción con monitoreo adecuado
- **Optimización de Costos** - Asignación inteligente de recursos y estrategias de escalado para cargas IA
- **Integración con Microsoft Foundry** - Conexión fluida con catálogo y endpoints de modelos Microsoft Foundry

---

## 🎯 Biblioteca de Plantillas y Ejemplos

### Destacados: Plantillas Microsoft Foundry
**¡Comienza aquí si vas a desplegar aplicaciones IA!**

> **Nota:** Estas plantillas muestran varios patrones IA. Algunas son muestras externas de Azure, otras implementaciones locales.

| Plantilla | Capítulo | Complejidad | Servicios | Tipo |
|----------|---------|------------|----------|------|
| [**Empezar con chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externa |
| [**Empezar con agentes AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capítulo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externa |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externa |
| [**Inicio Rápido App Chat OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externa |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externa |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externa |
| [**Solución Retail Multi-Agente**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Destacados: Escenarios Completos de Aprendizaje
**Plantillas de aplicaciones listas para producción mapeadas a capítulos de aprendizaje**

| Plantilla | Capítulo de Aprendizaje | Complejidad | Aprendizaje Clave |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | Patrones básicos de despliegue IA |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | Implementación RAG con Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capítulo 4 | ⭐⭐ | Integración de Inteligencia de Documentos |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | Framework de agentes y llamadas a funciones |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐ | Orquestación AI empresarial |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | Arquitectura multi-agente con agentes de Cliente e Inventario |

### Aprender por Tipo de Ejemplo

> **📌 Ejemplos Locales vs. Externos:**  
> **Ejemplos Locales** (en este repositorio) = Listos para usar inmediatamente  
> **Ejemplos Externos** (Muestras Azure) = Clonar desde repositorios enlazados

#### Ejemplos Locales (Listos para Usar)
- [**Solución Retail Multi-Agente**](examples/retail-scenario.md) - Implementación completa lista para producción con plantillas ARM
  - Arquitectura multi-agente (Agentes Cliente + Inventario)
  - Monitoreo y evaluación integral
  - Despliegue con un clic a través de plantilla ARM

#### Ejemplos Locales - Aplicaciones Contenedor (Capítulos 2-5)
**Ejemplos completos de despliegue de contenedores en este repositorio:**
- [**Ejemplos de Aplicaciones Contenedor**](examples/container-app/README.md) - Guía completa para despliegues conteinerizados
  - [API Flask Simple](../../examples/container-app/simple-flask-api) - API REST básica con escala a cero
  - [Arquitectura de Microservicios](../../examples/container-app/microservices) - Despliegue multi-servicio listo para producción
  - Patrones de inicio rápido, producción y avanzados
  - Guía de monitoreo, seguridad y optimización de costos

#### Ejemplos Externos - Aplicaciones Simples (Capítulos 1-2)
**Clona estos repositorios de muestras Azure para comenzar:**
- [Aplicación Web Simple - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Patrones básicos de despliegue
- [Sitio Web Estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Despliegue de contenido estático
- [Aplicación Contenedor - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Despliegue API REST

#### Ejemplos Externos - Integración de Base de Datos (Capítulos 3-4)  
- [Aplicación Base de Datos - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Patrones de conectividad de base de datos
- [Funciones + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flujo de trabajo de datos sin servidor

#### Ejemplos Externos - Patrones Avanzados (Capítulos 4-8)
- [Microservicios Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arquitecturas multi-servicio
- [Trabajos en Aplicaciones Contenedor](https://github.com/Azure-Samples/container-apps-jobs) - Procesamiento en segundo plano  
- [Pipeline ML Empresarial](https://github.com/Azure-Samples/mlops-v2) - Patrones ML listos para producción

### Colecciones de Plantillas Externas
- [**Galería Oficial de Plantillas AZD**](https://azure.github.io/awesome-azd/) - Colección curada de plantillas oficiales y comunitarias
- [**Plantillas Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentación de plantillas Microsoft Learn
- [**Directorio de Ejemplos**](examples/README.md) - Ejemplos locales de aprendizaje con explicaciones detalladas

---

## 📚 Recursos y Referencias de Aprendizaje

### Referencias Rápidas
- [**Hoja de trucos de comandos**](resources/cheat-sheet.md) - Comandos esenciales de azd organizados por capítulo
- [**Glosario**](resources/glossary.md) - Terminología de Azure y azd  
- [**Preguntas frecuentes**](resources/faq.md) - Preguntas comunes organizadas por capítulo de aprendizaje
- [**Guía de estudio**](resources/study-guide.md) - Ejercicios prácticos integrales

### Talleres prácticos
- [**Laboratorio de taller de IA**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Haz que tus soluciones de IA sean desplegables con AZD (2-3 horas)
- [**Taller interactivo**](workshop/README.md) - Ejercicios guiados de 8 módulos con MkDocs y GitHub Codespaces
  - Sigue: Introducción → Selección → Validación → Deconstrucción → Configuración → Personalización → Desmontaje → Resumen

### Recursos externos de aprendizaje
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitectura de Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculadora de precios de Azure](https://azure.microsoft.com/pricing/calculator/)
- [Estado de Azure](https://status.azure.com/)

### Habilidades de agentes de IA para tu editor
- [**Habilidades de Microsoft Azure en skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 habilidades abiertas de agente para Azure IA, Foundry, implementación, diagnósticos, optimización de costos y más. Instálalas en GitHub Copilot, Cursor, Claude Code o cualquier agente compatible:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guía rápida de solución de problemas

**Problemas comunes que enfrentan los principiantes y soluciones inmediatas:**

<details>
<summary><strong>❌ "azd: comando no encontrado"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "No se encontró suscripción" o "Suscripción no establecida"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" o "Cupo excedido"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" falla a mitad del proceso</strong></summary>

```bash
# Option 1: Clean and retry
azd down --force --purge
azd up

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autenticación fallida" o "Token expirado"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "El recurso ya existe" o conflictos de nombre</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ La implementación de la plantilla está tardando demasiado</strong></summary>

**Tiempos de espera normales:**
- Aplicación web simple: 5-10 minutos
- Aplicación con base de datos: 10-15 minutos
- Aplicaciones de IA: 15-25 minutos (la provisión de OpenAI es lenta)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Permiso denegado" o "Prohibido"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ No se puede encontrar la URL de la aplicación desplegada</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Recursos completos para solución de problemas

- **Guía de problemas comunes:** [Soluciones detalladas](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemas específicos de IA:** [Solución de problemas de IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guía de depuración:** [Depuración paso a paso](docs/chapter-07-troubleshooting/debugging.md)
- **Obtén ayuda:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Finalización del curso y certificación

### Seguimiento del progreso
Realiza un seguimiento de tu progreso de aprendizaje a través de cada capítulo:

- [ ] **Capítulo 1**: Fundamentos y inicio rápido ✅
- [ ] **Capítulo 2**: Desarrollo enfocado en IA ✅  
- [ ] **Capítulo 3**: Configuración y autenticación ✅
- [ ] **Capítulo 4**: Infraestructura como código y despliegue ✅
- [ ] **Capítulo 5**: Soluciones múltiples con agentes de IA ✅
- [ ] **Capítulo 6**: Validación y planificación previas al despliegue ✅
- [ ] **Capítulo 7**: Solución de problemas y depuración ✅
- [ ] **Capítulo 8**: Patrones de producción y empresariales ✅

### Verificación del aprendizaje
Después de completar cada capítulo, verifica tus conocimientos mediante:
1. **Ejercicio práctico**: Completa el despliegue práctico del capítulo
2. **Chequeo de conocimientos**: Revisa la sección de preguntas frecuentes de tu capítulo
3. **Discusión comunitaria**: Comparte tu experiencia en Azure Discord
4. **Siguiente capítulo**: Avanza al siguiente nivel de complejidad

### Beneficios de completar el curso
Al completar todos los capítulos, tendrás:
- **Experiencia en producción**: Aplicaciones reales de IA desplegadas en Azure
- **Habilidades profesionales**: Capacidades de despliegue listas para empresas  
- **Reconocimiento comunitario**: Miembro activo de la comunidad de desarrolladores de Azure
- **Avance profesional**: Experiencia demandada en AZD y despliegue de IA

---

## 🤝 Comunidad y soporte

### Obtén ayuda y soporte
- **Problemas técnicos**: [Reporta errores y solicita funciones](https://github.com/microsoft/azd-for-beginners/issues)
- **Preguntas de aprendizaje**: [Comunidad Microsoft Azure Discord](https://discord.gg/microsoft-azure) y [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ayuda específica de IA**: Únete al [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentación**: [Documentación oficial de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Perspectivas comunitarias desde Microsoft Foundry Discord

**Resultados recientes de la encuesta del canal #Azure:**
- **45%** de los desarrolladores quieren usar AZD para cargas de trabajo de IA
- **Principales desafíos:** Despliegues multi-servicio, gestión de credenciales, preparación para producción  
- **Más solicitados:** Plantillas específicas para IA, guías de solución de problemas, mejores prácticas

**Únete a nuestra comunidad para:**
- Compartir tus experiencias con AZD + IA y obtener ayuda
- Acceder a vistas previas tempranas de nuevas plantillas de IA
- Contribuir a las mejores prácticas de despliegue de IA
- Influir en el desarrollo futuro de características de IA + AZD

### Contribuir al curso
¡Damos la bienvenida a las contribuciones! Por favor lee nuestra [Guía de contribución](CONTRIBUTING.md) para detalles sobre:
- **Mejoras de contenido**: Mejorar capítulos y ejemplos existentes
- **Nuevos ejemplos**: Agregar escenarios y plantillas del mundo real  
- **Traducción**: Ayudar a mantener soporte multilingüe
- **Informes de errores**: Mejorar precisión y claridad
- **Normas comunitarias**: Seguir nuestras directrices comunitarias inclusivas

---

## 📄 Información del curso

### Licencia
Este proyecto está licenciado bajo la Licencia MIT - consulta el archivo [LICENSE](../../LICENSE) para más detalles.

### Recursos de aprendizaje relacionados de Microsoft

Nuestro equipo produce otros cursos de aprendizaje completos:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j para principiantes](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js para principiantes](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain para principiantes](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agentes
[![AZD para principiantes](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI para principiantes](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP para principiantes](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Agentes de IA para principiantes](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serie de IA generativa
[![IA generativa para principiantes](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![IA generativa (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![IA generativa (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![IA generativa (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Aprendizaje básico
[![ML para principiantes](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Ciencia de datos para principiantes](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![IA para principiantes](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Ciberseguridad para principiantes](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Desarrollo web para principiantes](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT para principiantes](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Desarrollo XR para principiantes](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serie Copilot
[![Copilot para programación en pareja con IA](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot para C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Aventura Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navegación del curso

**🚀 ¿Listo para comenzar a aprender?**

**Principiantes**: Comienza con [Capítulo 1: Fundamentos e inicio rápido](#-chapter-1-foundation--quick-start)  
**Desarrolladores de IA**: Salta a [Capítulo 2: Desarrollo enfocado en IA](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Desarrolladores experimentados**: Inicia con [Capítulo 3: Configuración y autenticación](#️-chapter-3-configuration--authentication)

**Próximos pasos**: [Comenzar Capítulo 1 - Conceptos básicos de AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
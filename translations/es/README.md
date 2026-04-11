# AZD For Beginners: A Structured Learning Journey

![AZD-para-principiantes](../../translated_images/es/azdbeginners.5527441dd9f74068.webp) 

[![Observadores de GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forks en GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Estrellas en GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord de Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord de Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traducciones Automatizadas (Siempre Actualizadas)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Árabe](../ar/README.md) | [Bengalí](../bn/README.md) | [Búlgaro](../bg/README.md) | [Birmano (Myanmar)](../my/README.md) | [Chino (Simplificado)](../zh-CN/README.md) | [Chino (Tradicional, Hong Kong)](../zh-HK/README.md) | [Chino (Tradicional, Macau)](../zh-MO/README.md) | [Chino (Tradicional, Taiwán)](../zh-TW/README.md) | [Croata](../hr/README.md) | [Checo](../cs/README.md) | [Danés](../da/README.md) | [Neerlandés](../nl/README.md) | [Estonio](../et/README.md) | [Finés](../fi/README.md) | [Francés](../fr/README.md) | [Alemán](../de/README.md) | [Griego](../el/README.md) | [Hebreo](../he/README.md) | [Hindi](../hi/README.md) | [Húngaro](../hu/README.md) | [Indonesio](../id/README.md) | [Italiano](../it/README.md) | [Japonés](../ja/README.md) | [Kannada](../kn/README.md) | [Camboyano (Khmer)](../km/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Maratí](../mr/README.md) | [Nepalí](../ne/README.md) | [Pidgin Nigeriano](../pcm/README.md) | [Noruego](../no/README.md) | [Persa (Farsi)](../fa/README.md) | [Polaco](../pl/README.md) | [Portugués (Brasil)](../pt-BR/README.md) | [Portugués (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumano](../ro/README.md) | [Ruso](../ru/README.md) | [Serbio (Cirílico)](../sr/README.md) | [Eslovaco](../sk/README.md) | [Esloveno](../sl/README.md) | [Español](./README.md) | [Swahili](../sw/README.md) | [Sueco](../sv/README.md) | [Tagalo (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Tailandés](../th/README.md) | [Turco](../tr/README.md) | [Ucraniano](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **¿Prefieres clonar localmente?**
>
> Este repositorio incluye más de 50 traducciones de idiomas, lo que aumenta significativamente el tamaño de descarga. Para clonar sin las traducciones, usa sparse checkout:
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

## 🆕 Qué hay de nuevo en azd hoy

Azure Developer CLI ha crecido más allá de las aplicaciones web y APIs tradicionales. Hoy, azd es la herramienta única para desplegar cualquier aplicación en Azure, incluidas aplicaciones potenciadas por IA y agentes inteligentes.

Esto es lo que significa para ti:

- **Los agentes de IA ahora son cargas de trabajo de azd de primera clase.** Puedes inicializar, desplegar y gestionar proyectos de agentes de IA usando el mismo flujo de trabajo `azd init` → `azd up` que ya conoces.
- **La integración con Microsoft Foundry** trae despliegue de modelos, hosting de agentes y configuración de servicios de IA directamente al ecosistema de plantillas de azd.
- **El flujo de trabajo principal no ha cambiado.** Ya sea que despliegues una app de tareas, un microservicio o una solución de IA con múltiples agentes, los comandos son los mismos.

Si ya has usado azd antes, el soporte para IA es una extensión natural, no una herramienta separada ni una vía avanzada. Si comienzas desde cero, aprenderás un flujo de trabajo que funciona para todo.

---

## 🚀 ¿Qué es Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** es una herramienta de línea de comandos amigable para desarrolladores que facilita desplegar aplicaciones en Azure. En lugar de crear y conectar manualmente docenas de recursos de Azure, puedes desplegar aplicaciones completas con un solo comando.

### La magia de `azd up`

```bash
# Este único comando hace todo:
# ✅ Crea todos los recursos de Azure
# ✅ Configura la red y la seguridad
# ✅ Construye el código de tu aplicación
# ✅ Despliega en Azure
# ✅ Te proporciona una URL funcional
azd up
```

**¡Eso es todo!** Sin clics en el Portal de Azure, sin plantillas ARM complejas que aprender primero, sin configuración manual: solo aplicaciones funcionando en Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: ¿Cuál es la diferencia?

Esta es la pregunta más común que hacen los principiantes. Aquí está la respuesta sencilla:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Administrar recursos individuales de Azure | Desplegar aplicaciones completas |
| **Mindset** | Enfocado en la infraestructura | Enfocado en la aplicación |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Debes conocer los servicios de Azure | Solo conoce tu aplicación |
| **Best For** | DevOps, Infraestructura | Desarrolladores, Prototipado |

### Analogía simple

- **Azure CLI** es como tener todas las herramientas para construir una casa: martillos, sierras, clavos. Puedes construir cualquier cosa, pero necesitas saber de construcción.
- **Azure Developer CLI** es como contratar a un contratista: describes lo que quieres y ellos se encargan de la construcción.

### Cuándo usar cada uno

| Scenario | Use This |
|----------|----------|
| "Quiero desplegar mi aplicación web rápidamente" | `azd up` |
| "Necesito crear solo una cuenta de almacenamiento" | `az storage account create` |
| "Estoy construyendo una aplicación completa de IA" | `azd init --template azure-search-openai-demo` |
| "Necesito depurar un recurso específico de Azure" | `az resource show` |
| "Quiero un despliegue listo para producción en minutos" | `azd up --environment production` |

### ¡Trabajan juntos!

AZD usa Azure CLI en segundo plano. Puedes usar ambos:
```bash
# Despliega tu aplicación con AZD
azd up

# Luego ajusta recursos específicos con Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Encuentra plantillas en Awesome AZD

¡No empieces desde cero! **Awesome AZD** es la colección comunitaria de plantillas listas para desplegar:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Explora más de 200 plantillas con despliegue de un solo clic |
| 🔗 [**Enviar una plantilla**](https://github.com/Azure/awesome-azd/issues) | Contribuye con tu propia plantilla a la comunidad |
| 🔗 [**Repositorio en GitHub**](https://github.com/Azure/awesome-azd) | Dale una estrella y explora el código fuente |

### Plantillas populares de IA en Awesome AZD

```bash
# Chat RAG con modelos Microsoft Foundry + búsqueda de IA
azd init --template azure-search-openai-demo

# Aplicación rápida de chat con IA
azd init --template openai-chat-app-quickstart

# Agentes de IA con agentes Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Comenzando en 3 pasos

Antes de empezar, asegúrate de que tu máquina esté lista para la plantilla que deseas desplegar:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Si alguna verificación requerida falla, soluciona eso primero y luego continúa con el inicio rápido.

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
# Opcional si planeas usar comandos de Azure CLI directamente en este curso
az login

# Requerido para flujos de trabajo de AZD
azd auth login
```

Si no estás seguro de cuál necesitas, sigue el flujo completo de configuración en [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Paso 3: Despliega tu primera app

```bash
# Inicializar desde una plantilla
azd init --template todo-nodejs-mongo

# Desplegar en Azure (¡crea todo!)
azd up
```

**🎉 ¡Eso es todo!** Tu aplicación ya está en vivo en Azure.

### Limpieza (¡No lo olvides!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cómo usar este curso

Este curso está diseñado para el aprendizaje progresivo: comienza donde te sientas cómodo y avanza gradualmente:

| Tu experiencia | Comienza aquí |
|-----------------|---------------|
| **Nuevo en Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Conoces Azure, nuevo en AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Quieres desplegar aplicaciones de IA** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Quieres práctica práctica** | [🎓 Interactive Workshop](workshop/README.md) - laboratorio guiado de 3-4 horas |
| **Necesitas patrones para producción** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Configuración rápida

1. **Haz fork de este repositorio**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clónalo**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obtén ayuda**: [Comunidad de Discord de Azure](https://discord.com/invite/ByRwuEEgH4)

> **¿Prefieres clonar localmente?**

> Este repositorio incluye más de 50 traducciones de idiomas, lo que aumenta significativamente el tamaño de descarga. Para clonar sin las traducciones, usa sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Esto te da todo lo que necesitas para completar el curso con una descarga mucho más rápida.


## Descripción del curso

Domina Azure Developer CLI (azd) a través de capítulos estructurados diseñados para el aprendizaje progresivo. **Enfoque especial en el despliegue de aplicaciones de IA con integración de Microsoft Foundry.**

### Por qué este curso es esencial para los desarrolladores modernos

Basado en ideas de la comunidad de Discord de Microsoft Foundry, **el 45% de los desarrolladores quieren usar AZD para cargas de trabajo de IA** pero encuentran desafíos con:
- Arquitecturas complejas de IA con múltiples servicios
- Mejores prácticas de despliegue de IA en producción  
- Integración y configuración de servicios de IA de Azure
- Optimización de costos para cargas de trabajo de IA
- Resolución de problemas específicos de despliegue de IA

### Objetivos de aprendizaje

Al completar este curso estructurado, usted:
- **Dominará los fundamentos de AZD**: conceptos básicos, instalación y configuración
- **Desplegará aplicaciones de IA**: usa AZD con los servicios de Microsoft Foundry
- **Implementará Infraestructura como Código**: gestiona recursos de Azure con plantillas Bicep
- **Solucionará despliegues**: resuelve problemas comunes y depura errores
- **Optimizará para producción**: seguridad, escalado, monitoreo y gestión de costos
- **Construirá soluciones multi-agente**: despliega arquitecturas complejas de IA

## Antes de comenzar: cuentas, acceso y suposiciones

Antes de empezar el Capítulo 1, asegúrate de tener lo siguiente en su lugar. Los pasos de instalación más adelante en esta guía asumen que estos aspectos básicos ya están cubiertos.
- **Una suscripción de Azure**: Puedes usar una suscripción existente del trabajo o de tu cuenta personal, o crear una [prueba gratuita](https://aka.ms/azurefreetrial) para empezar.
- **Permiso para crear recursos de Azure**: Para la mayoría de los ejercicios, deberías tener al menos acceso **Contributor** en la suscripción o grupo de recursos de destino. Algunos capítulos también pueden asumir que puedes crear grupos de recursos, identidades administradas y asignaciones RBAC.
- [**Una cuenta de GitHub**](https://github.com): Esto es útil para bifurcar el repositorio, rastrear tus propios cambios y usar GitHub Codespaces para el taller.
- **Requisitos previos de tiempo de ejecución de plantillas**: Algunas plantillas necesitan herramientas locales como Node.js, Python, Java o Docker. Ejecuta el validador de configuración antes de comenzar para detectar herramientas faltantes pronto.
- **Familiaridad básica con la terminal**: No necesitas ser un experto, pero debes sentirte cómodo ejecutando comandos como `git clone`, `azd auth login`, y `azd up`.

> **¿Trabajas en una suscripción empresarial?**
> Si tu entorno de Azure está gestionado por un administrador, confirma con antelación que puedes desplegar recursos en la suscripción o grupo de recursos que piensas usar. Si no, solicita una suscripción sandbox o acceso Contributor antes de comenzar.

> **¿Nuevo en Azure?**
> Comienza con tu propia prueba de Azure o suscripción pay-as-you-go en https://aka.ms/azurefreetrial para que puedas completar los ejercicios de principio a fin sin esperar aprobaciones a nivel de tenant.

## 🗺️ Mapa del curso: Navegación rápida por capítulo

Cada capítulo tiene un README dedicado con objetivos de aprendizaje, guías rápidas y ejercicios:

| Capítulo | Tema | Lecciones | Duración | Complejidad |
|---------|-------|---------|----------|------------|
| **[Capítulo 1: Fundamentos](docs/chapter-01-foundation/README.md)** | Primeros pasos | [Conceptos básicos de AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalación y configuración](docs/chapter-01-foundation/installation.md) &#124; [Tu primer proyecto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Capítulo 2: Desarrollo de IA](docs/chapter-02-ai-development/README.md)** | Aplicaciones con enfoque en IA | [Integración de Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agentes de IA](docs/chapter-02-ai-development/agents.md) &#124; [Despliegue de modelos de IA](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Taller](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Capítulo 3: Configuración](docs/chapter-03-configuration/README.md)** | Autenticación y seguridad | [Configuración](docs/chapter-03-configuration/configuration.md) &#124; [Autenticación y seguridad](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Capítulo 4: Infraestructura](docs/chapter-04-infrastructure/README.md)** | IaC y despliegue | [Guía de implementación](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Aprovisionamiento](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Capítulo 5: Multi-Agente](docs/chapter-05-multi-agent/README.md)** | Soluciones con agentes de IA | [Escenario minorista](examples/retail-scenario.md) &#124; [Patrones de coordinación](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Capítulo 6: Pre-Despliegue](docs/chapter-06-pre-deployment/README.md)** | Planificación y validación | [Comprobaciones previas](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planificación de capacidad](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Selección de SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Capítulo 7: Resolución de problemas](docs/chapter-07-troubleshooting/README.md)** | Depuración y corrección | [Problemas comunes](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Depuración](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemas de IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Capítulo 8: Producción](docs/chapter-08-production/README.md)** | Patrones empresariales | [Prácticas de producción](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Taller](workshop/README.md)** | Laboratorio práctico | [Introducción](workshop/docs/instructions/0-Introduction.md) &#124; [Selección](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validación](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstrucción](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuración](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalización](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Desmantelamiento](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Cierre](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Duración total del curso:** ~10-14 horas | **Progresión de habilidades:** Principiante → Listo para producción

---

## 📚 Capítulos de aprendizaje

*Selecciona tu ruta de aprendizaje según tu nivel de experiencia y objetivos*

### 🚀 Capítulo 1: Fundamentos y inicio rápido
**Prerequisitos**: suscripción de Azure, conocimiento básico de la línea de comandos  
**Duración**: 30-45 minutos  
**Complejidad**: ⭐

#### Qué aprenderás
- Comprender los fundamentos de Azure Developer CLI
- Instalar AZD en tu plataforma
- Tu primer despliegue exitoso

#### Recursos de aprendizaje
- **🎯 Comienza aquí**: [¿Qué es Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoría**: [Conceptos básicos de AZD](docs/chapter-01-foundation/azd-basics.md) - Conceptos y terminología principales
- **⚙️ Configuración**: [Instalación y configuración](docs/chapter-01-foundation/installation.md) - Guías específicas por plataforma
- **🛠️ Práctico**: [Tu primer proyecto](docs/chapter-01-foundation/first-project.md) - Tutorial paso a paso
- **📋 Referencia rápida**: [Hoja de trucos de comandos](resources/cheat-sheet.md)

#### Ejercicios prácticos
```bash
# Comprobación rápida de la instalación
azd version

# Despliega tu primera aplicación
azd init --template todo-nodejs-mongo
azd up
```

**💡 Resultado del capítulo**: Desplegar con éxito una aplicación web sencilla en Azure usando AZD

**✅ Validación del éxito:**
```bash
# Después de completar el Capítulo 1, deberías poder:
azd version              # Muestra la versión instalada
azd init --template todo-nodejs-mongo  # Inicializa el proyecto
azd up                  # Despliega en Azure
azd show                # Muestra la URL de la aplicación en ejecución
# La aplicación se abre en el navegador y funciona
azd down --force --purge  # Limpia los recursos
```

**📊 Inversión de tiempo:** 30-45 minutos  
**📈 Nivel de habilidad después:** Puede desplegar aplicaciones básicas de forma independiente
**📈 Nivel de habilidad después:** Puede desplegar aplicaciones básicas de forma independiente

---

### 🤖 Capítulo 2: Desarrollo con enfoque en IA (Recomendado para desarrolladores de IA)
**Prerequisitos**: Capítulo 1 completado  
**Duración**: 1-2 horas  
**Complejidad**: ⭐⭐

#### Qué aprenderás
- Integración de Microsoft Foundry con AZD
- Desplegar aplicaciones impulsadas por IA
- Comprender las configuraciones de servicios de IA

#### Recursos de aprendizaje
- **🎯 Comienza aquí**: [Integración de Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agentes de IA**: [Guía de agentes de IA](docs/chapter-02-ai-development/agents.md) - Despliega agentes inteligentes con AZD
- **📖 Patrones**: [Despliegue de modelos de IA](docs/chapter-02-ai-development/ai-model-deployment.md) - Despliega y gestiona modelos de IA
- **🛠️ Taller**: [Laboratorio de IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Prepara tus soluciones de IA para AZD
- **🎥 Guía interactiva**: [Materiales del taller](workshop/README.md) - Aprendizaje basado en navegador con MkDocs * Entorno DevContainer
- **📋 Plantillas**: [Plantillas de Microsoft Foundry](#recursos-del-taller)
- **📝 Ejemplos**: [Ejemplos de despliegue con AZD](examples/README.md)

#### Ejercicios prácticos
```bash
# Despliega tu primera aplicación de IA
azd init --template azure-search-openai-demo
azd up

# Prueba plantillas adicionales de IA
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Resultado del capítulo**: Desplegar y configurar una aplicación de chat impulsada por IA con capacidades RAG

**✅ Validación del éxito:**
```bash
# Después del Capítulo 2, deberías poder:
azd init --template azure-search-openai-demo
azd up
# Probar la interfaz de chat de IA
# Hacer preguntas y obtener respuestas generadas por IA con fuentes
# Verificar que la integración de búsqueda funcione
azd monitor  # Comprobar que Application Insights muestra telemetría
azd down --force --purge
```

**📊 Inversión de tiempo:** 1-2 horas  
**📈 Nivel de habilidad después:** Puede desplegar y configurar aplicaciones de IA listas para producción  
**💰 Conciencia de costes:** Entender los costes de desarrollo de $80-150/mes, y de producción de $300-3500/mes

#### 💰 Consideraciones de costes para despliegues de IA

**Entorno de desarrollo (Estimado $80-150/mes):**
- Microsoft Foundry Models (Pago por uso): $0-50/mes (basado en el uso de tokens)
- AI Search (nivel Básico): $75/mes
- Container Apps (Consumo): $0-20/mes
- Almacenamiento (Estándar): $1-5/mes

**Entorno de producción (Estimado $300-3,500+/mes):**
- Microsoft Foundry Models (PTU para rendimiento consistente): $3,000+/mes O Pago por uso con alto volumen
- AI Search (nivel Estándar): $250/mes
- Container Apps (Dedicado): $50-100/mes
- Application Insights: $5-50/mes
- Almacenamiento (Premium): $10-50/mes

**💡 Consejos para optimizar costes:**
- Usa **nivel gratuito** de Microsoft Foundry Models para aprendizaje (Azure OpenAI 50,000 tokens/mes incluidos)
- Ejecuta `azd down` para desasignar recursos cuando no estés desarrollando activamente
- Comienza con facturación basada en consumo, actualiza a PTU solo para producción
- Usa `azd provision --preview` para estimar costes antes del despliegue
- Habilita el autoescalado: paga solo por el uso real

**Monitoreo de costes:**
```bash
# Comprobar los costos mensuales estimados
azd provision --preview

# Supervisar los costos reales en el Portal de Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capítulo 3: Configuración y autenticación
**Prerequisitos**: Capítulo 1 completado  
**Duración**: 45-60 minutos  
**Complejidad**: ⭐⭐

#### Qué aprenderás
- Configuración y gestión de entornos
- Mejores prácticas de autenticación y seguridad
- Nomenclatura y organización de recursos

#### Recursos de aprendizaje
- **📖 Configuración**: [Guía de configuración](docs/chapter-03-configuration/configuration.md) - Configuración de entornos
- **🔐 Seguridad**: [Patrones de autenticación e identidad administrada](docs/chapter-03-configuration/authsecurity.md) - Patrones de autenticación
- **📝 Ejemplos**: [Ejemplo de aplicación de base de datos](examples/database-app/README.md) - Ejemplos de base de datos con AZD

#### Ejercicios prácticos
- Configurar múltiples entornos (dev, staging, prod)
- Configurar autenticación con identidad administrada
- Implementar configuraciones específicas por entorno

**💡 Resultado del capítulo**: Gestionar múltiples entornos con la autenticación y seguridad adecuadas

---

### 🏗️ Capítulo 4: Infraestructura como Código y Despliegue
**Prerequisitos**: Capítulos 1-3 completados  
**Duración**: 1-1.5 horas  
**Complejidad**: ⭐⭐⭐

#### Qué aprenderás
- Patrones avanzados de despliegue
- Infraestructura como Código con Bicep
- Estrategias de aprovisionamiento de recursos

#### Recursos de aprendizaje
- **📖 Implementación**: [Guía de implementación](docs/chapter-04-infrastructure/deployment-guide.md) - Flujos de trabajo completos
- **🏗️ Aprovisionamiento**: [Aprovisionamiento de recursos](docs/chapter-04-infrastructure/provisioning.md) - Gestión de recursos de Azure
- **📝 Ejemplos**: [Ejemplo de Container App](../../examples/container-app) - Despliegues en contenedores

#### Ejercicios prácticos
- Crear plantillas Bicep personalizadas
- Desplegar aplicaciones multi-servicio
- Implementar estrategias de despliegue blue-green

**💡 Resultado del capítulo**: Desplegar aplicaciones complejas multi-servicio usando plantillas de infraestructura personalizadas

---

### 🎯 Capítulo 5: Soluciones multiagente de IA (Avanzado)
**Prerequisitos**: Capítulos 1-2 completados  
**Duración**: 2-3 horas  
**Complejidad**: ⭐⭐⭐⭐

#### Qué aprenderás
- Patrones de arquitectura multiagente
- Orquestación y coordinación de agentes
- Despliegues de IA listos para producción

#### Recursos de aprendizaje
- **🤖 Proyecto destacado**: [Solución multiagente minorista](examples/retail-scenario.md) - Implementación completa
- **🛠️ Plantillas ARM**: [Paquete de plantillas ARM](../../examples/retail-multiagent-arm-template) - Despliegue con un solo clic
- **📖 Arquitectura**: [Patrones de coordinación multiagente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patrones

#### Ejercicios prácticos
```bash
# Desplegar la solución minorista multiagente completa
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorar configuraciones de agentes
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Resultado del capítulo**: Desplegar y gestionar una solución multiagente de IA lista para producción con agentes de cliente e inventario

---

### 🔍 Capítulo 6: Validación y planificación previas al despliegue
**Prerequisitos**: Capítulo 4 completado  
**Duración**: 1 hora  
**Complejidad**: ⭐⭐
#### Qué Aprenderás
- Planificación de capacidad y validación de recursos
- Estrategias de selección de SKU
- Comprobaciones previas al vuelo y automatización

#### Recursos de Aprendizaje
- **📊 Planificación**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Validación de recursos
- **💰 Selección**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Opciones rentables
- **✅ Validación**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatizados

#### Ejercicios Prácticos
- Ejecutar scripts de validación de capacidad
- Optimizar selecciones de SKU para reducir costos
- Implementar comprobaciones automatizadas previas al despliegue

**💡 Resultado del Capítulo**: Validar y optimizar despliegues antes de la ejecución

---

### 🚨 Capítulo 7: Resolución de Problemas y Depuración
**Requisitos previos**: Cualquier capítulo de despliegue completado  
**Duración**: 1-1.5 horas  
**Complejidad**: ⭐⭐

#### Qué Aprenderás
- Enfoques sistemáticos de depuración
- Problemas comunes y soluciones
- Resolución de problemas específicos de IA

#### Recursos de Aprendizaje
- **🔧 Problemas Comunes**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ y soluciones
- **🕵️ Depuración**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Estrategias paso a paso
- **🤖 Problemas de IA**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemas de servicios de IA

#### Ejercicios Prácticos
- Diagnosticar fallos de despliegue
- Resolver problemas de autenticación
- Depurar la conectividad de servicios de IA

**💡 Resultado del Capítulo**: Diagnosticar y resolver de forma independiente problemas comunes de despliegue

---

### 🏢 Capítulo 8: Patrones de Producción y Empresa
**Requisitos previos**: Capítulos 1-4 completados  
**Duración**: 2-3 horas  
**Complejidad**: ⭐⭐⭐⭐

#### Qué Aprenderás
- Estrategias de despliegue en producción
- Patrones de seguridad empresarial
- Monitorización y optimización de costos

#### Recursos de Aprendizaje
- **🏭 Producción**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Patrones empresariales
- **📝 Ejemplos**: [Microservices Example](../../examples/microservices) - Arquitecturas complejas
- **📊 Monitorización**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitorización

#### Ejercicios Prácticos
- Implementar patrones de seguridad empresarial
- Configurar monitorización integral
- Desplegar en producción con la gobernanza adecuada

**💡 Resultado del Capítulo**: Desplegar aplicaciones listas para empresa con capacidades completas de producción

---

## 🎓 Resumen del Taller: Experiencia de Aprendizaje Práctica

> **⚠️ ESTADO DEL TALLER: Desarrollo Activo**  
> Los materiales del taller están actualmente en desarrollo y refinamiento. Los módulos principales son funcionales, pero algunas secciones avanzadas están incompletas. Estamos trabajando activamente para completar todo el contenido. [Track progress →](workshop/README.md)

### Materiales Interactivos del Taller
**Aprendizaje práctico y estructurado con herramientas basadas en el navegador y ejercicios guiados**

Nuestros materiales del taller proporcionan una experiencia de aprendizaje interactiva y estructurada que complementa el plan de estudios por capítulos anterior. El taller está diseñado tanto para aprendizaje autodirigido como para sesiones dirigidas por un instructor.

#### 🛠️ Características del Taller
- **Interfaz basada en el navegador**: Taller completo impulsado por MkDocs con búsqueda, copia y funciones de tema
- **Integración con GitHub Codespaces**: Entorno de desarrollo con un clic
- **Ruta de aprendizaje estructurada**: 8 módulos guiados (3-4 horas en total)
- **Metodología progresiva**: Introducción → Selección → Validación → Deconstrucción → Configuración → Personalización → Desmontaje → Cierre
- **Entorno DevContainer interactivo**: Herramientas y dependencias preconfiguradas

#### 📚 Estructura de Módulos del Taller
El taller sigue una **metodología progresiva de 8 módulos** que te lleva desde el descubrimiento hasta el dominio del despliegue:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 min |
| **1. Selection** | Template Discovery | Explore AZD templates and select the right AI template for your scenario | 20 min |
| **2. Validation** | Deploy & Verify | Deploy the template with `azd up` and validate infrastructure works | 30 min |
| **3. Deconstruction** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 min |
| **5. Customization** | Make It Yours | Enable AI Search, tracing, evaluation, and customize for your scenario | 45 min |
| **6. Teardown** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 min |
| **7. Wrap-up** | Next Steps | Review accomplishments, key concepts, and continue your learning journey | 15 min |

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
# Opción 1: GitHub Codespaces (Recomendado)
# Haga clic en "Code" → "Create codespace on main" en el repositorio

# Opción 2: Desarrollo local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Siga las instrucciones de configuración en workshop/README.md
```

#### 🎯 Resultados de Aprendizaje del Taller
Al completar el taller, los participantes:
- **Desplegar aplicaciones IA en producción**: Usar AZD con los servicios de Microsoft Foundry
- **Dominar arquitecturas multi-agente**: Implementar soluciones de agentes de IA coordinados
- **Implementar mejores prácticas de seguridad**: Configurar autenticación y control de acceso
- **Optimizar para la escalabilidad**: Diseñar despliegues rentables y de alto rendimiento
- **Solucionar problemas de despliegue**: Resolver problemas comunes de forma independiente

#### 📖 Recursos del Taller
- **🎥 Guía Interactiva**: [Workshop Materials](workshop/README.md) - Entorno de aprendizaje basado en navegador
- **📋 Instrucciones módulo por módulo**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Resumen y objetivos del taller
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Encontrar y seleccionar plantillas de IA
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Desplegar y verificar plantillas
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorar la arquitectura de la plantilla
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Dominar azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizar para tu escenario
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Limpiar recursos
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Revisión y siguientes pasos
- **🛠️ Laboratorio de Taller de IA**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Ejercicios centrados en IA
- **💡 Inicio Rápido**: [Workshop Setup Guide](workshop/README.md#quick-start) - Configuración del entorno

**Perfecto para**: Formación corporativa, cursos universitarios, aprendizaje autodirigido y bootcamps para desarrolladores.

---

## 📖 Profundización: Capacidades de AZD

Más allá de lo básico, AZD ofrece potentes funciones para despliegues en producción:

- **Despliegues basados en plantillas** - Usar plantillas preconstruidas para patrones comunes de aplicaciones
- **Infraestructura como Código** - Gestionar recursos de Azure usando Bicep o Terraform  
- **Flujos de trabajo integrados** - Aprovisionar, desplegar y monitorizar aplicaciones de forma fluida
- **Orientado al desarrollador** - Optimizado para la productividad y la experiencia del desarrollador

### **AZD + Microsoft Foundry: Perfecto para Despliegues de IA**

**¿Por qué AZD para soluciones de IA?** AZD aborda los principales desafíos que enfrentan los desarrolladores de IA:

- **Plantillas listas para IA** - Plantillas preconfiguradas para Microsoft Foundry Models, Cognitive Services y cargas de trabajo de ML
- **Despliegues de IA seguros** - Patrones de seguridad integrados para servicios de IA, claves de API y endpoints de modelos  
- **Patrones de IA para producción** - Mejores prácticas para despliegues escalables y rentables de aplicaciones de IA
- **Flujos de trabajo de IA de extremo a extremo** - Desde el desarrollo de modelos hasta el despliegue en producción con la monitorización adecuada
- **Optimización de costos** - Asignación inteligente de recursos y estrategias de escalado para cargas de trabajo de IA
- **Integración con Microsoft Foundry** - Conexión fluida al catálogo de modelos y endpoints de Microsoft Foundry

---

## 🎯 Biblioteca de Plantillas y Ejemplos

### Destacado: Plantillas de Microsoft Foundry
**¡Comienza aquí si vas a desplegar aplicaciones de IA!**

> **Nota:** Estas plantillas demuestran varios patrones de IA. Algunas son Azure Samples externas, otras son implementaciones locales.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Destacado: Escenarios de Aprendizaje Completos
**Plantillas de aplicaciones listas para producción mapeadas a capítulos de aprendizaje**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Patrones básicos de despliegue de IA |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | Implementación RAG con Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Integración con Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Framework de agentes y llamadas a funciones |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Orquestación de IA empresarial |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Arquitectura multi-agente con agentes de Cliente e Inventario |

### Aprendizaje por Tipo de Ejemplo

> **📌 Ejemplos Locales vs. Externos:**  
> **Ejemplos Locales** (en este repo) = Listos para usar inmediatamente  
> **Ejemplos Externos** (Azure Samples) = Clonar desde los repositorios enlazados

#### Ejemplos Locales (Listos para Usar)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Implementación completa lista para producción con plantillas ARM
  - Arquitectura multi-agente (agentes de Cliente + Inventario)
  - Monitorización y evaluación integrales
  - Despliegue con un solo clic vía plantilla ARM

#### Ejemplos Locales - Aplicaciones en Contenedores (Capítulos 2-5)
**Ejemplos completos de despliegue de contenedores en este repositorio:**
- [**Container App Examples**](examples/container-app/README.md) - Guía completa para despliegues contenerizados
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST básica con scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Despliegue multi-servicio listo para producción
  - Patrones de despliegue Quick Start, Producción y Avanzado
  - Guía de monitorización, seguridad y optimización de costos

#### Ejemplos Externos - Aplicaciones Simples (Capítulos 1-2)
**Clona estos repositorios de Azure Samples para empezar:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Patrones básicos de despliegue
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Despliegue de contenido estático
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Despliegue de API REST

#### Ejemplos Externos - Integración de Bases de Datos (Capítulo 3-4)
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Patrones de conectividad de base de datos
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flujo de trabajo de datos sin servidor

#### External Examples - Advanced Patterns (Chapters 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arquitecturas multi-servicio
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Procesamiento en segundo plano  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Patrones de ML listos para producción

### External Template Collections
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Colección curada de plantillas oficiales y de la comunidad
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentación de plantillas de Microsoft Learn
- [**Examples Directory**](examples/README.md) - Ejemplos locales de aprendizaje con explicaciones detalladas

---

## 📚 Learning Resources & References

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Hoja de referencia de comandos azd esencial organizada por capítulo
- [**Glossary**](resources/glossary.md) - Glosario de Azure y azd  
- [**FAQ**](resources/faq.md) - Preguntas frecuentes organizadas por capítulo de aprendizaje
- [**Study Guide**](resources/study-guide.md) - Ejercicios prácticos exhaustivos

### Hands-On Workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Haz que tus soluciones de IA sean desplegables con AZD (2-3 horas)
- [**Interactive Workshop**](workshop/README.md) - Ejercicios guiados de 8 módulos con MkDocs y GitHub Codespaces
  - Sigue: Introducción → Selección → Validación → Deconstrucción → Configuración → Personalización → Desmontaje → Cierre

### External Learning Resources
- Azure Developer CLI Documentation (https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Azure Architecture Center (https://learn.microsoft.com/en-us/azure/architecture/)
- Azure Pricing Calculator (https://azure.microsoft.com/pricing/calculator/)
- Azure Status (https://status.azure.com/)

### AI Agent Skills for Your Editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 habilidades abiertas para agentes sobre Azure AI, Foundry, despliegue, diagnóstico, optimización de costes y más. Instálalas en GitHub Copilot, Cursor, Claude Code o cualquier agente compatible:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Quick Troubleshooting Guide

**Problemas comunes que enfrentan los principiantes y soluciones inmediatas:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Instale AZD primero
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verifique la instalación
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Listar suscripciones disponibles
az account list --output table

# Establecer suscripción predeterminada
az account set --subscription "<subscription-id-or-name>"

# Establecer para el entorno AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verificar
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Prueba una región de Azure diferente
azd env set AZURE_LOCATION "westus2"
azd up

# O usa SKUs más pequeñas en desarrollo
# Edita infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Opción 1: Limpiar y reintentar
azd down --force --purge
azd up

# Opción 2: Solo arreglar la infraestructura
azd provision

# Opción 3: Comprobar el estado detallado
azd show

# Opción 4: Consultar los registros en Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Reautenticar para AZD
azd auth logout
azd auth login

# Opcional: actualizar también Azure CLI si está ejecutando comandos az
az logout
az login

# Verificar la autenticación
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD genera nombres únicos, pero si hay conflicto:
azd down --force --purge

# Entonces vuelva a intentarlo con un entorno nuevo
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Tiempos de espera normales:**
- Aplicación web simple: 5-10 minutos
- Aplicación con base de datos: 10-15 minutos
- Aplicaciones de IA: 15-25 minutos (la provisión de OpenAI es lenta)

```bash
# Comprobar el progreso
azd show

# Si se queda atascado más de 30 minutos, consulte el Portal de Azure:
azd monitor --overview
# Busque implementaciones fallidas
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Comprueba tu rol de Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Necesitas al menos el rol "Contributor"
# Pide a tu administrador de Azure que otorgue:
# - Contributor (para recursos)
# - User Access Administrator (para asignaciones de roles)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Mostrar todos los puntos de conexión del servicio
azd show

# O abrir el Portal de Azure
azd monitor

# Comprobar un servicio específico
azd env get-values
# Buscar variables *_URL
```
</details>

### 📚 Full Troubleshooting Resources

- **Common Issues Guide:** [Detailed Solutions](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-Specific Issues:** [AI Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [Step-by-step Debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Get Help:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Course Completion & Certification

### Progress Tracking
Rastrea tu progreso de aprendizaje a través de cada capítulo:

- [ ] **Chapter 1**: Fundamentos y Inicio Rápido ✅
- [ ] **Chapter 2**: Desarrollo con enfoque en IA ✅  
- [ ] **Chapter 3**: Configuración y Autenticación ✅
- [ ] **Chapter 4**: Infraestructura como Código y Despliegue ✅
- [ ] **Chapter 5**: Soluciones de IA Multi-Agente ✅
- [ ] **Chapter 6**: Validación y Planificación Pre-Despliegue ✅
- [ ] **Chapter 7**: Resolución de Problemas y Depuración ✅
- [ ] **Chapter 8**: Patrones de Producción y Empresariales ✅

### Learning Verification
Después de completar cada capítulo, verifica tus conocimientos mediante:
1. **Ejercicio práctico**: Completa el despliegue práctico del capítulo
2. **Comprobación de conocimientos**: Revisa la sección de FAQ de tu capítulo
3. **Discusión comunitaria**: Comparte tu experiencia en Azure Discord
4. **Siguiente capítulo**: Pasa al siguiente nivel de complejidad

### Course Completion Benefits
Al completar todos los capítulos, habrás obtenido:
- **Experiencia en producción**: Desplegado aplicaciones reales de IA en Azure
- **Habilidades profesionales**: Capacidades de despliegue listas para empresas  
- **Reconocimiento en la comunidad**: Miembro activo de la comunidad de desarrolladores de Azure
- **Avance profesional**: Conocimientos demandados en AZD y despliegue de IA

---

## 🤝 Community & Support

### Get Help & Support
- **Technical Issues**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Learning Questions**: [Comunidad de Discord de Microsoft Azure](https://discord.gg/microsoft-azure) and [![Discord de Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-Specific Help**: Join the [![Discord de Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentation**: [Documentación oficial de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community Insights from Microsoft Foundry Discord

**Recent Poll Results from #Azure Channel:**
- **45%** of developers want to use AZD for AI workloads
- **Top challenges**: Despliegues multi-servicio, gestión de credenciales, preparación para producción  
- **Most requested**: Plantillas específicas para IA, guías de resolución de problemas, mejores prácticas

**Join our community to:**
- Compartir tus experiencias con AZD + IA y obtener ayuda
- Acceder a vistas previas tempranas de nuevas plantillas de IA
- Contribuir a las mejores prácticas de despliegue de IA
- Influir en el desarrollo futuro de funciones de IA + AZD

### Contributing to the Course
¡Damos la bienvenida a las contribuciones! Por favor lee nuestra [Guía de contribución](CONTRIBUTING.md) para detalles sobre:
- **Mejoras de contenido**: Mejora capítulos y ejemplos existentes
- **Nuevos ejemplos**: Añade escenarios del mundo real y plantillas  
- **Traducción**: Ayuda a mantener el soporte multilingüe
- **Informes de errores**: Mejora la precisión y claridad
- **Normas comunitarias**: Sigue nuestras directrices comunitarias inclusivas

---

## 📄 Course Information

### License
Este proyecto está bajo la licencia MIT - consulta el archivo [LICENSE](../../LICENSE) para más detalles.

### Related Microsoft Learning Resources

Nuestro equipo produce otros cursos completos de aprendizaje:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j para Principiantes](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js para Principiantes](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain para Principiantes](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD para Principiantes](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI para Principiantes](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP para Principiantes](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Agentes de IA para Principiantes](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![IA Generativa para Principiantes](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![IA Generativa (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![IA Generativa (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![IA Generativa (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML para Principiantes](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Ciencia de Datos para Principiantes](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![IA para Principiantes](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Ciberseguridad para Principiantes](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Desarrollo Web para Principiantes](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT para Principiantes](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Desarrollo XR para Principiantes](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serie Copilot
[![Copilot para Programación Emparejada con IA](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot para C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Aventura Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navegación del Curso

**🚀 ¿Listo para comenzar a aprender?**

**Principiantes**: Comienza con [Capítulo 1: Fundamentos y Inicio Rápido](#-chapter-1-foundation--quick-start)  
**Desarrolladores de IA**: Ir a [Capítulo 2: Desarrollo centrado en IA](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Desarrolladores experimentados**: Comiencen con [Capítulo 3: Configuración y Autenticación](#️-chapter-3-configuration--authentication)

**Próximos pasos**: [Comenzar Capítulo 1 - Conceptos básicos de AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la exactitud, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un humano. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
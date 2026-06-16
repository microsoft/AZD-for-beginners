# AZD Para Principiantes: Un Viaje de Aprendizaje Estructurado

![AZD-para-principiantes](../../translated_images/es/azdbeginners.5527441dd9f74068.webp) 

[![Observadores de GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Bifurcaciones de GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Estrellas de GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord de Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord de Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traducciones Automáticas (Siempre Actualizadas)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Árabe](../ar/README.md) | [Bengalí](../bn/README.md) | [Búlgaro](../bg/README.md) | [Birmano (Myanmar)](../my/README.md) | [Chino (simplificado)](../zh-CN/README.md) | [Chino (tradicional, Hong Kong)](../zh-HK/README.md) | [Chino (tradicional, Macau)](../zh-MO/README.md) | [Chino (tradicional, Taiwán)](../zh-TW/README.md) | [Croata](../hr/README.md) | [Checo](../cs/README.md) | [Danés](../da/README.md) | [Neerlandés](../nl/README.md) | [Estonio](../et/README.md) | [Finés](../fi/README.md) | [Francés](../fr/README.md) | [Alemán](../de/README.md) | [Griego](../el/README.md) | [Hebreo](../he/README.md) | [Hindi](../hi/README.md) | [Húngaro](../hu/README.md) | [Indonesio](../id/README.md) | [Italiano](../it/README.md) | [Japonés](../ja/README.md) | [Kannada](../kn/README.md) | [Jemer](../km/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malayo](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalí](../ne/README.md) | [Pidgin nigeriano](../pcm/README.md) | [Noruego](../no/README.md) | [Persa (farsi)](../fa/README.md) | [Polaco](../pl/README.md) | [Portugués (Brasil)](../pt-BR/README.md) | [Portugués (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumano](../ro/README.md) | [Ruso](../ru/README.md) | [Serbio (cirílico)](../sr/README.md) | [Eslovaco](../sk/README.md) | [Esloveno](../sl/README.md) | [Español](./README.md) | [Swahili](../sw/README.md) | [Sueco](../sv/README.md) | [Tagalo (filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Tailandés](../th/README.md) | [Turco](../tr/README.md) | [Ucraniano](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **¿Prefieres clonar localmente?**
>
> Este repositorio incluye más de 50 traducciones, lo que aumenta significativamente el tamaño de la descarga. Para clonar sin traducciones, usa sparse checkout:
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
> Esto te da todo lo necesario para completar el curso con una descarga mucho más rápida.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Qué hay de nuevo en azd Hoy

> 📌 Este curso está validado con **`azd 1.25.6`** (junio de 2026). Ejecuta `azd version` para comprobar tu versión, y `azd upgrade` para obtener la más reciente.

Azure Developer CLI ha crecido más allá de las aplicaciones web y APIs tradicionales. Hoy, azd es la herramienta única para desplegar **cualquier** aplicación en Azure, incluidas aplicaciones impulsadas por IA y agentes inteligentes.

Esto es lo que significa para ti:

- **Los agentes de IA ahora son cargas de trabajo de primera clase en azd.** Puedes inicializar, desplegar y gestionar proyectos de agentes de IA usando el mismo flujo `azd init` → `azd up` que ya conoces.
- **Un ciclo de vida completo de agente desde la CLI.** La extensión `azure.ai.agents` ahora cubre todo el recorrido—`azd ai agent init` para crear la plantilla, `azd ai agent invoke` para probar (con salida de tiempo de respuesta), `azd ai agent eval generate` y `azd ai agent optimize` para medir y mejorar la calidad, y `azd ai agent delete` para limpiar.
- **Más bloques constructores de IA.** Nuevas extensiones en vista previa—`azure.ai.skills` y `azure.ai.connections`—te permiten gestionar habilidades reutilizables de agentes y conexiones de Foundry directamente con azd.
- **Integración con Microsoft Foundry** que trae despliegue de modelos, alojamiento de agentes y configuración de servicios de IA directamente al ecosistema de plantillas de azd.
- **Mejoras en lo básico diario.** Lanzamientos recientes hicieron `azd init` idempotente (seguro para volver a ejecutar), hicieron que `azd auth login` aclare tokens obsoletos automáticamente, y añadieron un mensaje amigable de configuración inicial en `azd tool`.
- **El flujo de trabajo central no ha cambiado.** Ya sea que despliegues una app de tareas, un microservicio o una solución de IA multi-agente, los comandos son los mismos.

> **Nota para usuarios de Aspire:** Microsoft ahora se refiere al producto simplemente como **Aspire** (anteriormente ".NET Aspire"). El soporte de azd para Aspire no ha cambiado—solo se actualizó el nombre.

Si ya has usado azd antes, el soporte de IA es una extensión natural—no una herramienta separada ni una vía avanzada. Si comienzas de cero, aprenderás un flujo de trabajo que funciona para todo.

---

## 🚀 ¿Qué es Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** es una herramienta de línea de comandos amigable para desarrolladores que facilita desplegar aplicaciones en Azure. En lugar de crear y conectar manualmente docenas de recursos de Azure, puedes desplegar aplicaciones completas con un solo comando.

### La magia de `azd up`

```bash
# Este único comando lo hace todo:
# ✅ Crea todos los recursos de Azure
# ✅ Configura redes y seguridad
# ✅ Compila el código de tu aplicación
# ✅ Despliega en Azure
# ✅ Te proporciona una URL funcional
azd up
```

**¡Eso es todo!** Sin clics en el Portal de Azure, sin plantillas ARM complejas que aprender primero, sin configuración manual - solo aplicaciones funcionando en Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: ¿Cuál es la diferencia?

Esta es la pregunta más común que hacen los principiantes. Aquí está la respuesta sencilla:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Manage individual Azure resources | Deploy complete applications |
| **Mindset** | Infrastructure-focused | Application-focused |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Must know Azure services | Just know your app |
| **Best For** | DevOps, Infrastructure | Developers, Prototyping |

### Analogía simple

- **Azure CLI** es como tener todas las herramientas para construir una casa: martillos, sierras, clavos. Puedes construir cualquier cosa, pero necesitas saber de construcción.
- **Azure Developer CLI** es como contratar a un contratista: describes lo que quieres y ellos se encargan de la construcción.

### Cuándo usar cada una

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### ¡Funcionan juntas!

AZD usa Azure CLI en segundo plano. Puedes usar ambas:
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
| 🔗 [**Galería Awesome AZD**](https://azure.github.io/awesome-azd/) | Explora más de 200 plantillas con despliegue con un clic |
| 🔗 [**Enviar una plantilla**](https://github.com/Azure/awesome-azd/issues) | Contribuye con tu propia plantilla a la comunidad |
| 🔗 [**Repositorio de GitHub**](https://github.com/Azure/awesome-azd) | Dale estrella y explora el código fuente |

### Plantillas populares de IA en Awesome AZD

```bash
# Chat RAG con modelos Microsoft Foundry + búsqueda AI
azd init --template azure-search-openai-demo

# Aplicación rápida de chat AI
azd init --template openai-chat-app-quickstart

# Agentes AI con agentes Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Comenzando en 3 pasos

Antes de empezar, asegúrate de que tu máquina esté lista para la plantilla que quieras desplegar:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Si alguna verificación requerida falla, corrígela primero y luego continúa con el inicio rápido.

### Paso 1: Instalar AZD (2 minutos)

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

### Paso 2: Autenticarse para AZD

```bash
# Opcional si planeas usar comandos de Azure CLI directamente en este curso
az login

# Requerido para los flujos de trabajo de AZD
azd auth login
```

Si no estás seguro de cuál necesitas, sigue el flujo de configuración completo en [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Paso 3: Despliega tu primera app

```bash
# Inicializar desde una plantilla
azd init --template todo-nodejs-mongo

# Implementar en Azure (¡crea todo!)
azd up
```

**🎉 ¡Eso es todo!** Tu app ahora está en vivo en Azure.

### Limpiar (¡No lo olvides!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cómo usar este curso

Este curso está diseñado para un aprendizaje **progresivo**: comienza donde te sientas cómodo y avanza paso a paso:

| Tu experiencia | Comienza aquí |
|-----------------|---------------|
| **Completamente nuevo en Azure** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Conoces Azure, nuevo en AZD** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Quieres desplegar apps de IA** | [Capítulo 2: Desarrollo centrado en IA](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Quieres práctica práctica** | [🎓 Taller interactivo](workshop/README.md) - laboratorio guiado de 3-4 horas |
| **Necesitas patrones para producción** | [Capítulo 8: Producción y patrones empresariales](#-chapter-8-production--enterprise-patterns) |

### Configuración rápida

1. **Haz un fork de este repositorio**: [![Bifurcaciones de GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clónalo**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obtén ayuda**: [Comunidad de Discord de Azure](https://discord.com/invite/ByRwuEEgH4)

> **¿Prefieres clonar localmente?**

> Este repositorio incluye más de 50 traducciones, lo que aumenta significativamente el tamaño de la descarga. Para clonar sin traducciones, usa sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Esto te da todo lo necesario para completar el curso con una descarga mucho más rápida.


## Descripción del curso

Domina Azure Developer CLI (azd) a través de capítulos estructurados diseñados para un aprendizaje progresivo. **Enfoque especial en el despliegue de aplicaciones de IA con integración de Microsoft Foundry.**
### Por qué este curso es esencial para los desarrolladores modernos

Según conocimientos de la comunidad de Discord de Microsoft Foundry, **el 45 % de los desarrolladores quieren usar AZD para cargas de trabajo de IA** pero encuentran desafíos con:
- Arquitecturas de IA complejas con múltiples servicios
- Mejores prácticas para el despliegue de IA en producción  
- Integración y configuración de servicios de Azure AI
- Optimización de costos para cargas de trabajo de IA
- Solución de problemas específicos de despliegue de IA

### Objetivos de aprendizaje

Al completar este curso estructurado, usted:
- **Dominar los fundamentos de AZD**: Conceptos clave, instalación y configuración
- **Desplegar aplicaciones de IA**: Usar AZD con los servicios de Microsoft Foundry
- **Implementar Infraestructura como Código**: Gestionar recursos de Azure con plantillas Bicep
- **Solucionar problemas de despliegue**: Resolver problemas comunes y depurar incidencias
- **Optimizar para producción**: Seguridad, escalado, supervisión y gestión de costos
- **Construir soluciones multiagente**: Desplegar arquitecturas de IA complejas

## Antes de empezar: cuentas, acceso y suposiciones

Antes de comenzar el Capítulo 1, asegúrese de tener lo siguiente en su lugar. Los pasos de instalación más adelante en esta guía asumen que estas bases ya están resueltas.

- **Una suscripción de Azure**: Puede usar una suscripción existente del trabajo o su cuenta personal, o crear una [free trial](https://aka.ms/azurefreetrial) para empezar.
- **Permiso para crear recursos de Azure**: Para la mayoría de los ejercicios, debe tener al menos acceso **Contributor** en la suscripción o grupo de recursos destino. Algunos capítulos también pueden asumir que puede crear grupos de recursos, identidades administradas y asignaciones RBAC.
- [**Una cuenta de GitHub**](https://github.com): Esto es útil para bifurcar el repositorio, rastrear sus propios cambios y usar GitHub Codespaces para el taller.
- **Requisitos de tiempo de ejecución de plantillas**: Algunas plantillas necesitan herramientas locales como Node.js, Python, Java o Docker. Ejecute el validador de configuración antes de empezar para detectar herramientas faltantes con antelación.
- **Familiaridad básica con la terminal**: No necesita ser un experto, pero debe sentirse cómodo ejecutando comandos como `git clone`, `azd auth login` y `azd up`.

> **¿Trabaja en una suscripción empresarial?**
> Si su entorno de Azure está gestionado por un administrador, confirme con antelación que puede desplegar recursos en la suscripción o grupo de recursos que planea usar. Si no, solicite una suscripción sandbox o acceso Contributor antes de comenzar.

> **¿Nuevo en Azure?**
> Comience con su propia prueba gratuita de Azure o una suscripción de pago por uso en https://aka.ms/azurefreetrial para poder completar los ejercicios de extremo a extremo sin esperar aprobaciones a nivel de tenant.

## 🗺️ Mapa del curso: navegación rápida por capítulo

Cada capítulo tiene un README dedicado con objetivos de aprendizaje, arranques rápidos y ejercicios:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Getting Started | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-First Apps | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Auth & Security | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Solutions | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & Validation | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Enterprise Patterns | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Total Course Duration:** ~10-14 hours | **Skill Progression:** Beginner → Production-Ready

---

## 📚 Capítulos de aprendizaje

*Selecciona tu ruta de aprendizaje según tu nivel de experiencia y objetivos*

### 🚀 Cap. 1: Fundamentos e inicio rápido
**Requisitos previos**: suscripción de Azure, conocimientos básicos de línea de comandos  
**Duración**: 30-45 minutos  
**Complejidad**: ⭐

#### Qué aprenderás
- Comprender los fundamentos de Azure Developer CLI
- Instalar AZD en tu plataforma
- Tu primer despliegue exitoso

#### Recursos de aprendizaje
- **🎯 Comienza aquí**: [What is Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoría**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Conceptos y terminología clave
- **⚙️ Configuración**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Guías específicas por plataforma
- **🛠️ Práctico**: [Your First Project](docs/chapter-01-foundation/first-project.md) - Tutorial paso a paso
- **📋 Referencia rápida**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Ejercicios prácticos
```bash
# Comprobación rápida de la instalación
azd version

# Despliega tu primera aplicación
azd init --template todo-nodejs-mongo
azd up
```

**💡 Resultado del capítulo**: Desplegar con éxito una aplicación web simple en Azure usando AZD

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

### 🤖 Cap. 2: Desarrollo centrado en IA (Recomendado para desarrolladores de IA)
**Requisitos previos**: Capítulo 1 completado  
**Duración**: 1-2 horas  
**Complejidad**: ⭐⭐

#### Qué aprenderás
- Integración de Microsoft Foundry con AZD
- Desplegar aplicaciones impulsadas por IA
- Comprender las configuraciones de servicios de IA

#### Recursos de aprendizaje
- **🎯 Comienza aquí**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agentes de IA**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Desplegar agentes inteligentes con AZD
- **📖 Patrones**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Desplegar y gestionar modelos de IA
- **🛠️ Taller**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Preparar tus soluciones de IA para AZD
- **🎥 Guía interactiva**: [Workshop Materials](workshop/README.md) - Aprendizaje en el navegador con MkDocs * DevContainer Environment
- **📋 Plantillas**: [Microsoft Foundry Templates](#recursos-del-taller)
- **📝 Ejemplos**: [AZD Deployment Examples](examples/README.md)

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
# Probar la interfaz de chat de la IA
# Hacer preguntas y obtener respuestas impulsadas por IA con fuentes
# Verificar que la integración de búsqueda funciona
azd monitor  # Comprobar que Application Insights muestra telemetría
azd down --force --purge
```

**📊 Inversión de tiempo:** 1-2 horas  
**📈 Nivel de habilidad después:** Puede desplegar y configurar aplicaciones de IA listas para producción  
**💰 Conciencia de costos:** Entender $80-150/mes en entorno de desarrollo, $300-3500/mes en producción

#### 💰 Consideraciones de costo para implementaciones de IA

**Entorno de desarrollo (Estimado $80-150/mes):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/mes (basado en uso de tokens)
- AI Search (Basic tier): $75/mes
- Container Apps (Consumption): $0-20/mes
- Storage (Standard): $1-5/mes

**Entorno de producción (Estimado $300-3,500+/mes):**
- Microsoft Foundry Models (PTU para rendimiento consistente): $3,000+/mes O Pay-as-go con alto volumen
- AI Search (Standard tier): $250/mes
- Container Apps (Dedicated): $50-100/mes
- Application Insights: $5-50/mes
- Storage (Premium): $10-50/mes

**💡 Consejos para optimizar costos:**
- Use **Free Tier** Microsoft Foundry Models para aprendizaje (Azure OpenAI 50,000 tokens/month incluido)
- Ejecute `azd down` para desalocar recursos cuando no esté desarrollando activamente
- Comience con facturación basada en consumo, actualice a PTU solo para producción
- Use `azd provision --preview` para estimar costos antes del despliegue
- Habilite el autoescalado: pague solo por el uso real

**Monitoreo de costos:**
```bash
# Compruebe los costos mensuales estimados
azd provision --preview

# Monitoree los costos reales en el Portal de Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Cap. 3: Configuración y autenticación
**Requisitos previos**: Capítulo 1 completado  
**Duración**: 45-60 minutos  
**Complejidad**: ⭐⭐

#### Qué aprenderás
- Configuración y gestión de entornos
- Autenticación y mejores prácticas de seguridad
- Nomenclatura y organización de recursos

#### Recursos de aprendizaje
- **📖 Configuración**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Configuración del entorno
- **🔐 Seguridad**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - Patrones de autenticación
- **📝 Ejemplos**: [Database App Example](examples/database-app/README.md) - Ejemplos de base de datos con AZD

#### Ejercicios prácticos
- Configurar múltiples entornos (dev, staging, prod)
- Configurar autenticación con identidad administrada
- Implementar configuraciones específicas por entorno

**💡 Resultado del capítulo**: Gestionar múltiples entornos con autenticación y seguridad adecuadas

---

### 🏗️ Cap. 4: Infraestructura como Código y despliegue
**Requisitos previos**: Capítulos 1-3 completados  
**Duración**: 1-1.5 horas  
**Complejidad**: ⭐⭐⭐

#### Qué aprenderás
- Patrones avanzados de despliegue
- Infraestructura como Código con Bicep
- Estrategias de aprovisionamiento de recursos

#### Recursos de aprendizaje
- **📖 Despliegue**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Flujos de trabajo completos
- **🏗️ Aprovisionamiento**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Gestión de recursos de Azure
- **📝 Ejemplos**: [Container App Example](../../examples/container-app) - Despliegues con contenedores

#### Ejercicios prácticos
- Crear plantillas Bicep personalizadas
- Desplegar aplicaciones con múltiples servicios
- Implementar estrategias de despliegue blue-green

**💡 Resultado del capítulo**: Desplegar aplicaciones complejas con múltiples servicios usando plantillas de infraestructura personalizadas

---
### 🎯 Capítulo 5: Soluciones de IA Multiagente (Avanzado)
**Requisitos previos**: Capítulos 1-2 completados  
**Duración**: 2-3 horas  
**Complejidad**: ⭐⭐⭐⭐

#### Qué aprenderás
- Patrones de arquitectura multiagente
- Orquestación y coordinación de agentes
- Despliegues de IA listos para producción

#### Recursos de aprendizaje
- **🤖 Proyecto destacado**: [Solución multiagente para Retail](examples/retail-scenario.md) - Implementación completa
- **🛠️ Plantillas ARM**: [Paquete de plantillas ARM](../../examples/retail-multiagent-arm-template) - Implementación con un clic
- **📖 Arquitectura**: [Patrones de coordinación multiagente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patrones

#### Ejercicios prácticos
```bash
# Desplegar la solución minorista multiagente completa
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorar las configuraciones de los agentes
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Resultado del capítulo**: Implementar y gestionar una solución de IA multiagente lista para producción con agentes de Cliente e Inventario

---

### 🔍 Capítulo 6: Validación y planificación previa al despliegue
**Requisitos previos**: Capítulo 4 completado  
**Duración**: 1 hora  
**Complejidad**: ⭐⭐

#### Qué aprenderás
- Planificación de capacidad y validación de recursos
- Estrategias de selección de SKU
- Comprobaciones previas al vuelo y automatización

#### Recursos de aprendizaje
- **📊 Planificación**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Validación de recursos
- **💰 Selección**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Opciones rentables
- **✅ Validación**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatizados

#### Ejercicios prácticos
- Ejecutar scripts de validación de capacidad
- Optimizar la selección de SKU para reducir costes
- Implementar comprobaciones automatizadas previas al despliegue

**💡 Resultado del capítulo**: Validar y optimizar despliegues antes de su ejecución

---

### 🚨 Capítulo 7: Resolución de problemas y depuración
**Requisitos previos**: Cualquier capítulo de despliegue completado  
**Duración**: 1-1.5 horas  
**Complejidad**: ⭐⭐

#### Qué aprenderás
- Enfoques sistemáticos de depuración
- Problemas comunes y soluciones
- Resolución de problemas específicos de IA

#### Recursos de aprendizaje
- **🔧 Problemas comunes**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ y soluciones
- **🕵️ Depuración**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Estrategias paso a paso
- **🤖 Problemas de IA**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemas de servicios de IA

#### Ejercicios prácticos
- Diagnosticar fallos de despliegue
- Resolver problemas de autenticación
- Depurar la conectividad de servicios de IA

**💡 Resultado del capítulo**: Diagnosticar y resolver de forma independiente problemas comunes de despliegue

---

### 🏢 Capítulo 8: Patrones de producción y empresariales
**Requisitos previos**: Capítulos 1-4 completados  
**Duración**: 2-3 horas  
**Complejidad**: ⭐⭐⭐⭐

#### Qué aprenderás
- Estrategias de despliegue en producción
- Patrones de seguridad empresariales
- Monitorización y optimización de costes

#### Recursos de aprendizaje
- **🏭 Producción**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Patrones empresariales
- **📝 Ejemplos**: [Microservices Example](../../examples/microservices) - Arquitecturas complejas
- **📊 Monitorización**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitorización

#### Ejercicios prácticos
- Implementar patrones de seguridad empresariales
- Configurar monitorización exhaustiva
- Desplegar en producción con la gobernanza adecuada

**💡 Resultado del capítulo**: Desplegar aplicaciones listas para empresa con capacidades completas de producción

---

## 🎓 Resumen del taller: Experiencia práctica

> **⚠️ ESTADO DEL TALLER: En desarrollo activo**  
> Los materiales del taller están siendo desarrollados y refinados. Los módulos principales son funcionales, pero algunas secciones avanzadas están incompletas. Estamos trabajando activamente para completar todo el contenido. [Seguimiento del progreso →](workshop/README.md)

### Materiales interactivos del taller
**Aprendizaje práctico y completo con herramientas basadas en navegador y ejercicios guiados**

Nuestros materiales de taller proporcionan una experiencia de aprendizaje estructurada e interactiva que complementa el plan de estudios por capítulos anterior. El taller está diseñado tanto para autoaprendizaje como para sesiones dirigidas por un instructor.

#### 🛠️ Características del taller
- **Interfaz basada en navegador**: Taller completo potenciado por MkDocs con búsqueda, copia y funciones de temas
- **Integración con GitHub Codespaces**: Configuración del entorno de desarrollo con un clic
- **Ruta de aprendizaje estructurada**: 8 módulos guiados (3-4 horas en total)
- **Metodología progresiva**: Introducción → Selección → Validación → Desconstrucción → Configuración → Personalización → Desmantelamiento → Cierre
- **Entorno DevContainer interactivo**: Herramientas y dependencias preconfiguradas

#### 📚 Estructura de módulos del taller
El taller sigue una **metodología progresiva de 8 módulos** que te lleva desde el descubrimiento hasta el dominio del despliegue:

| Módulo | Tema | Qué harás | Duración |
|--------|-------|----------------|----------|
| **0. Introducción** | Resumen del taller | Entender los objetivos de aprendizaje, requisitos previos y la estructura del taller | 15 min |
| **1. Selección** | Descubrimiento de plantillas | Explorar plantillas AZD y seleccionar la plantilla de IA adecuada para tu escenario | 20 min |
| **2. Validación** | Desplegar & Verificar | Desplegar la plantilla con `azd up` y validar que la infraestructura funciona | 30 min |
| **3. Desconstrucción** | Entender la estructura | Usar GitHub Copilot para explorar la arquitectura de la plantilla, archivos Bicep y organización del código | 30 min |
| **4. Configuración** | azure.yaml Análisis en profundidad | Dominar la configuración de `azure.yaml`, hooks del ciclo de vida y variables de entorno | 30 min |
| **5. Personalización** | Hazlo tuyo | Habilitar AI Search, trazabilidad, evaluación y personalizar para tu escenario | 45 min |
| **6. Desmantelamiento** | Limpieza | Desaprovisionar recursos de forma segura con `azd down --purge` | 15 min |
| **7. Cierre** | Próximos pasos | Revisar logros, conceptos clave y continuar tu camino de aprendizaje | 15 min |

**Flujo del taller:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Cómo empezar con el taller
```bash
# Opción 1: GitHub Codespaces (recomendado)
# Haz clic en "Code" → "Create codespace on main" en el repositorio

# Opción 2: Desarrollo local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Sigue las instrucciones de configuración en workshop/README.md
```

#### 🎯 Resultados de aprendizaje del taller
Al completar el taller, los participantes:
- **Desplegar aplicaciones de IA en producción**: Usar AZD con servicios de Microsoft Foundry
- **Dominar arquitecturas multiagente**: Implementar soluciones coordinadas de agentes de IA
- **Implementar mejores prácticas de seguridad**: Configurar autenticación y control de acceso
- **Optimizar para la escala**: Diseñar despliegues rentables y con buen rendimiento
- **Solucionar problemas de despliegue**: Resolver problemas comunes de forma independiente

#### 📖 Recursos del taller
- **🎥 Guía interactiva**: [Materiales del taller](workshop/README.md) - Entorno de aprendizaje basado en navegador
- **📋 Instrucciones módulo por módulo**:
  - [0. Introducción](workshop/docs/instructions/0-Introduction.md) - Resumen del taller y objetivos
  - [1. Selección](workshop/docs/instructions/1-Select-AI-Template.md) - Encontrar y seleccionar plantillas de IA
  - [2. Validación](workshop/docs/instructions/2-Validate-AI-Template.md) - Desplegar y verificar plantillas
  - [3. Desconstrucción](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorar la arquitectura de la plantilla
  - [4. Configuración](workshop/docs/instructions/4-Configure-AI-Template.md) - Dominar azure.yaml
  - [5. Personalización](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizar para tu escenario
  - [6. Desmantelamiento](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Limpiar recursos
  - [7. Cierre](workshop/docs/instructions/7-Wrap-up.md) - Revisar y próximos pasos
- **🛠️ Laboratorio del taller de IA**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Ejercicios centrados en IA
- **💡 Inicio rápido**: [Guía de configuración del taller](workshop/README.md#quick-start) - Configuración del entorno

**Perfecto para**: Formación corporativa, cursos universitarios, aprendizaje autodirigido y bootcamps para desarrolladores.

---

## 📖 Profundización: Capacidades de AZD

Más allá de lo básico, AZD ofrece potentes características para despliegues en producción:

- **Despliegues basados en plantillas** - Utiliza plantillas preconstruidas para patrones comunes de aplicaciones
- **Infraestructura como Código** - Gestiona recursos de Azure usando Bicep o Terraform  
- **Flujos de trabajo integrados** - Aprovisiona, despliega y supervisa aplicaciones sin fricciones
- **Orientado al desarrollador** - Optimizado para la productividad y experiencia del desarrollador

### **AZD + Microsoft Foundry: Perfecto para despliegues de IA**

**¿Por qué AZD para soluciones de IA?** AZD aborda los principales desafíos que enfrentan los desarrolladores de IA:

- **Plantillas preparadas para IA** - Plantillas preconfiguradas para Microsoft Foundry Models, Azure AI Services y cargas de trabajo de ML
- **Despliegues de IA seguros** - Patrones de seguridad integrados para servicios de IA, claves de API y endpoints de modelos  
- **Patrones de IA para producción** - Mejores prácticas para despliegues de aplicaciones de IA escalables y rentables
- **Flujos de trabajo de IA de extremo a extremo** - Desde el desarrollo del modelo hasta el despliegue en producción con monitoreo adecuado
- **Optimización de costes** - Asignación inteligente de recursos y estrategias de escalado para cargas de trabajo de IA
- **Integración con Microsoft Foundry** - Conexión fluida al catálogo de modelos y endpoints de Microsoft Foundry

---

## 🎯 Biblioteca de plantillas y ejemplos

### Destacado: Plantillas de Microsoft Foundry
**¡Comienza aquí si vas a desplegar aplicaciones de IA!**

> **Nota:** Estas plantillas demuestran varios patrones de IA. Algunas son Azure Samples externos, otras son implementaciones locales.

| Plantilla | Capítulo | Complejidad | Servicios | Tipo |
|----------|---------|------------|----------|------|
| [**Comenzar con chat de IA**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externo |
| [**Comenzar con agentes de IA**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capítulo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externo |
| [**Demostración Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externo |
| [**Inicio rápido de OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externo |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externo |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externo |
| [**Solución multiagente para Retail**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Destacado: Escenarios de aprendizaje completos
**Plantillas de aplicaciones listas para producción mapeadas a capítulos de aprendizaje**

| Plantilla | Capítulo de aprendizaje | Complejidad | Aprendizaje clave |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | Patrones básicos de despliegue de IA |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | Implementación RAG con Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capítulo 4 | ⭐⭐ | Integración de Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | Framework de agentes y llamadas a funciones |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐ | Orquestación de IA empresarial |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | Arquitectura multiagente con agentes de Cliente e Inventario |

### Aprendizaje por tipo de ejemplo

> **📌 Ejemplos locales vs. externos:**  
> **Ejemplos locales** (en este repo) = Listos para usar inmediatamente  
> **Ejemplos externos** (Azure Samples) = Clonar desde los repositorios enlazados

#### Ejemplos locales (listos para usar)
- [**Solución multiagente para Retail**](examples/retail-scenario.md) - Implementación completa lista para producción con plantillas ARM
  - Arquitectura multiagente (Cliente + Agentes de Inventario)
  - Monitorización y evaluación completas
  - Implementación con un clic mediante plantilla ARM

#### Ejemplos locales - Aplicaciones en contenedores (Capítulos 2-5)
**Ejemplos completos de despliegue en contenedores en este repositorio:**
- [**Container App Examples**](examples/container-app/README.md) - Guía completa para despliegues en contenedores
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST básica con escalado a cero
  - [Microservices Architecture](../../examples/container-app/microservices) - Implementación multi-servicio lista para producción
  - Patrones de despliegue: Inicio rápido, Producción y Avanzados
  - Orientación sobre monitorización, seguridad y optimización de costes

#### Ejemplos externos - Aplicaciones sencillas (Capítulos 1-2)
**Clona estos repositorios de Azure Samples para empezar:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Patrones básicos de despliegue
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Despliegue de contenido estático
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Despliegue de API REST

#### Ejemplos externos - Integración de bases de datos (Capítulos 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Patrones de conectividad con bases de datos
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flujo de trabajo de datos serverless

#### Ejemplos externos - Patrones avanzados (Capítulos 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arquitecturas multi-servicio
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Procesamiento en segundo plano  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Patrones de ML listos para producción

### Colecciones de plantillas externas
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Colección seleccionada de plantillas oficiales y de la comunidad
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentación de plantillas en Microsoft Learn
- [**Examples Directory**](examples/README.md) - Ejemplos de aprendizaje locales con explicaciones detalladas

---

## 📚 Recursos de aprendizaje y referencias

### Referencias rápidas
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Comandos azd esenciales organizados por capítulo
- [**Glossary**](resources/glossary.md) - Terminología de Azure y azd  
- [**FAQ**](resources/faq.md) - Preguntas comunes organizadas por capítulo de aprendizaje
- [**Study Guide**](resources/study-guide.md) - Ejercicios prácticos completos

### Talleres prácticos
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Haz que tus soluciones de IA sean desplegables con AZD (2-3 horas)
- [**Interactive Workshop**](workshop/README.md) - Ejercicios guiados de 8 módulos con MkDocs y GitHub Codespaces
  - Sigue: Introducción → Selección → Validación → Deconstrucción → Configuración → Personalización → Desmantelamiento → Cierre

### Recursos de aprendizaje externos
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### Habilidades de agentes de IA para tu editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 habilidades abiertas de agente para Azure AI, Foundry, despliegue, diagnóstico, optimización de costes, y más. Instálalas en GitHub Copilot, Cursor, Claude Code, o cualquier agente compatible:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guía rápida de solución de problemas

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

# Configurar para el entorno AZD
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

# O usa SKUs más pequeños en desarrollo
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

# Opción 4: Consultar registros en Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Reautenticarse para AZD
azd auth logout
azd auth login

# Opcional: actualice también la CLI de Azure si está ejecutando comandos az
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

# Entonces reintente con un entorno nuevo
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ El despliegue de la plantilla está tardando demasiado</strong></summary>

**Tiempos de espera normales:**
- Aplicación web simple: 5-10 minutos
- Aplicación con base de datos: 10-15 minutos
- Aplicaciones de IA: 15-25 minutos (el aprovisionamiento de OpenAI es lento)

```bash
# Comprobar el progreso
azd show

# Si está atascado más de 30 minutos, compruebe el Portal de Azure:
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
# Pide a tu administrador de Azure que conceda:
# - Contributor (para recursos)
# - User Access Administrator (para asignaciones de roles)
```
</details>

<details>
<summary><strong>❌ No se puede encontrar la URL de la aplicación desplegada</strong></summary>

```bash
# Mostrar todos los puntos finales de servicio
azd show

# O abrir el Portal de Azure
azd monitor

# Comprobar un servicio específico
azd env get-values
# Buscar variables *_URL
```
</details>

### 📚 Recursos completos de solución de problemas

- **Guía de problemas comunes:** [Soluciones detalladas](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemas específicos de IA:** [Solución de problemas de IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guía de depuración:** [Depuración paso a paso](docs/chapter-07-troubleshooting/debugging.md)
- **Obtén ayuda:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Finalización del curso y certificación

### Seguimiento del progreso
Sigue tu progreso de aprendizaje a través de cada capítulo:

- [ ] **Capítulo 1**: Fundamentos y inicio rápido ✅
- [ ] **Capítulo 2**: Desarrollo con IA como prioridad ✅  
- [ ] **Capítulo 3**: Configuración y autenticación ✅
- [ ] **Capítulo 4**: Infraestructura como código y despliegue ✅
- [ ] **Capítulo 5**: Soluciones de IA multi-agente ✅
- [ ] **Capítulo 6**: Validación y planificación previas al despliegue ✅
- [ ] **Capítulo 7**: Solución de problemas y depuración ✅
- [ ] **Capítulo 8**: Patrones para producción y empresa ✅

### Verificación del aprendizaje
Después de completar cada capítulo, verifica tus conocimientos mediante:
1. **Ejercicio práctico**: Completa el despliegue práctico del capítulo
2. **Comprobación de conocimientos**: Revisa la sección de FAQ de tu capítulo
3. **Discusión en la comunidad**: Comparte tu experiencia en Azure Discord
4. **Siguiente capítulo**: Avanza al siguiente nivel de complejidad

### Beneficios al completar el curso
Al completar todos los capítulos, tendrás:
- **Experiencia en producción**: Desplegado aplicaciones reales de IA en Azure
- **Habilidades profesionales**: Capacidades de despliegue listas para empresa  
- **Reconocimiento en la comunidad**: Miembro activo de la comunidad de desarrolladores de Azure
- **Avance profesional**: Experiencia en AZD y despliegue de IA muy demandada

---

## 🤝 Comunidad y soporte

### Obtener ayuda y soporte
- **Problemas técnicos**: [Reporta errores y solicita funciones](https://github.com/microsoft/azd-for-beginners/issues)
- **Preguntas de aprendizaje**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) y [![Discord de Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ayuda específica de IA**: Únete al [![Discord de Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentación**: [Documentación oficial de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Perspectivas de la comunidad desde Discord de Microsoft Foundry

**Resultados recientes de la encuesta del canal #Azure:**
- **45%** de desarrolladores quieren usar AZD para cargas de trabajo de IA
- **Principales desafíos**: Despliegues multi-servicio, gestión de credenciales, preparación para producción  
- **Más solicitados**: Plantillas específicas para IA, guías de solución de problemas, mejores prácticas

**Únete a nuestra comunidad para:**
- Comparte tus experiencias con AZD + IA y recibe ayuda
- Accede a vistas previas tempranas de nuevas plantillas de IA
- Contribuye a las mejores prácticas de despliegue de IA
- Influye en el desarrollo futuro de características de IA + AZD

### Contribuir al curso
¡Damos la bienvenida a las contribuciones! Por favor lee nuestra [Guía de contribución](CONTRIBUTING.md) para más detalles sobre:
- **Mejoras de contenido**: Mejora los capítulos y ejemplos existentes
- **Nuevos ejemplos**: Añade escenarios del mundo real y plantillas  
- **Traducción**: Ayuda a mantener el soporte multilingüe
- **Informes de errores**: Mejora la precisión y claridad
- **Normas de la comunidad**: Sigue nuestras directrices inclusivas de la comunidad

---

## 📄 Información del curso

### Licencia
Este proyecto está bajo la licencia MIT - consulta el archivo [LICENSE](../../LICENSE) para más detalles.

### Recursos de aprendizaje relacionados de Microsoft

Nuestro equipo produce otros cursos completos de aprendizaje:

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
[![IA Generativa (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Aprendizaje principal
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

**Principiantes**: Comienza con [Capítulo 1: Fundamentos y Inicio rápido](#-chapter-1-foundation--quick-start)  
**Desarrolladores de IA**: Salta a [Capítulo 2: Desarrollo con enfoque en IA](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Desarrolladores experimentados**: Comienza con [Capítulo 3: Configuración y Autenticación](#️-chapter-3-configuration--authentication)

**Siguientes pasos**: [Comenzar Capítulo 1 - Conceptos básicos de AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
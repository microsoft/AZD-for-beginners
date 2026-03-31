# AZD Para Principiantes: Un Camino de Aprendizaje Estructurado

![AZD para principiantes](../../translated_images/es/azdbeginners.5527441dd9f74068.webp) 

[![Observadores de GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forks de GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Estrellas de GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord de Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord de Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traducciones automatizadas (siempre actualizadas)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Árabe](../ar/README.md) | [Bengalí](../bn/README.md) | [Búlgaro](../bg/README.md) | [Birmano (Myanmar)](../my/README.md) | [Chino (Simplificado)](../zh-CN/README.md) | [Chino (Tradicional, Hong Kong)](../zh-HK/README.md) | [Chino (Tradicional, Macau)](../zh-MO/README.md) | [Chino (Tradicional, Taiwán)](../zh-TW/README.md) | [Croata](../hr/README.md) | [Checo](../cs/README.md) | [Danés](../da/README.md) | [Holandés](../nl/README.md) | [Estonio](../et/README.md) | [Finlandés](../fi/README.md) | [Francés](../fr/README.md) | [Alemán](../de/README.md) | [Griego](../el/README.md) | [Hebreo](../he/README.md) | [Hindi](../hi/README.md) | [Húngaro](../hu/README.md) | [Indonesio](../id/README.md) | [Italiano](../it/README.md) | [Japonés](../ja/README.md) | [Kannada](../kn/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malayo](../ms/README.md) | [Malayalam](../ml/README.md) | [Maratí](../mr/README.md) | [Nepalí](../ne/README.md) | [Pidgin nigeriano](../pcm/README.md) | [Noruego](../no/README.md) | [Persa (farsi)](../fa/README.md) | [Polaco](../pl/README.md) | [Portugués (Brasil)](../pt-BR/README.md) | [Portugués (Portugal)](../pt-PT/README.md) | [Panyabí (Gurmukhi)](../pa/README.md) | [Rumano](../ro/README.md) | [Ruso](../ru/README.md) | [Serbio (cirílico)](../sr/README.md) | [Eslovaco](../sk/README.md) | [Esloveno](../sl/README.md) | [Español](./README.md) | [Swahili](../sw/README.md) | [Sueco](../sv/README.md) | [Tagalo (filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Tailandés](../th/README.md) | [Turco](../tr/README.md) | [Ucraniano](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **¿Prefieres clonar localmente?**
>
> Este repositorio incluye más de 50 traducciones de idiomas, lo que aumenta significativamente el tamaño de la descarga. Para clonar sin las traducciones, usa sparse checkout:
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

## 🆕 Novedades de azd hoy

Azure Developer CLI ha crecido más allá de las aplicaciones web y APIs tradicionales. Hoy, azd es la herramienta única para desplegar cualquier aplicación en Azure, incluidas aplicaciones potenciadas por IA y agentes inteligentes.

Esto es lo que significa para ti:

- **Los agentes de IA ahora son cargas de trabajo de azd de primera clase.** Puedes inicializar, desplegar y gestionar proyectos de agentes de IA usando el mismo flujo de trabajo `azd init` → `azd up` que ya conoces.
- **La integración con Microsoft Foundry** trae despliegue de modelos, alojamiento de agentes y configuración de servicios de IA directamente al ecosistema de plantillas de azd.
- **El flujo de trabajo principal no ha cambiado.** Ya sea que estés desplegando una app de tareas, un microservicio o una solución de IA con múltiples agentes, los comandos son los mismos.

Si ya has usado azd antes, el soporte de IA es una extensión natural, no una herramienta separada ni una pista avanzada. Si estás empezando, aprenderás un flujo de trabajo que funciona para todo.

---

## 🚀 ¿Qué es Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** es una herramienta de línea de comandos orientada a desarrolladores que facilita el despliegue de aplicaciones en Azure. En lugar de crear y conectar manualmente docenas de recursos de Azure, puedes desplegar aplicaciones completas con un solo comando.

### La magia de `azd up`

```bash
# Este único comando lo hace todo:
# ✅ Crea todos los recursos de Azure
# ✅ Configura redes y seguridad
# ✅ Construye el código de tu aplicación
# ✅ Despliega en Azure
# ✅ Te proporciona una URL funcional
azd up
```

**¡Eso es todo!** No más clics en el Portal de Azure, no hay que aprender primero plantillas ARM complejas, ni configuración manual: solo aplicaciones funcionando en Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: ¿Cuál es la diferencia?

Esta es la pregunta más común que hacen los principiantes. Aquí está la respuesta simple:

| Característica | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Propósito** | Gestionar recursos individuales de Azure | Desplegar aplicaciones completas |
| **Mentalidad** | Enfocado en la infraestructura | Enfocado en la aplicación |
| **Ejemplo** | `az webapp create --name myapp...` | `azd up` |
| **Curva de aprendizaje** | Debes conocer los servicios de Azure | Solo conoce tu aplicación |
| **Más adecuado para** | DevOps, Infraestructura | Desarrolladores, Prototipos |

### Analogía simple

- **Azure CLI** es como tener todas las herramientas para construir una casa: martillos, sierras, clavos. Puedes construir cualquier cosa, pero necesitas saber de construcción.
- **Azure Developer CLI** es como contratar a un contratista: describes lo que quieres y ellos se encargan de la construcción.

### Cuándo usar cada uno

| Escenario | Usar esto |
|----------|----------|
| "Quiero desplegar mi aplicación web rápidamente" | `azd up` |
| "Necesito crear solo una cuenta de almacenamiento" | `az storage account create` |
| "Estoy construyendo una aplicación completa de IA" | `azd init --template azure-search-openai-demo` |
| "Necesito depurar un recurso específico de Azure" | `az resource show` |
| "Quiero un despliegue listo para producción en minutos" | `azd up --environment production` |

### ¡Funcionan juntos!

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

| Recurso | Descripción |
|----------|-------------|
| 🔗 [**Galería Awesome AZD**](https://azure.github.io/awesome-azd/) | Explora más de 200 plantillas con despliegue con un clic |
| 🔗 [**Enviar una plantilla**](https://github.com/Azure/awesome-azd/issues) | Contribuye con tu propia plantilla a la comunidad |
| 🔗 [**Repositorio de GitHub**](https://github.com/Azure/awesome-azd) | Ponle una estrella y explora el código fuente |

### Plantillas de IA populares de Awesome AZD

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

### Paso 2: Iniciar sesión en Azure

```bash
azd auth login
```

### Paso 3: Despliega tu primera aplicación

```bash
# Inicializar desde una plantilla
azd init --template todo-nodejs-mongo

# Desplegar en Azure (¡crea todo!)
azd up
```

**🎉 ¡Eso es todo!** Tu aplicación ahora está en vivo en Azure.

### Limpieza (¡No lo olvides!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cómo usar este curso

Este curso está diseñado para un aprendizaje progresivo: comienza donde te sientas cómodo y avanza paso a paso:

| Tu experiencia | Empieza aquí |
|-----------------|------------|
| **Nuevo en Azure** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Conoces Azure, nuevo en AZD** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Quieres desplegar aplicaciones de IA** | [Capítulo 2: Desarrollo con enfoque en IA](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Quieres práctica práctica** | [🎓 Taller interactivo](workshop/README.md) - laboratorio guiado de 3-4 horas |
| **Necesitas patrones para producción** | [Capítulo 8: Producción & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Configuración rápida

1. **Haz un fork de este repositorio**: [![Forks de GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clónalo**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obtén ayuda**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **¿Prefieres clonar localmente?**
>
> Este repositorio incluye más de 50 traducciones de idiomas, lo que aumenta significativamente el tamaño de la descarga. Para clonar sin las traducciones, usa sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Esto te da todo lo que necesitas para completar el curso con una descarga mucho más rápida.


## Resumen del curso

Domina Azure Developer CLI (azd) a través de capítulos estructurados diseñados para un aprendizaje progresivo. **Enfoque especial en el despliegue de aplicaciones de IA con integración de Microsoft Foundry.**

### Por qué este curso es esencial para los desarrolladores modernos

Basado en ideas de la comunidad de Discord de Microsoft Foundry, **el 45% de los desarrolladores quieren usar AZD para cargas de trabajo de IA** pero se encuentran con desafíos como:
- Arquitecturas complejas de IA con múltiples servicios
- Mejores prácticas para despliegues de IA en producción  
- Integración y configuración de servicios de IA en Azure
- Optimización de costes para cargas de trabajo de IA
- Solución de problemas específicos de despliegue de IA

### Objetivos de aprendizaje

Al completar este curso estructurado, usted:
- **Dominará los fundamentos de AZD**: conceptos clave, instalación y configuración
- **Desplegará aplicaciones de IA**: usa AZD con los servicios de Microsoft Foundry
- **Implementará Infraestructura como Código**: gestiona recursos de Azure con plantillas Bicep
- **Solucionará despliegues**: resuelve problemas comunes y depura incidencias
- **Optimizará para producción**: seguridad, escalado, monitorización y gestión de costes
- **Construirá soluciones multiagente**: despliega arquitecturas complejas de IA

## 🗺️ Mapa del curso: navegación rápida por capítulo

Cada capítulo tiene un README dedicado con objetivos de aprendizaje, inicios rápidos y ejercicios:

| Capítulo | Tema | Lecciones | Duración | Complejidad |
|---------|-------|---------|----------|------------|
| **[Capítulo 1: Fundamentos](docs/chapter-01-foundation/README.md)** | Primeros pasos | [Conceptos básicos de AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalación](docs/chapter-01-foundation/installation.md) &#124; [Primer proyecto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap. 2: Desarrollo de IA](docs/chapter-02-ai-development/README.md)** | Aplicaciones centradas en IA | [Integración con Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agentes de IA](docs/chapter-02-ai-development/agents.md) &#124; [Despliegue de modelos](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Taller](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Cap. 3: Configuración](docs/chapter-03-configuration/README.md)** | Autenticación y Seguridad | [Configuración](docs/chapter-03-configuration/configuration.md) &#124; [Autenticación y Seguridad](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap. 4: Infraestructura](docs/chapter-04-infrastructure/README.md)** | IaC y Despliegue | [Guía de Despliegue](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Aprovisionamiento](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Cap. 5: Multi-Agente](docs/chapter-05-multi-agent/README.md)** | Soluciones de Agentes IA | [Escenario minorista](examples/retail-scenario.md) &#124; [Patrones de coordinación](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Cap. 6: Pre-Despliegue](docs/chapter-06-pre-deployment/README.md)** | Planificación y Validación | [Comprobaciones previas](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planificación de capacidad](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Selección de SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Cap. 7: Resolución de Problemas](docs/chapter-07-troubleshooting/README.md)** | Depuración y Corrección | [Problemas comunes](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Depuración](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemas de IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Cap. 8: Producción](docs/chapter-08-production/README.md)** | Patrones empresariales | [Prácticas de Producción](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Taller](workshop/README.md)** | Laboratorio práctico | [Introducción](workshop/docs/instructions/0-Introduction.md) &#124; [Selección](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validación](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstrucción](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuración](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalización](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Desmantelamiento](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Resumen](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Duración total del curso:** ~10-14 horas | **Progresión de habilidades:** Principiante → Listo para producción

---

## 📚 Capítulos de aprendizaje

*Selecciona tu ruta de aprendizaje según tu nivel de experiencia y objetivos*

### 🚀 Capítulo 1: Fundamentos e inicio rápido
**Requisitos previos**: suscripción a Azure, conocimientos básicos de línea de comandos  
**Duración**: 30-45 minutos  
**Complejidad**: ⭐

#### Lo que aprenderás
- Comprender los fundamentos de Azure Developer CLI
- Instalar AZD en tu plataforma
- Tu primer despliegue exitoso

#### Recursos de aprendizaje
- **🎯 Empieza aquí**: [¿Qué es Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoría**: [Fundamentos de AZD](docs/chapter-01-foundation/azd-basics.md) - Conceptos y terminología básicos
- **⚙️ Configuración**: [Instalación y configuración](docs/chapter-01-foundation/installation.md) - Guías específicas por plataforma
- **🛠️ Práctico**: [Tu primer proyecto](docs/chapter-01-foundation/first-project.md) - Tutorial paso a paso
- **📋 Referencia rápida**: [Hoja de referencia de comandos](resources/cheat-sheet.md)

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

**📊 Tiempo estimado:** 30-45 minutos  
**📈 Nivel de habilidad después:** Puede desplegar aplicaciones básicas de forma independiente
**📈 Nivel de habilidad después:** Puede desplegar aplicaciones básicas de forma independiente

---

### 🤖 Capítulo 2: Desarrollo centrado en IA (Recomendado para desarrolladores de IA)
**Requisitos previos**: Capítulo 1 completado  
**Duración**: 1-2 horas  
**Complejidad**: ⭐⭐

#### Lo que aprenderás
- Integración de Microsoft Foundry con AZD
- Desplegar aplicaciones impulsadas por IA
- Comprender las configuraciones de servicios de IA

#### Recursos de aprendizaje
- **🎯 Empieza aquí**: [Integración de Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agentes de IA**: [Guía de Agentes de IA](docs/chapter-02-ai-development/agents.md) - Despliega agentes inteligentes con AZD
- **📖 Patrones**: [Despliegue de modelos de IA](docs/chapter-02-ai-development/ai-model-deployment.md) - Despliega y administra modelos de IA
- **🛠️ Taller**: [Laboratorio de IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Prepara tus soluciones de IA para AZD
- **🎥 Guía interactiva**: [Materiales del taller](workshop/README.md) - Aprendizaje en el navegador con MkDocs * Entorno DevContainer
- **📋 Plantillas**: [Plantillas de Microsoft Foundry](#recursos-del-taller)
- **📝 Ejemplos**: [Ejemplos de despliegue AZD](examples/README.md)

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
azd monitor  # Comprobar que Application Insights muestre telemetría
azd down --force --purge
```

**📊 Tiempo estimado:** 1-2 horas  
**📈 Nivel de habilidad después:** Puede desplegar y configurar aplicaciones de IA listas para producción  
**💰 Conciencia de costos:** Comprende los costos de desarrollo de $80-150/mes, costos de producción de $300-3500/mes

#### 💰 Consideraciones de costo para despliegues de IA

**Entorno de desarrollo (Estimado $80-150/mes):**
- Modelos de Microsoft Foundry (pago por uso): $0-50/mes (basado en uso de tokens)
- AI Search (nivel Básico): $75/mes
- Container Apps (Consumo): $0-20/mes
- Almacenamiento (Estándar): $1-5/mes

**Entorno de producción (Estimado $300-3,500+/mes):**
- Modelos de Microsoft Foundry (PTU para rendimiento consistente): $3,000+/mes O Pago por uso con alto volumen
- AI Search (nivel Estándar): $250/mes
- Container Apps (Dedicado): $50-100/mes
- Application Insights: $5-50/mes
- Almacenamiento (Premium): $10-50/mes

**💡 Consejos para optimizar costos:**
- Usa los Modelos de Microsoft Foundry **en el nivel gratuito** para aprender (Azure OpenAI incluye 50,000 tokens/mes)
- Ejecuta `azd down` para desasignar recursos cuando no estés desarrollando activamente
- Comienza con facturación basada en consumo, actualiza a PTU solo para producción
- Usa `azd provision --preview` para estimar costos antes del despliegue
- Habilita el autoescalado: paga solo por el uso real

**Monitoreo de costos:**
```bash
# Comprobar los costes mensuales estimados
azd provision --preview

# Supervisar los costes reales en el Portal de Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capítulo 3: Configuración y Autenticación
**Requisitos previos**: Capítulo 1 completado  
**Duración**: 45-60 minutos  
**Complejidad**: ⭐⭐

#### Lo que aprenderás
- Configuración y gestión de entornos
- Buenas prácticas de autenticación y seguridad
- Nombrado y organización de recursos

#### Recursos de aprendizaje
- **📖 Configuración**: [Guía de configuración](docs/chapter-03-configuration/configuration.md) - Configuración de entornos
- **🔐 Seguridad**: [Patrones de autenticación e identidad administrada](docs/chapter-03-configuration/authsecurity.md) - Patrones de autenticación
- **📝 Ejemplos**: [Ejemplo de aplicación de base de datos](examples/database-app/README.md) - Ejemplos de bases de datos AZD

#### Ejercicios prácticos
- Configura múltiples entornos (dev, staging, prod)
- Configura autenticación con identidad administrada
- Implementa configuraciones específicas por entorno

**💡 Resultado del capítulo**: Gestionar múltiples entornos con la autenticación y seguridad adecuadas

---

### 🏗️ Capítulo 4: Infraestructura como Código y Despliegue
**Requisitos previos**: Capítulos 1-3 completados  
**Duración**: 1-1.5 horas  
**Complejidad**: ⭐⭐⭐

#### Lo que aprenderás
- Patrones avanzados de despliegue
- Infraestructura como Código con Bicep
- Estrategias de aprovisionamiento de recursos

#### Recursos de aprendizaje
- **📖 Despliegue**: [Guía de despliegue](docs/chapter-04-infrastructure/deployment-guide.md) - Flujos de trabajo completos
- **🏗️ Aprovisionamiento**: [Aprovisionamiento de recursos](docs/chapter-04-infrastructure/provisioning.md) - Gestión de recursos en Azure
- **📝 Ejemplos**: [Ejemplo de Container App](../../examples/container-app) - Despliegues en contenedores

#### Ejercicios prácticos
- Crear plantillas Bicep personalizadas
- Desplegar aplicaciones multi-servicio
- Implementar estrategias de despliegue blue-green

**💡 Resultado del capítulo**: Desplegar aplicaciones complejas multi-servicio usando plantillas de infraestructura personalizadas

---

### 🎯 Capítulo 5: Soluciones de IA multi-agente (Avanzado)
**Requisitos previos**: Capítulos 1-2 completados  
**Duración**: 2-3 horas  
**Complejidad**: ⭐⭐⭐⭐

#### Lo que aprenderás
- Patrones de arquitectura multi-agente
- Orquestación y coordinación de agentes
- Despliegues de IA listos para producción

#### Recursos de aprendizaje
- **🤖 Proyecto destacado**: [Solución multi-agente para retail](examples/retail-scenario.md) - Implementación completa
- **🛠️ Plantillas ARM**: [Paquete de plantillas ARM](../../examples/retail-multiagent-arm-template) - Despliegue con un clic
- **📖 Arquitectura**: [Patrones de coordinación multi-agente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patrones

#### Ejercicios prácticos
```bash
# Desplegar la solución minorista multiagente completa
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorar las configuraciones de los agentes
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Resultado del capítulo**: Desplegar y gestionar una solución de IA multi-agente lista para producción con agentes de Cliente e Inventario

---

### 🔍 Capítulo 6: Validación y planificación previa al despliegue
**Requisitos previos**: Capítulo 4 completado  
**Duración**: 1 hora  
**Complejidad**: ⭐⭐

#### Lo que aprenderás
- Planificación de capacidad y validación de recursos
- Estrategias de selección de SKU
- Comprobaciones previas al vuelo y automatización

#### Recursos de aprendizaje
- **📊 Planificación**: [Planificación de capacidad](docs/chapter-06-pre-deployment/capacity-planning.md) - Validación de recursos
- **💰 Selección**: [Selección de SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Opciones rentables
- **✅ Validación**: [Comprobaciones previas](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatizados

#### Ejercicios prácticos
- Ejecuta scripts de validación de capacidad
- Optimiza la selección de SKU para reducir costos
- Implementa comprobaciones automatizadas previas al despliegue

**💡 Resultado del capítulo**: Validar y optimizar despliegues antes de la ejecución

---

### 🚨 Capítulo 7: Resolución de problemas y depuración
**Requisitos previos**: Cualquier capítulo de despliegue completado  
**Duración**: 1-1.5 horas  
**Complejidad**: ⭐⭐

#### Lo que aprenderás
- Enfoques sistemáticos de depuración
- Problemas comunes y soluciones
- Resolución de problemas específica para IA

#### Recursos de aprendizaje
- **🔧 Problemas comunes**: [Problemas comunes](docs/chapter-07-troubleshooting/common-issues.md) - Preguntas frecuentes y soluciones
- **🕵️ Depuración**: [Guía de depuración](docs/chapter-07-troubleshooting/debugging.md) - Estrategias paso a paso
- **🤖 Problemas de IA**: [Resolución de problemas específica para IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemas con servicios de IA

#### Ejercicios prácticos
- Diagnostica fallos de despliegue
- Resuelve problemas de autenticación
- Depura la conectividad con servicios de IA

**💡 Resultado del capítulo**: Diagnosticar y resolver de forma independiente problemas comunes de despliegue

---

### 🏢 Capítulo 8: Producción y patrones empresariales
**Requisitos previos**: Capítulos 1-4 completados  
**Duración**: 2-3 horas  
**Complejidad**: ⭐⭐⭐⭐

#### Lo que aprenderás
- Estrategias de despliegue en producción
- Patrones de seguridad empresarial
- Monitoreo y optimización de costos

#### Recursos de aprendizaje
- **🏭 Producción**: [Mejores prácticas de IA en producción](docs/chapter-08-production/production-ai-practices.md) - Patrones empresariales
- **📝 Ejemplos**: [Ejemplo de microservicios](../../examples/microservices) - Arquitecturas complejas
- **📊 Monitoreo**: [Integración de Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitoreo

#### Ejercicios prácticos
- Implementar patrones de seguridad empresariales
- Configurar un monitoreo integral
- Desplegar en producción con gobernanza adecuada

**💡 Resultado del capítulo**: Desplegar aplicaciones preparadas para la empresa con capacidades completas de producción

---

## 🎓 Descripción del taller: Experiencia de aprendizaje práctica

> **⚠️ ESTADO DEL TALLER: En desarrollo activo**  
> Los materiales del taller se están desarrollando y refinando. Los módulos centrales están funcionales, pero algunas secciones avanzadas están incompletas. Estamos trabajando activamente para completar todo el contenido. [Ver progreso →](workshop/README.md)

### Materiales interactivos del taller
**Aprendizaje práctico integral con herramientas en el navegador y ejercicios guiados**

Nuestros materiales del taller proporcionan una experiencia de aprendizaje estructurada e interactiva que complementa el plan de estudios por capítulos anterior. El taller está diseñado tanto para aprendizaje autodirigido como para sesiones dirigidas por un instructor.

#### 🛠️ Características del taller
- **Interfaz basada en navegador**: Taller completo potenciado por MkDocs con búsqueda, copia y funciones de tema
- **Integración con GitHub Codespaces**: Configuración del entorno de desarrollo con un solo clic
- **Ruta de aprendizaje estructurada**: Ejercicios guiados de 8 módulos (3-4 horas en total)
- **Metodología progresiva**: Introducción → Selección → Validación → Deconstrucción → Configuración → Personalización → Finalización → Cierre
- **Entorno DevContainer interactivo**: Herramientas y dependencias preconfiguradas

#### 📚 Estructura de los módulos del taller
El taller sigue una **metodología progresiva de 8 módulos** que te lleva desde el descubrimiento hasta la maestría en despliegues:

| Módulo | Tema | Qué harás | Duración |
|--------|-------|----------------|----------|
| **0. Introducción** | Descripción del taller | Comprender los objetivos de aprendizaje, los requisitos previos y la estructura del taller | 15 min |
| **1. Selección** | Descubrimiento de plantillas | Explorar plantillas AZD y seleccionar la plantilla de IA adecuada para tu escenario | 20 min |
| **2. Validación** | Desplegar y verificar | Desplegar la plantilla con `azd up` y validar que la infraestructura funciona | 30 min |
| **3. Deconstrucción** | Entender la estructura | Usar GitHub Copilot para explorar la arquitectura de la plantilla, archivos Bicep y la organización del código | 30 min |
| **4. Configuración** | azure.yaml en profundidad | Dominar la configuración de `azure.yaml`, hooks de ciclo de vida y variables de entorno | 30 min |
| **5. Personalización** | Hazlo tuyo | Habilitar AI Search, trazado, evaluación y personalizar para tu escenario | 45 min |
| **6. Finalización** | Limpieza | Eliminar de forma segura los recursos con `azd down --purge` | 15 min |
| **7. Cierre** | Próximos pasos | Revisar logros, conceptos clave y continuar tu camino de aprendizaje | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Cómo empezar con el taller
```bash
# Opción 1: GitHub Codespaces (Recomendado)
# Haga clic en "Code" → "Create codespace on main" en el repositorio

# Opción 2: Desarrollo local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Siga las instrucciones de configuración en workshop/README.md
```

#### 🎯 Resultados de aprendizaje del taller
Al completar el taller, los participantes:
- **Desplegar aplicaciones de IA en producción**: Usar AZD con servicios de Microsoft Foundry
- **Dominar arquitecturas multiagente**: Implementar soluciones coordinadas de agentes de IA
- **Implementar mejores prácticas de seguridad**: Configurar la autenticación y el control de acceso
- **Optimizar para la escala**: Diseñar despliegues rentables y con buen rendimiento
- **Solucionar problemas de despliegue**: Resolver problemas comunes de forma independiente

#### 📖 Recursos del taller
- **🎥 Guía interactiva**: [Materiales del taller](workshop/README.md) - Entorno de aprendizaje basado en navegador
- **📋 Instrucciones módulo por módulo**:
  - [0. Introducción](workshop/docs/instructions/0-Introduction.md) - Descripción del taller y objetivos
  - [1. Selección](workshop/docs/instructions/1-Select-AI-Template.md) - Encontrar y seleccionar plantillas de IA
  - [2. Validación](workshop/docs/instructions/2-Validate-AI-Template.md) - Desplegar y verificar plantillas
  - [3. Deconstrucción](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorar la arquitectura de la plantilla
  - [4. Configuración](workshop/docs/instructions/4-Configure-AI-Template.md) - Dominar azure.yaml
  - [5. Personalización](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizar para tu escenario
  - [6. Finalización](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Limpiar recursos
  - [7. Cierre](workshop/docs/instructions/7-Wrap-up.md) - Revisar y próximos pasos
- **🛠️ Laboratorio del taller de IA**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Ejercicios enfocados en IA
- **💡 Inicio rápido**: [Guía de configuración del taller](workshop/README.md#quick-start) - Configuración del entorno

**Perfecto para**: Formación corporativa, cursos universitarios, aprendizaje autodirigido y bootcamps para desarrolladores.

---

## 📖 Profundización: Capacidades de AZD

Más allá de lo básico, AZD ofrece características potentes para despliegues de producción:

- **Despliegues basados en plantillas** - Utilizar plantillas preconstruidas para patrones comunes de aplicaciones
- **Infraestructura como Código** - Administrar recursos de Azure usando Bicep o Terraform  
- **Flujos de trabajo integrados** - Aprovisionar, desplegar y monitorear aplicaciones sin fricciones
- **Amigable para desarrolladores** - Optimizado para la productividad y experiencia del desarrollador

### **AZD + Microsoft Foundry: Perfecto para despliegues de IA**

**¿Por qué AZD para soluciones de IA?** AZD aborda los principales desafíos que enfrentan los desarrolladores de IA:

- **Plantillas listas para IA** - Plantillas preconfiguradas para Microsoft Foundry Models, Cognitive Services y cargas de trabajo de ML
- **Despliegues de IA seguros** - Patrones de seguridad integrados para servicios de IA, claves de API y endpoints de modelos  
- **Patrones de IA para producción** - Mejores prácticas para despliegues de aplicaciones de IA escalables y rentables
- **Flujos de trabajo de IA de extremo a extremo** - Desde el desarrollo del modelo hasta el despliegue en producción con monitoreo adecuado
- **Optimización de costos** - Asignación inteligente de recursos y estrategias de escalado para cargas de trabajo de IA
- **Integración con Microsoft Foundry** - Conexión fluida al catálogo de modelos y endpoints de Microsoft Foundry

---

## 🎯 Biblioteca de plantillas y ejemplos

### Destacados: Plantillas de Microsoft Foundry
**¡Comienza aquí si estás desplegando aplicaciones de IA!**

> **Nota:** Estas plantillas demuestran varios patrones de IA. Algunas son Azure Samples externas, otras son implementaciones locales.

| Plantilla | Capítulo | Complejidad | Servicios | Tipo |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externo |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capítulo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externo |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externo |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externo |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externo |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externo |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Destacados: Escenarios de aprendizaje completos
**Plantillas de aplicaciones listas para producción mapeadas a capítulos de aprendizaje**

| Plantilla | Capítulo de aprendizaje | Complejidad | Aprendizaje clave |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | Patrones básicos de despliegue de IA |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | Implementación RAG con Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capítulo 4 | ⭐⭐ | Integración con Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | Framework de agentes y llamadas a funciones |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐ | Orquestación de IA empresarial |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | Arquitectura multiagente con agentes de Cliente e Inventario |

### Aprendizaje por tipo de ejemplo

> **📌 Ejemplos locales vs. externos:**  
> **Ejemplos locales** (en este repositorio) = Listos para usar de inmediato  
> **Ejemplos externos** (Azure Samples) = Clonar desde los repositorios enlazados

#### Ejemplos locales (Listos para usar)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Implementación completa lista para producción con plantillas ARM
  - Arquitectura multiagente (Agentes de Cliente + Inventario)
  - Monitoreo y evaluación completos
  - Despliegue con un clic mediante plantilla ARM

#### Ejemplos locales - Aplicaciones en contenedores (Capítulos 2-5)
**Ejemplos completos de despliegues en contenedores en este repositorio:**
- [**Container App Examples**](examples/container-app/README.md) - Guía completa para despliegues containerizados
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST básica con escalado a cero
  - [Microservices Architecture](../../examples/container-app/microservices) - Despliegue multi-servicio listo para producción
  - Inicio rápido, producción y patrones de despliegue avanzados
  - Orientación sobre monitoreo, seguridad y optimización de costos

#### Ejemplos externos - Aplicaciones simples (Capítulos 1-2)
**Clona estos repositorios de Azure Samples para comenzar:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Patrones básicos de despliegue
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Despliegue de contenido estático
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Despliegue de API REST

#### Ejemplos externos - Integración de bases de datos (Capítulos 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Patrones de conectividad de bases de datos
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flujo de trabajo de datos serverless

#### Ejemplos externos - Patrones avanzados (Capítulos 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arquitecturas multi-servicio
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Procesamiento en segundo plano  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Patrones de ML listos para producción

### Colecciones de plantillas externas
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Colección curada de plantillas oficiales y de la comunidad
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentación de plantillas de Microsoft Learn
- [**Examples Directory**](examples/README.md) - Ejemplos locales de aprendizaje con explicaciones detalladas

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
  - Sigue: Introducción → Selección → Validación → Deconstrucción → Configuración → Personalización → Finalización → Cierre

### Recursos externos de aprendizaje
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitectura de Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculadora de Precios de Azure](https://azure.microsoft.com/pricing/calculator/)
- [Estado de Azure](https://status.azure.com/)

### Habilidades de Agente de IA para tu Editor
- [**Microsoft Azure Skills en skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 habilidades de agente abiertas para Azure AI, Foundry, despliegue, diagnósticos, optimización de costos y más. Instálalas en GitHub Copilot, Cursor, Claude Code, o en cualquier agente compatible:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guía rápida de resolución de problemas

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

# Opción 4: Comprobar los registros en Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Reautenticar
az logout
az login

azd auth logout
azd auth login

# Verificar la autenticación
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD genera nombres únicos, pero si hay conflicto:
azd down --force --purge

# Entonces vuelve a intentar con un entorno nuevo
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ La implementación de plantillas está tardando demasiado</strong></summary>

**Tiempos de espera normales:**
- Aplicación web simple: 5-10 minutos
- Aplicación con base de datos: 10-15 minutos
- Aplicaciones de IA: 15-25 minutos (el aprovisionamiento de OpenAI es lento)

```bash
# Comprobar el progreso
azd show

# Si está atascado más de 30 minutos, compruebe el Portal de Azure:
azd monitor
# Busque implementaciones fallidas
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Comprueba tu rol en Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Necesitas al menos el rol de "Colaborador"
# Pide a tu administrador de Azure que conceda:
# - Colaborador (para los recursos)
# - Administrador de acceso de usuario (para las asignaciones de roles)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Mostrar todos los endpoints de servicio
azd show

# O abrir el Portal de Azure
azd monitor

# Comprobar servicio específico
azd env get-values
# Buscar variables *_URL
```
</details>

### 📚 Recursos completos de resolución de problemas

- **Guía de problemas comunes:** [Soluciones detalladas](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemas específicos de IA:** [Resolución de problemas de IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guía de depuración:** [Depuración paso a paso](docs/chapter-07-troubleshooting/debugging.md)
- **Obtén ayuda:** [Discord de Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Finalización del curso y certificación

### Seguimiento del progreso
Sigue tu progreso de aprendizaje a través de cada capítulo:

- [ ] **Capítulo 1**: Fundamentos y inicio rápido ✅
- [ ] **Capítulo 2**: Desarrollo orientado a IA ✅  
- [ ] **Capítulo 3**: Configuración y autenticación ✅
- [ ] **Capítulo 4**: Infraestructura como código y despliegue ✅
- [ ] **Capítulo 5**: Soluciones de IA multiagente ✅
- [ ] **Capítulo 6**: Validación y planificación previas al despliegue ✅
- [ ] **Capítulo 7**: Resolución de problemas y depuración ✅
- [ ] **Capítulo 8**: Patrones de producción y empresariales ✅

### Verificación del aprendizaje
Después de completar cada capítulo, verifica tus conocimientos mediante:
1. **Ejercicio práctico**: Completa el despliegue práctico del capítulo
2. **Comprobación de conocimientos**: Revisa la sección de preguntas frecuentes (FAQ) de tu capítulo
3. **Discusión en la comunidad**: Comparte tu experiencia en Discord de Azure
4. **Siguiente capítulo**: Pasa al siguiente nivel de complejidad

### Beneficios por completar el curso
Al completar todos los capítulos, habrás obtenido:
- **Experiencia en producción**: Implementación de aplicaciones de IA reales en Azure
- **Habilidades profesionales**: Capacidades de despliegue aptas para empresas  
- **Reconocimiento en la comunidad**: Miembro activo de la comunidad de desarrolladores de Azure
- **Avance profesional**: Experiencia en despliegue AZD y IA demandada

---

## 🤝 Comunidad y soporte

### Obtener ayuda y soporte
- **Problemas técnicos**: [Informar errores y solicitar funciones](https://github.com/microsoft/azd-for-beginners/issues)
- **Preguntas de aprendizaje**: [Comunidad de Discord de Microsoft Azure](https://discord.gg/microsoft-azure) y [![Discord de Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ayuda específica de IA**: Únete al [![Discord de Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentación**: [Documentación oficial de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Perspectivas de la comunidad desde Discord de Microsoft Foundry

**Resultados recientes de la encuesta en el canal #Azure:**
- **45%** de los desarrolladores quiere usar AZD para cargas de trabajo de IA
- **Principales desafíos**: Implementaciones multi-servicio, gestión de credenciales, preparación para producción  
- **Más solicitados**: Plantillas específicas para IA, guías de resolución de problemas, mejores prácticas

**Únete a nuestra comunidad para:**
- Compartir tus experiencias con AZD + IA y obtener ayuda
- Acceder a vistas previas tempranas de nuevas plantillas de IA
- Contribuir a las mejores prácticas de despliegue de IA
- Influir en el desarrollo futuro de funciones de IA + AZD

### Contribuir al curso
¡Damos la bienvenida a contribuciones! Por favor lee nuestra [Guía de contribución](CONTRIBUTING.md) para obtener detalles sobre:
- **Mejoras de contenido**: Mejora los capítulos y ejemplos existentes
- **Nuevos ejemplos**: Añade escenarios y plantillas del mundo real  
- **Traducción**: Ayuda a mantener el soporte multilingüe
- **Informes de errores**: Mejora la precisión y claridad
- **Estándares de la comunidad**: Sigue nuestras directrices comunitarias inclusivas

---

## 📄 Información del curso

### Licencia
Este proyecto está licenciado bajo la Licencia MIT - consulta el archivo [LICENSE](../../LICENSE) para más detalles.

### Recursos de Microsoft Learning relacionados

Nuestro equipo produce otros cursos de aprendizaje integrales:

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

**Principiantes**: Comienza con [Capítulo 1: Fundamentos y Inicio Rápido](#-chapter-1-foundation--quick-start)  
**Desarrolladores de IA**: Ir a [Capítulo 2: Desarrollo con IA como prioridad](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Desarrolladores experimentados**: Empieza con [Capítulo 3: Configuración y Autenticación](#️-chapter-3-configuration--authentication)

**Siguientes pasos**: [Comenzar Capítulo 1 - Conceptos básicos de AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso legal**:
Este documento ha sido traducido utilizando el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la exactitud, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por traductores humanos. No nos hacemos responsables de ningún malentendido o mala interpretación derivada del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# AZD Para Principiantes: Un viaje de aprendizaje estructurado

![AZD-para-principiantes](../../translated_images/es/azdbeginners.5527441dd9f74068.webp) 

[![Observadores de GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Bifurcaciones de GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Estrellas de GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord de Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord de Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traducciones automatizadas (siempre actualizadas)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Árabe](../ar/README.md) | [Bengalí](../bn/README.md) | [Búlgaro](../bg/README.md) | [Birmano (Myanmar)](../my/README.md) | [Chino (Simplificado)](../zh-CN/README.md) | [Chino (Tradicional, Hong Kong)](../zh-HK/README.md) | [Chino (Tradicional, Macao)](../zh-MO/README.md) | [Chino (Tradicional, Taiwán)](../zh-TW/README.md) | [Croata](../hr/README.md) | [Checo](../cs/README.md) | [Danés](../da/README.md) | [Neerlandés](../nl/README.md) | [Estonio](../et/README.md) | [Finlandés](../fi/README.md) | [Francés](../fr/README.md) | [Alemán](../de/README.md) | [Griego](../el/README.md) | [Hebreo](../he/README.md) | [Hindi](../hi/README.md) | [Húngaro](../hu/README.md) | [Indonesio](../id/README.md) | [Italiano](../it/README.md) | [Japonés](../ja/README.md) | [Kannada](../kn/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malayo](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalí](../ne/README.md) | [Pidgin nigeriano](../pcm/README.md) | [Noruego](../no/README.md) | [Persa (Farsi)](../fa/README.md) | [Polaco](../pl/README.md) | [Portugués (Brasil)](../pt-BR/README.md) | [Portugués (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumano](../ro/README.md) | [Ruso](../ru/README.md) | [Serbio (cirílico)](../sr/README.md) | [Eslovaco](../sk/README.md) | [Esloveno](../sl/README.md) | [Español](./README.md) | [Swahili](../sw/README.md) | [Sueco](../sv/README.md) | [Tagalo (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Tailandés](../th/README.md) | [Turco](../tr/README.md) | [Ucraniano](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **¿Prefieres clonar localmente?**
>
> Este repositorio incluye 50+ traducciones, lo que aumenta significativamente el tamaño de la descarga. Para clonar sin traducciones, usa sparse checkout:
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
> Esto te proporciona todo lo necesario para completar el curso con una descarga mucho más rápida.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 ¿Qué es Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** es una herramienta de línea de comandos orientada al desarrollador que facilita desplegar aplicaciones en Azure. En lugar de crear y conectar manualmente docenas de recursos de Azure, puedes desplegar aplicaciones completas con un solo comando.

### La magia de `azd up`

```bash
# Este único comando hace todo:
# ✅ Crea todos los recursos de Azure
# ✅ Configura la red y la seguridad
# ✅ Compila el código de tu aplicación
# ✅ Despliega en Azure
# ✅ Te proporciona una URL funcional
azd up
```

**¡Eso es todo!** Sin clics en el Portal de Azure, sin tener que aprender plantillas ARM complejas primero, sin configuración manual: solo aplicaciones funcionando en Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: ¿Cuál es la diferencia?

Esta es la pregunta más común que hacen los principiantes. Aquí está la respuesta simple:

| Característica | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|----------------|----------------------|--------------------------------|
| **Propósito** | Gestionar recursos individuales de Azure | Desplegar aplicaciones completas |
| **Mentalidad** | Enfocado en infraestructura | Enfocado en aplicaciones |
| **Ejemplo** | `az webapp create --name myapp...` | `azd up` |
| **Curva de aprendizaje** | Debe conocer los servicios de Azure | Solo conoce tu aplicación |
| **Ideal para** | DevOps, Infraestructura | Desarrolladores, prototipado |

### Analogía simple

- **Azure CLI** es como tener todas las herramientas para construir una casa: martillos, sierras, clavos. Puedes construir cualquier cosa, pero necesitas conocer la construcción.
- **Azure Developer CLI** es como contratar a un contratista: describes lo que quieres y ellos se encargan de la construcción.

### Cuándo usar cada uno

| Escenario | Usa esto |
|----------|----------|
| "Quiero desplegar mi aplicación web rápidamente" | `azd up` |
| "Necesito crear solo una cuenta de almacenamiento" | `az storage account create` |
| "Estoy construyendo una aplicación de IA completa" | `azd init --template azure-search-openai-demo` |
| "Necesito depurar un recurso específico de Azure" | `az resource show` |
| "Quiero un despliegue listo para producción en minutos" | `azd up --environment production` |

### ¡Funcionan juntos!

AZD utiliza Azure CLI internamente. Puedes usar ambos:
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
|---------|-------------|
| 🔗 [**Galería Awesome AZD**](https://azure.github.io/awesome-azd/) | Explora más de 200 plantillas con despliegue con un clic |
| 🔗 [**Enviar una plantilla**](https://github.com/Azure/awesome-azd/issues) | Contribuye con tu propia plantilla a la comunidad |
| 🔗 [**Repositorio de GitHub**](https://github.com/Azure/awesome-azd) | Dale estrella y explora el código fuente |

### Plantillas populares de IA de Awesome AZD

```bash
# Chat RAG con Azure OpenAI + Búsqueda de IA
azd init --template azure-search-openai-demo

# Aplicación rápida de chat de IA
azd init --template openai-chat-app-quickstart

# Agentes de IA con Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Comienza en 3 pasos

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

# Implementar en Azure (¡crea todo!)
azd up
```

**🎉 ¡Listo!** Tu aplicación ya está en vivo en Azure.

### Limpieza (¡No lo olvides!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cómo usar este curso

Este curso está diseñado para un aprendizaje progresivo: comienza donde te sientas cómodo y avanza paso a paso:

| Tu experiencia | Comienza aquí |
|-----------------|---------------|
| **Nuevo en Azure** | [Cap. 1: Fundamentos](../..) |
| **Conoces Azure, nuevo en AZD** | [Cap. 1: Fundamentos](../..) |
| **Quieres desplegar aplicaciones de IA** | [Cap. 2: Desarrollo de IA](../..) |
| **Quieres práctica práctica** | [🎓 Taller interactivo](workshop/README.md) - laboratorio guiado de 3-4 horas |
| **Necesitas patrones para producción** | [Cap. 8: Producción y empresarial](../..) |

### Configuración rápida

1. **Haz fork de este repositorio**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clónalo**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obtén ayuda**: [Comunidad de Discord de Azure](https://discord.com/invite/ByRwuEEgH4)

> **¿Prefieres clonar localmente?**
>
> Este repositorio incluye 50+ traducciones, lo que aumenta significativamente el tamaño de la descarga. Para clonar sin traducciones, usa sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Esto te proporciona todo lo necesario para completar el curso con una descarga mucho más rápida.


## Descripción del curso

Domina Azure Developer CLI (azd) a través de capítulos estructurados diseñados para un aprendizaje progresivo. **Enfoque especial en el despliegue de aplicaciones de IA con integración de Microsoft Foundry.**

### Por qué este curso es esencial para los desarrolladores modernos

Según las opiniones de la comunidad de Microsoft Foundry en Discord, **el 45% de los desarrolladores quieren usar AZD para cargas de trabajo de IA** pero encuentran desafíos con:
- Arquitecturas de IA complejas con múltiples servicios
- Mejores prácticas para el despliegue de IA en producción  
- Integración y configuración de servicios de IA de Azure
- Optimización de costos para cargas de trabajo de IA
- Solución de problemas específicos de despliegue de IA

### Objetivos de aprendizaje

Al completar este curso estructurado, tú:
- **Domina los fundamentos de AZD**: conceptos clave, instalación y configuración
- **Despliega aplicaciones de IA**: usa AZD con los servicios de Microsoft Foundry
- **Implementa Infraestructura como Código**: gestiona recursos de Azure con plantillas Bicep
- **Soluciona despliegues**: resuelve problemas comunes y depura errores
- **Optimiza para producción**: seguridad, escalado, monitorización y gestión de costos
- **Construye soluciones multi-agente**: despliega arquitecturas de IA complejas

## 🗺️ Mapa del curso: Navegación rápida por capítulo

Cada capítulo tiene un README dedicado con objetivos de aprendizaje, guías rápidas y ejercicios:

| Capítulo | Tema | Lecciones | Duración | Complejidad |
|---------|-------|---------|----------|------------|
| **[Cap. 1: Fundamentos](docs/chapter-01-foundation/README.md)** | Primeros pasos | [Conceptos básicos de AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalación](docs/chapter-01-foundation/installation.md) &#124; [Primer proyecto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap. 2: Desarrollo de IA](docs/chapter-02-ai-development/README.md)** | Aplicaciones centradas en IA | [Integración con Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agentes de IA](docs/chapter-02-ai-development/agents.md) &#124; [Despliegue de modelos de IA](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Taller](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Cap. 3: Configuración](docs/chapter-03-configuration/README.md)** | Autenticación y seguridad | [Configuración](docs/chapter-03-configuration/configuration.md) &#124; [Autenticación y seguridad](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap 4: Infraestructura](docs/chapter-04-infrastructure/README.md)** | IaC & Despliegue | [Guía de despliegue](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Aprovisionamiento](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 horas | ⭐⭐⭐ |
| **[Cap 5: Multiagente](docs/chapter-05-multi-agent/README.md)** | Soluciones de agentes de IA | [Escenario minorista](examples/retail-scenario.md) &#124; [Patrones de coordinación](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 horas | ⭐⭐⭐⭐ |
| **[Cap 6: Pre-despliegue](docs/chapter-06-pre-deployment/README.md)** | Planificación y Validación | [Comprobaciones previas](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planificación de capacidad](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Selección de SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hora | ⭐⭐ |
| **[Cap 7: Solución de problemas](docs/chapter-07-troubleshooting/README.md)** | Depuración y Corrección | [Problemas comunes](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Depuración](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemas de IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 horas | ⭐⭐ |
| **[Cap 8: Producción](docs/chapter-08-production/README.md)** | Patrones empresariales | [Prácticas de producción](docs/chapter-08-production/production-ai-practices.md) | 2-3 horas | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Laboratorio práctico | [Introducción](workshop/docs/instructions/0-Introduction.md) &#124; [Selección](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validación](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstrucción](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuración](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalización](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Desmantelamiento](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Cierre](workshop/docs/instructions/7-Wrap-up.md) | 3-4 horas | ⭐⭐ |

**Duración total del curso:** ~10-14 horas | **Progresión de habilidades:** Principiante → Listo para producción

---

## 📚 Capítulos de aprendizaje

*Seleccione su ruta de aprendizaje según su nivel de experiencia y objetivos*

### 🚀 Capítulo 1: Fundamentos y Inicio rápido
**Requisitos previos**: Suscripción de Azure, conocimientos básicos de línea de comandos  
**Duración**: 30-45 minutos  
**Complejidad**: ⭐

#### Qué aprenderás
- Comprender los fundamentos de Azure Developer CLI
- Instalar AZD en su plataforma
- Su primer despliegue exitoso

#### Recursos de aprendizaje
- **🎯 Comience aquí**: [¿Qué es Azure Developer CLI?](../..)
- **📖 Teoría**: [Conceptos básicos de AZD](docs/chapter-01-foundation/azd-basics.md) - Conceptos y terminología básicos
- **⚙️ Configuración**: [Instalación y configuración](docs/chapter-01-foundation/installation.md) - Guías específicas por plataforma
- **🛠️ Práctico**: [Su primer proyecto](docs/chapter-01-foundation/first-project.md) - Tutorial paso a paso
- **📋 Referencia rápida**: [Hoja de referencia de comandos](resources/cheat-sheet.md)

#### Ejercicios prácticos
```bash
# Comprobación rápida de la instalación
azd version

# Despliegue su primera aplicación
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

**✅ Validación del éxito:**
```bash
# Al completar el Capítulo 1, deberías poder:
azd version              # Muestra la versión instalada
azd init --template todo-nodejs-mongo  # Inicializa el proyecto
azd up                  # Despliega en Azure
azd show                # Muestra la URL de la aplicación en ejecución
# La aplicación se abre en el navegador y funciona
azd down --force --purge  # Limpia los recursos
```

**📊 Inversión de tiempo:** 30-45 minutos  
**📈 Nivel de habilidad después:** Puede desplegar aplicaciones básicas de forma independiente

---

### 🤖 Capítulo 2: Desarrollo centrado en IA (Recomendado para desarrolladores de IA)
**Requisitos previos**: Capítulo 1 completado  
**Duración**: 1-2 horas  
**Complejidad**: ⭐⭐

#### Qué aprenderás
- Integración de Microsoft Foundry con AZD
- Desplegar aplicaciones impulsadas por IA
- Comprender las configuraciones de servicios de IA

#### Recursos de aprendizaje
- **🎯 Comience aquí**: [Integración con Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agentes de IA**: [Guía de agentes de IA](docs/chapter-02-ai-development/agents.md) - Desplegar agentes inteligentes con AZD
- **📖 Patrones**: [Despliegue de modelos de IA](docs/chapter-02-ai-development/ai-model-deployment.md) - Desplegar y gestionar modelos de IA
- **🛠️ Taller**: [Laboratorio de IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Prepare sus soluciones de IA para AZD
- **🎥 Guía interactiva**: [Materiales del taller](workshop/README.md) - Aprendizaje en el navegador con MkDocs * DevContainer Environment
- **📋 Plantillas**: [Plantillas de Microsoft Foundry](../..)
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
azd monitor  # Comprobar que Application Insights muestra telemetría
azd down --force --purge
```

**📊 Inversión de tiempo:** 1-2 horas  
**📈 Nivel de habilidad después:** Puede desplegar y configurar aplicaciones de IA listas para producción  
**💰 Conciencia de costos:** Entender los costes de desarrollo de $80-150/mes, costes de producción de $300-3500/mes

#### 💰 Consideraciones de costos para despliegues de IA

**Entorno de desarrollo (Estimado $80-150/mes):**
- Azure OpenAI (pago por uso): $0-50/mes (basado en uso de tokens)
- AI Search (nivel Básico): $75/mes
- Container Apps (Consumo): $0-20/mes
- Almacenamiento (Estándar): $1-5/mes

**Entorno de producción (Estimado $300-3,500+/mes):**
- Azure OpenAI (PTU para rendimiento consistente): $3,000+/mes OR Pay-as-go with high volume
- AI Search (nivel Estándar): $250/mes
- Container Apps (Dedicado): $50-100/mes
- Application Insights: $5-50/mes
- Almacenamiento (Premium): $10-50/mes

**💡 Consejos para optimizar costos:**
- Use **Free Tier** de Azure OpenAI para aprendizaje (50,000 tokens/mes incluidos)
- Ejecute `azd down` para liberar recursos cuando no esté desarrollando activamente
- Comience con facturación basada en consumo, actualice a PTU solo para producción
- Use `azd provision --preview` para estimar costes antes del despliegue
- Active el autoescalado: pague solo por el uso real

**Monitoreo de costos:**
```bash
# Verificar los costos mensuales estimados
azd provision --preview

# Supervisar los costos reales en el Portal de Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capítulo 3: Configuración y Autenticación
**Requisitos previos**: Capítulo 1 completado  
**Duración**: 45-60 minutos  
**Complejidad**: ⭐⭐

#### Qué aprenderás
- Configuración y gestión de entornos
- Autenticación y mejores prácticas de seguridad
- Nomenclatura y organización de recursos

#### Recursos de aprendizaje
- **📖 Configuración**: [Guía de configuración](docs/chapter-03-configuration/configuration.md) - Configuración del entorno
- **🔐 Seguridad**: [Patrones de autenticación e identidad administrada](docs/chapter-03-configuration/authsecurity.md) - Patrones de autenticación
- **📝 Ejemplos**: [Ejemplo de aplicación de base de datos](examples/database-app/README.md) - Ejemplos de bases de datos AZD

#### Ejercicios prácticos
- Configurar múltiples entornos (dev, staging, prod)
- Configurar autenticación con identidad administrada
- Implementar configuraciones específicas por entorno

**💡 Resultado del capítulo**: Gestionar múltiples entornos con la autenticación y seguridad adecuadas

---

### 🏗️ Capítulo 4: Infraestructura como Código y Despliegue
**Requisitos previos**: Capítulos 1-3 completados  
**Duración**: 1-1.5 horas  
**Complejidad**: ⭐⭐⭐

#### Qué aprenderás
- Patrones avanzados de despliegue
- Infraestructura como Código con Bicep
- Estrategias de aprovisionamiento de recursos

#### Recursos de aprendizaje
- **📖 Despliegue**: [Guía de despliegue](docs/chapter-04-infrastructure/deployment-guide.md) - Flujos de trabajo completos
- **🏗️ Aprovisionamiento**: [Aprovisionamiento de recursos](docs/chapter-04-infrastructure/provisioning.md) - Gestión de recursos de Azure
- **📝 Ejemplos**: [Ejemplo de Container App](../../examples/container-app) - Despliegues en contenedores

#### Ejercicios prácticos
- Crear plantillas Bicep personalizadas
- Desplegar aplicaciones de múltiples servicios
- Implementar estrategias de despliegue blue-green

**💡 Resultado del capítulo**: Desplegar aplicaciones complejas de múltiples servicios usando plantillas de infraestructura personalizadas

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
- **🤖 Proyecto destacado**: [Solución multiagente para retail](examples/retail-scenario.md) - Implementación completa
- **🛠️ Plantillas ARM**: [Paquete de plantillas ARM](../../examples/retail-multiagent-arm-template) - Despliegue con un clic
- **📖 Arquitectura**: [Patrones de coordinación multiagente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patrones

#### Ejercicios prácticos
```bash
# Desplegar la solución minorista multiagente completa
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorar configuraciones de agentes
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Resultado del capítulo**: Desplegar y gestionar una solución de IA multiagente lista para producción con agentes de Cliente e Inventario

---

### 🔍 Capítulo 6: Validación y planificación previas al despliegue
**Requisitos previos**: Capítulo 4 completado  
**Duración**: 1 hora  
**Complejidad**: ⭐⭐

#### Qué aprenderás
- Planificación de capacidad y validación de recursos
- Estrategias de selección de SKU
- Comprobaciones previas al despliegue y automatización

#### Recursos de aprendizaje
- **📊 Planificación**: [Planificación de capacidad](docs/chapter-06-pre-deployment/capacity-planning.md) - Validación de recursos
- **💰 Selección**: [Selección de SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Opciones rentables
- **✅ Validación**: [Comprobaciones previas al despliegue](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatizados

#### Ejercicios prácticos
- Ejecutar scripts de validación de capacidad
- Optimizar la selección de SKU por coste
- Implementar comprobaciones automatizadas previas al despliegue

**💡 Resultado del capítulo**: Validar y optimizar despliegues antes de la ejecución

---

### 🚨 Capítulo 7: Solución de problemas y depuración
**Requisitos previos**: Cualquier capítulo de despliegue completado  
**Duración**: 1-1.5 horas  
**Complejidad**: ⭐⭐

#### Qué aprenderás
- Enfoques de depuración sistemáticos
- Problemas comunes y soluciones
- Solución de problemas específica para IA

#### Recursos de aprendizaje
- **🔧 Problemas comunes**: [Problemas comunes](docs/chapter-07-troubleshooting/common-issues.md) - FAQ y soluciones
- **🕵️ Depuración**: [Guía de depuración](docs/chapter-07-troubleshooting/debugging.md) - Estrategias paso a paso
- **🤖 Problemas de IA**: [Solución de problemas específica para IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemas con servicios de IA

#### Ejercicios prácticos
- Diagnosticar fallos de despliegue
- Resolver problemas de autenticación
- Depurar la conectividad de servicios de IA

**💡 Resultado del capítulo**: Diagnosticar y resolver de forma independiente problemas comunes de despliegue

---

### 🏢 Capítulo 8: Producción y patrones empresariales
**Requisitos previos**: Capítulos 1-4 completados  
**Duración**: 2-3 horas  
**Complejidad**: ⭐⭐⭐⭐

#### Qué aprenderás
- Estrategias de despliegue en producción
- Patrones de seguridad empresariales
- Monitorización y optimización de costes

#### Recursos de aprendizaje
- **🏭 Producción**: [Mejores prácticas de IA para producción](docs/chapter-08-production/production-ai-practices.md) - Patrones empresariales
- **📝 Ejemplos**: [Ejemplo de microservicios](../../examples/microservices) - Arquitecturas complejas
- **📊 Monitorización**: [Integración con Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorización

#### Ejercicios prácticos
- Implementar patrones de seguridad empresariales
- Configurar monitorización integral
- Desplegar en producción con la gobernanza adecuada

**💡 Resultado del capítulo**: Desplegar aplicaciones listas para la empresa con capacidades completas de producción

---

## 🎓 Descripción del taller: Experiencia de aprendizaje práctica

> **⚠️ ESTADO DEL TALLER: En desarrollo activo**
> Los materiales del taller están siendo desarrollados y refinados. Los módulos principales son funcionales, pero algunas secciones avanzadas están incompletas. Estamos trabajando activamente para completar todo el contenido. [Ver progreso →](workshop/README.md)

### Interactive Workshop Materials
**Aprendizaje práctico integral con herramientas basadas en el navegador y ejercicios guiados**

Nuestros materiales del taller proporcionan una experiencia de aprendizaje estructurada e interactiva que complementa el plan de estudios por capítulos anterior. El taller está diseñado tanto para aprendizaje autodirigido como para sesiones dirigidas por un instructor.

#### 🛠️ Workshop Features
- **Browser-Based Interface**: Complete MkDocs-powered workshop with search, copy, and theme features
- **GitHub Codespaces Integration**: One-click development environment setup
- **Structured Learning Path**: 8-module guided exercises (3-4 hours total)
- **Progressive Methodology**: Introducción → Selección → Validación → Deconstrucción → Configuración → Personalización → Limpieza → Cierre
- **Interactive DevContainer Environment**: Pre-configured tools and dependencies

#### 📚 Workshop Module Structure
The workshop follows an **8-module progressive methodology** that takes you from discovery to deployment mastery:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introducción** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 min |
| **1. Selección** | Template Discovery | Explore AZD templates and select the right AI template for your scenario | 20 min |
| **2. Validación** | Deploy & Verify | Deploy the template with `azd up` and validate infrastructure works | 30 min |
| **3. Deconstrucción** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 min |
| **4. Configuración** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 min |
| **5. Personalización** | Make It Yours | Enable AI Search, tracing, evaluation, and customize for your scenario | 45 min |
| **6. Limpieza** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 min |
| **7. Cierre** | Next Steps | Review accomplishments, key concepts, and continue your learning journey | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Getting Started with the Workshop
```bash
# Opción 1: GitHub Codespaces (recomendado)
# Haz clic en "Code" → "Crear codespace en main" en el repositorio

# Opción 2: Desarrollo local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Sigue las instrucciones de configuración en workshop/README.md
```

#### 🎯 Workshop Learning Outcomes
By completing the workshop, participants will:
- **Desplegar aplicaciones de IA en producción**: Use AZD with Microsoft Foundry services
- **Dominar arquitecturas multi-agente**: Implement coordinated AI agent solutions
- **Implementar mejores prácticas de seguridad**: Configure authentication and access control
- **Optimizar para la escalabilidad**: Design cost-effective, performant deployments
- **Resolver problemas de despliegue**: Resolve common issues independently

#### 📖 Workshop Resources
- **🎥 Guía interactiva**: [Materiales del taller](workshop/README.md) - Entorno de aprendizaje basado en navegador
- **📋 Instrucciones módulo por módulo**:
  - [0. Introducción](workshop/docs/instructions/0-Introduction.md) - Visión general del taller y objetivos
  - [1. Selección](workshop/docs/instructions/1-Select-AI-Template.md) - Find and select AI templates
  - [2. Validación](workshop/docs/instructions/2-Validate-AI-Template.md) - Deploy and verify templates
  - [3. Deconstrucción](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explore template architecture
  - [4. Configuración](workshop/docs/instructions/4-Configure-AI-Template.md) - Master azure.yaml
  - [5. Personalización](workshop/docs/instructions/5-Customize-AI-Template.md) - Customize for your scenario
  - [6. Limpieza](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Clean up resources
  - [7. Cierre](workshop/docs/instructions/7-Wrap-up.md) - Review and next steps
- **🛠️ Laboratorio del taller de IA**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-focused exercises
- **💡 Inicio rápido**: [Workshop Setup Guide](workshop/README.md#quick-start) - Configuration del entorno

**Perfecto para**: formación corporativa, cursos universitarios, aprendizaje autodidacta y bootcamps para desarrolladores.

---

## 📖 Deep Dive: AZD Capabilities

Más allá de lo básico, AZD proporciona funciones potentes para despliegues en producción:

- **Despliegues basados en plantillas** - Usa plantillas preconstruidas para patrones comunes de aplicación
- **Infraestructura como Código** - Manage Azure resources using Bicep or Terraform  
- **Flujos de trabajo integrados** - Aprovisiona, despliega y supervisa aplicaciones de manera fluida
- **Orientado a desarrolladores** - Optimizado para la productividad y la experiencia del desarrollador

### **AZD + Microsoft Foundry: Perfecto para despliegues de IA**

**¿Por qué AZD para soluciones de IA?** AZD aborda los principales retos que enfrentan los desarrolladores de IA:

- **Plantillas preparadas para IA** - Pre-configured templates for Azure OpenAI, Cognitive Services, and ML workloads
- **Despliegues de IA seguros** - Built-in security patterns for AI services, API keys, and model endpoints  
- **Patrones de IA para producción** - Best practices for scalable, cost-effective AI application deployments
- **Flujos de trabajo de IA de extremo a extremo** - From model development to production deployment with proper monitoring
- **Optimización de costos** - Smart resource allocation and scaling strategies for AI workloads
- **Integración con Microsoft Foundry** - Seamless connection to Microsoft Foundry model catalog and endpoints

---

## 🎯 Templates & Examples Library

### Featured: Microsoft Foundry Templates
**¡Empieza aquí si vas a desplegar aplicaciones de IA!**

> **Nota:** Estas plantillas demuestran varios patrones de IA. Algunas son Azure Samples externas, otras son implementaciones locales.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Introducción al chat de IA**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externo |
| [**Introducción a agentes de IA**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capítulo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externo |
| [**Demostración Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externo |
| [**Inicio rápido de OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externo |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externo |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externo |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Featured: Complete Learning Scenarios
**Plantillas de aplicaciones listas para producción mapeadas a capítulos de aprendizaje**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### Learning by Example Type

> **📌 Ejemplos locales vs. externos:**  
> **Ejemplos locales** (in this repo) = Ready to use immediately  
> **Ejemplos externos** (Azure Samples) = Clone from linked repositories

#### Ejemplos locales (Listos para usar)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Implementación completa lista para producción con plantillas ARM
  - Arquitectura multi-agente (agentes Customer + Inventory)
  - Monitoreo y evaluación exhaustivos
  - Despliegue con un clic vía plantilla ARM

#### Ejemplos locales - Aplicaciones en contenedores (Capítulos 2-5)
**Ejemplos completos de despliegue en contenedores en este repositorio:**
- [**Ejemplos de aplicaciones de contenedores**](examples/container-app/README.md) - Guía completa para despliegues contenedorizados
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST básica con scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Despliegue multi-servicio listo para producción
  - Patrones de despliegue Quick Start, Production y Advanced
  - Guía de monitoreo, seguridad y optimización de costos

#### Ejemplos externos - Aplicaciones simples (Capítulos 1-2)
**Clona estos repositorios de Azure Samples para comenzar:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Patrones básicos de despliegue
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Despliegue de contenido estático
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Despliegue de API REST

#### Ejemplos externos - Integración de bases de datos (Capítulo 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Patrones de conectividad a bases de datos
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flujo de datos serverless

#### Ejemplos externos - Patrones avanzados (Capítulos 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arquitecturas multi-servicio
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Procesamiento en segundo plano  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Patrones ML listos para producción

### External Template Collections
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Curated collection of official and community templates
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn template documentation
- [**Examples Directory**](examples/README.md) - Local learning examples with detailed explanations

---

## 📚 Learning Resources & References

### Referencias rápidas
- [**Resumen de comandos**](resources/cheat-sheet.md) - Comandos esenciales de azd organizados por capítulo
- [**Glosario**](resources/glossary.md) - Terminología de Azure y azd  
- [**FAQ**](resources/faq.md) - Preguntas comunes organizadas por capítulo de aprendizaje
- [**Guía de estudio**](resources/study-guide.md) - Ejercicios prácticos exhaustivos

### Talleres prácticos
- [**Laboratorio del taller de IA**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Haz que tus soluciones de IA sean desplegables con AZD (2-3 horas)
- [**Taller interactivo**](workshop/README.md) - Ejercicios guiados de 8 módulos con MkDocs y GitHub Codespaces
  - Sigue: Introducción → Selección → Validación → Deconstrucción → Configuración → Personalización → Limpieza → Cierre

### Recursos de aprendizaje externos
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

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

# Establecer para el entorno AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verificar
az account show
```
</details>
<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Pruebe una región de Azure diferente
azd env set AZURE_LOCATION "westus2"
azd up

# O use SKUs más pequeños en desarrollo
# Edite infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" falla a mitad del proceso</strong></summary>

```bash
# Opción 1: Limpiar y reintentar
azd down --force --purge
azd up

# Opción 2: Solo arreglar la infraestructura
azd provision

# Opción 3: Comprobar estado detallado
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
<summary><strong>❌ "Resource already exists" or conflictos de nombres</strong></summary>

```bash
# AZD genera nombres únicos, pero si hay conflicto:
azd down --force --purge

# Entonces reintente con un entorno nuevo
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ El despliegue de la plantilla tarda demasiado</strong></summary>

**Tiempos de espera normales:**
- Aplicación web simple: 5-10 minutos
- Aplicación con base de datos: 10-15 minutos
- Aplicaciones de IA: 15-25 minutos (el aprovisionamiento de OpenAI es lento)

```bash
# Comprobar el progreso
azd show

# Si estás atascado más de 30 minutos, revisa el Portal de Azure:
azd monitor
# Busca implementaciones fallidas
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
# Mostrar todos los puntos de conexión de los servicios
azd show

# O abre el portal de Azure
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
- **Obtener ayuda:** [Discord de Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Finalización del curso y certificación

### Seguimiento del progreso
Sigue tu progreso de aprendizaje por capítulo:

- [ ] **Capítulo 1**: Fundamentos y Inicio rápido ✅
- [ ] **Capítulo 2**: Desarrollo centrado en IA ✅  
- [ ] **Capítulo 3**: Configuración y autenticación ✅
- [ ] **Capítulo 4**: Infraestructura como código y despliegue ✅
- [ ] **Capítulo 5**: Soluciones de IA multiagente ✅
- [ ] **Capítulo 6**: Validación y planificación previas al despliegue ✅
- [ ] **Capítulo 7**: Solución de problemas y depuración ✅
- [ ] **Capítulo 8**: Patrones de producción y empresariales ✅

### Verificación del aprendizaje
Después de completar cada capítulo, verifica tus conocimientos mediante:
1. **Ejercicio práctico**: Realiza el despliegue práctico del capítulo
2. **Comprobación de conocimientos**: Revisa la sección de preguntas frecuentes de tu capítulo
3. **Discusión en la comunidad**: Comparte tu experiencia en Discord de Azure
4. **Siguiente capítulo**: Pasa al siguiente nivel de complejidad

### Beneficios al completar el curso
Al completar todos los capítulos, habrás:
- **Experiencia en producción**: Despliegue de aplicaciones reales de IA en Azure
- **Habilidades profesionales**: Capacidades de despliegue listas para la empresa  
- **Reconocimiento en la comunidad**: Miembro activo de la comunidad de desarrolladores de Azure
- **Avance profesional**: Experiencia demandada en AZD y despliegue de IA

---

## 🤝 Comunidad y soporte

### Obtén ayuda y soporte
- **Problemas técnicos**: [Reportar errores y solicitar funciones](https://github.com/microsoft/azd-for-beginners/issues)
- **Preguntas sobre aprendizaje**: [Comunidad de Microsoft Azure en Discord](https://discord.gg/microsoft-azure) y [![Discord de Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ayuda específica de IA**: Únete al [![Discord de Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentación**: [Documentación oficial de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Información de la comunidad desde Discord de Microsoft Foundry

**Resultados recientes de la encuesta en el canal #Azure:**
- **45%** de desarrolladores quieren usar AZD para cargas de trabajo de IA
- **Principales desafíos**: Despliegues multiservicio, gestión de credenciales, preparación para producción  
- **Más solicitado**: Plantillas específicas para IA, guías de solución de problemas, mejores prácticas

**Únete a nuestra comunidad para:**
- Comparte tus experiencias con AZD + IA y recibe ayuda
- Accede a vistas previas tempranas de nuevas plantillas de IA
- Contribuye a las mejores prácticas de despliegue de IA
- Influye en el desarrollo futuro de funciones de IA + AZD

### Contribuir al curso
¡Damos la bienvenida a las contribuciones! Por favor lee nuestra [Guía de contribución](CONTRIBUTING.md) para detalles sobre:
- **Mejoras de contenido**: Mejora los capítulos y ejemplos existentes
- **Nuevos ejemplos**: Añade escenarios y plantillas del mundo real  
- **Traducción**: Ayuda a mantener el soporte multilingüe
- **Reportes de errores**: Mejora la precisión y la claridad
- **Estándares de la comunidad**: Sigue nuestras pautas comunitarias inclusivas

---

## 📄 Información del curso

### Licencia
Este proyecto está bajo la Licencia MIT - consulta el archivo [LICENSE](../../LICENSE) para más detalles.

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
 
### Aprendizaje fundamental
[![ML para principiantes](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Ciencia de datos para principiantes](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![IA para principiantes](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Ciberseguridad para principiantes](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Desarrollo web para principiantes](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT para principiantes](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Desarrollo XR para principiantes](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serie Copilot
[![Copilot para programación asistida por IA](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot para C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Aventura Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navegación del curso

**🚀 ¿Listo para empezar a aprender?**

**Principiantes**: Comienza con [Capítulo 1: Fundamentos y Inicio Rápido](../..)  
**Desarrolladores de IA**: Ir a [Capítulo 2: Desarrollo centrado en IA](../..)  
**Desarrolladores experimentados**: Comienza con [Capítulo 3: Configuración y Autenticación](../..)

**Próximos pasos**: [Comenzar Capítulo 1 - Fundamentos de AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción humana profesional. No somos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Registro de cambios - AZD For Beginners

## Introducción

Este registro de cambios documenta todos los cambios, actualizaciones y mejoras notables en el repositorio AZD For Beginners. Seguimos los principios de versionado semántico y mantenemos este registro para ayudar a los usuarios a comprender qué ha cambiado entre versiones.

## Objetivos de aprendizaje

Al revisar este registro de cambios, usted:
- Mantendrá informadas sobre nuevas funciones y adiciones de contenido
- Comprenderá las mejoras realizadas en la documentación existente
- Rastreará correcciones de errores y enmiendas para garantizar la precisión
- Seguirá la evolución del material de aprendizaje a lo largo del tiempo

## Resultados de aprendizaje

Después de revisar las entradas del registro de cambios, usted podrá:
- Identificar nuevo contenido y recursos disponibles para el aprendizaje
- Entender qué secciones han sido actualizadas o mejoradas
- Planificar su ruta de aprendizaje basándose en los materiales más actuales
- Contribuir con comentarios y sugerencias para mejoras futuras

## Historial de versiones

### [v3.17.0] - 2026-02-05

#### Mejora de navegación del curso
**Esta versión mejora la navegación de capítulos en README.md con un formato de tabla mejorado.**

#### Cambiado
- **Tabla del mapa del curso**: Mejorada con enlaces directos a las lecciones, estimaciones de duración y calificaciones de complejidad
- **Limpieza de carpetas**: Eliminadas carpetas antiguas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validación de enlaces**: Verificados todos los 21+ enlaces internos en la tabla del Mapa del Curso

### [v3.16.0] - 2026-02-05

#### Actualizaciones de nombres de producto
**Esta versión actualiza las referencias de producto a la marca actual de Microsoft.**

#### Cambiado
- **Azure AI Foundry → Microsoft Foundry**: Todas las referencias actualizadas en archivos que no son de traducción
- **Azure AI Agent Service → Foundry Agents**: Nombre del servicio actualizado para reflejar la marca actual

#### Archivos actualizados
- `README.md` - Página principal del curso
- `changelog.md` - Historial de versiones
- `course-outline.md` - Estructura del curso
- `docs/chapter-02-ai-development/agents.md` - Guía de agentes de IA
- `examples/README.md` - Documentación de ejemplos
- `workshop/README.md` - Página principal del taller
- `workshop/docs/index.md` - Índice del taller
- `workshop/docs/instructions/*.md` - Todos los archivos de instrucciones del taller

---

### [v3.15.0] - 2026-02-05

#### Reestructuración mayor del repositorio: Nombres de carpetas por capítulo
**Esta versión reestructura la documentación en carpetas dedicadas por capítulo para una navegación más clara.**

#### Renombrado de carpetas
Las carpetas antiguas han sido reemplazadas por carpetas numeradas por capítulo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Añadido: `docs/chapter-05-multi-agent/`

#### Migración de archivos
| Archivo | Desde | Hasta |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Añadido
- **📚 Archivos README de capítulo**: Creado README.md en cada carpeta de capítulo con:
  - Objetivos de aprendizaje y duración
  - Tabla de lecciones con descripciones
  - Comandos de inicio rápido
  - Navegación a otros capítulos

#### Cambiado
- **🔗 Actualizados todos los enlaces internos**: 78+ rutas actualizadas en todos los archivos de documentación
- **🗺️ README.md principal**: Mapa del curso actualizado con la nueva estructura por capítulos
- **📝 examples/README.md**: Referencias cruzadas actualizadas a las carpetas de capítulos

#### Eliminado
- Estructura de carpetas antigua (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestructuración del repositorio: Navegación por capítulos
**Esta versión añadió archivos README de navegación por capítulo (reemplazados por v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nueva guía de agentes de IA
**Esta versión añade una guía completa para desplegar agentes de IA con Azure Developer CLI.**

#### Añadido
- **🤖 docs/microsoft-foundry/agents.md**: Guía completa que cubre:
  - Qué son los agentes de IA y cómo se diferencian de los chatbots
  - Tres plantillas de inicio rápido para agentes (Foundry Agents, Prompty, RAG)
  - Patrones de arquitectura de agentes (agente único, RAG, multi-agente)
  - Configuración y personalización de herramientas
  - Monitorización y seguimiento de métricas
  - Consideraciones y optimización de costos
  - Escenarios comunes de resolución de problemas
  - Tres ejercicios prácticos con criterios de éxito

#### Estructura del contenido
- **Introducción**: Conceptos de agentes para principiantes
- **Inicio rápido**: Desplegar agentes con `azd init --template get-started-with-ai-agents`
- **Patrones de arquitectura**: Diagramas visuales de patrones de agentes
- **Configuración**: Configuración de herramientas y variables de entorno
- **Monitorización**: Integración con Application Insights
- **Ejercicios**: Aprendizaje práctico progresivo (20-45 minutos cada uno)

---

### [v3.12.0] - 2026-02-05

#### Actualización del entorno DevContainer
**Esta versión actualiza la configuración del contenedor de desarrollo con herramientas modernas y mejores valores predeterminados para la experiencia de aprendizaje de AZD.**

#### Cambiado
- **🐳 Imagen base**: Actualizada de `python:3.12-bullseye` a `python:3.12-bookworm` (última Debian estable)
- **📛 Nombre del contenedor**: Renombrado de "Python 3" a "AZD for Beginners" para mayor claridad

#### Añadido
- **🔧 Nuevas características del Dev Container**:
  - `azure-cli` con soporte para Bicep habilitado
  - `node:20` (versión LTS para plantillas AZD)
  - `github-cli` para gestión de plantillas
  - `docker-in-docker` para despliegues de aplicaciones en contenedor

- **🔌 Reenvío de puertos**: Puertos preconfigurados para desarrollo común:
  - 8000 (previsualización de MkDocs)
  - 3000 (aplicaciones web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nuevas extensiones de VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense de Python mejorado
  - `ms-azuretools.vscode-azurefunctions` - Soporte para Azure Functions
  - `ms-azuretools.vscode-docker` - Soporte para Docker
  - `ms-azuretools.vscode-bicep` - Soporte del lenguaje Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestión de recursos de Azure
  - `yzhang.markdown-all-in-one` - Edición de Markdown
  - `DavidAnson.vscode-markdownlint` - Linting de Markdown
  - `bierner.markdown-mermaid` - Soporte para diagramas Mermaid
  - `redhat.vscode-yaml` - Soporte YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualización de Git
  - `mhutchie.git-graph` - Historial de Git

- **⚙️ Configuraciones de VS Code**: Añadidas configuraciones predeterminadas para el intérprete de Python, formato al guardar y recorte de espacios en blanco

- **📦 requirements-dev.txt actualizado**:
  - Añadido plugin de minificación para MkDocs
  - Añadido pre-commit para calidad de código
  - Añadidos paquetes del SDK de Azure (azure-identity, azure-mgmt-resource)

#### Corregido
- **Comando Post-Create**: Ahora verifica la instalación de AZD y Azure CLI al iniciar el contenedor

---

### [v3.11.0] - 2026-02-05

#### Revisión del README orientada a principiantes
**Esta versión mejora significativamente el README.md para ser más accesible para principiantes y añade recursos esenciales para desarrolladores de IA.**

#### Añadido
- **🆚 Comparación Azure CLI vs AZD**: Explicación clara de cuándo usar cada herramienta con ejemplos prácticos
- **🌟 Enlaces Awesome AZD**: Enlaces directos a la galería de plantillas de la comunidad y recursos para contribuir:
  - [Galería Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ plantillas listas para desplegar
  - [Enviar una plantilla](https://github.com/Azure/awesome-azd/issues) - Contribución comunitaria
- **🎯 Guía de inicio rápido**: Sección simplificada de 3 pasos para empezar (Instalar → Iniciar sesión → Desplegar)
- **📊 Tabla de navegación basada en la experiencia**: Guía clara sobre por dónde empezar según la experiencia del desarrollador

#### Cambiado
- **Estructura del README**: Reorganizada para divulgación progresiva: la información clave al principio
- **Sección de introducción**: Reescrita para explicar "La magia de `azd up`" para principiantes completos
- **Eliminado contenido duplicado**: Eliminada la sección duplicada de resolución de problemas
- **Comandos de resolución de problemas**: Corregida la referencia `azd logs` para usar el válido `azd monitor --logs`

#### Corregido
- **🔐 Comandos de autenticación**: Añadidos `azd auth login` y `azd auth logout` a cheat-sheet.md
- **Referencias a comandos inválidos**: Eliminado el resto de `azd logs` de la sección de resolución de problemas del README

#### Notas
- **Alcance**: Cambios aplicados al README.md principal y a resources/cheat-sheet.md
- **Público objetivo**: Mejoras dirigidas específicamente a desarrolladores nuevos en AZD

---

### [v3.10.0] - 2026-02-05

#### Actualización de precisión de comandos de Azure Developer CLI
**Esta versión corrige comandos inexistentes de AZD en la documentación, asegurando que todos los ejemplos de código usen sintaxis válida de Azure Developer CLI.**

#### Corregido
- **🔧 Eliminados comandos inexistentes de AZD**: Auditoría completa y corrección de comandos inválidos:
  - `azd logs` (no existe) → reemplazado por `azd monitor --logs` o alternativas de Azure CLI
  - Subcomandos de `azd service` (no existen) → reemplazados por `azd show` y Azure CLI
  - `azd infra import/export/validate` (no existen) → eliminados o reemplazados por alternativas válidas
  - Flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (no existen) → eliminados
  - Flags `azd provision --what-if/--rollback` (no existen) → actualizados para usar `--preview`
  - `azd config validate` (no existe) → reemplazado por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (no existen) → eliminados

- **📚 Archivos actualizados con correcciones de comandos**:
  - `resources/cheat-sheet.md`: Revisión mayor de la referencia de comandos
  - `docs/deployment/deployment-guide.md`: Corregidas estrategias de rollback y despliegue
  - `docs/troubleshooting/debugging.md`: Corregidas secciones de análisis de logs
  - `docs/troubleshooting/common-issues.md`: Comandos de resolución de problemas actualizados
  - `docs/troubleshooting/ai-troubleshooting.md`: Sección de depuración de AZD corregida
  - `docs/getting-started/azd-basics.md`: Comandos de monitorización corregidos
  - `docs/getting-started/first-project.md`: Ejemplos de monitorización y depuración actualizados
  - `docs/getting-started/installation.md`: Ejemplos de ayuda y versión corregidos
  - `docs/pre-deployment/application-insights.md`: Comandos de visualización de logs corregidos
  - `docs/pre-deployment/coordination-patterns.md`: Comandos de depuración de agentes corregidos

- **📝 Referencia de versión actualizada**:
  - `docs/getting-started/installation.md`: Versión codificada `1.5.0` cambiada a genérica `1.x.x` con enlace a releases

#### Cambiado
- **Estrategias de rollback**: Documentación actualizada para usar rollback basado en Git (AZD no tiene rollback nativo)
- **Visualización de logs**: Referencias a `azd logs` reemplazadas por `azd monitor --logs`, `azd monitor --live` y comandos de Azure CLI
- **Sección de rendimiento**: Eliminadas banderas inexistentes de despliegue paralelo/incremental y proporcionadas alternativas válidas

#### Detalles técnicos
- **Comandos AZD válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags válidas de azd monitor**: `--live`, `--logs`, `--overview`
- **Funciones eliminadas**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notas
- **Verificación**: Comandos validados contra Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Actualización: Finalización del taller y calidad de la documentación
**Esta versión completa los módulos interactivos del taller, corrige todos los enlaces rotos de la documentación y mejora la calidad general del contenido para desarrolladores de IA que usan Microsoft AZD.**

#### Añadido
- **📝 CONTRIBUTING.md**: Nuevo documento de directrices para contribuciones con:
  - Instrucciones claras para reportar problemas y proponer cambios
  - Estándares de documentación para contenido nuevo
  - Directrices de ejemplos de código y convenciones de mensajes de commit
  - Información para la participación de la comunidad

#### Completado
- **🎯 Módulo 7 del taller (Conclusión)**: Módulo de cierre completamente completado con:
  - Resumen exhaustivo de los logros del taller
  - Sección de conceptos clave dominados que cubre AZD, plantillas y AI Foundry
  - Recomendaciones para continuar el recorrido de aprendizaje
  - Ejercicios de desafío del taller con calificaciones de dificultad
  - Enlaces de retroalimentación y soporte de la comunidad

- **📚 Módulo 3 del taller (Deconstrucción)**: Objetivos de aprendizaje actualizados con:
  - Guía para la activación de GitHub Copilot con servidores MCP
  - Comprensión de la estructura de carpetas de plantillas AZD
  - Patrones de organización de infraestructura como código (Bicep)
  - Instrucciones de laboratorio práctico

- **🔧 Módulo 6 del taller (Desmantelamiento)**: Completado con:
  - Objetivos de limpieza de recursos y gestión de costos
  - Uso de `azd down` para desprovisionamiento seguro de infraestructura
  - Guía de recuperación de servicios cognitivos eliminados de forma suave
  - Prompts de exploración adicional para GitHub Copilot y Azure Portal

#### Corregido
- **🔗 Corrección de enlaces rotos**: Se resolvieron más de 15 enlaces internos rotos en la documentación:
  - `docs/ai-foundry/ai-model-deployment.md`: Se corrigieron rutas a microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Se corrigieron las rutas ai-model-deployment.md y production-ai-practices.md
  - `docs/getting-started/first-project.md`: Se reemplazó cicd-integration.md inexistente por deployment-guide.md
  - `examples/retail-scenario.md`: Se corrigieron rutas de preguntas frecuentes y guía de solución de problemas
  - `examples/container-app/microservices/README.md`: Se corrigieron rutas del curso principal y de la guía de despliegue
  - `resources/faq.md` y `resources/glossary.md`: Se actualizaron referencias del capítulo de IA
  - `course-outline.md`: Se corrigieron referencias al instructor guide y a los laboratorios del taller de IA

- **📅 Banner de estado del taller**: Actualizado de "Under Construction" a estado activo del taller con fecha de febrero de 2026

- **🔗 Navegación del taller**: Se corrigieron enlaces de navegación rotos en README.md del taller que apuntaban a la carpeta lab-1-azd-basics inexistente

#### Cambiado
- **Presentación del taller**: Se eliminó la advertencia de "under construction", el taller ahora está completo y listo para usarse
- **Consistencia de navegación**: Se aseguró que todos los módulos del taller tengan navegación adecuada entre módulos
- **Referencias de la ruta de aprendizaje**: Se actualizaron las referencias cruzadas de capítulos para usar las rutas correctas de microsoft-foundry

#### Validado
- ✅ Todos los archivos markdown en inglés tienen enlaces internos válidos
- ✅ Los módulos del taller 0-7 están completos con objetivos de aprendizaje
- ✅ La navegación entre capítulos y módulos funciona correctamente
- ✅ El contenido es adecuado para desarrolladores de IA que usan Microsoft AZD
- ✅ Se mantiene un lenguaje y estructura amigables para principiantes en todo el material
- ✅ CONTRIBUTING.md proporciona una guía clara para colaboradores de la comunidad

#### Implementación técnica
- **Validación de enlaces**: Un script automatizado de PowerShell verificó todos los enlaces internos .md
- **Auditoría de contenido**: Revisión manual de la completitud del taller y adecuación para principiantes
- **Sistema de navegación**: Se aplicaron patrones consistentes de navegación entre capítulos y módulos

#### Notas
- **Alcance**: Cambios aplicados solo a la documentación en inglés
- **Traducciones**: Las carpetas de traducción no se actualizaron en esta versión (la traducción automatizada se sincronizará más adelante)
- **Duración del taller**: El taller completo ahora ofrece 3-4 horas de aprendizaje práctico

---

### [v3.8.0] - 2025-11-19

#### Documentación avanzada: Monitorización, seguridad y patrones multi-agente
**Esta versión añade lecciones integrales de nivel A sobre la integración con Application Insights, patrones de autenticación y coordinación multi-agente para despliegues en producción.**

#### Añadido
- **📊 Lección de integración con Application Insights**: en `docs/pre-deployment/application-insights.md`:
  - Despliegue enfocado en AZD con aprovisionamiento automático
  - Plantillas Bicep completas para Application Insights + Log Analytics
  - Aplicaciones Python funcionales con telemetría personalizada (1.200+ líneas)
  - Patrones de monitorización para IA/LLM (seguimiento de tokens/costos de Azure OpenAI)
  - 6 diagramas Mermaid (arquitectura, trazado distribuido, flujo de telemetría)
  - 3 ejercicios prácticos (alertas, paneles, monitorización de IA)
  - Ejemplos de consultas Kusto y estrategias de optimización de costos
  - Transmisión de métricas en vivo y depuración en tiempo real
  - Tiempo de aprendizaje de 40-50 minutos con patrones listos para producción

- **🔐 Lección de patrones de autenticación y seguridad**: en `docs/getting-started/authsecurity.md`:
  - 3 patrones de autenticación (connection strings, Key Vault, managed identity)
  - Plantillas de infraestructura Bicep completas para despliegues seguros
  - Código de aplicación Node.js con integración del Azure SDK
  - 3 ejercicios completos (habilitar managed identity, identidad asignada por el usuario, rotación de Key Vault)
  - Mejores prácticas de seguridad y configuraciones RBAC
  - Guía de solución de problemas y análisis de costos
  - Patrones de autenticación sin contraseñas listos para producción

- **🤖 Lección de patrones de coordinación multi-agente**: en `docs/pre-deployment/coordination-patterns.md`:
  - 5 patrones de coordinación (secuencial, paralelo, jerárquico, dirigido por eventos, consenso)
  - Implementación completa del servicio orquestador (Python/Flask, 1.500+ líneas)
  - 3 implementaciones especializadas de agentes (Research, Writer, Editor)
  - Integración con Service Bus para encolado de mensajes
  - Gestión de estado con Cosmos DB para sistemas distribuidos
  - 6 diagramas Mermaid que muestran interacciones entre agentes
  - 3 ejercicios avanzados (gestión de timeouts, lógica de reintentos, circuit breaker)
  - Desglose de costos ($240-565/month) con estrategias de optimización
  - Integración con Application Insights para monitorización

#### Mejorado
- **Capítulo de pre-despliegue**: Ahora incluye monitorización y patrones de coordinación integrales
- **Capítulo de inicio**: Mejorado con patrones profesionales de autenticación
- **Preparación para producción**: Cobertura completa desde seguridad hasta observabilidad
- **Esquema del curso**: Actualizado para referenciar nuevas lecciones en los Capítulos 3 y 6

#### Cambiado
- **Progresión de aprendizaje**: Mejor integración de seguridad y monitorización a lo largo del curso
- **Calidad de la documentación**: Estándares consistentes de nivel A (95-97%) en las nuevas lecciones
- **Patrones de producción**: Cobertura completa de extremo a extremo para despliegues empresariales

#### Mejorado
- **Experiencia del desarrollador**: Ruta clara desde el desarrollo hasta la monitorización en producción
- **Estándares de seguridad**: Patrones profesionales para autenticación y gestión de secretos
- **Observabilidad**: Integración completa de Application Insights con AZD
- **Cargas de trabajo de IA**: Monitorización especializada para Azure OpenAI y sistemas multi-agente

#### Validado
- ✅ Todas las lecciones incluyen código de trabajo completo (no snippets)
- ✅ Diagramas Mermaid para aprendizaje visual (19 en total a través de 3 lecciones)
- ✅ Ejercicios prácticos con pasos de verificación (9 en total)
- ✅ Plantillas Bicep listas para producción desplegables vía `azd up`
- ✅ Análisis de costos y estrategias de optimización
- ✅ Guías de solución de problemas y mejores prácticas
- ✅ Puntos de verificación de conocimiento con comandos de verificación

#### Resultados de la evaluación de la documentación
- **docs/pre-deployment/application-insights.md**: - Guía de monitorización integral
- **docs/getting-started/authsecurity.md**: - Patrones profesionales de seguridad
- **docs/pre-deployment/coordination-patterns.md**: - Arquitecturas avanzadas multi-agente
- **Nuevo contenido en general**: - Estándares de alta calidad y consistencia

#### Implementación técnica
- **Application Insights**: Log Analytics + telemetría personalizada + trazado distribuido
- **Autenticación**: Managed Identity + Key Vault + patrones RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestación
- **Monitorización**: Métricas en vivo + consultas Kusto + alertas + paneles
- **Gestión de costos**: Estrategias de muestreo, políticas de retención, controles presupuestarios

### [v3.7.0] - 2025-11-19

#### Mejoras en la calidad de la documentación y nuevo ejemplo de Azure OpenAI
**Esta versión mejora la calidad de la documentación en todo el repositorio y añade un ejemplo completo de despliegue de Azure OpenAI con interfaz de chat GPT-4.**

#### Añadido
- **🤖 Ejemplo de chat con Azure OpenAI**: Despliegue completo de GPT-4 con implementación funcional en `examples/azure-openai-chat/`:
  - Infraestructura completa de Azure OpenAI (despliegue del modelo GPT-4)
  - Interfaz de chat por línea de comandos en Python con historial de conversaciones
  - Integración con Key Vault para almacenamiento seguro de claves de API
  - Seguimiento del uso de tokens y estimación de costos
  - Limitación de tasa y manejo de errores
  - README exhaustivo con guía de despliegue de 35-45 minutos
  - 11 archivos listos para producción (plantillas Bicep, aplicación Python, configuración)
- **📚 Ejercicios de documentación**: Añadidos ejercicios prácticos a la guía de configuración:
  - Ejercicio 1: Configuración multi-entorno (15 minutos)
  - Ejercicio 2: Práctica de gestión de secretos (10 minutos)
  - Criterios claros de éxito y pasos de verificación
- **✅ Verificación del despliegue**: Se añadió sección de verificación a la guía de despliegue:
  - Procedimientos de comprobación de estado
  - Lista de verificación de criterios de éxito
  - Salidas esperadas para todos los comandos de despliegue
  - Referencia rápida de solución de problemas

#### Mejorado
- **examples/README.md**: Actualizado a calidad A (93%):
  - Se añadió azure-openai-chat a todas las secciones relevantes
  - Se actualizó el recuento de ejemplos locales de 3 a 4
  - Añadido a la tabla de ejemplos de aplicaciones de IA
  - Integrado en Quick Start para usuarios intermedios
  - Añadido a la sección de plantillas de Microsoft Foundry
  - Actualizada la matriz de comparación y las secciones de hallazgos tecnológicos
- **Calidad de la documentación**: Mejorada de B+ (87%) → A- (92%) en la carpeta docs:
  - Añadidas salidas esperadas a ejemplos críticos de comandos
  - Incluidos pasos de verificación para cambios de configuración
  - Mejorada la experiencia práctica con ejercicios accionables

#### Cambiado
- **Progresión de aprendizaje**: Mejor integración de ejemplos de IA para aprendices intermedios
- **Estructura de la documentación**: Ejercicios más accionables con resultados claros
- **Proceso de verificación**: Criterios explícitos de éxito añadidos a flujos de trabajo clave

#### Mejorado
- **Experiencia del desarrollador**: El despliegue de Azure OpenAI ahora toma 35-45 minutos (vs 60-90 para alternativas complejas)
- **Transparencia de costos**: Estimaciones de costos claras ($50-200/month) para el ejemplo de Azure OpenAI
- **Ruta de aprendizaje**: Los desarrolladores de IA tienen un punto de entrada claro con azure-openai-chat
- **Estándares de documentación**: Salidas esperadas y pasos de verificación consistentes

#### Validado
- ✅ Ejemplo de Azure OpenAI totalmente funcional con `azd up`
- ✅ Los 11 archivos de implementación son sintácticamente correctos
- ✅ Las instrucciones del README coinciden con la experiencia real de despliegue
- ✅ Enlaces de documentación actualizados en más de 8 ubicaciones
- ✅ El índice de ejemplos refleja con precisión 4 ejemplos locales
- ✅ No hay enlaces externos duplicados en tablas
- ✅ Todas las referencias de navegación son correctas

#### Implementación técnica
- **Arquitectura de Azure OpenAI**: GPT-4 + Key Vault + patrón Container Apps
- **Seguridad**: Listo para Managed Identity, secretos en Key Vault
- **Monitorización**: Integración con Application Insights
- **Gestión de costos**: Seguimiento de tokens y optimización de uso
- **Despliegue**: Comando único `azd up` para la configuración completa

### [v3.6.0] - 2025-11-19

#### Actualización importante: Ejemplos de despliegue en Container App
**Esta versión introduce ejemplos de despliegue de aplicaciones en contenedores completos y listos para producción usando Azure Developer CLI (AZD), con documentación e integración en la ruta de aprendizaje.**

#### Añadido
- **🚀 Ejemplos de Container App**: Nuevos ejemplos locales en `examples/container-app/`:
  - [Guía principal](examples/container-app/README.md): Visión general completa de despliegues en contenedores, inicio rápido, producción y patrones avanzados
  - [API Flask simple](../../examples/container-app/simple-flask-api): API REST amigable para principiantes con scale-to-zero, probes de salud, monitorización y solución de problemas
  - [Arquitectura de microservicios](../../examples/container-app/microservices): Despliegue multi-servicio listo para producción (API Gateway, Product, Order, User, Notification), mensajería asíncrona, Service Bus, Cosmos DB, Azure SQL, trazado distribuido, despliegue blue-green/canary
- **Mejores prácticas**: Seguridad, monitorización, optimización de costos y guía de CI/CD para cargas de trabajo en contenedores
- **Ejemplos de código**: `azure.yaml` completo, plantillas Bicep y implementaciones de servicios en varios lenguajes (Python, Node.js, C#, Go)
- **Pruebas y solución de problemas**: Escenarios de prueba de extremo a extremo, comandos de monitorización, guía de solución de problemas

#### Cambiado
- **README.md**: Actualizado para destacar y enlazar nuevos ejemplos de Container App bajo "Local Examples - Container Applications"
- **examples/README.md**: Actualizado para resaltar ejemplos de container app, añadir entradas a la matriz de comparación y actualizar referencias de tecnología/arquitectura
- **Esquema del curso y guía de estudio**: Actualizado para referenciar nuevos ejemplos de aplicaciones de contenedor y patrones de despliegue en los capítulos relevantes

#### Validado
- ✅ Todos los nuevos ejemplos desplegables con `azd up` y siguen las mejores prácticas
- ✅ Enlaces cruzados y navegación de la documentación actualizados
- ✅ Los ejemplos abarcan escenarios desde principiante hasta avanzado, incluidos microservicios en producción

#### Notas
- **Alcance**: Solo documentación y ejemplos en inglés
- **Próximos pasos**: Ampliar con patrones de contenedor avanzados adicionales y automatización CI/CD en futuras versiones

### [v3.5.0] - 2025-11-19

#### Cambio de marca del producto: Microsoft Foundry
**Esta versión implementa un cambio de nombre de producto integral de "Microsoft Foundry" a "Microsoft Foundry" en toda la documentación en inglés, reflejando el cambio de marca oficial de Microsoft.**

#### Cambios
- **🔄 Actualización del nombre del producto**: Rebranding completo de "Microsoft Foundry" a "Microsoft Foundry"
  - Actualizadas todas las referencias en la documentación en inglés en la carpeta `docs/`
  - Carpeta renombrada: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Archivo renombrado: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referencias de contenido actualizadas en 7 archivos de documentación

- **📁 Cambios en la estructura de carpetas**:
  - `docs/ai-foundry/` renombrado a `docs/microsoft-foundry/`
  - Todas las referencias cruzadas actualizadas para reflejar la nueva estructura de carpetas
  - Enlaces de navegación validados en toda la documentación

- **📄 Renombrado de archivos**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos los enlaces internos actualizados para referenciar el nuevo nombre de archivo

#### Archivos actualizados
- **Documentación de capítulos** (7 archivos):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 actualizaciones de enlaces de navegación
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referencias de nombre de producto actualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Ya usa Microsoft Foundry (de actualizaciones previas)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referencias actualizadas (visión general, retroalimentación de la comunidad, documentación)
  - `docs/getting-started/azd-basics.md` - 4 enlaces de referencias cruzadas actualizados
  - `docs/getting-started/first-project.md` - 2 enlaces de navegación de capítulo actualizados
  - `docs/getting-started/installation.md` - 2 enlaces al siguiente capítulo actualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referencias actualizadas (navegación, comunidad de Discord)
  - `docs/troubleshooting/common-issues.md` - 1 enlace de navegación actualizado
  - `docs/troubleshooting/debugging.md` - 1 enlace de navegación actualizado

- **Archivos de estructura del curso** (2 archivos):
  - `README.md` - 17 referencias actualizadas (visión general del curso, títulos de capítulos, sección de plantillas, percepciones de la comunidad)
  - `course-outline.md` - 14 referencias actualizadas (visión general, objetivos de aprendizaje, recursos del capítulo)

#### Validado
- ✅ Cero referencias restantes de la ruta de carpeta "ai-foundry" en la documentación en inglés
- ✅ Cero referencias restantes al nombre de producto "Microsoft Foundry" en la documentación en inglés
- ✅ Todos los enlaces de navegación funcionales con la nueva estructura de carpetas
- ✅ Renombres de archivos y carpetas completados con éxito
- ✅ Referencias cruzadas entre capítulos validadas

#### Notas
- **Alcance**: Cambios aplicados solo a la documentación en inglés en la carpeta `docs/`
- **Traducciones**: Las carpetas de traducciones (`translations/`) no se actualizaron en esta versión
- **Taller**: Los materiales del taller (`workshop/`) no se actualizaron en esta versión
- **Ejemplos**: Los archivos de ejemplo pueden seguir haciendo referencia a nombres heredados (a abordar en una actualización futura)
- **Enlaces externos**: Las URL externas y referencias del repositorio de GitHub permanecen sin cambios

#### Guía de migración para contribuyentes
Si tiene ramas locales o documentación que hacen referencia a la estructura antigua:
1. Actualice las referencias de carpetas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Actualice las referencias de archivos: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Reemplace el nombre del producto: "Microsoft Foundry" → "Microsoft Foundry"
4. Valide que todos los enlaces internos de la documentación sigan funcionando

---

### [v3.4.0] - 2025-10-24

#### Mejoras en la vista previa de infraestructura y validación
**Esta versión introduce soporte completo para la nueva función de vista previa de Azure Developer CLI y mejora la experiencia de usuario del taller.**

#### Añadido
- **🧪 Documentación de la función azd provision --preview**: Cobertura completa de la nueva capacidad de vista previa de infraestructura
  - Referencia del comando y ejemplos de uso en la hoja de trucos
  - Integración detallada en la guía de aprovisionamiento con casos de uso y beneficios
  - Integración de comprobaciones previas al vuelo para una validación de despliegue más segura
  - Actualizaciones en la guía de inicio con prácticas de despliegue orientadas a la seguridad

- **🚧 Banner de estado del taller**: Banner HTML profesional que indica el estado de desarrollo del taller
  - Diseño en degradado con indicadores de construcción para una comunicación clara al usuario
  - Marca de tiempo de última actualización para mayor transparencia
  - Diseño responsivo para móviles y todos los tipos de dispositivos

#### Mejorado
- **Seguridad de la infraestructura**: Funcionalidad de vista previa integrada en toda la documentación de despliegue
- **Validación previa al despliegue**: Los scripts automatizados ahora incluyen pruebas de vista previa de infraestructura
- **Flujo de trabajo del desarrollador**: Secuencias de comandos actualizadas para incluir la vista previa como mejor práctica
- **Experiencia del taller**: Expectativas claras para los usuarios sobre el estado de desarrollo del contenido

#### Cambiado
- **Buenas prácticas de despliegue**: Se recomienda ahora el flujo de trabajo con vista previa como enfoque principal
- **Flujo de documentación**: La validación de infraestructura se movió más temprano en el proceso de aprendizaje
- **Presentación del taller**: Comunicación de estado profesional con una línea de tiempo de desarrollo clara

#### Mejorado
- **Enfoque de seguridad primero**: Los cambios de infraestructura ahora pueden validarse antes del despliegue
- **Colaboración del equipo**: Los resultados de la vista previa pueden compartirse para revisión y aprobación
- **Conciencia de costes**: Mejor comprensión de los costes de recursos antes del aprovisionamiento
- **Mitigación de riesgos**: Reducción de fallos de despliegue mediante validación previa

#### Implementación técnica
- **Integración multidocumento**: La función de vista previa documentada en 4 archivos clave
- **Patrones de comandos**: Sintaxis y ejemplos consistentes en toda la documentación
- **Integración de mejores prácticas**: Vista previa incluida en flujos de trabajo y scripts de validación
- **Indicadores visuales**: Marcas claras de función NUEVA para facilitar su descubrimiento

#### Infraestructura del taller
- **Comunicación de estado**: Banner HTML profesional con estilo en degradado
- **Experiencia de usuario**: Estado de desarrollo claro evita confusiones
- **Presentación profesional**: Mantiene la credibilidad del repositorio mientras establece expectativas
- **Transparencia de la línea de tiempo**: Marca de tiempo de última actualización octubre de 2025 para rendición de cuentas

### [v3.3.0] - 2025-09-24

#### Materiales mejorados del taller y experiencia de aprendizaje interactiva
**Esta versión introduce materiales de taller completos con guías interactivas basadas en navegador y rutas de aprendizaje estructuradas.**

#### Añadido
- **🎥 Guía interactiva del taller**: Experiencia de taller basada en navegador con capacidad de vista previa de MkDocs
- **📝 Instrucciones estructuradas del taller**: Ruta de aprendizaje guiada de 7 pasos desde el descubrimiento hasta la personalización
  - 0-Introduction: Resumen del taller y configuración
  - 1-Select-AI-Template: Proceso de descubrimiento y selección de plantillas
  - 2-Validate-AI-Template: Procedimientos de despliegue y validación
  - 3-Deconstruct-AI-Template: Comprensión de la arquitectura de la plantilla
  - 4-Configure-AI-Template: Configuración y personalización
  - 5-Customize-AI-Template: Modificaciones avanzadas e iteraciones
  - 6-Teardown-Infrastructure: Limpieza y gestión de recursos
  - 7-Wrap-up: Resumen y próximos pasos
- **🛠️ Herramientas del taller**: Configuración de MkDocs con el tema Material para mejorar la experiencia de aprendizaje
- **🎯 Ruta de aprendizaje práctica**: Metodología de 3 pasos (Descubrimiento → Despliegue → Personalización)
- **📱 Integración con GitHub Codespaces**: Configuración fluida del entorno de desarrollo

#### Mejorado
- **Laboratorio del taller de IA**: Ampliado con una experiencia estructurada de aprendizaje de 2-3 horas
- **Documentación del taller**: Presentación profesional con navegación y ayudas visuales
- **Progresión del aprendizaje**: Guía paso a paso clara desde la selección de plantillas hasta el despliegue en producción
- **Experiencia del desarrollador**: Herramientas integradas para flujos de trabajo de desarrollo más fluidos

#### Mejorado
- **Accesibilidad**: Interfaz basada en navegador con búsqueda, función de copiar y conmutador de tema
- **Aprendizaje autodirigido**: Estructura flexible del taller que se adapta a diferentes ritmos de aprendizaje
- **Aplicación práctica**: Escenarios reales de despliegue de plantillas de IA
- **Integración comunitaria**: Integración con Discord para soporte y colaboración del taller

#### Características del taller
- **Búsqueda integrada**: Descubrimiento rápido por palabras clave y lecciones
- **Copiar bloques de código**: Funcionalidad hover-to-copy para todos los ejemplos de código
- **Conmutador de tema**: Soporte de modo oscuro/claro para diferentes preferencias
- **Recursos visuales**: Capturas de pantalla y diagramas para una mejor comprensión
- **Integración de ayuda**: Acceso directo a Discord para soporte comunitario

### [v3.2.0] - 2025-09-17

#### Reestructuración mayor de la navegación y sistema de aprendizaje por capítulos
**Esta versión introduce una estructura de aprendizaje por capítulos completa con navegación mejorada en todo el repositorio.**

#### Añadido
- **📚 Sistema de aprendizaje por capítulos**: Reestructuración de todo el curso en 8 capítulos de aprendizaje progresivos
  - Capítulo 1: Fundamentos y inicio rápido (⭐ - 30-45 min)
  - Capítulo 2: Desarrollo centrado en IA (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuración y autenticación (⭐⭐ - 45-60 min)
  - Capítulo 4: Infraestructura como código y despliegue (⭐⭐⭐ - 1-1.5 horas)
  - Capítulo 5: Soluciones de IA multiagente (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validación y planificación previa al despliegue (⭐⭐ - 1 hora)
  - Capítulo 7: Resolución de problemas y depuración (⭐⭐ - 1-1.5 horas)
  - Capítulo 8: Patrones de producción y empresariales (⭐⭐⭐⭐ - 2-3 horas)
- **📚 Sistema de navegación integral**: Encabezados y pies de página de navegación consistentes en toda la documentación
- **🎯 Seguimiento del progreso**: Lista de verificación de finalización del curso y sistema de verificación de aprendizaje
- **🗺️ Orientación de la ruta de aprendizaje**: Puntos de entrada claros para diferentes niveles de experiencia y objetivos
- **🔗 Navegación de referencias cruzadas**: Capítulos relacionados y requisitos previos claramente enlazados

#### Mejorado
- **Estructura del README**: Transformado en una plataforma de aprendizaje estructurada con organización por capítulos
- **Navegación de la documentación**: Cada página ahora incluye contexto de capítulo y guía de progresión
- **Organización de plantillas**: Ejemplos y plantillas mapeados a capítulos de aprendizaje apropiados
- **Integración de recursos**: Hojas de trucos, preguntas frecuentes y guías de estudio conectadas a capítulos relevantes
- **Integración del taller**: Laboratorios prácticos mapeados a múltiples objetivos de aprendizaje por capítulo

#### Cambiado
- **Progresión del aprendizaje**: Movida de documentación lineal a aprendizaje flexible por capítulos
- **Ubicación de la configuración**: Reposicionada la guía de configuración como Capítulo 3 para un mejor flujo de aprendizaje
- **Integración de contenido de IA**: Mejor integración de contenido específico de IA a lo largo del recorrido de aprendizaje
- **Contenido de producción**: Patrones avanzados consolidados en el Capítulo 8 para aprendices empresariales

#### Mejorado
- **Experiencia de usuario**: Migas de pan de navegación claras e indicadores de progresión por capítulo
- **Accesibilidad**: Patrones de navegación consistentes para facilitar el recorrido del curso
- **Presentación profesional**: Estructura tipo universidad adecuada para formación académica y corporativa
- **Eficiencia del aprendizaje**: Reducción del tiempo para encontrar contenido relevante mediante una mejor organización

#### Implementación técnica
- **Encabezados de navegación**: Navegación de capítulo estandarizada en más de 40 archivos de documentación
- **Pie de página de navegación**: Guía de progresión y indicadores de finalización de capítulo consistentes
- **Enlaces cruzados**: Sistema de enlaces internos completo que conecta conceptos relacionados
- **Mapeo de capítulos**: Plantillas y ejemplos claramente asociados con objetivos de aprendizaje

#### Mejora de la guía de estudio
- **📚 Objetivos de aprendizaje completos**: Guía de estudio reestructurada para alinearse con el sistema de 8 capítulos
- **🎯 Evaluación por capítulo**: Cada capítulo incluye objetivos de aprendizaje específicos y ejercicios prácticos
- **📋 Seguimiento del progreso**: Cronograma de aprendizaje semanal con resultados medibles y listas de verificación de finalización
- **❓ Preguntas de evaluación**: Preguntas de validación de conocimiento para cada capítulo con resultados profesionales
- **🛠️ Ejercicios prácticos**: Actividades prácticas con escenarios reales de despliegue y resolución de problemas
- **📊 Progresión de habilidades**: Avance claro desde conceptos básicos hasta patrones empresariales con enfoque en desarrollo profesional
- **🎓 Marco de certificación**: Resultados de desarrollo profesional y sistema de reconocimiento comunitario
- **⏱️ Gestión del tiempo**: Plan de aprendizaje estructurado de 10 semanas con validación de hitos

### [v3.1.0] - 2025-09-17

#### Soluciones de IA multiagente mejoradas
**Esta versión mejora la solución minorista multiagente con mejor denominación de agentes y documentación ampliada.**

#### Cambiado
- **Terminología multiagente**: Se reemplazó "Cora agent" por "Customer agent" en toda la solución minorista multiagente para una mejor comprensión
- **Arquitectura de agentes**: Se actualizó toda la documentación, plantillas ARM y ejemplos de código para usar la nomenclatura consistente "Customer agent"
- **Ejemplos de configuración**: Modernizados los patrones de configuración de agentes con convenciones de nombres actualizadas
- **Consistencia en la documentación**: Se aseguró que todas las referencias utilicen nombres de agentes profesionales y descriptivos

#### Mejorado
- **Paquete de plantillas ARM**: Actualizado retail-multiagent-arm-template con referencias a Customer agent
- **Diagramas de arquitectura**: Diagramas Mermaid actualizados con la nueva denominación de agentes
- **Ejemplos de código**: Las clases Python y los ejemplos de implementación ahora usan la denominación CustomerAgent
- **Variables de entorno**: Actualizados todos los scripts de despliegue para usar las convenciones CUSTOMER_AGENT_NAME

#### Mejorado
- **Experiencia del desarrollador**: Roles y responsabilidades de los agentes más claros en la documentación
- **Preparación para producción**: Mejor alineación con las convenciones de nombres empresariales
- **Materiales de aprendizaje**: Nombres de agentes más intuitivos con fines educativos
- **Usabilidad de plantillas**: Comprensión simplificada de las funciones de los agentes y los patrones de despliegue

#### Detalles técnicos
- Actualizados los diagramas de arquitectura Mermaid con referencias a CustomerAgent
- Reemplazados los nombres de clase CoraAgent por CustomerAgent en ejemplos de Python
- Modificadas las configuraciones JSON de plantillas ARM para usar el tipo de agente "customer"
- Actualizadas las variables de entorno de CORA_AGENT_* a CUSTOMER_AGENT_* 
- Actualizados todos los comandos de despliegue y las configuraciones de contenedores

### [v3.0.0] - 2025-09-12

#### Cambios principales - Enfoque en desarrolladores de IA e integración con Microsoft Foundry
**Esta versión transforma el repositorio en un recurso de aprendizaje integral centrado en IA con integración de Microsoft Foundry.**

#### Añadido
- **🤖 Ruta de aprendizaje orientada a la IA**: Reestructuración completa que prioriza a desarrolladores e ingenieros de IA
- **Microsoft Foundry Integration Guide**: Documentación completa para conectar AZD con los servicios de Microsoft Foundry
- **Patrones de despliegue de modelos de IA**: Guía detallada que cubre selección de modelos, configuración y estrategias de despliegue en producción
- **AI Workshop Lab**: Taller práctico de 2-3 horas para convertir aplicaciones de IA en soluciones desplegables con AZD
- **Mejores prácticas de IA para producción**: Patrones listos para la empresa para escalar, supervisar y asegurar cargas de trabajo de IA
- **Guía de solución de problemas específica para IA**: Solución de problemas integral para Azure OpenAI, Cognitive Services y problemas de despliegue de IA
- **AI Template Gallery**: Colección destacada de plantillas de Microsoft Foundry con valoraciones de complejidad
- **Materiales del taller**: Estructura completa del taller con laboratorios prácticos y materiales de referencia

#### Mejorado
- **Estructura del README**: Orientada a desarrolladores de IA con datos de interés comunitario del 45% del Discord de Microsoft Foundry
- **Rutas de aprendizaje**: Trayectoria dedicada para desarrolladores de IA junto a rutas tradicionales para estudiantes y ingenieros DevOps
- **Recomendaciones de plantillas**: Plantillas de IA destacadas incluyendo azure-search-openai-demo, contoso-chat, y openai-chat-app-quickstart
- **Integración comunitaria**: Soporte mejorado en la comunidad de Discord con canales y discusiones específicas de IA

#### Enfoque en seguridad y producción
- **Patrones de identidad administrada**: Configuraciones de autenticación y seguridad específicas para IA
- **Optimización de costos**: Seguimiento del uso de tokens y controles de presupuesto para cargas de trabajo de IA
- **Despliegue multirregión**: Estrategias para el despliegue global de aplicaciones de IA
- **Monitoreo de rendimiento**: Métricas específicas de IA e integración con Application Insights

#### Calidad de la documentación
- **Estructura de curso lineal**: Progresión lógica desde principiante hasta patrones avanzados de despliegue de IA
- **URLs validadas**: Todos los enlaces externos verificados y accesibles
- **Referencia completa**: Todos los enlaces internos de documentación validados y funcionales
- **Listo para producción**: Patrones de despliegue empresariales con ejemplos del mundo real

### [v2.0.0] - 2025-09-09

#### Cambios importantes - Reestructuración del repositorio y mejora profesional
**Esta versión representa una revisión significativa de la estructura del repositorio y la presentación del contenido.**

#### Añadido
- **Marco de aprendizaje estructurado**: Todas las páginas de documentación ahora incluyen secciones Introducción, Objetivos de aprendizaje y Resultados del aprendizaje
- **Sistema de navegación**: Añadidos enlaces de lección anterior/siguiente en toda la documentación para una progresión guiada
- **Study Guide**: study-guide.md completa con objetivos de aprendizaje, ejercicios prácticos y materiales de evaluación
- **Presentación profesional**: Eliminados todos los iconos emoji para mejorar la accesibilidad y la apariencia profesional
- **Estructura de contenido mejorada**: Mejor organización y flujo de los materiales de aprendizaje

#### Cambiado
- **Formato de documentación**: Estandarizada toda la documentación con una estructura coherente orientada al aprendizaje
- **Flujo de navegación**: Implementada progresión lógica a través de todos los materiales de aprendizaje
- **Presentación de contenido**: Eliminados elementos decorativos en favor de un formato claro y profesional
- **Estructura de enlaces**: Actualizados todos los enlaces internos para soportar el nuevo sistema de navegación

#### Mejorado
- **Accesibilidad**: Eliminadas dependencias de emojis para una mejor compatibilidad con lectores de pantalla
- **Apariencia profesional**: Presentación limpia de estilo académico adecuada para aprendizaje empresarial
- **Experiencia de aprendizaje**: Enfoque estructurado con objetivos y resultados claros para cada lección
- **Organización del contenido**: Mejor flujo lógico y conexión entre temas relacionados

### [v1.0.0] - 2025-09-09

#### Lanzamiento inicial - Repositorio de aprendizaje integral de AZD

#### Añadido
- **Estructura principal de la documentación**
  - Serie completa de guías para comenzar
  - Documentación completa de despliegue y aprovisionamiento
  - Recursos detallados de solución de problemas y guías de depuración
  - Herramientas y procedimientos de validación previa al despliegue

- **Módulo de introducción**
  - AZD Basics: Conceptos y terminología fundamentales
  - Guía de instalación: Instrucciones de configuración específicas por plataforma
  - Guía de configuración: Preparación del entorno y autenticación
  - Tutorial del primer proyecto: Aprendizaje práctico paso a paso

- **Módulo de despliegue y aprovisionamiento**
  - Guía de despliegue: Documentación completa del flujo de trabajo
  - Guía de aprovisionamiento: Infrastructure as Code con Bicep
  - Mejores prácticas para despliegues en producción
  - Patrones de arquitectura multi-servicio

- **Módulo de validación previa al despliegue**
  - Planificación de capacidad: Validación de disponibilidad de recursos de Azure
  - Selección de SKU: Guía completa de niveles de servicio
  - Comprobaciones previas: Scripts de validación automatizados (PowerShell y Bash)
  - Herramientas de estimación de costos y planificación presupuestaria

- **Módulo de solución de problemas**
  - Problemas comunes: Problemas y soluciones frecuentes
  - Guía de depuración: Metodologías sistemáticas de resolución de problemas
  - Técnicas y herramientas de diagnóstico avanzadas
  - Monitoreo de rendimiento y optimización

- **Recursos y referencias**
  - Hoja de referencia de comandos: Referencia rápida de comandos esenciales
  - Glosario: Definiciones completas de terminología y acrónimos
  - FAQ: Respuestas detalladas a preguntas frecuentes
  - Enlaces a recursos externos y conexiones comunitarias

- **Ejemplos y plantillas**
  - Ejemplo de aplicación web simple
  - Plantilla de despliegue de sitio web estático
  - Configuración de aplicación en contenedor
  - Patrones de integración de bases de datos
  - Ejemplos de arquitectura de microservicios
  - Implementaciones de funciones sin servidor

#### Características
- **Soporte multiplataforma**: Guías de instalación y configuración para Windows, macOS y Linux
- **Múltiples niveles de habilidad**: Contenido diseñado desde estudiantes hasta desarrolladores profesionales
- **Enfoque práctico**: Ejemplos prácticos y escenarios del mundo real
- **Cobertura completa**: Desde conceptos básicos hasta patrones empresariales avanzados
- **Enfoque de seguridad ante todo**: Mejores prácticas de seguridad integradas en todo el material
- **Optimización de costos**: Orientación para despliegues rentables y gestión de recursos

#### Calidad de la documentación
- **Ejemplos de código detallados**: Muestras de código prácticas y probadas
- **Instrucciones paso a paso**: Orientación clara y procesable
- **Manejo completo de errores**: Solución de problemas para incidencias comunes
- **Integración de mejores prácticas**: Estándares y recomendaciones de la industria
- **Compatibilidad de versiones**: Actualizado con los últimos servicios de Azure y características de azd

## Mejoras futuras planificadas

### Versión 3.1.0 (Planificada)
#### Expansión de la plataforma de IA
- **Compatibilidad multmodelo**: Patrones de integración para Hugging Face, Azure Machine Learning y modelos personalizados
- **Frameworks de agentes de IA**: Plantillas para despliegues de LangChain, Semantic Kernel y AutoGen
- **Patrones RAG avanzados**: Opciones de bases de datos vectoriales más allá de Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidad de IA**: Monitoreo mejorado del rendimiento del modelo, uso de tokens y calidad de respuestas

#### Experiencia del desarrollador
- **Extensión para VS Code**: Experiencia de desarrollo integrada AZD + AI Foundry
- **Integración con GitHub Copilot**: Generación de plantillas AZD asistida por IA
- **Tutoriales interactivos**: Ejercicios prácticos de codificación con validación automatizada para escenarios de IA
- **Contenido en video**: Tutoriales en video complementarios para aprendices visuales centrados en despliegues de IA

### Versión 4.0.0 (Planificada)
#### Patrones de IA empresariales
- **Marco de gobernanza**: Gobernanza de modelos de IA, cumplimiento y registros de auditoría
- **IA multiinquilino**: Patrones para atender a múltiples clientes con servicios de IA aislados
- **Despliegue de IA en el edge**: Integración con Azure IoT Edge e instancias de contenedores
- **IA en nube híbrida**: Patrones multicloud e híbridos para cargas de trabajo de IA

#### Funciones avanzadas
- **Automatización de pipelines de IA**: Integración de MLOps con pipelines de Azure Machine Learning
- **Seguridad avanzada**: Patrones de zero-trust, endpoints privados y protección avanzada contra amenazas
- **Optimización del rendimiento**: Afinación avanzada y estrategias de escalado para aplicaciones de IA de alto rendimiento
- **Distribución global**: Patrones de entrega de contenido y caché en el edge para aplicaciones de IA

### Versión 3.0.0 (Planificada) - Reemplazada por la versión actual
#### Adiciones propuestas - Ahora implementadas en v3.0.0
- ✅ **Contenido orientado a IA**: Integración completa de Microsoft Foundry (Completado)
- ✅ **Tutoriales interactivos**: Taller práctico de IA (Completado)
- ✅ **Módulo avanzado de seguridad**: Patrones de seguridad específicos para IA (Completado)
- ✅ **Optimización del rendimiento**: Estrategias de afinación para cargas de trabajo de IA (Completado)

### Versión 2.1.0 (Planificada) - Parcialmente implementada en v3.0.0
#### Mejoras menores - Algunas completadas en la versión actual
- ✅ **Ejemplos adicionales**: Escenarios de despliegue centrados en IA (Completado)
- ✅ **FAQ ampliado**: Preguntas y solución de problemas específicos de IA (Completado)
- **Integración de herramientas**: Guías mejoradas de integración con IDE y editores
- ✅ **Expansión del monitoreo**: Patrones de monitoreo y alertas específicos de IA (Completado)

#### Aún planificado para una versión futura
- **Documentación optimizada para móviles**: Diseño responsive para aprendizaje móvil
- **Acceso sin conexión**: Paquetes de documentación descargables
- **Integración mejorada con IDE**: Extensión de VS Code para flujos de trabajo AZD + IA
- **Panel comunitario**: Métricas comunitarias en tiempo real y seguimiento de contribuciones

## Contribuir al registro de cambios

### Reportar cambios
Al contribuir a este repositorio, por favor asegúrese de que las entradas del registro de cambios incluyan:

1. **Número de versión**: Siguiendo el versionado semántico (major.minor.patch)
2. **Fecha**: Fecha de lanzamiento o actualización en formato YYYY-MM-DD
3. **Categoría**: Añadido, Cambiado, Obsoleto, Eliminado, Corregido, Seguridad
4. **Descripción clara**: Descripción concisa de lo que cambió
5. **Evaluación de impacto**: Cómo los cambios afectan a los usuarios existentes

### Categorías de cambios

#### Añadido
- Nuevas características, secciones de documentación o capacidades
- Nuevos ejemplos, plantillas o recursos de aprendizaje
- Herramientas adicionales, scripts o utilidades

#### Cambiado
- Modificaciones a la funcionalidad o documentación existente
- Actualizaciones para mejorar claridad o precisión
- Reestructuración de contenido u organización

#### Obsoleto
- Características o enfoques que están siendo eliminados progresivamente
- Secciones de documentación programadas para su eliminación
- Métodos que tienen mejores alternativas

#### Eliminado
- Características, documentación o ejemplos que ya no son relevantes
- Información obsoleta o enfoques desaprobados
- Contenido redundante o consolidado

#### Corregido
- Correcciones de errores en la documentación o el código
- Resolución de problemas reportados
- Mejoras en precisión o funcionalidad

#### Seguridad
- Mejoras o correcciones relacionadas con la seguridad
- Actualizaciones de mejores prácticas de seguridad
- Resolución de vulnerabilidades de seguridad

### Directrices de versionado semántico

#### Versión mayor (X.0.0)
- Cambios incompatibles que requieren acción por parte del usuario
- Reestructuración significativa del contenido u organización
- Cambios que alteran el enfoque o la metodología fundamentales

#### Versión menor (X.Y.0)
- Nuevas características o adiciones de contenido
- Mejoras que mantienen compatibilidad hacia atrás
- Ejemplos adicionales, herramientas o recursos

#### Versión de parche (X.Y.Z)
- Correcciones de errores y correcciones menores
- Pequeñas mejoras en contenido existente
- Aclaraciones y mejoras menores

## Comentarios y sugerencias de la comunidad

Animamos activamente a la comunidad a enviar comentarios para mejorar este recurso de aprendizaje:

### Cómo proporcionar comentarios
- **GitHub Issues**: Reportar problemas o sugerir mejoras (se aceptan problemas específicos de IA)
- **Discord Discussions**: Compartir ideas y participar con la comunidad de Microsoft Foundry
- **Pull Requests**: Contribuir mejoras directas al contenido, especialmente plantillas y guías de IA
- **Microsoft Foundry Discord**: Participar en el canal #Azure para discusiones sobre AZD + IA
- **Foros comunitarios**: Participar en discusiones más amplias para desarrolladores de Azure

### Categorías de comentarios
- **Precisión del contenido de IA**: Correcciones sobre integración y despliegue de servicios de IA
- **Experiencia de aprendizaje**: Sugerencias para mejorar el flujo de aprendizaje de desarrolladores de IA
- **Faltan contenidos de IA**: Solicitudes de plantillas, patrones o ejemplos adicionales de IA
- **Accesibilidad**: Mejoras para necesidades de aprendizaje diversas
- **Integración de herramientas de IA**: Sugerencias para una mejor integración de flujos de trabajo de desarrollo de IA
- **Patrones de IA para producción**: Solicitudes de patrones de despliegue empresarial para IA

### Compromiso de respuesta
- **Respuesta a issues**: Dentro de 48 horas para problemas reportados
- **Solicitudes de funciones**: Evaluación dentro de una semana
- **Contribuciones comunitarias**: Revisión dentro de una semana
- **Problemas de seguridad**: Prioridad inmediata con respuesta acelerada

## Calendario de mantenimiento

### Actualizaciones regulares
- **Revisiones mensuales**: Exactitud del contenido y validación de enlaces
- **Actualizaciones trimestrales**: Adiciones y mejoras de contenido importantes
- **Revisiones semestrales**: Reestructuración y mejoras integrales
- **Lanzamientos anuales**: Actualizaciones de versión mayor con mejoras significativas

### Monitoreo y aseguramiento de la calidad
- **Pruebas automatizadas**: Validación regular de ejemplos de código y enlaces
- **Integración de comentarios de la comunidad**: Incorporación regular de sugerencias de usuarios
- **Actualizaciones tecnológicas**: Alineación con los últimos servicios de Azure y lanzamientos de azd
- **Auditorías de accesibilidad**: Revisión periódica para principios de diseño inclusivo

## Política de soporte de versiones

### Soporte de la versión actual
- **Última versión mayor**: Soporte completo con actualizaciones regulares
- **Versión mayor anterior**: Actualizaciones de seguridad y correcciones críticas durante 12 meses
- **Versiones heredadas**: Soporte por la comunidad solamente, sin actualizaciones oficiales

### Guía de migración
Cuando se publiquen versiones principales, proporcionamos:
- **Guías de migración**: Instrucciones paso a paso para la transición
- **Notas de compatibilidad**: Detalles sobre cambios que rompen la compatibilidad
- **Soporte de herramientas**: Scripts o utilidades para ayudar con la migración
- **Soporte de la comunidad**: Foros dedicados a preguntas sobre migración

---

**Navegación**
- **Lección anterior**: [Guía de estudio](resources/study-guide.md)
- **Siguiente lección**: Volver a [README principal](README.md)

**Mantente al día**: Sigue este repositorio para recibir notificaciones sobre nuevas versiones y actualizaciones importantes del material de aprendizaje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Descargo de responsabilidad:
Este documento ha sido traducido mediante el servicio de traducción automática Co-op Translator (https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la exactitud, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un humano. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
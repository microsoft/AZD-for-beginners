<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1bc63a39d4cf8fc5cb5c7040344be859",
  "translation_date": "2025-11-19T20:13:12+00:00",
  "source_file": "changelog.md",
  "language_code": "es"
}
-->
# Registro de Cambios - AZD Para Principiantes

## Introducción

Este registro de cambios documenta todas las modificaciones, actualizaciones y mejoras notables en el repositorio de AZD Para Principiantes. Seguimos los principios de versionado semántico y mantenemos este registro para ayudar a los usuarios a entender qué ha cambiado entre versiones.

## Objetivos de Aprendizaje

Al revisar este registro de cambios, podrás:
- Mantenerte informado sobre nuevas características y adiciones de contenido
- Comprender las mejoras realizadas en la documentación existente
- Rastrear correcciones de errores para garantizar precisión
- Seguir la evolución de los materiales de aprendizaje a lo largo del tiempo

## Resultados de Aprendizaje

Después de revisar las entradas del registro de cambios, serás capaz de:
- Identificar nuevos contenidos y recursos disponibles para el aprendizaje
- Comprender qué secciones han sido actualizadas o mejoradas
- Planificar tu ruta de aprendizaje basándote en los materiales más actuales
- Contribuir con comentarios y sugerencias para futuras mejoras

## Historial de Versiones

### [v3.8.0] - 2025-11-19

#### Documentación Avanzada: Monitoreo, Seguridad y Patrones de Coordinación Multi-Agente
**Esta versión añade lecciones de nivel avanzado sobre integración de Application Insights, patrones de autenticación y coordinación multi-agente para implementaciones en producción.**

#### Añadido
- **📊 Lección de Integración con Application Insights**: en `docs/pre-deployment/application-insights.md`:
  - Implementación enfocada en AZD con aprovisionamiento automático
  - Plantillas completas de Bicep para Application Insights + Log Analytics
  - Aplicaciones Python funcionales con telemetría personalizada (más de 1,200 líneas)
  - Patrones de monitoreo para AI/LLM (seguimiento de tokens/costos de Azure OpenAI)
  - 6 diagramas Mermaid (arquitectura, trazabilidad distribuida, flujo de telemetría)
  - 3 ejercicios prácticos (alertas, paneles, monitoreo de AI)
  - Ejemplos de consultas Kusto y estrategias de optimización de costos
  - Transmisión de métricas en vivo y depuración en tiempo real
  - Tiempo de aprendizaje de 40-50 minutos con patrones listos para producción

- **🔐 Lección de Patrones de Autenticación y Seguridad**: en `docs/getting-started/authsecurity.md`:
  - 3 patrones de autenticación (cadenas de conexión, Key Vault, identidad administrada)
  - Plantillas completas de infraestructura Bicep para implementaciones seguras
  - Código de aplicación Node.js con integración del SDK de Azure
  - 3 ejercicios completos (habilitar identidad administrada, identidad asignada por el usuario, rotación de Key Vault)
  - Mejores prácticas de seguridad y configuraciones RBAC
  - Guía de solución de problemas y análisis de costos
  - Patrones de autenticación sin contraseñas listos para producción

- **🤖 Lección de Patrones de Coordinación Multi-Agente**: en `docs/pre-deployment/coordination-patterns.md`:
  - 5 patrones de coordinación (secuencial, paralelo, jerárquico, basado en eventos, consenso)
  - Implementación completa de servicio orquestador (Python/Flask, más de 1,500 líneas)
  - 3 implementaciones especializadas de agentes (Investigador, Escritor, Editor)
  - Integración con Service Bus para colas de mensajes
  - Gestión de estado con Cosmos DB para sistemas distribuidos
  - 6 diagramas Mermaid mostrando interacciones entre agentes
  - 3 ejercicios avanzados (manejo de tiempos de espera, lógica de reintentos, disyuntores)
  - Desglose de costos ($240-565/mes) con estrategias de optimización
  - Integración con Application Insights para monitoreo

#### Mejorado
- **Capítulo de Pre-Despliegue**: Ahora incluye patrones completos de monitoreo y coordinación
- **Capítulo de Introducción**: Mejorado con patrones profesionales de autenticación
- **Preparación para Producción**: Cobertura completa desde seguridad hasta observabilidad
- **Esquema del Curso**: Actualizado para referenciar nuevas lecciones en los capítulos 3 y 6

#### Cambiado
- **Progresión de Aprendizaje**: Mejor integración de seguridad y monitoreo a lo largo del curso
- **Calidad de la Documentación**: Estándares consistentes de nivel A (95-97%) en las nuevas lecciones
- **Patrones de Producción**: Cobertura completa de extremo a extremo para implementaciones empresariales

#### Mejorado
- **Experiencia del Desarrollador**: Camino claro desde el desarrollo hasta el monitoreo en producción
- **Estándares de Seguridad**: Patrones profesionales para autenticación y gestión de secretos
- **Observabilidad**: Integración completa de Application Insights con AZD
- **Cargas de Trabajo de AI**: Monitoreo especializado para Azure OpenAI y sistemas multi-agente

#### Validado
- ✅ Todas las lecciones incluyen código funcional completo (no fragmentos)
- ✅ Diagramas Mermaid para aprendizaje visual (19 en total en 3 lecciones)
- ✅ Ejercicios prácticos con pasos de verificación (9 en total)
- ✅ Plantillas Bicep listas para producción desplegables con `azd up`
- ✅ Análisis de costos y estrategias de optimización
- ✅ Guías de solución de problemas y mejores prácticas
- ✅ Puntos de verificación de conocimiento con comandos de verificación

#### Resultados de Calificación de la Documentación
- **docs/pre-deployment/application-insights.md**: - Guía completa de monitoreo
- **docs/getting-started/authsecurity.md**: - Patrones de seguridad profesional
- **docs/pre-deployment/coordination-patterns.md**: - Arquitecturas avanzadas multi-agente
- **Nuevo Contenido General**: - Estándares de alta calidad consistentes

#### Implementación Técnica
- **Application Insights**: Log Analytics + telemetría personalizada + trazabilidad distribuida
- **Autenticación**: Identidad Administrada + Key Vault + patrones RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestación
- **Monitoreo**: Métricas en vivo + consultas Kusto + alertas + paneles
- **Gestión de Costos**: Estrategias de muestreo, políticas de retención, controles presupuestarios

### [v3.7.0] - 2025-11-19

#### Mejoras en la Calidad de la Documentación y Nuevo Ejemplo de Azure OpenAI
**Esta versión mejora la calidad de la documentación en todo el repositorio y añade un ejemplo completo de implementación de Azure OpenAI con interfaz de chat GPT-4.**

#### Añadido
- **🤖 Ejemplo de Chat de Azure OpenAI**: Implementación completa de GPT-4 en `examples/azure-openai-chat/`:
  - Infraestructura completa de Azure OpenAI (despliegue del modelo GPT-4)
  - Interfaz de chat en línea de comandos en Python con historial de conversaciones
  - Integración con Key Vault para almacenamiento seguro de claves API
  - Seguimiento del uso de tokens y estimación de costos
  - Limitación de tasa y manejo de errores
  - README completo con guía de despliegue de 35-45 minutos
  - 11 archivos listos para producción (plantillas Bicep, aplicación Python, configuración)
- **📚 Ejercicios de Documentación**: Añadidos ejercicios prácticos a la guía de configuración:
  - Ejercicio 1: Configuración multi-entorno (15 minutos)
  - Ejercicio 2: Práctica de gestión de secretos (10 minutos)
  - Criterios de éxito claros y pasos de verificación
- **✅ Verificación de Despliegue**: Sección de verificación añadida a la guía de despliegue:
  - Procedimientos de comprobación de estado
  - Lista de criterios de éxito
  - Salidas esperadas para todos los comandos de despliegue
  - Referencia rápida para solución de problemas

#### Mejorado
- **examples/README.md**: Actualizado a calidad de nivel A (93%):
  - Añadido azure-openai-chat a todas las secciones relevantes
  - Actualizado el conteo de ejemplos locales de 3 a 4
  - Añadido a la tabla de Ejemplos de Aplicaciones de AI
  - Integrado en el Inicio Rápido para Usuarios Intermedios
  - Añadido a la sección de Plantillas de Microsoft Foundry para Azure AI
  - Actualizado el Matriz de Comparación y las secciones de búsqueda tecnológica
- **Calidad de la Documentación**: Mejorada de B+ (87%) → A- (92%) en la carpeta docs:
  - Añadidas salidas esperadas a ejemplos de comandos críticos
  - Incluidos pasos de verificación para cambios de configuración
  - Aprendizaje práctico mejorado con ejercicios prácticos

#### Cambiado
- **Progresión de Aprendizaje**: Mejor integración de ejemplos de AI para aprendices intermedios
- **Estructura de la Documentación**: Ejercicios más prácticos con resultados claros
- **Proceso de Verificación**: Criterios de éxito explícitos añadidos a flujos clave

#### Mejorado
- **Experiencia del Desarrollador**: El despliegue de Azure OpenAI ahora toma 35-45 minutos (vs 60-90 para alternativas complejas)
- **Transparencia de Costos**: Estimaciones claras de costos ($50-200/mes) para el ejemplo de Azure OpenAI
- **Ruta de Aprendizaje**: Los desarrolladores de AI tienen un punto de entrada claro con azure-openai-chat
- **Estándares de Documentación**: Salidas esperadas y pasos de verificación consistentes

#### Validado
- ✅ Ejemplo de Azure OpenAI completamente funcional con `azd up`
- ✅ Los 11 archivos de implementación son sintácticamente correctos
- ✅ Las instrucciones del README coinciden con la experiencia real de despliegue
- ✅ Enlaces de documentación actualizados en más de 8 ubicaciones
- ✅ El índice de ejemplos refleja con precisión 4 ejemplos locales
- ✅ Sin enlaces externos duplicados en tablas
- ✅ Todas las referencias de navegación son correctas

#### Implementación Técnica
- **Arquitectura de Azure OpenAI**: GPT-4 + Key Vault + patrón de Container Apps
- **Seguridad**: Listo para Identidad Administrada, secretos en Key Vault
- **Monitoreo**: Integración con Application Insights
- **Gestión de Costos**: Seguimiento de tokens y optimización de uso
- **Despliegue**: Comando único `azd up` para configuración completa

### [v3.6.0] - 2025-11-19

#### Actualización Importante: Ejemplos de Despliegue de Aplicaciones en Contenedores
**Esta versión introduce ejemplos completos y listos para producción de despliegue de aplicaciones en contenedores usando Azure Developer CLI (AZD), con documentación completa e integración en la ruta de aprendizaje.**

#### Añadido
- **🚀 Ejemplos de Aplicaciones en Contenedores**: Nuevos ejemplos locales en `examples/container-app/`:
  - [Guía Maestra](examples/container-app/README.md): Resumen completo de despliegues en contenedores, inicio rápido, producción y patrones avanzados
  - [API Flask Simple](../../examples/container-app/simple-flask-api): API REST amigable para principiantes con escala a cero, sondas de salud, monitoreo y solución de problemas
  - [Arquitectura de Microservicios](../../examples/container-app/microservices): Despliegue multi-servicio listo para producción (API Gateway, Producto, Pedido, Usuario, Notificación), mensajería asíncrona, Service Bus, Cosmos DB, Azure SQL, trazabilidad distribuida, despliegue blue-green/canary
- **Mejores Prácticas**: Seguridad, monitoreo, optimización de costos y guía de CI/CD para cargas de trabajo en contenedores
- **Ejemplos de Código**: `azure.yaml` completo, plantillas Bicep e implementaciones de servicios en varios lenguajes (Python, Node.js, C#, Go)
- **Pruebas y Solución de Problemas**: Escenarios de prueba de extremo a extremo, comandos de monitoreo, guía de solución de problemas

#### Cambiado
- **README.md**: Actualizado para destacar y enlazar los nuevos ejemplos de aplicaciones en contenedores bajo "Ejemplos Locales - Aplicaciones en Contenedores"
- **examples/README.md**: Actualizado para resaltar ejemplos de aplicaciones en contenedores, añadir entradas a la matriz de comparación y actualizar referencias tecnológicas/arquitectónicas
- **Esquema del Curso y Guía de Estudio**: Actualizado para referenciar nuevos ejemplos de aplicaciones en contenedores y patrones de despliegue en capítulos relevantes

#### Validado
- ✅ Todos los nuevos ejemplos desplegables con `azd up` y siguen mejores prácticas
- ✅ Enlaces cruzados y navegación de documentación actualizados
- ✅ Los ejemplos cubren escenarios desde principiantes hasta avanzados, incluyendo microservicios en producción

#### Notas
- **Alcance**: Documentación y ejemplos en inglés únicamente
- **Próximos Pasos**: Ampliar con patrones avanzados adicionales de contenedores y automatización CI/CD en futuras versiones

### [v3.5.0] - 2025-11-19

#### Cambio de Marca del Producto: Microsoft Foundry
**Esta versión implementa un cambio completo de nombre del producto de "Azure AI Foundry" a "Microsoft Foundry" en toda la documentación en inglés, reflejando el cambio oficial de marca de Microsoft.**

#### Cambiado
- **🔄 Actualización del Nombre del Producto**: Cambio completo de marca de "Azure AI Foundry" a "Microsoft Foundry"
  - Actualizadas todas las referencias en la documentación en inglés en la carpeta `docs/`
  - Carpeta renombrada: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Archivo renombrado: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referencias de contenido actualizadas en 7 archivos de documentación

- **📁 Cambios en la Estructura de Carpetas**:
  - `docs/ai-foundry/` renombrada a `docs/microsoft-foundry/`
  - Todos los enlaces cruzados actualizados para reflejar la nueva estructura de carpetas
  - Enlaces de navegación validados en toda la documentación

- **📄 Renombrado de Archivos**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos los enlaces internos actualizados para referenciar el nuevo nombre de archivo

#### Archivos Actualizados
- **Documentación de Capítulos** (7 archivos):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 actualizaciones de enlaces de navegación
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referencias al nombre del producto actualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Ya usaba Microsoft Foundry (de actualizaciones previas)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referencias actualizadas (resumen, comentarios de la comunidad, documentación)
  - `docs/getting-started/azd-basics.md` - 4 enlaces cruzados actualizados
  - `docs/getting-started/first-project.md` - 2 enlaces de navegación de capítulos actualizados
  - `docs/getting-started/installation.md` - 2 enlaces al siguiente capítulo actualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referencias actualizadas (navegación, comunidad en Discord)
  - `docs/troubleshooting/common-issues.md` - 1 enlace de navegación actualizado
  - `docs/troubleshooting/debugging.md` - 1 enlace de navegación actualizado

- **Archivos de Estructura del Curso** (2 archivos):
  - `README.md` - 17 referencias actualizadas (resumen del curso, títulos de capítulos, sección de plantillas, ideas de la comunidad)
  - `course-outline.md` - 14 referencias actualizadas (resumen, objetivos de aprendizaje, recursos de capítulos)

#### Validado
- ✅ Cero referencias restantes a la ruta de carpeta "ai-foundry" en la documentación en inglés
- ✅ Cero referencias restantes al nombre del producto "Azure AI Foundry" en la documentación en inglés
- ✅ Todos los enlaces de navegación funcionales con la nueva estructura de carpetas
- ✅ Renombrado de archivos y carpetas completado con éxito
- ✅ Referencias cruzadas entre capítulos validadas

#### Notas
- **Alcance**: Cambios aplicados únicamente a la documentación en inglés en la carpeta `docs/`
- **Traducciones**: Las carpetas de traducción (`translations/`) no se actualizaron en esta versión
- **Taller**: Los materiales del taller (`workshop/`) no se actualizaron en esta versión
- **Ejemplos**: Los archivos de ejemplo pueden seguir haciendo referencia a nombres antiguos (se abordará en una actualización futura)
- **Enlaces Externos**: Las URL externas y las referencias al repositorio de GitHub permanecen sin cambios

#### Guía de Migración para Contribuidores
Si tienes ramas locales o documentación que hace referencia a la estructura anterior:
1. Actualiza las referencias a carpetas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Actualiza las referencias a archivos: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Sustituye el nombre del producto: "Azure AI Foundry" → "Microsoft Foundry"
4. Valida que todos los enlaces internos de la documentación sigan funcionando

---

### [v3.4.0] - 2025-10-24

#### Mejoras en la Vista Previa de Infraestructura y Validación
**Esta versión introduce soporte integral para la nueva función de vista previa de Azure Developer CLI y mejora la experiencia del usuario en los talleres.**

#### Añadido
- **🧪 Documentación de la función azd provision --preview**: Cobertura completa de la nueva capacidad de vista previa de infraestructura
  - Referencia de comandos y ejemplos de uso en una hoja de trucos
  - Integración detallada en la guía de aprovisionamiento con casos de uso y beneficios
  - Integración de verificación previa para una validación más segura del despliegue
  - Actualizaciones en la guía de inicio con prácticas de despliegue seguras
- **🚧 Banner de Estado del Taller**: Banner HTML profesional indicando el estado de desarrollo del taller
  - Diseño degradado con indicadores de construcción para una comunicación clara al usuario
  - Marca de tiempo de última actualización para mayor transparencia
  - Diseño adaptable a dispositivos móviles

#### Mejorado
- **Seguridad de Infraestructura**: Funcionalidad de vista previa integrada en toda la documentación de despliegue
- **Validación Previa al Despliegue**: Los scripts automatizados ahora incluyen pruebas de vista previa de infraestructura
- **Flujo de Trabajo del Desarrollador**: Secuencias de comandos actualizadas para incluir la vista previa como mejor práctica
- **Experiencia del Taller**: Expectativas claras para los usuarios sobre el estado de desarrollo del contenido

#### Cambiado
- **Mejores Prácticas de Despliegue**: Ahora se recomienda un flujo de trabajo basado en vista previa
- **Flujo de Documentación**: La validación de infraestructura se movió a una etapa más temprana en el proceso de aprendizaje
- **Presentación del Taller**: Comunicación profesional del estado con una línea de tiempo clara de desarrollo

#### Mejorado
- **Enfoque en la Seguridad**: Los cambios en la infraestructura ahora pueden validarse antes del despliegue
- **Colaboración en Equipo**: Los resultados de la vista previa pueden compartirse para revisión y aprobación
- **Conciencia de Costos**: Mejor comprensión de los costos de recursos antes del aprovisionamiento
- **Mitigación de Riesgos**: Reducción de fallos en el despliegue mediante validación anticipada

#### Implementación Técnica
- **Integración Multidocumento**: Función de vista previa documentada en 4 archivos clave
- **Patrones de Comandos**: Sintaxis y ejemplos consistentes en toda la documentación
- **Integración de Mejores Prácticas**: La vista previa se incluye en los flujos de trabajo y scripts de validación
- **Indicadores Visuales**: Marcadores claros de NUEVAS funciones para facilitar su descubrimiento

#### Infraestructura del Taller
- **Comunicación de Estado**: Banner HTML profesional con estilo degradado
- **Experiencia del Usuario**: Estado de desarrollo claro para evitar confusiones
- **Presentación Profesional**: Mantiene la credibilidad del repositorio mientras establece expectativas
- **Transparencia en la Línea de Tiempo**: Marca de tiempo de última actualización en octubre de 2025 para mayor responsabilidad

### [v3.3.0] - 2025-09-24

#### Materiales del Taller Mejorados y Experiencia de Aprendizaje Interactiva
**Esta versión introduce materiales completos para talleres con guías interactivas basadas en navegador y rutas de aprendizaje estructuradas.**

#### Añadido
- **🎥 Guía Interactiva del Taller**: Experiencia de taller basada en navegador con capacidad de vista previa de MkDocs
- **📝 Instrucciones Estructuradas del Taller**: Ruta de aprendizaje guiada en 7 pasos desde el descubrimiento hasta la personalización
  - 0-Introducción: Resumen y configuración del taller
  - 1-Seleccionar-Plantilla-AI: Proceso de descubrimiento y selección de plantillas
  - 2-Validar-Plantilla-AI: Procedimientos de despliegue y validación
  - 3-Descomponer-Plantilla-AI: Comprensión de la arquitectura de la plantilla
  - 4-Configurar-Plantilla-AI: Configuración y personalización
  - 5-Personalizar-Plantilla-AI: Modificaciones avanzadas e iteraciones
  - 6-Desmontar-Infraestructura: Limpieza y gestión de recursos
  - 7-Cierre: Resumen y próximos pasos
- **🛠️ Herramientas del Taller**: Configuración de MkDocs con tema Material para una experiencia de aprendizaje mejorada
- **🎯 Ruta de Aprendizaje Práctica**: Metodología de 3 pasos (Descubrimiento → Despliegue → Personalización)
- **📱 Integración con GitHub Codespaces**: Configuración fluida del entorno de desarrollo

#### Mejorado
- **Laboratorio de Taller AI**: Ampliado con una experiencia de aprendizaje estructurada de 2-3 horas
- **Documentación del Taller**: Presentación profesional con navegación y ayudas visuales
- **Progresión de Aprendizaje**: Guía clara paso a paso desde la selección de plantillas hasta el despliegue en producción
- **Experiencia del Desarrollador**: Herramientas integradas para flujos de trabajo de desarrollo optimizados

#### Mejorado
- **Accesibilidad**: Interfaz basada en navegador con búsqueda, funcionalidad de copiar y alternancia de temas
- **Aprendizaje a tu Ritmo**: Estructura flexible del taller que se adapta a diferentes velocidades de aprendizaje
- **Aplicación Práctica**: Escenarios reales de despliegue de plantillas AI
- **Integración Comunitaria**: Integración con Discord para soporte y colaboración en el taller

#### Características del Taller
- **Búsqueda Incorporada**: Descubrimiento rápido de palabras clave y lecciones
- **Copiar Bloques de Código**: Funcionalidad de copiar al pasar el cursor sobre todos los ejemplos de código
- **Alternancia de Temas**: Soporte para modo oscuro/claro según preferencias
- **Activos Visuales**: Capturas de pantalla y diagramas para una mejor comprensión
- **Integración de Ayuda**: Acceso directo a Discord para soporte comunitario

### [v3.2.0] - 2025-09-17

#### Reestructuración de Navegación y Sistema de Aprendizaje por Capítulos
**Esta versión introduce una estructura de aprendizaje por capítulos con navegación mejorada en todo el repositorio.**

#### Añadido
- **📚 Sistema de Aprendizaje por Capítulos**: Curso reestructurado en 8 capítulos progresivos de aprendizaje
  - Capítulo 1: Fundamentos y Inicio Rápido (⭐ - 30-45 mins)
  - Capítulo 2: Desarrollo AI-Primero (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuración y Autenticación (⭐⭐ - 45-60 mins)
  - Capítulo 4: Infraestructura como Código y Despliegue (⭐⭐⭐ - 1-1.5 horas)
  - Capítulo 5: Soluciones AI Multi-Agente (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validación y Planificación Previa al Despliegue (⭐⭐ - 1 hora)
  - Capítulo 7: Solución de Problemas y Depuración (⭐⭐ - 1-1.5 horas)
  - Capítulo 8: Patrones de Producción y Empresa (⭐⭐⭐⭐ - 2-3 horas)
- **📚 Sistema de Navegación Integral**: Encabezados y pies de página consistentes en toda la documentación
- **🎯 Seguimiento de Progreso**: Lista de verificación de finalización del curso y sistema de verificación de aprendizaje
- **🗺️ Guía de Ruta de Aprendizaje**: Puntos de entrada claros para diferentes niveles de experiencia y objetivos
- **🔗 Navegación Cruzada**: Capítulos relacionados y requisitos previos claramente enlazados

#### Mejorado
- **Estructura del README**: Transformado en una plataforma de aprendizaje estructurada con organización basada en capítulos
- **Navegación de Documentación**: Cada página ahora incluye contexto de capítulo y guía de progresión
- **Organización de Plantillas**: Ejemplos y plantillas asignados a capítulos de aprendizaje apropiados
- **Integración de Recursos**: Hojas de trucos, preguntas frecuentes y guías de estudio conectadas a capítulos relevantes
- **Integración del Taller**: Laboratorios prácticos asignados a múltiples objetivos de aprendizaje por capítulo

#### Cambiado
- **Progresión de Aprendizaje**: Pasó de documentación lineal a aprendizaje flexible basado en capítulos
- **Ubicación de Configuración**: La guía de configuración se reposicionó como Capítulo 3 para un mejor flujo de aprendizaje
- **Integración de Contenido AI**: Mejor integración de contenido específico de AI a lo largo del recorrido de aprendizaje
- **Contenido de Producción**: Patrones avanzados consolidados en el Capítulo 8 para aprendices empresariales

#### Mejorado
- **Experiencia del Usuario**: Migas de pan de navegación claras e indicadores de progresión por capítulo
- **Accesibilidad**: Patrones de navegación consistentes para facilitar la exploración del curso
- **Presentación Profesional**: Estructura de curso estilo universitario adecuada para formación académica y corporativa
- **Eficiencia de Aprendizaje**: Reducción del tiempo para encontrar contenido relevante mediante una mejor organización

#### Implementación Técnica
- **Encabezados de Navegación**: Navegación estándar por capítulos en más de 40 archivos de documentación
- **Navegación en el Pie de Página**: Guía de progresión consistente e indicadores de finalización de capítulos
- **Enlaces Cruzados**: Sistema integral de enlaces internos que conecta conceptos relacionados
- **Asignación de Capítulos**: Plantillas y ejemplos claramente asociados con objetivos de aprendizaje

#### Mejora de la Guía de Estudio
- **📚 Objetivos de Aprendizaje Completos**: Guía de estudio reestructurada para alinearse con el sistema de 8 capítulos
- **🎯 Evaluación por Capítulos**: Cada capítulo incluye objetivos de aprendizaje específicos y ejercicios prácticos
- **📋 Seguimiento de Progreso**: Cronograma de aprendizaje semanal con resultados medibles y listas de verificación de finalización
- **❓ Preguntas de Evaluación**: Preguntas de validación de conocimientos para cada capítulo con resultados profesionales
- **🛠️ Ejercicios Prácticos**: Actividades prácticas con escenarios reales de despliegue y solución de problemas
- **📊 Progresión de Habilidades**: Avance claro desde conceptos básicos hasta patrones empresariales con enfoque en desarrollo profesional
- **🎓 Marco de Certificación**: Resultados de desarrollo profesional y sistema de reconocimiento comunitario
- **⏱️ Gestión de Tiempos**: Plan de aprendizaje estructurado de 10 semanas con validación de hitos

### [v3.1.0] - 2025-09-17

#### Soluciones AI Multi-Agente Mejoradas
**Esta versión mejora la solución minorista multi-agente con mejores nombres para los agentes y documentación mejorada.**

#### Cambiado
- **Terminología Multi-Agente**: Reemplazado "agente Cora" por "agente Cliente" en toda la solución minorista multi-agente para mayor claridad
- **Arquitectura de Agentes**: Actualizada toda la documentación, plantillas ARM y ejemplos de código para usar nombres consistentes de "agente Cliente"
- **Ejemplos de Configuración**: Modernizados los patrones de configuración de agentes con convenciones de nombres actualizadas
- **Consistencia en la Documentación**: Asegurado que todas las referencias usen nombres de agentes profesionales y descriptivos

#### Mejorado
- **Paquete de Plantillas ARM**: Actualizado retail-multiagent-arm-template con referencias al agente Cliente
- **Diagramas de Arquitectura**: Diagramas Mermaid actualizados con nombres de agentes renovados
- **Ejemplos de Código**: Clases Python y ejemplos de implementación ahora usan el nombre CustomerAgent
- **Variables de Entorno**: Actualizados todos los scripts de despliegue para usar convenciones CUSTOMER_AGENT_NAME

#### Mejorado
- **Experiencia del Desarrollador**: Roles y responsabilidades de los agentes más claros en la documentación
- **Preparación para Producción**: Mejor alineación con convenciones de nombres empresariales
- **Materiales de Aprendizaje**: Nombres de agentes más intuitivos para fines educativos
- **Usabilidad de Plantillas**: Comprensión simplificada de las funciones de los agentes y patrones de despliegue

#### Detalles Técnicos
- Diagramas de arquitectura Mermaid actualizados con referencias a CustomerAgent
- Reemplazados nombres de clases CoraAgent por CustomerAgent en ejemplos de Python
- Configuraciones JSON de plantillas ARM modificadas para usar el tipo de agente "customer"
- Actualizadas variables de entorno de CORA_AGENT_* a patrones CUSTOMER_AGENT_*
- Refrescados todos los comandos de despliegue y configuraciones de contenedores

### [v3.0.0] - 2025-09-12

#### Cambios Importantes - Enfoque en Desarrolladores AI e Integración con Azure AI Foundry
**Esta versión transforma el repositorio en un recurso integral de aprendizaje enfocado en AI con integración de Azure AI Foundry.**

#### Añadido
- **🤖 Ruta de Aprendizaje AI-Primero**: Reestructuración completa priorizando a desarrolladores e ingenieros de AI
- **Guía de Integración con Azure AI Foundry**: Documentación completa para conectar AZD con servicios de Azure AI Foundry
- **Patrones de Despliegue de Modelos AI**: Guía detallada sobre selección de modelos, configuración y estrategias de despliegue en producción
- **Laboratorio de Taller AI**: Taller práctico de 2-3 horas para convertir aplicaciones AI en soluciones desplegables con AZD
- **Mejores Prácticas de Producción AI**: Patrones empresariales listos para escalar, monitorear y asegurar cargas de trabajo AI
- **Guía de Solución de Problemas AI**: Solución de problemas integral para Azure OpenAI, Cognitive Services y problemas de despliegue AI
- **Galería de Plantillas AI**: Colección destacada de plantillas de Azure AI Foundry con clasificaciones de complejidad
- **Materiales del Taller**: Estructura completa del taller con laboratorios prácticos y materiales de referencia

#### Mejorado
- **Estructura del README**: Enfocado en desarrolladores AI con datos de interés comunitario del 45% de Discord de Azure AI Foundry
- **Rutas de Aprendizaje**: Trayectoria dedicada para desarrolladores AI junto con rutas tradicionales para estudiantes e ingenieros DevOps
- **Recomendaciones de Plantillas**: Plantillas AI destacadas incluyendo azure-search-openai-demo, contoso-chat y openai-chat-app-quickstart
- **Integración Comunitaria**: Soporte mejorado en la comunidad de Discord con canales y discusiones específicas de AI

#### Enfoque en Seguridad y Producción
- **Patrones de Identidad Administrada**: Configuraciones de autenticación y seguridad específicas de AI
- **Optimización de Costos**: Seguimiento del uso de tokens y controles presupuestarios para cargas de trabajo AI
- **Despliegue Multi-Región**: Estrategias para despliegue global de aplicaciones AI
- **Monitoreo de Rendimiento**: Métricas específicas de AI e integración con Application Insights

#### Calidad de la Documentación
- **Estructura de Curso Lineal**: Progresión lógica desde conceptos básicos hasta patrones avanzados de despliegue AI
- **URLs Validadas**: Todos los enlaces externos al repositorio verificados y accesibles
- **Referencia Completa**: Todos los enlaces internos de la documentación validados y funcionales
- **Listo para Producción**: Patrones de despliegue empresarial con ejemplos del mundo real

### [v2.0.0] - 2025-09-09

#### Cambios Importantes - Reestructuración del Repositorio y Mejora Profesional
**Esta versión representa una revisión significativa de la estructura del repositorio y la presentación del contenido.**

#### Añadido
- **Marco de Aprendizaje Estructurado**: Todas las páginas de documentación ahora incluyen secciones de Introducción, Objetivos de Aprendizaje y Resultados de Aprendizaje
- **Sistema de Navegación**: Añadidos enlaces de lección Anterior/Siguiente en toda la documentación para una progresión guiada del aprendizaje
- **Guía de Estudio**: Guía de estudio completa (study-guide.md) con objetivos de aprendizaje, ejercicios prácticos y materiales de evaluación
- **Presentación Profesional**: Eliminados todos los iconos emoji para mejorar la accesibilidad y la apariencia profesional
- **Estructura de Contenido Mejorada**: Organización y flujo mejorados de los materiales de aprendizaje

#### Cambiado
- **Formato de Documentación**: Estandarización de toda la documentación con una estructura consistente enfocada en el aprendizaje
- **Flujo de Navegación**: Implementación de una progresión lógica a través de todos los materiales de aprendizaje
- **Presentación de Contenido**: Se eliminaron elementos decorativos en favor de un formato claro y profesional
- **Estructura de Enlaces**: Se actualizaron todos los enlaces internos para soportar el nuevo sistema de navegación

#### Mejorado
- **Accesibilidad**: Eliminación de dependencias de emojis para mejorar la compatibilidad con lectores de pantalla
- **Apariencia Profesional**: Presentación limpia, estilo académico, adecuada para aprendizaje empresarial
- **Experiencia de Aprendizaje**: Enfoque estructurado con objetivos y resultados claros para cada lección
- **Organización de Contenido**: Flujo lógico mejorado y conexión entre temas relacionados

### [v1.0.0] - 2025-09-09

#### Lanzamiento Inicial - Repositorio Integral de Aprendizaje AZD

#### Añadido
- **Estructura Principal de Documentación**
  - Serie completa de guías para comenzar
  - Documentación integral de despliegue y aprovisionamiento
  - Recursos detallados de resolución de problemas y guías de depuración
  - Herramientas y procedimientos de validación previa al despliegue

- **Módulo de Introducción**
  - Fundamentos de AZD: Conceptos y terminología clave
  - Guía de Instalación: Instrucciones específicas para cada plataforma
  - Guía de Configuración: Configuración del entorno y autenticación
  - Tutorial del Primer Proyecto: Aprendizaje práctico paso a paso

- **Módulo de Despliegue y Aprovisionamiento**
  - Guía de Despliegue: Documentación completa del flujo de trabajo
  - Guía de Aprovisionamiento: Infraestructura como código con Bicep
  - Mejores prácticas para despliegues en producción
  - Patrones de arquitectura de múltiples servicios

- **Módulo de Validación Previa al Despliegue**
  - Planificación de Capacidad: Validación de disponibilidad de recursos de Azure
  - Selección de SKU: Guía completa de niveles de servicio
  - Verificaciones Previas: Scripts de validación automatizados (PowerShell y Bash)
  - Herramientas de estimación de costos y planificación presupuestaria

- **Módulo de Resolución de Problemas**
  - Problemas Comunes: Problemas frecuentes y soluciones
  - Guía de Depuración: Metodologías sistemáticas de resolución de problemas
  - Técnicas y herramientas avanzadas de diagnóstico
  - Monitoreo y optimización del rendimiento

- **Recursos y Referencias**
  - Hoja de Comandos: Referencia rápida para comandos esenciales
  - Glosario: Definiciones completas de terminología y acrónimos
  - Preguntas Frecuentes: Respuestas detalladas a preguntas comunes
  - Enlaces a recursos externos y conexiones comunitarias

- **Ejemplos y Plantillas**
  - Ejemplo de aplicación web simple
  - Plantilla de despliegue de sitio web estático
  - Configuración de aplicación en contenedor
  - Patrones de integración de bases de datos
  - Ejemplos de arquitectura de microservicios
  - Implementaciones de funciones sin servidor

#### Características
- **Soporte Multiplataforma**: Guías de instalación y configuración para Windows, macOS y Linux
- **Múltiples Niveles de Habilidad**: Contenido diseñado para estudiantes y desarrolladores profesionales
- **Enfoque Práctico**: Ejemplos prácticos y escenarios del mundo real
- **Cobertura Integral**: Desde conceptos básicos hasta patrones empresariales avanzados
- **Enfoque en Seguridad**: Mejores prácticas de seguridad integradas en todo el contenido
- **Optimización de Costos**: Guía para despliegues rentables y gestión de recursos

#### Calidad de la Documentación
- **Ejemplos de Código Detallados**: Ejemplos prácticos y probados
- **Instrucciones Paso a Paso**: Guías claras y accionables
- **Manejo Integral de Errores**: Resolución de problemas comunes
- **Integración de Mejores Prácticas**: Estándares y recomendaciones de la industria
- **Compatibilidad de Versiones**: Actualizado con los últimos servicios de Azure y características de azd

## Mejoras Planeadas para el Futuro

### Versión 3.1.0 (Planeada)
#### Expansión de la Plataforma de IA
- **Soporte Multimodelo**: Patrones de integración para Hugging Face, Azure Machine Learning y modelos personalizados
- **Frameworks de Agentes de IA**: Plantillas para despliegues de LangChain, Semantic Kernel y AutoGen
- **Patrones Avanzados de RAG**: Opciones de bases de datos vectoriales más allá de Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidad de IA**: Monitoreo mejorado para rendimiento de modelos, uso de tokens y calidad de respuestas

#### Experiencia del Desarrollador
- **Extensión de VS Code**: Experiencia integrada de desarrollo AZD + AI Foundry
- **Integración con GitHub Copilot**: Generación de plantillas AZD asistida por IA
- **Tutoriales Interactivos**: Ejercicios prácticos de codificación con validación automatizada para escenarios de IA
- **Contenido en Video**: Tutoriales en video complementarios para estudiantes visuales enfocados en despliegues de IA

### Versión 4.0.0 (Planeada)
#### Patrones Empresariales de IA
- **Marco de Gobernanza**: Gobernanza de modelos de IA, cumplimiento y registros de auditoría
- **IA Multitenant**: Patrones para servir a múltiples clientes con servicios de IA aislados
- **Despliegue de IA en el Borde**: Integración con Azure IoT Edge e instancias de contenedores
- **IA en Nube Híbrida**: Patrones de despliegue multicloud e híbridos para cargas de trabajo de IA

#### Características Avanzadas
- **Automatización de Pipelines de IA**: Integración de MLOps con pipelines de Azure Machine Learning
- **Seguridad Avanzada**: Patrones de confianza cero, puntos finales privados y protección contra amenazas avanzadas
- **Optimización del Rendimiento**: Estrategias avanzadas de ajuste y escalado para aplicaciones de IA de alto rendimiento
- **Distribución Global**: Patrones de entrega de contenido y almacenamiento en caché en el borde para aplicaciones de IA

### Versión 3.0.0 (Planeada) - Reemplazada por la Versión Actual
#### Adiciones Propuestas - Ahora Implementadas en v3.0.0
- ✅ **Contenido Enfocado en IA**: Integración completa de Azure AI Foundry (Completado)
- ✅ **Tutoriales Interactivos**: Laboratorio práctico de IA (Completado)
- ✅ **Módulo de Seguridad Avanzada**: Patrones de seguridad específicos para IA (Completado)
- ✅ **Optimización del Rendimiento**: Estrategias de ajuste para cargas de trabajo de IA (Completado)

### Versión 2.1.0 (Planeada) - Parcialmente Implementada en v3.0.0
#### Mejoras Menores - Algunas Completadas en la Versión Actual
- ✅ **Ejemplos Adicionales**: Escenarios de despliegue enfocados en IA (Completado)
- ✅ **FAQ Extendida**: Preguntas y resolución de problemas específicos de IA (Completado)
- **Integración de Herramientas**: Guías mejoradas de integración con IDE y editores
- ✅ **Expansión de Monitoreo**: Patrones de monitoreo y alertas específicos de IA (Completado)

#### Aún Planeado para Futuras Versiones
- **Documentación Adaptada a Móviles**: Diseño responsivo para aprendizaje móvil
- **Acceso Sin Conexión**: Paquetes de documentación descargables
- **Integración Mejorada con IDE**: Extensión de VS Code para flujos de trabajo AZD + IA
- **Panel Comunitario**: Métricas comunitarias en tiempo real y seguimiento de contribuciones

## Contribuir al Registro de Cambios

### Reportar Cambios
Al contribuir a este repositorio, asegúrate de que las entradas del registro de cambios incluyan:

1. **Número de Versión**: Siguiendo la versión semántica (mayor.menor.parche)
2. **Fecha**: Fecha de lanzamiento o actualización en formato AAAA-MM-DD
3. **Categoría**: Añadido, Cambiado, Obsoleto, Eliminado, Corregido, Seguridad
4. **Descripción Clara**: Descripción concisa de lo que cambió
5. **Evaluación de Impacto**: Cómo los cambios afectan a los usuarios existentes

### Categorías de Cambios

#### Añadido
- Nuevas características, secciones de documentación o capacidades
- Nuevos ejemplos, plantillas o recursos de aprendizaje
- Herramientas, scripts o utilidades adicionales

#### Cambiado
- Modificaciones a funcionalidades o documentación existentes
- Actualizaciones para mejorar claridad o precisión
- Reestructuración de contenido u organización

#### Obsoleto
- Características o enfoques que están siendo eliminados
- Secciones de documentación programadas para eliminación
- Métodos que tienen mejores alternativas

#### Eliminado
- Características, documentación o ejemplos que ya no son relevantes
- Información desactualizada o enfoques obsoletos
- Contenido redundante o consolidado

#### Corregido
- Correcciones de errores en documentación o código
- Resolución de problemas o inconvenientes reportados
- Mejoras en precisión o funcionalidad

#### Seguridad
- Mejoras o correcciones relacionadas con seguridad
- Actualizaciones a mejores prácticas de seguridad
- Resolución de vulnerabilidades de seguridad

### Guías de Versionado Semántico

#### Versión Mayor (X.0.0)
- Cambios importantes que requieren acción del usuario
- Reestructuración significativa de contenido u organización
- Cambios que alteran el enfoque o metodología fundamental

#### Versión Menor (X.Y.0)
- Nuevas características o adiciones de contenido
- Mejoras que mantienen compatibilidad hacia atrás
- Ejemplos, herramientas o recursos adicionales

#### Versión de Parche (X.Y.Z)
- Corrección de errores y ajustes
- Mejoras menores en contenido existente
- Clarificaciones y pequeñas mejoras

## Retroalimentación y Sugerencias de la Comunidad

Animamos activamente la retroalimentación de la comunidad para mejorar este recurso de aprendizaje:

### Cómo Proporcionar Retroalimentación
- **Problemas en GitHub**: Reporta problemas o sugiere mejoras (se aceptan problemas específicos de IA)
- **Discusiones en Discord**: Comparte ideas y participa con la comunidad de Azure AI Foundry
- **Pull Requests**: Contribuye mejoras directas al contenido, especialmente plantillas y guías de IA
- **Discord de Azure AI Foundry**: Participa en el canal #Azure para discusiones sobre AZD + IA
- **Foros Comunitarios**: Participa en discusiones más amplias de desarrolladores de Azure

### Categorías de Retroalimentación
- **Precisión de Contenido de IA**: Correcciones sobre integración y despliegue de servicios de IA
- **Experiencia de Aprendizaje**: Sugerencias para mejorar el flujo de aprendizaje de desarrolladores de IA
- **Contenido de IA Faltante**: Solicitudes de plantillas, patrones o ejemplos adicionales de IA
- **Accesibilidad**: Mejoras para necesidades de aprendizaje diversas
- **Integración de Herramientas de IA**: Sugerencias para una mejor integración en flujos de trabajo de desarrollo de IA
- **Patrones de IA en Producción**: Solicitudes de patrones de despliegue empresarial de IA

### Compromiso de Respuesta
- **Respuesta a Problemas**: Dentro de 48 horas para problemas reportados
- **Solicitudes de Características**: Evaluación dentro de una semana
- **Contribuciones Comunitarias**: Revisión dentro de una semana
- **Problemas de Seguridad**: Prioridad inmediata con respuesta acelerada

## Programa de Mantenimiento

### Actualizaciones Regulares
- **Revisiones Mensuales**: Precisión de contenido y validación de enlaces
- **Actualizaciones Trimestrales**: Adiciones y mejoras importantes de contenido
- **Revisiones Semestrales**: Reestructuración y mejora integral
- **Lanzamientos Anuales**: Actualizaciones de versión mayor con mejoras significativas

### Monitoreo y Garantía de Calidad
- **Pruebas Automatizadas**: Validación regular de ejemplos de código y enlaces
- **Integración de Retroalimentación Comunitaria**: Incorporación regular de sugerencias de usuarios
- **Actualizaciones Tecnológicas**: Alineación con los últimos servicios de Azure y lanzamientos de azd
- **Auditorías de Accesibilidad**: Revisión regular para principios de diseño inclusivo

## Política de Soporte de Versiones

### Soporte de Versión Actual
- **Última Versión Mayor**: Soporte completo con actualizaciones regulares
- **Versión Mayor Anterior**: Actualizaciones de seguridad y correcciones críticas por 12 meses
- **Versiones Legadas**: Soporte comunitario únicamente, sin actualizaciones oficiales

### Guía de Migración
Cuando se lanzan versiones mayores, proporcionamos:
- **Guías de Migración**: Instrucciones paso a paso para la transición
- **Notas de Compatibilidad**: Detalles sobre cambios importantes
- **Soporte de Herramientas**: Scripts o utilidades para asistir en la migración
- **Soporte Comunitario**: Foros dedicados para preguntas sobre migración

---

**Navegación**
- **Lección Anterior**: [Guía de Estudio](resources/study-guide.md)
- **Próxima Lección**: Regresar al [README Principal](README.md)

**Mantente Actualizado**: Sigue este repositorio para recibir notificaciones sobre nuevos lanzamientos y actualizaciones importantes de los materiales de aprendizaje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
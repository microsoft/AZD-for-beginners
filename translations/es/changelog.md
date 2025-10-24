<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T16:26:40+00:00",
  "source_file": "changelog.md",
  "language_code": "es"
}
-->
# Registro de cambios - AZD para principiantes

## Introducción

Este registro de cambios documenta todas las modificaciones, actualizaciones y mejoras notables en el repositorio de AZD para principiantes. Seguimos los principios de versionado semántico y mantenemos este registro para ayudar a los usuarios a entender qué ha cambiado entre versiones.

## Objetivos de aprendizaje

Al revisar este registro de cambios, podrás:
- Mantenerte informado sobre nuevas características y adiciones de contenido.
- Comprender las mejoras realizadas en la documentación existente.
- Seguir las correcciones de errores para garantizar la precisión.
- Observar la evolución de los materiales de aprendizaje a lo largo del tiempo.

## Resultados de aprendizaje

Después de revisar las entradas del registro de cambios, serás capaz de:
- Identificar nuevos contenidos y recursos disponibles para el aprendizaje.
- Comprender qué secciones han sido actualizadas o mejoradas.
- Planificar tu ruta de aprendizaje basada en los materiales más actuales.
- Contribuir con comentarios y sugerencias para futuras mejoras.

## Historial de versiones

### [v3.4.0] - 2025-10-24

#### Mejoras en la vista previa y validación de infraestructura
**Esta versión introduce soporte integral para la nueva función de vista previa del CLI de Azure Developer y mejora la experiencia de los usuarios en los talleres.**

#### Añadido
- **🧪 Documentación de la función azd provision --preview**: Cobertura completa de la nueva capacidad de vista previa de infraestructura.
  - Referencia de comandos y ejemplos de uso en la hoja de trucos.
  - Integración detallada en la guía de aprovisionamiento con casos de uso y beneficios.
  - Integración de verificación previa para una validación de despliegue más segura.
  - Actualizaciones en la guía de inicio con prácticas de despliegue seguras.
- **🚧 Banner de estado del taller**: Banner profesional en HTML indicando el estado de desarrollo del taller.
  - Diseño degradado con indicadores de construcción para una comunicación clara con los usuarios.
  - Marca de tiempo de última actualización para mayor transparencia.
  - Diseño adaptable para dispositivos móviles.

#### Mejorado
- **Seguridad de infraestructura**: Funcionalidad de vista previa integrada en toda la documentación de despliegue.
- **Validación previa al despliegue**: Los scripts automatizados ahora incluyen pruebas de vista previa de infraestructura.
- **Flujo de trabajo del desarrollador**: Secuencias de comandos actualizadas para incluir la vista previa como mejor práctica.
- **Experiencia en talleres**: Expectativas claras para los usuarios sobre el estado de desarrollo del contenido.

#### Cambiado
- **Mejores prácticas de despliegue**: El flujo de trabajo basado en vista previa ahora es el enfoque recomendado.
- **Flujo de documentación**: La validación de infraestructura se movió a una etapa más temprana en el proceso de aprendizaje.
- **Presentación del taller**: Comunicación profesional del estado con un cronograma claro de desarrollo.

#### Mejorado
- **Enfoque de seguridad primero**: Los cambios en la infraestructura ahora pueden validarse antes del despliegue.
- **Colaboración en equipo**: Los resultados de la vista previa pueden compartirse para revisión y aprobación.
- **Conciencia de costos**: Mejor comprensión de los costos de recursos antes del aprovisionamiento.
- **Mitigación de riesgos**: Reducción de fallos en el despliegue mediante validación anticipada.

#### Implementación técnica
- **Integración en múltiples documentos**: La función de vista previa documentada en 4 archivos clave.
- **Patrones de comandos**: Sintaxis y ejemplos consistentes en toda la documentación.
- **Integración de mejores prácticas**: La vista previa incluida en flujos de validación y scripts.
- **Indicadores visuales**: Marcado claro de NUEVAS características para facilitar su descubrimiento.

#### Infraestructura del taller
- **Comunicación de estado**: Banner profesional en HTML con estilo degradado.
- **Experiencia del usuario**: El estado de desarrollo claro evita confusiones.
- **Presentación profesional**: Mantiene la credibilidad del repositorio mientras establece expectativas.
- **Transparencia del cronograma**: Marca de tiempo de última actualización en octubre de 2025 para rendición de cuentas.

### [v3.3.0] - 2025-09-24

#### Materiales mejorados para talleres y experiencia de aprendizaje interactivo
**Esta versión introduce materiales completos para talleres con guías interactivas basadas en navegador y rutas de aprendizaje estructuradas.**

#### Añadido
- **🎥 Guía interactiva del taller**: Experiencia de taller basada en navegador con capacidad de vista previa de MkDocs.
- **📝 Instrucciones estructuradas del taller**: Ruta de aprendizaje guiada en 7 pasos desde el descubrimiento hasta la personalización.
  - 0-Introducción: Resumen y configuración del taller.
  - 1-Seleccionar plantilla de IA: Proceso de descubrimiento y selección de plantillas.
  - 2-Validar plantilla de IA: Procedimientos de despliegue y validación.
  - 3-Descomponer plantilla de IA: Comprensión de la arquitectura de la plantilla.
  - 4-Configurar plantilla de IA: Configuración y personalización.
  - 5-Personalizar plantilla de IA: Modificaciones avanzadas e iteraciones.
  - 6-Desmontar infraestructura: Limpieza y gestión de recursos.
  - 7-Resumen: Resumen y próximos pasos.
- **🛠️ Herramientas para talleres**: Configuración de MkDocs con tema Material para una experiencia de aprendizaje mejorada.
- **🎯 Ruta de aprendizaje práctica**: Metodología de 3 pasos (Descubrimiento → Despliegue → Personalización).
- **📱 Integración con GitHub Codespaces**: Configuración de entorno de desarrollo sin problemas.

#### Mejorado
- **Laboratorio de taller de IA**: Ampliado con una experiencia de aprendizaje estructurada de 2-3 horas.
- **Documentación del taller**: Presentación profesional con navegación y ayudas visuales.
- **Progresión del aprendizaje**: Guía clara paso a paso desde la selección de plantillas hasta el despliegue en producción.
- **Experiencia del desarrollador**: Herramientas integradas para flujos de trabajo de desarrollo optimizados.

#### Mejorado
- **Accesibilidad**: Interfaz basada en navegador con búsqueda, funcionalidad de copiar y cambio de tema.
- **Aprendizaje a tu ritmo**: Estructura flexible del taller que se adapta a diferentes velocidades de aprendizaje.
- **Aplicación práctica**: Escenarios de despliegue de plantillas de IA en el mundo real.
- **Integración comunitaria**: Integración con Discord para soporte y colaboración en talleres.

#### Características del taller
- **Búsqueda integrada**: Descubrimiento rápido de palabras clave y lecciones.
- **Bloques de código para copiar**: Funcionalidad de copiar al pasar el cursor sobre todos los ejemplos de código.
- **Cambio de tema**: Soporte de modo oscuro/claro para diferentes preferencias.
- **Recursos visuales**: Capturas de pantalla y diagramas para una mejor comprensión.
- **Integración de ayuda**: Acceso directo a Discord para soporte comunitario.

### [v3.2.0] - 2025-09-17

#### Reestructuración importante de navegación y sistema de aprendizaje por capítulos
**Esta versión introduce una estructura de aprendizaje por capítulos con navegación mejorada en todo el repositorio.**

#### Añadido
- **📚 Sistema de aprendizaje por capítulos**: Reestructuración completa del curso en 8 capítulos progresivos de aprendizaje.
  - Capítulo 1: Fundamentos y inicio rápido (⭐ - 30-45 mins).
  - Capítulo 2: Desarrollo centrado en IA (⭐⭐ - 1-2 horas).
  - Capítulo 3: Configuración y autenticación (⭐⭐ - 45-60 mins).
  - Capítulo 4: Infraestructura como código y despliegue (⭐⭐⭐ - 1-1.5 horas).
  - Capítulo 5: Soluciones de IA multiagente (⭐⭐⭐⭐ - 2-3 horas).
  - Capítulo 6: Validación y planificación previa al despliegue (⭐⭐ - 1 hora).
  - Capítulo 7: Solución de problemas y depuración (⭐⭐ - 1-1.5 horas).
  - Capítulo 8: Patrones de producción y empresariales (⭐⭐⭐⭐ - 2-3 horas).
- **📚 Sistema de navegación integral**: Encabezados y pies de página consistentes en toda la documentación.
- **🎯 Seguimiento de progreso**: Lista de verificación de finalización del curso y sistema de verificación de aprendizaje.
- **🗺️ Guía de ruta de aprendizaje**: Puntos de entrada claros para diferentes niveles de experiencia y objetivos.
- **🔗 Navegación cruzada**: Enlaces claros entre capítulos relacionados y requisitos previos.

#### Mejorado
- **Estructura del README**: Transformado en una plataforma de aprendizaje estructurada con organización por capítulos.
- **Navegación de la documentación**: Cada página ahora incluye contexto de capítulo y guía de progresión.
- **Organización de plantillas**: Ejemplos y plantillas mapeados a capítulos de aprendizaje apropiados.
- **Integración de recursos**: Hojas de trucos, preguntas frecuentes y guías de estudio conectadas a capítulos relevantes.
- **Integración de talleres**: Laboratorios prácticos mapeados a objetivos de aprendizaje de múltiples capítulos.

#### Cambiado
- **Progresión del aprendizaje**: De documentación lineal a aprendizaje flexible basado en capítulos.
- **Ubicación de configuración**: La guía de configuración se reposicionó como el Capítulo 3 para un mejor flujo de aprendizaje.
- **Integración de contenido de IA**: Mejor integración de contenido específico de IA a lo largo del recorrido de aprendizaje.
- **Contenido de producción**: Patrones avanzados consolidados en el Capítulo 8 para aprendices empresariales.

#### Mejorado
- **Experiencia del usuario**: Migas de pan claras y indicadores de progresión de capítulos.
- **Accesibilidad**: Patrones de navegación consistentes para facilitar el recorrido del curso.
- **Presentación profesional**: Estructura de curso estilo universitario adecuada para formación académica y corporativa.
- **Eficiencia de aprendizaje**: Reducción del tiempo para encontrar contenido relevante mediante una organización mejorada.

#### Implementación técnica
- **Encabezados de navegación**: Navegación de capítulos estandarizada en más de 40 archivos de documentación.
- **Navegación en el pie de página**: Orientación consistente de progresión y indicadores de finalización de capítulos.
- **Enlaces cruzados**: Sistema integral de enlaces internos que conecta conceptos relacionados.
- **Mapeo de capítulos**: Plantillas y ejemplos claramente asociados con objetivos de aprendizaje.

#### Mejora de la guía de estudio
- **📚 Objetivos de aprendizaje completos**: Guía de estudio reestructurada para alinearse con el sistema de 8 capítulos.
- **🎯 Evaluación basada en capítulos**: Cada capítulo incluye objetivos de aprendizaje específicos y ejercicios prácticos.
- **📋 Seguimiento de progreso**: Programa de aprendizaje semanal con resultados medibles y listas de verificación de finalización.
- **❓ Preguntas de evaluación**: Preguntas de validación de conocimientos para cada capítulo con resultados profesionales.
- **🛠️ Ejercicios prácticos**: Actividades prácticas con escenarios reales de despliegue y solución de problemas.
- **📊 Progresión de habilidades**: Avance claro desde conceptos básicos hasta patrones empresariales con enfoque en desarrollo profesional.
- **🎓 Marco de certificación**: Resultados de desarrollo profesional y sistema de reconocimiento comunitario.
- **⏱️ Gestión de cronograma**: Plan de aprendizaje estructurado de 10 semanas con validación de hitos.

### [v3.1.0] - 2025-09-17

#### Soluciones mejoradas de IA multiagente
**Esta versión mejora la solución minorista multiagente con mejores nombres de agentes y documentación mejorada.**

#### Cambiado
- **Terminología multiagente**: Reemplazado "agente Cora" por "agente Cliente" en toda la solución minorista multiagente para mayor claridad.
- **Arquitectura de agentes**: Actualizada toda la documentación, plantillas ARM y ejemplos de código para usar nombres consistentes de "agente Cliente".
- **Ejemplos de configuración**: Modernizados los patrones de configuración de agentes con convenciones de nombres actualizadas.
- **Consistencia en la documentación**: Asegurado que todas las referencias utilicen nombres de agentes profesionales y descriptivos.

#### Mejorado
- **Paquete de plantillas ARM**: Actualizada la plantilla retail-multiagent-arm-template con referencias al agente Cliente.
- **Diagramas de arquitectura**: Diagramas Mermaid renovados con nombres de agentes actualizados.
- **Ejemplos de código**: Las clases de Python y ejemplos de implementación ahora usan el nombre CustomerAgent.
- **Variables de entorno**: Actualizados todos los scripts de despliegue para usar convenciones CUSTOMER_AGENT_NAME.

#### Mejorado
- **Experiencia del desarrollador**: Roles y responsabilidades de los agentes más claros en la documentación.
- **Preparación para producción**: Mejor alineación con convenciones de nombres empresariales.
- **Materiales de aprendizaje**: Nombres de agentes más intuitivos para propósitos educativos.
- **Usabilidad de plantillas**: Comprensión simplificada de las funciones de los agentes y patrones de despliegue.

#### Detalles técnicos
- Diagramas de arquitectura Mermaid actualizados con referencias a CustomerAgent.
- Reemplazados nombres de clase CoraAgent por CustomerAgent en ejemplos de Python.
- Modificados configuraciones JSON de plantillas ARM para usar el tipo de agente "cliente".
- Actualizados comandos de despliegue y configuraciones de contenedores.
- Renovados todos los scripts de despliegue y variables de entorno.

### [v3.0.0] - 2025-09-12

#### Cambios importantes - Enfoque en desarrolladores de IA e integración con Azure AI Foundry
**Esta versión transforma el repositorio en un recurso integral de aprendizaje enfocado en IA con integración de Azure AI Foundry.**

#### Añadido
- **🤖 Ruta de aprendizaje centrada en IA**: Reestructuración completa priorizando desarrolladores e ingenieros de IA.
- **Guía de integración con Azure AI Foundry**: Documentación completa para conectar AZD con servicios de Azure AI Foundry.
- **Patrones de despliegue de modelos de IA**: Guía detallada sobre selección de modelos, configuración y estrategias de despliegue en producción.
- **Laboratorio de taller de IA**: Taller práctico de 2-3 horas para convertir aplicaciones de IA en soluciones desplegables con AZD.
- **Mejores prácticas de producción de IA**: Patrones empresariales listos para escalar, monitorear y asegurar cargas de trabajo de IA.
- **Guía de solución de problemas específica de IA**: Solución de problemas integral para Azure OpenAI, Cognitive Services y problemas de despliegue de IA.
- **Galería de plantillas de IA**: Colección destacada de plantillas de Azure AI Foundry con clasificaciones de complejidad.
- **Materiales del taller**: Estructura completa del taller con laboratorios prácticos y materiales de referencia.

#### Mejorado
- **Estructura del README**: Enfocado en desarrolladores de IA con datos de interés comunitario del 45% desde Discord de Azure AI Foundry.
- **Rutas de aprendizaje**: Viaje dedicado para desarrolladores de IA junto con rutas tradicionales para estudiantes e ingenieros DevOps.
- **Recomendaciones de plantillas**: Plantillas de IA destacadas incluyendo azure-search-openai-demo, contoso-chat y openai-chat-app-quickstart.
- **Integración comunitaria**: Soporte comunitario mejorado en Discord con canales y discusiones específicas de IA.

#### Enfoque en seguridad y producción
- **Patrones de identidad administrada**: Configuraciones específicas de autenticación y seguridad para IA.
- **Optimización de costos**: Seguimiento de uso de tokens y controles de presupuesto para cargas de trabajo de IA.
- **Despliegue multirregional**: Estrategias para despliegue global de aplicaciones de IA.
- **Monitoreo de rendimiento**: Métricas específicas de IA e integración con Application Insights.

#### Calidad de la documentación
- **Estructura de curso lineal**: Progresión lógica desde conceptos básicos hasta patrones avanzados de despliegue de IA.
- **URLs validadas**: Todos los enlaces a repositorios externos verificados y accesibles.
- **Referencia completa**: Todos los enlaces internos de la documentación validados y funcionales.
- **Preparación para producción**: Patrones de despliegue empresariales con ejemplos del mundo real.

### [v2.0.0] - 2025-09-09

#### Cambios importantes - Reestructuración del repositorio y mejora profesional
**Esta versión representa una revisión significativa de la estructura del repositorio y la presentación del contenido.**

#### Añadido
- **Marco de aprendizaje estructurado**: Todas las páginas de documentación ahora incluyen secciones de Introducción, Objetivos de aprendizaje y Resultados de aprendizaje.
- **Sistema de navegación**: Enlaces de lección anterior/siguiente añadidos en toda la documentación para una progresión guiada en el aprendizaje.
- **Guía de estudio**: Guía de estudio completa con objetivos de aprendizaje, ejercicios prácticos y materiales de evaluación.
- **Presentación profesional**: Eliminación de todos los íconos emoji para mejorar la accesibilidad y la apariencia profesional.
- **Estructura de contenido mejorada**: Organización y flujo mejorados de los materiales de aprendizaje.

#### Cambiado
- **Formato de Documentación**: Estandarización de toda la documentación con una estructura consistente enfocada en el aprendizaje
- **Flujo de Navegación**: Implementación de una progresión lógica a través de todos los materiales de aprendizaje
- **Presentación de Contenido**: Eliminación de elementos decorativos en favor de un formato claro y profesional
- **Estructura de Enlaces**: Actualización de todos los enlaces internos para soportar el nuevo sistema de navegación

#### Mejorado
- **Accesibilidad**: Eliminación de dependencias de emojis para mejorar la compatibilidad con lectores de pantalla
- **Apariencia Profesional**: Presentación limpia y de estilo académico adecuada para aprendizaje empresarial
- **Experiencia de Aprendizaje**: Enfoque estructurado con objetivos y resultados claros para cada lección
- **Organización de Contenido**: Mejor flujo lógico y conexión entre temas relacionados

### [v1.0.0] - 2025-09-09

#### Lanzamiento Inicial - Repositorio Integral de Aprendizaje AZD

#### Añadido
- **Estructura Principal de Documentación**
  - Serie completa de guías para comenzar
  - Documentación integral de despliegue y aprovisionamiento
  - Recursos detallados de resolución de problemas y guías de depuración
  - Herramientas y procedimientos de validación previos al despliegue

- **Módulo de Introducción**
  - Fundamentos de AZD: Conceptos y terminología clave
  - Guía de Instalación: Instrucciones de configuración específicas de la plataforma
  - Guía de Configuración: Configuración del entorno y autenticación
  - Tutorial del Primer Proyecto: Aprendizaje práctico paso a paso

- **Módulo de Despliegue y Aprovisionamiento**
  - Guía de Despliegue: Documentación completa del flujo de trabajo
  - Guía de Aprovisionamiento: Infraestructura como Código con Bicep
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

## Mejoras Futuras Planeadas

### Versión 3.1.0 (Planeada)
#### Expansión de Plataforma de IA
- **Soporte Multimodelo**: Patrones de integración para Hugging Face, Azure Machine Learning y modelos personalizados
- **Frameworks de Agentes de IA**: Plantillas para despliegues de LangChain, Semantic Kernel y AutoGen
- **Patrones Avanzados de RAG**: Opciones de bases de datos vectoriales más allá de Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidad de IA**: Monitoreo mejorado para rendimiento de modelos, uso de tokens y calidad de respuestas

#### Experiencia del Desarrollador
- **Extensión de VS Code**: Experiencia de desarrollo integrada AZD + AI Foundry
- **Integración con GitHub Copilot**: Generación de plantillas AZD asistida por IA
- **Tutoriales Interactivos**: Ejercicios prácticos de codificación con validación automatizada para escenarios de IA
- **Contenido en Video**: Tutoriales en video complementarios para estudiantes visuales enfocados en despliegues de IA

### Versión 4.0.0 (Planeada)
#### Patrones Empresariales de IA
- **Marco de Gobernanza**: Gobernanza de modelos de IA, cumplimiento y registros de auditoría
- **IA Multitenant**: Patrones para servir a múltiples clientes con servicios de IA aislados
- **Despliegue de IA en el Borde**: Integración con Azure IoT Edge e instancias de contenedores
- **IA en Nube Híbrida**: Patrones de despliegue multicloud e híbridos para cargas de trabajo de IA

#### Funciones Avanzadas
- **Automatización de Pipelines de IA**: Integración de MLOps con pipelines de Azure Machine Learning
- **Seguridad Avanzada**: Patrones de confianza cero, puntos finales privados y protección contra amenazas avanzadas
- **Optimización del Rendimiento**: Estrategias avanzadas de ajuste y escalado para aplicaciones de IA de alto rendimiento
- **Distribución Global**: Patrones de entrega de contenido y almacenamiento en caché en el borde para aplicaciones de IA

### Versión 3.0.0 (Planeada) - Reemplazada por la Versión Actual
#### Adiciones Propuestas - Ahora Implementadas en v3.0.0
- ✅ **Contenido Enfocado en IA**: Integración completa de Azure AI Foundry (Completado)
- ✅ **Tutoriales Interactivos**: Laboratorio práctico de IA (Completado)
- ✅ **Módulo de Seguridad Avanzada**: Patrones de seguridad específicos de IA (Completado)
- ✅ **Optimización del Rendimiento**: Estrategias de ajuste de cargas de trabajo de IA (Completado)

### Versión 2.1.0 (Planeada) - Parcialmente Implementada en v3.0.0
#### Mejoras Menores - Algunas Completadas en la Versión Actual
- ✅ **Ejemplos Adicionales**: Escenarios de despliegue enfocados en IA (Completado)
- ✅ **FAQ Extendido**: Preguntas y resolución de problemas específicos de IA (Completado)
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

### Categorías de Cambio

#### Añadido
- Nuevas funciones, secciones de documentación o capacidades
- Nuevos ejemplos, plantillas o recursos de aprendizaje
- Herramientas, scripts o utilidades adicionales

#### Cambiado
- Modificaciones a funcionalidades o documentación existentes
- Actualizaciones para mejorar la claridad o precisión
- Reestructuración de contenido u organización

#### Obsoleto
- Funciones o enfoques que están siendo eliminados
- Secciones de documentación programadas para eliminación
- Métodos que tienen mejores alternativas

#### Eliminado
- Funciones, documentación o ejemplos que ya no son relevantes
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
- Nuevas funciones o adiciones de contenido
- Mejoras que mantienen compatibilidad hacia atrás
- Ejemplos, herramientas o recursos adicionales

#### Versión de Parche (X.Y.Z)
- Corrección de errores y ajustes menores
- Mejoras pequeñas en contenido existente
- Clarificaciones y mejoras menores

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
- **Solicitudes de Funciones**: Evaluación dentro de una semana
- **Contribuciones Comunitarias**: Revisión dentro de una semana
- **Problemas de Seguridad**: Prioridad inmediata con respuesta acelerada

## Programa de Mantenimiento

### Actualizaciones Regulares
- **Revisiones Mensuales**: Validación de precisión de contenido y enlaces
- **Actualizaciones Trimestrales**: Adiciones y mejoras importantes de contenido
- **Revisiones Semestrales**: Reestructuración y mejora integral
- **Lanzamientos Anuales**: Actualizaciones de versión mayor con mejoras significativas

### Monitoreo y Garantía de Calidad
- **Pruebas Automatizadas**: Validación regular de ejemplos de código y enlaces
- **Integración de Retroalimentación Comunitaria**: Incorporación regular de sugerencias de usuarios
- **Actualizaciones Tecnológicas**: Alineación con los últimos servicios de Azure y lanzamientos de azd
- **Auditorías de Accesibilidad**: Revisión regular de principios de diseño inclusivo

## Política de Soporte de Versiones

### Soporte de Versión Actual
- **Última Versión Mayor**: Soporte completo con actualizaciones regulares
- **Versión Mayor Anterior**: Actualizaciones de seguridad y correcciones críticas durante 12 meses
- **Versiones Antiguas**: Solo soporte comunitario, sin actualizaciones oficiales

### Guía de Migración
Cuando se lanzan versiones mayores, proporcionamos:
- **Guías de Migración**: Instrucciones paso a paso para la transición
- **Notas de Compatibilidad**: Detalles sobre cambios importantes
- **Soporte de Herramientas**: Scripts o utilidades para ayudar con la migración
- **Soporte Comunitario**: Foros dedicados para preguntas sobre migración

---

**Navegación**
- **Lección Anterior**: [Guía de Estudio](resources/study-guide.md)
- **Siguiente Lección**: Regresar al [README Principal](README.md)

**Mantente Actualizado**: Sigue este repositorio para recibir notificaciones sobre nuevos lanzamientos y actualizaciones importantes de los materiales de aprendizaje.

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
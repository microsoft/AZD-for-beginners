<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "babd9fee2001054ecde767c9b1c85394",
  "translation_date": "2025-09-17T15:00:48+00:00",
  "source_file": "course-outline.md",
  "language_code": "es"
}
-->
## Estructura de Aprendizaje en 8 Capítulos

### Capítulo 1: Fundamentos y Comienzo Rápido (30-45 minutos) 🌱
**Requisitos previos**: Suscripción a Azure, conocimientos básicos de línea de comandos  
**Complejidad**: ⭐

#### Lo que Aprenderás
- Comprender los fundamentos de Azure Developer CLI
- Instalar AZD en tu plataforma  
- Tu primer despliegue exitoso
- Conceptos y terminología clave

#### Recursos de Aprendizaje
- [Conceptos Básicos de AZD](docs/getting-started/azd-basics.md) - Conceptos principales
- [Instalación y Configuración](docs/getting-started/installation.md) - Guías específicas por plataforma
- [Tu Primer Proyecto](docs/getting-started/first-project.md) - Tutorial práctico
- [Hoja de Referencia de Comandos](resources/cheat-sheet.md) - Referencia rápida

#### Resultado Práctico
Desplegar con éxito una aplicación web simple en Azure usando AZD

---

### Capítulo 2: Desarrollo con Enfoque en IA (1-2 horas) 🤖
**Requisitos previos**: Capítulo 1 completado  
**Complejidad**: ⭐⭐

#### Lo que Aprenderás
- Integración de Azure AI Foundry con AZD
- Despliegue de aplicaciones impulsadas por IA
- Configuración de servicios de IA
- Patrones RAG (Generación Aumentada por Recuperación)

#### Recursos de Aprendizaje
- [Integración de Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- [Despliegue de Modelos de IA](docs/ai-foundry/ai-model-deployment.md)
- [Laboratorio de Taller de IA](docs/ai-foundry/ai-workshop-lab.md) - Laboratorio práctico
- [Plantillas de Azure AI Foundry](README.md#featured-azure-ai-foundry-templates)

#### Resultado Práctico
Desplegar y configurar una aplicación de chat impulsada por IA con capacidades RAG

---

### Capítulo 3: Configuración y Autenticación (45-60 minutos) ⚙️
**Requisitos previos**: Capítulo 1 completado  
**Complejidad**: ⭐⭐

#### Lo que Aprenderás
- Configuración y gestión de entornos
- Mejores prácticas de autenticación y seguridad
- Nomenclatura y organización de recursos
- Despliegues en múltiples entornos

#### Recursos de Aprendizaje
- [Guía de Configuración](docs/getting-started/configuration.md) - Configuración de entornos
- Patrones de seguridad e identidad administrada
- Ejemplos de múltiples entornos

#### Resultado Práctico
Gestionar múltiples entornos con autenticación y seguridad adecuadas

---

### Capítulo 4: Infraestructura como Código y Despliegue (1-1.5 horas) 🏗️
**Requisitos previos**: Capítulos 1-3 completados  
**Complejidad**: ⭐⭐⭐

#### Lo que Aprenderás
- Patrones avanzados de despliegue
- Infraestructura como Código con Bicep
- Estrategias de aprovisionamiento de recursos
- Creación de plantillas personalizadas

#### Recursos de Aprendizaje
- [Guía de Despliegue](docs/deployment/deployment-guide.md) - Flujos de trabajo completos
- [Aprovisionamiento de Recursos](docs/deployment/provisioning.md) - Gestión de recursos
- Ejemplos de contenedores y microservicios

#### Resultado Práctico
Desplegar aplicaciones complejas de múltiples servicios utilizando plantillas de infraestructura personalizadas

---

### Capítulo 5: Soluciones de IA con Múltiples Agentes (2-3 horas) 🤖🤖
**Requisitos previos**: Capítulos 1-2 completados  
**Complejidad**: ⭐⭐⭐⭐

#### Lo que Aprenderás
- Patrones de arquitectura de múltiples agentes
- Orquestación y coordinación de agentes
- Despliegues de IA listos para producción
- Implementaciones de agentes de Cliente e Inventario

#### Recursos de Aprendizaje
- [Solución Minorista de Múltiples Agentes](examples/retail-scenario.md) - Implementación completa
- [Paquete de Plantillas ARM](../../examples/retail-multiagent-arm-template) - Despliegue con un clic
- Patrones de coordinación de múltiples agentes

#### Resultado Práctico
Desplegar y gestionar una solución de IA con múltiples agentes lista para producción

---

### Capítulo 6: Validación y Planificación Previa al Despliegue (1 hora) 🔍
**Requisitos previos**: Capítulo 4 completado  
**Complejidad**: ⭐⭐

#### Lo que Aprenderás
- Planificación de capacidad y validación de recursos
- Estrategias de selección de SKU
- Verificaciones previas al despliegue y automatización
- Planificación de optimización de costos

#### Recursos de Aprendizaje
- [Planificación de Capacidad](docs/pre-deployment/capacity-planning.md) - Validación de recursos
- [Selección de SKU](docs/pre-deployment/sku-selection.md) - Opciones rentables
- [Verificaciones Previas](docs/pre-deployment/preflight-checks.md) - Scripts automatizados

#### Resultado Práctico
Validar y optimizar despliegues antes de su ejecución

---

### Capítulo 7: Resolución de Problemas y Depuración (1-1.5 horas) 🔧
**Requisitos previos**: Cualquier capítulo de despliegue completado  
**Complejidad**: ⭐⭐

#### Lo que Aprenderás
- Enfoques sistemáticos de depuración
- Problemas comunes y soluciones
- Resolución de problemas específicos de IA
- Optimización del rendimiento

#### Recursos de Aprendizaje
- [Problemas Comunes](docs/troubleshooting/common-issues.md) - Preguntas frecuentes y soluciones
- [Guía de Depuración](docs/troubleshooting/debugging.md) - Estrategias paso a paso
- [Resolución de Problemas de IA](docs/troubleshooting/ai-troubleshooting.md) - Problemas con servicios de IA

#### Resultado Práctico
Diagnosticar y resolver problemas comunes de despliegue de forma independiente

---

### Capítulo 8: Patrones de Producción y Empresa (2-3 horas) 🏢
**Requisitos previos**: Capítulos 1-4 completados  
**Complejidad**: ⭐⭐⭐⭐

#### Lo que Aprenderás
- Estrategias de despliegue en producción
- Patrones de seguridad empresarial
- Monitoreo y optimización de costos
- Escalabilidad y gobernanza

#### Recursos de Aprendizaje
- [Mejores Prácticas de IA en Producción](docs/ai-foundry/production-ai-practices.md) - Patrones empresariales
- Ejemplos de microservicios y empresa
- Marcos de monitoreo y gobernanza

#### Resultado Práctico
Desplegar aplicaciones listas para empresa con capacidades completas de producción

---

## Progresión de Aprendizaje y Complejidad

### Desarrollo Progresivo de Habilidades

- **🌱 Principiantes**: Comienza con el Capítulo 1 (Fundamentos) → Capítulo 2 (Desarrollo con IA)
- **🔧 Intermedios**: Capítulos 3-4 (Configuración e Infraestructura) → Capítulo 6 (Validación)
- **🚀 Avanzados**: Capítulo 5 (Soluciones de Múltiples Agentes) → Capítulo 7 (Resolución de Problemas)
- **🏢 Empresariales**: Completa todos los capítulos, enfocándote en el Capítulo 8 (Patrones de Producción)

### Indicadores de Complejidad

- **⭐ Básico**: Conceptos simples, tutoriales guiados, 30-60 minutos
- **⭐⭐ Intermedio**: Múltiples conceptos, práctica práctica, 1-2 horas  
- **⭐⭐⭐ Avanzado**: Arquitecturas complejas, soluciones personalizadas, 1-3 horas
- **⭐⭐⭐⭐ Experto**: Sistemas en producción, patrones empresariales, 2-4 horas

### Rutas de Aprendizaje Flexibles

#### 🎯 Ruta Rápida para Desarrolladores de IA (4-6 horas)
1. **Capítulo 1**: Fundamentos y Comienzo Rápido (45 mins)
2. **Capítulo 2**: Desarrollo con Enfoque en IA (2 horas)  
3. **Capítulo 5**: Soluciones de Múltiples Agentes (3 horas)
4. **Capítulo 8**: Mejores Prácticas de IA en Producción (1 hora)

#### 🛠️ Ruta para Especialistas en Infraestructura (5-7 horas)
1. **Capítulo 1**: Fundamentos y Comienzo Rápido (45 mins)
2. **Capítulo 3**: Configuración y Autenticación (1 hora)
3. **Capítulo 4**: Infraestructura como Código y Despliegue (1.5 horas)
4. **Capítulo 6**: Validación y Planificación Previa al Despliegue (1 hora)
5. **Capítulo 7**: Resolución de Problemas y Depuración (1.5 horas)
6. **Capítulo 8**: Patrones de Producción y Empresa (2 horas)

#### 🎓 Ruta de Aprendizaje Completa (8-12 horas)
Completa los 8 capítulos de forma secuencial con práctica práctica y validación

## Marco de Finalización del Curso

### Validación del Conocimiento
- **Puntos de Control por Capítulo**: Ejercicios prácticos con resultados medibles
- **Verificación Práctica**: Despliegue de soluciones funcionales para cada capítulo
- **Seguimiento del Progreso**: Indicadores visuales y distintivos de finalización
- **Validación Comunitaria**: Comparte experiencias en los canales de Discord de Azure

### Evaluación de Resultados de Aprendizaje

#### Finalización de los Capítulos 1-2 (Fundamentos + IA)
- ✅ Desplegar una aplicación web básica usando AZD
- ✅ Desplegar una aplicación de chat impulsada por IA con RAG
- ✅ Comprender los conceptos clave de AZD y la integración de IA

#### Finalización de los Capítulos 3-4 (Configuración + Infraestructura)  
- ✅ Gestionar despliegues en múltiples entornos
- ✅ Crear plantillas de infraestructura personalizadas con Bicep
- ✅ Implementar patrones de autenticación seguros

#### Finalización de los Capítulos 5-6 (Múltiples Agentes + Validación)
- ✅ Desplegar una solución de IA con múltiples agentes compleja
- ✅ Realizar planificación de capacidad y optimización de costos
- ✅ Implementar validación automatizada previa al despliegue

#### Finalización de los Capítulos 7-8 (Resolución de Problemas + Producción)
- ✅ Depurar y resolver problemas de despliegue de forma independiente  
- ✅ Implementar monitoreo y seguridad de nivel empresarial
- ✅ Desplegar aplicaciones listas para producción con gobernanza

### Certificación y Reconocimiento
- **Distintivo de Finalización del Curso**: Completa los 8 capítulos con validación práctica
- **Reconocimiento Comunitario**: Participación activa en el Discord de Azure AI Foundry
- **Desarrollo Profesional**: Habilidades relevantes para despliegues de AZD e IA
- **Avance Profesional**: Capacidades de despliegue en la nube listas para empresa

## Adecuación del Contenido para Desarrolladores Modernos

### Profundidad Técnica y Cobertura
- **Integración con Azure OpenAI**: Cobertura completa de GPT-4o, embeddings y despliegues multi-modelo
- **Patrones de Arquitectura de IA**: Implementaciones RAG, orquestación de múltiples agentes y flujos de trabajo de IA en producción
- **Infraestructura como Código**: Plantillas Bicep, despliegues ARM y aprovisionamiento automatizado
- **Preparación para Producción**: Seguridad, escalado, monitoreo, optimización de costos y gobernanza
- **Patrones Empresariales**: Despliegues en múltiples entornos, integración CI/CD y marcos de cumplimiento

### Enfoque en el Aprendizaje Práctico
- **Automatización de Despliegues**: Énfasis en flujos de trabajo prácticos de AZD, no en conceptos teóricos
- **Escenarios del Mundo Real**: Solución completa de múltiples agentes para el sector minorista con agentes de Cliente e Inventario
- **Ejemplos de Producción**: Paquetes de plantillas ARM, despliegues con un clic y patrones empresariales
- **Habilidades de Resolución de Problemas**: Depuración específica de IA, diagnósticos de múltiples servicios y optimización del rendimiento
- **Relevancia en la Industria**: Basado en comentarios de la comunidad de Azure AI Foundry y requisitos empresariales

### Integración con la Comunidad y Soporte
- **Integración con Discord**: Participación activa en las comunidades de Azure AI Foundry y Microsoft Azure
- **Discusiones en GitHub**: Aprendizaje colaborativo y resolución de problemas con pares y expertos
- **Acceso a Expertos**: Conexión directa con ingenieros de Microsoft y especialistas en despliegues de IA
- **Actualizaciones Continuas**: El contenido del curso evoluciona con las actualizaciones de la plataforma Azure y los comentarios de la comunidad
- **Desarrollo Profesional**: Habilidades directamente aplicables a roles modernos de desarrollo en la nube y IA

### Validación de Resultados de Aprendizaje
- **Habilidades Medibles**: Cada capítulo incluye ejercicios prácticos de despliegue con resultados verificables
- **Desarrollo de Portafolio**: Proyectos completos adecuados para portafolios profesionales y entrevistas laborales
- **Reconocimiento en la Industria**: Las habilidades se alinean con las demandas actuales del mercado laboral para despliegues de AZD e IA
- **Red Profesional**: Acceso a la comunidad de desarrolladores de Azure para avanzar en la carrera y colaborar

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.
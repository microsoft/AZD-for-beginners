<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-17T15:10:08+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "es"
}
-->
# Guía de Estudio - Objetivos de Aprendizaje Completos

**Navegación de la Ruta de Aprendizaje**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../README.md)
- **📖 Comienza a Aprender**: [Capítulo 1: Fundamentos y Inicio Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Seguimiento del Progreso**: [Finalización del Curso](../README.md#-course-completion--certification)

## Introducción

Esta guía de estudio completa proporciona objetivos de aprendizaje estructurados, conceptos clave, ejercicios prácticos y materiales de evaluación para ayudarte a dominar Azure Developer CLI (azd). Utiliza esta guía para seguir tu progreso y asegurarte de que has cubierto todos los temas esenciales.

## Metas de Aprendizaje

Al completar esta guía de estudio, podrás:
- Dominar todos los conceptos fundamentales y avanzados de Azure Developer CLI
- Desarrollar habilidades prácticas en el despliegue y gestión de aplicaciones en Azure
- Construir confianza en la resolución de problemas y optimización de despliegues
- Comprender prácticas de despliegue listas para producción y consideraciones de seguridad

## Resultados de Aprendizaje

Después de completar todas las secciones de esta guía de estudio, serás capaz de:
- Diseñar, desplegar y gestionar arquitecturas completas de aplicaciones utilizando azd
- Implementar estrategias completas de monitoreo, seguridad y optimización de costos
- Resolver problemas complejos de despliegue de manera independiente
- Crear plantillas personalizadas y contribuir a la comunidad de azd

## Estructura de Aprendizaje en 8 Capítulos

### Capítulo 1: Fundamentos e Inicio Rápido (Semana 1)
**Duración**: 30-45 minutos | **Complejidad**: ⭐

#### Objetivos de Aprendizaje
- Comprender los conceptos y la terminología básicos de Azure Developer CLI
- Instalar y configurar AZD correctamente en tu plataforma de desarrollo
- Desplegar tu primera aplicación utilizando una plantilla existente
- Navegar eficazmente por la interfaz de línea de comandos de AZD

#### Conceptos Clave para Dominar
- Estructura y componentes del proyecto AZD (azure.yaml, infra/, src/)
- Flujos de trabajo de despliegue basados en plantillas
- Fundamentos de configuración de entornos
- Gestión de grupos de recursos y suscripciones

#### Ejercicios Prácticos
1. **Verificación de Instalación**: Instalar AZD y verificar con `azd version`
2. **Primer Despliegue**: Desplegar la plantilla todo-nodejs-mongo exitosamente
3. **Configuración de Entorno**: Configurar tus primeras variables de entorno
4. **Exploración de Recursos**: Navegar por los recursos desplegados en el Portal de Azure

#### Preguntas de Evaluación
- ¿Cuáles son los componentes principales de un proyecto AZD?
- ¿Cómo se inicializa un nuevo proyecto desde una plantilla?
- ¿Cuál es la diferencia entre `azd up` y `azd deploy`?
- ¿Cómo se gestionan múltiples entornos con AZD?

---

### Capítulo 2: Desarrollo con IA como Prioridad (Semana 2)
**Duración**: 1-2 horas | **Complejidad**: ⭐⭐

#### Objetivos de Aprendizaje
- Integrar servicios de Azure AI Foundry con flujos de trabajo de AZD
- Desplegar y configurar aplicaciones impulsadas por IA
- Comprender patrones de implementación de RAG (Generación Aumentada por Recuperación)
- Gestionar despliegues y escalado de modelos de IA

#### Conceptos Clave para Dominar
- Integración del servicio Azure OpenAI y gestión de API
- Configuración de búsqueda con IA e indexación vectorial
- Estrategias de despliegue de modelos y planificación de capacidad
- Monitoreo y optimización del rendimiento de aplicaciones de IA

#### Ejercicios Prácticos
1. **Despliegue de Chat con IA**: Desplegar la plantilla azure-search-openai-demo
2. **Implementación de RAG**: Configurar indexación y recuperación de documentos
3. **Configuración de Modelos**: Configurar múltiples modelos de IA con diferentes propósitos
4. **Monitoreo de IA**: Implementar Application Insights para cargas de trabajo de IA

#### Preguntas de Evaluación
- ¿Cómo se configuran los servicios Azure OpenAI en una plantilla AZD?
- ¿Cuáles son los componentes clave de una arquitectura RAG?
- ¿Cómo se gestiona la capacidad y el escalado de modelos de IA?
- ¿Qué métricas de monitoreo son importantes para aplicaciones de IA?

---

### Capítulo 3: Configuración y Autenticación (Semana 3)
**Duración**: 45-60 minutos | **Complejidad**: ⭐⭐

#### Objetivos de Aprendizaje
- Dominar estrategias de configuración y gestión de entornos
- Implementar patrones de autenticación segura e identidad administrada
- Organizar recursos con convenciones de nomenclatura adecuadas
- Configurar despliegues en múltiples entornos (dev, staging, prod)

#### Conceptos Clave para Dominar
- Jerarquía de entornos y precedencia de configuración
- Autenticación con identidad administrada y principal de servicio
- Integración de Key Vault para gestión de secretos
- Gestión de parámetros específicos de cada entorno

#### Ejercicios Prácticos
1. **Configuración Multi-Entorno**: Configurar entornos dev, staging y prod
2. **Configuración de Seguridad**: Implementar autenticación con identidad administrada
3. **Gestión de Secretos**: Integrar Azure Key Vault para datos sensibles
4. **Gestión de Parámetros**: Crear configuraciones específicas para cada entorno

#### Preguntas de Evaluación
- ¿Cómo se configuran diferentes entornos con AZD?
- ¿Cuáles son los beneficios de usar identidad administrada en lugar de principales de servicio?
- ¿Cómo se gestionan de manera segura los secretos de aplicaciones?
- ¿Cuál es la jerarquía de configuración en AZD?

---

### Capítulo 4: Infraestructura como Código y Despliegue (Semana 4-5)
**Duración**: 1-1.5 horas | **Complejidad**: ⭐⭐⭐

#### Objetivos de Aprendizaje
- Crear y personalizar plantillas de infraestructura con Bicep
- Implementar patrones y flujos de trabajo de despliegue avanzados
- Comprender estrategias de aprovisionamiento de recursos
- Diseñar arquitecturas escalables de múltiples servicios

#### Conceptos Clave para Dominar
- Estructura de plantillas Bicep y mejores prácticas
- Dependencias de recursos y orden de despliegue
- Archivos de parámetros y modularidad de plantillas
- Hooks personalizados y automatización de despliegues

#### Ejercicios Prácticos
1. **Creación de Plantilla Personalizada**: Construir una plantilla de aplicación de múltiples servicios
2. **Dominio de Bicep**: Crear componentes de infraestructura modulares y reutilizables
3. **Automatización de Despliegues**: Implementar hooks pre/post despliegue
4. **Diseño de Arquitectura**: Desplegar una arquitectura compleja de microservicios

#### Preguntas de Evaluación
- ¿Cómo se crean plantillas Bicep personalizadas para AZD?
- ¿Cuáles son las mejores prácticas para organizar código de infraestructura?
- ¿Cómo se manejan las dependencias de recursos en las plantillas?
- ¿Qué patrones de despliegue soportan actualizaciones sin tiempo de inactividad?

---

### Capítulo 5: Soluciones de IA Multi-Agente (Semana 6-7)
**Duración**: 2-3 horas | **Complejidad**: ⭐⭐⭐⭐

#### Objetivos de Aprendizaje
- Diseñar e implementar arquitecturas de IA multi-agente
- Orquestar la coordinación y comunicación entre agentes
- Desplegar soluciones de IA listas para producción con monitoreo
- Comprender especialización de agentes y patrones de flujo de trabajo

#### Conceptos Clave para Dominar
- Patrones de arquitectura multi-agente y principios de diseño
- Protocolos de comunicación entre agentes y flujo de datos
- Estrategias de balanceo de carga y escalado para agentes de IA
- Monitoreo en producción para sistemas multi-agente

#### Ejercicios Prácticos
1. **Despliegue de Solución Minorista**: Desplegar el escenario completo de retail multi-agente
2. **Personalización de Agentes**: Modificar comportamientos de los agentes de Cliente e Inventario
3. **Escalado de Arquitectura**: Implementar balanceo de carga y autoescalado
4. **Monitoreo en Producción**: Configurar monitoreo y alertas completas

#### Preguntas de Evaluación
- ¿Cómo se diseñan patrones efectivos de comunicación entre agentes?
- ¿Cuáles son las consideraciones clave para escalar cargas de trabajo de agentes de IA?
- ¿Cómo se monitorean y depuran sistemas de IA multi-agente?
- ¿Qué patrones de producción aseguran la confiabilidad de los agentes de IA?

---

### Capítulo 6: Validación y Planificación Pre-Despliegue (Semana 8)
**Duración**: 1 hora | **Complejidad**: ⭐⭐

#### Objetivos de Aprendizaje
- Realizar planificación de capacidad y validación de recursos de manera integral
- Seleccionar los SKUs óptimos de Azure para rentabilidad
- Implementar verificaciones automáticas previas al despliegue
- Planificar despliegues con estrategias de optimización de costos

#### Conceptos Clave para Dominar
- Cuotas de recursos de Azure y limitaciones de capacidad
- Criterios de selección de SKUs y optimización de costos
- Scripts de validación automatizados y pruebas
- Metodologías de planificación de capacidad
- Evaluación de riesgos y planificación de despliegue

#### Ejercicios Prácticos
1. **Análisis de Capacidad**: Analizar los requisitos de recursos para tus aplicaciones
2. **Optimización de SKUs**: Comparar y seleccionar niveles de servicio rentables
3. **Automatización de Validación**: Implementar scripts de verificación previa al despliegue
4. **Planificación de Costos**: Crear estimaciones de costos y presupuestos de despliegue

#### Preguntas de Evaluación
- ¿Cómo se valida la capacidad de Azure antes del despliegue?
- ¿Qué factores influyen en las decisiones de selección de SKUs?
- ¿Cómo se automatiza la validación previa al despliegue?
- ¿Qué estrategias ayudan a optimizar los costos de despliegue?
2. ¿Cómo validas la disponibilidad de recursos de Azure antes del despliegue?  
3. ¿Cuáles son los componentes clave de un sistema de verificación previa?  
4. ¿Cómo estimas y controlas los costos de despliegue?  
5. ¿Qué monitoreo es esencial para la planificación de capacidad?  

### Módulo 5: Resolución de Problemas y Depuración (Semana 6)

#### Objetivos de Aprendizaje  
- Dominar metodologías sistemáticas de resolución de problemas  
- Desarrollar experiencia en la depuración de problemas complejos de despliegue  
- Implementar monitoreo y alertas completas  
- Crear procedimientos de respuesta y recuperación ante incidentes  

#### Conceptos Clave para Dominar  
- Patrones comunes de fallos en despliegues  
- Análisis y correlación de registros  
- Monitoreo y optimización del rendimiento  
- Detección y respuesta ante incidentes de seguridad  
- Recuperación ante desastres y continuidad del negocio  

#### Ejercicios Prácticos  

**Ejercicio 5.1: Escenarios de Resolución de Problemas**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```  

**Ejercicio 5.2: Implementación de Monitoreo**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```  

**Ejercicio 5.3: Respuesta ante Incidentes**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```  

#### Preguntas de Autoevaluación  
1. ¿Cuál es el enfoque sistemático para resolver problemas en despliegues azd?  
2. ¿Cómo correlacionas registros entre múltiples servicios y recursos?  
3. ¿Qué métricas de monitoreo son más críticas para la detección temprana de problemas?  
4. ¿Cómo implementas procedimientos efectivos de recuperación ante desastres?  
5. ¿Cuáles son los componentes clave de un plan de respuesta ante incidentes?  

### Módulo 6: Temas Avanzados y Mejores Prácticas (Semana 7-8)

#### Objetivos de Aprendizaje  
- Implementar patrones de despliegue de nivel empresarial  
- Dominar la integración y automatización de CI/CD  
- Desarrollar plantillas personalizadas y contribuir a la comunidad  
- Comprender requisitos avanzados de seguridad y cumplimiento  

#### Conceptos Clave para Dominar  
- Patrones de integración de pipelines CI/CD  
- Desarrollo y distribución de plantillas personalizadas  
- Gobernanza y cumplimiento empresarial  
- Configuraciones avanzadas de redes y seguridad  
- Optimización del rendimiento y gestión de costos  

#### Ejercicios Prácticos  

**Ejercicio 6.1: Integración de CI/CD**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```  

**Ejercicio 6.2: Desarrollo de Plantillas Personalizadas**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```  

**Ejercicio 6.3: Implementación Empresarial**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```  

#### Preguntas de Autoevaluación  
1. ¿Cómo integras azd en flujos de trabajo CI/CD existentes?  
2. ¿Cuáles son las consideraciones clave para el desarrollo de plantillas personalizadas?  
3. ¿Cómo implementas gobernanza y cumplimiento en despliegues azd?  
4. ¿Cuáles son las mejores prácticas para despliegues a escala empresarial?  
5. ¿Cómo contribuyes de manera efectiva a la comunidad azd?  

## Proyectos Prácticos  

### Proyecto 1: Sitio Web de Portafolio Personal  
**Complejidad**: Principiante  
**Duración**: 1-2 semanas  

Construye y despliega un sitio web de portafolio personal utilizando:  
- Hosting de sitio web estático en Azure Storage  
- Configuración de dominio personalizado  
- Integración de CDN para rendimiento global  
- Pipeline de despliegue automatizado  

**Entregables**:  
- Sitio web funcional desplegado en Azure  
- Plantilla azd personalizada para despliegues de portafolio  
- Documentación del proceso de despliegue  
- Recomendaciones de análisis y optimización de costos  

### Proyecto 2: Aplicación de Gestión de Tareas  
**Complejidad**: Intermedio  
**Duración**: 2-3 semanas  

Crea una aplicación de gestión de tareas full-stack con:  
- Frontend en React desplegado en App Service  
- Backend API en Node.js con autenticación  
- Base de datos PostgreSQL con migraciones  
- Monitoreo con Application Insights  

**Entregables**:  
- Aplicación completa con autenticación de usuarios  
- Esquema de base de datos y scripts de migración  
- Tableros de monitoreo y reglas de alerta  
- Configuración de despliegue para múltiples entornos  

### Proyecto 3: Plataforma de Comercio Electrónico con Microservicios  
**Complejidad**: Avanzado  
**Duración**: 4-6 semanas  

Diseña e implementa una plataforma de comercio electrónico basada en microservicios:  
- Múltiples servicios API (catálogo, pedidos, pagos, usuarios)  
- Integración de colas de mensajes con Service Bus  
- Caché Redis para optimización de rendimiento  
- Registro y monitoreo completos  

**Entregables**:  
- Arquitectura completa de microservicios  
- Patrones de comunicación entre servicios  
- Pruebas de rendimiento y optimización  
- Implementación de seguridad lista para producción  

## Evaluación y Certificación  

### Verificaciones de Conocimiento  

Completa estas evaluaciones después de cada módulo:  

**Evaluación del Módulo 1**: Conceptos básicos e instalación  
- Preguntas de opción múltiple sobre conceptos clave  
- Tareas prácticas de instalación y configuración  
- Ejercicio simple de despliegue  

**Evaluación del Módulo 2**: Configuración y entornos  
- Escenarios de gestión de entornos  
- Ejercicios de resolución de problemas de configuración  
- Implementación de configuración de seguridad  

**Evaluación del Módulo 3**: Despliegue y aprovisionamiento  
- Desafíos de diseño de infraestructura  
- Escenarios de despliegue de múltiples servicios  
- Ejercicios de optimización de rendimiento  

**Evaluación del Módulo 4**: Validación previa al despliegue  
- Estudios de caso de planificación de capacidad  
- Escenarios de optimización de costos  
- Implementación de pipelines de validación  

**Evaluación del Módulo 5**: Resolución de problemas y depuración  
- Ejercicios de diagnóstico de problemas  
- Tareas de implementación de monitoreo  
- Simulaciones de respuesta ante incidentes  

**Evaluación del Módulo 6**: Temas avanzados  
- Diseño de pipelines CI/CD  
- Desarrollo de plantillas personalizadas  
- Escenarios de arquitectura empresarial  

### Proyecto Final  

Diseña e implementa una solución completa que demuestre dominio de todos los conceptos:  

**Requisitos**:  
- Arquitectura de aplicación de múltiples niveles  
- Múltiples entornos de despliegue  
- Monitoreo y alertas completas  
- Implementación de seguridad y cumplimiento  
- Optimización de costos y rendimiento  
- Documentación completa y manuales de operación  

**Criterios de Evaluación**:  
- Calidad técnica de la implementación  
- Completitud de la documentación  
- Adherencia a seguridad y mejores prácticas  
- Optimización de rendimiento y costos  
- Efectividad en resolución de problemas y monitoreo  

## Recursos de Estudio y Referencias  

### Documentación Oficial  
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Documentación de Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centro de Arquitectura de Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Recursos Comunitarios  
- [Galería de Plantillas AZD](https://azure.github.io/awesome-azd/)  
- [Organización GitHub Azure-Samples](https://github.com/Azure-Samples)  
- [Repositorio GitHub de Azure Developer CLI](https://github.com/Azure/azure-dev)  

### Entornos de Práctica  
- [Cuenta Gratuita de Azure](https://azure.microsoft.com/free/)  
- [Nivel Gratuito de Azure DevOps](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Herramientas Adicionales  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Paquete de Extensiones de Herramientas de Azure](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Recomendaciones de Cronograma de Estudio  

### Estudio a Tiempo Completo (8 semanas)  
- **Semanas 1-2**: Módulos 1-2 (Introducción, Configuración)  
- **Semanas 3-4**: Módulos 3-4 (Despliegue, Validación previa al despliegue)  
- **Semanas 5-6**: Módulos 5-6 (Resolución de problemas, Temas avanzados)  
- **Semanas 7-8**: Proyectos prácticos y evaluación final  

### Estudio a Tiempo Parcial (16 semanas)  
- **Semanas 1-4**: Módulo 1 (Introducción)  
- **Semanas 5-7**: Módulo 2 (Configuración y entornos)  
- **Semanas 8-10**: Módulo 3 (Despliegue y aprovisionamiento)  
- **Semanas 11-12**: Módulo 4 (Validación previa al despliegue)  
- **Semanas 13-14**: Módulo 5 (Resolución de problemas y depuración)  
- **Semanas 15-16**: Módulo 6 (Temas avanzados y evaluación)  

---

## Seguimiento del Progreso y Marco de Evaluación  

### Lista de Verificación de Finalización de Capítulos  

Rastrea tu progreso a través de cada capítulo con estos resultados medibles:  

#### 📚 Capítulo 1: Fundamentos y Inicio Rápido  
- [ ] **Instalación Completa**: AZD instalado y verificado en tu plataforma  
- [ ] **Primer Despliegue**: Desplegado exitosamente la plantilla todo-nodejs-mongo  
- [ ] **Configuración de Entorno**: Configuradas las primeras variables de entorno  
- [ ] **Navegación de Recursos**: Explorados recursos desplegados en el Portal de Azure  
- [ ] **Dominio de Comandos**: Familiaridad con comandos básicos de AZD  

#### 🤖 Capítulo 2: Desarrollo con IA  
- [ ] **Despliegue de Plantilla de IA**: Desplegado exitosamente azure-search-openai-demo  
- [ ] **Implementación de RAG**: Configurada indexación y recuperación de documentos  
- [ ] **Configuración de Modelos**: Configurados múltiples modelos de IA con diferentes propósitos  
- [ ] **Monitoreo de IA**: Implementado Application Insights para cargas de trabajo de IA  
- [ ] **Optimización de Rendimiento**: Ajustado el rendimiento de la aplicación de IA  

#### ⚙️ Capítulo 3: Configuración y Autenticación  
- [ ] **Configuración Multi-Entorno**: Configurados entornos de desarrollo, staging y producción  
- [ ] **Implementación de Seguridad**: Configurada autenticación con identidad administrada  
- [ ] **Gestión de Secretos**: Integrado Azure Key Vault para datos sensibles  
- [ ] **Gestión de Parámetros**: Creada configuración específica para cada entorno  
- [ ] **Dominio de Autenticación**: Implementados patrones de acceso seguro  

#### 🏗️ Capítulo 4: Infraestructura como Código y Despliegue  
- [ ] **Creación de Plantilla Personalizada**: Construida una plantilla de aplicación de múltiples servicios  
- [ ] **Dominio de Bicep**: Creados componentes de infraestructura modulares y reutilizables  
- [ ] **Automatización de Despliegue**: Implementados hooks de despliegue pre/post  
- [ ] **Diseño de Arquitectura**: Desplegada arquitectura compleja de microservicios  
- [ ] **Optimización de Plantillas**: Optimizadas plantillas para rendimiento y costos  

#### 🎯 Capítulo 5: Soluciones de IA Multi-Agente  
- [ ] **Despliegue de Solución de Retail**: Desplegado escenario completo de retail con múltiples agentes  
- [ ] **Personalización de Agentes**: Modificados comportamientos de agentes de Cliente e Inventario  
- [ ] **Escalado de Arquitectura**: Implementado balanceo de carga y autoescalado  
- [ ] **Monitoreo en Producción**: Configurado monitoreo y alertas completas  
- [ ] **Ajuste de Rendimiento**: Optimizado el rendimiento del sistema multi-agente  

#### 🔍 Capítulo 6: Validación Previa al Despliegue y Planificación  
- [ ] **Análisis de Capacidad**: Analizados requisitos de recursos para aplicaciones  
- [ ] **Optimización de SKU**: Seleccionados niveles de servicio rentables  
- [ ] **Automatización de Validación**: Implementados scripts de verificación previa al despliegue  
- [ ] **Planificación de Costos**: Creado estimaciones de costos y presupuestos de despliegue  
- [ ] **Evaluación de Riesgos**: Identificados y mitigados riesgos de despliegue  

#### 🚨 Capítulo 7: Resolución de Problemas y Depuración  
- [ ] **Habilidades de Diagnóstico**: Depurados despliegues intencionalmente defectuosos  
- [ ] **Análisis de Registros**: Utilizado Azure Monitor y Application Insights de manera efectiva  
- [ ] **Ajuste de Rendimiento**: Optimizado aplicaciones de bajo rendimiento  
- [ ] **Procedimientos de Recuperación**: Implementados copias de seguridad y recuperación ante desastres  
- [ ] **Configuración de Monitoreo**: Creado monitoreo proactivo y alertas  

#### 🏢 Capítulo 8: Patrones de Producción y Empresariales  
- [ ] **Seguridad Empresarial**: Implementados patrones de seguridad completos  
- [ ] **Marco de Gobernanza**: Configurado Azure Policy y gestión de recursos  
- [ ] **Monitoreo Avanzado**: Creado tableros y alertas automatizadas  
- [ ] **Integración de CI/CD**: Construidos pipelines de despliegue automatizados  
- [ ] **Implementación de Cumplimiento**: Cumplidos requisitos de cumplimiento empresarial  

### Cronograma de Aprendizaje y Hitos  

#### Semana 1-2: Construcción de Fundamentos  
- **Hito**: Desplegar primera aplicación de IA usando AZD  
- **Validación**: Aplicación funcional accesible vía URL pública  
- **Habilidades**: Flujos básicos de AZD e integración de servicios de IA  

#### Semana 3-4: Dominio de Configuración  
- **Hito**: Despliegue multi-entorno con autenticación segura  
- **Validación**: Misma aplicación desplegada en dev/staging/prod  
- **Habilidades**: Gestión de entornos e implementación de seguridad  

#### Semana 5-6: Experiencia en Infraestructura  
- **Hito**: Plantilla personalizada para aplicación compleja de múltiples servicios  
- **Validación**: Plantilla reutilizable desplegada por otro miembro del equipo  
- **Habilidades**: Dominio de Bicep y automatización de infraestructura  

#### Semana 7-8: Implementación Avanzada de IA  
- **Hito**: Solución de IA multi-agente lista para producción  
- **Validación**: Sistema manejando carga real con monitoreo  
- **Habilidades**: Orquestación multi-agente y optimización de rendimiento  

#### Semana 9-10: Preparación para Producción  
- **Hito**: Despliegue de nivel empresarial con cumplimiento completo  
- **Validación**: Supera revisión de seguridad y auditoría de optimización de costos  
- **Habilidades**: Gobernanza, monitoreo e integración de CI/CD  

### Evaluación y Certificación  

#### Métodos de Validación de Conocimiento  
1. **Despliegues Prácticos**: Aplicaciones funcionales para cada capítulo  
2. **Revisiones de Código**: Evaluación de calidad de plantillas y configuraciones  
3. **Resolución de Problemas**: Escenarios de resolución de problemas y soluciones  
4. **Enseñanza entre Pares**: Explicación de conceptos a otros estudiantes  
5. **Contribución Comunitaria**: Compartir plantillas o mejoras  

#### Resultados de Desarrollo Profesional  
- **Proyectos de Portafolio**: 8 despliegues listos para producción  
- **Habilidades Técnicas**: Experiencia estándar de la industria en despliegues de AZD e IA  
- **Habilidades de Resolución de Problemas**: Resolución independiente de problemas y optimización  
- **Reconocimiento Comunitario**: Participación activa en la comunidad de desarrolladores de Azure  
- **Avance Profesional**: Habilidades directamente aplicables a roles en la nube e IA  

#### Métricas de Éxito  
- **Tasa de Éxito en Despliegues**: >95% de despliegues exitosos  
- **Tiempo de Resolución de Problemas**: <30 minutos para problemas comunes  
- **Optimización de Rendimiento**: Mejoras demostrables en costos y rendimiento  
- **Cumplimiento de Seguridad**: Todos los despliegues cumplen estándares de seguridad empresarial  
- **Transferencia de Conocimiento**: Capacidad para mentorizar a otros desarrolladores  

### Aprendizaje Continuo y Participación Comunitaria  

#### Mantente Actualizado  
- **Actualizaciones de Azure**: Sigue las notas de lanzamiento de Azure Developer CLI  
- **Eventos Comunitarios**: Participa en eventos de desarrolladores de Azure e IA  
- **Documentación**: Contribuye a la documentación y ejemplos de la comunidad  
- **Bucle de Retroalimentación**: Proporciona comentarios sobre el contenido del curso y los servicios de Azure  

#### Desarrollo Profesional  
- **Red Profesional**: Conéctate con expertos en Azure y AI  
- **Oportunidades para Hablar**: Presenta tus aprendizajes en conferencias o encuentros  
- **Contribución a Código Abierto**: Contribuye a las plantillas y herramientas de AZD  
- **Mentoría**: Guía a otros desarrolladores en su aprendizaje de AZD  

---

**Navegación por Capítulos:**  
- **📚 Inicio del Curso**: [AZD Para Principiantes](../README.md)  
- **📖 Comienza a Aprender**: [Capítulo 1: Fundamentos y Inicio Rápido](../README.md#-chapter-1-foundation--quick-start)  
- **🎯 Seguimiento del Progreso**: Rastrea tu avance a través del sistema de aprendizaje completo de 8 capítulos  
- **🤝 Comunidad**: [Azure Discord](https://discord.gg/microsoft-azure) para soporte y discusión  

**Seguimiento del Progreso de Estudio**: Utiliza esta guía estructurada para dominar Azure Developer CLI mediante un aprendizaje progresivo y práctico con resultados medibles y beneficios para el desarrollo profesional.  

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "02c0d6833f050997d358015c9d6b71d9",
  "translation_date": "2025-11-19T20:22:56+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "es"
}
-->
# Guía de Estudio - Objetivos de Aprendizaje Completo

**Navegación del Camino de Aprendizaje**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../README.md)
- **📖 Comienza a Aprender**: [Capítulo 1: Fundamentos y Inicio Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Seguimiento del Progreso**: [Finalización del Curso](../README.md#-course-completion--certification)

## Introducción

Esta guía de estudio completa proporciona objetivos de aprendizaje estructurados, conceptos clave, ejercicios prácticos y materiales de evaluación para ayudarte a dominar Azure Developer CLI (azd). Utiliza esta guía para seguir tu progreso y asegurarte de que has cubierto todos los temas esenciales.

## Metas de Aprendizaje

Al completar esta guía de estudio, podrás:
- Dominar todos los conceptos fundamentales y avanzados de Azure Developer CLI
- Desarrollar habilidades prácticas en el despliegue y gestión de aplicaciones en Azure
- Ganar confianza en la resolución de problemas y optimización de despliegues
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
- Instalar y configurar AZD exitosamente en tu plataforma de desarrollo
- Desplegar tu primera aplicación utilizando una plantilla existente
- Navegar eficazmente por la interfaz de línea de comandos de AZD

#### Conceptos Clave para Dominar
- Estructura y componentes del proyecto AZD (azure.yaml, infra/, src/)
- Flujos de trabajo de despliegue basados en plantillas
- Fundamentos de configuración de entornos
- Gestión de grupos de recursos y suscripciones

#### Ejercicios Prácticos
1. **Verificación de Instalación**: Instalar AZD y verificar con `azd version`
2. **Primer Despliegue**: Desplegar exitosamente la plantilla todo-nodejs-mongo
3. **Configuración de Entorno**: Configurar tus primeras variables de entorno
4. **Exploración de Recursos**: Navegar por los recursos desplegados en el Portal de Azure

#### Preguntas de Evaluación
- ¿Cuáles son los componentes principales de un proyecto AZD?
- ¿Cómo inicializas un nuevo proyecto desde una plantilla?
- ¿Cuál es la diferencia entre `azd up` y `azd deploy`?
- ¿Cómo gestionas múltiples entornos con AZD?

---

### Capítulo 2: Desarrollo con IA Primero (Semana 2)
**Duración**: 1-2 horas | **Complejidad**: ⭐⭐

#### Objetivos de Aprendizaje
- Integrar servicios de Microsoft Foundry con flujos de trabajo de AZD
- Desplegar y configurar aplicaciones impulsadas por IA
- Comprender patrones de implementación RAG (Generación Aumentada por Recuperación)
- Gestionar despliegues de modelos de IA y escalabilidad

#### Conceptos Clave para Dominar
- Integración del servicio Azure OpenAI y gestión de API
- Configuración de búsqueda con IA e indexación vectorial
- Estrategias de despliegue de modelos y planificación de capacidad
- Monitoreo de aplicaciones de IA y optimización de rendimiento

#### Ejercicios Prácticos
1. **Despliegue de Chat con IA**: Desplegar la plantilla azure-search-openai-demo
2. **Implementación RAG**: Configurar indexación y recuperación de documentos
3. **Configuración de Modelos**: Configurar múltiples modelos de IA con diferentes propósitos
4. **Monitoreo de IA**: Implementar Application Insights para cargas de trabajo de IA

#### Preguntas de Evaluación
- ¿Cómo configuras servicios Azure OpenAI en una plantilla AZD?
- ¿Cuáles son los componentes clave de una arquitectura RAG?
- ¿Cómo gestionas la capacidad y escalabilidad de modelos de IA?
- ¿Qué métricas de monitoreo son importantes para aplicaciones de IA?

---

### Capítulo 3: Configuración y Autenticación (Semana 3)
**Duración**: 45-60 minutos | **Complejidad**: ⭐⭐

#### Objetivos de Aprendizaje
- Dominar estrategias de configuración y gestión de entornos
- Implementar patrones de autenticación segura e identidad administrada
- Organizar recursos con convenciones de nomenclatura adecuadas
- Configurar despliegues multi-entorno (desarrollo, pruebas, producción)

#### Conceptos Clave para Dominar
- Jerarquía de entornos y precedencia de configuración
- Autenticación con identidad administrada y principal de servicio
- Integración de Key Vault para gestión de secretos
- Gestión de parámetros específicos de entornos

#### Ejercicios Prácticos
1. **Configuración Multi-Entorno**: Configurar entornos de desarrollo, pruebas y producción
2. **Configuración de Seguridad**: Implementar autenticación con identidad administrada
3. **Gestión de Secretos**: Integrar Azure Key Vault para datos sensibles
4. **Gestión de Parámetros**: Crear configuraciones específicas de entornos

#### Preguntas de Evaluación
- ¿Cómo configuras diferentes entornos con AZD?
- ¿Cuáles son los beneficios de usar identidad administrada en lugar de principales de servicio?
- ¿Cómo gestionas de manera segura los secretos de aplicaciones?
- ¿Cuál es la jerarquía de configuración en AZD?

---

### Capítulo 4: Infraestructura como Código y Despliegue (Semana 4-5)
**Duración**: 1-1.5 horas | **Complejidad**: ⭐⭐⭐

#### Objetivos de Aprendizaje
- Crear y personalizar plantillas de infraestructura Bicep
- Implementar patrones avanzados de despliegue y flujos de trabajo
- Comprender estrategias de aprovisionamiento de recursos
- Diseñar arquitecturas escalables de múltiples servicios

- Desplegar aplicaciones en contenedores utilizando Azure Container Apps y AZD

#### Conceptos Clave para Dominar
- Estructura de plantillas Bicep y mejores prácticas
- Dependencias de recursos y orden de despliegue
- Archivos de parámetros y modularidad de plantillas
- Hooks personalizados y automatización de despliegue
- Patrones de despliegue de aplicaciones en contenedores (inicio rápido, producción, microservicios)

#### Ejercicios Prácticos
1. **Creación de Plantilla Personalizada**: Construir una plantilla de aplicación de múltiples servicios
2. **Dominio de Bicep**: Crear componentes de infraestructura modulares y reutilizables
3. **Automatización de Despliegue**: Implementar hooks pre/post despliegue
4. **Diseño de Arquitectura**: Desplegar una arquitectura compleja de microservicios
5. **Despliegue de Aplicaciones en Contenedores**: Desplegar los ejemplos [Simple Flask API](../../../examples/container-app/simple-flask-api) y [Microservices Architecture](../../../examples/container-app/microservices) utilizando AZD

#### Preguntas de Evaluación
- ¿Cómo creas plantillas Bicep personalizadas para AZD?
- ¿Cuáles son las mejores prácticas para organizar código de infraestructura?
- ¿Cómo manejas dependencias de recursos en plantillas?
- ¿Qué patrones de despliegue soportan actualizaciones sin tiempo de inactividad?

---

### Capítulo 5: Soluciones de IA Multi-Agente (Semana 6-7)
**Duración**: 2-3 horas | **Complejidad**: ⭐⭐⭐⭐

#### Objetivos de Aprendizaje
- Diseñar e implementar arquitecturas de IA multi-agente
- Orquestar la coordinación y comunicación entre agentes
- Desplegar soluciones de IA listas para producción con monitoreo
- Comprender la especialización de agentes y patrones de flujo de trabajo
- Integrar microservicios en contenedores como parte de soluciones multi-agente

#### Conceptos Clave para Dominar
- Patrones de arquitectura multi-agente y principios de diseño
- Protocolos de comunicación entre agentes y flujo de datos
- Estrategias de balanceo de carga y escalabilidad para agentes de IA
- Monitoreo de producción para sistemas multi-agente
- Comunicación entre servicios en entornos de contenedores

#### Ejercicios Prácticos
1. **Despliegue de Solución Minorista**: Desplegar el escenario completo de minorista multi-agente
2. **Personalización de Agentes**: Modificar comportamientos de los agentes de Cliente e Inventario
3. **Escalabilidad de Arquitectura**: Implementar balanceo de carga y autoescalado
4. **Monitoreo de Producción**: Configurar monitoreo y alertas completas
5. **Integración de Microservicios**: Extender el ejemplo [Microservices Architecture](../../../examples/container-app/microservices) para soportar flujos de trabajo basados en agentes

#### Preguntas de Evaluación
- ¿Cómo diseñas patrones efectivos de comunicación entre agentes?
- ¿Cuáles son las consideraciones clave para escalar cargas de trabajo de agentes de IA?
- ¿Cómo monitoreas y depuras sistemas de IA multi-agente?
- ¿Qué patrones de producción aseguran la confiabilidad de los agentes de IA?

---

### Capítulo 6: Validación y Planificación Pre-Despliegue (Semana 8)
**Duración**: 1 hora | **Complejidad**: ⭐⭐

#### Objetivos de Aprendizaje
- Realizar planificación de capacidad y validación de recursos de manera integral
- Seleccionar los SKUs óptimos de Azure para rentabilidad
- Implementar verificaciones automáticas previas al despliegue y validación
- Planificar despliegues con estrategias de optimización de costos

#### Conceptos Clave para Dominar
- Cuotas de recursos de Azure y limitaciones de capacidad
- Criterios de selección de SKUs y optimización de costos
- Scripts de validación automatizados y pruebas
- Planificación de despliegue y evaluación de riesgos

#### Ejercicios Prácticos
1. **Análisis de Capacidad**: Analizar los requisitos de recursos para tus aplicaciones
2. **Optimización de SKUs**: Comparar y seleccionar niveles de servicio rentables
3. **Automatización de Validación**: Implementar scripts de verificación previa al despliegue
4. **Planificación de Costos**: Crear estimaciones de costos y presupuestos de despliegue

#### Preguntas de Evaluación
- ¿Cómo validas la capacidad de Azure antes del despliegue?
- ¿Qué factores influyen en las decisiones de selección de SKUs?
- ¿Cómo automatizas la validación previa al despliegue?
- ¿Qué estrategias ayudan a optimizar los costos de despliegue?

---

### Capítulo 7: Resolución de Problemas y Depuración (Semana 9)
**Duración**: 1-1.5 horas | **Complejidad**: ⭐⭐

#### Objetivos de Aprendizaje
- Desarrollar enfoques sistemáticos de depuración para despliegues de AZD
- Resolver problemas comunes de despliegue y configuración
- Depurar problemas específicos de IA y de rendimiento
- Implementar monitoreo y alertas para detección proactiva de problemas

#### Conceptos Clave para Dominar
- Técnicas de diagnóstico y estrategias de registro
- Patrones comunes de fallos y sus soluciones
- Monitoreo de rendimiento y optimización
- Procedimientos de respuesta a incidentes y recuperación

#### Ejercicios Prácticos
1. **Habilidades de Diagnóstico**: Practicar con despliegues intencionalmente defectuosos
2. **Análisis de Registros**: Utilizar Azure Monitor y Application Insights eficazmente
3. **Optimización de Rendimiento**: Mejorar aplicaciones con bajo rendimiento
4. **Procedimientos de Recuperación**: Implementar copias de seguridad y recuperación ante desastres

#### Preguntas de Evaluación
- ¿Cuáles son los fallos de despliegue más comunes en AZD?
- ¿Cómo depuras problemas de autenticación y permisos?
- ¿Qué estrategias de monitoreo ayudan a prevenir problemas en producción?
- ¿Cómo optimizas el rendimiento de aplicaciones en Azure?

---

### Capítulo 8: Patrones de Producción y Empresariales (Semana 10-11)
**Duración**: 2-3 horas | **Complejidad**: ⭐⭐⭐⭐

#### Objetivos de Aprendizaje
- Implementar estrategias de despliegue de nivel empresarial
- Diseñar patrones de seguridad y marcos de cumplimiento
- Establecer monitoreo, gobernanza y gestión de costos
- Crear pipelines escalables de CI/CD con integración AZD
- Aplicar mejores prácticas para despliegues de aplicaciones en contenedores en producción (seguridad, monitoreo, costos, CI/CD)

#### Conceptos Clave para Dominar
- Requisitos de seguridad y cumplimiento empresarial
- Marcos de gobernanza e implementación de políticas
- Monitoreo avanzado y gestión de costos
- Integración de CI/CD y pipelines de despliegue automatizados
- Estrategias de despliegue blue-green y canary para cargas de trabajo en contenedores

#### Ejercicios Prácticos
1. **Seguridad Empresarial**: Implementar patrones de seguridad completos
2. **Marco de Gobernanza**: Configurar Azure Policy y gestión de recursos
3. **Monitoreo Avanzado**: Crear paneles y alertas automatizadas
4. **Integración de CI/CD**: Construir pipelines de despliegue automatizados
5. **Aplicaciones en Contenedores en Producción**: Aplicar seguridad, monitoreo y optimización de costos al ejemplo [Microservices Architecture](../../../examples/container-app/microservices)

#### Preguntas de Evaluación
- ¿Cómo implementas seguridad empresarial en despliegues de AZD?
- ¿Qué patrones de gobernanza aseguran cumplimiento y control de costos?
- ¿Cómo diseñas monitoreo escalable para sistemas en producción?
- ¿Qué patrones de CI/CD funcionan mejor con flujos de trabajo de AZD?

#### Objetivos de Aprendizaje
- Comprender los fundamentos y conceptos clave de Azure Developer CLI
- Instalar y configurar azd exitosamente en tu entorno de desarrollo
- Completar tu primer despliegue utilizando una plantilla existente
- Navegar por la estructura del proyecto azd y comprender los componentes clave

#### Conceptos Clave para Dominar
- Plantillas, entornos y servicios
- Estructura de configuración azure.yaml
- Comandos básicos de azd (init, up, down, deploy)
- Principios de Infraestructura como Código
- Autenticación y autorización en Azure

#### Ejercicios Prácticos

**Ejercicio 1.1: Instalación y Configuración**
```bash
# Completa estas tareas:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Ejercicio 1.2: Primer Despliegue**
```bash
# Implementar una aplicación web simple:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Ejercicio 1.3: Análisis de Estructura del Proyecto**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Preguntas de Autoevaluación
1. ¿Cuáles son los tres conceptos principales de la arquitectura azd?
2. ¿Cuál es el propósito del archivo azure.yaml?
3. ¿Cómo ayudan los entornos a gestionar diferentes objetivos de despliegue?
4. ¿Qué métodos de autenticación se pueden usar con azd?
5. ¿Qué sucede cuando ejecutas `azd up` por primera vez?

---

## Seguimiento del Progreso y Marco de Evaluación
```bash
# Crear y configurar múltiples entornos:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Ejercicio 2.2: Configuración Avanzada**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Ejercicio 2.3: Configuración de Seguridad**
```bash
# Implementar las mejores prácticas de seguridad:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Preguntas de Autoevaluación
1. ¿Cómo maneja azd la precedencia de variables de entorno?
2. ¿Qué son los hooks de despliegue y cuándo deberías usarlos?
3. ¿Cómo configuras diferentes SKUs para diferentes entornos?
4. ¿Cuáles son las implicaciones de seguridad de los diferentes métodos de autenticación?
5. ¿Cómo gestionas secretos y datos de configuración sensibles?

### Módulo 3: Despliegue y Aprovisionamiento (Semana 4)

#### Objetivos de Aprendizaje
- Dominar flujos de trabajo de despliegue y mejores prácticas
- Comprender Infraestructura como Código con plantillas Bicep
- Implementar arquitecturas complejas de múltiples servicios
- Optimizar el rendimiento y la confiabilidad del despliegue

#### Conceptos Clave para Dominar
- Estructura de plantillas Bicep y módulos
- Dependencias de recursos y ordenamiento
- Estrategias de despliegue (blue-green, actualizaciones progresivas)
- Despliegues multi-región
- Migraciones de bases de datos y gestión de datos

#### Ejercicios Prácticos

**Ejercicio 3.1: Infraestructura Personalizada**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Ejercicio 3.2: Aplicación Multi-Servicio**
```bash
# Implementar una arquitectura de microservicios:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Ejercicio 3.3: Integración de Bases de Datos**
```bash
# Implementar patrones de implementación de bases de datos:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Preguntas de Autoevaluación
1. ¿Cuáles son las ventajas de usar Bicep sobre plantillas ARM?
2. ¿Cómo manejas migraciones de bases de datos en despliegues azd?
3. ¿Qué estrategias existen para despliegues sin tiempo de inactividad?
4. ¿Cómo gestionas dependencias entre servicios?
5. ¿Cuáles son las consideraciones para implementaciones en múltiples regiones?

### Módulo 4: Validación previa al despliegue (Semana 5)

#### Objetivos de aprendizaje
- Implementar verificaciones completas antes del despliegue
- Dominar la planificación de capacidad y validación de recursos
- Comprender la selección de SKU y la optimización de costos
- Construir pipelines de validación automatizados

#### Conceptos clave para dominar
- Cuotas y límites de recursos de Azure
- Criterios de selección de SKU e implicaciones de costos
- Scripts y herramientas de validación automatizada
- Metodologías de planificación de capacidad
- Pruebas de rendimiento y optimización

#### Ejercicios prácticos

**Ejercicio 4.1: Planificación de capacidad**
```bash
# Implementar la validación de capacidad:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Ejercicio 4.2: Validación previa al despliegue**
```powershell
# Construir una canalización de validación integral:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Ejercicio 4.3: Optimización de SKU**
```bash
# Optimizar configuraciones de servicio:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Preguntas de autoevaluación
1. ¿Qué factores deben influir en las decisiones de selección de SKU?
2. ¿Cómo validas la disponibilidad de recursos de Azure antes del despliegue?
3. ¿Cuáles son los componentes clave de un sistema de verificación previa al despliegue?
4. ¿Cómo estimas y controlas los costos de despliegue?
5. ¿Qué monitoreo es esencial para la planificación de capacidad?

### Módulo 5: Resolución de problemas y depuración (Semana 6)

#### Objetivos de aprendizaje
- Dominar metodologías sistemáticas de resolución de problemas
- Desarrollar experiencia en la depuración de problemas complejos de despliegue
- Implementar monitoreo y alertas completas
- Construir procedimientos de respuesta y recuperación ante incidentes

#### Conceptos clave para dominar
- Patrones comunes de fallos en despliegues
- Técnicas de análisis y correlación de registros
- Monitoreo y optimización del rendimiento
- Detección y respuesta ante incidentes de seguridad
- Recuperación ante desastres y continuidad del negocio

#### Ejercicios prácticos

**Ejercicio 5.1: Escenarios de resolución de problemas**
```bash
# Practicar la resolución de problemas comunes:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Ejercicio 5.2: Implementación de monitoreo**
```bash
# Configurar monitoreo integral:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Ejercicio 5.3: Respuesta ante incidentes**
```bash
# Crear procedimientos de respuesta a incidentes:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Preguntas de autoevaluación
1. ¿Cuál es el enfoque sistemático para resolver problemas en despliegues azd?
2. ¿Cómo correlacionas registros entre múltiples servicios y recursos?
3. ¿Qué métricas de monitoreo son más críticas para la detección temprana de problemas?
4. ¿Cómo implementas procedimientos efectivos de recuperación ante desastres?
5. ¿Cuáles son los componentes clave de un plan de respuesta ante incidentes?

### Módulo 6: Temas avanzados y mejores prácticas (Semana 7-8)

#### Objetivos de aprendizaje
- Implementar patrones de despliegue de nivel empresarial
- Dominar la integración y automatización de CI/CD
- Desarrollar plantillas personalizadas y contribuir a la comunidad
- Comprender requisitos avanzados de seguridad y cumplimiento

#### Conceptos clave para dominar
- Patrones de integración de pipelines CI/CD
- Desarrollo y distribución de plantillas personalizadas
- Gobernanza empresarial y cumplimiento
- Configuraciones avanzadas de redes y seguridad
- Optimización del rendimiento y gestión de costos

#### Ejercicios prácticos

**Ejercicio 6.1: Integración de CI/CD**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Ejercicio 6.2: Desarrollo de plantillas personalizadas**
```bash
# Crear y publicar plantillas personalizadas:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Ejercicio 6.3: Implementación empresarial**
```bash
# Implementar características de nivel empresarial:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Preguntas de autoevaluación
1. ¿Cómo integras azd en flujos de trabajo CI/CD existentes?
2. ¿Cuáles son las consideraciones clave para el desarrollo de plantillas personalizadas?
3. ¿Cómo implementas gobernanza y cumplimiento en despliegues azd?
4. ¿Cuáles son las mejores prácticas para despliegues a escala empresarial?
5. ¿Cómo contribuyes eficazmente a la comunidad azd?

## Proyectos prácticos

### Proyecto 1: Sitio web de portafolio personal
**Complejidad**: Principiante  
**Duración**: 1-2 semanas

Construye y despliega un sitio web de portafolio personal utilizando:
- Hosting de sitio web estático en Azure Storage
- Configuración de dominio personalizado
- Integración de CDN para rendimiento global
- Pipeline de despliegue automatizado

**Entregables**:
- Sitio web funcional desplegado en Azure
- Plantilla personalizada azd para despliegues de portafolio
- Documentación del proceso de despliegue
- Recomendaciones de análisis y optimización de costos

### Proyecto 2: Aplicación de gestión de tareas
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

### Proyecto 3: Plataforma de comercio electrónico basada en microservicios
**Complejidad**: Avanzado  
**Duración**: 4-6 semanas

Diseña e implementa una plataforma de comercio electrónico basada en microservicios:
- Múltiples servicios API (catálogo, pedidos, pagos, usuarios)
- Integración de colas de mensajes con Service Bus
- Caché Redis para optimización de rendimiento
- Registro y monitoreo completos

**Ejemplo de referencia**: Consulta [Arquitectura de Microservicios](../../../examples/container-app/microservices) para una plantilla lista para producción y guía de despliegue

**Entregables**:
- Arquitectura completa de microservicios
- Patrones de comunicación entre servicios
- Pruebas de rendimiento y optimización
- Implementación de seguridad lista para producción

## Evaluación y certificación

### Verificaciones de conocimiento

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

### Proyecto final de cierre

Diseña e implementa una solución completa que demuestre dominio de todos los conceptos:

**Requisitos**:
- Arquitectura de aplicación multinivel
- Múltiples entornos de despliegue
- Monitoreo y alertas completas
- Implementación de seguridad y cumplimiento
- Optimización de costos y ajuste de rendimiento
- Documentación completa y manuales de operación

**Criterios de evaluación**:
- Calidad técnica de la implementación
- Completitud de la documentación
- Adherencia a seguridad y mejores prácticas
- Optimización de rendimiento y costos
- Efectividad en resolución de problemas y monitoreo

## Recursos de estudio y referencias

### Documentación oficial
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Documentación de Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centro de Arquitectura de Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Recursos comunitarios
- [Galería de plantillas AZD](https://azure.github.io/awesome-azd/)
- [Organización GitHub Azure-Samples](https://github.com/Azure-Samples)
- [Repositorio GitHub de Azure Developer CLI](https://github.com/Azure/azure-dev)

### Entornos de práctica
- [Cuenta gratuita de Azure](https://azure.microsoft.com/free/)
- [Nivel gratuito de Azure DevOps](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Herramientas adicionales
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Paquete de extensiones de herramientas de Azure](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Recomendaciones de cronograma de estudio

### Estudio a tiempo completo (8 semanas)
- **Semanas 1-2**: Módulos 1-2 (Introducción, Configuración)
- **Semanas 3-4**: Módulos 3-4 (Despliegue, Validación previa al despliegue)
- **Semanas 5-6**: Módulos 5-6 (Resolución de problemas, Temas avanzados)
- **Semanas 7-8**: Proyectos prácticos y evaluación final

### Estudio a tiempo parcial (16 semanas)
- **Semanas 1-4**: Módulo 1 (Introducción)
- **Semanas 5-7**: Módulo 2 (Configuración y entornos)
- **Semanas 8-10**: Módulo 3 (Despliegue y aprovisionamiento)
- **Semanas 11-12**: Módulo 4 (Validación previa al despliegue)
- **Semanas 13-14**: Módulo 5 (Resolución de problemas y depuración)
- **Semanas 15-16**: Módulo 6 (Temas avanzados y evaluación)

---

## Seguimiento de progreso y marco de evaluación

### Lista de verificación de finalización de capítulos

Sigue tu progreso a través de cada capítulo con estos resultados medibles:

#### 📚 Capítulo 1: Fundamentos y inicio rápido
- [ ] **Instalación completa**: AZD instalado y verificado en tu plataforma
- [ ] **Primer despliegue**: Plantilla todo-nodejs-mongo desplegada exitosamente
- [ ] **Configuración de entorno**: Variables de entorno configuradas por primera vez
- [ ] **Navegación de recursos**: Recursos desplegados explorados en el portal de Azure
- [ ] **Dominio de comandos**: Familiaridad con comandos básicos de AZD

#### 🤖 Capítulo 2: Desarrollo con enfoque en IA  
- [ ] **Despliegue de plantilla de IA**: Plantilla azure-search-openai-demo desplegada exitosamente
- [ ] **Implementación RAG**: Indexación y recuperación de documentos configuradas
- [ ] **Configuración de modelos**: Múltiples modelos de IA configurados con diferentes propósitos
- [ ] **Monitoreo de IA**: Application Insights implementado para cargas de trabajo de IA
- [ ] **Optimización de rendimiento**: Rendimiento de la aplicación de IA ajustado

#### ⚙️ Capítulo 3: Configuración y autenticación
- [ ] **Configuración de múltiples entornos**: Entornos dev, staging y prod configurados
- [ ] **Implementación de seguridad**: Autenticación de identidad administrada configurada
- [ ] **Gestión de secretos**: Azure Key Vault integrado para datos sensibles
- [ ] **Gestión de parámetros**: Configuraciones específicas de entorno creadas
- [ ] **Dominio de autenticación**: Patrones de acceso seguro implementados

#### 🏗️ Capítulo 4: Infraestructura como código y despliegue
- [ ] **Creación de plantillas personalizadas**: Plantilla de aplicación de múltiples servicios creada
- [ ] **Dominio de Bicep**: Componentes de infraestructura modulares y reutilizables creados
- [ ] **Automatización de despliegue**: Hooks de despliegue pre/post implementados
- [ ] **Diseño de arquitectura**: Arquitectura compleja de microservicios desplegada
- [ ] **Optimización de plantillas**: Plantillas optimizadas para rendimiento y costos

#### 🎯 Capítulo 5: Soluciones de IA con múltiples agentes
- [ ] **Despliegue de solución minorista**: Escenario minorista completo con múltiples agentes desplegado
- [ ] **Personalización de agentes**: Comportamientos de agentes de cliente e inventario modificados
- [ ] **Escalamiento de arquitectura**: Balanceo de carga y autoescalado implementados
- [ ] **Monitoreo en producción**: Monitoreo y alertas completas configuradas
- [ ] **Ajuste de rendimiento**: Sistema de múltiples agentes optimizado

#### 🔍 Capítulo 6: Validación previa al despliegue y planificación
- [ ] **Análisis de capacidad**: Requisitos de recursos para aplicaciones analizados
- [ ] **Optimización de SKU**: Niveles de servicio rentables seleccionados
- [ ] **Automatización de validación**: Scripts de verificación previa al despliegue implementados
- [ ] **Planificación de costos**: Estimaciones de costos de despliegue y presupuestos creados
- [ ] **Evaluación de riesgos**: Riesgos de despliegue identificados y mitigados

#### 🚨 Capítulo 7: Resolución de problemas y depuración
- [ ] **Habilidades de diagnóstico**: Despliegues intencionalmente rotos depurados exitosamente
- [ ] **Análisis de registros**: Azure Monitor y Application Insights utilizados eficazmente
- [ ] **Ajuste de rendimiento**: Aplicaciones de bajo rendimiento optimizadas
- [ ] **Procedimientos de recuperación**: Respaldo y recuperación ante desastres implementados
- [ ] **Configuración de monitoreo**: Monitoreo proactivo y alertas creados

#### 🏢 Capítulo 8: Patrones de producción y empresariales
- [ ] **Seguridad empresarial**: Patrones de seguridad completos implementados
- [ ] **Marco de gobernanza**: Azure Policy y gestión de recursos configurados
- [ ] **Monitoreo avanzado**: Tableros y alertas automatizadas creados
- [ ] **Integración de CI/CD**: Pipelines de despliegue automatizados construidos
- [ ] **Implementación de cumplimiento**: Requisitos de cumplimiento empresarial cumplidos

### Cronograma de aprendizaje y hitos

#### Semana 1-2: Construcción de fundamentos
- **Hito**: Desplegar primera aplicación de IA usando AZD
- **Validación**: Aplicación funcional accesible vía URL pública
- **Habilidades**: Flujos de trabajo básicos de AZD e integración de servicios de IA

#### Semana 3-4: Dominio de configuración
- **Hito**: Despliegue en múltiples entornos con autenticación segura
- **Validación**: Misma aplicación desplegada en dev/staging/prod
- **Habilidades**: Gestión de entornos e implementación de seguridad

#### Semana 5-6: Experiencia en infraestructura
- **Hito**: Plantilla personalizada para aplicación compleja de múltiples servicios
- **Validación**: Plantilla reutilizable desplegada por otro miembro del equipo
- **Habilidades**: Dominio de Bicep y automatización de infraestructura

#### Semana 7-8: Implementación avanzada de IA
- **Hito**: Solución de IA con múltiples agentes lista para producción
- **Validación**: Sistema manejando carga real con monitoreo
- **Habilidades**: Orquestación de múltiples agentes y optimización de rendimiento

#### Semana 9-10: Preparación para producción
- **Hito**: Despliegue de nivel empresarial con cumplimiento completo
- **Validación**: Revisión de seguridad aprobada y auditoría de optimización de costos
- **Habilidades**: Gobernanza, monitoreo e integración de CI/CD

### Evaluación y certificación

#### Métodos de validación de conocimiento
1. **Despliegues prácticos**: Aplicaciones funcionales para cada capítulo
2. **Revisiones de código**: Evaluación de calidad de plantillas y configuraciones
3. **Resolución de problemas**: Escenarios de resolución de problemas y soluciones
4. **Enseñanza entre pares**: Explicar conceptos a otros estudiantes
5. **Contribución Comunitaria**: Comparte plantillas o mejoras

#### Resultados de Desarrollo Profesional
- **Proyectos de Portafolio**: 8 implementaciones listas para producción
- **Habilidades Técnicas**: Experiencia en despliegue de AZD y AI con estándares de la industria
- **Capacidades de Resolución de Problemas**: Solución de problemas y optimización de manera independiente
- **Reconocimiento Comunitario**: Participación activa en la comunidad de desarrolladores de Azure
- **Avance Profesional**: Habilidades directamente aplicables a roles en la nube y AI

#### Métricas de Éxito
- **Tasa de Éxito en Implementaciones**: >95% de implementaciones exitosas
- **Tiempo de Resolución de Problemas**: <30 minutos para problemas comunes
- **Optimización de Rendimiento**: Mejoras demostrables en costos y rendimiento
- **Cumplimiento de Seguridad**: Todas las implementaciones cumplen con estándares de seguridad empresarial
- **Transferencia de Conocimiento**: Capacidad para mentorizar a otros desarrolladores

### Aprendizaje Continuo y Participación Comunitaria

#### Mantente Actualizado
- **Actualizaciones de Azure**: Sigue las notas de lanzamiento de Azure Developer CLI
- **Eventos Comunitarios**: Participa en eventos de desarrolladores de Azure y AI
- **Documentación**: Contribuye a la documentación y ejemplos de la comunidad
- **Bucle de Retroalimentación**: Proporciona comentarios sobre el contenido del curso y los servicios de Azure

#### Desarrollo Profesional
- **Red Profesional**: Conéctate con expertos en Azure y AI
- **Oportunidades de Presentación**: Presenta tus aprendizajes en conferencias o encuentros
- **Contribución a Código Abierto**: Contribuye a plantillas y herramientas de AZD
- **Mentoría**: Guía a otros desarrolladores en su aprendizaje de AZD

---

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../README.md)
- **📖 Comienza a Aprender**: [Capítulo 1: Fundamentos y Inicio Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Seguimiento del Progreso**: Rastrea tu avance a través del sistema de aprendizaje integral de 8 capítulos
- **🤝 Comunidad**: [Azure Discord](https://discord.gg/microsoft-azure) para soporte y discusión

**Seguimiento del Progreso de Estudio**: Utiliza esta guía estructurada para dominar Azure Developer CLI mediante un aprendizaje progresivo, práctico, con resultados medibles y beneficios para el desarrollo profesional.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
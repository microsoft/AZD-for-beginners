# Guía de Estudio - Objetivos de Aprendizaje Comprensivos

**Navegación del Camino de Aprendizaje**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../README.md)
- **📖 Comenzar a Aprender**: [Capítulo 1: Fundamentos y Inicio Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Seguimiento de Progreso**: [Finalización del Curso](../README.md#-course-completion--certification)

## Introducción

Esta guía de estudio comprensiva proporciona objetivos de aprendizaje estructurados, conceptos clave, ejercicios prácticos y materiales de evaluación para ayudarte a dominar Azure Developer CLI (azd). Usa esta guía para seguir tu progreso y asegurarte de haber cubierto todos los temas esenciales.

## Metas de Aprendizaje

Al completar esta guía de estudio, podrás:
- Dominar todos los conceptos fundamentales y avanzados de Azure Developer CLI
- Desarrollar habilidades prácticas en el despliegue y gestión de aplicaciones en Azure
- Construir confianza en la resolución de problemas y optimización de despliegues
- Entender prácticas de despliegue listas para producción y consideraciones de seguridad

## Resultados de Aprendizaje

Después de completar todas las secciones de esta guía de estudio, serás capaz de:
- Diseñar, desplegar y gestionar arquitecturas completas de aplicaciones usando azd
- Implementar estrategias comprensivas de monitoreo, seguridad y optimización de costos
- Solucionar problemas complejos de despliegue de forma independiente
- Crear plantillas personalizadas y contribuir a la comunidad azd

## Estructura de Aprendizaje de 8 Capítulos

### Capítulo 1: Fundamentos y Inicio Rápido (Semana 1)
**Duración**: 30-45 minutos | **Complejidad**: ⭐

#### Objetivos de Aprendizaje
- Entender los conceptos clave y terminología de Azure Developer CLI
- Instalar y configurar AZD exitosamente en tu plataforma de desarrollo
- Desplegar tu primera aplicación usando una plantilla existente
- Navegar efectivamente la interfaz de línea de comandos AZD

#### Conceptos Clave para Dominar
- Estructura y componentes del proyecto AZD (azure.yaml, infra/, src/)
- Flujos de trabajo de despliegue basados en plantillas
- Conceptos básicos de configuración de entorno
- Gestión de grupos de recursos y suscripciones

#### Ejercicios Prácticos
1. **Verificación de Instalación**: Instalar AZD y verificar con `azd version`
2. **Primer Despliegue**: Desplegar la plantilla todo-nodejs-mongo con éxito
3. **Configuración del Entorno**: Configurar tus primeras variables de entorno
4. **Exploración de Recursos**: Navegar recursos desplegados en Azure Portal

#### Preguntas de Evaluación
- ¿Cuáles son los componentes principales de un proyecto AZD?
- ¿Cómo inicializas un nuevo proyecto desde una plantilla?
- ¿Cuál es la diferencia entre `azd up` y `azd deploy`?
- ¿Cómo gestionas múltiples entornos con AZD?

---

### Capítulo 2: Desarrollo AI-First (Semana 2)
**Duración**: 1-2 horas | **Complejidad**: ⭐⭐

#### Objetivos de Aprendizaje
- Integrar servicios Microsoft Foundry con flujos de trabajo AZD
- Desplegar y configurar aplicaciones impulsadas por AI
- Entender patrones de implementación RAG (Generación Aumentada por Recuperación)
- Gestionar despliegues y escalabilidad de modelos AI

#### Conceptos Clave para Dominar
- Integración y gestión de APIs del servicio Microsoft Foundry Models
- Configuración de AI Search e indexación vectorial
- Estrategias de despliegue de modelos y planificación de capacidad
- Monitoreo y optimización del rendimiento de aplicaciones AI

#### Ejercicios Prácticos
1. **Despliegue de Chat AI**: Desplegar la plantilla azure-search-openai-demo
2. **Implementación RAG**: Configurar indexación y recuperación de documentos
3. **Configuración de Modelos**: Configurar múltiples modelos AI con diferentes propósitos
4. **Monitoreo AI**: Implementar Application Insights para cargas AI

#### Preguntas de Evaluación
- ¿Cómo configuras los servicios Microsoft Foundry Models en una plantilla AZD?
- ¿Cuáles son los componentes clave de una arquitectura RAG?
- ¿Cómo gestionas la capacidad y escalabilidad de modelos AI?
- ¿Qué métricas de monitoreo son importantes para aplicaciones AI?

---

### Capítulo 3: Configuración y Autenticación (Semana 3)
**Duración**: 45-60 minutos | **Complejidad**: ⭐⭐

#### Objetivos de Aprendizaje
- Dominar estrategias de configuración y gestión de entornos
- Implementar patrones seguros de autenticación e identidad gestionada
- Organizar recursos con convenciones adecuadas de nombres
- Configurar despliegues multi-entorno (desarrollo, pruebas, producción)

#### Conceptos Clave para Dominar
- Jerarquía de entornos y precedencia de configuración
- Identidad gestionada y autenticación con principal de servicio
- Integración con Key Vault para gestión de secretos
- Gestión de parámetros específicos por entorno

#### Ejercicios Prácticos
1. **Configuración Multi-Entorno**: Configurar entornos de dev, staging y prod
2. **Configuración de Seguridad**: Implementar autenticación con identidad gestionada
3. **Gestión de Secretos**: Integrar Azure Key Vault para datos sensibles
4. **Gestión de Parámetros**: Crear configuraciones específicas de entorno

#### Preguntas de Evaluación
- ¿Cómo configuras diferentes entornos con AZD?
- ¿Cuáles son los beneficios de usar identidad gestionada frente a principales de servicio?
- ¿Cómo gestionas de forma segura los secretos de aplicaciones?
- ¿Cuál es la jerarquía de configuración en AZD?

---

### Capítulo 4: Infraestructura como Código & Despliegue (Semanas 4-5)
**Duración**: 1-1.5 horas | **Complejidad**: ⭐⭐⭐

#### Objetivos de Aprendizaje
- Crear y personalizar plantillas de infraestructura Bicep
- Implementar patrones avanzados de despliegue y flujos de trabajo
- Entender estrategias de aprovisionamiento de recursos
- Diseñar arquitecturas escalables de múltiples servicios

- Desplegar aplicaciones contenerizadas usando Azure Container Apps y AZD


#### Conceptos Clave para Dominar
- Estructura de plantillas Bicep y mejores prácticas
- Dependencias de recursos y orden de despliegue
- Archivos de parámetros y modularidad de plantillas
- Hooks personalizados y automatización de despliegue
- Patrones de despliegue de aplicaciones contenerizadas (inicio rápido, producción, microservicios)

#### Ejercicios Prácticos
1. **Creación de Plantilla Personalizada**: Construir plantilla para aplicación multi-servicio
2. **Maestría en Bicep**: Crear componentes de infraestructura modulares y reutilizables
3. **Automatización de Despliegue**: Implementar hooks de pre/post-despliegue
4. **Diseño de Arquitectura**: Desplegar arquitectura compleja de microservicios
5. **Despliegue de Aplicación Contenerizada**: Desplegar los ejemplos [Simple Flask API](../../../examples/container-app/simple-flask-api) y [Arquitectura de Microservicios](../../../examples/container-app/microservices) usando AZD

#### Preguntas de Evaluación
- ¿Cómo creas plantillas Bicep personalizadas para AZD?
- ¿Cuáles son las mejores prácticas para organizar código de infraestructura?
- ¿Cómo manejas las dependencias de recursos en plantillas?
- ¿Qué patrones de despliegue soportan actualizaciones sin tiempo de inactividad?

---

### Capítulo 5: Soluciones AI Multi-Agente (Semanas 6-7)
**Duración**: 2-3 horas | **Complejidad**: ⭐⭐⭐⭐

#### Objetivos de Aprendizaje
- Diseñar e implementar arquitecturas AI multi-agente
- Orquestar coordinación y comunicación entre agentes
- Desplegar soluciones AI listas para producción con monitoreo
- Entender la especialización de agentes y patrones de flujo de trabajo
- Integrar microservicios contenerizados como parte de soluciones multi-agente

#### Conceptos Clave para Dominar
- Patrones de arquitectura multi-agente y principios de diseño
- Protocolos de comunicación de agentes y flujo de datos
- Estrategias de balanceo de carga y escalabilidad para agentes AI
- Monitoreo de producción para sistemas multi-agente
- Comunicación servicio a servicio en entornos contenerizados

#### Ejercicios Prácticos
1. **Despliegue de Solución Retail**: Desplegar escenario completo multi-agente retail
2. **Personalización de Agentes**: Modificar comportamientos de agentes Cliente e Inventario
3. **Escalado de Arquitectura**: Implementar balanceo de carga y autoescalado
4. **Monitoreo de Producción**: Configurar monitoreo y alertas comprensivas
5. **Integración de Microservicios**: Extender el ejemplo [Arquitectura de Microservicios](../../../examples/container-app/microservices) para soportar flujos multi-agente

#### Preguntas de Evaluación
- ¿Cómo diseñas patrones efectivos de comunicación multi-agente?
- ¿Cuáles son las consideraciones clave para escalar cargas de trabajo de agentes AI?
- ¿Cómo monitoreas y depuras sistemas AI multi-agente?
- ¿Qué patrones de producción aseguran confiabilidad para agentes AI?

---

### Capítulo 6: Validación y Planificación Pre-Despliegue (Semana 8)
**Duración**: 1 hora | **Complejidad**: ⭐⭐

#### Objetivos de Aprendizaje
- Realizar planificación de capacidad y validación de recursos comprensiva
- Seleccionar SKUs optimales para coste-efectividad en Azure
- Implementar chequeos y validaciones automatizadas pre-despliegue
- Planificar despliegues con estrategias de optimización de costos

#### Conceptos Clave para Dominar
- Cuotas y limitaciones de capacidad de recursos Azure
- Criterios de selección de SKU y optimización de costos
- Scripts de validación automatizados y testing
- Planificación de despliegues y evaluación de riesgos

#### Ejercicios Prácticos
1. **Análisis de Capacidad**: Analizar requisitos de recursos para tus aplicaciones
2. **Optimización de SKU**: Comparar y seleccionar niveles de servicio coste-efectivos
3. **Automatización de Validación**: Implementar scripts de chequeo pre-despliegue
4. **Planificación de Costos**: Crear estimaciones y presupuestos de despliegue

#### Preguntas de Evaluación
- ¿Cómo validas la capacidad en Azure antes del despliegue?
- ¿Qué factores influyen en decisiones de selección de SKU?
- ¿Cómo automatizas la validación pre-despliegue?
- ¿Qué estrategias ayudan a optimizar costos en despliegues?

---

### Capítulo 7: Solución de Problemas y Depuración (Semana 9)
**Duración**: 1-1.5 horas | **Complejidad**: ⭐⭐

#### Objetivos de Aprendizaje
- Desarrollar enfoques sistemáticos para depurar despliegues AZD
- Resolver problemas comunes de despliegue y configuración
- Depurar problemas específicos de AI y rendimiento
- Implementar monitoreo y alertas para detección proactiva de incidencias

#### Conceptos Clave para Dominar
- Técnicas de diagnóstico y estrategias de logging
- Patrones comunes de fallo y sus soluciones
- Monitoreo y optimización de rendimiento
- Procedimientos de respuesta a incidentes y recuperación

#### Ejercicios Prácticos
1. **Habilidades Diagnósticas**: Practicar con despliegues intencionalmente rotos
2. **Análisis de Logs**: Usar Azure Monitor y Application Insights eficazmente
3. **Ajuste de Rendimiento**: Optimizar aplicaciones con bajo rendimiento
4. **Procedimientos de Recuperación**: Implementar backup y recuperación ante desastres

#### Preguntas de Evaluación
- ¿Cuáles son los fallos más comunes en despliegues AZD?
- ¿Cómo depuras problemas de autenticación y permisos?
- ¿Qué estrategias de monitoreo ayudan a prevenir problemas en producción?
- ¿Cómo optimizas el rendimiento de aplicaciones en Azure?

---

### Capítulo 8: Patrones de Producción y Empresa (Semanas 10-11)
**Duración**: 2-3 horas | **Complejidad**: ⭐⭐⭐⭐

#### Objetivos de Aprendizaje
- Implementar estrategias de despliegue a nivel empresarial
- Diseñar patrones de seguridad y marcos de cumplimiento
- Establecer monitoreo, gobernanza y gestión de costos
- Crear pipelines escalables CI/CD con integración AZD
- Aplicar mejores prácticas para despliegues de aplicaciones contenerizadas en producción (seguridad, monitoreo, costos, CI/CD)

#### Conceptos Clave para Dominar
- Requisitos de seguridad y cumplimiento empresarial
- Marcos de gobernanza e implementación de políticas
- Monitoreo avanzado y gestión de costos
- Integración CI/CD y pipelines de despliegue automatizados
- Estrategias de despliegue blue-green y canario para cargas contenerizadas

#### Ejercicios Prácticos
1. **Seguridad Empresarial**: Implementar patrones completos de seguridad
2. **Marco de Gobernanza**: Configurar Azure Policy y gestión de recursos
3. **Monitoreo Avanzado**: Crear paneles y alertas automatizadas
4. **Integración CI/CD**: Construir pipelines de despliegue automatizados
5. **Aplicaciones Contenerizadas en Producción**: Aplicar seguridad, monitoreo y optimización de costos al ejemplo [Arquitectura de Microservicios](../../../examples/container-app/microservices)

#### Preguntas de Evaluación
- ¿Cómo implementas seguridad empresarial en despliegues AZD?
- ¿Qué patrones de gobernanza aseguran cumplimiento y control de costos?
- ¿Cómo diseñas monitoreo escalable para sistemas en producción?
- ¿Qué patrones CI/CD funcionan mejor con flujos AZD?

#### Objetivos de Aprendizaje
- Entender fundamentos y conceptos clave de Azure Developer CLI
- Instalar y configurar exitosamente azd en tu entorno de desarrollo
- Completar tu primer despliegue usando una plantilla existente
- Navegar la estructura del proyecto azd y entender componentes clave

#### Conceptos Clave para Dominar
- Plantillas, entornos y servicios
- Estructura de configuración azure.yaml
- Comandos básicos azd (init, up, down, deploy)
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
# Desplegar una aplicación web simple:
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
4. ¿Qué métodos de autenticación pueden usarse con azd?
5. ¿Qué sucede cuando ejecutas `azd up` por primera vez?

---

## Seguimiento de Progreso y Marco de Evaluación
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
2. ¿Qué son los hooks de despliegue y cuándo debes usarlos?
3. ¿Cómo configuras diferentes SKUs para distintos entornos?
4. ¿Cuáles son las implicaciones de seguridad de métodos de autenticación distintos?
5. ¿Cómo gestionas secretos y datos sensibles de configuración?

### Módulo 3: Despliegue y Aprovisionamiento (Semana 4)

#### Objetivos de Aprendizaje
- Dominar flujos de trabajo y mejores prácticas de despliegue
- Entender Infraestructura como Código con plantillas Bicep
- Implementar arquitecturas multi-servicio complejas
- Optimizar rendimiento y fiabilidad del despliegue

#### Conceptos Clave para Dominar
- Estructura y módulos de plantillas Bicep
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
# Desplegar una arquitectura de microservicios:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Ejercicio 3.3: Integración de Base de Datos**
```bash
# Implementar patrones de despliegue de bases de datos:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Preguntas de Autoevaluación
1. ¿Cuáles son las ventajas de usar Bicep frente a plantillas ARM?
2. ¿Cómo gestionas migraciones de bases de datos en despliegues azd?
3. ¿Qué estrategias existen para despliegues sin tiempo de inactividad?
4. ¿Cómo gestionas dependencias entre servicios?
5. ¿Qué consideraciones hay para despliegues multi-región?

### Módulo 4: Validación Pre-Despliegue (Semana 5)

#### Objetivos de Aprendizaje
- Implementar verificaciones exhaustivas previas al despliegue  
- Dominar la planificación de capacidad y validación de recursos  
- Comprender la selección de SKU y la optimización de costos  
- Construir pipelines de validación automatizados  

#### Conceptos clave para dominar  
- Cuotas y límites de recursos de Azure  
- Criterios de selección de SKU e implicaciones de costo  
- Scripts y herramientas de validación automatizada  
- Metodologías de planificación de capacidad  
- Pruebas y optimización de rendimiento  

#### Ejercicios prácticos  

**Ejercicio 4.1: Planificación de capacidad**  
```bash
# Implementar validación de capacidad:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**Ejercicio 4.2: Validación previa al vuelo**  
```powershell
# Construir una tubería de validación integral:
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
2. ¿Cómo valida la disponibilidad de recursos de Azure antes del despliegue?  
3. ¿Cuáles son los componentes clave de un sistema de chequeo previo al vuelo?  
4. ¿Cómo estima y controla los costos de despliegue?  
5. ¿Qué monitoreo es esencial para la planificación de capacidad?  

### Módulo 5: Resolución de problemas y depuración (Semana 6)  

#### Objetivos de aprendizaje  
- Dominar metodologías sistemáticas de resolución de problemas  
- Desarrollar experiencia en la depuración de problemas complejos de despliegue  
- Implementar monitoreo y alertas integrales  
- Construir procedimientos para respuesta y recuperación de incidentes  

#### Conceptos clave para dominar  
- Patrones comunes de fallos en despliegues  
- Técnicas de análisis y correlación de logs  
- Monitoreo y optimización del rendimiento  
- Detección y respuesta a incidentes de seguridad  
- Recuperación ante desastres y continuidad del negocio  

#### Ejercicios prácticos  

**Ejercicio 5.1: Escenarios de resolución de problemas**  
```bash
# Practica resolver problemas comunes:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```
  
**Ejercicio 5.2: Implementación de monitoreo**  
```bash
# Configure una monitorización integral:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```
  
**Ejercicio 5.3: Respuesta a incidentes**  
```bash
# Construir procedimientos de respuesta a incidentes:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  
#### Preguntas de autoevaluación  
1. ¿Cuál es el enfoque sistemático para solucionar despliegues azd?  
2. ¿Cómo correlaciona logs entre múltiples servicios y recursos?  
3. ¿Qué métricas de monitoreo son más críticas para la detección temprana de problemas?  
4. ¿Cómo implementa procedimientos efectivos de recuperación ante desastres?  
5. ¿Cuáles son los componentes clave de un plan de respuesta a incidentes?  

### Módulo 6: Temas avanzados y mejores prácticas (Semana 7-8)  

#### Objetivos de aprendizaje  
- Implementar patrones de despliegue empresariales de grado corporativo  
- Dominar la integración y automatización de CI/CD  
- Desarrollar plantillas personalizadas y contribuir a la comunidad  
- Comprender requisitos avanzados de seguridad y cumplimiento  

#### Conceptos clave para dominar  
- Patrones de integración en pipelines CI/CD  
- Desarrollo y distribución de plantillas personalizadas  
- Gobernanza empresarial y cumplimiento  
- Configuraciones avanzadas de redes y seguridad  
- Optimización de rendimiento y gestión de costos  

#### Ejercicios prácticos  

**Ejercicio 6.1: Integración CI/CD**  
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
1. ¿Cómo integra azd en flujos de trabajo CI/CD existentes?  
2. ¿Cuáles son las consideraciones clave para el desarrollo de plantillas personalizadas?  
3. ¿Cómo implementa gobernanza y cumplimiento en despliegues azd?  
4. ¿Cuáles son las mejores prácticas para despliegues a escala empresarial?  
5. ¿Cómo contribuye efectivamente a la comunidad azd?  

## Proyectos prácticos  

### Proyecto 1: Sitio web de portafolio personal  
**Complejidad**: Principiante  
**Duración**: 1-2 semanas  

Construya y despliegue un sitio web de portafolio personal usando:  
- Hosting de sitio web estático en Azure Storage  
- Configuración de dominio personalizado  
- Integración de CDN para rendimiento global  
- Pipeline de despliegue automatizado  

**Entregables**:  
- Sitio web funcional desplegado en Azure  
- Plantilla azd personalizada para despliegues de portafolio  
- Documentación del proceso de despliegue  
- Análisis de costos y recomendaciones de optimización  

### Proyecto 2: Aplicación de gestión de tareas  
**Complejidad**: Intermedio  
**Duración**: 2-3 semanas  

Cree una aplicación de gestión de tareas full-stack con:  
- Frontend React desplegado en App Service  
- Backend API Node.js con autenticación  
- Base de datos PostgreSQL con migraciones  
- Monitoreo con Application Insights  

**Entregables**:  
- Aplicación completa con autenticación de usuario  
- Esquema de base de datos y scripts de migración  
- Dashboards de monitoreo y reglas de alerta  
- Configuración de despliegue multi-entorno  

### Proyecto 3: Plataforma de comercio electrónico basada en microservicios  
**Complejidad**: Avanzado  
**Duración**: 4-6 semanas  

Diseñe e implemente una plataforma de e-commerce basada en microservicios:  
- Múltiples servicios API (catálogo, pedidos, pagos, usuarios)  
- Integración de cola de mensajes con Service Bus  
- Caché Redis para optimización de rendimiento  
- Registro y monitoreo completos  

**Ejemplo de referencia**: Consulte [Microservices Architecture](../../../examples/container-app/microservices) para plantilla y guía de despliegue listos para producción  

**Entregables**:  
- Arquitectura completa de microservicios  
- Patrones de comunicación entre servicios  
- Pruebas de rendimiento y optimización  
- Implementación de seguridad lista para producción  

## Evaluación y certificación  

### Comprobaciones de conocimiento  

Complete estas evaluaciones después de cada módulo:  

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
- Escenarios de despliegues multi-servicio  
- Ejercicios de optimización de rendimiento  

**Evaluación del Módulo 4**: Validación previa al despliegue  
- Estudios de caso de planificación de capacidad  
- Escenarios de optimización de costos  
- Implementación de pipelines de validación  

**Evaluación del Módulo 5**: Resolución de problemas y depuración  
- Ejercicios de diagnóstico de problemas  
- Tareas de implementación de monitoreo  
- Simulaciones de respuesta a incidentes  

**Evaluación del Módulo 6**: Temas avanzados  
- Diseño de pipelines CI/CD  
- Desarrollo de plantillas personalizadas  
- Escenarios de arquitectura empresarial  

### Proyecto final integrador  

Diseñe e implemente una solución completa que demuestre dominio de todos los conceptos:  

**Requisitos**:  
- Arquitectura de aplicación multinivel  
- Múltiples entornos de despliegue  
- Monitoreo y alertas integrales  
- Implementación de seguridad y cumplimiento  
- Optimización de costos y rendimiento  
- Documentación y runbooks completos  

**Criterios de evaluación**:  
- Calidad técnica de la implementación  
- Compleción de la documentación  
- Cumplimiento de seguridad y mejores prácticas  
- Optimización de rendimiento y costos  
- Efectividad en resolución de problemas y monitoreo  

## Recursos de estudio y referencias  

### Documentación oficial  
- [Documentación Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Documentación Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centro de Arquitectura Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Recursos comunitarios  
- [Galería de plantillas AZD](https://azure.github.io/awesome-azd/)  
- [Organización Azure-Samples en GitHub](https://github.com/Azure-Samples)  
- [Repositorio Azure Developer CLI en GitHub](https://github.com/Azure/azure-dev)  

### Entornos de práctica  
- [Cuenta gratuita de Azure](https://azure.microsoft.com/free/)  
- [Nivel gratuito de Azure DevOps](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Herramientas adicionales  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Paquete de extensión Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Recomendaciones para el cronograma de estudio  

### Estudio a tiempo completo (8 semanas)  
- **Semanas 1-2**: Módulos 1-2 (Introducción, Configuración)  
- **Semanas 3-4**: Módulos 3-4 (Despliegue, Pre-despliegue)  
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

### Lista de verificación de finalización de capítulo  

Registre su progreso a través de cada capítulo con estos resultados medibles:  

#### 📚 Capítulo 1: Fundamentos y puesta en marcha  
- [ ] **Instalación completa**: AZD instalado y verificado en su plataforma  
- [ ] **Primer despliegue**: Plantilla todo-nodejs-mongo desplegada con éxito  
- [ ] **Configuración de entorno**: Variables de entorno configuradas por primera vez  
- [ ] **Navegación de recursos**: Exploró recursos desplegados en el portal de Azure  
- [ ] **Dominio de comandos**: Cómodo con los comandos básicos de AZD  

#### 🤖 Capítulo 2: Desarrollo con enfoque en IA  
- [ ] **Despliegue de plantilla IA**: azure-search-openai-demo desplegado con éxito  
- [ ] **Implementación RAG**: Configuración de indexación y recuperación de documentos  
- [ ] **Configuración de modelos**: Configuración de múltiples modelos de IA con distintos fines  
- [ ] **Monitoreo de IA**: Implementó Application Insights para cargas de trabajo IA  
- [ ] **Optimización de rendimiento**: Ajustó el rendimiento de la aplicación IA  

#### ⚙️ Capítulo 3: Configuración y autenticación  
- [ ] **Configuración multi-entorno**: Configuró entornos dev, staging y prod  
- [ ] **Implementación de seguridad**: Configuró autenticación con identidad administrada  
- [ ] **Gestión de secretos**: Integró Azure Key Vault para datos sensibles  
- [ ] **Gestión de parámetros**: Creó configuraciones específicas por entorno  
- [ ] **Dominio de autenticación**: Implementó patrones de acceso seguro  

#### 🏗️ Capítulo 4: Infraestructura como código y despliegue  
- [ ] **Creación de plantilla personalizada**: Construyó plantilla de aplicación multi-servicio  
- [ ] **Dominio de Bicep**: Creó componentes modulares y reutilizables de infraestructura  
- [ ] **Automatización de despliegue**: Implementó hooks antes y después del despliegue  
- [ ] **Diseño arquitectónico**: Desplegó arquitectura compleja de microservicios  
- [ ] **Optimización de plantillas**: Optimizó plantillas para rendimiento y costo  

#### 🎯 Capítulo 5: Soluciones AI multi-agente  
- [ ] **Despliegue de solución retail**: Desplegó escenario completo multi-agente para retail  
- [ ] **Personalización de agentes**: Modificó comportamientos de agentes Customer y Inventory  
- [ ] **Escalado arquitectónico**: Implementó balanceo de carga y autoescalado  
- [ ] **Monitoreo en producción**: Configuró monitoreo y alertas completas  
- [ ] **Afinamiento de rendimiento**: Optimizó rendimiento del sistema multi-agente  

#### 🔍 Capítulo 6: Validación y planificación previa al despliegue  
- [ ] **Análisis de capacidad**: Analizó requisitos de recursos para aplicaciones  
- [ ] **Optimización de SKU**: Seleccionó niveles de servicio costo-efectivos  
- [ ] **Automatización de validación**: Implementó scripts de chequeo previo al despliegue  
- [ ] **Planificación de costos**: Creó estimaciones y presupuestos para despliegues  
- [ ] **Evaluación de riesgos**: Identificó y mitigó riesgos de despliegue  

#### 🚨 Capítulo 7: Resolución de problemas y depuración  
- [ ] **Habilidades diagnósticas**: Depuró despliegues deliberadamente rotos con éxito  
- [ ] **Análisis de logs**: Usó Azure Monitor y Application Insights de forma efectiva  
- [ ] **Afinamiento de rendimiento**: Optimizó aplicaciones con bajo rendimiento  
- [ ] **Procedimientos de recuperación**: Implementó backup y recuperación ante desastres  
- [ ] **Configuración de monitoreo**: Creó monitoreo y alertas proactivas  

#### 🏢 Capítulo 8: Patrones de producción y empresariales  
- [ ] **Seguridad empresarial**: Implementó patrones integrales de seguridad  
- [ ] **Marco de gobernanza**: Configuró Azure Policy y gestión de recursos  
- [ ] **Monitoreo avanzado**: Creó dashboards y alertas automáticas  
- [ ] **Integración CI/CD**: Construyó pipelines automatizados de despliegue  
- [ ] **Implementación de cumplimiento**: Cumplió con requisitos empresariales  

### Cronograma de aprendizaje y hitos  

#### Semana 1-2: Construcción de fundamentos  
- **Hito**: Desplegar la primera aplicación AI usando AZD  
- **Validación**: Aplicación funcional accesible mediante URL pública  
- **Habilidades**: Flujos básicos AZD e integración de servicios AI  

#### Semana 3-4: Dominio de configuración  
- **Hito**: Despliegue multi-entorno con autenticación segura  
- **Validación**: Misma aplicación desplegada en dev/staging/prod  
- **Habilidades**: Gestión de entornos e implementación de seguridad  

#### Semana 5-6: Experiencia en infraestructura  
- **Hito**: Plantilla personalizada para aplicación compleja multi-servicio  
- **Validación**: Plantilla reutilizable desplegada por otro miembro del equipo  
- **Habilidades**: Dominio de Bicep y automatización de infraestructura  

#### Semana 7-8: Implementación AI avanzada  
- **Hito**: Solución AI multi-agente lista para producción  
- **Validación**: Sistema gestionando carga real con monitoreo  
- **Habilidades**: Orquestación multi-agente y optimización de rendimiento  

#### Semana 9-10: Preparación para producción  
- **Hito**: Despliegue empresarial con cumplimiento completo  
- **Validación**: Aprobación en revisión de seguridad y auditoría de costos  
- **Habilidades**: Gobernanza, monitoreo e integración CI/CD  

### Evaluación y certificación  

#### Métodos de validación de conocimiento  
1. **Despliegues prácticos**: Aplicaciones funcionales para cada capítulo  
2. **Revisiones de código**: Evaluación de calidad de plantillas y configuración  
3. **Resolución de problemas**: Escenarios y soluciones de troubleshooting  
4. **Enseñanza entre pares**: Explicar conceptos a otros aprendices  
5. **Contribución comunitaria**: Compartir plantillas o mejoras  

#### Resultados del desarrollo profesional
- **Proyectos de Portafolio**: 8 implementaciones listas para producción  
- **Habilidades Técnicas**: Experiencia en despliegue de AZD y AI según estándares de la industria  
- **Capacidades de Resolución de Problemas**: Solución y optimización independiente  
- **Reconocimiento Comunitario**: Participación activa en la comunidad de desarrolladores de Azure  
- **Avance Profesional**: Habilidades directamente aplicables a roles en la nube y AI  

#### Métricas de Éxito  
- **Tasa de Éxito de Despliegue**: >95% de implementaciones exitosas  
- **Tiempo de Resolución**: <30 minutos para problemas comunes  
- **Optimización del Rendimiento**: Mejoras demostrables en costo y rendimiento  
- **Cumplimiento de Seguridad**: Todas las implementaciones cumplen con estándares de seguridad empresarial  
- **Transferencia de Conocimiento**: Capacidad para mentorizar a otros desarrolladores  

### Aprendizaje Continuo y Participación Comunitaria  

#### Mantente Actualizado  
- **Novedades de Azure**: Sigue las notas de la versión de Azure Developer CLI  
- **Eventos Comunitarios**: Participa en eventos de desarrolladores de Azure y AI  
- **Documentación**: Contribuye a la documentación y ejemplos comunitarios  
- **Ciclo de Retroalimentación**: Proporciona feedback sobre el contenido de los cursos y servicios de Azure  

#### Desarrollo Profesional  
- **Red Profesional**: Conéctate con expertos en Azure y AI  
- **Oportunidades de Conferencia**: Presenta aprendizajes en conferencias o encuentros  
- **Contribución Open Source**: Contribuye a plantillas y herramientas de AZD  
- **Mentoría**: Guía a otros desarrolladores en su recorrido de aprendizaje de AZD  

---

**Navegación del Capítulo:**  
- **📚 Inicio del Curso**: [AZD For Beginners](../README.md)  
- **📖 Comenzar a Aprender**: [Capítulo 1: Fundamentos y Inicio Rápido](../README.md#-chapter-1-foundation--quick-start)  
- **🎯 Seguimiento del Progreso**: Rastrea tu avance a través del sistema de aprendizaje integral de 8 capítulos  
- **🤝 Comunidad**: [Azure Discord](https://discord.gg/microsoft-azure) para apoyo y discusión  

**Seguimiento del Progreso de Estudio**: Usa esta guía estructurada para dominar Azure Developer CLI mediante un aprendizaje progresivo y práctico con resultados medibles y beneficios para el desarrollo profesional.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables por malentendidos o interpretaciones erróneas derivadas del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
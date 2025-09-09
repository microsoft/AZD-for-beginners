<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T17:42:24+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "es"
}
-->
# Guía de Estudio - AZD para Principiantes

## Introducción

Esta guía de estudio completa proporciona objetivos de aprendizaje estructurados, conceptos clave, ejercicios prácticos y materiales de evaluación para ayudarte a dominar Azure Developer CLI (azd). Utiliza esta guía para seguir tu progreso y asegurarte de que has cubierto todos los temas esenciales.

## Objetivos de Aprendizaje

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

## Estructura del Curso

### Módulo 1: Introducción (Semanas 1-2)

#### Objetivos de Aprendizaje
- Comprender los fundamentos y conceptos clave de Azure Developer CLI
- Instalar y configurar azd exitosamente en tu entorno de desarrollo
- Completar tu primer despliegue utilizando una plantilla existente
- Navegar por la estructura de proyectos de azd y comprender los componentes clave

#### Conceptos Clave para Dominar
- Plantillas, entornos y servicios
- Estructura de configuración azure.yaml
- Comandos básicos de azd (init, up, down, deploy)
- Principios de Infraestructura como Código
- Autenticación y autorización en Azure

#### Ejercicios Prácticos

**Ejercicio 1.1: Instalación y Configuración**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Ejercicio 1.2: Primer Despliegue**  
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Ejercicio 1.3: Análisis de la Estructura del Proyecto**  
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Preguntas de Autoevaluación
1. ¿Cuáles son los tres conceptos principales de la arquitectura de azd?
2. ¿Cuál es el propósito del archivo azure.yaml?
3. ¿Cómo ayudan los entornos a gestionar diferentes objetivos de despliegue?
4. ¿Qué métodos de autenticación se pueden usar con azd?
5. ¿Qué sucede cuando ejecutas `azd up` por primera vez?

### Módulo 2: Configuración y Entornos (Semana 3)

#### Objetivos de Aprendizaje
- Dominar la gestión y configuración de entornos
- Comprender configuraciones avanzadas de azure.yaml
- Implementar configuraciones y variables específicas de entornos
- Configurar autenticación para diferentes escenarios

#### Conceptos Clave para Dominar
- Jerarquía de entornos y precedencia de variables
- Configuración de servicios y parámetros
- Hooks y eventos del ciclo de vida
- Métodos de autenticación (usuario, principal de servicio, identidad administrada)
- Gestión de archivos de configuración

#### Ejercicios Prácticos

**Ejercicio 2.1: Configuración Multi-Entorno**  
```bash
# Create and configure multiple environments:
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
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Preguntas de Autoevaluación
1. ¿Cómo maneja azd la precedencia de variables de entorno?
2. ¿Qué son los hooks de despliegue y cuándo deberías usarlos?
3. ¿Cómo configuras diferentes SKUs para distintos entornos?
4. ¿Cuáles son las implicaciones de seguridad de los diferentes métodos de autenticación?
5. ¿Cómo gestionas secretos y datos de configuración sensibles?

### Módulo 3: Despliegue y Aprovisionamiento (Semana 4)

#### Objetivos de Aprendizaje
- Dominar los flujos de trabajo de despliegue y las mejores prácticas
- Comprender Infraestructura como Código con plantillas Bicep
- Implementar arquitecturas complejas de múltiples servicios
- Optimizar el rendimiento y la confiabilidad del despliegue

#### Conceptos Clave para Dominar
- Estructura y módulos de plantillas Bicep
- Dependencias de recursos y ordenamiento
- Estrategias de despliegue (blue-green, actualizaciones progresivas)
- Despliegues en múltiples regiones
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
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Ejercicio 3.3: Integración de Base de Datos**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Preguntas de Autoevaluación
1. ¿Cuáles son las ventajas de usar Bicep sobre las plantillas ARM?
2. ¿Cómo manejas las migraciones de bases de datos en despliegues de azd?
3. ¿Qué estrategias existen para despliegues sin tiempo de inactividad?
4. ¿Cómo gestionas las dependencias entre servicios?
5. ¿Cuáles son las consideraciones para despliegues en múltiples regiones?

### Módulo 4: Validación Pre-Despliegue (Semana 5)

#### Objetivos de Aprendizaje
- Implementar verificaciones completas antes del despliegue
- Dominar la planificación de capacidad y validación de recursos
- Comprender la selección de SKUs y la optimización de costos
- Construir pipelines de validación automatizados

#### Conceptos Clave para Dominar
- Cuotas y límites de recursos de Azure
- Criterios de selección de SKUs e implicaciones de costos
- Scripts y herramientas de validación automatizada
- Metodologías de planificación de capacidad
- Pruebas de rendimiento y optimización

#### Ejercicios Prácticos

**Ejercicio 4.1: Planificación de Capacidad**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Ejercicio 4.2: Validación Previa al Despliegue**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Ejercicio 4.3: Optimización de SKUs**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Preguntas de Autoevaluación
1. ¿Qué factores deberían influir en las decisiones de selección de SKUs?
2. ¿Cómo validas la disponibilidad de recursos de Azure antes del despliegue?
3. ¿Cuáles son los componentes clave de un sistema de verificación previa?
4. ¿Cómo estimas y controlas los costos de despliegue?
5. ¿Qué monitoreo es esencial para la planificación de capacidad?

### Módulo 5: Resolución de Problemas y Depuración (Semana 6)

#### Objetivos de Aprendizaje
- Dominar metodologías sistemáticas de resolución de problemas
- Desarrollar experiencia en la depuración de problemas complejos de despliegue
- Implementar monitoreo y alertas completas
- Construir procedimientos de respuesta a incidentes y recuperación

#### Conceptos Clave para Dominar
- Patrones comunes de fallos en despliegues
- Técnicas de análisis y correlación de logs
- Monitoreo de rendimiento y optimización
- Detección y respuesta a incidentes de seguridad
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

**Ejercicio 5.3: Respuesta a Incidentes**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Preguntas de Autoevaluación
1. ¿Cuál es el enfoque sistemático para resolver problemas en despliegues de azd?
2. ¿Cómo correlacionas logs entre múltiples servicios y recursos?
3. ¿Qué métricas de monitoreo son más críticas para la detección temprana de problemas?
4. ¿Cómo implementas procedimientos efectivos de recuperación ante desastres?
5. ¿Cuáles son los componentes clave de un plan de respuesta a incidentes?

### Módulo 6: Temas Avanzados y Mejores Prácticas (Semanas 7-8)

#### Objetivos de Aprendizaje
- Implementar patrones de despliegue de nivel empresarial
- Dominar la integración y automatización de CI/CD
- Desarrollar plantillas personalizadas y contribuir a la comunidad
- Comprender requisitos avanzados de seguridad y cumplimiento

#### Conceptos Clave para Dominar
- Patrones de integración de pipelines CI/CD
- Desarrollo y distribución de plantillas personalizadas
- Gobernanza empresarial y cumplimiento
- Configuraciones avanzadas de redes y seguridad
- Optimización de rendimiento y gestión de costos

#### Ejercicios Prácticos

**Ejercicio 6.1: Integración CI/CD**  
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
3. ¿Cómo implementas gobernanza y cumplimiento en despliegues de azd?
4. ¿Cuáles son las mejores prácticas para despliegues a escala empresarial?
5. ¿Cómo contribuyes eficazmente a la comunidad de azd?

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
- Plantilla personalizada de azd para despliegues de portafolio
- Documentación del proceso de despliegue
- Recomendaciones de análisis y optimización de costos  

### Proyecto 2: Aplicación de Gestión de Tareas  
**Complejidad**: Intermedio  
**Duración**: 2-3 semanas  

Crea una aplicación de gestión de tareas full-stack con:
- Frontend React desplegado en App Service
- Backend API Node.js con autenticación
- Base de datos PostgreSQL con migraciones
- Monitoreo con Application Insights  

**Entregables**:
- Aplicación completa con autenticación de usuarios
- Esquema de base de datos y scripts de migración
- Dashboards de monitoreo y reglas de alerta
- Configuración de despliegue multi-entorno  

### Proyecto 3: Plataforma de Comercio Electrónico con Microservicios  
**Complejidad**: Avanzado  
**Duración**: 4-6 semanas  

Diseña e implementa una plataforma de comercio electrónico basada en microservicios:
- Múltiples servicios API (catálogo, pedidos, pagos, usuarios)
- Integración de cola de mensajes con Service Bus
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
- Escenarios de despliegue multi-servicio  
- Ejercicios de optimización de rendimiento  

**Evaluación del Módulo 4**: Validación pre-despliegue  
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

### Proyecto Final de Capstone

Diseña e implementa una solución completa que demuestre dominio de todos los conceptos:

**Requisitos**:
- Arquitectura de aplicación multi-nivel  
- Múltiples entornos de despliegue  
- Monitoreo y alertas completas  
- Implementación de seguridad y cumplimiento  
- Optimización de costos y ajuste de rendimiento  
- Documentación completa y manuales de operación  

**Criterios de Evaluación**:
- Calidad técnica de la implementación  
- Integridad de la documentación  
- Adherencia a seguridad y mejores prácticas  
- Optimización de rendimiento y costos  
- Eficiencia en resolución de problemas y monitoreo  

## Recursos de Estudio y Referencias

### Documentación Oficial
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Documentación de Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centro de Arquitectura de Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Recursos Comunitarios
- [Galería de Plantillas AZD](https://azure.github.io/awesome-azd/)  
- [Organización GitHub de Azure-Samples](https://github.com/Azure-Samples)  
- [Repositorio GitHub de Azure Developer CLI](https://github.com/Azure/azure-dev)  

### Entornos de Práctica
- [Cuenta Gratuita de Azure](https://azure.microsoft.com/free/)  
- [Nivel Gratuito de Azure DevOps](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Herramientas Adicionales
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Paquete de Extensiones de Herramientas de Azure](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Recomendaciones de Horarios de Estudio

### Estudio a Tiempo Completo (8 semanas)
- **Semanas 1-2**: Módulos 1-2 (Introducción, Configuración)  
- **Semanas 3-4**: Módulos 3-4 (Despliegue, Validación Pre-despliegue)  
- **Semanas 5-6**: Módulos 5-6 (Resolución de Problemas, Temas Avanzados)  
- **Semanas 7-8**: Proyectos Prácticos y Evaluación Final  

### Estudio a Tiempo Parcial (16 semanas)
- **Semanas 1-4**: Módulo 1 (Introducción)  
- **Semanas 5-7**: Módulo 2 (Configuración y Entornos)  
- **Semanas 8-10**: Módulo 3 (Despliegue y Aprovisionamiento)  
- **Semanas 11-12**: Módulo 4 (Validación Pre-despliegue)  
- **Semanas 13-14**: Módulo 5 (Resolución de Problemas y Depuración)  
- **Semanas 15-16**: Módulo 6 (Temas Avanzados y Evaluación)  

### Estudio a tu Propio Ritmo
- Completa cada módulo a tu propio ritmo  
- Dedica tiempo adicional a conceptos desafiantes  
- Repite ejercicios hasta lograr dominio  
- Únete a discusiones comunitarias y haz preguntas  

## Consejos para el Éxito

### Estrategias de Aprendizaje Efectivo
1. **Practica Regularmente**: Despliega aplicaciones con frecuencia para desarrollar memoria muscular  
2. **Experimenta Sin Miedo**: Usa entornos de desarrollo para probar nuevas configuraciones  
3. **Documenta tu Aprendizaje**: Toma notas sobre las soluciones a los problemas que encuentres  
4. **Únete a la Comunidad**: Participa en discusiones y contribuye a proyectos  
5. **Mantente Actualizado**: Sigue las actualizaciones de Azure y las nuevas características de azd  

### Errores Comunes a Evitar
1. **Omitir Prerrequisitos**: Asegúrate de tener conocimientos básicos adecuados  
2. **Apresurarte en los Conceptos**: Tómate el tiempo para comprender los fundamentos a fondo  
3. **Ignorar la Seguridad**: Implementa siempre las mejores prácticas de seguridad desde el principio  
4. **No Probar Suficientemente**: Prueba despliegues en múltiples entornos  
5. **Evitar la Documentación**: Una buena documentación es esencial para el mantenimiento  

### Construyendo Experiencia Práctica
1. **Comienza Pequeño**: Inicia con aplicaciones simples y aumenta gradualmente la complejidad  
2. **Aprende del Fracaso**: Usa los ejercicios de resolución de problemas como oportunidades de aprendizaje
3. **Contribuye al Código Abierto**: Comparte tus plantillas y soluciones con la comunidad  
4. **Enseña a Otros**: Explicar conceptos a otros refuerza tu propia comprensión  
5. **Mantén la Curiosidad**: Explora continuamente nuevos servicios de Azure y patrones de integración  

---

**Navegación**  
- **Lección Anterior**: [FAQ](faq.md)  
- **Próxima Lección**: [Changelog](../changelog.md)  

**Seguimiento del Progreso de Estudio**: Utiliza esta guía para seguir tu viaje de aprendizaje y asegurar una cobertura completa de todos los conceptos y prácticas del Azure Developer CLI.  

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.
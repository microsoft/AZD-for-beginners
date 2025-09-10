<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:00:51+00:00",
  "source_file": "examples/README.md",
  "language_code": "es"
}
-->
# Ejemplos - Plantillas y Configuraciones Prácticas de AZD

## Introducción

Este directorio contiene ejemplos prácticos, plantillas y escenarios reales para ayudarte a aprender Azure Developer CLI mediante práctica directa. Cada ejemplo proporciona código funcional completo, plantillas de infraestructura e instrucciones detalladas para diferentes arquitecturas de aplicaciones y patrones de despliegue.

## Objetivos de Aprendizaje

Al trabajar con estos ejemplos, podrás:
- Practicar flujos de trabajo de Azure Developer CLI con escenarios de aplicaciones realistas
- Comprender diferentes arquitecturas de aplicaciones y sus implementaciones con azd
- Dominar patrones de Infraestructura como Código para varios servicios de Azure
- Aplicar estrategias de gestión de configuración y despliegues específicos por entorno
- Implementar patrones de monitoreo, seguridad y escalabilidad en contextos prácticos
- Adquirir experiencia en la resolución de problemas y depuración de escenarios reales de despliegue

## Resultados de Aprendizaje

Al completar estos ejemplos, serás capaz de:
- Desplegar diferentes tipos de aplicaciones utilizando Azure Developer CLI con confianza
- Adaptar las plantillas proporcionadas a los requisitos de tus propias aplicaciones
- Diseñar e implementar patrones de infraestructura personalizados utilizando Bicep
- Configurar aplicaciones complejas de múltiples servicios con dependencias adecuadas
- Aplicar mejores prácticas de seguridad, monitoreo y rendimiento en escenarios reales
- Resolver problemas y optimizar despliegues basándote en experiencia práctica

## Estructura del Directorio

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Ejemplos de Inicio Rápido

### Para Principiantes
1. **[Aplicación Web Simple](../../../examples/simple-web-app)** - Despliega una aplicación web básica en Node.js
2. **[Sitio Web Estático](../../../examples/static-website)** - Aloja un sitio web estático en Azure Storage
3. **[Aplicación en Contenedor](../../../examples/container-app)** - Despliega una aplicación en contenedor

### Para Usuarios Intermedios
4. **[Aplicación con Base de Datos](../../../examples/database-app)** - Aplicación web con base de datos PostgreSQL
5. **[Función Serverless](../../../examples/serverless-function)** - Azure Functions con disparadores HTTP
6. **[Microservicios](../../../examples/microservices)** - Aplicación de múltiples servicios con API Gateway

## 📋 Instrucciones de Uso

### Ejecutar Ejemplos Localmente

1. **Clonar o Copiar Ejemplo**  
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inicializar Entorno AZD**  
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Configurar Entorno**  
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Desplegar**  
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Adaptar Ejemplos

Cada ejemplo incluye:
- **README.md** - Instrucciones detalladas de configuración y personalización
- **azure.yaml** - Configuración de AZD con comentarios
- **infra/** - Plantillas Bicep con explicaciones de parámetros
- **src/** - Código de aplicación de muestra
- **scripts/** - Scripts auxiliares para tareas comunes

## 🎯 Objetivos de Aprendizaje

### Categorías de Ejemplos

#### **Despliegues Básicos**
- Aplicaciones de un solo servicio
- Patrones de infraestructura simples
- Gestión básica de configuración
- Configuraciones económicas para desarrollo

#### **Escenarios Avanzados**
- Arquitecturas de múltiples servicios
- Configuraciones de red complejas
- Patrones de integración de bases de datos
- Implementaciones de seguridad y cumplimiento

#### **Patrones Listos para Producción**
- Configuraciones de alta disponibilidad
- Monitoreo y observabilidad
- Integración CI/CD
- Configuraciones para recuperación ante desastres

## 📖 Descripciones de Ejemplos

### Aplicación Web Simple
**Tecnologías**: Node.js, App Service, Application Insights  
**Complejidad**: Principiante  
**Conceptos**: Despliegue básico, variables de entorno, comprobaciones de salud

### Sitio Web Estático
**Tecnologías**: HTML/CSS/JS, Storage Account, CDN  
**Complejidad**: Principiante  
**Conceptos**: Hosting estático, integración con CDN, dominios personalizados

### Aplicación en Contenedor
**Tecnologías**: Docker, Container Apps, Container Registry  
**Complejidad**: Intermedio  
**Conceptos**: Contenerización, escalabilidad, configuración de ingreso

### Aplicación con Base de Datos
**Tecnologías**: Python Flask, PostgreSQL, App Service  
**Complejidad**: Intermedio  
**Conceptos**: Conexiones a bases de datos, gestión de secretos, migraciones

### Función Serverless
**Tecnologías**: Azure Functions, Cosmos DB, API Management  
**Complejidad**: Intermedio  
**Conceptos**: Arquitectura basada en eventos, bindings, gestión de API

### Microservicios
**Tecnologías**: Múltiples servicios, Service Bus, API Gateway  
**Complejidad**: Avanzado  
**Conceptos**: Comunicación entre servicios, colas de mensajes, balanceo de carga

## 🛠 Ejemplos de Configuración

El directorio `configurations/` contiene componentes reutilizables:

### Configuraciones de Entorno
- Configuraciones para entornos de desarrollo
- Configuraciones para entornos de staging
- Configuraciones listas para producción
- Configuraciones para despliegues en múltiples regiones

### Módulos Bicep
- Componentes de infraestructura reutilizables
- Patrones comunes de recursos
- Plantillas con seguridad reforzada
- Configuraciones optimizadas para costos

### Scripts Auxiliares
- Automatización de configuración de entornos
- Scripts de migración de bases de datos
- Herramientas de validación de despliegues
- Utilidades para monitoreo de costos

## 🔧 Guía de Personalización

### Adaptar Ejemplos a Tu Caso de Uso

1. **Revisar Requisitos**
   - Verifica los requisitos de servicios de Azure
   - Confirma los límites de suscripción
   - Comprende las implicaciones de costos

2. **Modificar Configuración**
   - Actualiza las definiciones de servicios en `azure.yaml`
   - Personaliza las plantillas Bicep
   - Ajusta las variables de entorno

3. **Probar Exhaustivamente**
   - Despliega primero en el entorno de desarrollo
   - Valida la funcionalidad
   - Prueba escalabilidad y rendimiento

4. **Revisión de Seguridad**
   - Revisa los controles de acceso
   - Implementa gestión de secretos
   - Activa monitoreo y alertas

## 📊 Matriz Comparativa

| Ejemplo | Servicios | Base de Datos | Autenticación | Monitoreo | Complejidad |
|---------|----------|---------------|---------------|-----------|-------------|
| Aplicación Web Simple | 1 | ❌ | Básica | Básica | ⭐ |
| Sitio Web Estático | 1 | ❌ | ❌ | Básica | ⭐ |
| Aplicación en Contenedor | 1 | ❌ | Básica | Completa | ⭐⭐ |
| Aplicación con Base de Datos | 2 | ✅ | Completa | Completa | ⭐⭐⭐ |
| Función Serverless | 3 | ✅ | Completa | Completa | ⭐⭐⭐ |
| Microservicios | 5+ | ✅ | Completa | Completa | ⭐⭐⭐⭐ |

## 🎓 Ruta de Aprendizaje

### Progresión Recomendada

1. **Comienza con Aplicación Web Simple**
   - Aprende conceptos básicos de AZD
   - Comprende el flujo de trabajo de despliegue
   - Practica la gestión de entornos

2. **Prueba Sitio Web Estático**
   - Explora diferentes opciones de hosting
   - Aprende sobre integración con CDN
   - Comprende la configuración de DNS

3. **Avanza a Aplicación en Contenedor**
   - Aprende los fundamentos de contenerización
   - Comprende conceptos de escalabilidad
   - Practica con Docker

4. **Añade Integración de Base de Datos**
   - Aprende sobre aprovisionamiento de bases de datos
   - Comprende cadenas de conexión
   - Practica gestión de secretos

5. **Explora Serverless**
   - Comprende arquitectura basada en eventos
   - Aprende sobre disparadores y bindings
   - Practica con APIs

6. **Construye Microservicios**
   - Aprende comunicación entre servicios
   - Comprende sistemas distribuidos
   - Practica despliegues complejos

## 🔍 Encontrar el Ejemplo Adecuado

### Por Stack Tecnológico
- **Node.js**: Aplicación Web Simple, Microservicios
- **Python**: Aplicación con Base de Datos, Función Serverless
- **Sitios Estáticos**: Sitio Web Estático
- **Contenedores**: Aplicación en Contenedor, Microservicios
- **Bases de Datos**: Aplicación con Base de Datos, Función Serverless

### Por Patrón de Arquitectura
- **Monolítico**: Aplicación Web Simple, Aplicación con Base de Datos
- **Estático**: Sitio Web Estático
- **Microservicios**: Ejemplo de Microservicios
- **Serverless**: Función Serverless
- **Híbrido**: Aplicación en Contenedor

### Por Nivel de Complejidad
- **Principiante**: Aplicación Web Simple, Sitio Web Estático
- **Intermedio**: Aplicación en Contenedor, Aplicación con Base de Datos, Función Serverless  
- **Avanzado**: Microservicios

## 📚 Recursos Adicionales

### Enlaces de Documentación
- [Plantillas AZD de Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Documentación de Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centro de Arquitectura de Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Ejemplos de la Comunidad
- [Plantillas AZD de Azure Samples](https://github.com/Azure-Samples/azd-templates)
- [Plantillas de Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galería de Azure Developer CLI](https://azure.github.io/awesome-azd/)

### Mejores Prácticas
- [Marco de Arquitectura Bien Diseñada de Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Marco de Adopción de la Nube](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuir Ejemplos

¿Tienes un ejemplo útil para compartir? ¡Aceptamos contribuciones!

### Directrices para Envío
1. Sigue la estructura de directorio establecida
2. Incluye un README.md completo
3. Agrega comentarios a los archivos de configuración
4. Prueba exhaustivamente antes de enviar
5. Incluye estimaciones de costos y requisitos previos

### Estructura de Plantilla de Ejemplo
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Consejo Profesional**: Comienza con el ejemplo más sencillo que coincida con tu stack tecnológico, luego avanza gradualmente hacia escenarios más complejos. Cada ejemplo se basa en conceptos del anterior.

**Próximos Pasos**: 
- Elige un ejemplo que coincida con tu nivel de habilidad
- Sigue las instrucciones de configuración en el README del ejemplo
- Experimenta con personalizaciones
- Comparte tus aprendizajes con la comunidad

---

**Navegación**
- **Lección Anterior**: [Guía de Estudio](../resources/study-guide.md)
- **Volver a**: [README Principal](../README.md)

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.
# Glossary - Azure and AZD Terminology

**Reference for All Chapters**
- **📚 Course Home**: [AZD para Principiantes](../README.md)
- **📖 Learn Basics**: [Capítulo 1: Conceptos Básicos de AZD](../docs/getting-started/azd-basics.md)
- **🤖 AI Terms**: [Capítulo 2: Desarrollo centrado en IA](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introduction

Este glosario completo proporciona definiciones de términos, conceptos y siglas utilizados en Azure Developer CLI y el desarrollo en la nube de Azure. Referencia esencial para comprender la documentación técnica, resolver problemas y comunicarse eficazmente sobre proyectos azd y servicios de Azure.

## Learning Goals

Al utilizar este glosario, usted:
- Entenderá la terminología y los conceptos esenciales de Azure Developer CLI
- Dominará el vocabulario y los términos técnicos del desarrollo en la nube de Azure
- Consultará eficazmente la terminología de Infrastructure as Code y despliegue
- Comprenderá los nombres de servicios de Azure, acrónimos y sus propósitos
- Accederá a definiciones para terminología de resolución de problemas y depuración
- Aprenderá conceptos avanzados de arquitectura y desarrollo en Azure

## Learning Outcomes

Con la consulta regular de este glosario, podrá:
- Comunicarse eficazmente usando la terminología adecuada de Azure Developer CLI
- Entender la documentación técnica y los mensajes de error con mayor claridad
- Navegar por los servicios y conceptos de Azure con confianza
- Resolver problemas usando el vocabulario técnico apropiado
- Contribuir a las discusiones de equipo con lenguaje técnico preciso
- Ampliar su conocimiento del desarrollo en la nube de Azure de forma sistemática

## A

**Plantilla ARM**  
Azure Resource Manager template. Formato JSON de Infrastructure as Code usado para definir y desplegar recursos de Azure de forma declarativa.

**App Service**  
La oferta platform-as-a-service (PaaS) de Azure para alojar aplicaciones web, APIs REST y backends móviles sin gestionar la infraestructura.

**Application Insights**  
Servicio de Application Performance Monitoring (APM) de Azure que proporciona información profunda sobre el rendimiento, disponibilidad y uso de las aplicaciones.

**Azure CLI**  
Interfaz de línea de comandos para gestionar recursos de Azure. Utilizada por azd para autenticación y algunas operaciones.

**Azure Developer CLI (azd)**  
Herramienta de línea de comandos centrada en desarrolladores que acelera el proceso de construir y desplegar aplicaciones en Azure usando plantillas e Infrastructure as Code.

**azure.yaml**  
El archivo de configuración principal de un proyecto azd que define servicios, infraestructura y hooks de despliegue.

**Azure Resource Manager (ARM)**  
Servicio de despliegue y administración de Azure que proporciona una capa de gestión para crear, actualizar y eliminar recursos.

## B

**Bicep**  
Lenguaje específico de dominio (DSL) desarrollado por Microsoft para desplegar recursos de Azure. Ofrece una sintaxis más simple que las plantillas ARM mientras compila a ARM.

**Compilación**  
El proceso de compilar el código fuente, instalar dependencias y preparar las aplicaciones para su despliegue.

**Despliegue Blue-Green**  
Estrategia de despliegue que utiliza dos entornos de producción idénticos (azul y verde) para minimizar el tiempo de inactividad y el riesgo.

## C

**Container Apps**  
Servicio serverless de contenedores de Azure que permite ejecutar aplicaciones conteinerizadas sin gestionar infraestructura compleja.

**CI/CD**  
Integración Continua/Despliegue Continuo. Prácticas automatizadas para integrar cambios de código y desplegar aplicaciones.

**Cosmos DB**  
Servicio de base de datos multimodelo y distribuido globalmente de Azure que ofrece SLAs integrales para throughput, latencia, disponibilidad y consistencia.

**Configuración**  
Ajustes y parámetros que controlan el comportamiento de la aplicación y las opciones de despliegue.

## D

**Implementación**  
El proceso de instalar y configurar aplicaciones y sus dependencias en la infraestructura objetivo.

**Docker**  
Plataforma para desarrollar, distribuir y ejecutar aplicaciones usando tecnología de contenedores.

**Dockerfile**  
Archivo de texto que contiene instrucciones para construir una imagen de contenedor Docker.

## E

**Entorno**  
Un destino de despliegue que representa una instancia específica de su aplicación (por ejemplo, desarrollo, staging, producción).

**Variables de Entorno**  
Valores de configuración almacenados como pares clave-valor que las aplicaciones pueden acceder en tiempo de ejecución.

**Endpoint**  
URL o dirección de red donde se puede acceder a una aplicación o servicio.

## F

**Function App**  
Servicio de cómputo serverless de Azure que permite ejecutar código orientado a eventos sin gestionar infraestructura.

## G

**GitHub Actions**  
Plataforma CI/CD integrada con repositorios de GitHub para automatizar flujos de trabajo.

**Git**  
Sistema de control de versiones distribuido usado para rastrear cambios en el código fuente.

## H

**Hooks**  
Scripts o comandos personalizados que se ejecutan en puntos específicos durante el ciclo de vida del despliegue (preprovision, postprovision, predeploy, postdeploy).

**Host**  
El tipo de servicio de Azure donde se desplegará una aplicación (por ejemplo, appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Práctica de definir y gestionar la infraestructura mediante código en lugar de procesos manuales.

**Init**  
El proceso de inicializar un nuevo proyecto azd, típicamente desde una plantilla.

## J

**JSON**  
JavaScript Object Notation. Formato de intercambio de datos comúnmente usado para archivos de configuración y respuestas de API.

**JWT**  
JSON Web Token. Estándar para transmitir información de forma segura entre partes como un objeto JSON.

## K

**Key Vault**  
Servicio de Azure para almacenar y gestionar de forma segura secretos, claves y certificados.

**Kusto Query Language (KQL)**  
Lenguaje de consulta usado para analizar datos en Azure Monitor, Application Insights y otros servicios de Azure.

## L

**Load Balancer**  
Servicio que distribuye el tráfico de red entrante entre múltiples servidores o instancias.

**Log Analytics**  
Servicio de Azure para recopilar, analizar y actuar sobre datos de telemetría desde entornos en la nube y locales.

## M

**Managed Identity**  
Funcionalidad de Azure que proporciona a los servicios de Azure una identidad administrada automáticamente para autenticarse con otros servicios de Azure.

**Microservicios**  
Enfoque arquitectónico donde las aplicaciones se construyen como una colección de servicios pequeños e independientes.

**Monitor**  
Solución unificada de monitorización de Azure que proporciona observabilidad completa a través de aplicaciones e infraestructura.

## N

**Node.js**  
Runtime de JavaScript construido sobre el motor V8 de Chrome para crear aplicaciones del lado del servidor.

**npm**  
Administrador de paquetes para Node.js que gestiona dependencias y paquetes.

## O

**Output**  
Valores devueltos por el despliegue de infraestructura que pueden ser utilizados por aplicaciones u otros recursos.

## P

**Empaquetado**  
El proceso de preparar el código de la aplicación y sus dependencias para el despliegue.

**Parámetros**  
Valores de entrada pasados a las plantillas de infraestructura para personalizar los despliegues.

**PostgreSQL**  
Sistema de base de datos relacional de código abierto soportado como servicio administrado en Azure.

**Aprovisionamiento**  
El proceso de crear y configurar recursos de Azure definidos en plantillas de infraestructura.

## Q

**Cuota**  
Límites en la cantidad de recursos que se pueden crear en una suscripción o región de Azure.

## R

**Grupo de recursos**  
Contenedor lógico para recursos de Azure que comparten el mismo ciclo de vida, permisos y directivas.

**Token de recurso**  
Cadena única generada por azd para asegurar que los nombres de recursos sean únicos entre despliegues.

**REST API**  
Estilo arquitectónico para diseñar aplicaciones en red usando métodos HTTP.

**Reversión**  
Proceso de volver a una versión anterior de una aplicación o configuración de infraestructura.

## S

**Servicio**  
Componente de su aplicación definido en azure.yaml (por ejemplo, frontend web, backend API, base de datos).

**SKU**  
Stock Keeping Unit. Representa diferentes niveles de servicio o niveles de rendimiento para recursos de Azure.

**Base de datos SQL**  
Servicio de base de datos relacional administrado de Azure basado en Microsoft SQL Server.

**Static Web Apps**  
Servicio de Azure para construir y desplegar aplicaciones web completas desde repositorios de código fuente.

**Cuenta de almacenamiento**  
Servicio de Azure que proporciona almacenamiento en la nube para objetos de datos incluyendo blobs, archivos, colas y tablas.

**Suscripción**  
Contenedor de cuenta de Azure que aloja grupos de recursos y recursos, con facturación y gestión de acceso asociadas.

## T

**Plantilla**  
Estructura de proyecto preconstruida que contiene código de aplicación, definiciones de infraestructura y configuración para escenarios comunes.

**Terraform**  
Herramienta de Infrastructure as Code de código abierto que soporta múltiples proveedores de nube, incluyendo Azure.

**Traffic Manager**  
Balanceador de carga basado en DNS de Azure para distribuir el tráfico a través de regiones globales de Azure.

## U

**URI**  
Uniform Resource Identifier. Cadena que identifica un recurso en particular.

**URL**  
Uniform Resource Locator. Tipo de URI que especifica dónde se encuentra un recurso y cómo recuperarlo.

## V

**Virtual Network (VNet)**  
Pilar fundamental para redes privadas en Azure, proporcionando aislamiento y segmentación.

**VS Code**  
Visual Studio Code. Editor de código popular con excelente integración con Azure y azd.

## W

**Webhook**  
Callback HTTP activado por eventos específicos, comúnmente usado en pipelines de CI/CD.

**What-if**  
Funcionalidad de Azure que muestra qué cambios se harían con un despliegue sin ejecutarlo realmente.

## Y

**YAML**  
YAML Ain't Markup Language. Estándar de serialización de datos legible por humanos usado para archivos de configuración como azure.yaml.

## Z

**Zona**  
Ubicaciones físicamente separadas dentro de una región de Azure que proporcionan redundancia y alta disponibilidad.

---

## Acrónimos Comunes

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Servicio de gestión de identidad y acceso |
| ACR | Azure Container Registry | Servicio de registro de imágenes de contenedores |
| AKS | Azure Kubernetes Service | Servicio administrado de Kubernetes |
| API | Application Programming Interface | Conjunto de protocolos para construir software |
| ARM | Azure Resource Manager | Servicio de despliegue y administración de Azure |
| CDN | Content Delivery Network | Red distribuida de servidores |
| CI/CD | Continuous Integration/Continuous Deployment | Prácticas automatizadas de desarrollo |
| CLI | Command Line Interface | Interfaz de usuario basada en texto |
| DNS | Domain Name System | Sistema para traducir nombres de dominio a direcciones IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versión segura de HTTP |
| IaC | Infrastructure as Code | Gestión de infraestructura mediante código |
| JSON | JavaScript Object Notation | Formato de intercambio de datos |
| JWT | JSON Web Token | Formato de token para transmisión segura de información |
| KQL | Kusto Query Language | Lenguaje de consulta para servicios de datos de Azure |
| RBAC | Role-Based Access Control | Método de control de acceso basado en roles de usuario |
| REST | Representational State Transfer | Estilo arquitectónico para servicios web |
| SDK | Software Development Kit | Conjunto de herramientas de desarrollo |
| SLA | Service Level Agreement | Compromiso sobre disponibilidad/rendimiento del servicio |
| SQL | Structured Query Language | Lenguaje para gestionar bases de datos relacionales |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocolos criptográficos |
| URI | Uniform Resource Identifier | Cadena que identifica un recurso |
| URL | Uniform Resource Locator | Tipo de URI que especifica la ubicación de un recurso |
| VM | Virtual Machine | Emulación de un sistema informático |
| VNet | Virtual Network | Red privada en Azure |
| YAML | YAML Ain't Markup Language | Estándar de serialización de datos |

---

## Azure Service Name Mappings

| Common Name | Official Azure Service Name | azd Host Type |
|-------------|------------------------------|---------------|
| Aplicación web | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Sitio estático | Azure Static Web Apps | `staticwebapp` |
| Base de datos | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Almacenamiento | Azure Storage Account | `storage` |
| Caché | Azure Cache for Redis | `redis` |
| Búsqueda | Azure Cognitive Search | `search` |
| Mensajería | Azure Service Bus | `servicebus` |

---

## Context-Specific Terms

### Development Terms
- **Recarga en caliente**: Actualización automática de aplicaciones durante el desarrollo sin reinicio
- **Pipeline de compilación**: Proceso automatizado para construir y probar código
- **Deployment Slot**: Entorno de staging dentro de un App Service
- **Paridad de entorno**: Mantener entornos de desarrollo, staging y producción similares

### Security Terms
- **Managed Identity**: Funcionalidad de Azure que proporciona gestión automática de credenciales
- **Key Vault**: Almacenamiento seguro para secretos, claves y certificados
- **RBAC**: Control de acceso basado en roles para recursos de Azure
- **Network Security Group**: Firewall virtual para controlar el tráfico de red

### Monitoring Terms
- **Telemetry**: Recopilación automatizada de mediciones y datos
- **Application Performance Monitoring (APM)**: Monitorización del rendimiento del software
- **Log Analytics**: Servicio para recopilar y analizar datos de registro
- **Alert Rules**: Notificaciones automatizadas basadas en métricas o condiciones

### Deployment Terms
- **Despliegue Blue-Green**: Estrategia de despliegue sin tiempo de inactividad
- **Canary Deployment**: Implementación gradual a un subconjunto de usuarios
- **Actualización por oleadas (Rolling Update)**: Reemplazo secuencial de instancias de la aplicación
- **Reversión**: Volver a una versión anterior de la aplicación

---

**Consejo de uso**: Use `Ctrl+F` para buscar rápidamente términos específicos en este glosario. Los términos están referenciados cruzadamente donde corresponde.

---

**Navigation**
- **Previous Lesson**: [Hoja de referencia](cheat-sheet.md)
- **Next Lesson**: [Preguntas Frecuentes](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Descargo de responsabilidad:
Este documento ha sido traducido usando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la exactitud, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
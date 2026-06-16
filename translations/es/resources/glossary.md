# Glosario - Terminología de Azure y AZD

**Referencia para Todos los Capítulos**
- **📚 Inicio del Curso**: [AZD For Beginners](../README.md)
- **📖 Aprende lo Básico**: [Capítulo 1: Fundamentos de AZD](../docs/getting-started/azd-basics.md)
- **🤖 Términos de IA**: [Capítulo 2: Desarrollo con IA como Prioridad](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introducción

Este glosario integral proporciona definiciones de términos, conceptos y acrónimos utilizados en Azure Developer CLI y en el desarrollo en la nube de Azure. Referencia esencial para comprender la documentación técnica, solucionar problemas y comunicarse eficazmente sobre proyectos azd y servicios de Azure.

## Objetivos de Aprendizaje

Al usar este glosario, usted:
- Comprender la terminología y los conceptos esenciales de Azure Developer CLI
- Dominar el vocabulario y los términos técnicos del desarrollo en la nube de Azure
- Consultar de forma eficiente la terminología de Infraestructura como Código y de despliegue
- Comprender los nombres de servicios de Azure, los acrónimos y sus propósitos
- Acceder a definiciones para la terminología de solución de problemas y depuración
- Aprender conceptos avanzados de arquitectura y desarrollo en Azure

## Resultados de Aprendizaje

Con referencia regular a este glosario, usted podrá:
- Comunicarse eficazmente usando la terminología adecuada de Azure Developer CLI
- Entender la documentación técnica y los mensajes de error con mayor claridad
- Navegar por los servicios y conceptos de Azure con confianza
- Solucionar problemas usando el vocabulario técnico apropiado
- Contribuir en las discusiones del equipo con lenguaje técnico preciso
- Ampliar sistemáticamente su conocimiento del desarrollo en la nube de Azure

## A

**ARM Template**  
Plantilla de Azure Resource Manager (ARM). Formato de Infraestructura como Código basado en JSON usado para definir y desplegar recursos de Azure de forma declarativa.

**App Service**  
Oferta de plataforma como servicio (PaaS) de Azure para alojar aplicaciones web, API REST y backends móviles sin gestionar la infraestructura.

**Application Insights**  
Servicio de monitorización del rendimiento de aplicaciones (APM) de Azure que proporciona información detallada sobre el rendimiento, la disponibilidad y el uso de las aplicaciones.

**Azure CLI**  
Interfaz de línea de comandos para gestionar recursos de Azure. Usada por azd para la autenticación y algunas operaciones.

**Azure Developer CLI (azd)**  
Herramienta de línea de comandos centrada en el desarrollador que acelera el proceso de creación y despliegue de aplicaciones en Azure usando plantillas e Infraestructura como Código.

**azure.yaml**  
El archivo de configuración principal de un proyecto azd que define servicios, infraestructura y hooks de despliegue.

**Azure Resource Manager (ARM)**  
Servicio de despliegue y gestión de Azure que proporciona una capa de administración para crear, actualizar y eliminar recursos.

## B

**Bicep**  
Lenguaje específico de dominio (DSL) desarrollado por Microsoft para desplegar recursos de Azure. Proporciona una sintaxis más simple que las plantillas ARM y se compila a ARM.

**Build**  
El proceso de compilar el código fuente, instalar dependencias y preparar las aplicaciones para su despliegue.

**Blue-Green Deployment**  
Estrategia de despliegue que utiliza dos entornos de producción idénticos (blue y green) para minimizar el tiempo de inactividad y el riesgo.

## C

**Container Apps**  
Servicio de contenedores serverless de Azure que permite ejecutar aplicaciones en contenedores sin gestionar infraestructura compleja.

**CI/CD**  
Integración Continua/Despliegue Continuo. Prácticas automatizadas para integrar cambios de código y desplegar aplicaciones.

**Cosmos DB**  
Servicio de base de datos multimodelo y globalmente distribuido de Azure que ofrece SLA integrales para rendimiento, latencia, disponibilidad y consistencia.

**Configuration**  
Ajustes y parámetros que controlan el comportamiento de la aplicación y las opciones de despliegue.

## D

**Deployment**  
El proceso de instalar y configurar aplicaciones y sus dependencias en la infraestructura objetivo.

**Docker**  
Plataforma para desarrollar, distribuir y ejecutar aplicaciones usando tecnología de contenedores.

**Dockerfile**  
Archivo de texto que contiene instrucciones para crear una imagen de contenedor Docker.

## E

**Environment**  
Un objetivo de despliegue que representa una instancia específica de su aplicación (por ejemplo, desarrollo, staging, producción).

**Environment Variables**  
Valores de configuración almacenados como pares clave-valor que las aplicaciones pueden acceder en tiempo de ejecución.

**Endpoint**  
URL o dirección de red donde se puede acceder a una aplicación o servicio.

## F

**Function App**  
Servicio de cómputo serverless de Azure que permite ejecutar código impulsado por eventos sin gestionar la infraestructura.

## G

**GitHub Actions**  
Plataforma de CI/CD integrada con repositorios de GitHub para automatizar flujos de trabajo.

**Git**  
Sistema de control de versiones distribuido usado para rastrear cambios en el código fuente.

## H

**Hooks**  
Scripts o comandos personalizados que se ejecutan en puntos específicos durante el ciclo de vida del despliegue (preprovision, postprovision, predeploy, postdeploy).

**Host**  
El tipo de servicio de Azure donde se desplegará una aplicación (por ejemplo, appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Práctica de definir y gestionar infraestructura mediante código en lugar de procesos manuales.

**Init**  
El proceso de inicializar un nuevo proyecto azd, típicamente a partir de una plantilla.

## J

**JSON**  
JavaScript Object Notation. Formato de intercambio de datos comúnmente usado para archivos de configuración y respuestas de API.

**JWT**  
JSON Web Token. Estándar para transmitir información de manera segura entre partes como un objeto JSON.

## K

**Key Vault**  
Servicio de Azure para almacenar y gestionar de forma segura secretos, claves y certificados.

**Kusto Query Language (KQL)**  
Lenguaje de consulta usado para analizar datos en Azure Monitor, Application Insights y otros servicios de Azure.

## L

**Load Balancer**  
Servicio que distribuye el tráfico de red entrante entre múltiples servidores o instancias.

**Log Analytics**  
Servicio de Azure para recoger, analizar y actuar sobre datos de telemetría desde entornos en la nube y on-premises.

## M

**Managed Identity**  
Funcionalidad de Azure que proporciona a los servicios de Azure una identidad gestionada automáticamente para autenticarse en otros servicios de Azure.

**Microservices**  
Enfoque arquitectónico donde las aplicaciones se construyen como una colección de servicios pequeños e independientes.

**Monitor**  
Solución unificada de monitorización de Azure que proporciona observabilidad de pila completa sobre aplicaciones e infraestructura.

## N

**Node.js**  
Entorno de ejecución de JavaScript construido sobre el motor V8 de Chrome para crear aplicaciones del lado del servidor.

**npm**  
Gestor de paquetes para Node.js que administra dependencias y paquetes.

## O

**Output**  
Valores devueltos por el despliegue de infraestructura que pueden ser usados por aplicaciones u otros recursos.

## P

**Package**  
El proceso de preparar el código de la aplicación y sus dependencias para el despliegue.

**Parameters**  
Valores de entrada pasados a las plantillas de infraestructura para personalizar los despliegues.

**PostgreSQL**  
Sistema de gestión de bases de datos relacional de código abierto soportado como servicio gestionado en Azure.

**Provisioning**  
Proceso de crear y configurar recursos de Azure definidos en las plantillas de infraestructura.

## Q

**Quota**  
Límites sobre la cantidad de recursos que se pueden crear en una suscripción o región de Azure.

## R

**Resource Group**  
Contenedor lógico para recursos de Azure que comparten el mismo ciclo de vida, permisos y políticas.

**Resource Token**  
Cadena única generada por azd para asegurar que los nombres de recursos sean únicos entre despliegues.

**REST API**  
Estilo arquitectónico para diseñar aplicaciones en red usando métodos HTTP.

**Rollback**  
Proceso de revertir a una versión anterior de una aplicación o configuración de infraestructura.

## S

**Service**  
Componente de su aplicación definido en azure.yaml (por ejemplo, frontend web, API backend, base de datos).

**SKU**  
Stock Keeping Unit. Representa diferentes niveles de servicio o rendimiento para recursos de Azure.

**SQL Database**  
Servicio gestionado de base de datos relacional de Azure basado en Microsoft SQL Server.

**Static Web Apps**  
Servicio de Azure para construir y desplegar aplicaciones web completas desde repositorios de código fuente.

**Storage Account**  
Servicio de Azure que proporciona almacenamiento en la nube para objetos de datos que incluyen blobs, archivos, colas y tablas.

**Subscription**  
Contenedor de cuenta de Azure que agrupa resource groups y recursos, con facturación y gestión de acceso asociadas.

## T

**Template**  
Estructura de proyecto preconstruida que contiene código de aplicación, definiciones de infraestructura y configuración para escenarios comunes.

**Terraform**  
Herramienta de Infraestructura como Código de código abierto que soporta múltiples proveedores de nube, incluido Azure.

**Traffic Manager**  
Equilibrador de carga basado en DNS de Azure para distribuir tráfico entre regiones globales de Azure.

## U

**URI**  
Uniform Resource Identifier. Cadena que identifica un recurso particular.

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
Funcionalidad de Azure que muestra qué cambios se harían en un despliegue sin ejecutarlo realmente.

## Y

**YAML**  
YAML Ain't Markup Language. Estándar de serialización de datos legible por humanos usado para archivos de configuración como azure.yaml.

## Z

**Zone**  
Ubicaciones físicamente separadas dentro de una región de Azure que proporcionan redundancia y alta disponibilidad.

---

## Acrónimos Comunes

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory (now Microsoft Entra ID) | Servicio de gestión de identidad y acceso |
| ACR | Azure Container Registry | Servicio de registro de imágenes de contenedores |
| AKS | Azure Kubernetes Service | Servicio gestionado de Kubernetes |
| API | Application Programming Interface | Conjunto de protocolos para construir software |
| ARM | Azure Resource Manager | Servicio de despliegue y gestión de Azure |
| CDN | Content Delivery Network | Red distribuida de servidores |
| CI/CD | Continuous Integration/Continuous Deployment | Prácticas de desarrollo automatizadas |
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
| URL | Uniform Resource Locator | Tipo de URI que especifica la ubicación del recurso |
| VM | Virtual Machine | Emulación de un sistema informático |
| VNet | Virtual Network | Red privada en Azure |
| YAML | YAML Ain't Markup Language | Estándar de serialización de datos |

---

## Asignaciones de Nombres de Servicios de Azure

| Common Name | Official Azure Service Name | azd Host Type |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Términos Específicos del Contexto

### Términos de Desarrollo
- **Hot Reload**: Actualización automática de aplicaciones durante el desarrollo sin reinicio
- **Build Pipeline**: Proceso automatizado para compilar y probar código
- **Deployment Slot**: Entorno de staging dentro de un App Service
- **Environment Parity**: Mantener entornos de desarrollo, staging y producción similares

### Términos de Seguridad
- **Managed Identity**: Funcionalidad de Azure que proporciona gestión automática de credenciales
- **Key Vault**: Almacenamiento seguro para secretos, claves y certificados
- **RBAC**: Control de acceso basado en roles para recursos de Azure
- **Network Security Group**: Cortafuegos virtual para controlar el tráfico de red

### Términos de Monitorización
- **Telemetry**: Recopilación automatizada de métricas y datos
- **Application Performance Monitoring (APM)**: Monitorización del rendimiento del software
- **Log Analytics**: Servicio para recopilar y analizar datos de registros
- **Alert Rules**: Notificaciones automáticas basadas en métricas o condiciones

### Términos de Despliegue
- **Blue-Green Deployment**: Estrategia de despliegue sin tiempo de inactividad
- **Canary Deployment**: Implementación gradual a un subconjunto de usuarios
- **Rolling Update**: Reemplazo secuencial de instancias de la aplicación
- **Rollback**: Reversión a una versión anterior de la aplicación

---

**Consejo de uso**: Use `Ctrl+F` para buscar rápidamente términos específicos en este glosario. Los términos están referenciados entre sí cuando procede.

---

**Navegación**
- **Lección anterior**: [Hoja de referencia](cheat-sheet.md)
- **Siguiente lección**: [Preguntas frecuentes](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
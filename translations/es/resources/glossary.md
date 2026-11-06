# Glosario - Terminología de Azure y AZD

**Referencia para todos los capítulos**
- **📚 Inicio del curso**: [AZD Para Principiantes](../README.md)
- **📖 Aprender lo básico**: [Capítulo 1: Conceptos básicos de AZD](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 Términos de IA**: [Capítulo 2: Desarrollo con IA en primer plano](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Introducción

Este glosario completo ofrece definiciones para términos, conceptos y acrónimos usados en Azure Developer CLI y desarrollo en la nube Azure. Referencia esencial para entender documentación técnica, resolver problemas y comunicarse eficazmente sobre proyectos azd y servicios Azure.

## Objetivos de aprendizaje

Al usar este glosario, usted:
- Comprenderá la terminología y conceptos esenciales de Azure Developer CLI
- Dominará el vocabulario y términos técnicos del desarrollo en la nube Azure
- Referenciará eficazmente la terminología de Infraestructura como Código y despliegue
- Comprenderá nombres de servicios Azure, acrónimos y sus propósitos
- Accederá a definiciones para términos de solución de problemas y depuración
- Aprenderá conceptos avanzados de arquitectura y desarrollo Azure

## Resultados de aprendizaje

Con referencia regular a este glosario, podrá:
- Comunicar eficazmente usando terminología correcta de Azure Developer CLI
- Entender documentación técnica y mensajes de error con mayor claridad
- Navegar con confianza en servicios y conceptos Azure
- Solucionar problemas usando vocabulario técnico apropiado
- Contribuir en discusiones de equipo con lenguaje técnico preciso
- Expandir sistemáticamente su conocimiento en desarrollo en la nube Azure

## A

**Plantilla ARM**  
Plantilla de Azure Resource Manager. Formato JSON de Infraestructura como Código usado para definir y desplegar recursos Azure de manera declarativa.

**App Service**  
Oferta plataforma como servicio (PaaS) de Azure para alojar aplicaciones web, APIs REST y backend móviles sin gestionar infraestructura.

**Application Insights**  
Servicio de monitoreo de rendimiento de aplicaciones (APM) de Azure que proporciona información profunda sobre rendimiento, disponibilidad y uso de aplicaciones.

**Azure CLI**  
Interfaz de línea de comandos para gestionar recursos Azure. Complementa a AZD pero tiene un inicio de sesión separado; la autenticación principal de AZD usa `azd auth login`.

**Azure Developer CLI (azd)**  
Herramienta de línea de comandos centrada en desarrolladores que acelera el proceso de construir y desplegar aplicaciones en Azure usando plantillas e Infraestructura como Código.

**azure.yaml**  
Archivo principal de configuración de un proyecto azd que define servicios, infraestructura y hooks de despliegue.

**Azure Resource Manager (ARM)**  
Servicio de despliegue y administración de Azure que proporciona una capa de gestión para crear, actualizar y eliminar recursos.

## B

**Bicep**  
Lenguaje específico del dominio (DSL) desarrollado por Microsoft para desplegar recursos Azure. Proporciona sintaxis más simple que las plantillas ARM y se compila a ARM.

**Compilación (Build)**  
Proceso de compilar código fuente, instalar dependencias y preparar aplicaciones para despliegue.

**Despliegue azul-verde**  
Estrategia de despliegue que usa dos entornos de producción idénticos (azul y verde) para minimizar el tiempo de inactividad y riesgos.

## C

**Container Apps**  
Servicio de contenedores sin servidor de Azure que permite ejecutar aplicaciones contenerizadas sin gestionar infraestructura compleja.

**CI/CD**  
Integración Continua / Despliegue Continuo. Prácticas automatizadas para integrar cambios de código y desplegar aplicaciones.

**Cosmos DB**  
Servicio de base de datos multimodelo distribuida globalmente de Azure que ofrece acuerdos de nivel de servicio completos para rendimiento, latencia, disponibilidad y consistencia.

**Configuración**  
Ajustes y parámetros que controlan el comportamiento de la aplicación y opciones de despliegue.

## D

**Despliegue**  
Proceso de instalar y configurar aplicaciones y sus dependencias en la infraestructura objetivo.

**Docker**  
Plataforma para desarrollar, distribuir y ejecutar aplicaciones usando tecnología de contenedores.

**Dockerfile**  
Archivo de texto que contiene instrucciones para construir una imagen de contenedor Docker.

## E

**Entorno**  
Destino de despliegue que representa una instancia específica de su aplicación (por ejemplo, desarrollo, pruebas, producción).

**Variables de entorno**  
Valores de configuración almacenados como pares clave-valor que las aplicaciones pueden acceder en tiempo de ejecución.

**Punto final (Endpoint)**  
URL o dirección de red donde una aplicación o servicio puede ser accedido.

## F

**Function App**  
Servicio de cómputo sin servidor de Azure que permite ejecutar código impulsado por eventos sin gestionar infraestructura.

## G

**GitHub Actions**  
Plataforma de CI/CD integrada con repositorios GitHub para automatizar flujos de trabajo.

**Git**  
Sistema distribuido de control de versiones usado para rastrear cambios en código fuente.

## H

**Hooks**  
Scripts o comandos personalizados que se ejecutan en puntos específicos durante el ciclo de vida del despliegue (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Tipo de servicio Azure donde se desplegará una aplicación (por ejemplo, appservice, containerapp, function).

## I

**Infraestructura como Código (IaC)**  
Práctica de definir y gestionar infraestructura mediante código en lugar de procesos manuales.

**Init**  
Proceso de inicializar un nuevo proyecto azd, típicamente a partir de una plantilla.

## J

**JSON**  
Notación de objetos de JavaScript. Formato de intercambio de datos común para archivos de configuración y respuestas API.

**JWT**  
JSON Web Token. Estándar para transmitir información de forma segura entre partes como un objeto JSON.

## K

**Key Vault**  
Servicio de Azure para almacenar y gestionar secretos, claves y certificados de forma segura.

**Kusto Query Language (KQL)**  
Lenguaje de consulta usado para analizar datos en Azure Monitor, Application Insights y otros servicios Azure.

## L

**Balanceador de carga**  
Servicio que distribuye el tráfico de red entrante entre varios servidores o instancias.

**Log Analytics**  
Servicio Azure para recolectar, analizar y actuar sobre datos de telemetría de entornos en la nube y locales.

## M

**Identidad administrada**  
Función de Azure que proporciona a los servicios de Azure una identidad automáticamente gestionada para autenticarse en otros servicios Azure.

**Microservicios**  
Enfoque arquitectónico donde las aplicaciones se construyen como una colección de servicios pequeños e independientes.

**Monitor**  
Solución unificada de monitoreo de Azure que ofrece observabilidad completa de aplicaciones e infraestructura.

## N

**Node.js**  
Entorno de ejecución JavaScript construido sobre el motor V8 de Chrome para crear aplicaciones del lado servidor.

**npm**  
Gestor de paquetes para Node.js que administra dependencias y paquetes.

## O

**Salida (Output)**  
Valores devueltos del despliegue de infraestructura que pueden ser usados por aplicaciones u otros recursos.

## P

**Paquete (Package)**  
Proceso de preparar código de aplicación y dependencias para despliegue.

**Parámetros**  
Valores de entrada pasados a plantillas de infraestructura para personalizar despliegues.

**PostgreSQL**  
Sistema de base de datos relacional de código abierto soportado como servicio gestionado en Azure.

**Provisionamiento**  
Proceso de crear y configurar recursos Azure definidos en plantillas de infraestructura.

## Q

**Cuota (Quota)**  
Límites en la cantidad de recursos que se pueden crear en una suscripción o región Azure.

## R

**Grupo de recursos**  
Contenedor lógico para recursos Azure que comparten mismo ciclo de vida, permisos y políticas.

**Token de recurso**  
Cadena única generada por azd para asegurar que nombres de recursos sean únicos en los despliegues.

**REST API**  
Estilo arquitectónico para diseñar aplicaciones en red usando métodos HTTP.

**Reversión (Rollback)**  
Proceso de revertir a una versión anterior de una aplicación o configuración de infraestructura.

## S

**Servicio**  
Componente de su aplicación definido en azure.yaml (por ejemplo, frontend web, backend API, base de datos).

**SKU**  
Unidad de mantenimiento de stock. Representa diferentes niveles o tamaños de servicio para recursos Azure.

**Base de datos SQL**  
Servicio de base de datos relacional gestionada de Azure basado en Microsoft SQL Server.

**Static Web Apps**  
Servicio Azure para construir y desplegar aplicaciones web full-stack desde repositorios de código fuente.

**Cuenta de almacenamiento**  
Servicio Azure que ofrece almacenamiento en la nube para objetos de datos incluyendo blobs, archivos, colas y tablas.

**Suscripción**  
Contenedor de cuenta Azure que posee grupos de recursos y recursos, con facturación y gestión de acceso asociadas.

## T

**Plantilla (Template)**  
Estructura de proyecto predefinida que contiene código de aplicación, definiciones de infraestructura y configuración para escenarios comunes.

**Terraform**  
Herramienta Open Source de Infraestructura como Código que soporta múltiples proveedores cloud, incluyendo Azure.

**Traffic Manager**  
Balanceador de carga de tráfico basado en DNS de Azure para distribuir tráfico entre regiones globales Azure.

## U

**URI**  
Identificador Uniforme de Recursos. Cadena que identifica un recurso particular.

**URL**  
Localizador Uniforme de Recursos. Tipo de URI que especifica dónde se encuentra un recurso y cómo obtenerlo.

## V

**Red Virtual (VNet)**  
Elemento fundamental para redes privadas en Azure, que proporciona aislamiento y segmentación.

**VS Code**  
Visual Studio Code. Editor de código popular con excelente integración de Azure y azd.

## W

**Webhook**  
Callback HTTP disparado por eventos específicos, comúnmente usado en pipelines CI/CD.

**What-if**  
Función de Azure que muestra qué cambios haría un despliegue sin ejecutarlo realmente.

## Y

**YAML**  
YAML Ain't Markup Language. Estándar de serialización de datos legible por humanos usado para archivos de configuración como azure.yaml.

## Z

**Zona**  
Ubicaciones físicamente separadas dentro de una región Azure que proveen redundancia y alta disponibilidad.

---

## Acrónimos comunes

| Acrónimo | Forma completa | Descripción |
|---------|-----------|-------------|
| AAD | Azure Active Directory (ahora Microsoft Entra ID) | Servicio de gestión de identidades y acceso |
| ACR | Azure Container Registry | Servicio de registro de imágenes de contenedor |
| AKS | Azure Kubernetes Service | Servicio gestionado de Kubernetes |
| API | Application Programming Interface | Conjunto de protocolos para construir software |
| ARM | Azure Resource Manager | Servicio de despliegue y administración de Azure |
| CDN | Content Delivery Network | Red distribuida de servidores |
| CI/CD | Integración Continua / Despliegue Continuo | Prácticas automáticas de desarrollo |
| CLI | Interfaz de Línea de Comandos | Interfaz de usuario basada en texto |
| DNS | Domain Name System | Sistema para traducir nombres de dominio a direcciones IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versión segura de HTTP |
| IaC | Infraestructura como Código | Gestión de infraestructura mediante código |
| JSON | Notación de Objetos JavaScript | Formato de intercambio de datos |
| JWT | JSON Web Token | Formato de token para transmisión segura de información |
| KQL | Kusto Query Language | Lenguaje de consulta para servicios de datos Azure |
| RBAC | Control de Acceso Basado en Roles | Método de control de acceso basado en roles de usuario |
| REST | Representational State Transfer | Estilo arquitectónico para servicios web |
| SDK | Kit de Desarrollo de Software | Colección de herramientas para desarrollo |
| SLA | Acuerdo de Nivel de Servicio | Compromiso sobre disponibilidad/rendimiento de servicio |
| SQL | Lenguaje de Consulta Estructurado | Lenguaje para gestionar bases de datos relacionales |
| SSL/TLS | Secure Sockets Layer / Transport Layer Security | Protocolos criptográficos |
| URI | Identificador Uniforme de Recursos | Cadena que identifica un recurso |
| URL | Localizador Uniforme de Recursos | Tipo de URI que especifica ubicación del recurso |
| VM | Máquina Virtual | Emulación de un sistema informático |
| VNet | Red Virtual | Red privada en Azure |
| YAML | YAML Ain't Markup Language | Estándar de serialización de datos |

---

## Mapeo de nombres de servicio Azure

| Nombre común | Nombre oficial del servicio Azure | Tipo de host azd |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Sitio estático | Azure Static Web Apps | `staticwebapp` |
| Base de datos | Azure Database for PostgreSQL | Recurso de infraestructura, no aplicación `host` |
| Base de datos NoSQL | Azure Cosmos DB | Recurso de infraestructura, no aplicación `host` |
| Almacenamiento | Azure Storage Account | Recurso de infraestructura, no aplicación integrada `host` |
| Caché | Azure Managed Redis | Recurso de infraestructura, no aplicación `host` |
| Búsqueda | Azure AI Search | Recurso de infraestructura, no aplicación `host` |
| Mensajería | Azure Service Bus | Recurso de infraestructura, no aplicación `host` |

`services.<name>.host` selecciona un destino de despliegue de aplicación; no es un atajo para ningún tipo de recurso Azure. Bases de datos, cachés, servicios de búsqueda y colas normalmente se aprovisionan mediante el proveedor de infraestructura y se conectan a la aplicación mediante salidas/configuración.

---

## Términos específicos de contexto

### Términos de desarrollo
- **Recarga en caliente (Hot Reload)**: Actualización automática de aplicaciones durante el desarrollo sin reinicio
- **Pipeline de compilación**: Proceso automático para compilar y probar código
- **Slot de despliegue**: Entorno de pruebas dentro de un App Service
- **Paridad de entornos**: Mantener similares los entornos de desarrollo, pruebas y producción

### Términos de seguridad
- **Identidad administrada**: Función Azure que proporciona gestión automática de credenciales
- **Key Vault**: Almacenamiento seguro para secretos, claves y certificados
- **RBAC**: Control de acceso basado en roles para recursos Azure
- **Grupo de seguridad de red**: Cortafuegos virtual para controlar tráfico de red

### Términos de monitoreo
- **Telemetría**: Recolección automática de mediciones y datos
- **Monitoreo de desempeño de aplicaciones (APM)**: Monitoreo del rendimiento del software
- **Log Analytics**: Servicio para colectar y analizar datos de logs
- **Reglas de alerta**: Notificaciones automáticas basadas en métricas o condiciones

### Términos de despliegue
- **Despliegue azul-verde**: Estrategia de despliegue sin tiempo de inactividad
- **Despliegue Canary**: Lanzamiento gradual a un subconjunto de usuarios
- **Actualización progresiva**: Reemplazo secuencial de instancias de aplicación
- **Reversión (Rollback)**: Volver a versión anterior de la aplicación

---

**Consejo de uso**: Use `Ctrl+F` para buscar rápidamente términos específicos en este glosario. Los términos están cruzados donde aplica.

---

**Navegación**
- **Lección anterior**: [Hoja de referencia](cheat-sheet.md)
- **Próxima lección**: [Preguntas frecuentes](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
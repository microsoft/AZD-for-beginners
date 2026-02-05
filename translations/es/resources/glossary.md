# Glosario - Terminología de Azure y AZD

**Referencia para Todos los Capítulos**  
- **📚 Inicio del Curso**: [AZD Para Principiantes](../README.md)  
- **📖 Aprende lo Básico**: [Capítulo 1: Fundamentos de AZD](../docs/getting-started/azd-basics.md)  
- **🤖 Términos de IA**: [Capítulo 2: Desarrollo con IA Primero](../docs/ai-foundry/azure-ai-foundry-integration.md)  

## Introducción

Este glosario completo proporciona definiciones de términos, conceptos y acrónimos utilizados en Azure Developer CLI y en el desarrollo en la nube de Azure. Es una referencia esencial para comprender la documentación técnica, resolver problemas y comunicarse eficazmente sobre proyectos azd y servicios de Azure.

## Objetivos de Aprendizaje

Al utilizar este glosario, podrás:  
- Comprender la terminología y los conceptos esenciales de Azure Developer CLI  
- Dominar el vocabulario y los términos técnicos del desarrollo en la nube de Azure  
- Referenciar de manera eficiente la terminología de Infraestructura como Código y despliegue  
- Comprender los nombres, acrónimos y propósitos de los servicios de Azure  
- Acceder a definiciones para resolver problemas y depurar errores  
- Aprender conceptos avanzados de arquitectura y desarrollo en Azure  

## Resultados de Aprendizaje

Con el uso regular de este glosario, serás capaz de:  
- Comunicarte eficazmente utilizando la terminología adecuada de Azure Developer CLI  
- Comprender con mayor claridad la documentación técnica y los mensajes de error  
- Navegar por los servicios y conceptos de Azure con confianza  
- Resolver problemas utilizando el vocabulario técnico apropiado  
- Contribuir a discusiones de equipo con un lenguaje técnico preciso  
- Ampliar sistemáticamente tu conocimiento sobre el desarrollo en la nube de Azure  

## A

**Plantilla ARM**  
Plantilla de Azure Resource Manager. Formato JSON de Infraestructura como Código utilizado para definir y desplegar recursos de Azure de manera declarativa.

**App Service**  
Oferta de plataforma como servicio (PaaS) de Azure para alojar aplicaciones web, APIs REST y backends móviles sin necesidad de gestionar infraestructura.

**Application Insights**  
Servicio de monitoreo del rendimiento de aplicaciones (APM) de Azure que proporciona información detallada sobre el rendimiento, la disponibilidad y el uso de las aplicaciones.

**Azure CLI**  
Interfaz de línea de comandos para gestionar recursos de Azure. Utilizada por azd para autenticación y algunas operaciones.

**Azure Developer CLI (azd)**  
Herramienta de línea de comandos centrada en desarrolladores que acelera el proceso de creación y despliegue de aplicaciones en Azure utilizando plantillas e Infraestructura como Código.

**azure.yaml**  
Archivo de configuración principal de un proyecto azd que define servicios, infraestructura y hooks de despliegue.

**Azure Resource Manager (ARM)**  
Servicio de despliegue y gestión de Azure que proporciona una capa de gestión para crear, actualizar y eliminar recursos.

## B

**Bicep**  
Lenguaje específico de dominio (DSL) desarrollado por Microsoft para desplegar recursos de Azure. Ofrece una sintaxis más sencilla que las plantillas ARM mientras se compila en ARM.

**Compilación**  
Proceso de compilar código fuente, instalar dependencias y preparar aplicaciones para su despliegue.

**Despliegue Azul-Verde**  
Estrategia de despliegue que utiliza dos entornos de producción idénticos (azul y verde) para minimizar el tiempo de inactividad y el riesgo.

## C

**Container Apps**  
Servicio sin servidor de contenedores de Azure que permite ejecutar aplicaciones en contenedores sin gestionar infraestructura compleja.

**CI/CD**  
Integración Continua/Despliegue Continuo. Prácticas automatizadas para integrar cambios de código y desplegar aplicaciones.

**Cosmos DB**  
Servicio de base de datos globalmente distribuida y multimodelo de Azure que ofrece SLA completos para rendimiento, latencia, disponibilidad y consistencia.

**Configuración**  
Ajustes y parámetros que controlan el comportamiento de la aplicación y las opciones de despliegue.

## D

**Despliegue**  
Proceso de instalar y configurar aplicaciones y sus dependencias en la infraestructura objetivo.

**Docker**  
Plataforma para desarrollar, enviar y ejecutar aplicaciones utilizando tecnología de contenedores.

**Dockerfile**  
Archivo de texto que contiene instrucciones para construir una imagen de contenedor Docker.

## E

**Entorno**  
Destino de despliegue que representa una instancia específica de tu aplicación (por ejemplo, desarrollo, pruebas, producción).

**Variables de Entorno**  
Valores de configuración almacenados como pares clave-valor a los que las aplicaciones pueden acceder en tiempo de ejecución.

**Punto Final**  
URL o dirección de red donde se puede acceder a una aplicación o servicio.

## F

**Function App**  
Servicio de cómputo sin servidor de Azure que permite ejecutar código basado en eventos sin gestionar infraestructura.

## G

**GitHub Actions**  
Plataforma de CI/CD integrada con repositorios de GitHub para automatizar flujos de trabajo.

**Git**  
Sistema de control de versiones distribuido utilizado para rastrear cambios en el código fuente.

## H

**Hooks**  
Scripts o comandos personalizados que se ejecutan en puntos específicos durante el ciclo de vida del despliegue (preprovision, postprovision, predeploy, postdeploy).

**Host**  
El tipo de servicio de Azure donde se desplegará una aplicación (por ejemplo, appservice, containerapp, function).

## I

**Infraestructura como Código (IaC)**  
Práctica de definir y gestionar infraestructura a través de código en lugar de procesos manuales.

**Init**  
Proceso de inicializar un nuevo proyecto azd, típicamente desde una plantilla.

## J

**JSON**  
Notación de Objetos de JavaScript. Formato de intercambio de datos comúnmente utilizado para archivos de configuración y respuestas de API.

**JWT**  
Token Web JSON. Estándar para transmitir información de manera segura entre partes como un objeto JSON.

## K

**Key Vault**  
Servicio de Azure para almacenar y gestionar de forma segura secretos, claves y certificados.

**Lenguaje de Consulta Kusto (KQL)**  
Lenguaje de consulta utilizado para analizar datos en Azure Monitor, Application Insights y otros servicios de Azure.

## L

**Balanceador de Carga**  
Servicio que distribuye el tráfico de red entrante entre múltiples servidores o instancias.

**Log Analytics**  
Servicio de Azure para recopilar, analizar y actuar sobre datos de telemetría de entornos en la nube y locales.

## M

**Identidad Administrada**  
Función de Azure que proporciona a los servicios de Azure una identidad gestionada automáticamente para autenticarse en otros servicios de Azure.

**Microservicios**  
Enfoque arquitectónico donde las aplicaciones se construyen como una colección de pequeños servicios independientes.

**Monitor**  
Solución de monitoreo unificada de Azure que proporciona observabilidad de pila completa en aplicaciones e infraestructura.

## N

**Node.js**  
Entorno de ejecución de JavaScript basado en el motor V8 de Chrome para construir aplicaciones del lado del servidor.

**npm**  
Gestor de paquetes para Node.js que gestiona dependencias y paquetes.

## O

**Salida**  
Valores devueltos por el despliegue de infraestructura que pueden ser utilizados por aplicaciones u otros recursos.

## P

**Paquete**  
Proceso de preparar el código de la aplicación y sus dependencias para el despliegue.

**Parámetros**  
Valores de entrada pasados a plantillas de infraestructura para personalizar despliegues.

**PostgreSQL**  
Sistema de base de datos relacional de código abierto soportado como servicio gestionado en Azure.

**Aprovisionamiento**  
Proceso de crear y configurar recursos de Azure definidos en plantillas de infraestructura.

## Q

**Cuota**  
Límites en la cantidad de recursos que se pueden crear en una suscripción o región de Azure.

## R

**Grupo de Recursos**  
Contenedor lógico para recursos de Azure que comparten el mismo ciclo de vida, permisos y políticas.

**Token de Recurso**  
Cadena única generada por azd para garantizar que los nombres de los recursos sean únicos en los despliegues.

**API REST**  
Estilo arquitectónico para diseñar aplicaciones en red utilizando métodos HTTP.

**Reversión**  
Proceso de volver a una versión anterior de una aplicación o configuración de infraestructura.

## S

**Servicio**  
Un componente de tu aplicación definido en azure.yaml (por ejemplo, frontend web, backend API, base de datos).

**SKU**  
Unidad de Mantenimiento de Stock. Representa diferentes niveles de servicio o rendimiento para recursos de Azure.

**Base de Datos SQL**  
Servicio de base de datos relacional gestionado de Azure basado en Microsoft SQL Server.

**Aplicaciones Web Estáticas**  
Servicio de Azure para construir y desplegar aplicaciones web de pila completa desde repositorios de código fuente.

**Cuenta de Almacenamiento**  
Servicio de Azure que proporciona almacenamiento en la nube para objetos de datos como blobs, archivos, colas y tablas.

**Suscripción**  
Contenedor de cuenta de Azure que contiene grupos de recursos y recursos, con gestión asociada de facturación y acceso.

## T

**Plantilla**  
Estructura de proyecto preconstruida que contiene código de aplicación, definiciones de infraestructura y configuración para escenarios comunes.

**Terraform**  
Herramienta de Infraestructura como Código de código abierto que soporta múltiples proveedores de nube, incluido Azure.

**Traffic Manager**  
Balanceador de carga basado en DNS de Azure para distribuir tráfico entre regiones globales de Azure.

## U

**URI**  
Identificador Uniforme de Recursos. Cadena que identifica un recurso en particular.

**URL**  
Localizador Uniforme de Recursos. Tipo de URI que especifica dónde se encuentra un recurso y cómo recuperarlo.

## V

**Red Virtual (VNet)**  
Bloque fundamental para redes privadas en Azure, proporcionando aislamiento y segmentación.

**VS Code**  
Visual Studio Code. Editor de código popular con excelente integración con Azure y azd.

## W

**Webhook**  
Callback HTTP activado por eventos específicos, comúnmente utilizado en pipelines de CI/CD.

**What-if**  
Función de Azure que muestra qué cambios se realizarían en un despliegue sin ejecutarlo realmente.

## Y

**YAML**  
YAML No es un Lenguaje de Marcado. Estándar de serialización de datos legible para humanos utilizado para archivos de configuración como azure.yaml.

## Z

**Zona**  
Ubicaciones físicamente separadas dentro de una región de Azure que proporcionan redundancia y alta disponibilidad.

---

## Acrónimos Comunes

| Acrónimo | Forma Completa | Descripción |
|---------|----------------|-------------|
| AAD | Azure Active Directory | Servicio de gestión de identidad y acceso |
| ACR | Azure Container Registry | Servicio de registro de imágenes de contenedores |
| AKS | Azure Kubernetes Service | Servicio gestionado de Kubernetes |
| API | Interfaz de Programación de Aplicaciones | Conjunto de protocolos para construir software |
| ARM | Azure Resource Manager | Servicio de despliegue y gestión de Azure |
| CDN | Red de Entrega de Contenido | Red distribuida de servidores |
| CI/CD | Integración Continua/Despliegue Continuo | Prácticas de desarrollo automatizadas |
| CLI | Interfaz de Línea de Comandos | Interfaz de usuario basada en texto |
| DNS | Sistema de Nombres de Dominio | Sistema para traducir nombres de dominio a direcciones IP |
| HTTPS | Protocolo Seguro de Transferencia de Hipertexto | Versión segura de HTTP |
| IaC | Infraestructura como Código | Gestión de infraestructura a través de código |
| JSON | Notación de Objetos de JavaScript | Formato de intercambio de datos |
| JWT | Token Web JSON | Formato de token para transmisión segura de información |
| KQL | Lenguaje de Consulta Kusto | Lenguaje de consulta para servicios de datos de Azure |
| RBAC | Control de Acceso Basado en Roles | Método de control de acceso basado en roles de usuario |
| REST | Transferencia de Estado Representacional | Estilo arquitectónico para servicios web |
| SDK | Kit de Desarrollo de Software | Conjunto de herramientas de desarrollo |
| SLA | Acuerdo de Nivel de Servicio | Compromiso con la disponibilidad/rendimiento del servicio |
| SQL | Lenguaje de Consulta Estructurada | Lenguaje para gestionar bases de datos relacionales |
| SSL/TLS | Capa de Conexión Segura/Seguridad de la Capa de Transporte | Protocolos criptográficos |
| URI | Identificador Uniforme de Recursos | Cadena que identifica un recurso |
| URL | Localizador Uniforme de Recursos | Tipo de URI que especifica la ubicación de un recurso |
| VM | Máquina Virtual | Emulación de un sistema informático |
| VNet | Red Virtual | Red privada en Azure |
| YAML | YAML No es un Lenguaje de Marcado | Estándar de serialización de datos |

---

## Mapeo de Nombres de Servicios de Azure

| Nombre Común | Nombre Oficial del Servicio de Azure | Tipo de Host azd |
|--------------|-------------------------------------|------------------|
| Aplicación Web | Azure App Service | `appservice` |
| Aplicación API | Azure App Service | `appservice` |
| Aplicación en Contenedor | Azure Container Apps | `containerapp` |
| Función | Azure Functions | `function` |
| Sitio Estático | Azure Static Web Apps | `staticwebapp` |
| Base de Datos | Azure Database for PostgreSQL | `postgres` |
| Base de Datos NoSQL | Azure Cosmos DB | `cosmosdb` |
| Almacenamiento | Azure Storage Account | `storage` |
| Caché | Azure Cache for Redis | `redis` |
| Búsqueda | Azure Cognitive Search | `search` |
| Mensajería | Azure Service Bus | `servicebus` |

---

## Términos Específicos del Contexto

### Términos de Desarrollo
- **Recarga en Caliente**: Actualización automática de aplicaciones durante el desarrollo sin reinicio  
- **Pipeline de Construcción**: Proceso automatizado para construir y probar código  
- **Slot de Despliegue**: Entorno de pruebas dentro de un App Service  
- **Paridad de Entorno**: Mantener similares los entornos de desarrollo, pruebas y producción  

### Términos de Seguridad
- **Identidad Administrada**: Función de Azure que proporciona gestión automática de credenciales  
- **Key Vault**: Almacenamiento seguro para secretos, claves y certificados  
- **RBAC**: Control de acceso basado en roles para recursos de Azure  
- **Grupo de Seguridad de Red**: Cortafuegos virtual para controlar el tráfico de red  

### Términos de Monitoreo
- **Telemetría**: Recopilación automatizada de mediciones y datos  
- **Monitoreo del Rendimiento de Aplicaciones (APM)**: Monitoreo del rendimiento del software  
- **Log Analytics**: Servicio para recopilar y analizar datos de registros  
- **Reglas de Alertas**: Notificaciones automáticas basadas en métricas o condiciones  

### Términos de Despliegue
- **Despliegue Azul-Verde**: Estrategia de despliegue sin tiempo de inactividad  
- **Despliegue Canary**: Implementación gradual para un subconjunto de usuarios  
- **Actualización Continua**: Reemplazo secuencial de instancias de la aplicación  
- **Reversión**: Volver a una versión anterior de la aplicación  

---

**Consejo de Uso**: Usa `Ctrl+F` para buscar rápidamente términos específicos en este glosario. Los términos están referenciados cruzadamente donde sea aplicable.

---

**Navegación**  
- **Lección Anterior**: [Hoja de Referencia](cheat-sheet.md)  
- **Próxima Lección**: [Preguntas Frecuentes](faq.md)  

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.
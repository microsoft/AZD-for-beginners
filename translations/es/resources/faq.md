# Preguntas Frecuentes (FAQ)

**Obtén ayuda por capítulo**
- **📚 Inicio del curso**: [AZD para principiantes](../README.md)
- **🚆 Problemas de instalación**: [Capítulo 1: Instalación y configuración](../docs/chapter-01-foundation/installation.md)
- **🤖 Preguntas sobre IA**: [Capítulo 2: Desarrollo con enfoque en IA](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Solución de problemas**: [Capítulo 7: Solución de problemas y depuración](../docs/chapter-07-troubleshooting/common-issues.md)

## Introducción

Esta completa FAQ proporciona respuestas a las preguntas más comunes sobre Azure Developer CLI (azd) y despliegues en Azure. Encuentra soluciones rápidas a problemas comunes, comprende las mejores prácticas y aclara conceptos y flujos de trabajo de azd.

## Objetivos de aprendizaje

Al revisar esta FAQ, podrás:
- Encontrar respuestas rápidas a preguntas y problemas comunes de Azure Developer CLI
- Entender conceptos clave y terminología a través de un formato práctico de preguntas y respuestas
- Acceder a soluciones de solución de problemas para problemas y escenarios comunes
- Aprender mejores prácticas mediante preguntas frecuentes sobre optimización
- Descubrir características y capacidades avanzadas a través de preguntas de nivel experto
- Consultar de manera eficiente guías sobre costos, seguridad y estrategia de despliegue

## Resultados de aprendizaje

Con una referencia regular a esta FAQ, podrás:
- Resolver problemas comunes de Azure Developer CLI de forma independiente usando las soluciones proporcionadas
- Tomar decisiones informadas sobre estrategias y configuraciones de despliegue
- Entender la relación entre azd y otras herramientas y servicios de Azure
- Aplicar mejores prácticas basadas en la experiencia comunitaria y recomendaciones de expertos
- Solucionar problemas de autenticación, despliegue y configuración efectivamente
- Optimizar costos y rendimiento usando las recomendaciones y conocimientos de la FAQ

## Tabla de contenidos

- [Primeros pasos](#getting-started)
- [Autenticación y acceso](#authentication--access)
- [Plantillas y proyectos](#templates--projects)
- [Despliegue e infraestructura](#deployment--infrastructure)
- [Configuración y entornos](#configuration--environments)
- [Solución de problemas](#troubleshooting)
- [Costos y facturación](#cost--billing)
- [Mejores prácticas](#best-practices)
- [Temas avanzados](#advanced-topics)

---

## Primeros pasos

### P: ¿Qué es Azure Developer CLI (azd)?
**R**: Azure Developer CLI (azd) es una herramienta de línea de comandos centrada en desarrolladores que acelera el tiempo que tardas en llevar tu aplicación desde el entorno de desarrollo local hasta Azure. Proporciona mejores prácticas mediante plantillas y ayuda en todo el ciclo de vida del despliegue.

### P: ¿En qué se diferencia azd del Azure CLI?
**R**: 
- **Azure CLI**: Herramienta de propósito general para administrar recursos de Azure
- **azd**: Herramienta enfocada en desarrolladores para flujos de trabajo de despliegue de aplicaciones
- azd tiene su propio flujo de autenticación y despliegue; Azure CLI es una herramienta separada y complementaria
- azd incluye plantillas, gestión de entornos y automatización del despliegue

### P: ¿Necesito tener instalado Azure CLI para usar azd?
**R**: No para el flujo principal de AZD. Autentícate con `azd auth login`. Instala Azure CLI por separado cuando un gancho de plantilla o un ejercicio ejecuten explícitamente comandos `az`.

### P: ¿Qué lenguajes de programación soporta azd?
**R**: azd es independiente del lenguaje. Funciona con:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Sitios web estáticos
- Aplicaciones en contenedores

### P: ¿Puedo usar azd con proyectos existentes?
**R**: ¡Sí! Puedes:
1. Usar `azd init` para agregar configuración azd a proyectos existentes
2. Adaptar proyectos existentes para que coincidan con la estructura de plantillas azd
3. Crear plantillas personalizadas basadas en tu arquitectura existente

### P: ¿Qué cambió con la disponibilidad general de la extensión Foundry?
**R**: El paquete `microsoft.foundry` alcanzó la versión 1.0 y la disponibilidad general el 5 de noviembre de 2026. Con AZD 1.37.0+, usa `azd ext install microsoft.foundry` para instalar siete extensiones principales para agentes, conexiones, inspector, proyectos, rutinas, habilidades y cajas de herramientas. No es un nuevo espacio de nombres de comando, y sus componentes tienen versiones independientes. Las evaluaciones, conjuntos de datos, ajuste fino y modelos personalizados se instalan por separado; las características de vista previa opcionales no se vuelven GA solo porque el paquete lo sea.

La [guía del agente alojado](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) usa Python 3.13+ y uv actual. `azd ai agent run` abre Agent Inspector localmente, pero las llamadas al modelo todavía usan Azure y generan cargos. El modo código `azd deploy` sube código fuente para una compilación remota sin requerir compilación local en contenedor.

### P: ¿El comando `azd down` elimina un agente alojado de un proyecto Foundry existente?
**R**: No para la ruta de proyectos reutilizados descrita en el inicio rápido del agente alojado: deja el proyecto, agente alojado y otros recursos en su lugar. Elimina recursos no deseados por separado sin eliminar recursos compartidos. Si el entorno creó un nuevo proyecto Foundry, `azd down` elimina su grupo de recursos y todo en él. Revisa la [guía de limpieza](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) y los mensajes de confirmación de eliminación antes de confirmar.

---

## Autenticación y acceso

### P: ¿Cómo me autentico con Azure usando azd?
**R**: Usa `azd auth login` que abrirá una ventana del navegador para autenticación en Azure. Para escenarios CI/CD, usa identidades administradas o principales de servicio.

### P: ¿Puedo usar azd con varias suscripciones de Azure?
**R**: Sí. Usa `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` para especificar qué suscripción usar en cada entorno.

### P: ¿Qué permisos necesito para desplegar con azd?
**R**: Normalmente necesitas:
- Rol de **Colaborador** en el grupo de recursos o suscripción
- **Administrador de acceso de usuario** si despliegas recursos que requieren asignaciones de roles
- Permisos específicos varían según plantilla y recursos desplegados

### P: ¿Puedo usar azd en pipelines CI/CD?
**R**: ¡Absolutamente! azd está diseñado para integración CI/CD. Usa principales de servicio para autenticación y configura variables de entorno para la configuración.

### P: ¿Cómo manejo la autenticación en GitHub Actions?
**R**: Prefiere la federación de identidad de carga de trabajo (OIDC), configurada con `azd pipeline config`. El flujo generado instala AZD y autentica AZD directamente con identidad federada. Un paso `azure/login` solo no establece un inicio de sesión AZD. Un paso de inicio de sesión dentro de un trabajo existente es:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Provisión o despliegue después del inicio de sesión, con el entorno AZD, suscripción y ubicación intencionados configurados. La credencial federada de la identidad debe confiar en el repositorio/ref o entorno GitHub del flujo de trabajo, y sus roles en Azure deben permitir las operaciones solicitadas.

---

## Plantillas y proyectos

### P: ¿Dónde puedo encontrar plantillas azd?
**R**: 
- Plantillas oficiales y comunitarias: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Plantillas comunitarias: búsqueda en GitHub para "azd-template"
- Usa `azd template list` para explorar plantillas disponibles

### P: ¿Cómo creo una plantilla personalizada?
**R**: 
1. Comienza con la estructura de una plantilla existente
2. Modifica `azure.yaml`, archivos de infraestructura y código de aplicación
3. Prueba exhaustivamente con `azd up`
4. Publica en GitHub con etiquetas adecuadas

### P: ¿Puedo usar azd sin plantilla?
**R**: Sí, usa `azd init` en un proyecto existente para crear los archivos de configuración necesarios. Necesitarás configurar manualmente `azure.yaml` y los archivos de infraestructura.

### P: ¿Cuál es la diferencia entre plantillas oficiales y comunitarias?
**R**: 
- **Plantillas oficiales**: Mantenidas por Microsoft, actualizadas regularmente, documentación completa
- **Plantillas comunitarias**: Creada por desarrolladores, pueden tener casos de uso especializados, calidad y mantenimiento variables

### P: ¿Cómo actualizo una plantilla en mi proyecto?
**R**: Las plantillas no se actualizan automáticamente. Puedes:
1. Comparar y fusionar manualmente cambios de la plantilla fuente
2. Empezar de nuevo con `azd init` usando la plantilla actualizada
3. Elegir mejoras específicas de las plantillas actualizadas

---

## Despliegue e infraestructura

### P: ¿Qué servicios de Azure puede desplegar azd?
**R**: azd puede desplegar cualquier servicio Azure mediante plantillas Bicep/ARM, incluyendo:
- App Services, Container Apps, Functions
- Bases de datos (SQL, PostgreSQL, Cosmos DB)
- Almacenamiento, Key Vault, Application Insights
- Redes, recursos de seguridad y monitoreo

### P: ¿Puedo desplegar en múltiples regiones?
**R**: Sí, configura múltiples regiones en tus plantillas Bicep y define el parámetro de ubicación apropiadamente para cada entorno.

### P: ¿Cómo manejo las migraciones de esquema de base de datos?
**R**: Usa ganchos de despliegue en `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### P: ¿Puedo desplegar solo infraestructura sin aplicaciones?
**R**: Sí, usa `azd provision` para desplegar solo los componentes de infraestructura definidos en tus plantillas.

### P: ¿Cómo despliego en recursos Azure existentes?
**R**: Sí, cuando la plantilla lo soporta. Referencia recursos existentes con declaraciones `existing` de Bicep o parámetros de recursos existentes documentados en la plantilla, y asigna servicios de aplicación a sus destinos previstos. Esto no importa propiedad ni crea permisos automáticamente. Revisa la plantilla antes de desplegar.

### P: ¿Puedo usar Terraform en lugar de Bicep?
**R**: Sí. AZD soporta Terraform además de Bicep. Selecciona una plantilla basada en Terraform o configura `infra.provider: terraform` en `azure.yaml`, con los archivos Terraform y configuración de estado/backend adecuados. Consulta el [flujo de trabajo Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Configuración y entornos

### P: ¿Cómo gestiono diferentes entornos (dev, staging, prod)?
**R**: Crea entornos separados con `azd env new <environment-name>` y configura diferentes ajustes para cada uno:
```bash
azd env new development
azd env new staging  
azd env new production
```

### P: ¿Dónde están almacenadas las configuraciones de entorno?
**R**: En la carpeta `.azure` dentro del directorio de tu proyecto. Cada entorno tiene su propia carpeta con archivos de configuración.

### P: ¿Cómo configuro variables específicas por entorno?
**R**: Usa `azd env set` para configurar variables de entorno:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### P: ¿Puedo compartir configuraciones de entorno entre miembros del equipo?
**R**: La carpeta `.azure` contiene información sensible y no debe ser comprometida en control de versiones. En su lugar:
1. Documenta las variables de entorno requeridas
2. Usa scripts de despliegue para configurar entornos
3. Usa Azure Key Vault para configuración sensible

### P: ¿Cómo sobreescribo los valores predeterminados de la plantilla?
**R**: Define variables de entorno que correspondan a parámetros de la plantilla:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Solo afectan a la implementación las variables consumidas por la plantilla. `SKU_NAME` arriba es un ejemplo de entrada personalizada, no una configuración universal de AZD.

---

## Solución de problemas

### P: ¿Por qué falla `azd up`?
**R**: Causas comunes:
1. **Problemas de autenticación**: Ejecuta `azd auth login`
2. **Permisos insuficientes**: Revisa tus asignaciones de rol en Azure
3. **Conflictos de nombres de recursos**: Revisa el recurso en conflicto y las entradas de nombres de la plantilla; crea un entorno separado con `azd env new` cuando se requiera aislamiento
4. **Problemas de cuota/capacidad**: Verifica disponibilidad regional
5. **Errores en plantilla**: Valida plantillas Bicep

### P: ¿Cómo depuro fallos de despliegue?
**R**: 
1. Usa `azd deploy --debug` para salida detallada
2. Revisa el historial de despliegue en el portal de Azure
3. Consulta el Registro de Actividades en el portal de Azure
4. Usa `azd show` para mostrar el estado actual del entorno

### P: ¿Por qué no funcionan mis variables de entorno?
**R**: Verifica:
1. Que los nombres de variables coincidan exactamente con los parámetros de la plantilla
2. Que los valores estén debidamente entrecomillados si contienen espacios
3. Que el entorno esté seleccionado: `azd env select <environment>`
4. Que las variables estén configuradas en el entorno correcto

### P: ¿Cómo limpio despliegues fallidos?
**R**: 
```bash
azd down
```
Revisa primero el entorno seleccionado y la confirmación de eliminación. Esto elimina recursos provisionados en Azure, no la configuración local del entorno `.azure`. `--purge` también solicita eliminación permanente de recursos con eliminación suave soportada y puede ser bloqueado por retención/protección contra purga; no es un paso rutinario para recuperación.

### P: ¿Por qué no es accesible mi aplicación tras el despliegue?
**R**: Verifica:
1. Que el despliegue haya finalizado exitosamente
2. Que la aplicación esté en ejecución (ver registros en portal Azure)
3. Que los grupos de seguridad de red permitan el tráfico
4. Que el DNS/dominios personalizados estén configurados correctamente

---

## Costos y facturación

### P: ¿Cuánto costarán los despliegues con azd?
**R**: Los costos dependen de:
- Servicios de Azure desplegados
- Niveles/SKUs de servicio seleccionados
- Diferencias regionales de precios
- Patrones de uso

Usa la [Calculadora de precios de Azure](https://azure.microsoft.com/pricing/calculator/) para estimaciones.

### P: ¿Cómo controlo los costos en despliegues azd?
**R**: 
1. Usa SKUs de nivel inferior para entornos de desarrollo
2. Establece presupuestos y alertas en Azure
3. Usa `azd down` para eliminar recursos cuando no se necesiten
4. Elige regiones apropiadas (los costos varían según ubicación)
5. Usa herramientas de administración de costos de Azure

### P: ¿Existen opciones de nivel gratuito para las plantillas azd?
**R**: Algunos servicios tienen SKU gratuitos o asignaciones mensuales, sujetos a elegibilidad, plan de alojamiento, región y límites de suscripción. Estos no hacen que toda una plantilla sea gratuita: las bases de datos, búsqueda, redes, registro, telemetría y la inferencia de modelos pueden generar cargos de manera independiente. Verifique la [lista de servicios gratuitos de Azure](https://azure.microsoft.com/free/) y los precios actuales de cada recurso antes de la implementación.

### P: ¿Cómo estimo los costos antes de la implementación?
**R**: 
1. Revise el `main.bicep` de la plantilla para ver qué recursos se crean
2. Utilice la Calculadora de Precios de Azure con los SKU específicos
3. Implemente primero en un entorno de desarrollo para monitorear los costos reales
4. Use Azure Cost Management para un análisis detallado de costos

---

## Mejores Prácticas

### P: ¿Cuáles son las mejores prácticas para la estructura de proyectos azd?
**R**: 
1. Mantenga el código de la aplicación separado de la infraestructura
2. Utilice nombres significativos para los servicios en `azure.yaml`
3. Implemente un manejo adecuado de errores en los scripts de compilación
4. Use configuración específica para cada entorno
5. Incluya documentación completa

### P: ¿Cómo debo organizar múltiples servicios en azd?
**R**: Utilice la estructura recomendada:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### P: ¿Debo incluir la carpeta `.azure` en el control de versiones?
**R**: **¡No!** La carpeta `.azure` contiene información sensible. Agréguela a `.gitignore`:
```gitignore
.azure/
```

### P: ¿Cómo manejo secretos y configuraciones sensibles?
**R**: 
1. Use Azure Key Vault para secretos
2. Referencie los secretos de Key Vault en la configuración de la aplicación
3. Nunca incluya secretos en el control de versiones
4. Use identidades administradas para autenticación entre servicios

### P: ¿Cuál es el enfoque recomendado para CI/CD con azd?
**R**: 
1. Use entornos separados para cada etapa (dev/ puesta en escena/ producción)
2. Implemente pruebas automatizadas antes de la implementación
3. Use principales de servicio para la autenticación
4. Almacene configuraciones sensibles en secretos/variables del pipeline
5. Implemente puertas de aprobación para implementaciones en producción

---

## Temas Avanzados

### P: ¿Puedo extender azd con funcionalidades personalizadas?
**R**: Sí, mediante ganchos de despliegue en `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### P: ¿Cómo integro azd con procesos DevOps existentes?
**R**: 
1. Use comandos azd en scripts de pipeline existentes
2. Estandarice las plantillas azd entre equipos
3. Integre con monitoreo y alertas existentes
4. Use la salida JSON de azd para integración con pipelines

### P: ¿Puedo usar azd con Azure DevOps?
**R**: Sí, azd funciona con cualquier sistema CI/CD. Cree pipelines de Azure DevOps que usen comandos azd.

### P: ¿Cómo contribuyo a azd o creo plantillas comunitarias?
**R**: 
1. **herramienta azd**: Contribuya a [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Plantillas**: Siga las [instrucciones de contribución a la galería Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentación**: Contribuya a los documentos en [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### P: ¿Cuál es la hoja de ruta para azd?
**R**: Consulte la [hoja de ruta oficial](https://github.com/Azure/azure-dev/projects) para características y mejoras planificadas.

### P: ¿Cómo migro de otras herramientas de despliegue a azd?
**R**: 
1. Analice la arquitectura actual de despliegue
2. Cree plantillas Bicep equivalentes
3. Configure `azure.yaml` para que coincida con los servicios actuales
4. Realice pruebas exhaustivas en el entorno de desarrollo
5. Migre los entornos gradualmente

---

## ¿Todavía tiene preguntas?

### **Busque Primero**
- Consulte la [documentación oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Busque en [problemas de GitHub](https://github.com/Azure/azure-dev/issues) problemas similares

### **Obtenga Ayuda**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Soporte de la comunidad
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Preguntas técnicas
- [Azure Discord](https://discord.gg/azure) - Chat comunitario en tiempo real

### **Reporte Problemas**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Informes de errores y solicitudes de funciones
- Incluya registros relevantes, mensajes de error y pasos para reproducir

### **Aprenda Más**
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitectura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Marco de trabajo Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Guía técnica revisada: 4 de noviembre de 2026. La disponibilidad en la nube y los precios deben verificarse para su suscripción y región.*

---

**Navegación**
- **Lección Anterior**: [Glosario](glossary.md)
- **Siguiente Lección**: [Guía de estudio](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
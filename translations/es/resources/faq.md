# Preguntas Frecuentes (FAQ)

**Obtén ayuda por capítulo**
- **📚 Página principal del curso**: [AZD para Principiantes](../README.md)
- **🚆 Problemas de instalación**: [Capítulo 1: Instalación y configuración](../docs/chapter-01-foundation/installation.md)
- **🤖 Preguntas sobre IA**: [Capítulo 2: Desarrollo centrado en IA](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Solución de problemas**: [Capítulo 7: Solución de problemas y depuración](../docs/chapter-07-troubleshooting/common-issues.md)

## Introducción

Esta completa FAQ proporciona respuestas a las preguntas más comunes sobre Azure Developer CLI (azd) y despliegues en Azure. Encuentra soluciones rápidas a problemas frecuentes, comprende las mejores prácticas y obtén aclaraciones sobre conceptos y flujos de trabajo de azd.

## Objetivos de aprendizaje

Al revisar esta FAQ, podrás:
- Encontrar respuestas rápidas a preguntas y problemas comunes de Azure Developer CLI
- Comprender conceptos clave y terminología a través de un formato práctico de preguntas y respuestas
- Acceder a soluciones de solución de problemas para problemas y errores frecuentes
- Aprender mejores prácticas mediante preguntas frecuentes sobre optimización
- Descubrir características avanzadas y capacidades a través de preguntas de nivel experto
- Consultar guías sobre costos, seguridad y estrategias de despliegue de manera eficiente

## Resultados del aprendizaje

Con referencia regular a esta FAQ, podrás:
- Resolver problemas comunes de Azure Developer CLI de forma independiente utilizando las soluciones proporcionadas
- Tomar decisiones informadas sobre estrategias y configuraciones de despliegue
- Comprender la relación entre azd y otras herramientas y servicios de Azure
- Aplicar mejores prácticas basadas en la experiencia comunitaria y recomendaciones de expertos
- Solucionar efectivamente problemas de autenticación, despliegue y configuración
- Optimizar costos y rendimiento utilizando ideas y recomendaciones de la FAQ

## Tabla de Contenidos

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
**R**: Azure Developer CLI (azd) es una herramienta de línea de comandos centrada en desarrolladores que acelera el tiempo que tardas en llevar tu aplicación desde el entorno local de desarrollo hasta Azure. Proporciona mejores prácticas mediante plantillas y ayuda con todo el ciclo de vida del despliegue.

### P: ¿En qué se diferencia azd del Azure CLI?
**R**: 
- **Azure CLI**: Herramienta de propósito general para administrar recursos de Azure
- **azd**: Herramienta enfocada en desarrolladores para flujos de trabajo de despliegue de aplicaciones
- azd tiene su propia autenticación y flujo de despliegue; Azure CLI es una herramienta separada y complementaria
- azd incluye plantillas, gestión de entornos y automatización de despliegues

### P: ¿Necesito tener instalado Azure CLI para usar azd?
**R**: No para el flujo de trabajo principal de AZD. Autentícate con `azd auth login`. Instala Azure CLI por separado cuando un gancho de plantilla o un ejercicio explícitamente ejecute comandos `az`.

### P: ¿Qué lenguajes de programación soporta azd?
**R**: azd es independiente del lenguaje. Funciona con:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Sitios web estáticos
- Aplicaciones contenerizadas

### P: ¿Puedo usar azd con proyectos existentes?
**R**: ¡Sí! Puedes:
1. Usar `azd init` para agregar configuración azd a proyectos existentes
2. Adaptar proyectos existentes para que coincidan con la estructura de plantillas azd
3. Crear plantillas personalizadas basadas en tu arquitectura existente

---

## Autenticación y acceso

### P: ¿Cómo autentico con Azure usando azd?
**R**: Usa `azd auth login` que abrirá una ventana del navegador para la autenticación en Azure. Para escenarios CI/CD, usa principales de servicio o identidades administradas.

### P: ¿Puedo usar azd con múltiples suscripciones de Azure?
**R**: Sí. Usa `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` para especificar qué suscripción utilizar en cada entorno.

### P: ¿Qué permisos necesito para desplegar con azd?
**R**: Normalmente necesitas:
- Rol de **Colaborador** en el grupo de recursos o suscripción
- **Administrador de acceso de usuario** si despliegas recursos que requieren asignaciones de rol
- Los permisos específicos varían según la plantilla y los recursos desplegados

### P: ¿Puedo usar azd en pipelines CI/CD?
**R**: ¡Absolutamente! azd está diseñado para integración en CI/CD. Usa principales de servicio para la autenticación y configura variables de entorno para la configuración.

### P: ¿Cómo manejo la autenticación en GitHub Actions?
**R**: Prefiere federación de identidad de carga de trabajo (OIDC), configurada con `azd pipeline config`. El flujo generado instala AZD y autentica AZD directamente con una identidad federada. Un paso `azure/login` por sí solo no establece un inicio de sesión de AZD. Un paso de inicio de sesión dentro de un trabajo existente es:
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

Provisione o despliegue después del inicio de sesión, con el entorno AZD, suscripción y ubicación configurados según lo previsto. La credencial federada de la identidad debe confiar en el repositorio/ref del flujo de trabajo o en el entorno de GitHub, y sus roles de Azure deben permitir las operaciones solicitadas.

---

## Plantillas y Proyectos

### P: ¿Dónde puedo encontrar plantillas azd?
**R**: 
- Plantillas oficiales y de la comunidad: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Plantillas comunitarias: busca en GitHub "azd-template"
- Usa `azd template list` para explorar plantillas disponibles

### P: ¿Cómo creo una plantilla personalizada?
**R**: 
1. Empieza con la estructura de una plantilla existente
2. Modifica `azure.yaml`, archivos de infraestructura y código de la aplicación
3. Prueba minuciosamente con `azd up`
4. Publica en GitHub con etiquetas apropiadas

### P: ¿Puedo usar azd sin una plantilla?
**R**: Sí, usa `azd init` en un proyecto existente para crear los archivos de configuración necesarios. Deberás configurar manualmente `azure.yaml` y archivos de infraestructura.

### P: ¿Cuál es la diferencia entre plantillas oficiales y comunitarias?
**R**: 
- **Plantillas oficiales**: Mantenidas por Microsoft, actualizadas regularmente, documentación exhaustiva
- **Plantillas comunitarias**: Creado por desarrolladores, pueden tener casos de uso especializados, calidad y mantenimiento variables

### P: ¿Cómo actualizo una plantilla en mi proyecto?
**R**: Las plantillas no se actualizan automáticamente. Puedes:
1. Comparar y fusionar manualmente los cambios desde la plantilla fuente
2. Empezar desde cero con `azd init` usando la plantilla actualizada
3. Elegir mejoras específicas de las plantillas actualizadas

---

## Despliegue e Infraestructura

### P: ¿Qué servicios de Azure puede desplegar azd?
**R**: azd puede desplegar cualquier servicio de Azure mediante plantillas Bicep/ARM, incluyendo:
- Servicios de aplicaciones, Aplicaciones de contenedor, Funciones
- Bases de datos (SQL, PostgreSQL, Cosmos DB)
- Almacenamiento, Key Vault, Application Insights
- Recursos de red, seguridad y monitoreo

### P: ¿Puedo desplegar en múltiples regiones?
**R**: Sí, configura varias regiones en tus plantillas Bicep y establece el parámetro de ubicación apropiadamente para cada entorno.

### P: ¿Cómo manejo migraciones de esquemas de bases de datos?
**R**: Usa ganchos de despliegue en `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### P: ¿Puedo desplegar solo la infraestructura sin aplicaciones?
**R**: Sí, usa `azd provision` para desplegar solo los componentes de infraestructura definidos en tus plantillas.

### P: ¿Cómo despliego en recursos de Azure existentes?
**R**: Sí, cuando la plantilla lo soporta. Referencia recursos existentes con declaraciones `existing` de Bicep o los parámetros documentados de recursos existentes de la plantilla, y asigna servicios de la aplicación a sus objetivos previstos. Esto no importa la propiedad ni crea permisos faltantes automáticamente. Revisa la plantilla antes de desplegar.

### P: ¿Puedo usar Terraform en lugar de Bicep?
**R**: Sí. AZD soporta Terraform además de Bicep. Selecciona una plantilla basada en Terraform o configura `infra.provider: terraform` en `azure.yaml`, con los archivos Terraform adecuados y configuración de estado/backend. Consulta el [flujo de trabajo de Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Configuración y Entornos

### P: ¿Cómo gestiono diferentes entornos (dev, staging, prod)?
**R**: Crea entornos separados con `azd env new <environment-name>` y configura diferentes ajustes para cada uno:
```bash
azd env new development
azd env new staging  
azd env new production
```

### P: ¿Dónde se almacenan las configuraciones de entorno?
**R**: En la carpeta `.azure` dentro del directorio de tu proyecto. Cada entorno tiene su propia carpeta con archivos de configuración.

### P: ¿Cómo establezco configuración específica para cada entorno?
**R**: Usa `azd env set` para configurar variables de entorno:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### P: ¿Puedo compartir configuraciones de entorno entre miembros del equipo?
**R**: La carpeta `.azure` contiene información sensible y no debe ser incluida en control de versiones. En cambio:
1. Documenta las variables de entorno requeridas
2. Usa scripts de despliegue para configurar entornos
3. Usa Azure Key Vault para configuración sensible

### P: ¿Cómo sobrescribo los valores predeterminados de las plantillas?
**R**: Establece variables de entorno que correspondan a los parámetros de la plantilla:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Solo las variables consumidas por la plantilla afectan el despliegue. `SKU_NAME` arriba es un ejemplo de entrada personalizada, no una configuración universal de AZD.

---

## Solución de problemas

### P: ¿Por qué está fallando `azd up`?
**R**: Causas comunes:
1. **Problemas de autenticación**: Ejecuta `azd auth login`
2. **Permisos insuficientes**: Revisa tus asignaciones de rol en Azure
3. **Conflictos de nombres de recursos**: Revisa el recurso en conflicto y las entradas de nombres de la plantilla; crea un entorno separado con `azd env new` cuando se necesite aislamiento
4. **Problemas de cuota/capacidad**: Verifica disponibilidad regional
5. **Errores en la plantilla**: Valida las plantillas Bicep

### P: ¿Cómo depuro fallos en el despliegue?
**R**: 
1. Usa `azd deploy --debug` para salida detallada
2. Consulta el historial de despliegue en el portal de Azure
3. Revisa el Registro de Actividad en el portal de Azure
4. Usa `azd show` para mostrar el estado actual del entorno

### P: ¿Por qué mis variables de entorno no funcionan?
**R**: Revisa:
1. Los nombres de variables coinciden exactamente con los parámetros de la plantilla
2. Los valores están correctamente entre comillas si contienen espacios
3. El entorno está seleccionado: `azd env select <environment>`
4. Las variables están establecidas en el entorno correcto

### P: ¿Cómo limpio los despliegues fallidos?
**R**: 
```bash
azd down
```
Revisa primero el entorno seleccionado y la confirmación de eliminación. Esto elimina los recursos de Azure aprovisionados, no la configuración del entorno local `.azure`. `--purge` además solicita la eliminación permanente de recursos con eliminación suave soportada y puede ser bloqueado por protección de retención/purgado; no es un paso habitual de recuperación.

### P: ¿Por qué mi aplicación no es accesible después del despliegue?
**R**: Revisa:
1. Que el despliegue se completó exitosamente
2. Que la aplicación está en ejecución (revisa logs en el portal de Azure)
3. Que los grupos de seguridad de red permiten tráfico
4. Que DNS/dominios personalizados están configurados correctamente

---

## Costos y facturación

### P: ¿Cuánto costarán los despliegues con azd?
**R**: Los costos dependen de:
- Servicios de Azure desplegados
- Niveles/SKUs del servicio seleccionados
- Diferencias regionales en precios
- Patrones de uso

Usa la [Calculadora de Precios de Azure](https://azure.microsoft.com/pricing/calculator/) para estimaciones.

### P: ¿Cómo controlo los costos en despliegues azd?
**R**: 
1. Usa SKUs de nivel inferior para entornos de desarrollo
2. Configura presupuestos y alertas en Azure
3. Usa `azd down` para eliminar recursos cuando no se necesiten
4. Elige regiones apropiadas (los costos varían según la ubicación)
5. Usa herramientas de administración de costos de Azure

### P: ¿Existen opciones de nivel gratuito para plantillas azd?
**R**: Algunos servicios tienen SKUs gratuitos o subsidios mensuales, sujetos a elegibilidad, plan de hospedaje, región y límites de suscripción. Esto no hace que toda una plantilla sea gratuita: bases de datos, búsqueda, red, registro, telemetría e inferencia de modelos pueden generar cargos de forma independiente. Consulta la [lista de servicios gratuitos de Azure](https://azure.microsoft.com/free/) y precios actuales para cada recurso antes del despliegue.

### P: ¿Cómo estimo costos antes del despliegue?
**R**: 
1. Revisa los `main.bicep` de la plantilla para ver qué recursos se crean
2. Usa la Calculadora de Precios de Azure con SKUs específicos
3. Despliega primero en un entorno de desarrollo para monitorear costos reales
4. Usa Azure Cost Management para análisis detallado de costos

---

## Mejores prácticas

### P: ¿Cuáles son las mejores prácticas para la estructura de proyectos azd?
**R**: 
1. Mantén el código de la aplicación separado de la infraestructura
2. Usa nombres descriptivos para servicios en `azure.yaml`
3. Implementa manejo adecuado de errores en scripts de compilación
4. Usa configuración específica para cada entorno
5. Incluye documentación comprensiva

### P: ¿Cómo debo organizar múltiples servicios en azd?
**R**: Usa la estructura recomendada:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### P: ¿Debo incluir la carpeta `.azure` en control de versiones?
**R**: ¡**No!** La carpeta `.azure` contiene información sensible. Agrégala a `.gitignore`:
```gitignore
.azure/
```

### P: ¿Cómo manejo secretos y configuraciones sensibles?
**R**: 
1. Usa Azure Key Vault para secretos
2. Referencia secretos de Key Vault en la configuración de la aplicación
3. Nunca comprometas secretos en el control de versiones
4. Usa identidades administradas para autenticación entre servicios

### P: ¿Cuál es el enfoque recomendado para CI/CD con azd?
**R**: 
1. Usa entornos separados para cada etapa (dev/preparación/producción)
2. Implementa pruebas automatizadas antes del despliegue
3. Usa principales de servicio para la autenticación
4. Almacena configuraciones sensibles en secretos/variables del pipeline
5. Implementa puertas de aprobación para despliegues en producción

---

## Temas Avanzados

### P: ¿Puedo extender azd con funcionalidades personalizadas?
**R**: Sí, a través de hooks de despliegue en `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### P: ¿Cómo integro azd con procesos DevOps existentes?
**R**: 
1. Usa comandos azd en scripts de pipelines existentes
2. Estandariza plantillas azd entre los equipos
3. Integra con monitoreo y alertas existentes
4. Usa la salida JSON de azd para integración en pipelines

### P: ¿Puedo usar azd con Azure DevOps?
**R**: Sí, azd funciona con cualquier sistema CI/CD. Crea pipelines de Azure DevOps que usen comandos azd.

### P: ¿Cómo contribuyo a azd o creo plantillas comunitarias?
**R**: 
1. **herramienta azd**: Contribuye a [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Plantillas**: Sigue las [instrucciones para contribuir a la galería Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentación**: Contribuye a los docs en [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### P: ¿Cuál es la hoja de ruta para azd?
**R**: Consulta la [hoja de ruta oficial](https://github.com/Azure/azure-dev/projects) para características y mejoras planificadas.

### P: ¿Cómo migro de otras herramientas de despliegue a azd?
**R**: 
1. Analiza la arquitectura actual de despliegue
2. Crea plantillas Bicep equivalentes
3. Configura `azure.yaml` para que coincida con los servicios actuales
4. Prueba exhaustivamente en ambiente de desarrollo
5. Migra los entornos gradualmente

---

## ¿Aún tienes preguntas?

### **Busca Primero**
- Consulta la [documentación oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Busca en [issues de GitHub](https://github.com/Azure/azure-dev/issues) problemas similares

### **Obtén Ayuda**
- [Discusiones de GitHub](https://github.com/Azure/azure-dev/discussions) - Soporte comunitario
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Preguntas técnicas
- [Azure Discord](https://discord.gg/azure) - Chat comunitario en tiempo real

### **Reporta Problemas**
- [Issues de GitHub](https://github.com/Azure/azure-dev/issues/new) - Reportes de errores y solicitudes de funciones
- Incluye registros relevantes, mensajes de error y pasos para reproducir

### **Aprende Más**
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitectura de Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Marco de Arquitectura Bien Diseñada de Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Guía técnica revisada: 4 de noviembre de 2026. La disponibilidad en la nube y precios deben verificarse según tu suscripción y región.*

---

**Navegación**
- **Lección anterior**: [Glosario](glossary.md)
- **Próxima lección**: [Guía de estudio](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
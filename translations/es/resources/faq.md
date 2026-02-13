# Preguntas Frecuentes (FAQ)

**Obtener ayuda por capítulo**
- **📚 Inicio del curso**: [AZD For Beginners](../README.md)
- **🚆 Problemas de instalación**: [Chapter 1: Installation & Setup](../docs/getting-started/installation.md)
- **🤖 Preguntas sobre IA**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Solución de problemas**: [Chapter 7: Troubleshooting & Debugging](../docs/troubleshooting/common-issues.md)

## Introducción

Esta completa sección de preguntas frecuentes ofrece respuestas a las dudas más comunes sobre Azure Developer CLI (azd) y despliegues en Azure. Encuentra soluciones rápidas a problemas habituales, comprende las mejores prácticas y obtén aclaraciones sobre conceptos y flujos de trabajo de azd.

## Objetivos de aprendizaje

Al revisar estas preguntas frecuentes, podrás:
- Encontrar respuestas rápidas a preguntas y problemas comunes sobre Azure Developer CLI
- Entender conceptos clave y terminología a través de un formato práctico de preguntas y respuestas
- Acceder a soluciones de solución de problemas para problemas y escenarios de error frecuentes
- Aprender mejores prácticas a través de preguntas comunes sobre optimización
- Descubrir funciones y capacidades avanzadas mediante preguntas de nivel experto
- Consultar de manera eficiente recomendaciones sobre costos, seguridad y estrategias de despliegue

## Resultados de aprendizaje

Con referencia regular a estas preguntas frecuentes, serás capaz de:
- Resolver problemas comunes de Azure Developer CLI de forma independiente usando las soluciones proporcionadas
- Tomar decisiones informadas sobre estrategias y configuraciones de despliegue
- Entender la relación entre azd y otras herramientas y servicios de Azure
- Aplicar mejores prácticas basadas en la experiencia de la comunidad y recomendaciones de expertos
- Solucionar problemas de autenticación, despliegue y configuración de manera eficaz
- Optimizar costos y rendimiento usando las ideas y recomendaciones de las FAQ

## Tabla de contenidos

- [Getting Started](../../../resources)
- [Authentication & Access](../../../resources)
- [Templates & Projects](../../../resources)
- [Deployment & Infrastructure](../../../resources)
- [Configuration & Environments](../../../resources)
- [Troubleshooting](../../../resources)
- [Cost & Billing](../../../resources)
- [Best Practices](../../../resources)
- [Advanced Topics](../../../resources)

---

## Getting Started

### Q: ¿Qué es Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) es una herramienta de línea de comandos centrada en desarrolladores que acelera el tiempo que tarda en llevar tu aplicación desde el entorno de desarrollo local hasta Azure. Proporciona mejores prácticas a través de plantillas y ayuda con todo el ciclo de vida de despliegue.

### Q: ¿En qué se diferencia azd de Azure CLI?
**A**: 
- **Azure CLI**: Herramienta de propósito general para gestionar recursos de Azure
- **azd**: Herramienta enfocada en desarrolladores para flujos de trabajo de despliegue de aplicaciones
- azd utiliza Azure CLI internamente pero proporciona abstracciones de más alto nivel para escenarios comunes de desarrollo
- azd incluye plantillas, gestión de entornos y automatización de despliegues

### Q: ¿Necesito tener instalado Azure CLI para usar azd?
**A**: Sí, azd requiere Azure CLI para la autenticación y algunas operaciones. Instala Azure CLI primero y luego instala azd.

### Q: ¿Qué lenguajes de programación soporta azd?
**A**: azd es agnóstico al lenguaje. Funciona con:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Sitios web estáticos
- Aplicaciones en contenedores

### Q: ¿Puedo usar azd con proyectos existentes?
**A**: ¡Sí! Puedes:
1. Usar `azd init` para agregar la configuración de azd a proyectos existentes
2. Adaptar proyectos existentes para que coincidan con la estructura de la plantilla azd
3. Crear plantillas personalizadas basadas en tu arquitectura existente

---

## Authentication & Access

### Q: ¿Cómo me autentico en Azure usando azd?
**A**: Usa `azd auth login` que abrirá una ventana del navegador para la autenticación de Azure. Para escenarios de CI/CD, utiliza service principals o managed identities.

### Q: ¿Puedo usar azd con múltiples suscripciones de Azure?
**A**: Sí. Usa `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` para especificar qué suscripción usar para cada entorno.

### Q: ¿Qué permisos necesito para desplegar con azd?
**A**: Normalmente necesitas:
- Rol de **Contributor** en el grupo de recursos o suscripción
- **User Access Administrator** si despliegas recursos que requieren asignaciones de rol
- Los permisos específicos varían según la plantilla y los recursos que se desplieguen

### Q: ¿Puedo usar azd en pipelines de CI/CD?
**A**: ¡Absolutamente! azd está diseñado para integración en CI/CD. Usa service principals para la autenticación y configura variables de entorno para la configuración.

### Q: ¿Cómo manejo la autenticación en GitHub Actions?
**A**: Usa la acción Azure Login con credenciales de service principal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### Q: ¿Dónde puedo encontrar plantillas de azd?
**A**: 
- Plantillas oficiales: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Plantillas de la comunidad: Buscar en GitHub "azd-template"
- Usa `azd template list` para examinar las plantillas disponibles

### Q: ¿Cómo creo una plantilla personalizada?
**A**: 
1. Comienza con una estructura de plantilla existente
2. Modifica `azure.yaml`, los archivos de infraestructura y el código de la aplicación
3. Prueba a fondo con `azd up`
4. Publica en GitHub con etiquetas apropiadas

### Q: ¿Puedo usar azd sin una plantilla?
**A**: Sí, usa `azd init` en un proyecto existente para crear los archivos de configuración necesarios. Necesitarás configurar manualmente `azure.yaml` y los archivos de infraestructura.

### Q: ¿Cuál es la diferencia entre plantillas oficiales y de la comunidad?
**A**: 
- **Plantillas oficiales**: Mantenidas por Microsoft, actualizadas regularmente, documentación completa
- **Plantillas de la comunidad**: Creada por desarrolladores, pueden tener casos de uso especializados, calidad y mantenimiento variables

### Q: ¿Cómo actualizo una plantilla en mi proyecto?
**A**: Las plantillas no se actualizan automáticamente. Puedes:
1. Comparar y fusionar manualmente los cambios desde la plantilla fuente
2. Empezar de nuevo con `azd init` usando la plantilla actualizada
3. Seleccionar cambios específicos de las plantillas actualizadas

---

## Deployment & Infrastructure

### Q: ¿Qué servicios de Azure puede desplegar azd?
**A**: azd puede desplegar cualquier servicio de Azure a través de plantillas Bicep/ARM, incluyendo:
- App Services, Container Apps, Functions
- Bases de datos (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Recursos de red, seguridad y monitorización

### Q: ¿Puedo desplegar en múltiples regiones?
**A**: Sí, configura múltiples regiones en tus plantillas Bicep y establece apropiadamente el parámetro location para cada entorno.

### Q: ¿Cómo manejo las migraciones de esquema de base de datos?
**A**: Usa hooks de despliegue en `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: ¿Puedo desplegar solo la infraestructura sin las aplicaciones?
**A**: Sí, usa `azd provision` para desplegar únicamente los componentes de infraestructura definidos en tus plantillas.

### Q: ¿Cómo despliego a recursos de Azure existentes?
**A**: Esto es complejo y no está soportado directamente. Puedes:
1. Importar recursos existentes en tus plantillas Bicep
2. Usar referencias a recursos existentes en las plantillas
3. Modificar las plantillas para crear condicionalmente o hacer referencia a recursos

### Q: ¿Puedo usar Terraform en lugar de Bicep?
**A**: Actualmente, azd soporta principalmente plantillas Bicep/ARM. El soporte oficial para Terraform no está disponible, aunque pueden existir soluciones comunitarias.

---

## Configuration & Environments

### Q: ¿Cómo gestiono diferentes entornos (dev, staging, prod)?
**A**: Crea entornos separados con `azd env new <environment-name>` y configura ajustes distintos para cada uno:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: ¿Dónde se almacenan las configuraciones de entorno?
**A**: En la carpeta `.azure` dentro del directorio de tu proyecto. Cada entorno tiene su propia carpeta con archivos de configuración.

### Q: ¿Cómo establezco configuración específica por entorno?
**A**: Usa `azd env set` para configurar variables de entorno:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: ¿Puedo compartir configuraciones de entorno entre miembros del equipo?
**A**: La carpeta `.azure` contiene información sensible y no debe incluirse en el control de versiones. En su lugar:
1. Documenta las variables de entorno requeridas
2. Usa scripts de despliegue para configurar los entornos
3. Usa Azure Key Vault para la configuración sensible

### Q: ¿Cómo anulo los valores predeterminados de la plantilla?
**A**: Establece variables de entorno que correspondan a los parámetros de la plantilla:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: ¿Por qué falla `azd up`?
**A**: Causas comunes:
1. **Problemas de autenticación**: Ejecuta `azd auth login`
2. **Permisos insuficientes**: Verifica tus asignaciones de rol en Azure
3. **Conflictos de nombres de recursos**: Cambia AZURE_ENV_NAME
4. **Cuotas/capacidad**: Verifica la disponibilidad regional
5. **Errores en la plantilla**: Valida las plantillas Bicep

### Q: ¿Cómo depuro fallos en el despliegue?
**A**: 
1. Usa `azd deploy --debug` para salida detallada
2. Revisa el historial de despliegues en el portal de Azure
3. Revisa el Activity Log en el portal de Azure
4. Usa `azd show` para mostrar el estado actual del entorno

### Q: ¿Por qué mis variables de entorno no funcionan?
**A**: Verifica:
1. Los nombres de las variables coinciden exactamente con los parámetros de la plantilla
2. Los valores están correctamente entrecomillados si contienen espacios
3. El entorno está seleccionado: `azd env select <environment>`
4. Las variables están establecidas en el entorno correcto

### Q: ¿Cómo limpio despliegues fallidos?
**A**: 
```bash
azd down --force --purge
```
Esto elimina todos los recursos y la configuración del entorno.

### Q: ¿Por qué mi aplicación no es accesible después del despliegue?
**A**: Verifica:
1. Que el despliegue se completó correctamente
2. Que la aplicación está en funcionamiento (revisa los registros en el portal de Azure)
3. Que los network security groups permiten el tráfico
4. Que los DNS/dominios personalizados están configurados correctamente

---

## Cost & Billing

### Q: ¿Cuánto costarán los despliegues con azd?
**A**: Los costos dependen de:
- Servicios de Azure desplegados
- Niveles de servicio/SKUs seleccionados
- Diferencias de precios por región
- Patrones de uso

Usa la [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) para estimaciones.

### Q: ¿Cómo controlo los costos en despliegues con azd?
**A**: 
1. Usa SKUs de menor nivel para entornos de desarrollo
2. Configura presupuestos y alertas en Azure
3. Usa `azd down` para eliminar recursos cuando no se necesiten
4. Elige regiones apropiadas (los costos varían según la ubicación)
5. Usa las herramientas de Azure Cost Management

### Q: ¿Hay opciones de nivel gratuito para plantillas azd?
**A**: Muchos servicios de Azure ofrecen niveles gratuitos:
- App Service: Nivel gratuito disponible
- Azure Functions: 1M ejecuciones gratuitas/mes
- Cosmos DB: Nivel gratuito con 400 RU/s
- Application Insights: Primeros 5GB/mes gratuitos

Configura las plantillas para usar niveles gratuitos cuando estén disponibles.

### Q: ¿Cómo estimo los costos antes del despliegue?
**A**: 
1. Revisa el `main.bicep` de la plantilla para ver qué recursos se crean
2. Usa Azure Pricing Calculator con SKUs específicos
3. Despliega primero en un entorno de desarrollo para monitorizar costos reales
4. Usa Azure Cost Management para un análisis detallado de costos

---

## Best Practices

### Q: ¿Cuáles son las mejores prácticas para la estructura de un proyecto azd?
**A**: 
1. Mantén el código de la aplicación separado de la infraestructura
2. Usa nombres de servicio significativos en `azure.yaml`
3. Implementa manejo de errores adecuado en los scripts de compilación
4. Usa configuración específica por entorno
5. Incluye documentación completa

### Q: ¿Cómo debo organizar múltiples servicios en azd?
**A**: Usa la estructura recomendada:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: ¿Debo hacer commit de la carpeta `.azure` al control de versiones?
**A**: **¡No!** La carpeta `.azure` contiene información sensible. Agrégala a `.gitignore`:
```gitignore
.azure/
```

### Q: ¿Cómo manejo secretos y configuración sensible?
**A**: 
1. Usa Azure Key Vault para secretos
2. Referencia secretos de Key Vault en la configuración de la aplicación
3. Nunca hagas commit de secretos en el control de versiones
4. Usa managed identities para la autenticación entre servicios

### Q: ¿Cuál es el enfoque recomendado para CI/CD con azd?
**A**: 
1. Usa entornos separados para cada etapa (dev/staging/prod)
2. Implementa pruebas automatizadas antes del despliegue
3. Usa service principals para la autenticación
4. Almacena la configuración sensible en secretos/variables del pipeline
5. Implementa gates de aprobación para despliegues a producción

---

## Advanced Topics

### Q: ¿Puedo ampliar azd con funcionalidad personalizada?
**A**: Sí, mediante hooks de despliegue en `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: ¿Cómo integro azd con procesos DevOps existentes?
**A**: 
1. Usa comandos azd en scripts de pipeline existentes
2. Estandariza las plantillas azd entre equipos
3. Integra con la monitorización y alertas existentes
4. Usa la salida JSON de azd para la integración en pipelines

### Q: ¿Puedo usar azd con Azure DevOps?
**A**: Sí, azd funciona con cualquier sistema CI/CD. Crea pipelines de Azure DevOps que usen comandos azd.

### Q: ¿Cómo contribuyo a azd o creo plantillas comunitarias?
**A**:
1. **herramienta azd**: Contribuir a [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Plantillas**: Crea plantillas siguiendo las [directrices de plantillas](https://github.com/Azure-Samples/awesome-azd)
3. **Documentación**: Contribuir a la documentación en [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: ¿Cuál es la hoja de ruta para azd?
**A**: Consulta la [hoja de ruta oficial](https://github.com/Azure/azure-dev/projects) para las características y mejoras planificadas.

### Q: ¿Cómo migro desde otras herramientas de despliegue a azd?
**A**: 
1. Analizar la arquitectura de despliegue actual
2. Crear plantillas equivalentes de Bicep
3. Configurar `azure.yaml` para que coincida con los servicios actuales
4. Probar a fondo en el entorno de desarrollo
5. Migrar gradualmente los entornos

---

## ¿Aún tienes preguntas?

### **Buscar primero**
- Consulta la [documentación oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Busca problemas similares en [GitHub issues](https://github.com/Azure/azure-dev/issues)

### **Obtener ayuda**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Soporte de la comunidad
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Preguntas técnicas
- [Azure Discord](https://discord.gg/azure) - Chat comunitario en tiempo real

### **Reportar problemas**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Informes de errores y solicitudes de funciones
- Incluye registros relevantes, mensajes de error y pasos para reproducir

### **Más información**
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Esta FAQ se actualiza regularmente. Última actualización: 9 de septiembre de 2025*

---

**Navegación**
- **Previous Lesson**: [Glosario](glossary.md)
- **Next Lesson**: [Guía de estudio](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
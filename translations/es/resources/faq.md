<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-09T17:53:26+00:00",
  "source_file": "resources/faq.md",
  "language_code": "es"
}
-->
# Preguntas Frecuentes (FAQ)

## Introducción

Este FAQ completo proporciona respuestas a las preguntas más comunes sobre Azure Developer CLI (azd) y los despliegues en Azure. Encuentra soluciones rápidas a problemas comunes, comprende las mejores prácticas y obtén aclaraciones sobre conceptos y flujos de trabajo de azd.

## Objetivos de Aprendizaje

Al revisar este FAQ, podrás:
- Encontrar respuestas rápidas a preguntas y problemas comunes sobre Azure Developer CLI
- Comprender conceptos y terminología clave a través de un formato práctico de preguntas y respuestas
- Acceder a soluciones de resolución de problemas para escenarios frecuentes de errores
- Aprender mejores prácticas a través de preguntas comunes sobre optimización
- Descubrir características avanzadas y capacidades mediante preguntas de nivel experto
- Consultar orientación sobre costos, seguridad y estrategias de despliegue de manera eficiente

## Resultados de Aprendizaje

Con referencia regular a este FAQ, serás capaz de:
- Resolver problemas comunes de Azure Developer CLI de manera independiente utilizando las soluciones proporcionadas
- Tomar decisiones informadas sobre estrategias y configuraciones de despliegue
- Comprender la relación entre azd y otras herramientas y servicios de Azure
- Aplicar mejores prácticas basadas en la experiencia de la comunidad y recomendaciones de expertos
- Solucionar problemas de autenticación, despliegue y configuración de manera efectiva
- Optimizar costos y rendimiento utilizando las ideas y recomendaciones del FAQ

## Tabla de Contenidos

- [Primeros Pasos](../../../resources)
- [Autenticación y Acceso](../../../resources)
- [Plantillas y Proyectos](../../../resources)
- [Despliegue e Infraestructura](../../../resources)
- [Configuración y Entornos](../../../resources)
- [Resolución de Problemas](../../../resources)
- [Costos y Facturación](../../../resources)
- [Mejores Prácticas](../../../resources)
- [Temas Avanzados](../../../resources)

---

## Primeros Pasos

### P: ¿Qué es Azure Developer CLI (azd)?
**R**: Azure Developer CLI (azd) es una herramienta de línea de comandos centrada en desarrolladores que acelera el tiempo necesario para llevar tu aplicación desde el entorno de desarrollo local a Azure. Proporciona mejores prácticas a través de plantillas y ayuda con todo el ciclo de vida del despliegue.

### P: ¿En qué se diferencia azd de Azure CLI?
**R**: 
- **Azure CLI**: Herramienta de propósito general para gestionar recursos de Azure
- **azd**: Herramienta centrada en desarrolladores para flujos de trabajo de despliegue de aplicaciones
- azd utiliza Azure CLI internamente pero proporciona abstracciones de nivel superior para escenarios comunes de desarrollo
- azd incluye plantillas, gestión de entornos y automatización de despliegues

### P: ¿Necesito tener Azure CLI instalado para usar azd?
**R**: Sí, azd requiere Azure CLI para la autenticación y algunas operaciones. Instala Azure CLI primero y luego instala azd.

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
1. Usar `azd init` para agregar configuración de azd a proyectos existentes
2. Adaptar proyectos existentes para que coincidan con la estructura de las plantillas de azd
3. Crear plantillas personalizadas basadas en tu arquitectura existente

---

## Autenticación y Acceso

### P: ¿Cómo me autentico con Azure usando azd?
**R**: Usa `azd auth login`, lo que abrirá una ventana del navegador para la autenticación en Azure. Para escenarios de CI/CD, utiliza principales de servicio o identidades administradas.

### P: ¿Puedo usar azd con múltiples suscripciones de Azure?
**R**: Sí. Usa `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` para especificar qué suscripción usar para cada entorno.

### P: ¿Qué permisos necesito para desplegar con azd?
**R**: Normalmente necesitas:
- Rol de **Colaborador** en el grupo de recursos o suscripción
- **Administrador de Acceso de Usuario** si despliegas recursos que requieren asignaciones de roles
- Los permisos específicos varían según la plantilla y los recursos que se despliegan

### P: ¿Puedo usar azd en pipelines de CI/CD?
**R**: ¡Por supuesto! azd está diseñado para integrarse con CI/CD. Usa principales de servicio para la autenticación y configura variables de entorno.

### P: ¿Cómo manejo la autenticación en GitHub Actions?
**R**: Usa la acción de inicio de sesión de Azure con credenciales de principal de servicio:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Plantillas y Proyectos

### P: ¿Dónde puedo encontrar plantillas de azd?
**R**: 
- Plantillas oficiales: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Plantillas de la comunidad: Busca en GitHub "azd-template"
- Usa `azd template list` para explorar las plantillas disponibles

### P: ¿Cómo creo una plantilla personalizada?
**R**: 
1. Comienza con la estructura de una plantilla existente
2. Modifica `azure.yaml`, los archivos de infraestructura y el código de la aplicación
3. Prueba exhaustivamente con `azd up`
4. Publica en GitHub con etiquetas apropiadas

### P: ¿Puedo usar azd sin una plantilla?
**R**: Sí, usa `azd init` en un proyecto existente para crear los archivos de configuración necesarios. Tendrás que configurar manualmente `azure.yaml` y los archivos de infraestructura.

### P: ¿Cuál es la diferencia entre plantillas oficiales y de la comunidad?
**R**: 
- **Plantillas oficiales**: Mantenidas por Microsoft, actualizadas regularmente, documentación completa
- **Plantillas de la comunidad**: Creadas por desarrolladores, pueden tener casos de uso especializados, calidad y mantenimiento variables

### P: ¿Cómo actualizo una plantilla en mi proyecto?
**R**: Las plantillas no se actualizan automáticamente. Puedes:
1. Comparar y fusionar manualmente los cambios de la plantilla fuente
2. Comenzar de nuevo con `azd init` usando la plantilla actualizada
3. Seleccionar mejoras específicas de las plantillas actualizadas

---

## Despliegue e Infraestructura

### P: ¿Qué servicios de Azure puede desplegar azd?
**R**: azd puede desplegar cualquier servicio de Azure a través de plantillas Bicep/ARM, incluyendo:
- App Services, Container Apps, Functions
- Bases de datos (SQL, PostgreSQL, Cosmos DB)
- Almacenamiento, Key Vault, Application Insights
- Recursos de red, seguridad y monitoreo

### P: ¿Puedo desplegar en múltiples regiones?
**R**: Sí, configura múltiples regiones en tus plantillas Bicep y ajusta el parámetro de ubicación apropiadamente para cada entorno.

### P: ¿Cómo manejo las migraciones de esquemas de bases de datos?
**R**: Usa hooks de despliegue en `azure.yaml`:
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

### P: ¿Cómo despliego en recursos existentes de Azure?
**R**: Esto es complejo y no está directamente soportado. Puedes:
1. Importar recursos existentes en tus plantillas Bicep
2. Usar referencias de recursos existentes en las plantillas
3. Modificar las plantillas para crear o referenciar recursos condicionalmente

### P: ¿Puedo usar Terraform en lugar de Bicep?
**R**: Actualmente, azd soporta principalmente plantillas Bicep/ARM. El soporte para Terraform no está oficialmente disponible, aunque pueden existir soluciones de la comunidad.

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

### P: ¿Cómo configuro ajustes específicos de entorno?
**R**: Usa `azd env set` para configurar variables de entorno:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### P: ¿Puedo compartir configuraciones de entorno con miembros del equipo?
**R**: La carpeta `.azure` contiene información sensible y no debe ser comprometida en el control de versiones. En su lugar:
1. Documenta las variables de entorno requeridas
2. Usa scripts de despliegue para configurar entornos
3. Usa Azure Key Vault para configuraciones sensibles

### P: ¿Cómo sobrescribo los valores predeterminados de las plantillas?
**R**: Configura variables de entorno que correspondan a los parámetros de las plantillas:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Resolución de Problemas

### P: ¿Por qué falla `azd up`?
**R**: Causas comunes:
1. **Problemas de autenticación**: Ejecuta `azd auth login`
2. **Permisos insuficientes**: Verifica tus asignaciones de roles en Azure
3. **Conflictos de nombres de recursos**: Cambia AZURE_ENV_NAME
4. **Problemas de cuota/capacidad**: Verifica la disponibilidad regional
5. **Errores en la plantilla**: Valida las plantillas Bicep

### P: ¿Cómo depuro fallos en el despliegue?
**R**: 
1. Usa `azd deploy --debug` para obtener salida detallada
2. Revisa el historial de despliegue en el portal de Azure
3. Consulta el Registro de Actividades en el portal de Azure
4. Usa `azd show` para mostrar el estado actual del entorno

### P: ¿Por qué no funcionan mis variables de entorno?
**R**: Verifica:
1. Los nombres de las variables coinciden exactamente con los parámetros de la plantilla
2. Los valores están correctamente entre comillas si contienen espacios
3. El entorno está seleccionado: `azd env select <environment>`
4. Las variables están configuradas en el entorno correcto

### P: ¿Cómo limpio despliegues fallidos?
**R**: 
```bash
azd down --force --purge
```
Esto elimina todos los recursos y la configuración del entorno.

### P: ¿Por qué mi aplicación no es accesible después del despliegue?
**R**: Verifica:
1. El despliegue se completó exitosamente
2. La aplicación está en ejecución (consulta los registros en el portal de Azure)
3. Los grupos de seguridad de red permiten tráfico
4. Los DNS/dominios personalizados están configurados correctamente

---

## Costos y Facturación

### P: ¿Cuánto costarán los despliegues de azd?
**R**: Los costos dependen de:
- Los servicios de Azure desplegados
- Los niveles/planes de servicio seleccionados
- Las diferencias de precios regionales
- Los patrones de uso

Usa el [Calculador de Precios de Azure](https://azure.microsoft.com/pricing/calculator/) para estimaciones.

### P: ¿Cómo controlo los costos en los despliegues de azd?
**R**: 
1. Usa niveles más bajos para entornos de desarrollo
2. Configura presupuestos y alertas en Azure
3. Usa `azd down` para eliminar recursos cuando no sean necesarios
4. Elige regiones apropiadas (los costos varían según la ubicación)
5. Usa herramientas de Gestión de Costos de Azure

### P: ¿Existen opciones de nivel gratuito para las plantillas de azd?
**R**: Muchos servicios de Azure ofrecen niveles gratuitos:
- App Service: Nivel gratuito disponible
- Azure Functions: 1M ejecuciones gratuitas/mes
- Cosmos DB: Nivel gratuito con 400 RU/s
- Application Insights: Primeros 5GB/mes gratis

Configura las plantillas para usar niveles gratuitos donde estén disponibles.

### P: ¿Cómo estimo los costos antes del despliegue?
**R**: 
1. Revisa el `main.bicep` de la plantilla para ver qué recursos se crean
2. Usa el Calculador de Precios de Azure con planes específicos
3. Despliega en un entorno de desarrollo primero para monitorear costos reales
4. Usa Gestión de Costos de Azure para análisis detallado de costos

---

## Mejores Prácticas

### P: ¿Cuáles son las mejores prácticas para la estructura de proyectos de azd?
**R**: 
1. Mantén el código de la aplicación separado de la infraestructura
2. Usa nombres significativos para los servicios en `azure.yaml`
3. Implementa manejo adecuado de errores en los scripts de construcción
4. Usa configuración específica de entorno
5. Incluye documentación completa

### P: ¿Cómo organizo múltiples servicios en azd?
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

### P: ¿Debo comprometer la carpeta `.azure` en el control de versiones?
**R**: **¡No!** La carpeta `.azure` contiene información sensible. Agrégala a `.gitignore`:
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
1. Usa entornos separados para cada etapa (dev/staging/prod)
2. Implementa pruebas automatizadas antes del despliegue
3. Usa principales de servicio para la autenticación
4. Almacena configuraciones sensibles en secretos/variables del pipeline
5. Implementa aprobaciones para despliegues en producción

---

## Temas Avanzados

### P: ¿Puedo extender azd con funcionalidad personalizada?
**R**: Sí, mediante hooks de despliegue en `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### P: ¿Cómo integro azd con procesos DevOps existentes?
**R**: 
1. Usa comandos de azd en scripts de pipeline existentes
2. Estandariza las plantillas de azd en los equipos
3. Integra con monitoreo y alertas existentes
4. Usa la salida JSON de azd para integración en pipelines

### P: ¿Puedo usar azd con Azure DevOps?
**R**: Sí, azd funciona con cualquier sistema de CI/CD. Crea pipelines de Azure DevOps que usen comandos de azd.

### P: ¿Cómo contribuyo a azd o creo plantillas de la comunidad?
**R**: 
1. **Herramienta azd**: Contribuye en [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Plantillas**: Crea plantillas siguiendo las [directrices de plantillas](https://github.com/Azure-Samples/awesome-azd)
3. **Documentación**: Contribuye a la documentación en [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### P: ¿Cuál es la hoja de ruta para azd?
**R**: Consulta la [hoja de ruta oficial](https://github.com/Azure/azure-dev/projects) para características y mejoras planificadas.

### P: ¿Cómo migro de otras herramientas de despliegue a azd?
**R**:
1. Analizar la arquitectura de implementación actual  
2. Crear plantillas equivalentes en Bicep  
3. Configurar `azure.yaml` para que coincida con los servicios actuales  
4. Probar exhaustivamente en el entorno de desarrollo  
5. Migrar los entornos de forma gradual  

---

## ¿Aún tienes preguntas?

### **Busca primero**  
- Consulta la [documentación oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Busca problemas similares en [GitHub issues](https://github.com/Azure/azure-dev/issues)  

### **Obtén ayuda**  
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Soporte de la comunidad  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Preguntas técnicas  
- [Azure Discord](https://discord.gg/azure) - Chat comunitario en tiempo real  

### **Reporta problemas**  
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Reportes de errores y solicitudes de características  
- Incluye registros relevantes, mensajes de error y pasos para reproducir el problema  

### **Aprende más**  
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Centro de Arquitectura de Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Marco de Buenas Prácticas de Azure](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Este FAQ se actualiza regularmente. Última actualización: 9 de septiembre de 2025*  

---

**Navegación**  
- **Lección anterior**: [Glosario](glossary.md)  
- **Próxima lección**: [Guía de estudio](study-guide.md)  

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.
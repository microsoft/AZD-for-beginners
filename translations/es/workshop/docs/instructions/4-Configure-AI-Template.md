# 4. Configurar una plantilla

!!! tip "AL FINAL DE ESTE MÓDULO PODRÁS"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Comienza con la plantilla real

Abre el [`azure.yaml` en Comenzando con agentes de IA](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) en el repositorio que inicializaste. La plantilla original puede cambiar independientemente de este taller. El siguiente **extracto** fue revisado el 4 de noviembre de 2026; no es un reemplazo del archivo completo:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` identifica el proyecto AZD; `metadata.template` registra la versión de la plantilla.
- `requiredVersions.azd` es el mínimo de la plantilla, no una recomendación para usar una CLI antigua. Usa una versión actual de AZD soportada.
- `services` define los destinos de despliegue de la aplicación. Esta plantilla despliega su API de Python y frontend como un solo servicio de Container Apps.
- `project` es relativo a `azure.yaml`.
- `remoteBuild` solicita una compilación remota de contenedor. Tu identidad aún necesita los permisos necesarios de Azure.

Los archivos Bicep de la plantilla bajo `infra/`, no solo la lista `services`, declaran recursos como Microsoft Foundry, despliegues de modelos, almacenamiento y AI Search opcional.

## 2. Comprender los hooks del ciclo de vida

Inspecciona la sección `hooks` y sus scripts referenciados antes de ejecutar la plantilla. La versión revisada contiene:

| Hook | Propósito | Comportamiento importante |
|------|-----------|-------------------------|
| `preup` | Validar entradas del entorno de la plantilla antes del flujo `up` | Scripts shell específicos de la plataforma pueden detener el flujo en caso de fallo |
| `postdeploy` | Ejecutar configuración específica de la plantilla después del despliegue de la aplicación | Inspecciona `continueOnError` y la salida del script; un despliegue exitoso no garantiza que todas las tareas de configuración hayan sido exitosas |

Esta versión **no** contiene el hook antiguo `postprovision` / `write_env` mostrado en material anterior del taller. No copies referencias a scripts que ya no existen.

Las claves de hook seleccionan eventos del ciclo de vida; `posix` y `windows` seleccionan implementaciones de plataforma. `shell`, `run`, `interactive` y `continueOnError` controlan la ejecución. Son scripts ejecutables con tus permisos, así que revísalos como si fueran código de aplicación.

Consulta la [documentación de hooks AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) para el ciclo de vida completo.

## 3. Rastrear entradas del entorno en la infraestructura

Ejecuta estos comandos desde el repositorio de ejemplo inicializado:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Inspecciona `infra/main.parameters.json` para ver qué variables de entorno consume realmente la plantilla. Establecer un nombre arbitrario con `azd env set` no cambia automáticamente un recurso de Azure.

Los valores predeterminados revisados incluyen:

| Entrada | Predeterminado / propósito |
|---------|---------------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; las unidades de cuota dependen del modelo y tipo de despliegue |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; déjalo deshabilitado a menos que se haya revisado el manejo de datos |

Estas son entradas específicas del ejemplo, no configuraciones globales de AZD. Consulta la [documentación de soporte de modelos y regiones](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) y la cuota de tu suscripción antes de elegir un modelo, SKU, capacidad o ubicación. No interpretes cada unidad de capacidad como 1,000 tokens por minuto.

Para seleccionar un modelo de chat diferente, actualiza su **nombre, versión, formato, SKU y capacidad conjuntamente**, siguiendo la [guía de personalización del ejemplo](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Cambiar solo el nombre puede dejar una versión o tipo de despliegue incompatible.

## 4. Laboratorio: habilitar búsqueda y rastreo opcionales

!!! warning "Estas configuraciones pueden agregar recursos facturables"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

Los cambios en infraestructura necesitan aprovisionamiento; `azd deploy` solo despliega servicios de aplicación. Para indexación de búsqueda y opciones de recuperación soportadas, sigue la [guía de AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Para monitoreo, sigue la [guía de observabilidad](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

No habilites la captura de contenido de prompt/respuesta en datos reales de clientes sin el consentimiento requerido, controles de acceso, política de retención y redacción.

## 5. Recursos existentes y CI/CD

Para reutilizar un proyecto Foundry, sigue las [instrucciones para recursos existentes](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) del ejemplo. Establecer `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` cambia la ruta de despliegue; en ese caso, la plantilla no crea Application Insights ni AI Search para ti. Verifica explícitamente dependencias, asignaciones de roles y despliegues de modelos.

La sección `pipeline.variables` controla valores pasados a una canalización generada; no es un almacén de secretos ni crea recursos de Azure. Prefiere identidad administrada en la app y OIDC para CI/CD. Los archivos de entorno de AZD son texto plano y no deben commitirse.

AZD soporta importar un archivo dotenv de confianza preparado localmente:

```bash
azd env set --file .env
```

Revisa ese archivo antes de importarlo, y no imprimas archivos de entorno que contengan secretos en terminales compartidas o registros de CI.

## 6. Verifica tu comprensión

- ¿Qué servicio `azure.yaml` despliega la aplicación?
- ¿Qué parámetro de infraestructura consume cada valor que cambiaste?
- ¿Qué cambios requieren aprovisionamiento en lugar de solo despliegue?
- ¿La región y suscripción seleccionadas soportaron el modelo y cuota?
- ¿Todos los hooks de configuración tuvieron éxito, y puedes verificar el comportamiento de la aplicación desplegada?

Continúa con [Personalizar una plantilla](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
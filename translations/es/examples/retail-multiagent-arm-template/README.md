# Andamiaje de Infraestructura Multi-Agente para Retail

**Ejemplo de arquitectura avanzada — no es una aplicación multi-agente funcional.**

[Inicio del curso](../../README.md) ·
[Capítulo 5](../../docs/chapter-05-multi-agent/README.md) ·
[Plano de arquitectura](../retail-scenario.md)

## Qué se despliega

Este directorio contiene una plantilla ARM, parámetros y un script de despliegue Bash.
No hay **fuente de `azure.yaml` o aplicación minorista**.

| Recurso | Estado actual después de la provisión |
|---|---|
| Cuenta principal de Azure OpenAI | `gpt-4.1-chat` despliegue usando `gpt-4.1` versión `2025-04-14`, `GlobalStandard` |
| Cuenta secundaria de OpenAI (opcional) | `gpt-4.1-mini-inventory`, modelo `gpt-4.1-mini` versión `2025-04-14`, `GlobalStandard` |
| Cuenta de embeddings (opcional) | `text-embedding-ada-002` versión `2`, `Standard`; sin pipeline de indexación |
| Cuenta Grader OpenAI | `gpt-4.1-grader`, modelo `gpt-4.1` versión `2025-04-14`, `GlobalStandard`; sin evaluador |
| Búsqueda IA | Servicio vacío; sin índice ni documentos |
| Almacenamiento | Contenedores de blobs `documents` y `uploads` vacíos |
| Cosmos DB | Cuenta sin servidor, base de datos `chathistory`, contenedor `conversations` particionado por `/userId`, TTL de ítems de 30 días |
| Container Apps | Router y frontend ambos corren `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` en el puerto 80 |
| Key Vault (opcional) | Bóveda vacía habilitada para RBAC; **sin secretos ni asignaciones de roles** |
| Application Insights / Log Analytics (opcional) | Recursos y recopilación de registros del entorno; sin instrumentación personalizada de la aplicación, alertas o paneles |
| Document Intelligence | Cuenta S0; sin flujo de trabajo de procesamiento de documentos |

La búsqueda Legacy Bing Search v7 se retiró el 11 de agosto de 2025 y **no está provisionada**.
No se implementa ninguna integración de anclaje web de reemplazo.

**No incluido:** agentes de cliente/inventario, API del enrutador `/chat`, interfaz de chat frontend,
esquema de búsqueda o scripts de ingestión, Azure Container Registry, puntos finales privados,
identidades gestionadas, asignaciones RBAC, conmutación por error automática, Front Door, escáner de equipo rojo,
CLI de evaluación, autenticación o CI/CD.

Un mensaje de éxito de ARM solo confirma la provisión de recursos. No certifica
la funcionalidad de la aplicación, seguridad, disponibilidad ni preparación para producción.

## Prerrequisitos y costos

- Bash (Git Bash/WSL en Windows) y
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Una suscripción con permisos para crear todos los recursos listados.
- Verifique la disponibilidad de **cada modelo/versión/SKU en cada región seleccionada** y
  la cuota para su suscripción. Los valores predeterminados son ejemplos, no garantías.
  Consulte la [disponibilidad del modelo](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Elija un grupo de recursos dedicado que pueda eliminar después de las pruebas.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Ubicaciones predeterminadas: primaria `eastus2`, secundaria `westus2`, embeddings `francecentral`;
el evaluador usa la región primaria a menos que se suministre `graderLocation`.
`--no-multi-region` omite las cuentas secundaria y de embeddings; no omite la
cuenta del evaluador.

La búsqueda se cobra mientras está aprovisionada incluso cuando está vacía. Réplicas mínimas del contenedor,
redundancia de almacenamiento, solicitudes/almacenamiento de Cosmos DB, tokens del modelo, llamadas de Document Intelligence
e ingestión/almacenamiento de registros pueden generar cargos. No existe un
total mensual fijo ni validado. Estime los SKUs exactos en la
[calculadora de precios de Azure](https://azure.microsoft.com/pricing/calculator/) y
configure un presupuesto antes de implementar.

### Modos de despliegue

Estos ajustes son tamaños de recursos, **no certificaciones de producción o SLA**:

| Modo | Unidades de capacidad para chat / mini / embedding / grader | Réplicas de router | Réplicas de frontend | Nivel de búsqueda | Almacenamiento |
|---|---|---|---|---|---|
| minimal | 10 / 10 / 20 / 5 | 0–3 | 1–2 | básico, 1 réplica | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | estándar, 1 réplica | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 réplicas | Standard_GRS |

Las unidades de capacidad del modelo son específicas para cada modelo/SKU; no las sumes como una garantía universal de TPM.
Premium no habilita aplicaciones de contenedores con redundancia zonal: eso requiere
un diseño de red adicional. La búsqueda básica soporta búsqueda vectorial, sujeta a
límites de servicio; no es inherentemente incompatible con vectores.

## 🚀 Despliegue rápido

Revisa primero `azuredeploy.json` y `azuredeploy.parameters.json`. Los comandos
a continuación **crean recursos facturables de Azure**; no son verificaciones offline.

Desde la raíz del repositorio:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

El script usa rutas relativas a su propio directorio, verifica login/herramientas/argumentos,
crea el grupo de recursos si no existe, valida el despliegue, aprovisiona y
muestra salidas no secretas. No se requiere ni realiza `jq`, poblamiento de datos,
recuperación de secretos ni configuración de aplicaciones post-despliegue.

Los valores predeterminados del script en la línea de comandos anulan los valores correspondientes en el
archivo de parámetros. Edite el archivo de parámetros para configuraciones como regiones secundarias/terciarias;
use el despliegue directo por CLI si necesita anulaciones arbitrarias de parámetros:

```bash
az group create --name retail-learning-rg --location eastus2
az deployment group create \
  --resource-group retail-learning-rg \
  --name retail-learning \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --parameters projectName=retail environmentName=dev \
    deploymentMode=minimal enableMultiRegion=false
```

La provisión puede tardar entre 15 y 45 minutos o más, y puede fallar por cuotas regionales o
restricciones en el ciclo de vida del modelo. No reintente ciegamente: primero lea la operación fallida.

## Opciones de configuración

| Parámetro | Predeterminado en la plantilla | Significado |
|---|---|---|
| `projectName` | Requerido (`retail` en el archivo de parámetros) | 3–10 letras/dígitos en minúscula |
| `location` | Ubicación del grupo de recursos | Región primaria (`eastus2` en el archivo de parámetros) |
| `secondaryLocation` | `westus2` | Región de la cuenta de mini modelo |
| `tertiaryLocation` | `francecentral` | Región de la cuenta de embeddings |
| `graderLocation` | Región primaria | Región de la cuenta del evaluador independiente |
| `environmentName` | `dev` | `dev`, `staging`, o `prod`; solo nombre, no un interruptor de endurecimiento |
| `deploymentMode` | `standard` | Selección de SKU/capacidad |
| `enableMultiRegion` | `true` | Agregar cuentas secundarias y de incrustaciones |
| `enableMonitoring` | `true` | Agregar Insights/workspace y recopilación de registros de entorno |
| `enableSecurity` | `true` | Crear solo una bóveda habilitada para RBAC vacía |

Se eliminó el parámetro engañoso `openAiApiVersion`: una versión de API de plano de datos
no controla las versiones de recursos ARM ni las versiones de modelos. Los pares de nombre/versión de modelo
están en `variables.modelDeployments`; verifíquelos junto con el SKU de implementación.

## Verificar la provisión

Use el nombre de implementación de la salida del script o `az deployment group list`.
Para la implementación directa anterior:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Esperado: estado de implementación `Succeeded`. En caso de fallo, inspeccione los detalles del error de operación.
La salida de la lista de recursos por sí sola no es una verificación fiable del estado de provisión.

Pruebe el marcador de posición **root**, no un endpoint de agente inexistente:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Esperado: página HTTP 200 de hola mundo, **no una respuesta de chat**. Un error HTTP
no cuenta como verificación exitosa.

Para probar la inferencia real del modelo primario (facturable):

```bash
OPENAI_ENDPOINT=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.openAiEndpointPrimary.value -o tsv)
OPENAI_NAME=$(az cognitiveservices account list -g "$RG" \
  --query "[?kind=='OpenAI' && contains(name, '-openai-primary-')].name | [0]" -o tsv)
OPENAI_KEY=$(az cognitiveservices account keys list -g "$RG" -n "$OPENAI_NAME" \
  --query key1 -o tsv)
curl --fail-with-body \
  "${OPENAI_ENDPOINT%/}/openai/deployments/gpt-4.1-chat/chat/completions?api-version=2024-10-21" \
  -H "Content-Type: application/json" -H "api-key: $OPENAI_KEY" \
  -d '{"messages":[{"role":"user","content":"Say hello"}],"max_tokens":20}'
unset OPENAI_KEY
```

Esperado: JSON con `choices` y `usage`. El nombre de implementación es
`gpt-4.1-chat`, no el nombre del modelo subyacente `gpt-4.1`.

## 🔧 Posdespliegue: Próximos pasos

Esto es una **lista de tareas de desarrollo**, no un ejercicio terminado:

1. Implementar agentes autenticados de cliente/inventario y el contrato del enrutador.
2. Implementar el frontend y validar su configuración.
3. Crear y poblar un índice de búsqueda con una dimensión/perfil que coincida con su
   modelo de incrustación, y gestionar los fallos y actualizaciones de documentos.
4. Crear un registro y configurar la identidad/permisos para la extracción de imágenes.
5. Construir y enviar imágenes reales. Cambiar los puertos de entrada y sondas de Container App
   para que coincidan con esas imágenes antes de probar; el puerto 80 aquí pertenece a los marcadores de posición.
6. Configurar secretos o identidades administradas y roles de plano de datos con alcance. No
   haga referencia a nombres de secretos imaginarios: esta plantilla no crea secretos de aplicación.
7. Instrumentar aplicaciones, configurar alertas, probar fallo/recuperación y evaluar
   resultados con verdad representativa y revisión humana.

Consulte el [plano de arquitectura](../retail-scenario.md) para los límites de diseño.

## Solución de problemas y límites de seguridad

- **Modelo no disponible:** verifique modelo/versión/SKU, región y cuota de suscripción;
  el script no preconfigura catálogos de modelos.
- **Monitoreo deshabilitado:** el destino de registro del entorno es `none`, no una
  configuración vacía inválida de Log Analytics.
- **Solo marcadores de posición:** `/chat`, evaluación de agentes e ingesta de archivos no existen.
- **Red/identidad:** las terminales públicas y la autenticación local están habilitadas.
  El simple hecho de habilitar RBAC en Key Vault no crea asignaciones de roles ni identidades.
- **Producción:** agregue autenticación, identidades con alcance, gestión de secretos,
  redes privadas donde corresponda, diseño de disponibilidad y pruebas operativas.
  Las cuentas de modelos multirregión por sí solas no proporcionan conmutación por error.

## Limpieza

No hay un proyecto AZD aquí; `azd down` no es el comando de limpieza.
Después de verificar que el grupo solo contiene sus recursos de aprendizaje:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Esperado después de que termine la eliminación: `false`. Los recursos eliminados suavemente de Key Vault y Cognitive Services
pueden conservar nombres; la purga requiere permisos adecuados.
Verifique Cost Management para cargos de uso retrasados.

[Reportar un problema](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
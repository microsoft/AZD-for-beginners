# Creación de Tu Propia Plantilla azd

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 4 - Infraestructura como Código y Despliegue
- **⬅️ Anterior**: [Guía de Despliegue](deployment-guide.md)
- **🚀 Siguiente Capítulo**: [Capítulo 5: Soluciones Multi-Agente](../chapter-05-multi-agent/README.md)

> Validado con `azd 1.27.1` en julio de 2026.

## Introducción

Hasta ahora has *consumido* plantillas con `azd init --template <nombre>`. Pero una vez que tengas un diseño de proyecto que le guste a tu equipo—por ejemplo, una Aplicación en Contenedor con una base de datos Cosmos DB y el monitoreo adecuado—querrás convertirlo en una plantilla reutilizable propia. Una plantilla es simplemente un repositorio Git con una estructura predecible que azd sabe cómo leer. Esta lección te muestra cómo crear una desde cero, probarla y (opcionalmente) publicarla en la galería comunitaria.

## Objetivos de Aprendizaje

Al final de esta lección, podrás:
- Entender qué convierte una carpeta en una "plantilla azd"
- Conocer los archivos y la estructura de carpetas requeridos
- Agregar un `azure.yaml` y `infra/` que otras personas puedan reutilizar
- Probar tu plantilla localmente antes de compartirla
- Publicarla y (opcionalmente) enviarla a Awesome AZD

## Resultados de Aprendizaje

Después de completar esta lección, podrás:
- Crear un nuevo repositorio de plantilla
- Parametrizar la infraestructura para que funcione en cualquier suscripción
- Validar una plantilla con `azd init` y `azd up`
- Agregar los metadatos requeridos por la galería comunitaria

---

## ¿Qué Es Realmente una Plantilla?

Una plantilla azd es **un repositorio Git** que contiene, como mínimo:

| Archivo / carpeta | Propósito | ¿Requerido? |
|-----------------|-----------|------------|
| `azure.yaml` | Describe servicios, hosts, y proveedor de infraestructura | ✅ Sí |
| `infra/` | Bicep, Terraform, o Pulumi que provisiona recursos | ✅ Sí |
| `src/` (o tu código) | El código de aplicación que azd despliega | ✅ Sí |
| `README.md` | Cómo usar la plantilla | ✅ Muy recomendado |
| `.azdo/` o `.github/` | Definiciones de pipeline CI/CD | Opcional |
| `.devcontainer/` | Entorno de desarrollo reproducible | Opcional |
| `azure.yaml` `metadata` | Información para galería + telemetría | Opcional (requerido para publicar) |

No hay nada mágico aquí: cuando ejecutas `azd init --template you/your-repo`, azd clona el repositorio y lee `azure.yaml`.

---

## Paso 1: Crear la Estructura del Repositorio

Crea la estructura de carpetas manualmente o parte de una plantilla minimalista y edítala:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Crear el diseño estándar
mkdir -p src infra
```

Un diseño terminado típico se ve así:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## Paso 2: Escribir `azure.yaml`

Este es el corazón de la plantilla. Le indica a azd qué desplegar y cómo:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> El campo `metadata.template` es el que usa la telemetría de la galería para contar uso. Usa la convención `nombre@versión`.

---

## Paso 3: Parametrizar la Infraestructura

La regla más importante para una plantilla *reutilizable*: **nunca codifiques nombres, regiones, o valores específicos de suscripción.** Usa parámetros y el patrón de token recurso para que la misma plantilla funcione en cualquier suscripción.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Dos cosas hacen esta plantilla amigable:

1. Etiqueta **`azd-env-name`** — azd la usa para rastrear y limpiar recursos por ambiente.
2. Token recurso **`uniqueString(...)`** — produce un sufijo estable y globalmente único para que los nombres no colisionen.

Proporciona un archivo de parámetros coincidente que lea valores que azd inyecta desde el entorno:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd sustituye `${AZURE_ENV_NAME}` y `${AZURE_LOCATION}` del entorno actual automáticamente.

---

## Paso 4: Prueba Tu Plantilla Localmente

Antes de compartir, demuestra que la plantilla funciona desde un estado limpio.

**Prueba desde la carpeta local** (no se requiere subir a Git):

```bash
# Desde un directorio vacío, inicialice usando su ruta de plantilla local
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisionar + desplegar de extremo a extremo
azd auth login
azd up
```

**Luego prueba la eliminación**—una buena plantilla limpia completamente:

```bash
azd down --force --purge
```

Si `azd down` deja recursos, probablemente te hayas olvidado de la etiqueta `azd-env-name` en algún recurso.

> **Consejo:** ejecuta `azd provision --preview` primero. Hace un what-if y muestra errores de plantilla antes de crear recursos.

---

## Paso 5: Publicar la Plantilla

Sube el repositorio a GitHub (público si quieres que otros lo usen):

```bash
gh repo create my-azd-template --public --source=. --push
```

Cualquiera ahora puede usarlo:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Paso 6 (Opcional): Enviar a Awesome AZD

La [galería Awesome AZD](https://azure.github.io/awesome-azd/) lista plantillas comunitarias. Para ser listado tu repositorio debería incluir:

- ✅ Un claro `README.md` con prerrequisitos, un diagrama de arquitectura, y notas de costos
- ✅ Un `azure.yaml` funcional con `metadata.template`
- ✅ Infraestructura que se pueda provisionar limpiamente en una suscripción nueva
- ✅ Un archivo `LICENSE`
- ✅ (Recomendado) Un `.devcontainer/` para Codespaces con un clic

Envía tu contribución abriendo un pull request que agregue tu plantilla al archivo de datos de la galería, siguiendo la guía de contribución en el [repositorio Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Errores Comunes

| Error | Solución |
|--------|----------|
| Nombres de recursos codificados | Usa el token recurso `uniqueString()` |
| `azd down` deja recursos | Etiqueta todos los recursos (o el grupo de recursos) con `azd-env-name` |
| La plantilla funciona para ti, falla para otros | Elimina IDs de suscripción, IDs de tenant y suposiciones de región |
| Salidas no conectadas a la app | Exporta `SERVICE_<NAME>_ENDPOINT_URL` y otras salidas `AZURE_*` |
| Rechazo en la sumisión a la galería | Agrega `README.md`, `LICENSE`, y `metadata.template` |

---

## Resumen

- Una plantilla es solo un repo Git con `azure.yaml`, `infra/`, y tu código.
- Parametriza todo—nombres, regiones, e IDs—para que funcione en cualquier lugar.
- Siempre etiqueta los recursos con `azd-env-name` para que `azd down` funcione.
- Prueba localmente con `azd init --template <ruta-local>` antes de publicar.
- Agrega metadatos y un README para enviar a Awesome AZD.

---

## 🔗 Navegación

| Dirección | Recurso |
|-----------|---------|
| **Anterior** | [Guía de Despliegue](deployment-guide.md) |
| **Inicio del Capítulo** | [Capítulo 4: Infraestructura como Código](README.md) |
| **Siguiente Capítulo** | [Capítulo 5: Soluciones Multi-Agente](../chapter-05-multi-agent/README.md) |

## 📖 Recursos Relacionados

- [Provisionamiento de Recursos](provisioning.md)
- [Galería Awesome AZD](https://azure.github.io/awesome-azd/)
- [Documentación oficial de plantillas azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
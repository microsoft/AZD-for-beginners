# Creación de tu propia plantilla azd

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD para Principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 4 - Infraestructura como Código y Despliegue
- **⬅️ Anterior**: [Guía de despliegue](deployment-guide.md)
- **🚀 Capítulo siguiente**: [Capítulo 5: Soluciones multiagente](../chapter-05-multi-agent/README.md)

> Validado contra `azd 1.25.6` en junio de 2026.

## Introducción

Hasta ahora has *consumido* plantillas con `azd init --template <name>`. Pero una vez que tengas un diseño de proyecto que le guste a tu equipo —por ejemplo, una Container App con una Cosmos DB y el monitoreo adecuado— querrás convertirlo en una plantilla reutilizable propia. Una plantilla es simplemente un repositorio Git con una estructura predecible que azd sabe leer. Esta lección te muestra cómo construir una desde cero, probarla y (opcionalmente) publicarla en la galería comunitaria.

## Objetivos de aprendizaje

Al final de esta lección, podrás:
- Entender qué convierte una carpeta en una "plantilla azd"
- Conocer los archivos y la estructura de carpetas requeridos
- Añadir un `azure.yaml` y `infra/` que otras personas puedan reutilizar
- Probar tu plantilla localmente antes de compartirla
- Publicarla y (opcionalmente) enviarla a Awesome AZD

## Resultados del aprendizaje

Después de completar esta lección, serás capaz de:
- Generar un repositorio de plantilla nuevo
- Parametrizar la infraestructura para que funcione en cualquier suscripción
- Validar una plantilla con `azd init` y `azd up`
- Añadir los metadatos que requiere la galería comunitaria

---

## ¿Qué es realmente una plantilla?

Una plantilla azd es **un repositorio Git** que contiene, como mínimo:

| Archivo / carpeta | Propósito | ¿Requerido? |
|---------------|---------|-----------|
| `azure.yaml` | Describe servicios, hosts y el proveedor de infraestructura | ✅ Sí |
| `infra/` | Bicep, Terraform o Pulumi que aprovisiona recursos | ✅ Sí |
| `src/` (o tu código) | El código de la aplicación que azd despliega | ✅ Sí |
| `README.md` | Cómo usar la plantilla | ✅ Altamente recomendado |
| `.azdo/` o `.github/` | Definiciones de canalizaciones CI/CD | Opcional |
| `.devcontainer/` | Entorno de desarrollo reproducible | Opcional |
| `azure.yaml` `metadata` | Galería + información de telemetría | Opcional (requerido para publicar) |

No hay nada mágico aquí: cuando ejecutas `azd init --template you/your-repo`, azd clona el repo y lee `azure.yaml`.

---

## Paso 1: Crear la estructura del repositorio

Crea la estructura de carpetas manualmente o parte de una plantilla mínima y edítala:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Crear el diseño estándar
mkdir -p src infra
```

Una estructura típica final se ve así:

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

Este es el núcleo de la plantilla. Le indica a azd qué desplegar y cómo:

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

> El campo `metadata.template` es lo que usa la telemetría de la galería para contabilizar el uso. Usa la convención `name@version`.

---

## Paso 3: Parametrizar la infraestructura

La regla más importante para una plantilla *reutilizable*: **nunca codifiques nombres, regiones o valores específicos de una suscripción.** Usa parámetros y el patrón de token de recurso para que la misma plantilla funcione en la suscripción de cualquiera.

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

Dos cosas hacen que esta plantilla sea apta para reutilizar:

1. **Etiqueta `azd-env-name`** — azd la usa para rastrear y limpiar recursos por entorno.
2. **Token de recurso `uniqueString(...)`** — produce un sufijo estable y globalmente único para que los nombres no colisionen.

Proporciona un archivo de parámetros correspondiente que lea valores que azd inyecta desde el entorno:

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

azd sustituye `${AZURE_ENV_NAME}` y `${AZURE_LOCATION}` desde el entorno actual automáticamente.

---

## Paso 4: Prueba tu plantilla localmente

Antes de compartir, demuestra que la plantilla funciona desde un estado limpio.

**Prueba desde la carpeta local** (no se requiere push a Git):

```bash
# Desde un directorio vacío, inicializa usando la ruta de plantilla local
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Aprovisionar y desplegar de extremo a extremo
azd auth login
azd up
```

**Luego prueba la eliminación**—una buena plantilla limpia por completo:

```bash
azd down --force --purge
```

Si `azd down` deja recursos, probablemente olvidaste la etiqueta `azd-env-name` en algún recurso.

> **Consejo:** ejecuta `azd provision --preview` primero. Realiza un what-if y muestra errores de la plantilla antes de que se cree cualquier recurso.

---

## Paso 5: Publicar la plantilla

Publica el repositorio en GitHub (público si quieres que otros lo usen):

```bash
gh repo create my-azd-template --public --source=. --push
```

Cualquiera ahora puede usarlo:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Paso 6 (Opcional): Enviar a Awesome AZD

La galería [Awesome AZD](https://azure.github.io/awesome-azd/) enumera plantillas de la comunidad. Para aparecer en la lista, tu repositorio debe incluir:

- ✅ Un `README.md` claro con requisitos previos, un diagrama de arquitectura y notas sobre costos
- ✅ Un `azure.yaml` funcional con `metadata.template`
- ✅ Infraestructura que se aprovisione correctamente en una suscripción nueva
- ✅ Un archivo `LICENSE`
- ✅ (Recomendado) Un `.devcontainer/` para Codespaces con un clic

Envíalo abriendo un pull request que añada tu plantilla al archivo de datos de la galería, siguiendo la guía de contribución en el [repositorio Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Errores comunes

| Problema | Solución |
|---------|-----|
| Nombres de recursos codificados | Usa el token de recurso `uniqueString()` |
| `azd down` deja recursos | Etiqueta cada recurso (o el grupo de recursos) con `azd-env-name` |
| La plantilla funciona para ti, falla para otros | Elimina IDs de suscripción, IDs de tenant y supuestos de región |
| Salidas no conectadas a la app | Exporta `SERVICE_<NAME>_ENDPOINT_URL` y otras salidas `AZURE_*` |
| Envío a la galería rechazado | Añade `README.md`, `LICENSE` y `metadata.template` |

---

## Resumen

- Una plantilla es solo un repositorio Git con `azure.yaml`, `infra/` y tu código.
- Parametriza todo: nombres, regiones e IDs, para que se ejecute en cualquier lugar.
- Siempre etiqueta los recursos con `azd-env-name` para que `azd down` funcione.
- Prueba localmente con `azd init --template <local-path>` antes de publicar.
- Añade metadatos y un README para enviar a Awesome AZD.

---

## 🔗 Navegación

| Dirección | Recurso |
|-----------|----------|
| **Anterior** | [Guía de despliegue](deployment-guide.md) |
| **Inicio del capítulo** | [Capítulo 4: Infraestructura como Código](README.md) |
| **Capítulo siguiente** | [Capítulo 5: Soluciones multiagente](../chapter-05-multi-agent/README.md) |

## 📖 Recursos relacionados

- [Aprovisionamiento de recursos](provisioning.md)
- [Galería Awesome AZD](https://azure.github.io/awesome-azd/)
- [Documentación oficial de plantillas azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
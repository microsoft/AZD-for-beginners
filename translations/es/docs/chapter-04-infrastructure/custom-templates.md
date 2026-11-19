# Creación de Tu Propia Plantilla azd

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 4 - Infraestructura como Código y Despliegue
- **⬅️ Anterior**: [Guía de Despliegue](deployment-guide.md)
- **🚀 Siguiente Capítulo**: [Capítulo 5: Soluciones Multi-Agente](../chapter-05-multi-agent/README.md)

> Revisado contra `azd 1.37.2` (noviembre de 2026). Esta es una **guía de creación con archivos parciales**, no una plantilla completa: debes proporcionar el código de la aplicación y `modules/web.bicep` con su entorno, registro, Aplicación de Contenedor y salidas antes del despliegue. No se ejecutó aprovisionamiento de Azure en esta revisión.

## Introducción

Hasta ahora has *consumido* plantillas con `azd init --template <name>`. Pero una vez que tengas un diseño de proyecto que a tu equipo le guste—por ejemplo, una Aplicación de Contenedor con Cosmos DB y el monitoreo adecuado—querrás convertirlo en una plantilla reusable propia. Una plantilla es simplemente un repositorio Git con una estructura predecible que azd sabe cómo leer. Esta lección te muestra cómo construir una desde cero, probarla y (opcionalmente) publicarla en la galería comunitaria.

## Objetivos de Aprendizaje

Al final de esta lección, podrás:
- Entender qué hace que una carpeta sea una "plantilla azd"
- Conocer los archivos y la estructura de carpetas requeridos
- Agregar un `azure.yaml` y `infra/` que otros puedan reutilizar
- Probar tu plantilla localmente antes de compartirla
- Publicarla y (opcionalmente) enviarla a Awesome AZD

## Resultados de Aprendizaje

Después de completar esta lección, podrás:
- Crear un nuevo repositorio de plantilla
- Parametrizar la infraestructura para que funcione en cualquier suscripción
- Validar una plantilla con `azd init` y `azd up`
- Añadir los metadatos que requiere la galería comunitaria

---

## ¿Qué es Realmente una Plantilla?

Una plantilla azd es **un repositorio Git** que contiene, como mínimo:

| Archivo / carpeta | Propósito | ¿Requerido? |
|---------------|---------|-----------|
| `azure.yaml` | Describe servicios, hosts y proveedor de infraestructura | ✅ Sí |
| `infra/` | Definiciones de aprovisionamiento Bicep o Terraform | Requerido para este ejemplo explícito de IaC; proyectos con infraestructura generada pueden omitirlo |
| `src/` (o tu código) | El código de aplicación que azd despliega | Requerido para servicios basados en código fuente; no todas las plantillas contienen código de aplicación |
| `README.md` | Cómo usar la plantilla | ✅ Altamente recomendado |
| `.azdo/` o `.github/` | Definiciones de pipeline CI/CD | Opcional |
| `.devcontainer/` | Entorno de desarrollo reproducible | Opcional |
| `azure.yaml` `metadata` | Información de identidad/telemetría de la plantilla | Recomendado; publicar un repositorio Git no lo requiere |

No hay nada mágico aquí: cuando ejecutas `azd init --template you/your-repo`, azd clona el repositorio y lee `azure.yaml`.

---

## Paso 1: Construye la Estructura del Repositorio

Crea la estructura de carpetas a mano o parte de una plantilla mínima y edítala:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Un diseño típico terminado se ve así:

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

## Paso 2: Escribe `azure.yaml`

Esta es el corazón de la plantilla. Le dice a azd qué desplegar y cómo:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> El campo `metadata.template` es lo que la telemetría de la galería usa para contar el uso. Usa la convención `name@version`.

---

## Paso 3: Parametriza la Infraestructura

La regla más importante para una plantilla *reusable*: **nunca codifiques nombres, regiones o valores específicos de suscripción.** Usa parámetros y el patrón de token de recursos para que la misma plantilla funcione en la suscripción de cualquiera.

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Dos cosas hacen que esta plantilla sea amigable:

1. **Etiqueta `azd-env-name`** — azd la usa para rastrear y limpiar recursos por ambiente.
2. **Token de recurso `uniqueString(...)`** — produce un sufijo hash estable para reducir colisiones; no garantiza unicidad global.

El `modules/web.bicep` faltante debe aceptar `name`, `location` y `tags`, aprovisionar el entorno/registro y la Aplicación de Contenedores, etiquetar la app con `azd-service-name: web` y exportar `uri`. También debe exponer valores del registro necesarios para el flujo de construcción/despliegue elegido (por ejemplo `AZURE_CONTAINER_REGISTRY_ENDPOINT` desde el módulo raíz). Solo una salida endpoint no conecta el descubrimiento del servicio, configuraciones de la aplicación o autenticación de registro.

Proporciona un archivo de parámetros correspondiente que lea valores que azd inyecte desde el ambiente:

Guarda lo siguiente como `infra/main.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd sustituye `${AZURE_ENV_NAME}` y `${AZURE_LOCATION}` automáticamente desde el ambiente actual.

---

## Paso 4: Prueba Tu Plantilla Localmente

Antes de compartir, prueba que la plantilla funcione desde un estado limpio.

**Prueba desde la carpeta local** (no se requiere push a Git):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Luego prueba el desmontaje**—una buena plantilla limpia completamente:

```bash
azd down --force --purge
```

Si `azd down` deja recursos, verifica descubrimiento del ambiente/grupo de recursos, recursos externos/compartidos, permisos, bloqueos y protección de purga. `--purge` no elimina el estado local `.azure/`.

> **Consejo:** después de proporcionar todos los archivos faltantes, ejecuta `azd provision --preview` primero. Inspecciona hooks antes del preview porque pueden ejecutar comandos con efectos secundarios. Preview no es una estimación de precio ni una garantía de que el aprovisionamiento tendrá éxito.

---

## Paso 5: Publica la Plantilla

Envía el repositorio a GitHub (público si quieres que otros la usen):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Ahora cualquiera puede usarlo:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Paso 6 (Opcional): Envía a Awesome AZD

La [galería Awesome AZD](https://azure.github.io/awesome-azd/) lista plantillas comunitarias. Para ser listado tu repositorio debe incluir:

- ✅ Un `README.md` claro con prerequisitos, diagrama de arquitectura y notas de costos
- ✅ Un `azure.yaml` funcional con `metadata.template`
- ✅ Infraestructura que se aprovisione limpiamente en una suscripción nueva
- ✅ Un archivo `LICENSE`
- ✅ (Recomendado) Un `.devcontainer/` para Codespaces con un clic

Envía abriendo un pull request que agregue tu plantilla al archivo de datos de la galería, siguiendo la guía de contribución en el [repositorio Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Errores Comunes

| Error | Solución |
|---------|-----|
| Nombres de recursos codificados | Usa el token de recurso `uniqueString()` |
| `azd down` deja recursos | Etiqueta cada recurso (o el grupo de recursos) con `azd-env-name` |
| La plantilla funciona para ti, falla para otros | Elimina IDs de suscripción, IDs de inquilino y supuestos de región |
| Salidas no conectadas a la app | Coincide `azd-service-name`/`resourceName` para el despliegue y mapea explícitamente salidas a configuraciones de la app |
| Envío a la galería rechazado | Añade `README.md`, `LICENSE` y `metadata.template` |

---

## Resumen

- Una plantilla es solo un repo Git con `azure.yaml`, `infra/` y tu código.
- Parametriza todo—nombres, regiones e IDs—para que funcione en cualquier lugar.
- Siempre etiqueta recursos con `azd-env-name` para que `azd down` funcione.
- Prueba localmente con `azd init --template <local-path>` antes de publicar.
- Añade metadatos y un README para enviar a Awesome AZD.

---

## 🔗 Navegación

| Dirección | Recurso |
|-----------|----------|
| **Anterior** | [Guía de Despliegue](deployment-guide.md) |
| **Inicio del Capítulo** | [Capítulo 4: Infraestructura como Código](README.md) |
| **Siguiente Capítulo** | [Capítulo 5: Soluciones Multi-Agente](../chapter-05-multi-agent/README.md) |

## 📖 Recursos Relacionados

- [Aprovisionamiento de Recursos](provisioning.md)
- [Galería Awesome AZD](https://azure.github.io/awesome-azd/)
- [Documentación oficial de la plantilla azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
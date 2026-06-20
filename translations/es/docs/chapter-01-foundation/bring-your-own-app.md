# Trae tu propia aplicación - Agregar azd a un proyecto existente

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Tu primer proyecto](first-project.md)
- **➡️ Next**: [Dev Containers y Codespaces](dev-containers.md)

> Validated against `azd 1.25.6` in June 2026.

## Introducción

En [Tu primer proyecto](first-project.md) desplegaste una aplicación empezando desde una plantilla. Pero la mayoría de las veces ya tienes una aplicación: una API Node.js, un servicio Python Flask, una aplicación web .NET, ubicada en una carpeta en tu máquina. Esta lección muestra cómo agregar azd a ese código existente para que puedas desplegarlo con `azd up`, sin necesidad de plantilla.

## Objetivos de aprendizaje

Al final de esta lección, podrás:
- Entender las tres formas de iniciar un proyecto azd
- Ejecutar `azd init` dentro de una base de código existente
- Entender qué hacen `azure.yaml` y la carpeta `infra/` para tu aplicación
- Saber cuándo dejar que azd genere la infraestructura vs. escribir la tuya
- Desplegar tu aplicación existente en Azure con `azd up`

## Resultados de aprendizaje

Después de completar esta lección, serás capaz de:
- Inicializar azd en un proyecto que ya tienes
- Leer y editar un archivo básico `azure.yaml`
- Generar infraestructura inicial con `azd infra generate`
- Elegir un host de Azure apropiado para tu aplicación
- Desplegar y limpiar tu propia aplicación

---

## Tres maneras de iniciar un proyecto azd

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Learning, or starting a new app from a proven sample |
| **From your existing code** | `azd init` (in your project folder) | You already have an app and want to deploy it |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Adopting azd for an existing repository |

Ya practicaste la primera opción. Esta lección cubre la segunda—el escenario real más común.

---

## Paso 1: Ejecuta `azd init` en tu proyecto

Abre una terminal **dentro de la carpeta de tu proyecto existente** y ejecuta:

```bash
cd my-existing-app
azd init
```

azd preguntará cómo quieres inicializar. Elige:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Selecciona **"Usar el código en el directorio actual."** azd entonces escanea tu carpeta, detecta tu lenguaje y framework, y propone un host.

### Qué detecta azd

azd busca señales como `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, o un `Dockerfile`, y sugiere un host de Azure coincidente:

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service or Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Confirma el/los servicio(s) detectado(s), y azd crea el andamiaje de los archivos que necesitas.

---

## Paso 2: Entiende lo que azd creó

Después de init, tendrás dos cosas nuevas en tu proyecto:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — la definición del proyecto

Este es el corazón de un proyecto azd. Uno mínimo se ve así:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

El bloque `services` es la parte clave: cada entrada mapea una carpeta de tu código a un host de Azure. Si tu aplicación tiene tanto un frontend como una API, tendrás dos servicios.

### `infra/` — tus recursos de Azure como código

La carpeta `infra/` contiene archivos Bicep que definen los recursos de Azure que tu aplicación necesita (el App Service, la base de datos, etc.). No tienes que escribirlos a mano—azd genera un punto de partida funcional. Puedes editarlos después para agregar recursos o reforzar la seguridad (abordado en [Capítulo 4](../chapter-04-infrastructure/README.md)).

> **Consejo:** ¿Quieres ver o personalizar la infraestructura generada antes de desplegar? Ejecuta `azd infra generate` (también disponible como `azd infra synth`) para escribir la IaC en disco y así poder revisarla y controlarla con versiones.

---

## Paso 3: Establece la configuración requerida

Si tu aplicación necesita configuraciones o secretos (una cadena de conexión, una clave API), no los codifiques en el código. Usa valores de entorno:

```bash
# Crear un entorno
azd env new dev

# Establecer un valor no secreto
azd env set API_VERSION 1.0.0
```

Para secretos reales, almacénalos en Key Vault y referéncialos desde tu infraestructura—consulta [Capítulo 3: Configuración y Autenticación](../chapter-03-configuration/authsecurity.md).

---

## Paso 4: Desplegar

Ahora usa el mismo flujo de trabajo que ya conoces:

```bash
# Autenticar (requerido para azd)
azd auth login

# Previsualizar los recursos que se crearán
azd provision --preview

# Aprovisionar infraestructura y desplegar tu código
azd up
```

Cuando termine, azd imprime la URL de tu aplicación. Verifícala de la misma manera que cualquier app azd:

```bash
azd show           # mostrar endpoints
azd monitor --logs # revisar los registros si es necesario
```

---

## Problemas comunes la primera vez

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Add the manifest, or pick the host manually during `azd init` |
| Build fails during `azd up` | App needs a build step | Add `buildCommand`/`outputPath` under the service in `azure.yaml` |
| App starts but returns errors | Missing config/secret | Set values with `azd env set` or wire up Key Vault |
| Wrong host chosen | Auto-detection guessed | Edit `host:` in `azure.yaml` and re-run `azd up` |

Para más, consulta [Capítulo 7: Solución de problemas](../chapter-07-troubleshooting/README.md).

---

## Limpieza

```bash
azd down --force --purge
```

---

## Resumen

- `azd init` → **"Usar el código en el directorio actual"** añade azd a una aplicación que ya tienes.
- `azure.yaml` mapea tus carpetas de código a hosts de Azure; `infra/` define los recursos como Bicep.
- `azd infra generate` te permite revisar o personalizar la infraestructura generada.
- Una vez inicializado, tu aplicación existente usa el mismo flujo de trabajo `azd up` / `azd down` que una app basada en plantilla.

---

## 🔗 Navegación

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Tu primer proyecto](first-project.md) |
| **Next** | [Dev Containers y Codespaces](dev-containers.md) |

## 📖 Recursos relacionados

- [Conceptos básicos de AZD](azd-basics.md)
- [Capítulo 4: Infraestructura como Código](../chapter-04-infrastructure/README.md)
- [Configuración y Autenticación](../chapter-03-configuration/authsecurity.md)
- [Hoja de referencia de comandos](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
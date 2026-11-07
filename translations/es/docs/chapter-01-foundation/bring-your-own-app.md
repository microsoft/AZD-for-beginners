# Trae Tu Propia Aplicación - Añadir azd a un Proyecto Existente

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 1 - Fundamentos y Inicio Rápido
- **⬅️ Anterior**: [Tu Primer Proyecto](first-project.md)
- **➡️ Siguiente**: [Dev Containers & Codespaces](dev-containers.md)

> Objetivo de la revisión de comando y configuración: `azd 1.37.2` (noviembre 2026). Los archivos generados dependen de la aplicación detectada; no se ejecutó despliegue en Azure en esta revisión.

## Introducción

En [Tu Primer Proyecto](first-project.md) desplegaste una aplicación comenzando desde una plantilla. Pero la mayoría de las veces ya *tienes* una aplicación — una API de Node.js, un servicio Python Flask, una aplicación web .NET — en una carpeta en tu máquina. Esta lección muestra cómo añadir azd a ese código existente para que puedas desplegarlo con `azd up`, sin necesidad de plantilla.

## Objetivos de Aprendizaje

Al final de esta lección, serás capaz de:
- Entender las tres formas de iniciar un proyecto azd
- Ejecutar `azd init` dentro de una base de código existente
- Comprender qué hacen `azure.yaml` y la carpeta `infra/` para tu aplicación
- Saber cuándo dejar que azd genere la infraestructura vs. escribir la tuya propia
- Desplegar tu aplicación existente en Azure con `azd up`

## Resultados de Aprendizaje

Después de completar esta lección, podrás:
- Inicializar azd en un proyecto que ya tienes
- Leer y editar un archivo básico `azure.yaml`
- Generar infraestructura inicial con `azd infra generate`
- Elegir un host de Azure apropiado para tu aplicación
- Desplegar y limpiar tu propia aplicación

---

## Tres Formas de Iniciar un Proyecto azd

| Punto de partida | Comando | Cuándo usar |
|----------------|---------|-------------|
| **Desde una plantilla** | `azd init --template <name> .` (directorio vacío) | Aprendizaje o comenzar una nueva aplicación desde un ejemplo probado |
| **Desde tu código existente** | `azd init` (en tu carpeta de proyecto) | Ya tienes una aplicación y quieres desplegarla |
| **Desde un repositorio Git** | `azd init --from-code` (en un repositorio clonado) | Adoptar azd para un repositorio existente |

Ya practicaste la primera opción. Esta lección cubre la segunda — el escenario más común en el mundo real.

---

## Paso 1: Ejecutar `azd init` en Tu Proyecto

Abre un terminal **dentro de la carpeta de tu proyecto existente** y ejecuta:

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

Selecciona **"Usar código en el directorio actual."** azd entonces escanea tu carpeta, detecta tu lenguaje y framework, y propone un host.

### Lo que azd detecta

azd busca señales de la aplicación tales como `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, o un `Dockerfile`. El flujo desde código no es un asistente general de selección de host para cada objetivo de despliegue soportado:

| Tu aplicación | Host probablemente detectado |
|----------|----------------------|
| Aplicación web de Node.js / Python / .NET soportada | Típicamente Azure Container Apps; inspecciona la definición generada |
| Aplicación en contenedor (`Dockerfile`) | Azure Container Apps |
| Aplicación Function o proyecto Static Web Apps | Usa una plantilla que coincida o crea `azure.yaml` e infraestructura si desde código no soporta tu disposición |

Confirma el/los servicio(s) detectados, y azd genera los archivos que necesitas.

---

## Paso 2: Entender Qué azd Creó

Después de la inicialización, inspecciona `azure.yaml`. El flujo de infraestructura generada puede mantener la infraestructura implícita hasta que ejecutes `azd infra generate`; no asumas que `infra/` ya existe:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — la definición del proyecto

Este es el corazón de un proyecto azd. La siguiente **definición ilustrativa de App Service** requiere infraestructura de App Service correspondiente; no es razón para cambiar un host generado de Container Apps sin cambiar la infraestructura:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

El bloque `services` es la parte clave: cada entrada asigna una carpeta de tu código a un host en Azure. Si tu aplicación tiene tanto un frontend como una API, tendrás dos servicios.

### `infra/` — tus recursos de Azure como código

La carpeta `infra/` contiene archivos Bicep que definen los recursos de Azure que tu aplicación necesita (el App Service, la base de datos, etc.). No tienes que escribirlos a mano—azd genera un punto inicial funcional. Puedes *editar* estos después para añadir recursos o reforzar la seguridad (cubierto en [Capítulo 4](../chapter-04-infrastructure/README.md)).

> **Consejo:** ¿Quieres ver o personalizar la infraestructura generada antes de desplegar? Ejecuta `azd infra generate` (también disponible como `azd infra synth`) para escribir la IaC en disco y poder revisarla y controlarla con versiones.

---

## Paso 3: Configura la Configuración Requerida

Si tu app necesita configuraciones o secretos (una cadena de conexión, una clave API), no las codifiques directamente. Usa valores de entorno:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Esto almacena un valor local sólo. Para afectar la app, consúmelo explícitamente en parámetros de infraestructura, una configuración de servicio soportada, o un hook; configurar una variable arbitraria no configura el runtime desplegado.

Para secretos reales, guárdalos en Key Vault y refiérete a ellos desde tu infraestructura—consulta [Capítulo 3: Configuración y Autenticación](../chapter-03-configuration/authsecurity.md).

---

## Paso 4: Desplegar

Ahora usa el mismo flujo que ya conoces:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Cuando termine, azd muestra la URL de tu app. Verifícala del mismo modo que cualquier app azd:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Problemas Comunes al Iniciar

| Síntoma | Causa probable | Solución |
|---------|--------------|-----|
| azd no detectó mi app | Falta manifiesto (p. ej., `package.json`) | Añade el manifiesto, o elige el host manualmente durante `azd init` |
| Fallo en compilación durante `azd up` | La app necesita un paso de build | Configura los scripts del paquete de la app o un hook de servicio `prepackage`; usa `dist` para salida del despliegue, no `buildCommand`/`outputPath` |
| La app inicia pero retorna errores | Faltan configuración/secreto | Conecta valores a configuraciones del runtime en la app o a una referencia de Key Vault; `azd env set` sólo no es suficiente |
| Host incorrecto elegido | La detección automática no coincide con tus necesidades | Cambia tanto `host:` como la infraestructura correspondiente, o elige una plantilla que coincida |

Para más, consulta [Capítulo 7: Solución de Problemas](../chapter-07-troubleshooting/README.md).

---

## Limpieza

```bash
azd down --force --purge
```

---

## Resumen

- `azd init` → **"Usar código en el directorio actual"** añade azd a una app que ya tienes.
- `azure.yaml` asigna tus carpetas de código a hosts de Azure; `infra/` define los recursos como Bicep.
- `azd infra generate` te permite revisar o personalizar la infraestructura generada.
- Una vez inicializada, tu app existente usa el mismo flujo `azd up` / `azd down` que una app basada en plantilla.

---

## 🔗 Navegación

| Dirección | Lección |
|-----------|--------|
| **Anterior** | [Tu Primer Proyecto](first-project.md) |
| **Siguiente** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Recursos Relacionados

- [Fundamentos de AZD](azd-basics.md)
- [Capítulo 4: Infraestructura como Código](../chapter-04-infrastructure/README.md)
- [Configuración y Autenticación](../chapter-03-configuration/authsecurity.md)
- [Hoja de Referencia de Comandos](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Trae tu propia aplicación: agrega azd a un proyecto existente

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD para principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 1 - Fundamentos y Inicio rápido
- **⬅️ Anterior**: [Tu primer proyecto](first-project.md)
- **➡️ Siguiente**: [Contenedores de desarrollo y Codespaces](dev-containers.md)

> Validado con `azd 1.27.1` en julio de 2026.

## Introducción

En [Tu primer proyecto](first-project.md) desplegaste una aplicación comenzando desde una plantilla. Pero la mayoría de las veces ya *tienes* una aplicación — una API Node.js, un servicio Python Flask, una aplicación web .NET — en una carpeta de tu máquina. Esta lección muestra cómo agregar azd a ese código existente para que puedas desplegarlo con `azd up`, sin plantilla requerida.

## Objetivos de aprendizaje

Al final de esta lección, tú:
- Entenderás las tres formas de iniciar un proyecto azd
- Ejecutarás `azd init` dentro de una base de código existente
- Comprenderás qué hacen `azure.yaml` y la carpeta `infra/` para tu app
- Sabrás cuándo dejar que azd genere la infraestructura o escribir la tuya propia
- Desplegarás tu app existente en Azure con `azd up`

## Resultados de aprendizaje

Después de completar esta lección, podrás:
- Inicializar azd en un proyecto que ya tienes
- Leer y editar un archivo básico `azure.yaml`
- Generar infraestructura inicial con `azd infra generate`
- Elegir un host de Azure apropiado para tu app
- Desplegar y limpiar tu propia aplicación

---

## Tres formas de iniciar un proyecto azd

| Punto de partida | Comando | Cuándo usar |
|----------------|---------|-------------|
| **Desde una plantilla** | `azd init --template <name>` | Para aprender o comenzar una nueva app desde un ejemplo comprobado |
| **Desde tu código existente** | `azd init` (en la carpeta de tu proyecto) | Ya tienes una app y quieres desplegarla |
| **Desde un repositorio Git** | `azd init --from-code` (en un repositorio clonado) | Adaptar azd a un repositorio existente |

Ya practicaste la primera opción. Esta lección cubre la segunda — el escenario real más común.

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

Elige **"Use code in the current directory."** azd entonces escanea tu carpeta, detecta tu lenguaje y framework, y propone un host.

### Lo que azd detecta

azd busca señales como `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` o un `Dockerfile`, y sugiere un host de Azure acorde:

| Tu app | Host probable detectado |
|----------|----------------------|
| Aplicación Node.js / Python / .NET web | Azure App Service o Container Apps |
| App containerizada (`Dockerfile`) | Azure Container Apps |
| App de funciones | Azure Functions |
| Sitio estático (salida build React/Vue) | Azure Static Web Apps |

Confirma los servicios detectados, y azd crea los archivos que necesitas.

---

## Paso 2: Entiende qué creó azd

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

El bloque `services` es la parte clave: cada entrada mapea una carpeta de tu código a un host en Azure. Si tu app tiene tanto frontend como API, tendrás dos servicios.

### `infra/` — tus recursos en Azure como código

La carpeta `infra/` contiene archivos Bicep que definen los recursos Azure que tu app necesita (el App Service, la base de datos, etc.). No tienes que escribirlos a mano — azd genera un punto de partida funcional. *Puedes* editarlos después para agregar recursos o fortalecer seguridad (cubierto en [Capítulo 4](../chapter-04-infrastructure/README.md)).

> **Consejo:** ¿Quieres ver o personalizar la infraestructura generada antes de desplegar? Ejecuta `azd infra generate` (también disponible como `azd infra synth`) para escribir la Infraestructura como Código en disco y así poder revisarla y controlarla con versiones.

---

## Paso 3: Configura lo necesario

Si tu app necesita configuraciones o secretos (cadena de conexión, clave API), no los codifiques directamente. Usa valores de entorno:

```bash
# Crear un entorno
azd env new dev

# Establecer un valor no secreto
azd env set API_VERSION 1.0.0
```

Para secretos reales, guárdalos en Key Vault y refiérete a ellos desde tu infraestructura — mira [Capítulo 3: Configuración y autenticación](../chapter-03-configuration/authsecurity.md).

---

## Paso 4: Despliega

Ahora usa el mismo flujo de trabajo que ya conoces:

```bash
# Autenticar (requerido para azd)
azd auth login

# Vista previa de los recursos que se crearán
azd provision --preview

# Provisión de infraestructura y despliegue de tu código
azd up
```

Al terminar, azd imprime la URL de tu app. Verifícala como con cualquier app azd:

```bash
azd show           # mostrar endpoints
azd monitor --logs # revisar los registros si es necesario
```

---

## Problemas comunes en la primera ejecución

| Síntoma | Causa probable | Solución |
|---------|--------------|----------|
| azd no detectó mi app | Falta manifiesto (p.ej., `package.json`) | Agrega el manifiesto, o elige el host manualmente durante `azd init` |
| Falla la compilación durante `azd up` | La app necesita un paso de compilación | Agrega `buildCommand`/`outputPath` bajo el servicio en `azure.yaml` |
| La app inicia pero devuelve errores | Falta configuración/secreto | Establece valores con `azd env set` o conecta Key Vault |
| Host equivocado elegido | Detección automática errónea | Edita `host:` en `azure.yaml` y vuelve a ejecutar `azd up` |

Para más, consulta [Capítulo 7: Resolución de problemas](../chapter-07-troubleshooting/README.md).

---

## Limpieza

```bash
azd down --force --purge
```

---

## Resumen

- `azd init` → **"Use code in the current directory"** agrega azd a una app que ya tienes.
- `azure.yaml` mapea las carpetas de tu código a hosts de Azure; `infra/` define los recursos como Bicep.
- `azd infra generate` te permite revisar o personalizar la infraestructura generada.
- Una vez inicializada, tu app existente usa el mismo flujo `azd up` / `azd down` que una app basada en plantilla.

---

## 🔗 Navegación

| Dirección | Lección |
|-----------|---------|
| **Anterior** | [Tu primer proyecto](first-project.md) |
| **Siguiente** | [Contenedores de desarrollo y Codespaces](dev-containers.md) |

## 📖 Recursos relacionados

- [Conceptos básicos de AZD](azd-basics.md)
- [Capítulo 4: Infraestructura como código](../chapter-04-infrastructure/README.md)
- [Configuración y autenticación](../chapter-03-configuration/authsecurity.md)
- [Hoja de referencia de comandos](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
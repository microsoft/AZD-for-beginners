# Guía de Instalación y Configuración

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 1 - Fundamentos y Inicio Rápido
- **⬅️ Anterior**: [Conceptos Básicos de AZD](azd-basics.md)
- **➡️ Siguiente**: [Tu Primer Proyecto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desarrollo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introducción

Esta guía completa te guiará a través de la instalación y configuración de Azure Developer CLI (azd) en tu sistema. Aprenderás varios métodos de instalación para diferentes sistemas operativos, configuración de autenticación y configuración inicial para preparar tu entorno de desarrollo para despliegues en Azure.

## Objetivos de Aprendizaje

Al final de esta lección, podrás:
- Instalar correctamente Azure Developer CLI en tu sistema operativo
- Configurar la autenticación con Azure usando múltiples métodos
- Configurar tu entorno de desarrollo con los prerrequisitos necesarios
- Entender las diferentes opciones de instalación y cuándo usar cada una
- Solucionar problemas comunes de instalación y configuración

## Resultados de Aprendizaje

Después de completar esta lección, serás capaz de:
- Instalar azd usando el método apropiado para tu plataforma
- Autenticarte con Azure usando azd auth login
- Verificar tu instalación y probar comandos básicos de azd
- Configurar tu entorno de desarrollo para un uso óptimo de azd
- Resolver problemas comunes de instalación de forma independiente

Esta guía te ayudará a instalar y configurar Azure Developer CLI en tu sistema, sin importar cuál sea tu sistema operativo o entorno de desarrollo.

## Requisitos Previos

Antes de instalar azd, asegúrate de tener:
- **Suscripción a Azure** - [Crea una cuenta gratuita](https://azure.microsoft.com/free/)
- **Azure CLI** (opcional) - Para ejemplos que ejecutan explícitamente `az`; azd se autentica de forma independiente
- **Git** - Para clonar plantillas y control de versiones
- **Docker** (opcional) - Para aplicaciones en contenedores

## Métodos de Instalación

### Windows

#### Opción 1: Windows Package Manager (Recomendado)
```cmd
winget install microsoft.azd
```

#### Opción 2: Script de instalación de PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opción 3: Chocolatey
```cmd
choco install azd
```

#### Opción 4: Instalación Manual
1. Descarga la última versión desde [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extrae a `C:\Program Files\azd\`
3. Agrega a la variable de entorno PATH

### macOS

#### Opción 1: Homebrew (Recomendado)
```bash
brew tap azure/azd
brew install azd
```

#### Opción 2: Script de Instalación
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opción 3: Instalación Manual
Descarga el archivo para tu arquitectura macOS desde [los activos del lanzamiento](https://github.com/Azure/azure-dev/releases), extráelo y añade el binario `azd` a tu `PATH`.

### Linux

#### Opción 1: Script de Instalación (Recomendado)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opción 2: Gestores de Paquetes

**Instalación manual desde los activos del lanzamiento:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Algunos Codespaces y entornos de contenedor dev ya incluyen `azd`, pero deberías verificarlo en lugar de asumirlo:

```bash
azd version
```

Si falta `azd`, instálalo con el script estándar para el entorno.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Este contenedor efímero no preserva el estado de inicio de sesión entre ejecuciones. Para despliegues repetidos, usa la [configuración del contenedor dev](dev-containers.md); las compilaciones de contenedores también requieren un demonio Docker accesible desde dentro del contenedor.

## ✅ Verificar Instalación

Después de la instalación, verifica que azd funcione correctamente:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Salida esperada:
```
azd version 1.x.x (commit xxxxxx)
```

**Nota**: El número de versión real puede variar. Consulta [versiones de Azure Developer CLI](https://github.com/Azure/azure-dev/releases) para la última versión.

**✅ Lista de Verificación de Éxito de Instalación:**
- [ ] `azd version` muestra el número de versión sin errores
- [ ] `azd --help` muestra la documentación del comando
- [ ] `azd template list` muestra las plantillas disponibles
- [ ] Puedes crear un directorio de prueba y ejecutar `azd init` exitosamente

**Si todas las verificaciones pasan, ¡estás listo para continuar a [Tu Primer Proyecto](first-project.md)!**

## Configuración de Autenticación

### Configuración Recomendada para Principiantes

Para flujos de trabajo centrados en AZD, inicia sesión con `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Usa el inicio de sesión con Azure CLI solamente cuando planees ejecutar comandos `az` tú mismo durante el curso.

### Autenticación Azure CLI (Opcional)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: see the Azure CLI install docs for your distribution

# Login to Azure
az login

# Verify authentication
az account show
```

### ¿Qué flujo de inicio de sesión deberías usar?

- Usa `azd auth login` si sigues el camino principiante de AZD y principalmente ejecutas comandos `azd`.
- Usa `az login` también cuando quieras ejecutar comandos de Azure CLI como `az account show` o inspeccionar recursos directamente.
- Si un ejercicio incluye comandos `azd` y `az`, ejecuta ambos inicios de sesión una vez al inicio.

### Autenticación con Código de Dispositivo
Si estás en un sistema sin interfaz gráfica o tienes problemas con el navegador:
```bash
azd auth login --use-device-code
```

### Principal de Servicio (CI/CD)
Para entornos automatizados:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Valida tu Configuración Completa

Si deseas una rápida revisión antes de comenzar el Capítulo 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Configuración

### Configuración Global
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Variables de Entorno
Agrégalas a tu perfil de shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Integración con IDE

### Visual Studio Code
Instala la extensión Azure Developer CLI:
1. Abre VS Code
2. Ve a Extensiones (Ctrl+Shift+X)
3. Busca "Azure Developer CLI"
4. Instala la extensión

Características:
- IntelliSense para azure.yaml
- Comandos integrados en terminal
- Navegación de plantillas
- Monitorización de despliegues

### GitHub Codespaces
Crea un `.devcontainer/devcontainer.json`:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Instala el plugin de Azure
2. Configura las credenciales de Azure
3. Usa la terminal integrada para comandos azd

## 🐛 Solución de Problemas de Instalación

### Problemas Comunes

#### Permiso Denegado (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemas con PATH
Agrega manualmente azd a tu PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Problemas de Red/Proxy
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Conflictos de Versiones
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Obtener Más Ayuda
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Actualización de azd

### Verificación de Actualización
azd avisa cuando hay una nueva versión disponible, y puedes confirmar tu compilación actual con:
```bash
azd version
```

### Actualizaciones Manuales

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 Preguntas Frecuentes

<details>
<summary><strong>¿Cuál es la diferencia entre azd y az CLI?</strong></summary>

**Azure CLI (az)**: Herramienta de bajo nivel para gestionar recursos individuales de Azure
- `az webapp create`, `az storage account create`
- Un recurso a la vez
- Enfoque en gestión de infraestructura

**Azure Developer CLI (azd)**: Herramienta de alto nivel para despliegues completos de aplicaciones
- `azd up` despliega toda la aplicación con todos los recursos
- Flujos de trabajo basados en plantillas
- Enfoque en productividad del desarrollador

**Son independientes**: azd usa su propia autenticación por defecto. Instala e inicia sesión en Azure CLI solo para comandos `az`, o explícitamente opta por `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>¿Puedo usar azd con recursos de Azure existentes?</strong></summary>

¡Sí! Puedes:
1. Importar recursos existentes en ambientes azd
2. Referenciar recursos existentes en tus plantillas Bicep
3. Usar azd para nuevos despliegues junto con infraestructura existente

Consulta la [Guía de Configuración](../chapter-03-configuration/configuration.md) para más detalles.
</details>

<details>
<summary><strong>¿Funciona azd con Azure Gobierno o Azure China?</strong></summary>

Sí, configura la nube:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Si también usas Azure CLI, configura `az cloud set --name ...` por separado. Los servicios de plantillas y la disponibilidad de modelos varían según la nube.
</details>

<details>
<summary><strong>¿Puedo usar azd en pipelines CI/CD?</strong></summary>

¡Absolutamente! azd está diseñado para automatización:
- Integración con GitHub Actions
- Soporte para Azure DevOps
- Autenticación con principal de servicio
- Modo no interactivo

Consulta la [Guía de Despliegue](../chapter-04-infrastructure/deployment-guide.md) para patrones CI/CD.
</details>

<details>
<summary><strong>¿Cuál es el costo de usar azd?</strong></summary>

azd en sí es **completamente gratuito** y de código abierto. Sólo pagas por:
- Los recursos de Azure que despliegues
- Costos de consumo de Azure (cómputo, almacenamiento, etc.)

Usa `azd provision --preview` para inspeccionar recursos propuestos, luego estima sus costos con la [Calculadora de Precios de Azure](https://azure.microsoft.com/pricing/calculator/). La vista previa no calcula precios.
</details>

## Próximos Pasos

1. **Completa la autenticación**: Asegúrate de poder acceder a tu suscripción Azure
2. **Prueba tu primer despliegue**: Sigue la [Guía del Primer Proyecto](first-project.md)
3. **Explora plantillas**: Navega las plantillas disponibles con `azd template list`
4. **Configura tu IDE**: Prepara tu entorno de desarrollo

## Soporte

Si encuentras problemas:
- [Documentación Oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Reportar Problemas](https://github.com/Azure/azure-dev/issues)
- [Discusiones Comunitarias](https://github.com/Azure/azure-dev/discussions)
- [Soporte Azure](https://azure.microsoft.com/support/)
- [**Habilidades de Agente Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - Obtén guía de comandos Azure directamente en tu editor con `npx skills add microsoft/github-copilot-for-azure`

---

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 1 - Fundamentos y Inicio Rápido
- **⬅️ Anterior**: [Conceptos Básicos de AZD](azd-basics.md) 
- **➡️ Siguiente**: [Tu Primer Proyecto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desarrollo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ¡Instalación Completa!** Continúa en [Tu Primer Proyecto](first-project.md) para comenzar a construir con azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
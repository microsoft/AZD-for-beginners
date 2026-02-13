# Guía de instalación y configuración

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD para principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 1 - Fundamentos y comienzo rápido
- **⬅️ Anterior**: [Conceptos básicos de AZD](azd-basics.md)
- **➡️ Siguiente**: [Tu primer proyecto](first-project.md)
- **🚀 Siguiente capítulo**: [Capítulo 2: Desarrollo con IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introducción

Esta guía completa te guiará a través de la instalación y configuración de Azure Developer CLI (azd) en tu sistema. Aprenderás múltiples métodos de instalación para diferentes sistemas operativos, la configuración de la autenticación y la configuración inicial para preparar tu entorno de desarrollo para implementaciones en Azure.

## Objetivos de aprendizaje

Al final de esta lección, tú:
- Instalarás correctamente Azure Developer CLI en tu sistema operativo
- Configurarás la autenticación con Azure usando múltiples métodos
- Configurarás tu entorno de desarrollo con los prerrequisitos necesarios
- Comprenderás las diferentes opciones de instalación y cuándo usar cada una
- Solucionarás problemas comunes de instalación y configuración

## Resultados de aprendizaje

Después de completar esta lección, podrás:
- Instalar azd usando el método apropiado para tu plataforma
- Autenticarte con Azure usando azd auth login
- Verificar tu instalación y probar comandos básicos de azd
- Configurar tu entorno de desarrollo para un uso óptimo de azd
- Resolver problemas comunes de instalación de forma independiente

Esta guía te ayudará a instalar y configurar Azure Developer CLI en tu sistema, independientemente de tu sistema operativo o entorno de desarrollo.

## Prerrequisitos

Antes de instalar azd, asegúrate de tener:
- **Suscripción de Azure** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Para autenticación y gestión de recursos
- **Git** - Para clonar plantillas y control de versiones
- **Docker** (opcional) - Para aplicaciones en contenedores

## Métodos de instalación

### Windows

#### Opción 1: PowerShell (recomendado)
```powershell
# Ejecutar como administrador o con privilegios elevados
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opción 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Opción 3: Chocolatey
```cmd
choco install azd
```

#### Opción 4: Instalación manual
1. Descarga la última versión desde [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extrae en `C:\Program Files\azd\`
3. Añádelo a la variable de entorno PATH

### macOS

#### Opción 1: Homebrew (recomendado)
```bash
brew tap azure/azd
brew install azd
```

#### Opción 2: Script de instalación
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opción 3: Instalación manual
```bash
# Descargar e instalar
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opción 1: Script de instalación (recomendado)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opción 2: Gestores de paquetes

**Ubuntu/Debian:**
```bash
# Agregar el repositorio de paquetes de Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Instalar azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Agregar el repositorio de paquetes de Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd viene preinstalado en GitHub Codespaces. Simplemente crea un codespace y comienza a usar azd de inmediato.

### Docker

```bash
# Ejecutar azd en un contenedor
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Crear un alias para facilitar su uso
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verificar la instalación

Después de la instalación, verifica que azd esté funcionando correctamente:

```bash
# Comprobar la versión
azd version

# Ver ayuda
azd --help

# Listar plantillas disponibles
azd template list
```

Salida esperada:
```
azd version 1.x.x (commit xxxxxx)
```

**Nota**: El número de versión real variará. Consulta [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) para la última versión.

**✅ Lista de verificación de instalación exitosa:**
- [ ] `azd version` muestra el número de versión sin errores
- [ ] `azd --help` muestra la documentación de comandos
- [ ] `azd template list` muestra las plantillas disponibles
- [ ] `az account show` muestra tu suscripción de Azure
- [ ] Puedes crear un directorio de prueba y ejecutar `azd init` con éxito

**Si todas las comprobaciones pasan, ¡estás listo para continuar a [Tu primer proyecto](first-project.md)!**

## Configuración de autenticación

### Autenticación con Azure CLI (recomendado)
```bash
# Instale Azure CLI si aún no está instalado
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Inicie sesión en Azure
az login

# Verifique la autenticación
az account show
```

### Autenticación por código de dispositivo
Si estás en un sistema sin interfaz gráfica o tienes problemas con el navegador:
```bash
az login --use-device-code
```

### Principal de servicio (CI/CD)
Para entornos automatizados:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Configuración

### Configuración global
```bash
# Establecer suscripción predeterminada
azd config set defaults.subscription <subscription-id>

# Establecer ubicación predeterminada
azd config set defaults.location eastus2

# Ver toda la configuración
azd config list
```

### Variables de entorno
Agrega a tu perfil de shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Configuración de Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Configuración de azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Habilitar el registro de depuración
```

## Integración con el IDE

### Visual Studio Code
Instala la extensión Azure Developer CLI:
1. Abre VS Code
2. Ve a Extensiones (Ctrl+Shift+X)
3. Busca "Azure Developer CLI"
4. Instala la extensión

Funciones:
- IntelliSense para azure.yaml
- Comandos integrados en el terminal
- Exploración de plantillas
- Monitoreo de despliegues

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
3. Usa el terminal integrado para comandos azd

## 🐛 Solución de problemas de instalación

### Problemas comunes

#### Permiso denegado (Windows)
```powershell
# Ejecutar PowerShell como administrador
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemas con PATH
Añade manualmente azd a tu PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Problemas de red/proxy
```bash
# Configurar proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Omitir la verificación SSL (no recomendado para producción)
azd config set http.insecure true
```

#### Conflictos de versión
```bash
# Eliminar instalaciones antiguas
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Limpiar la configuración
rm -rf ~/.azd
```

### Obtener más ayuda
```bash
# Habilitar registro de depuración
export AZD_DEBUG=true
azd <command> --debug

# Ver configuración actual
azd config list

# Ver el estado actual del despliegue
azd show
```

## Actualizar azd

### Actualizaciones automáticas
azd te notificará cuando haya actualizaciones disponibles:
```bash
azd version --check-for-updates
```

### Actualizaciones manuales

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 Preguntas frecuentes

<details>
<summary><strong>¿Cuál es la diferencia entre azd y az CLI?</strong></summary>

**Azure CLI (az)**: Herramienta de bajo nivel para gestionar recursos individuales de Azure
- `az webapp create`, `az storage account create`
- Un recurso a la vez
- Enfoque en la gestión de infraestructura

**Azure Developer CLI (azd)**: Herramienta de alto nivel para despliegues completos de aplicaciones
- `azd up` despliega toda la aplicación con todos los recursos
- Flujos de trabajo basados en plantillas
- Enfoque en la productividad del desarrollador

**Necesitas ambos**: azd utiliza az CLI para la autenticación
</details>

<details>
<summary><strong>¿Puedo usar azd con recursos de Azure existentes?</strong></summary>

¡Sí! Puedes:
1. Importar recursos existentes en entornos de azd
2. Referenciar recursos existentes en tus plantillas Bicep
3. Usar azd para nuevas implementaciones junto con la infraestructura existente

Consulta la [Guía de configuración](configuration.md) para más detalles.
</details>

<details>
<summary><strong>¿Funciona azd con Azure Government o Azure China?</strong></summary>

Sí, configura la cloud:
```bash
# Azure para el Gobierno
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>¿Puedo usar azd en pipelines de CI/CD?</strong></summary>

¡Por supuesto! azd está diseñado para la automatización:
- Integración con GitHub Actions
- Soporte para Azure DevOps
- Autenticación con principal de servicio
- Modo no interactivo

Consulta la [Guía de despliegue](../chapter-04-infrastructure/deployment-guide.md) para patrones de CI/CD.
</details>

<details>
<summary><strong>¿Cuál es el costo de usar azd?</strong></summary>

azd en sí es **completamente gratuito** y de código abierto. Solo pagas por:
- Los recursos de Azure que implementes
- Costos de consumo de Azure (cómputo, almacenamiento, etc.)

Usa `azd provision --preview` para estimar costos antes de la implementación.
</details>

## Siguientes pasos

1. **Completa la autenticación**: Asegúrate de poder acceder a tu suscripción de Azure
2. **Prueba tu primer despliegue**: Sigue la [Guía del primer proyecto](first-project.md)
3. **Explora plantillas**: Examina las plantillas disponibles con `azd template list`
4. **Configura tu IDE**: Prepara tu entorno de desarrollo

## Soporte

Si encuentras problemas:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD para principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 1 - Fundamentos y comienzo rápido
- **⬅️ Anterior**: [Conceptos básicos de AZD](azd-basics.md) 
- **➡️ Siguiente**: [Tu primer proyecto](first-project.md)
- **🚀 Siguiente capítulo**: [Capítulo 2: Desarrollo con IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ¡Instalación completa!** Continúa a [Tu primer proyecto](first-project.md) para comenzar a construir con azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso legal**:
Este documento ha sido traducido utilizando el servicio de traducción por IA Co-op Translator (https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos hacemos responsables de ningún malentendido o mala interpretación que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
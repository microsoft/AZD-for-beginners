# Guía de Instalación y Configuración

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 1 - Fundamentos y Inicio Rápido
- **⬅️ Anterior**: [Conceptos Básicos de AZD](azd-basics.md)
- **➡️ Siguiente**: [Tu Primer Proyecto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desarrollo con IA como Prioridad](../microsoft-foundry/microsoft-foundry-integration.md)

## Introducción

Esta guía completa te llevará paso a paso por la instalación y configuración de Azure Developer CLI (azd) en tu sistema. Aprenderás diferentes métodos de instalación para distintos sistemas operativos, configuración de autenticación y ajustes iniciales para preparar tu entorno de desarrollo para implementaciones en Azure.

## Objetivos de Aprendizaje

Al finalizar esta lección, podrás:
- Instalar Azure Developer CLI en tu sistema operativo
- Configurar la autenticación con Azure utilizando varios métodos
- Preparar tu entorno de desarrollo con los requisitos necesarios
- Comprender las diferentes opciones de instalación y cuándo utilizarlas
- Solucionar problemas comunes de instalación y configuración

## Resultados de Aprendizaje

Después de completar esta lección, serás capaz de:
- Instalar azd utilizando el método adecuado para tu plataforma
- Autenticarse con Azure usando `azd auth login`
- Verificar tu instalación y probar comandos básicos de azd
- Configurar tu entorno de desarrollo para un uso óptimo de azd
- Resolver problemas comunes de instalación de forma independiente

Esta guía te ayudará a instalar y configurar Azure Developer CLI en tu sistema, sin importar tu sistema operativo o entorno de desarrollo.

## Requisitos Previos

Antes de instalar azd, asegúrate de tener:
- **Suscripción a Azure** - [Crea una cuenta gratuita](https://azure.microsoft.com/free/)
- **Azure CLI** - Para autenticación y gestión de recursos
- **Git** - Para clonar plantillas y control de versiones
- **Docker** (opcional) - Para aplicaciones en contenedores

## Métodos de Instalación

### Windows

#### Opción 1: PowerShell (Recomendado)
```powershell
# Ejecutar como Administrador o con privilegios elevados
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opción 2: Administrador de Paquetes de Windows (winget)
```cmd
winget install Microsoft.Azd
```

#### Opción 3: Chocolatey
```cmd
choco install azd
```

#### Opción 4: Instalación Manual
1. Descarga la última versión desde [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extrae en `C:\Program Files\azd\`
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
```bash
# Descargar e instalar
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opción 1: Script de Instalación (Recomendado)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opción 2: Gestores de Paquetes

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

# Crear un alias para un uso más fácil
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verificar Instalación

Después de la instalación, verifica que azd funcione correctamente:

```bash
# Verificar versión
azd version

# Ver ayuda
azd --help

# Listar plantillas disponibles
azd template list
```

Salida esperada:
```
azd version 1.5.0 (commit abc123)
```

**✅ Lista de Verificación de Instalación Exitosa:**
- [ ] `azd version` muestra el número de versión sin errores
- [ ] `azd --help` muestra la documentación de comandos
- [ ] `azd template list` muestra las plantillas disponibles
- [ ] `az account show` muestra tu suscripción de Azure
- [ ] Puedes crear un directorio de prueba y ejecutar `azd init` exitosamente

**Si todas las verificaciones pasan, estás listo para continuar con [Tu Primer Proyecto](first-project.md)!**

## Configuración de Autenticación

### Autenticación con Azure CLI (Recomendado)
```bash
# Instalar Azure CLI si no está ya instalado
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Iniciar sesión en Azure
az login

# Verificar autenticación
az account show
```

### Autenticación con Código de Dispositivo
Si estás en un sistema sin interfaz gráfica o tienes problemas con el navegador:
```bash
az login --use-device-code
```

### Principal de Servicio (CI/CD)
Para entornos automatizados:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Configuración

### Configuración Global
```bash
# Establecer suscripción predeterminada
azd config set defaults.subscription <subscription-id>

# Establecer ubicación predeterminada
azd config set defaults.location eastus2

# Ver toda la configuración
azd config list
```

### Variables de Entorno
Agrega a tu perfil de shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Configuración de Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Configuración de azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Habilitar el registro de depuración
```

## Integración con IDE

### Visual Studio Code
Instala la extensión de Azure Developer CLI:
1. Abre VS Code
2. Ve a Extensiones (Ctrl+Shift+X)
3. Busca "Azure Developer CLI"
4. Instala la extensión

Características:
- IntelliSense para azure.yaml
- Comandos integrados en la terminal
- Navegación de plantillas
- Monitoreo de implementaciones

### GitHub Codespaces
Crea un archivo `.devcontainer/devcontainer.json`:
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
# Ejecutar PowerShell como Administrador
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
# Configurar proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Omitir la verificación SSL (no recomendado para producción)
azd config set http.insecure true
```

#### Conflictos de Versión
```bash
# Eliminar instalaciones antiguas
# Windows: winget desinstalar Microsoft.Azd
# macOS: brew desinstalar azd
# Linux: sudo apt eliminar azd

# Limpiar configuración
rm -rf ~/.azd
```

### Obtener Más Ayuda
```bash
# Habilitar el registro de depuración
export AZD_DEBUG=true
azd <command> --debug

# Ver registros detallados
azd logs

# Verificar información del sistema
azd info
```

## Actualización de azd

### Actualizaciones Automáticas
azd te notificará cuando haya actualizaciones disponibles:
```bash
azd version --check-for-updates
```

### Actualizaciones Manuales

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

## 💡 Preguntas Frecuentes

<details>
<summary><strong>¿Cuál es la diferencia entre azd y az CLI?</strong></summary>

**Azure CLI (az)**: Herramienta de bajo nivel para gestionar recursos individuales de Azure
- `az webapp create`, `az storage account create`
- Un recurso a la vez
- Enfoque en gestión de infraestructura

**Azure Developer CLI (azd)**: Herramienta de alto nivel para implementaciones completas de aplicaciones
- `azd up` implementa toda la aplicación con todos los recursos
- Flujos de trabajo basados en plantillas
- Enfoque en productividad del desarrollador

**Necesitas ambos**: azd utiliza az CLI para autenticación
</details>

<details>
<summary><strong>¿Puedo usar azd con recursos existentes de Azure?</strong></summary>

¡Sí! Puedes:
1. Importar recursos existentes en entornos azd
2. Referenciar recursos existentes en tus plantillas Bicep
3. Usar azd para nuevas implementaciones junto con infraestructura existente

Consulta la [Guía de Configuración](configuration.md) para más detalles.
</details>

<details>
<summary><strong>¿Funciona azd con Azure Government o Azure China?</strong></summary>

Sí, configura la nube:
```bash
# Azure Gobierno
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>¿Puedo usar azd en pipelines de CI/CD?</strong></summary>

¡Por supuesto! azd está diseñado para automatización:
- Integración con GitHub Actions
- Soporte para Azure DevOps
- Autenticación con principal de servicio
- Modo no interactivo

Consulta la [Guía de Implementación](../deployment/deployment-guide.md) para patrones de CI/CD.
</details>

<details>
<summary><strong>¿Cuál es el costo de usar azd?</strong></summary>

azd en sí es **completamente gratuito** y de código abierto. Solo pagas por:
- Recursos de Azure que implementes
- Costos de consumo de Azure (computación, almacenamiento, etc.)

Usa `azd provision --preview` para estimar costos antes de la implementación.
</details>

## Próximos Pasos

1. **Completa la autenticación**: Asegúrate de poder acceder a tu suscripción de Azure
2. **Prueba tu primera implementación**: Sigue la [Guía del Primer Proyecto](first-project.md)
3. **Explora plantillas**: Navega por las plantillas disponibles con `azd template list`
4. **Configura tu IDE**: Prepara tu entorno de desarrollo

## Soporte

Si encuentras problemas:
- [Documentación Oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Reportar Problemas](https://github.com/Azure/azure-dev/issues)
- [Discusiones de la Comunidad](https://github.com/Azure/azure-dev/discussions)
- [Soporte de Azure](https://azure.microsoft.com/support/)

---

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 1 - Fundamentos y Inicio Rápido
- **⬅️ Anterior**: [Conceptos Básicos de AZD](azd-basics.md) 
- **➡️ Siguiente**: [Tu Primer Proyecto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desarrollo con IA como Prioridad](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ ¡Instalación Completa!** Continúa con [Tu Primer Proyecto](first-project.md) para comenzar a construir con azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
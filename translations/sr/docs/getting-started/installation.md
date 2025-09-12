<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T22:37:07+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "sr"
}
-->
# Водич за инсталацију и подешавање

**Претходно:** [Главна документација](../../README.md) | **Следеће:** [Основе AZD](azd-basics.md)

## Увод

Овај свеобухватни водич ће вас провести кроз процес инсталације и конфигурације Azure Developer CLI (azd) на вашем систему. Научићете различите методе инсталације за различите оперативне системе, подешавање аутентификације и почетну конфигурацију како бисте припремили своје развојно окружење за Azure деплоје.

## Циљеви учења

На крају ове лекције, моћи ћете:
- Успешно инсталирати Azure Developer CLI на вашем оперативном систему
- Конфигурисати аутентификацију са Azure користећи различите методе
- Подесити своје развојно окружење са неопходним предусловима
- Разумети различите опције инсталације и када их користити
- Решавати уобичајене проблеме са инсталацијом и подешавањем

## Резултати учења

Након завршетка ове лекције, бићете у могућности да:
- Инсталирате azd користећи одговарајућу методу за вашу платформу
- Аутентификујете се са Azure користећи `azd auth login`
- Потврдите инсталацију и тестирате основне azd команде
- Конфигуришете своје развојно окружење за оптимално коришћење azd-а
- Самостално решавате уобичајене проблеме са инсталацијом

Овај водич ће вам помоћи да инсталирате и конфигуришете Azure Developer CLI на вашем систему, без обзира на оперативни систем или развојно окружење.

## Предуслови

Пре него што инсталирате azd, уверите се да имате:
- **Azure претплату** - [Креирајте бесплатан налог](https://azure.microsoft.com/free/)
- **Azure CLI** - За аутентификацију и управљање ресурсима
- **Git** - За клонирање шаблона и контролу верзија
- **Docker** (опционо) - За апликације у контејнерима

## Методе инсталације

### Windows

#### Опција 1: PowerShell (Препоручено)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Опција 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Опција 3: Chocolatey
```cmd
choco install azd
```

#### Опција 4: Ручна инсталација
1. Преузмите најновије издање са [GitHub](https://github.com/Azure/azure-dev/releases)
2. Извуците у `C:\Program Files\azd\`
3. Додајте у PATH променљиву окружења

### macOS

#### Опција 1: Homebrew (Препоручено)
```bash
brew tap azure/azd
brew install azd
```

#### Опција 2: Инсталациони скрипт
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опција 3: Ручна инсталација
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Опција 1: Инсталациони скрипт (Препоручено)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опција 2: Управљачи пакета

**Ubuntu/Debian:**
```bash
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd је већ инсталиран у GitHub Codespaces. Само креирајте codespace и одмах почните да користите azd.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Потврда инсталације

Након инсталације, проверите да ли azd ради исправно:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Очекивани излаз:
```
azd version 1.5.0 (commit abc123)
```

## Подешавање аутентификације

### Azure CLI аутентификација (Препоручено)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### Аутентификација преко кода уређаја
Ако сте на систему без графичког интерфејса или имате проблема са прегледачем:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
За аутоматизована окружења:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Конфигурација

### Глобална конфигурација
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Променљиве окружења
Додајте у ваш shell профил (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## Интеграција са IDE-ом

### Visual Studio Code
Инсталирајте Azure Developer CLI екстензију:
1. Отворите VS Code
2. Идите на Extensions (Ctrl+Shift+X)
3. Претражите "Azure Developer CLI"
4. Инсталирајте екстензију

Функције:
- IntelliSense за azure.yaml
- Интегрисане терминалске команде
- Преглед шаблона
- Праћење деплоја

### GitHub Codespaces
Креирајте `.devcontainer/devcontainer.json`:
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
1. Инсталирајте Azure додатак
2. Конфигуришите Azure креденцијале
3. Користите интегрисани терминал за azd команде

## 🐛 Решавање проблема са инсталацијом

### Уобичајени проблеми

#### Дозволе одбијене (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблеми са PATH-ом
Ручно додајте azd у PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Проблеми са мрежом/проксијем
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Конфликти верзија
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Добијање додатне помоћи
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Ажурирање azd-а

### Аутоматска ажурирања
azd ће вас обавестити када су ажурирања доступна:
```bash
azd version --check-for-updates
```

### Ручна ажурирања

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

## Следећи кораци

1. **Завршите аутентификацију**: Уверите се да можете приступити вашој Azure претплати
2. **Пробајте први деплој**: Пратите [Водич за први пројекат](first-project.md)
3. **Истражите шаблоне**: Прегледајте доступне шаблоне са `azd template list`
4. **Конфигуришите ваш IDE**: Подесите ваше развојно окружење

## Подршка

Ако наиђете на проблеме:
- [Званична документација](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Пријавите проблеме](https://github.com/Azure/azure-dev/issues)
- [Дискусије заједнице](https://github.com/Azure/azure-dev/discussions)
- [Azure подршка](https://azure.microsoft.com/support/)

---

**Претходно:** [Главна документација](../../README.md) | **Следеће:** [Основе AZD](azd-basics.md)

**Инсталација завршена!** Наставите на [Ваш први пројекат](first-project.md) да започнете рад са azd-ом.

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да превод буде тачан, молимо вас да имате у виду да аутоматизовани преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.
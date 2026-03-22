# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD за почетнике](../../README.md)
- **📖 Current Chapter**: Поглавље 1 - Основа и брзи почетак
- **⬅️ Previous**: [Основе AZD](azd-basics.md)
- **➡️ Next**: [Ваш први пројекат](first-project.md)
- **🚀 Next Chapter**: [Поглавље 2: Развој оријентисан на AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Увод

Ово свеобухватно упутство ће вас провести кроз инсталирање и конфигурисање Azure Developer CLI (azd) на вашем систему. Нучићете више метода инсталације за различите оперативне системе, подешавање аутентификације и почетну конфигурацију како бисте припремили средину за развој за деплоје на Azure.

## Циљеви учења

На крају ове лекције ћете:
- Успешно инсталирати Azure Developer CLI на вашем оперативном систему
- Конфигурисати аутентикацију са Azure користећи више метода
- Подесити развојно окружење са потребним претпоставкама
- Разумети различите опције инсталације и када користити коју
- Решавати уобичајене проблеме при инсталирању и подешавању

## Очеквани исходи учења

Након завршетка ове лекције моћи ћете да:
- Инсталирате azd користећи одговарајућу методу за вашу платформу
- Аутентификујете се са Azure користећи `azd auth login`
- Верификујете инсталацију и тестирате основне azd команде
- Конфигуришете своје развојно окружење за оптималну употребу azd
- Самостално решите уобичајене проблеме при инсталацији

Ово упутство ће вам помоћи да инсталирате и конфигуришете Azure Developer CLI на вашем систему, без обзира на оперативни систем или развојно окружење.

## Захтеви

Пре инсталирања azd, уверите се да имате:
- **Azure претплата** - [Направите бесплатан налог](https://azure.microsoft.com/free/)
- **Azure CLI** - За аутентификацију и управљање ресурсима
- **Git** - За клонирање шаблона и контролу верзија
- **Docker** (опциони) - За контейнеризоване апликације

## Методе инсталације

### Windows

#### Option 1: PowerShell (Препоручено)
```powershell
# Покрените као администратор или са повишеним привилегијама
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Ручна инсталација
1. Преузмите најновије издање са [GitHub](https://github.com/Azure/azure-dev/releases)
2. Распакујте у `C:\Program Files\azd\`
3. Додајте у PATH системску променљиву

### macOS

#### Option 1: Homebrew (Препоручено)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Ручна инсталација
```bash
# Преузмите и инсталирајте
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Препоручено)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Ubuntu/Debian:**
```bash
# Додај спремиште пакета компаније Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Инсталирај azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Додај Microsoft репозиторијум пакета
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd долази прединсталиран у GitHub Codespaces. Једноставно креирајте codespace и почните да користите azd одмах.

### Docker

```bash
# Покрените azd у контејнеру
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Креирајте алијас за лакше коришћење
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Потврда инсталације

Након инсталације, потврдите да azd ради исправно:

```bash
# Провери верзију
azd version

# Погледај помоћ
azd --help

# Прикажи доступне шаблоне
azd template list
```

Очекивани излаз:
```
azd version 1.x.x (commit xxxxxx)
```

**Напомена**: Стварни број верзије ће варирати. Проверите [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) за најновију верзију.

**✅ Контролна листа за успешну инсталацију:**
- [ ] `azd version` приказује број верзије без грешака
- [ ] `azd --help` приказује документацију команди
- [ ] `azd template list` приказује доступне шаблоне
- [ ] `az account show` приказује вашу Azure претплату
- [ ] Можете да креирате тестни директоријум и успешно покренете `azd init`

**Ако све провере прођу, спремни сте да наставите на [Ваш први пројекат](first-project.md)!**

## Подешавање аутентификације

### Azure CLI аутентикација (Препоручено)
```bash
# Инсталирајте Azure CLI ако већ није инсталиран
# Виндоус: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Линукс: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Пријавите се у Azure
az login

# Потврдите аутентификацију
az account show
```

### Аутентикација помоћу уређаја (Device Code Authentication)
Ако радите на систему без графичког окружења или имате проблема са прегледачем:
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
# Постави подразумевану претплату
azd config set defaults.subscription <subscription-id>

# Постави подразумевану локацију
azd config set defaults.location eastus2

# Прикажи сву конфигурацију
azd config list
```

### Променљиве окружења
Додајте у профил вашег shell-а (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Конфигурација Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd конфигурација
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Омогући дебаг логовање
```

## Интеграција у IDE

### Visual Studio Code
Инсталирајте екстензију Azure Developer CLI:
1. Отворите VS Code
2. Идите на Extensions (Ctrl+Shift+X)
3. Потражите "Azure Developer CLI"
4. Инсталирајте екстензију

Функције:
- IntelliSense за azure.yaml
- Интегрисане терминал команде
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
1. Инсталирајте Azure плагин
2. Конфигуришите Azure креденцијале
3. Користите интегрисани терминал за azd команде

## 🐛 Решавање проблема при инсталацији

### Уобичајени проблеми

#### Permission Denied (Windows)
```powershell
# Покрените PowerShell као администратор
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблеми са PATH-ом
Ручно додајте azd у ваш PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Мрежни/Proxy проблеми
```bash
# Конфигуриши прокси
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Прескочи SSL верификацију (није препоручено за производно окружење)
azd config set http.insecure true
```

#### Конфликти верзија
```bash
# Уклоните старе инсталације
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Очистите конфигурацију
rm -rf ~/.azd
```

### Додатна помоћ
```bash
# Омогући дебаг логовање
export AZD_DEBUG=true
azd <command> --debug

# Погледај тренутну конфигурацију
azd config list

# Погледај тренутни статус деплоја
azd show
```

## Ажурирање azd

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

## 💡 Често постављана питања

<details>
<summary><strong>У чему је разлика између azd и az CLI?</strong></summary>

**Azure CLI (az)**: Алат ниског нивоа за управљање појединачним Azure ресурсима
- `az webapp create`, `az storage account create`
- Један ресурс по један
- Фокус на управљање инфраструктуром

**Azure Developer CLI (azd)**: Алат вишег нивоа за комплетне деплоје апликација
- `azd up` деплојује целу апликацију са свим ресурсима
- Радни токови засновани на шаблонима
- Фокус на продуктивност програмера

**Потребна су вам оба**: azd користи az CLI за аутентификацију
</details>

<details>
<summary><strong>Могу ли да користим azd са постојећим Azure ресурсима?</strong></summary>

Наравно! Можете:
1. Импортовати постојеће ресурсе у azd окружења
2. Реферисати постојеће ресурсе у вашим Bicep шаблонима
3. Користити azd за нове деплоје поред постојеће инфраструктуре

Погледајте [Configuration Guide](configuration.md) за детаље.
</details>

<details>
<summary><strong>Да ли azd ради са Azure Government или Azure China?</strong></summary>

Да, конфигуришите cloud:
```bash
# Азуре за владу
az cloud set --name AzureUSGovernment
az login

# Азуре Кина
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Могу ли да користим azd у CI/CD пипелинима?</strong></summary>

Апсолутно! azd је дизајниран за аутоматизацију:
- Интеграција са GitHub Actions
- Подршка за Azure DevOps
- Аутентификација service principal-ом
- Ради у неинтерактивном режиму

Погледајте [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) за CI/CD шаблоне.
</details>

<details>
<summary><strong>Колико кошта коришћење azd?</strong></summary>

azd само по себи је **потпуно бесплатно** и отвореног кода. Плаћате само за:
- Azure ресурсе које деплојете
- Azure трошкове коришћења (рачунање, складиштење итд.)

Користите `azd provision --preview` да процените трошкове пре деплоја.
</details>

## Следећи кораци

1. **Завршите аутентификацију**: Уверите се да можете приступити вашој Azure претплати
2. **Пробајте први деплој**: Пратите [Водич за први пројекат](first-project.md)
3. **Истражите шаблоне**: Прегледајте доступне шаблоне са `azd template list`
4. **Конфигуришите свој IDE**: Подесите развојно окружење

## Подршка

Ако наиђете на проблеме:
- [Официјална документација](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Пријавите проблем](https://github.com/Azure/azure-dev/issues)
- [Заједничке дискусије](https://github.com/Azure/azure-dev/discussions)
- [Azure подршка](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Добијајте упутства за Azure команде директно у вашем едитору са `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD за почетнике](../../README.md)
- **📖 Current Chapter**: Поглавље 1 - Основа и брзи почетак
- **⬅️ Previous**: [Основе AZD](azd-basics.md) 
- **➡️ Next**: [Ваш први пројекат](first-project.md)
- **🚀 Next Chapter**: [Поглавље 2: Развој оријентисан на AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Инсталација завршена!** Наставите на [Ваш први пројекат](first-project.md) да почнете да градите са azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Овај документ је преведен уз помоћ услуге за превођење која користи вештачку интелигенцију [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, имајте на уму да аутоматски преводи могу садржати грешке или нетачности. Изворни документ на његовом оригиналном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било каква неспоразумевања или погрешна тумачења која произлазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
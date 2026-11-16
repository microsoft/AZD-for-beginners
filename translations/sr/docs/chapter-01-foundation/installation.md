# Водич за инсталацију и подешавање

**Навигација кроз поглавља:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основа и брз почетак
- **⬅️ Претходно**: [Основе AZD](azd-basics.md)
- **➡️ Следеће**: [Ваш први пројекат](first-project.md)
- **🚀 Следеће поглавље**: [Поглавље 2: Развој са фокусом на вештачку интелигенцију](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Увод

Овај свеобухватни водич ће вас провести кроз инсталацију и конфигурацију Azure Developer CLI (azd) на вашем систему. Учићете о више метода инсталације за различите оперативне системе, подешавању аутентификације и почетној конфигурацији како бисте припремили своје развојно окружење за Azure распореде.

## Циљеви учења

На крају ове лекције, моћи ћете:
- Успешно да инсталирате Azure Developer CLI на свој оперативни систем
- Подесите аутентификацију са Azure користећи више метода
- Подесите своје развојно окружење са неопходним предусловима
- Разумете различите опције инсталације и када користити сваку
- Решавате уобичајене проблеме при инсталацији и подешавању

## Резултати учења

Након завршетка ове лекције, моћи ћете да:
- Инсталирате azd користећи одговарајућу методу за своју платформу
- Аутентификујете се са Azure користећи azd auth login
- Потврдите инсталацију и тестирате основне azd команде
- Конфигуришете своје развојно окружење за оптималну употребу azd
- Самостално решите уобичајене проблеме при инсталацији

Овај водич ће вам помоћи да инсталирате и конфигуришете Azure Developer CLI на вашем систему, без обзира на ваш оперативни систем или развојно окружење.

## Предуслови

Пре инсталације azd, уверите се да имате:
- **Azure претплату** - [Креирајте бесплатан налог](https://azure.microsoft.com/free/)
- **Azure CLI** (опционо) - За примере који експлицитно покрећу `az`; azd аутентификује независно
- **Git** - За клонирање шаблона и контролу верзија
- **Docker** (опционо) - За контејнеризоване апликације

## Методе инсталације

### Windows

#### Опција 1: Windows Package Manager (Препоручено)
```cmd
winget install microsoft.azd
```

#### Опција 2: PowerShell инсталациони скрипт
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Опција 3: Chocolatey
```cmd
choco install azd
```

#### Опција 4: Ручна инсталација
1. Преузмите најновије издање са [GitHub](https://github.com/Azure/azure-dev/releases)
2. Распакујте у `C:\Program Files\azd\`
3. Додајте у PATH променљиву окружења

### macOS

#### Опција 1: Homebrew (Препоручено)
```bash
brew tap azure/azd
brew install azd
```

#### Опција 2: Скрипта за инсталацију
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опција 3: Ручна инсталација
Преузмите архиву за архитектуру вашег macOS-а са [релизних ресурса](https://github.com/Azure/azure-dev/releases), распакујте је и додајте `azd` бинарни фајл у ваш `PATH`.

### Linux

#### Опција 1: Скрипта за инсталацију (Препоручено)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опција 2: Пакетни менаџери

**Ручна инсталација из релизних ресурса:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Неки Codespaces и развојна окружења у контејнеру већ укључују `azd`, али треба то проверити уместо претпостављати:

```bash
azd version
```

Ако `azd` недостаје, инсталирајте га стандардном скриптом за окружење.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Овај ефермерни контејнер не чува стање пријаве између покретања. За понављане распореде, користите [подешавање у развојном контејнеру](dev-containers.md); контејнер изградње такође захтевају Docker демон доступан изнутра контејнера.

## ✅ Потврдите инсталацију

Након инсталације, проверите да ли azd исправно ради:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Очекујани излаз:
```
azd version 1.x.x (commit xxxxxx)
```

**Напомена**: Стварни број верзије може варирати. Проверите [Azure Developer CLI издања](https://github.com/Azure/azure-dev/releases) за најновију верзију.

**✅ Контролна листа успешне инсталације:**
- [ ] `azd version` приказује број верзије без грешака
- [ ] `azd --help` приказује документацију команде
- [ ] `azd template list` приказује доступне шаблоне
- [ ] Можете да креирате тест директоријум и успешно покренете `azd init`

**Ако су сва провера прошла, спремни сте да наставите на [Ваш први пројекат](first-project.md)!**

## Подешавање аутентификације

### Препоручено почетничко подешавање

За AZD-приоритете токове рада, пријавите се са `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Корисите пријаву у Azure CLI само када планирате да сами током курса покрећете `az` команде.

### Аутентификација Azure CLI (опционо)
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

### Који ток пријаве треба да користите?

- Користите `azd auth login` ако пратите почетнички AZD пут и углавном покрећете `azd` команде.
- Користите такође `az login` када желите да покрећете Azure CLI команде као што су `az account show` или да директно прегледате ресурсе.
- Ако вежба укључује и `azd` и `az` команде, покрените обе команде за пријаву једном приликом на почетку.

### Аутентификација путем кода уређаја
Ако сте на систему без графичког интерфејса или имате проблеме са прегледачем:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
За аутоматизована окружења:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Потврдите своје подешавање у целини

Ако желите брзу проверу спремности пре почетка Поглавља 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Конфигурација

### Глобална конфигурација
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Променљиве окружења
Додајте у свој профил љуске (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Интеграција IDE-а

### Visual Studio Code
Инсталирајте проширење Azure Developer CLI:
1. Отворите VS Code
2. Идите на Extensions (Ctrl+Shift+X)
3. Претражите "Azure Developer CLI"
4. Инсталирајте проширење

Карактеристике:
- IntelliSense за azure.yaml
- Интегрисане команде терминала
- Преглед шаблона
- Праћење распореда

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
2. Конфигуришите Azure креденције
3. Користите интегрисани терминал за azd команде

## 🐛 Решавање проблема са инсталацијом

### Уобичајени проблеми

#### Дозвола одбијена (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблеми са PATH
Ручно додајте azd у свој PATH:

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
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Конфликти верзија
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Како добити додатну помоћ
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Ажурирање azd

### Провера ажурирања
azd упозорава када је доступно новије издање, а тренутну верзију можете проверити са:
```bash
azd version
```

### Ручна ажурирања

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

## 💡 Често постављана питања

<details>
<summary><strong>Која је разлика између azd и az CLI?</strong></summary>

**Azure CLI (az)**: Низак ниво алат за управљање појединачним Azure ресурсима
- `az webapp create`, `az storage account create`
- Један ресурс у једном тренутку
- Фокус на управљање инфраструктуром

**Azure Developer CLI (azd)**: Високо ниво алат за комплетне распореде апликација
- `azd up` распореди целу апликацију са свим ресурсима
- Радни токови засновани на шаблонима
- Фокус на продуктивност програмера

**Они су независни**: azd по дефаулту користи своју аутентификацију. Инсталирајте и пријавите се у Azure CLI само за `az` команде, или експлицитно одаберите `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Могу ли користити azd са постојећим Azure ресурсима?</strong></summary>

Да! Можете:
1. Увозити постојеће ресурсе у azd окружења
2. Референцирати постојеће ресурсе у својим Бицеp шаблонима
3. Користити azd за нове распореде уз постојећу инфраструктуру

Погледајте [Водич за конфигурацију](../chapter-03-configuration/configuration.md) за детаље.
</details>

<details>
<summary><strong>Ради ли azd са Azure Government или Azure China?</strong></summary>

Да, конфигуришите облак:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Ако користите и Azure CLI, конфигуришите `az cloud set --name ...` посебно. Услуге шаблона и доступност модела варирају у зависности од облака.
</details>

<details>
<summary><strong>Могу ли користити azd у CI/CD цевоводима?</strong></summary>

Апсолутно! azd је дизајниран за аутоматизацију:
- Интеграција са GitHub Actions
- Подршка за Azure DevOps
- Аутентификација сервисним главним налогом
- Неинтерактивни режим

Погледајте [Водич за распореде](../chapter-04-infrastructure/deployment-guide.md) за CI/CD шаблоне.
</details>

<details>
<summary><strong>Колико кошта коришћење azd?</strong></summary>

azd је **потпуно бесплатан** и отвореног кода. Плаћате само за:
- Azure ресурсе које распоредите
- Трошкове коришћења Azure-а (рачунски ресурси, складиштење итд.)

Користите `azd provision --preview` за преглед предлога ресурса, а затим процените њихове трошкове помоћу [Azure калкулатора цена](https://azure.microsoft.com/pricing/calculator/). Преглед не израчунава цене.
</details>

## Следећи кораци

1. **Завршите аутентификацију**: Уверите се да можете приступити својој Azure претплати
2. **Покушајте свој први распоред**: Пратите [Водич за први пројекат](first-project.md)
3. **Истражите шаблоне**: Прегледајте доступне шаблоне помоћу `azd template list`
4. **Конфигуришите свој IDE**: Подесите своје развојно окружење

## Подршка

Ако наиђете на проблеме:
- [Званична документација](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Пријавите проблеме](https://github.com/Azure/azure-dev/issues)
- [Задруге заједнице](https://github.com/Azure/azure-dev/discussions)
- [Azure подршка](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Добите смернице за Azure команде директно у свом уређивачу уз `npx skills add microsoft/github-copilot-for-azure`

---

**Навигација кроз поглавља:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основа и брз почетак
- **⬅️ Претходно**: [Основе AZD](azd-basics.md) 
- **➡️ Следеће**: [Ваш први пројекат](first-project.md)
- **🚀 Следеће поглавље**: [Поглавље 2: Развој са фокусом на вештачку интелигенцију](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Инсталација завршена!** Наставите на [Ваш први пројекат](first-project.md) да почнете са израдом уз azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
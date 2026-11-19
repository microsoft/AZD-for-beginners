# Водич за инсталацију и постављање

**Навигација кроз поглавља:**
- **📚 Почетак курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основа и брзи почетак
- **⬅️ Претходно**: [Основе AZD](azd-basics.md)
- **➡️ Следеће**: [Ваш први пројекат](first-project.md)
- **🚀 Следеће поглавље**: [Поглавље 2: Развој са фокусом на вештачку интелигенцију](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Увод

Ова свеобухватна упутства ће вас провести кроз инсталацију и конфигурацију Azure Developer CLI (azd) на вашем систему. Научићете различите методе инсталације за различите оперативне системе, подешавање аутентификације и почетну конфигурацију како бисте припремили своје развојно окружење за Azure имплементације.

## Циљеви учења

На крају ове лекције, моћи ћете да:
- Успешно инсталирате Azure Developer CLI на вашем оперативном систему
- Конфигуришете аутентификацију са Azure користећи више метода
- Поставите своје развојно окружење са потребним предусловима
- Разумете различите опције инсталације и када да их користите
- Решавате уобичајене проблеме приликом инсталације и постављања

## Резултати учења

Након завршетка ове лекције, моћи ћете да:
- Инсталирате azd користећи одговарајућу методу за вашу платформу
- Аутентификујете се са Azure помоћу azd auth login
- Проверите своју инсталацију и тестирате основне azd команде
- Конфигуришете своје развојно окружење за оптималну употребу azd
- Самостално решавате уобичајене проблеме са инсталацијом

Овај водич ће вам помоћи да инсталирате и конфигуришете Azure Developer CLI на вашем систему, без обзира на оперативни систем или развојно окружење које користите.

## Предуслови

Пре инсталације azd, уверите се да имате:
- **Azure претплату** - [Креирајте бесплатан налог](https://azure.microsoft.com/free/)
- **Azure CLI** (опционо) - За примере који експлицитно користе `az`; azd аутентификује независно
- **Git** - За клонирање шаблона и контролу верзија
- **Docker** (опционо) - За апликације у контејнерима

**Путања Foundry GA у Поглављу 2:** Користите AZD **1.37.0 или новији**, инсталирајте пакет са `azd ext install microsoft.foundry`, и користите Python **3.13+** и актуелни **uv** за узорак хостованог агента. Режим дистрибуције кода се изводи даљински, тако да није потребна локална Docker градња. И даље су потребне Foundry дозволе, регионална доступност модела и квоте; погледајте [постављање хостованог агента](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Методи инсталације

### Windows

#### Опција 1: Windows Package Manager (препоручено)
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
1. Преузмите најновије издање са [GitHub-а](https://github.com/Azure/azure-dev/releases)
2. Распакујте у `C:\Program Files\azd\`
3. Додајте у PATH системску променљиву

### macOS

#### Опција 1: Homebrew (препоручено)
```bash
brew tap azure/azd
brew install azd
```

#### Опција 2: Инсталациони скрипт
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опција 3: Ручна инсталација
Преузмите архиву за вашу macOS архитектуру из [издања](https://github.com/Azure/azure-dev/releases), распакујте је и додајте бинарни фајл `azd` у ваш `PATH`.

### Linux

#### Опција 1: Инсталациони скрипт (препоручено)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опција 2: Менаџери пакета

**Ручна инсталација из издања:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Неки Codespaces и окружења за дев контейнер већ укључују `azd`, али би требало да то проверите уместо да претпоставите:

```bash
azd version
```

Ако недостаје `azd`, инсталирајте га стандардним скриптом за то окружење.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Овај привремени контејнер не чува стање пријављивања између покретања. За поновљене имплементације, користите [постављање дев контејнера](dev-containers.md); за градњу контејнера такође је потребан Docker демон који је доступан изнутра.

## ✅ Верификација инсталације

Након инсталације, проверите да ли azd ради исправно:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Очекујући излаз:
```
azd version 1.x.x (commit xxxxxx)
```

**Напомена**: Стварни број верзије може да варира. Проверите [Azure Developer CLI издања](https://github.com/Azure/azure-dev/releases) за најновију верзију.

**✅ Контролна листа успешне инсталације:**
- [ ] `azd version` приказује број верзије без грешака
- [ ] `azd --help` приказује документацију команди
- [ ] `azd template list` приказује доступне шаблоне
- [ ] Можете направити тестни директоријум и успешно покренути `azd init`

**Ако су сви кораци успешно прошли, спремни сте да наставите са [Ваш први пројекат](first-project.md)!**

## Постављање аутентификације

### Препоручено почетничко подешавање

За AZD-промотере, пријавите се са `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Користите пријаву преко Azure CLI само ако планирате да сами извршите `az` команде током курса.

### Azure CLI аутентикација (опционо)
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

### Који проток пријаве треба да користите?

- Користите `azd auth login` ако следите почетнички AZD пут и углавном извршавате `azd` команде.
- Користите и `az login` када желите да покренете Azure CLI команде као што су `az account show` или да директно прегледате ресурсе.
- Ако вежба укључује и `azd` и `az` команде, покрените обе команде за пријаву једном на почетку.

### Аутентикација са кодом уређаја
Ако користите систем без графичког интерфејса или имате проблема са претраживачем:
```bash
azd auth login --use-device-code
```

### Сервисни налог (CI/CD)
За аутоматизована окружења:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Потврдите своје потпуно подешавање

Ако желите брзу проверу спремности пре него што почнете Поглавље 1:

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
Додајте у свој shell профил (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Интеграција са IDE

### Visual Studio Code
Инсталирајте додатак Azure Developer CLI:
1. Отворите VS Code
2. Идите на Extensions (Ctrl+Shift+X)
3. Потражите "Azure Developer CLI"
4. Инсталирајте додатак

Карактеристике:
- IntelliSense за azure.yaml
- Интегрисане терминал команде
- Преглед шаблона
- Праћење имплементације

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

#### Одбијен приступ (Windows)
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

### Како добити више помоћи
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
azd вас упозорава када је доступно новије издање, а своју тренутну верзију можете проверити са:
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

**Azure CLI (az)**: Алат ниског нивоа за управљање појединачним Azure ресурсима
- `az webapp create`, `az storage account create`
- Један ресурс одједном
- Фокус на управљање инфраструктуром

**Azure Developer CLI (azd)**: Алат високог нивоа за комплетне имплементације апликација
- `azd up` имплементира целу апликацију са свим ресурсима
- Рад са шаблонима
- Фокус на продуктивност програмера

**Ова два су независна**: azd подразумевано користи свој систем аутентификације. Инсталирајте и пријавите се у Azure CLI само за `az` команде или експлицитно изаберите `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Могу ли користити azd са постојећим Azure ресурсима?</strong></summary>

Да! Можете:
1. Увезти постојеће ресурсе у azd окружења
2. Реферисати постојеће ресурсе у вашим Bicep шаблонима
3. Користити azd за нове имплементације уз постојећу инфраструктуру

Погледајте [Водич за конфигурацију](../chapter-03-configuration/configuration.md) за детаље.
</details>

<details>
<summary><strong>Да ли azd ради са Azure Government или Azure China?</strong></summary>

Да, конфигуришите cloud:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Ако користите и Azure CLI, конфигуришите `az cloud set --name ...` посебно. Сервиси шаблона и доступност модела варирају по cloud окружењу.
</details>

<details>
<summary><strong>Могу ли користити azd у CI/CD пипелиајнима?</strong></summary>

Апсолутно! azd је дизајниран за аутоматизацију:
- Интеграција са GitHub Actions
- Подршка за Azure DevOps
- Аутентификација сервисним налогом
- Непосреднички режим рада

Погледајте [Водич за имплементацију](../chapter-04-infrastructure/deployment-guide.md) за CI/CD обрасце.
</details>

<details>
<summary><strong>Колики су трошкови коришћења azd?</strong></summary>

Сам azd је **потпуно бесплатан** и отвореног кода. Плаћате само за:
- Azure ресурсе које имплементирате
- Трошкове Azure коришћења (рачунарску снагу, складиште, итд.)

Користите `azd provision --preview` да прегледате предложене ресурсе, а затим процените њихове трошкове помоћу [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/). Preview не рачуна цене.
</details>

## Следећи кораци

1. **Комплетирајте аутентификацију**: Уверите се да имате приступ вашој Azure претплати
2. **Пробајте вашу прву имплементацију**: Пратите [Водич за први пројекат](first-project.md)
3. **Истражите шаблоне**: Прегледајте доступне шаблоне са `azd template list`
4. **Конфигуришите свој IDE**: Поставите своје развојно окружење

## Подршка

Ако имате проблема:
- [Званична документација](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Пријавите проблеме](https://github.com/Azure/azure-dev/issues)
- [Заједничка дискусија](https://github.com/Azure/azure-dev/discussions)
- [Azure подршка](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Добијте упутства за Azure команде директно у вашем едитору уз `npx skills add microsoft/github-copilot-for-azure`

---

**Навигација кроз поглавља:**
- **📚 Почетак курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основа и брзи почетак
- **⬅️ Претходно**: [Основе AZD](azd-basics.md) 
- **➡️ Следеће**: [Ваш први пројекат](first-project.md)
- **🚀 Следеће поглавље**: [Поглавље 2: Развој са фокусом на вештачку интелигенцију](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Инсталација завршена!** Наставите са [Ваш први пројекат](first-project.md) како бисте започели рад са azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
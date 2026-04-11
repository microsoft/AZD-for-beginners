# Водич за инсталацију и подешавање

**Навигација по поглављима:**
- **📚 Почетна страница курса**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основа и брзи старт
- **⬅️ Претходно**: [AZD Basics](azd-basics.md)
- **➡️ Следеће**: [Your First Project](first-project.md)
- **🚀 Следеће поглавље**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Увод

Овај свеобухватни водич ће вас провести кроз инсталацију и конфигурацију Azure Developer CLI (azd) на вашем систему. Научићете више метода инсталације за различите оперативне системе, подешавање аутентификације и почетну конфигурацију да припремите своје развојно окружење за Azure деплоје.

## Циљеви учења

До краја ове лекције, ви ћете:
- Успешно инсталирати Azure Developer CLI на вашем оперативном систему
- Конфигурисати аутентикацију са Azure користећи више метода
- Подесити своје развојно окружење са неопходним предусловима
- Разумети различите опције инсталације и када користити коју
- Решавати уобичајене проблеме при инсталацији и подешавању

## Резултати учења

Након завршетка ове лекције, бићете у стању да:
- Инсталирате azd користећи одговарајућу методу за вашу платформу
- Аутентификујете се са Azure користећи azd auth login
- Верификујете вашу инсталацију и тестирате основне azd команде
- Конфигуришете ваше развојно окружење за оптимално коришћење azd
- Самостално решавате уобичајене проблеме при инсталацији

Овај водич ће вам помоћи да инсталирате и конфигуришете Azure Developer CLI на вашем систему, без обзира на оперативни систем или развојно окружење.

## Предуслови

Пре инсталације azd, уверите се да имате:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - За аутентификацију и управљање ресурсима
- **Git** - За клонирање шаблона и контролу верзија
- **Docker** (опционо) - За контейнеризоване апликације

## Методе инсталације

### Windows

#### Опција 1: Windows Package Manager (Препоручено)
```cmd
winget install microsoft.azd
```

#### Опција 2: PowerShell инсталерски скрипт
```powershell
# Корисно када winget није доступан
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

#### Опција 2: Инсталерски скрипт
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опција 3: Ручна инсталација
```bash
# Преузмите и инсталирајте
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Опција 1: Инсталерски скрипт (Препоручено)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опција 2: Пакет менаџери

**Ручна инсталација из release assets:**
```bash
# Преузмите најновију архиву за вашу Linux архитектуру са:
# https://github.com/Azure/azure-dev/releases
# Затим распакујте архиву и додајте azd бинарник у PATH.
```

### GitHub Codespaces

Неколико Codespaces и окружења са развојним контејнерима већ укључују `azd`, али треба да проверите уместо да претпостављате:

```bash
azd version
```

Ако `azd` недостаје, инсталирајте га стандардним скриптом за то окружење.

### Docker

```bash
# Покрените azd у контејнеру
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Креирајте алијас ради лакше употребе
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Проверите инсталацију

Након инсталације, проверите да ли azd ради исправно:

```bash
# Провери верзију
azd version

# Прикажи помоћ
azd --help

# Прикажи доступне шаблоне
azd template list
```

Очекује се излаз:
```
azd version 1.x.x (commit xxxxxx)
```

**Напомена**: Стварни број верзије ће варирати. Проверите [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) за најновију верзију.

**✅ Контролна листа успеха инсталације:**
- [ ] `azd version` приказује број верзије без грешака
- [ ] `azd --help` приказује документацију командe
- [ ] `azd template list` приказује доступне шаблоне
- [ ] Можете креирати тест директоријум и успешно покренути `azd init`

**Ако све провере прођу, спремни сте да наставите на [Your First Project](first-project.md)!**

## Подешавање аутентификације

### Препоручено почетничко подешавање

За AZD-први радни ток, пријавите се помоћу `azd auth login`.

```bash
# Потребно за AZD команде као што су azd up
azd auth login

# Проверите статус аутентификације AZD
azd auth login --check-status
```

Користите пријављивање преко Azure CLI само када планирате да током курса сами покрећете `az` команде.

### Azure CLI аутентификација (опционо)
```bash
# Инсталирајте Azure CLI ако већ није инсталиран
# Виндоус: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Линукс: погледајте документацију за инсталацију Azure CLI за вашу дистрибуцију

# Пријавите се у Azure
az login

# Проверите аутентификацију
az account show
```

### Који начин пријављивања бисте требали користити?

- Користите `azd auth login` ако пратите почетнички AZD пут и углавном покрећете `azd` команде.
- Користите `az login` такође када желите да покрећете Azure CLI команде као што су `az account show` или када директно прегледате ресурсе.
- Ако вежба укључује и `azd` и `az` команде, покрените оба начина пријављивања једном на почетку.

### Аутентификација помоћу кода уређаја
Ако сте на систему без графичког окружења или имате проблеме са прегледачем:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
За аутоматизована окружења:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Потврдите ваше целокупно подешавање

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
# Постави подразумевану претплату
azd config set defaults.subscription <subscription-id>

# Постави подразумевану локацију
azd config set defaults.location eastus2

# Прикажи целу конфигурацију
azd config show
```

### Променљиве окружења
Додајте у ваш shell профил (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Азуре конфигурација
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# азд конфигурација
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Омогући дебаг логовање
```

## Интеграција IDE-а

### Visual Studio Code
Инсталирајте Azure Developer CLI проширење:
1. Отворите VS Code
2. Идите на Проширења (Ctrl+Shift+X)
3. Претражите "Azure Developer CLI"
4. Инсталирајте проширење

Функције:
- IntelliSense за azure.yaml
- Команде интегрисаног терминала
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

## 🐛 Решавање проблема инсталације

### Уобичајени проблеми

#### Нема дозволе (Windows)
```powershell
# Покрените PowerShell као администратор
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблеми са PATH-ом
Додајте azd ручно у ваш PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Проблеми са мрежом/прокси-јем
```bash
# Конфигуришите прокси
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Прескочите SSL верификацију (није препоручљиво за производно окружење)
azd config set http.insecure true
```

#### Конфликти верзија
```bash
# Уклоните старе инсталације
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: уклоните претходни azd бинарни фајл или симболички линк пре поновне инсталације

# Очистите конфигурацију
rm -rf ~/.azd
```

### Додатна помоћ
```bash
# Омогући дебаг логовање
export AZD_DEBUG=true
azd <command> --debug

# Погледај тренутну конфигурацију
azd config show

# Погледај тренутни статус распоређивања
azd show
```

## Ажурирање azd

### Провера ажурирања
azd упозорава када је доступно новије издање, и можете потврдити вашу текућу билду са:
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

**Azure CLI (az)**: Ниско-нивоу алат за управљање појединачним Azure ресурсима
- `az webapp create`, `az storage account create`
- Један ресурс по један
- Фокус на управљању инфраструктуром

**Azure Developer CLI (azd)**: Вишe-нивоу алат за целокупне деплое апликација
- `azd up` деплојује целу апликацију са свим ресурсима
- Радни токови засновани на шаблонима
- Фокус на продуктивности програмера

**Потребни су вам оба**: azd користи az CLI за аутентификацију
</details>

<details>
<summary><strong>Могу ли користити azd са постојећим Azure ресурсима?</strong></summary>

Да! Можете:
1. Импортовати постојеће ресурсе у azd окружења
2. Реферисати постојеће ресурсе у вашим Bicep шаблонима
3. Користити azd за нове деплоје поред постојеће инфраструктуре

Погледајте [Configuration Guide](configuration.md) за детаље.
</details>

<details>
<summary><strong>Ради ли azd са Azure Government или Azure China?</strong></summary>

Да, конфигуришите облак:
```bash
# Azure Влада
az cloud set --name AzureUSGovernment
az login

# Azure Кина
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Могу ли користити azd у CI/CD пипелинима?</strong></summary>

Апсолутно! azd је дизајниран за аутоматизацију:
- Интеграција са GitHub Actions
- Подршка за Azure DevOps
- Аутентификација преко service principal
- Неинтерактивни режим

Погледајте [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) за CI/CD шаблоне.
</details>

<details>
<summary><strong>Колико кошта коришћење azd?</strong></summary>

azd је сам по себи **потпуно бесплатан** и open-source. Плаћате само за:
- Azure ресурсе које распоредите
- Трошкове коришћења Azure-а (рачунарски ресурси, складиштење, итд.)

Користите `azd provision --preview` да процените трошкове пре деплоја.
</details>

## Следећи кораци

1. **Завршите аутентикацију**: Уверите се да имате приступ вашој Azure претплати
2. **Покушајте ваш први деплој**: Пратите [First Project Guide](first-project.md)
3. **Истражите шаблоне**: Прегледајте доступне шаблоне са `azd template list`
4. **Конфигуришите ваш IDE**: Подесите ваше развојно окружење

## Подршка

Ако наиђете на проблеме:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Добијте упутства за Azure команде директно у вашем уређивачу са `npx skills add microsoft/github-copilot-for-azure`

---

**Навигација по поглављима:**
- **📚 Почетна страница курса**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основа и брзи старт
- **⬅️ Претходно**: [AZD Basics](azd-basics.md) 
- **➡️ Следеће**: [Your First Project](first-project.md)
- **🚀 Следеће поглавље**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Инсталација завршена!** Наставите на [Your First Project](first-project.md) да започнете изградњу са azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ограничење одговорности**:
Овај документ је преведен помоћу AI сервиса за превођење [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо ка тачности, молимо имајте у виду да аутоматизовани преводи могу садржати грешке или нетачности. Изворни документ на свом матичном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод који обави човек. Не сносимо одговорност за било каква неспоразумевања или погрешне тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
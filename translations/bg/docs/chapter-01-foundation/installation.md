# Ръководство за инсталация и настройка

**Навигация в главите:**
- **📚 Начална страница на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Основи на AZD](azd-basics.md)
- **➡️ Следваща**: [Вашият първи проект](first-project.md)
- **🚀 Следваща глава**: [Глава 2: Разработка с акцент върху AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Въведение

Това подробно ръководство ще ви преведе през процеса на инсталиране и конфигуриране на Azure Developer CLI (azd) на вашата система. Ще научите няколко метода за инсталиране за различни операционни системи, настройка на автентикация и първоначална конфигурация, за да подготвите вашата среда за разработка за разгръщания в Azure.

## Учебни цели

В края на този урок ще можете:
- Успешно да инсталирате Azure Developer CLI на вашата операционна система
- Да конфигурирате автентикация с Azure чрез няколко метода
- Да настроите вашата среда за разработка с необходимите предварителни условия
- Да разбирате различните опции за инсталация и кога да използвате всяка от тях
- Да отстранявате често срещани проблеми с инсталирането и настройването

## Резултати от обучението

След завършване на урока, вие ще можете:
- Да инсталирате azd с подходящия метод за вашата платформа
- Да се автентикирате с Azure чрез azd auth login
- Да проверите инсталацията си и да тествате базови azd команди
- Да конфигурирате вашата среда за разработка за оптимално използване на azd
- Самостоятелно да разрешавате често срещани проблеми при инсталацията

Това ръководство ще ви помогне да инсталирате и конфигурирате Azure Developer CLI на вашата система, независимо от операционната система или средата за разработка.

## Предварителни условия

Преди да инсталирате azd, уверете се че имате:
- **Абонамент за Azure** - [Създайте безплатен акаунт](https://azure.microsoft.com/free/)
- **Azure CLI** (по желание) - За примери, които изрично използват `az`; azd се автентикира самостоятелно
- **Git** - За клониране на шаблони и контрол на версиите
- **Docker** (по желание) - За контейнеризирани приложения

## Методи за инсталация

### Windows

#### Опция 1: Windows Package Manager (Препоръчително)
```cmd
winget install microsoft.azd
```

#### Опция 2: PowerShell инсталационен скрипт
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Опция 3: Chocolatey
```cmd
choco install azd
```

#### Опция 4: Ръчна инсталация
1. Изтеглете последната версия от [GitHub](https://github.com/Azure/azure-dev/releases)
2. Разархивирайте в `C:\Program Files\azd\`
3. Добавете към системната променлива PATH

### macOS

#### Опция 1: Homebrew (Препоръчително)
```bash
brew tap azure/azd
brew install azd
```

#### Опция 2: Инсталационен скрипт
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опция 3: Ръчна инсталация
Изтеглете архива за вашата macOS архитектура от [release assets](https://github.com/Azure/azure-dev/releases), разархивирайте и добавете двоичния файл `azd` във вашия `PATH`.

### Linux

#### Опция 1: Инсталационен скрипт (Препоръчително)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опция 2: Пакетни мениджъри

**Ръчна инсталация от release assets:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Някои Codespaces и dev container среди вече включват `azd`, но трябва да го потвърдите, а не да приемате:

```bash
azd version
```

Ако `azd` липсва, инсталирайте го със стандартния скрипт за средата.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Този временен контейнер не запазва състоянието на влизане между изпълненията. За повторни разгръщания използвайте [dev container setup](dev-containers.md); билдовете на контейнера също изискват достъп до Docker демон отвътре в контейнера.

## ✅ Проверка на инсталацията

След инсталация, проверете дали azd работи правилно:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Очакван изход:
```
azd version 1.x.x (commit xxxxxx)
```

**Забележка**: Реалният номер на версията ще варира. Проверете [Издания на Azure Developer CLI](https://github.com/Azure/azure-dev/releases) за последната версия.

**✅ Контролен списък за успешна инсталация:**
- [ ] `azd version` показва номер на версия без грешки
- [ ] `azd --help` показва документация на команда
- [ ] `azd template list` показва налични шаблони
- [ ] Можете да създадете тестова директория и успешно да изпълните `azd init`

**Ако всички проверки преминат, сте готови да продължите към [Вашия първи проект](first-project.md)!**

## Настройка на автентикация

### Препоръчителна настройка за начинаещи

За AZD-първи работни процеси, влезте с `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Използвайте влизане с Azure CLI само ако планирате сами да изпълнявате `az` команди по време на курса.

### Автентикация с Azure CLI (по избор)
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

### Кой поток за влизане да използвате?

- Използвайте `azd auth login` ако следвате начинаещия AZD път и главно изпълнявате `azd` команди.
- Използвайте също `az login`, когато искате да изпълнявате Azure CLI команди като `az account show` или да разглеждате ресурси директно.
- Ако упражнението включва и двете `azd` и `az` команди, стартирайте и двете влизания веднъж в началото.

### Автентикация чрез устройство (Device Code Authentication)
Ако използвате система без графичен интерфейс или имате проблеми с браузъра:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
За автоматизирани среди:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Проверете цялостната си настройка

Ако искате бърза проверка преди да започнете Глава 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Конфигурация

### Глобална конфигурация
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Променливи на средата
Добавете към вашия shell профил (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Интеграция с IDE

### Visual Studio Code
Инсталирайте разширението Azure Developer CLI:
1. Отворете VS Code
2. Отидете на Разширения (Ctrl+Shift+X)
3. Потърсете "Azure Developer CLI"
4. Инсталирайте разширението

Функции:
- IntelliSense за azure.yaml
- Вградени команди за терминала
- Разглеждане на шаблони
- Мониторинг на разгръщания

### GitHub Codespaces
Създайте `.devcontainer/devcontainer.json`:
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
1. Инсталирайте Azure плъгина
2. Конфигурирайте Azure идентификационни данни
3. Използвайте вградения терминал за azd команди

## 🐛 Отстраняване на проблеми при инсталация

### Чести проблеми

#### Отказан достъп (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблеми с PATH
Ръчно добавете azd към PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Проблеми с мрежата/прокси
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Конфликти на версии
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Как да получите допълнителна помощ
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Актуализиране на azd

### Проверка за актуализации
azd предупреждава когато има по-нова версия, и можете да проверите текущия билд с:
```bash
azd version
```

### Ръчни актуализации

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

## 💡 Често задавани въпроси

<details>
<summary><strong>Каква е разликата между azd и az CLI?</strong></summary>

**Azure CLI (az)**: Ниско-нивое инструмент за управление на отделни Azure ресурси
- `az webapp create`, `az storage account create`
- Един ресурс наведнъж
- Фокус върху управление на инфраструктурата

**Azure Developer CLI (azd)**: Високо-нивое инструмент за пълни разгръщания на приложения
- `azd up` разгръща цялото приложение с всички ресурси
- Работни потоци, базирани на шаблони
- Фокус върху производителността на разработчика

**Те са независими**: azd използва собствена автентикация по подразбиране. Инсталирайте и влезте в Azure CLI само за `az` команди или изрично приемете `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Мога ли да използвам azd с вече съществуващи Azure ресурси?</strong></summary>

Да! Можете:
1. Да импортирате съществуващи ресурси в azd среди
2. Да позовавате съществуващи ресурси във вашите Bicep шаблони
3. Да използвате azd за нови разгръщания заедно със съществуваща инфраструктура

Вижте [Ръководство за конфигурация](../chapter-03-configuration/configuration.md) за подробности.
</details>

<details>
<summary><strong>Работи ли azd с Azure Government или Azure China?</strong></summary>

Да, конфигурирайте облака:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Ако използвате и Azure CLI, конфигурирайте `az cloud set --name ...` отделно. Услугите за шаблони и наличността на модели варират в различните облаци.
</details>

<details>
<summary><strong>Мога ли да използвам azd в CI/CD pipelines?</strong></summary>

Абсолютно! azd е проектиран за автоматизация:
- Интеграция с GitHub Actions
- Поддръжка на Azure DevOps
- Автентикация на service principal
- Нейтерактивен режим

Вижте [Ръководство за разгръщане](../chapter-04-infrastructure/deployment-guide.md) за CI/CD модели.
</details>

<details>
<summary><strong>Каква е цената за ползване на azd?</strong></summary>

azd сам по себе си е **напълно безплатен** и с отворен код. Плащате само за:
- Azure ресурси, които разгръщате
- Консумация на Azure (изчисления, съхранение и др.)

Използвайте `azd provision --preview` за преглед на предлаганите ресурси, след което оценете разходите с [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/). Preview не изчислява цени.
</details>

## Следващи стъпки

1. **Завършете автентикацията**: Уверете се, че имате достъп до вашия Azure абонамент
2. **Опитайте първото си разгръщане**: Следвайте [Ръководството за първи проект](first-project.md)
3. **Разгледайте шаблоните**: Прегледайте наличните шаблони с `azd template list`
4. **Настройте вашия IDE**: Подгответе средата си за разработка

## Поддръжка

Ако имате проблеми:
- [Официална документация](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Докладвайте проблеми](https://github.com/Azure/azure-dev/issues)
- [Обществени дискусии](https://github.com/Azure/azure-dev/discussions)
- [Azure поддръжка](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Получавайте указания за Azure команди директно в редактора с `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация в главите:**
- **📚 Начална страница на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Основи на AZD](azd-basics.md) 
- **➡️ Следваща**: [Вашият първи проект](first-project.md)
- **🚀 Следваща глава**: [Глава 2: Разработка с акцент върху AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Инсталацията е завършена!** Продължете към [Вашия първи проект](first-project.md), за да започнете работа с azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
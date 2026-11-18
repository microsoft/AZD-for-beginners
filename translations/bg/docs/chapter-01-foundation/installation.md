# Ръководство за инсталиране и настройка

**Навигация в главите:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Основи на AZD](azd-basics.md)
- **➡️ Следваща**: [Вашият първи проект](first-project.md)
- **🚀 Следваща глава**: [Глава 2: Разработка с приоритет AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Въведение

Това изчерпателно ръководство ще ви преведе през инсталирането и конфигурирането на Azure Developer CLI (azd) на вашата система. Ще научите няколко метода за инсталация за различни операционни системи, настройка на автентикация и начална конфигурация, за да подготвите средата си за разработка за разгръщане в Azure.

## Цели на обучението

В края на този урок ще можете да:
- Успешно инсталирате Azure Developer CLI на вашата операционна система
- Конфигурирате автентикация с Azure чрез няколко метода
- Настроите средата си за разработка с необходимите предпоставки
- Разбирате различните опции за инсталация и кога да използвате всяка от тях
- Отстранявате често срещани проблеми при инсталация и настройка

## Резултати от обучението

След завършване на урока, ще можете да:
- Инсталирате azd, използвайки подходящия метод за вашата платформа
- Автентикирате с Azure чрез azd auth login
- Проверите инсталацията си и изпробвате основните команди на azd
- Конфигурирате средата си за оптимално използване на azd
- Сами разрешавате често срещани проблеми при инсталация

Този наръчник ще ви помогне да инсталирате и конфигурирате Azure Developer CLI независимо от вашата операционна система или среда за разработка.

## Предпоставки

Преди да инсталирате azd, уверете се, че имате:
- **Абонамент за Azure** - [Създайте безплатен акаунт](https://azure.microsoft.com/free/)
- **Azure CLI** (по желание) - За примери, които изрично изпълняват `az`; azd се автентикира независимо
- **Git** - За клониране на шаблони и контрол на версиите
- **Docker** (по желание) - За контейнеризирани приложения

**Пътят Foundry GA за Глава 2:** Използвайте AZD **1.37.0 или по-нова версия**, инсталирайте пакета с `azd ext install microsoft.foundry` и използвайте Python **3.13+** и текущия **uv** за примера с хоствания агент. Режимът му за разгръщане на код се изгражда отдалечено, така че не изисква локална Docker сборка. Все пак са необходими Foundry разрешения, регионална наличност на моделите и квота; вижте [настройката на хостван агент](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Методи за инсталация

### Windows

#### Опция 1: Windows Package Manager (Препоръчително)
```cmd
winget install microsoft.azd
```

#### Опция 2: Инсталационен скрипт за PowerShell
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
3. Добавете към променливата на средата PATH

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
Изтеглете архива за вашата macOS архитектура от [релийз активите](https://github.com/Azure/azure-dev/releases), разархивирайте го и добавете изпълнимия файл `azd` към вашия `PATH`.

### Linux

#### Опция 1: Инсталационен скрипт (Препоръчително)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опция 2: Package Използватели

**Ръчна инсталация от релийз активи:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Някои Codespaces и dev контейнер среди вече включват `azd`, но е добре да го проверите, вместо да предполагате:

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

Този временен контейнер не запазва състоянието на вписване между стартиранията. За повтарящи се разгръщания използвайте [настройката на dev контейнер](dev-containers.md); също така, контейнерните сборки изискват достъп до Docker демон отвътре в контейнера.

## ✅ Проверка на инсталацията

След инсталацията, потвърдете, че azd работи правилно:

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

**Бележка**: Реалният номер на версията може да се различава. Проверете [релийзите на Azure Developer CLI](https://github.com/Azure/azure-dev/releases) за най-актуалната версия.

**✅ Чеклист за успешна инсталация:**
- [ ] `azd version` показва номера на версията без грешки
- [ ] `azd --help` показва документацията на командите
- [ ] `azd template list` показва наличните шаблони
- [ ] Можете да създадете тестова директория и успешно да изпълните `azd init`

**Ако всички проверки са успешни, сте готови да продължите към [Вашият първи проект](first-project.md)!**

## Настройка на автентикация

### Препоръчителна начална настройка

За работни потоци с приоритет AZD, влезте с `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Използвайте Azure CLI вписване само когато планирате сами да изпълнявате `az` команди по време на курса.

### Автентикация чрез Azure CLI (по избор)
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

### Кой поток за вписване да използвате?

- Използвайте `azd auth login`, ако следвате начинаещия път с AZD и основно изпълнявате `azd` команди.
- Използвайте `az login` и когато искате да изпълнявате Azure CLI команди като `az account show` или да разглеждате ресурси директно.
- Ако упражнението включва както `azd`, така и `az` команди, изпълнете и двата потока за вписване веднъж в началото.

### Автентикация с устройство
Ако сте на безглава система или имате проблеми с браузъра:
```bash
azd auth login --use-device-code
```

### Служебен главен (CI/CD)
За автоматизирани среди:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Потвърдете пълната си настройка

Ако искате бърза проверка на готовността преди да започнете Глава 1:

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
Добавете към профила на вашата шел сесия (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Интеграция със IDE

### Visual Studio Code
Инсталирайте разширението Azure Developer CLI:
1. Отворете VS Code
2. Отидете на Разширения (Ctrl+Shift+X)
3. Потърсете "Azure Developer CLI"
4. Инсталирайте разширението

Функции:
- IntelliSense за azure.yaml
- Интегрирани команди в терминала
- Преглед на шаблони
- Мониторинг на разгръщанията

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
2. Конфигурирайте Azure идентификационните данни
3. Използвайте интегрирания терминал за azd команди

## 🐛 Отстраняване на проблеми при инсталация

### Чести проблеми

#### Отказан достъп (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблеми с PATH
Ръчно добавете azd към вашия PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Мрежови/Прокси проблеми
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

### Получаване на допълнителна помощ
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Актуализация на azd

### Проверка за актуализация
azd предупреждава, когато има по-нова версия, и можете да проверите текущата си сборка с:
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

**Azure CLI (az)**: Инструмент от ниско ниво за управление на отделни Azure ресурси
- `az webapp create`, `az storage account create`
- Един ресурс наведнъж
- Фокус върху управлението на инфраструктурата

**Azure Developer CLI (azd)**: Инструмент от високо ниво за пълно разгръщане на приложения
- `azd up` разгръща цялото приложение с всички ресурси
- Работни потоци, базирани на шаблони
- Фокус върху продуктивността на разработчика

**Те са независими**: azd използва своя собствена автентикация по подразбиране. Инсталирайте и влезте в Azure CLI само за `az` команди или изрично изберете `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Мога ли да използвам azd със съществуващи Azure ресурси?</strong></summary>

Да! Можете:
1. Да импортирате съществуващи ресурси в azd среди
2. Да препращате към съществуващи ресурси в Bicep шаблоните си
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

Ако използвате и Azure CLI, конфигурирайте `az cloud set --name ...` отделно. Услугите за шаблони и наличността на моделите варират в различните облаци.
</details>

<details>
<summary><strong>Мога ли да използвам azd в CI/CD пайплайни?</strong></summary>

Абсолютно! azd е проектиран за автоматизация:
- Интеграция с GitHub Actions
- Поддръжка на Azure DevOps
- Автентикация със служебен главен
- Ненасочен режим

Вижте [Ръководството за разгръщане](../chapter-04-infrastructure/deployment-guide.md) за CI/CD модели.
</details>

<details>
<summary><strong>Каква е цената за използването на azd?</strong></summary>

azd сам по себе си е **напълно безплатен** и с отворен код. Плащате само за:
- Azure ресурсите, които разгръщате
- Разходите за потребление в Azure (изчислителна мощ, съхранение и др.)

Използвайте `azd provision --preview` за инспекция на предлаганите ресурси, след което оценете разходите с [Калкулатора за цени на Azure](https://azure.microsoft.com/pricing/calculator/). Прегледът не изчислява цени.
</details>

## Следващи стъпки

1. **Завършете автентикацията**: Уверете се, че имате достъп до вашия Azure абонамент
2. **Опитайте първото си разгръщане**: Следвайте [Ръководството за първия проект](first-project.md)
3. **Разгледайте шаблоните**: Прегледайте наличните шаблони с `azd template list`
4. **Конфигурирайте IDE-то си**: Настройте средата си за разработка

## Поддръжка

Ако срещнете проблеми:
- [Официална документация](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Докладвайте проблеми](https://github.com/Azure/azure-dev/issues)
- [Обсъждания в общността](https://github.com/Azure/azure-dev/discussions)
- [Поддръжка на Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Получавайте указания за Azure команди директно в редактора си с `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация в главите:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Основи на AZD](azd-basics.md) 
- **➡️ Следваща**: [Вашият първи проект](first-project.md)
- **🚀 Следваща глава**: [Глава 2: Разработка с приоритет AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Инсталацията е завършена!** Продължете към [Вашият първи проект](first-project.md), за да започнете работа с azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
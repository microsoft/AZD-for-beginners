# Ръководство за инсталация и настройка

**Навигация в главата:**
- **📚 Начална страница на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Основи на AZD](azd-basics.md)
- **➡️ Следваща**: [Вашият първи проект](first-project.md)
- **🚀 Следваща глава**: [Глава 2: Разработка, ориентирана към AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Въведение

Това всеобхватно ръководство ще ви преведе през инсталирането и конфигурирането на Azure Developer CLI (azd) на вашата система. Ще научите няколко метода за инсталиране за различни операционни системи, настройка на удостоверяване и начална конфигурация, за да подготвите средата си за разработка за разгръщания в Azure.

## Учебни цели

Към края на този урок вие ще:
- Успешно инсталирате Azure Developer CLI на вашата операционна система
- Конфигурирате удостоверяване с Azure чрез няколко метода
- Настройте средата за разработка с необходимите предварителни условия
- Разберете различните опции за инсталиране и кога да използвате всяка
- Отстраните често срещани проблеми при инсталация и настройка

## Резултати от обучението

След завършване на този урок ще можете да:
- Инсталирате azd чрез подходящия метод за вашата платформа
- Удостоверите се в Azure чрез azd auth login
- Проверите инсталацията си и тествате основни azd команди
- Конфигурирате средата си за разработка за оптимална работа с azd
- Самостоятелно разрешавате често срещани проблеми с инсталацията

Това ръководство ще ви помогне да инсталирате и конфигурирате Azure Developer CLI на вашата система, независимо от вашата операционна система или среда за разработка.

## Предварителни изисквания

Преди да инсталирате azd, уверете се, че разполагате с:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - за удостоверяване и управление на ресурси
- **Git** - за клониране на шаблони и контрол на версиите
- **Docker** (по избор) - за контейнеризирани приложения

## Методи за инсталиране

### Windows

#### Опция 1: PowerShell (Препоръчително)
```powershell
# Стартирайте като администратор или с повишени привилегии
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Опция 2: Пакетен мениджър на Windows (winget)
```cmd
winget install Microsoft.Azd
```

#### Опция 3: Chocolatey
```cmd
choco install azd
```

#### Опция 4: Ръчна инсталация
1. Изтеглете последното издание от [GitHub](https://github.com/Azure/azure-dev/releases)
2. Разархивирайте в `C:\Program Files\azd\`
3. Добавете към променливата на средата PATH

### macOS

#### Опция 1: Homebrew (Препоръчително)
```bash
brew tap azure/azd
brew install azd
```

#### Опция 2: Скрипт за инсталиране
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опция 3: Ръчна инсталация
```bash
# Изтеглете и инсталирайте
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Опция 1: Скрипт за инсталиране (Препоръчително)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опция 2: Пакетни мениджъри

**Ubuntu/Debian:**
```bash
# Добавете хранилище за пакети на Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Инсталирайте azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Добавете хранилище за пакети на Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd е предварително инсталиран в GitHub Codespaces. Просто създайте codespace и започнете да използвате azd веднага.

### Docker

```bash
# Стартирайте azd в контейнер
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Създайте псевдоним за по-лесна употреба
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Проверка на инсталацията

След инсталация, проверете дали azd работи правилно:

```bash
# Проверете версията
azd version

# Прегледайте помощта
azd --help

# Изброете наличните шаблони
azd template list
```

Очакван изход:
```
azd version 1.x.x (commit xxxxxx)
```

**Забележка**: Реалният номер на версията може да варира. Проверете [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) за най-новата версия.

**✅ Контролен списък за успешна инсталация:**
- [ ] `azd version` показва номер на версията без грешки
- [ ] `azd --help` показва документацията за командите
- [ ] `azd template list` показва наличните шаблони
- [ ] `az account show` показва вашия Azure абонамент
- [ ] Можете да създадете тестова директория и успешно да изпълните `azd init`

**Ако всички проверки преминат успешно, сте готови да продължите към [Вашият първи проект](first-project.md)!**

## Настройка на удостоверяване

### Удостоверяване чрез Azure CLI (Препоръчително)
```bash
# Инсталирайте Azure CLI, ако все още не е инсталиран
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Влезте в Azure
az login

# Проверете удостоверяването
az account show
```

### Удостоверяване с код на устройството
Ако използвате система без графичен интерфейс или имате проблеми с браузъра:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
За автоматизирани среди:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Конфигурация

### Глобална конфигурация
```bash
# Задаване на абонамент по подразбиране
azd config set defaults.subscription <subscription-id>

# Задаване на местоположение по подразбиране
azd config set defaults.location eastus2

# Преглед на цялата конфигурация
azd config list
```

### Променливи на средата
Добавете към профила на вашия шел (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Конфигурация на Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Конфигурация на azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Активиране на регистриране за отстраняване на грешки
```

## Интеграция с IDE

### Visual Studio Code
Инсталирайте разширението Azure Developer CLI:
1. Отворете VS Code
2. Отидете в Extensions (Ctrl+Shift+X)
3. Търсете "Azure Developer CLI"
4. Инсталирайте разширението

Функции:
- IntelliSense за azure.yaml
- Интегрирани терминални команди
- Разглеждане на шаблони
- Наблюдение на разгръщания

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
2. Конфигурирайте Azure удостоверенията
3. Използвайте интегрирания терминал за изпълнение на azd команди

## 🐛 Отстраняване на проблеми при инсталация

### Чести проблеми

#### Отказан достъп (Windows)
```powershell
# Стартирайте PowerShell като администратор
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблеми с PATH
Добавете ръчно azd към вашия PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Проблеми с мрежа/прокси
```bash
# Конфигуриране на прокси
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Пропускане на проверката на SSL (не се препоръчва за производствена среда)
azd config set http.insecure true
```

#### Конфликти на версиите
```bash
# Премахнете стари инсталации
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Почистете конфигурацията
rm -rf ~/.azd
```

### Получаване на допълнителна помощ
```bash
# Активиране на записване на отладъчни съобщения
export AZD_DEBUG=true
azd <command> --debug

# Преглед на текущата конфигурация
azd config list

# Преглед на текущия статус на разгръщането
azd show
```

## Актуализиране на azd

### Автоматични актуализации
azd ще ви уведомява, когато са налични актуализации:
```bash
azd version --check-for-updates
```

### Ръчни актуализации

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

## 💡 Често задавани въпроси

<details>
<summary><strong>Каква е разликата между azd и az CLI?</strong></summary>

**Azure CLI (az)**: Инструмент от ниско ниво за управление на отделни Azure ресурси
- `az webapp create`, `az storage account create`
- Един ресурс наведнъж
- Фокус върху управлението на инфраструктурата

**Azure Developer CLI (azd)**: Инструмент от високо ниво за пълни внедрявания на приложения
- `azd up` разгръща цялото приложение с всички ресурси
- Работни потоци, базирани на шаблони
- Фокус върху продуктивността на разработчика

**И двата са необходими**: azd използва az CLI за удостоверяване
</details>

<details>
<summary><strong>Мога ли да използвам azd с вече съществуващи Azure ресурси?</strong></summary>

Да! Можете:
1. Да импортирате съществуващи ресурси в azd среди
2. Да реферирате съществуващи ресурси във вашите Bicep шаблони
3. Да използвате azd за нови разгръщания паралелно със съществуващата инфраструктура

Вижте [Configuration Guide](configuration.md) за подробности.
</details>

<details>
<summary><strong>Работи ли azd с Azure Government или Azure China?</strong></summary>

Да, конфигурирайте облака:
```bash
# Azure за правителството
az cloud set --name AzureUSGovernment
az login

# Azure Китай
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Мога ли да използвам azd в CI/CD pipelines?</strong></summary>

Абсолютно! azd е проектиран за автоматизация:
- Интеграция с GitHub Actions
- Поддръжка за Azure DevOps
- Удостоверяване чрез service principal
- Ненатрапчив режим (non-interactive)

Вижте [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) за CI/CD модели.
</details>

<details>
<summary><strong>Колко струва използването на azd?</strong></summary>

azd сам по себе си е **напълно безплатен** и с отворен код. Плащате само за:
- Azure ресурсите, които разгръщате
- Разходите за потребление в Azure (изчисления, съхранение и др.)

Използвайте `azd provision --preview` за оценка на разходите преди разгръщане.
</details>

## Следващи стъпки

1. **Завършете удостоверяването**: Уверете се, че имате достъп до вашия Azure абонамент
2. **Опитайте първото си разгръщане**: Следвайте [Вашият първи проект](first-project.md)
3. **Разгледайте шаблоните**: Прегледайте наличните шаблони с `azd template list`
4. **Конфигурирайте IDE-то си**: Настройте средата си за разработка

## Поддръжка

Ако срещнете проблеми:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Получавайте указания за Azure команди директно във вашия редактор с `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация в главата:**
- **📚 Начална страница на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Основи на AZD](azd-basics.md) 
- **➡️ Следваща**: [Вашият първи проект](first-project.md)
- **🚀 Следваща глава**: [Глава 2: Разработка, ориентирана към AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Инсталацията е завършена!** Продължете към [Вашият първи проект](first-project.md), за да започнете да изграждате с azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на услуга за превод с изкуствен интелект [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод от квалифициран преводач. Не носим отговорност за каквито и да е недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
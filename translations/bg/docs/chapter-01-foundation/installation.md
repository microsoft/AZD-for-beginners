# Ръководство за инсталиране и настройка

**Навигация в главата:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [AZD Basics](azd-basics.md)
- **➡️ Следваща**: [Вашият първи проект](first-project.md)
- **🚀 Следваща глава**: [Глава 2: Разработка, ориентирана към AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Въведение

Това цялостно ръководство ще ви преведе през инсталирането и конфигурирането на Azure Developer CLI (azd) на вашата система. Ще научите няколко метода за инсталиране за различни операционни системи, настройка на удостоверяване и начална конфигурация, за да подготвите средата си за разработка за внедряване в Azure.

## Цели на обучението

Към края на този урок вие ще:
- Успешно инсталирате Azure Developer CLI на вашата операционна система
- Конфигурирате удостоверяване с Azure с помощта на няколко метода
- Настроите средата си за разработка с необходимите предпоставки
- Разберете различните опции за инсталация и кога да използвате всяка от тях
- Отстраните често срещани проблеми при инсталиране и настройка

## Резултати от обучението

След завършване на този урок ще можете да:
- Инсталирате azd, използвайки подходящия метод за вашата платформа
- Удостоверите се с Azure чрез azd auth login
- Проверите инсталацията си и тествате базови azd команди
- Конфигурирате средата си за разработка за оптимална употреба на azd
- Самостоятелно разрешавате често срещани проблеми при инсталация

Това ръководство ще ви помогне да инсталирате и конфигурирате Azure Developer CLI на вашата система, независимо от вашата операционна система или среда за разработка.

## Предварителни изисквания

Преди да инсталирате azd, уверете се, че имате:
- **Абонамент за Azure** - [Създайте безплатен акаунт](https://azure.microsoft.com/free/)
- **Azure CLI** - За удостоверяване и управление на ресурси
- **Git** - За клониране на шаблони и контрол на версиите
- **Docker** (по избор) - За контейнеризирани приложения

## Методи за инсталиране

### Windows

#### Опция 1: PowerShell (Препоръчително)
```powershell
# Стартирайте като администратор или с повишени привилегии
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Опция 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Опция 3: Chocolatey
```cmd
choco install azd
```

#### Опция 4: Ръчна инсталация
1. Изтеглете най-новото издание от [GitHub](https://github.com/Azure/azure-dev/releases)
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
# Добавяне на хранилище за пакети на Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Инсталиране на azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Добавете хранилище с пакети на Microsoft
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

# Създайте псевдоним за по-лесно използване
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Проверка на инсталацията

След инсталацията проверете дали azd работи правилно:

```bash
# Проверете версията
azd version

# Вижте помощта
azd --help

# Избройте наличните шаблони
azd template list
```

Очакван изход:
```
azd version 1.x.x (commit xxxxxx)
```

**Забележка**: Фактическият номер на версията може да варира. Проверете [Издания на Azure Developer CLI](https://github.com/Azure/azure-dev/releases) за най-новата версия.

**✅ Списък за проверка на успешна инсталация:**
- [ ] `azd version` показва номер на версията без грешки
- [ ] `azd --help` показва документация за командите
- [ ] `azd template list` показва наличните шаблони
- [ ] `az account show` показва вашия Azure абонамент
- [ ] Можете да създадете тестова директория и да изпълните `azd init` успешно

**Ако всички проверки са успешни, сте готови да продължите към [Вашият първи проект](first-project.md)!**

## Настройка на удостоверяването

### Удостоверяване чрез Azure CLI (Препоръчително)
```bash
# Инсталирайте Azure CLI, ако все още не е инсталиран
# Windows: използвайте winget install Microsoft.AzureCLI
# macOS: използвайте brew install azure-cli
# Linux: изпълнете curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Влезте в Azure
az login

# Проверете удостоверяването
az account show
```

### Удостоверяване с код на устройство
Ако сте на безграфична система или имате проблеми с браузъра:
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
Добавете в профила на вашия шел (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Конфигурация на Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Конфигурация на azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Активиране на регистрирането за отстраняване на грешки
```

## Интеграция с IDE

### Visual Studio Code
Инсталирайте разширението Azure Developer CLI:
1. Отворете VS Code
2. Отидете в Разширения (Ctrl+Shift+X)
3. Потърсете "Azure Developer CLI"
4. Инсталирайте разширението

Функции:
- IntelliSense за azure.yaml
- Интегрирани терминални команди
- Преглед на шаблони
- Мониторинг на внедряване

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
3. Използвайте интегрирания терминал за azd команди

## 🐛 Отстраняване на проблеми при инсталация

### Чести проблеми

#### Достъпът е отказан (Windows)
```powershell
# Стартирайте PowerShell като администратор
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

#### Проблеми с мрежата/прокси
```bash
# Конфигуриране на прокси
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Пропуснете проверката на SSL (не се препоръчва в производствена среда)
azd config set http.insecure true
```

#### Конфликти на версиите
```bash
# Премахнете старите инсталации
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Почистете конфигурацията
rm -rf ~/.azd
```

### Как да получите допълнителна помощ
```bash
# Активиране на записване в лог за отстраняване на грешки
export AZD_DEBUG=true
azd <command> --debug

# Преглед на текущата конфигурация
azd config list

# Преглед на текущия статус на разгръщането
azd show
```

## Актуализиране на azd

### Автоматични актуализации
azd ще ви уведомява, когато има налични актуализации:
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

**Azure CLI (az)**: Ниско ниво инструмент за управление на отделни Azure ресурси
- `az webapp create`, `az storage account create`
- Един ресурс наведнъж
- Фокус върху управлението на инфраструктурата

**Azure Developer CLI (azd)**: Високо ниво инструмент за пълни внедрявания на приложения
- `azd up` внедрява цялото приложение с всички ресурси
- Работи на базата на шаблони
- Фокус върху продуктивността на разработчика

**Имате нужда и от двата**: azd използва az CLI за удостоверяване
</details>

<details>
<summary><strong>Мога ли да използвам azd със съществуващи ресурси в Azure?</strong></summary>

Да! Можете:
1. Импортирате съществуващи ресурси в азд среди
2. Реферирате съществуващи ресурси в своите Bicep шаблони
3. Използвате azd за нови внедрявания заедно със съществуващата инфраструктура

Вижте [Ръководство за конфигурация](configuration.md) за подробности.
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
<summary><strong>Мога ли да използвам azd в CI/CD пайплайни?</strong></summary>

Абсолютно! azd е проектиран за автоматизация:
- Интеграция с GitHub Actions
- Поддръжка на Azure DevOps
- Удостоверяване чрез service principal
- Неинтерактивен режим

Вижте [Ръководство за внедряване](../chapter-04-infrastructure/deployment-guide.md) за модели за CI/CD.
</details>

<details>
<summary><strong>Каква е цената за използване на azd?</strong></summary>

azd сам по себе си е **напълно безплатен** и с отворен код. Плащате само за:
- Azure ресурсите, които внедрите
- Разходите за използване на Azure (изчисления, съхранение и т.н.)

Използвайте `azd provision --preview` за да оцените разходите преди внедряване.
</details>

## Следващи стъпки

1. **Завършете удостоверяването**: Уверете се, че имате достъп до вашия Azure абонамент
2. **Опитайте първото си внедряване**: Следвайте [Ръководството за първи проект](first-project.md)
3. **Разгледайте шаблоните**: Прегледайте наличните шаблони с `azd template list`
4. **Конфигурирайте IDE-то си**: Настройте средата си за разработка

## Поддръжка

Ако срещнете проблеми:
- [Официална документация](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Докладване на проблеми](https://github.com/Azure/azure-dev/issues)
- [Обсъждания в общността](https://github.com/Azure/azure-dev/discussions)
- [Поддръжка на Azure](https://azure.microsoft.com/support/)

---

**Навигация в главата:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [AZD Basics](azd-basics.md) 
- **➡️ Следваща**: [Вашият първи проект](first-project.md)
- **🚀 Следваща глава**: [Глава 2: Разработка, ориентирана към AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Инсталацията е завършена!** Продължете към [Вашият първи проект](first-project.md) за да започнете да изграждате с azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния му език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Не носим отговорност за никакви недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Ръководство за инсталиране и конфигуриране

**Навигация в главите:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Основи на AZD](azd-basics.md)
- **➡️ Следваща**: [Вашият първи проект](first-project.md)
- **🚀 Следваща глава**: [Глава 2: Разработка с приоритет AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Въведение

Това подробно ръководство ще ви преведе през инсталирането и конфигурирането на Azure Developer CLI (azd) на вашата система. Ще научите различни методи за инсталиране за различни операционни системи, настройка на автентикация и начална конфигурация, за да подготвите разработващата си среда за внедряване в Azure.

## Учебни цели

В края на този урок ще можете:
- Успешно да инсталирате Azure Developer CLI на вашата операционна система
- Да конфигурирате автентикация с Azure чрез няколко метода
- Да настроите средата си за разработка с необходимите предпоставки
- Да разбирате различните опции за инсталация и кога да използвате всяка от тях
- Да отстранявате често срещани проблеми при инсталация и настройка

## Резултати от обучението

След като завършите този урок, ще можете:
- Да инсталирате azd с подходящия метод за вашата платформа
- Да се автентикирате с Azure чрез azd auth login
- Да проверите инсталацията си и да тествате основните команди на azd
- Да конфигурирате вашата разработваща среда за оптимална употреба на azd
- Самостоятелно да разрешавате често срещани проблеми с инсталацията

Това ръководство ще ви помогне да инсталирате и конфигурирате Azure Developer CLI на вашата система, без значение от операционната система или средата за разработка.

## Предпоставки

Преди да инсталирате azd, уверете се, че имате:
- **Абонамент за Azure** - [Създайте безплатен акаунт](https://azure.microsoft.com/free/)
- **Azure CLI** - За автентикация и управление на ресурси
- **Git** - За клониране на шаблони и контрол на версиите
- **Docker** (по избор) - За контейнеризирани приложения

## Методи на инсталиране

### Windows

#### Опция 1: Windows Package Manager (препоръчително)
```cmd
winget install microsoft.azd
```

#### Опция 2: PowerShell инсталационен скрипт
```powershell
# Полезно, когато winget не е наличен
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Опция 3: Chocolatey
```cmd
choco install azd
```

#### Опция 4: Ръчна инсталация
1. Изтеглете последната версия от [GitHub](https://github.com/Azure/azure-dev/releases)
2. Разархивирайте в `C:\Program Files\azd\`
3. Добавете в системната променлива PATH

### macOS

#### Опция 1: Homebrew (препоръчително)
```bash
brew tap azure/azd
brew install azd
```

#### Опция 2: Инсталационен скрипт
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опция 3: Ръчна инсталация
```bash
# Изтеглете и инсталирайте
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Опция 1: Инсталационен скрипт (препоръчително)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опция 2: Мениджъри на пакети

**Ръчна инсталация от пакети:**
```bash
# Изтеглете най-новия архив за вашата Linux архитектура от:
# https://github.com/Azure/azure-dev/releases
# След това го разархивирайте и добавете бинарния файл azd към вашия PATH.
```

### GitHub Codespaces

Някои среди на Codespaces и dev контейнер вече включват `azd`, но проверете това, а не предполагайте:

```bash
azd version
```

Ако `azd` липсва, инсталирайте го с стандартния скрипт за средата.

### Docker

```bash
# Стартирайте azd в контейнер
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Създайте псевдоним за по-лесна употреба
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Проверка на инсталацията

След инсталацията, проверете дали azd работи правилно:

```bash
# Провери версията
azd version

# Виж помощта
azd --help

# Изброи наличните шаблони
azd template list
```

Очакван резултат:
```
azd version 1.x.x (commit xxxxxx)
```

**Забележка**: Фактическото версииране може да варира. Проверете [релийзите на Azure Developer CLI](https://github.com/Azure/azure-dev/releases) за най-нова версия.

**✅ Контролен списък за успешна инсталация:**
- [ ] `azd version` показва версия без грешки
- [ ] `azd --help` показва документация за команди
- [ ] `azd template list` показва налични шаблони
- [ ] Можете да създадете тестова директория и успешно да изпълните `azd init`

**Ако всички проверки са успешни, сте готови да продължите към [Вашия първи проект](first-project.md)!**

## Настройка на автентикация

### Препоръчителна настройка за начинаещи

За първоначални работни потоци с AZD, влезте с `azd auth login`.

```bash
# Изисква се за команди на AZD като azd up
azd auth login

# Проверете статуса на удостоверяване на AZD
azd auth login --check-status
```

Използвайте влизане с Azure CLI само ако планирате да изпълнявате `az` команди сами по време на курса.

### Автентикация с Azure CLI (по избор)
```bash
# Инсталирайте Azure CLI, ако все още не е инсталиран
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: вижте документацията за инсталиране на Azure CLI за вашата дистрибуция

# Влезте в Azure
az login

# Потвърдете удостоверяването
az account show
```

### Кой метод за влизане да ползвате?

- Използвайте `azd auth login`, ако следвате начинаещия AZD път и основно изпълнявате `azd` команди.
- Използвайте също и `az login`, когато искате да изпълнявате Azure CLI команди като `az account show` или директно да разглеждате ресурси.
- Ако упражнението включва както `azd`, така и `az` команди, изпълнете и двата метода за влизане в началото.

### Влизане чрез код на устройство
Ако използвате система без графичен интерфейс или имате проблеми с браузъра:
```bash
azd auth login --use-device-code
```

### Сервизен принципал (CI/CD)
За автоматизирани среди:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Проверка на пълната конфигурация

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
# Задаване на стандартен абонамент
azd config set defaults.subscription <subscription-id>

# Задаване на стандартно местоположение
azd config set defaults.location eastus2

# Преглед на всички конфигурации
azd config show
```

### Променливи на средата
Добавете във вашия шел профил (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Конфигурация на Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Конфигурация на azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Активиране на отстраняване на грешки в дневника
```

## Интеграция в IDE

### Visual Studio Code
Инсталирайте разширението Azure Developer CLI:
1. Отворете VS Code
2. Отидете на Разширения (Ctrl+Shift+X)
3. Потърсете "Azure Developer CLI"
4. Инсталирайте разширението

Функции:
- IntelliSense за azure.yaml
- Вградени терминал команди
- Разглеждане на шаблони
- Мониторинг на внедрявания

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
1. Инсталирайте плъгина Azure
2. Конфигурирайте Azure креденшъли
3. Използвайте интегрирания терминал за azd команди

## 🐛 Отстраняване на проблеми при инсталацията

### Често срещани проблеми

#### Достъп отказан (Windows)
```powershell
# Стартирайте PowerShell като администратор
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблеми с PATH
Добавете ръчно azd в PATH:

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

# Пропускане на SSL проверка (не се препоръчва за производство)
azd config set http.insecure true
```

#### Конфликти в версиите
```bash
# Премахнете стари инсталации
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: премахнете предишния изпълним файл azd или символичната връзка преди повторна инсталация

# Почистете конфигурацията
rm -rf ~/.azd
```

### Допълнителна помощ
```bash
# Активиране на отстраняване на грешки в логовете
export AZD_DEBUG=true
azd <command> --debug

# Преглед на текущата конфигурация
azd config show

# Преглед на текущия статус на разгръщане
azd show
```

## Актуализиране на azd

### Проверка за актуализация
azd предупреждава, когато е налична нова версия, и можете да проверите настоящата с:
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

**Azure CLI (az)**: Инструмент на ниско ниво за управление на отделни Azure ресурси
- `az webapp create`, `az storage account create`
- Управлява по един ресурс наведнъж
- Фокус върху инфраструктурата

**Azure Developer CLI (azd)**: Инструмент на високо ниво за пълна внедряване на приложения
- `azd up` внедрява цялото приложение с всички ресурси
- Работни потоци на базата на шаблони
- Фокус върху продуктивността на разработчика

**И двата са необходими**: azd използва az CLI за автентикация
</details>

<details>
<summary><strong>Мога ли да използвам azd с вече съществуващи Azure ресурси?</strong></summary>

Да! Можете:
1. Да импортирате съществуващи ресурси в azd среди
2. Да реферирате съществуващи ресурси в Bicep шаблони
3. Да използвате azd за нови внедрявания до вече съществуваща инфраструктура

Вижте [Ръководството за конфигурация](configuration.md) за подробности.
</details>

<details>
<summary><strong>Работи ли azd с Azure Government или Azure China?</strong></summary>

Да, конфигурирайте облака:
```bash
# Azure Правителство
az cloud set --name AzureUSGovernment
az login

# Azure Китай
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Мога ли да използвам azd в CI/CD pipeline-и?</strong></summary>

Абсолютно! azd е проектиран за автоматизация:
- Интеграция с GitHub Actions
- Поддръжка за Azure DevOps
- Автентикация с сервизен принципал
- Безинтерактивен режим

Вижте [Ръководството за внедряване](../chapter-04-infrastructure/deployment-guide.md) за CI/CD модели.
</details>

<details>
<summary><strong>Какви са разходите за използване на azd?</strong></summary>

Самият azd е **напълно безплатен** и с отворен код. Плащате само за:
- Azure ресурсите, които внедрявате
- Консумация на Azure (изчислителни ресурси, сторидж и др.)

Използвайте `azd provision --preview`, за да оцените разходите преди внедряване.
</details>

## Следващи стъпки

1. **Завършете автентикацията**: Уверете се, че имате достъп до абонамента си в Azure
2. **Опитайте първото си внедряване**: Следвайте [Ръководството за първия проект](first-project.md)
3. **Разгледайте шаблоните**: Прегледайте наличните шаблони с `azd template list`
4. **Конфигурирайте IDE**: Настройте средата си за разработка

## Поддръжка

При проблеми:
- [Официална документация](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Докладвайте проблеми](https://github.com/Azure/azure-dev/issues)
- [Обсъждания в общността](https://github.com/Azure/azure-dev/discussions)
- [Поддръжка на Azure](https://azure.microsoft.com/support/)
- [**Умения за Azure Agent**](https://skills.sh/microsoft/github-copilot-for-azure) - Получете указания за Azure команди директно в редактора си с `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация в главите:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Основи на AZD](azd-basics.md)
- **➡️ Следваща**: [Вашият първи проект](first-project.md)
- **🚀 Следваща глава**: [Глава 2: Разработка с приоритет AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Инсталацията е завършена!** Продължете към [Вашия първи проект](first-project.md), за да започнете работа с azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:  
Този документ е преведен с помощта на AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стараем да бъдем точни, моля, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за никакви недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
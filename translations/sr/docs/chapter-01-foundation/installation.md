# Инсталација и упутство за подешавање

**Навигација поглављима:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основе и брзи почетак
- **⬅️ Претходно**: [Основе AZD](azd-basics.md)
- **➡️ Следеће**: [Ваш први пројекат](first-project.md)
- **🚀 Следеће поглавље**: [Поглавље 2: Развој усмерен на АИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Увод

Ова свеобухватна упутства ће вас провести кроз инсталирање и конфигурисање Azure Developer CLI (azd) на вашем систему. Научићете више метода инсталације за различите оперативне системе, подешавање аутентификације и почетну конфигурацију како бисте припремили своје развојно окружење за деплоје на Azure.

## Циљеви учења

До краја ове лекције, бићете у стању да:
- Успешно инсталирате Azure Developer CLI на ваш оперативни систем
- Конфигуришете аутентификацију са Azure користећи више метода
- Поставите развојно окружење са потребним предусловима
- Разумете различите опције инсталације и када користити коју
- Решавате уобичајене проблеме инсталације и подешавања

## Исходи учења

Након завршетка ове лекције, моћи ћете да:
- Инсталирате azd користећи одговарајућу методу за вашу платформу
- Аутентификујете се са Azure користећи azd auth login
- Верификујете вашу инсталацију и тестирате основне azd команде
- Конфигуришете ваше развојно окружење за оптимално коришћење azd
- Самостално решавате уобичајене проблеме инсталације

Овај водич ће вам помоћи да инсталирате и конфигуришете Azure Developer CLI на вашем систему, без обзира на оперативни систем или развојно окружење.

## Предуслови

Пре инсталирања azd, уверите се да имате:
- **Azure претплата** - [Креирајте бесплатан налог](https://azure.microsoft.com/free/)
- **Azure CLI** - За аутентикацију и управљање ресурсима
- **Git** - За клонирање шаблона и контролу верзија
- **Docker** (опционално) - За апликације у контејнерима

## Начини инсталације

### Windows

#### Опција 1: PowerShell (Препоручено)
```powershell
# Покрените као администратор или са повећаним привилегијама
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
```bash
# Преузмите и инсталирајте
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Опција 1: Скрипта за инсталацију (Препоручено)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опција 2: Пакет менаџери

**Ubuntu/Debian:**
```bash
# Додај Microsoft репозиторијум пакета
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Инсталирај azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Додај репозиторијум пакета компаније Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd је већ инсталиран у GitHub Codespaces. Једноставно направите codespace и почните да користите azd одмах.

### Docker

```bash
# Покрените azd у контејнеру
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Креирајте алијас за лакше коришћење
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Потврдите инсталацију

Након инсталације, проверите да ли azd ради исправно:

```bash
# Провери верзију
azd version

# Прикажи помоћ
azd --help

# Прикажи доступне шаблоне
azd template list
```

Очекујани излаз:
```
azd version 1.x.x (commit xxxxxx)
```

**Напомена**: Стварни број верзије може да варира. Погледајте [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) за најновију верзију.

**✅ Контрoлна листа успешне инсталације:**
- [ ] `azd version` приказује број верзије без грешака
- [ ] `azd --help` приказује документацију за команде
- [ ] `azd template list` приказује доступне шаблоне
- [ ] `az account show` приказује вашу Azure претплату
- [ ] Можете да креирате тест директоријум и успешно покренете `azd init`

**Ако сви прегледи прођу, спремни сте да наставите ка [Ваш први пројекат](first-project.md)!**

## Подешавање аутентификације

### Аутентификација преко Azure CLI (Препоручено)
```bash
# Инсталирајте Azure CLI ако већ није инсталиран
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Пријавите се у Azure
az login

# Проверите аутентификацију
az account show
```

### Аутентификација помоћу кода уређаја
Ако сте на безглавом систему или имате проблеме са прегледачем:
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
# Azure конфигурација
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd конфигурација
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Омогући логовање за отклањање грешака
```

## Интеграција са IDE-ом

### Visual Studio Code
Инсталирајте екстензију Azure Developer CLI:
1. Отворите VS Code
2. Идите на Extensions (Ctrl+Shift+X)
3. Потражите "Azure Developer CLI"
4. Инсталирајте екстензију

Функције:
- IntelliSense за azure.yaml
- Интегрисане команде у терминалу
- Преглед шаблона
- Праћење деплоја

### GitHub Codespaces
Направите `.devcontainer/devcontainer.json`:
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
2. Конфигуришите Azure акредитиве
3. Користите интегрисани терминал за azd команде

## 🐛 Решавање проблема при инсталацији

### Уобичајени проблеми

#### Дозвола одбијена (Windows)
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

#### Проблеми са мрежом/прокси-ем
```bash
# Конфигуриши прокси
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Прескочи верификацију SSL-а (није препоручљиво за производно окружење)
azd config set http.insecure true
```

#### Конфликти верзија
```bash
# Уклони старе инсталације
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Очисти конфигурацију
rm -rf ~/.azd
```

### Како добити додатну помоћ
```bash
# Омогући снимање логова за отклањање грешака
export AZD_DEBUG=true
azd <command> --debug

# Прикажи тренутну конфигурацију
azd config list

# Прикажи тренутни статус распоређивања
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
<summary><strong>Која је разлика између azd и az CLI?</strong></summary>

**Azure CLI (az)**: Алат на ниском нивоу за управљање појединачним Azure ресурсима
- `az webapp create`, `az storage account create`
- Један ресурс по једном
- Усмерено на управљање инфраструктуром

**Azure Developer CLI (azd)**: Алат високог нивоа за потпуна деплоја апликација
- `azd up` деплојује целу апликацију са свим ресурсима
- Радни токови засновани на шаблонима
- Фокус на продуктивности програмера

**Потребни су вам оба**: azd користи az CLI за аутентификацију
</details>

<details>
<summary><strong>Могу ли да користим azd са постојећим Azure ресурсима?</strong></summary>

Да! Можете:
1. Импортовати постојеће ресурсе у azd енвиронменте
2. Реферисати постојеће ресурсе у вашим Bicep шаблонима
3. Користити azd за нове деплое заједно са постојећом инфраструктуром

Погледајте [Водич за конфигурацију](configuration.md) за детаље.
</details>

<details>
<summary><strong>Да ли azd ради са Azure Government или Azure China?</strong></summary>

Да, подесите облак:
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
<summary><strong>Могу ли да користим azd у CI/CD пипелинима?</strong></summary>

Апсолутно! azd је дизајниран за аутоматизацију:
- Интеграција са GitHub Actions
- Подршка за Azure DevOps
- Аутентикација сервисним принципалом
- Режим без интеракције

Погледајте [Водич за деплојмент](../chapter-04-infrastructure/deployment-guide.md) за CI/CD шаблоне.
</details>

<details>
<summary><strong>Колики је трошак коришћења azd?</strong></summary>

azd је сам по себи **потпуно бесплатан** и отвореног кода. Плаћате само за:
- Azure ресурсе које деплојујете
- Azure трошкове потрошње (compute, storage, итд.)

Користите `azd provision --preview` да процените трошкове пре деплоја.
</details>

## Следећи кораци

1. **Завршите аутентикацију**: Уверите се да имате приступ вашој Azure претплати
2. **Пробајте ваш први деплој**: Следите [Водич за први пројекат](first-project.md)
3. **Истражите шаблоне**: Прегледајте доступне шаблоне помоћу `azd template list`
4. **Конфигуришите ваш IDE**: Поставите ваше развојно окружење

## Подршка

Ако наиђете на проблеме:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**Навигација поглављима:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основе и брзи почетак
- **⬅️ Претходно**: [Основе AZD](azd-basics.md) 
- **➡️ Следеће**: [Ваш први пројекат](first-project.md)
- **🚀 Следеће поглавље**: [Поглавље 2: Развој усмерен на АИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Инсталација завршена!** Наставите на [Ваш први пројекат](first-project.md) да започнете са изградњом помоћу azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Одрицање одговорности:
Овај документ је преведен помоћу AI сервиса за превођење [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да преводи буду тачни, имајте у виду да аутоматизовани преводи могу садржати грешке или нетачности. Оригинални документ на свом изворном језику треба сматрати коначним и званичним извором. За критичне информације препоручује се професионални превод који обавља људски преводилац. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења настала употребом овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
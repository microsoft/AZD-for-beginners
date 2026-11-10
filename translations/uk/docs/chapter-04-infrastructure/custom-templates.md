# Створення Власного шаблону azd

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD Для Початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 4 - Інфраструктура як Код та Розгортання
- **⬅️ Попередній**: [Керівництво з Розгортання](deployment-guide.md)
- **🚀 Наступний розділ**: [Розділ 5: Багатоагентні Розв'язки](../chapter-05-multi-agent/README.md)

> Переглянуто за `azd 1.37.2` (листопад 2026). Це **покроковий процес створення з частковими файлами**, а не повний шаблон: ви маєте надати код застосунку та `modules/web.bicep` з його середовищем, реєстром, Container App і виводами перед розгортанням. Під час цього перегляду Azure не виконувався.

## Вступ

До цього ви *використовували* шаблони з `azd init --template <name>`. Але коли у вас з’являється структура проекту, яка подобається вашій команді — наприклад, Container App із Cosmos DB і потрібним моніторингом — ви захочете перетворити це на власний багаторазовий шаблон. Шаблон — це просто репозиторій Git зі зрозумілою структурою, який azd знає, як читати. Цей урок покаже, як створити його з нуля, протестувати і (за бажанням) опублікувати у спільнотній галереї.

## Цілі навчання

До кінця цього уроку ви:
- Зрозумієте, що робить папку «шаблоном azd»
- Дізнаєтеся про потрібні файли та структуру папок
- Додасте `azure.yaml` та `infra/`, якими можуть користуватися інші
- Протестуєте шаблон локально перед поширенням
- Опублікуєте його та (за бажанням) подасте в Awesome AZD

## Результати навчання

Після завершення уроку ви зможете:
- Організувати новий репозиторій шаблону
- Параметризувати інфраструктуру так, щоб вона працювала в будь-якій підписці
- Перевірити шаблон за допомогою `azd init` та `azd up`
- Додати метадані, які вимагає спільнотна галерея

---

## Що Таке Шаблон Насправді?

Шаблон azd — це **репозиторій Git**, який містить, як мінімум:

| Файл / папка | Призначення | Обов’язково? |
|---------------|---------|-----------|
| `azure.yaml` | Описує сервіси, хости та провайдера інфраструктури | ✅ Так |
| `infra/` | Визначення провізування Bicep або Terraform | Обов’язково для цього прикладу IaC з явним визначенням; проекти з генерованою інфраструктурою можуть пропускати |
| `src/` (або ваш код) | Код застосунку, який azd розгортає | Обов’язково для сервісів з вихідним кодом; не всі шаблони містять код застосунку |
| `README.md` | Як користуватися шаблоном | ✅ Наполегливо рекомендовано |
| `.azdo/` або `.github/` | Визначення CI/CD pipeline | Опціонально |
| `.devcontainer/` | Відтворюване середовище розробки | Опціонально |
| `azure.yaml` `metadata` | Ідентифікація/телеметрія шаблону | Рекомендовано; публікація репозиторію Git не вимагає цього |

Тут немає нічого магічного: коли ви запускаєте `azd init --template you/your-repo`, azd клонює репозиторій і читає `azure.yaml`.

---

## Крок 1: Організуйте Репозиторій

Створіть структуру папок вручну або почніть з мінімального шаблону та відредагуйте його:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Типовий завершений вигляд виглядає так:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## Крок 2: Напишіть `azure.yaml`

Це серце шаблону. Воно каже azd, що і як розгортати:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Поле `metadata.template` використовується телеметрією галереї для підрахунку використання. Використовуйте конвенцію `name@version`.

---

## Крок 3: Параметризуйте Інфраструктуру

Найважливіше правило для *багаторазового* шаблону: **ніколи не прописуйте жорстко імена, регіони або значення, специфічні для підписки.** Використовуйте параметри та шаблон resource token, щоб той самий шаблон працював у будь-якій підписці.

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Дві речі роблять цей шаблон дружнім до повторного використання:

1. **`azd-env-name` тег** — azd використовує його, щоб відстежувати та прибирати ресурси за середовищами.
2. **`uniqueString(...)` ресурсний токен** — створює стабільний хеш-префікс для зменшення колізій; це не гарантія глобальної унікальності.

Відсутній `modules/web.bicep` має приймати `name`, `location` і `tags`, провізувати середовище/реєстр Container Apps і застосунок, позначати застосунок тегом `azd-service-name: web` і експортувати `uri`. Він також має відкривати значення реєстру, потрібні для обраного процесу збірки/розгортання (наприклад, `AZURE_CONTAINER_REGISTRY_ENDPOINT` з кореневого модуля). Один вивід endpoint не забезпечує відкриття сервісного дискавері, налаштувань застосунку або аутентифікації реєстру.

Надайте відповідний параметричний файл, який зчитує значення, які azd вводить з середовища:

Збережіть наступне як `infra/main.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd автоматично підставляє `${AZURE_ENV_NAME}` і `${AZURE_LOCATION}` зі поточного середовища.

---

## Крок 4: Протестуйте Шаблон Локально

Перед поширенням переконайтеся, що шаблон працює з чистого стану.

**Тестуйте з локальної папки** (Git push не потрібен):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Потім протестуйте видалення** — хороший шаблон повністю очищує ресурси:

```bash
azd down --force --purge
```

Якщо `azd down` залишає ресурси, перевірте виявлення середовища/групи ресурсів, зовнішні/спільні ресурси, права доступу, блокування і захист від очищення. `--purge` не видаляє локальний стан `.azure/`.

> **Порада:** після додавання всіх відсутніх файлів спочатку запустіть `azd provision --preview`. Перевіряйте хуки перед попереднім переглядом, бо вони можуть виконувати команди з побічними ефектами. Попередній перегляд не є оцінкою вартості або гарантією успіху провізування.

---

## Крок 5: Опублікуйте Шаблон

Завантажте репозиторій в GitHub (публічний, якщо хочете, щоб інші його використовували):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Тепер ним може користуватися будь-хто:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Крок 6 (опційно): Подайте до Awesome AZD

Галерея [Awesome AZD gallery](https://azure.github.io/awesome-azd/) містить шаблони спільноти. Щоб бути включеним до списку, ваш репозиторій має містити:

- ✅ Чіткий `README.md` з попередніми вимогами, схемою архітектури та нотатками щодо вартості
- ✅ Робочий `azure.yaml` з `metadata.template`
- ✅ Інфраструктуру, що чисто розгортається у новій підписці
- ✅ Файл `LICENSE`
- ✅ (Рекомендовано) `.devcontainer/` для однонатискного запуску Codespaces

Подайте шляхом відкриття pull request, який додає ваш шаблон до файлу даних галереї, з дотриманням посібника з внеску у репозиторії [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Поширені помилки

| Помилка | Виправлення |
|---------|-----|
| Жорстко закодовані імена ресурсів | Використовуйте `uniqueString()` токен ресурсу |
| `azd down` залишає ресурси | Позначайте кожен ресурс (або групу ресурсів) тегом `azd-env-name` |
| Шаблон працює у вас, але не працює у інших | Видаліть ID підписок, ID орендарів та припущення про регіони |
| Виводи не підключені до додатку | Узгодьте `azd-service-name`/`resourceName` для розгортання і явно зв’яжіть виводи з налаштуваннями додатку |
| Відхилено подання в галерею | Додайте `README.md`, `LICENSE` та `metadata.template` |

---

## Підсумок

- Шаблон — це просто Git-репозиторій з `azure.yaml`, `infra/` і вашим кодом.
- Параметризуйте все — імена, регіони, ID — щоб він працював де завгодно.
- Завжди позначайте ресурси тегом `azd-env-name`, щоб `azd down` працював.
- Тестуйте локально з `azd init --template <local-path>` перед публікацією.
- Додайте метадані і README для подання в Awesome AZD.

---

## 🔗 Навігація

| Напрям | Ресурс |
|-----------|----------|
| **Попередній** | [Deployment Guide](deployment-guide.md) |
| **Домашня сторінка розділу** | [Chapter 4: Infrastructure as Code](README.md) |
| **Наступний розділ** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 Пов’язані ресурси

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Офіційна документація з шаблонів azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
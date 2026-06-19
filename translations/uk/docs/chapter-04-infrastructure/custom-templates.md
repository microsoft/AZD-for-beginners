# Створення власного шаблону azd

**Навігація по розділах:**
- **📚 Головна курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 4 - Інфраструктура як код і розгортання
- **⬅️ Попередній**: [Керівництво з розгортання](deployment-guide.md)
- **🚀 Наступний розділ**: [Розділ 5: Рішення з багатьма агентами](../chapter-05-multi-agent/README.md)

> Перевірено з `azd 1.25.6` у червні 2026 року.

## Вступ

Досі ви *споживали* шаблони за допомогою `azd init --template <name>`. Але коли у вас є структура проєкту, яка подобається вашій команді — наприклад, Container App з Cosmos DB і належним моніторингом — ви захочете перетворити її на повторно використовуваний шаблон. Шаблон — це просто Git-репозиторій із передбачуваною структурою, яку azd вміє читати. У цьому уроці показано, як створити такий шаблон з нуля, протестувати його та (за бажанням) опублікувати в галереї спільноти.

## Цілі навчання

До кінця цього уроку ви:
- Зрозумієте, що робить папку «шаблоном azd»
- Знатимете необхідні файли та структуру папок
- Додасте `azure.yaml` та `infra/`, які інші зможуть повторно використовувати
- Протестуєте свій шаблон локально перед тим, як ділитися
- Опублікуєте його та (за бажанням) надішлете до Awesome AZD

## Результати навчання

Після виконання цього уроку ви зможете:
- Згенерувати каркас нового репозиторію зі шаблоном
- Параметризувати інфраструктуру так, щоб вона працювала в будь-якій підписці
- Перевіряти шаблон за допомогою `azd init` та `azd up`
- Додати метадані, які вимагає галерея спільноти

---

## Що таке шаблон насправді?

Шаблон azd — це **Git-репозиторій**, який містить, принаймні:

| Файл / папка | Призначення | Обов'язково? |
|---------------|---------|-----------|
| `azure.yaml` | Описує сервіси, хости та провайдера інфраструктури | ✅ Так |
| `infra/` | Bicep, Terraform або Pulumi, які створюють ресурси | ✅ Так |
| `src/` (або ваш код) | Код застосунку, який розгортає azd | ✅ Так |
| `README.md` | Як користуватися шаблоном | ✅ Наполегливо рекомендовано |
| `.azdo/` або `.github/` | Визначення конвеєрів CI/CD | Необов'язково |
| `.devcontainer/` | Відтворюване середовище розробки | Необов'язково |
| `azure.yaml` `metadata` | Інформація для галереї та телеметрії | Необов'язково (потрібно для публікації) |

Тут немає нічого містичного: коли ви запускаєте `azd init --template you/your-repo`, azd клонуватиме репозиторій і читає `azure.yaml`.

---

## Крок 1: Створіть каркас репозиторію

Створіть структуру папок вручну або почніть з мінімального шаблону та відредагуйте його:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Створити стандартний макет
mkdir -p src infra
```

Типова остаточна структура виглядає так:

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

Це серце шаблону. Воно каже azd, що розгортати і як:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Поле `metadata.template` використовується телеметрією галереї для підрахунку використань. Використовуйте формат `name@version`.

---

## Крок 3: Параметризуйте інфраструктуру

Найважливіше правило для *повторно використовуваного* шаблону: **ніколи не хардкодьте імена, регіони або значення, специфічні для підписки.** Використовуйте параметри та шаблон токенів ресурсів, щоб один і той же шаблон працював у будь-якій підписці.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Дві речі роблять шаблон дружнім до повторного використання:

1. **`azd-env-name` тег** — azd використовує його для відстеження та очищення ресурсів для кожного середовища.
2. **`uniqueString(...)` resource token** — генерує стабільний, глобально унікальний суфікс, щоб імена не конфліктували.

Надайте відповідний файл параметрів, який читає значення, які azd підставляє з середовища:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd замінює `${AZURE_ENV_NAME}` та `${AZURE_LOCATION}` з поточного середовища автоматично.

---

## Крок 4: Протестуйте шаблон локально

Перед тим як ділитися, доведіть, що шаблон працює з чистого стану.

**Тестування з локальної папки** (не потрібно пушити в Git):

```bash
# Ініціалізуйте з порожньої директорії, використовуючи шлях до вашого локального шаблону
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Забезпечення та розгортання від початку до кінця
azd auth login
azd up
```

**Потім перевірте видалення** — хороший шаблон повністю очищує ресурси:

```bash
azd down --force --purge
```

Якщо `azd down` залишає ресурси, ймовірно, ви пропустили тег `azd-env-name` на якомусь ресурсі.

> **Порада:** спочатку запустіть `azd provision --preview`. Він виконує what-if і виявляє помилки шаблону до створення ресурсів.

---

## Крок 5: Опублікуйте шаблон

Запуште репозиторій на GitHub (публічно, якщо хочете, щоб інші могли ним користуватися):

```bash
gh repo create my-azd-template --public --source=. --push
```

Тепер будь-хто може його використовувати:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Крок 6 (необов'язково): Надішліть до Awesome AZD

[Галерея Awesome AZD](https://azure.github.io/awesome-azd/) перелічує шаблони спільноти. Щоб бути у списку, ваш репозиторій повинен містити:

- ✅ Чіткий `README.md` з передумовами, діаграмою архітектури та нотатками про витрати
- ✅ Робочий `azure.yaml` з `metadata.template`
- ✅ Інфраструктура, яка створюється без проблем у новій підписці
- ✅ Файл `LICENSE`
- ✅ (Рекомендовано) `.devcontainer/` для запуску в Codespaces в один клік

Надішліть, відкривши pull request, який додає ваш шаблон до файлу даних галереї, дотримуючись інструкцій щодо внеску в [репозиторій Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Поширені помилки

| Проблема | Виправлення |
|---------|-----|
| Жорстко задані імена ресурсів | Використовуйте токен ресурсу `uniqueString()` |
| `azd down` залишає ресурси | Позначте кожен ресурс (або групу ресурсів) тегом `azd-env-name` |
| Шаблон працює у вас, але не у інших | Видаліть IDs підписки, tenant IDs і припущення щодо регіонів |
| Виводи не підключені до застосунку | Експортуйте `SERVICE_<NAME>_ENDPOINT_URL` та інші виходи `AZURE_*` |
| Подання до галереї відхилено | Додайте `README.md`, `LICENSE` та `metadata.template` |

---

## Підсумок

- Шаблон — це просто Git-репозиторій з `azure.yaml`, `infra/` та вашим кодом.
- Параметризуйте все — імена, регіони та ідентифікатори — щоб воно працювало будь-де.
- Завжди позначайте ресурси тегом `azd-env-name`, щоб `azd down` працював.
- Тестуйте локально з `azd init --template <local-path>` перед публікацією.
- Додайте метадані та README, щоб подати до Awesome AZD.

---

## 🔗 Навігація

| Напрямок | Ресурс |
|-----------|----------|
| **Попередній** | [Керівництво з розгортання](deployment-guide.md) |
| **Головна розділу** | [Розділ 4: Інфраструктура як код](README.md) |
| **Наступний розділ** | [Розділ 5: Рішення з багатьма агентами](../chapter-05-multi-agent/README.md) |

## 📖 Пов'язані ресурси

- [Розгортання ресурсів](provisioning.md)
- [Галерея Awesome AZD](https://azure.github.io/awesome-azd/)
- [Офіційна документація з шаблонів azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
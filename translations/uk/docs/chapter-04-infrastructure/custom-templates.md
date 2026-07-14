# Створення Власного Шаблону azd

**Навігація по Розділу:**
- **📚 Домашня сторінка курсу**: [AZD Для Початківців](../../README.md)
- **📖 Поточний Розділ**: Розділ 4 - Інфраструктура як Код і Розгортання
- **⬅️ Попередній**: [Посібник з Розгортання](deployment-guide.md)
- **🚀 Наступний Розділ**: [Розділ 5: Багатоагентні Рішення](../chapter-05-multi-agent/README.md)

> Перевірено за версією `azd 1.27.1` у липні 2026.

## Вступ

Дотепер ви *використовували* шаблони за допомогою `azd init --template <name>`. Але як тільки у вас з’явиться структура проекту, яка подобається вашій команді — наприклад, контейнерний додаток з Cosmos DB і правильним моніторингом — ви захочете перетворити його на власний багаторазовий шаблон. Шаблон — це просто репозиторій Git із передбачуваною структурою, яку azd вміє читати. Цей урок показує, як створити його з нуля, протестувати і (за бажанням) опублікувати у спільноті.

## Навчальні Цілі

Наприкінці цього уроку ви:
- Зрозумієте, що робить папку «шаблоном azd»
- Дізнаєтесь необхідні файли та структуру папок
- Додасте `azure.yaml` та `infra/`, які можуть використовувати інші
- Протестуєте свій шаблон локально перед спільним використанням
- Опублікуєте його і (за бажанням) надішлете в Awesome AZD

## Очікувані Результати Навчання

Після виконання уроку ви зможете:
- Створити новий репозиторій шаблону
- Параметризувати інфраструктуру для роботи в будь-якій підписці
- Перевірити шаблон за допомогою `azd init` та `azd up`
- Додати метадані, необхідні для галереї спільноти

---

## Що ТАКЕ Шаблон Насправді?

Шаблон azd — це **репозиторій Git**, який містить мінімум:

| Файл / папка | Призначення | Обов’язковий? |
|---------------|---------|-----------|
| `azure.yaml` | Описує сервіси, хости та провайдера інфраструктури | ✅ Так |
| `infra/` | Bicep, Terraform або Pulumi для створення ресурсів | ✅ Так |
| `src/` (або ваш код) | Код додатку, який розгортає azd | ✅ Так |
| `README.md` | Як користуватися шаблоном | ✅ Рекомендується дуже |
| `.azdo/` або `.github/` | Визначення CI/CD пайплайнів | Необов’язково |
| `.devcontainer/` | Відтворюване середовище розробки | Необов’язково |
| `azure.yaml` `metadata` | Галерея + інформація телеметрії | Необов’язково (обов’язково для публікації) |

Тут немає нічого магічного: коли ви запускаєте `azd init --template you/your-repo`, azd клонує репозиторій і читає `azure.yaml`.

---

## Крок 1: Створіть Структуру Репозиторію

Створіть структуру папок вручну або почніть з мінімального шаблону і відредагуйте його:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Створити стандартний макет
mkdir -p src infra
```

Типова готова структура виглядає так:

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

Це серце шаблону. Він каже azd, що розгортати і як:

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

> Поле `metadata.template` використовується телеметрією галереї для підрахунку використання. Використовуйте конвенцію `name@version`.

---

## Крок 3: Параметризуйте Інфраструктуру

Найголовніше правило для *багаторазового* шаблону: **ніколи не хардкодьте імена, регіони або значення, специфічні для підписки.** Використовуйте параметри і патерн resource token, щоб один і той самий шаблон працював у будь-чиїй підписці.

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

Дві речі роблять цей шаблон дружнім:

1. **Тег `azd-env-name`** — azd використовує його, щоб відстежувати та очищати ресурси по середовищах.
2. **Токен ресурсу `uniqueString(...)`** — створює стабільний, унікальний у глобальному масштабі суфікс, щоб імена не конфліктували.

Забезпечте відповідний файл параметрів, який читає значення, які azd автоматично підставляє зі середовища:

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

azd підставляє `${AZURE_ENV_NAME}` і `${AZURE_LOCATION}` з поточного середовища автоматично.

---

## Крок 4: Тестуйте Свій Шаблон Локально

Перед спільним використанням доведіть, що шаблон працює зі свіжого стану.

**Тестуйте з локальної папки** (пуш до Git не потрібен):

```bash
# З порожньої директорії ініціалізувати, використовуючи шлях до вашого локального шаблону
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Забезпечити + розгорнути від початку до кінця
azd auth login
azd up
```

**Потім протестуйте видалення** — хороший шаблон очищає повністю:

```bash
azd down --force --purge
```

Якщо `azd down` залишає ресурси, ви, ймовірно, забули тег `azd-env-name` на ресурсі.

> **Порада:** спочатку виконайте `azd provision --preview`. Це виконує перевірку what-if і показує помилки шаблону до створення ресурсів.

---

## Крок 5: Опублікуйте Шаблон

Запуште репозиторій на GitHub (публічно, якщо хочете, щоб інші використовували):

```bash
gh repo create my-azd-template --public --source=. --push
```

Тепер кожен може ним користуватись:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Крок 6 (за бажанням): Надішліть у Awesome AZD

Галерея [Awesome AZD](https://azure.github.io/awesome-azd/) містить шаблони спільноти. Щоб бути у списку, ваш репозиторій має містити:

- ✅ Чіткий `README.md` з вимогами, діаграмою архітектури та нотатками по вартості
- ✅ Робочий `azure.yaml` з `metadata.template`
- ✅ Інфраструктуру, яка чисто розгортається у свіжій підписці
- ✅ Файл `LICENSE`
- ✅ (Рекомендовано) `.devcontainer/` для одного кліку у Codespaces

Надішліть, відкривши pull request, який додає ваш шаблон у файл даних галереї, дотримуючись інструкцій внеску у репозиторії [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Поширені Помилки

| Помилка | Виправлення |
|---------|-----|
| Хардкодені імена ресурсів | Використовуйте токен ресурсу `uniqueString()` |
| `azd down` залишає ресурси | Тегуйте кожен ресурс (або групу ресурсів) тегом `azd-env-name` |
| Шаблон працює у вас, але не у інших | Видаліть ID підписки, ID орендаря та припущення про регіони |
| Виводи не підключені до додатку | Експортуйте `SERVICE_<NAME>_ENDPOINT_URL` та інші виводи `AZURE_*` |
| Відхилено подання в галерею | Додайте `README.md`, `LICENSE` та `metadata.template` |

---

## Підсумок

- Шаблон — це просто Git репозиторій із `azure.yaml`, `infra/` і вашим кодом.
- Параметризуйте все — імена, регіони, та ID — щоб працювало де завгодно.
- Завжди тегуйте ресурси тегом `azd-env-name`, щоб працювала команда `azd down`.
- Тестуйте локально командою `azd init --template <local-path>`, перш ніж публікувати.
- Додайте метадані та README для подання в Awesome AZD.

---

## 🔗 Навігація

| Напрямок | Ресурс |
|-----------|----------|
| **Попередній** | [Посібник з розгортання](deployment-guide.md) |
| **Домашня сторінка розділу** | [Розділ 4: Інфраструктура як Код](README.md) |
| **Наступний розділ** | [Розділ 5: Багатоагентні Рішення](../chapter-05-multi-agent/README.md) |

## 📖 Пов’язані Ресурси

- [Надання ресурсів](provisioning.md)
- [Галерея Awesome AZD](https://azure.github.io/awesome-azd/)
- [Офіційна документація шаблонів azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
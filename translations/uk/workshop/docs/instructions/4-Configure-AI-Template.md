# 4. Налаштування шаблону

!!! tip "У КІНЦІ ЦЬОГО МОДУЛЮ ВИ ЗМОЖЕТЕ"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Почніть з фактичного шаблону

Відкрийте [`azure.yaml` у розділі Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) у репозиторії, який ви ініціалізували. Вихідний шаблон може змінюватися незалежно від цього майстер-класу. Наступний **витяг** перевірено 4 листопада 2026 року; він не є заміною повного файлу:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` ідентифікує проект AZD; `metadata.template` записує версію шаблону.
- `requiredVersions.azd` — це мінімум шаблону, а не рекомендація залишатися на старому CLI. Використовуйте актуальну підтримувану версію AZD.
- `services` визначає цілі розгортання програми. Цей шаблон розгортає свій Python API і фронтенд як одну службу Container Apps.
- `project` відноситься до `azure.yaml`.
- `remoteBuild` запитує віддалене побудування контейнера. Ваша особистість все ще потребує необхідних дозволів Azure.

Файли Bicep шаблону під `infra/`, а не тільки список `services`, оголошують ресурси, такі як Microsoft Foundry, розгортання моделей, сховище та необов’язковий AI Search.

## 2. Розуміння lifecycle hooks

Перегляньте розділ `hooks` та пов’язані скрипти перед запуском шаблону. Перевірена версія містить:

| Хук | Призначення | Важлива поведінка |
|------|---------|--------------------|
| `preup` | Перевірка вхідних даних середовища шаблону перед потоком робіт `up` | Платформенно-специфічні shell-скрипти можуть зупинити потік робіт у разі помилки |
| `postdeploy` | Запуск специфічного для шаблону налаштування після розгортання застосунку | Перевірте `continueOnError` та вивід скрипта; успішне розгортання не гарантує успіх кожного завдання налаштування |

Ця версія **не містить** старіший хук `postprovision` / `write_env`, показаний у попередніх матеріалах майстер-класу. Не копіюйте посилання на хуки у скрипти, які більше не існують.

Ключі хуків вибирають події життєвого циклу; `posix` і `windows` вибирають реалізації для платформи. `shell`, `run`, `interactive` та `continueOnError` контролюють виконання. Це виконувані скрипти з вашими правами, тому переглядайте їх так само ретельно, як і код застосунку.

Дивіться повний життєвий цикл у [документації хуків AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility).

## 3. Відстеження вхідних даних середовища у інфраструктуру

Виконайте ці команди в ініціалізованому репозиторії з прикладом:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Перегляньте `infra/main.parameters.json`, щоб побачити, які змінні середовища шаблон фактично використовує. Встановлення довільної назви через `azd env set` не змінює автоматично ресурс Azure.

Перевірені значення за замовчуванням включають:

| Вхідні дані | Значення за замовчуванням / призначення |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; кількість квот залежить від моделі та типу розгортання |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; залишайте відключеним, поки не буде переглянуто обробку даних |

Це специфічні для прикладу вхідні дані, а не глобальні налаштування AZD. Перевірте [документацію підтримки моделей і регіонів](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) та квоту вашої підписки перед вибором моделі, SKU, потужності чи місця розташування. Не тлумачте кожну одиницю потужності як 1 000 токенів на хвилину.

Щоб вибрати іншу модель чату, оновіть сумісні **назву, версію, формат, SKU та потужність разом**, дотримуючись [керівництва зі зміни прикладу](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Зміна лише назви може залишити несумісну версію або тип розгортання.

## 4. Лабораторна робота: увімкнення необов’язкового пошуку та трасування

!!! warning "Ці налаштування можуть додати платні ресурси"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

Зміни у інфраструктурі потребують провізіонінгу; лише `azd deploy` розгортає службові застосунки. Для індексації пошуку й підтримуваних опцій вилучення виконуйте [керівництво AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Для моніторингу виконуйте [керівництво з спостережуваності](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Не вмикайте захоплення контенту запитів/відповідей на реальних даних клієнтів без необхідної згоди, контролю доступу, політики зберігання й редагування.

## 5. Існуючі ресурси та CI/CD

Щоб повторно використати проект Foundry, дотримуйтесь [інструкцій щодо існуючих ресурсів](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) у прикладі. Встановлення `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` змінює шлях розгортання; у такому випадку шаблон не створює Application Insights або AI Search для вас. Явно перевіряйте залежності, призначення ролей і розгортання моделей.

Розділ `pipeline.variables` керує значеннями, які передаються у згенерований пайплайн; він не є сховищем секретів і не створює ресурси Azure. Віддавайте перевагу керованим ідентичностям у застосунку та OIDC для CI/CD. Файли середовища AZD — це простий текст, і їх не слід комітити.

AZD підтримує імпорт довірених локально підготовлених dotenv файлів:

```bash
azd env set --file .env
```

Перегляньте цей файл перед імпортом і не виводьте файли середовища, що містять секрети, у спільні термінали або логи CI.

## 6. Перевірте своє розуміння

- Яка служба `azure.yaml` розгортає застосунок?
- Який параметр інфраструктури використовує кожне змінене вами значення?
- Які зміни потребують провізіонінгу, а не лише розгортання?
- Чи підтримували обрана область і підписка модель і квоту?
- Чи всі хуки налаштування спрацювали успішно, і чи ви можете підтвердити поведінку розгорнутого застосунку?

Продовжуйте до [Налаштування шаблону](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
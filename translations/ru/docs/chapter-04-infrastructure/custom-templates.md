# Создание собственного шаблона azd

**Chapter Navigation:**
- **📚 Главная страница курса**: [AZD For Beginners](../../README.md)
- **📖 Текущая глава**: Глава 4 - Инфраструктура как код & Развертывание
- **⬅️ Предыдущая**: [Руководство по развертыванию](deployment-guide.md)
- **🚀 Следующая глава**: [Глава 5: Многоагентные решения](../chapter-05-multi-agent/README.md)

> Проверено с помощью `azd 1.25.6` в июне 2026 г.

## Введение

До сих пор вы *использовали* шаблоны с помощью `azd init --template <name>`. Но как только у вас появится структура проекта, которая нравится вашей команде — скажем, Container App с Cosmos DB и настроенным мониторингом — вы захотите превратить её в собственный повторно используемый шаблон. Шаблон — это просто репозиторий Git с предсказуемой структурой, которую azd умеет читать. В этом уроке показано, как создать такой шаблон с нуля, протестировать его и (при желании) опубликовать в галерее сообщества.

## Цели обучения

К концу этого урока вы:
- Поймёте, что делает папку «шаблоном azd»
- Узнаете необходимые файлы и структуру папок
- Добавите `azure.yaml` и `infra/`, которые смогут переиспользовать другие
- Протестируете шаблон локально перед распространением
- Опубликуете его и (по желанию) отправите в Awesome AZD

## Результаты обучения

После прохождения этого урока вы сможете:
- Создавать каркас нового репозитория шаблона
- Параметризовать инфраструктуру так, чтобы она работала в любой подписке
- Проверять шаблон с помощью `azd init` и `azd up`
- Добавлять метаданные, требуемые галереей сообщества

---

## Что такое шаблон, на самом деле?

Шаблон azd — это **репозиторий Git**, который содержит, как минимум:

| Файл / папка | Назначение | Обязательно? |
|---------------|---------|-----------|
| `azure.yaml` | Описывает сервисы, хосты и провайдера инфраструктуры | ✅ Да |
| `infra/` | Bicep, Terraform или Pulumi, которые создают ресурсы | ✅ Да |
| `src/` (or your code) | Код приложения, который azd разворачивает | ✅ Да |
| `README.md` | Как использовать шаблон | ✅ Настоятельно рекомендуется |
| `.azdo/` or `.github/` | Определения конвейеров CI/CD | Необязательно |
| `.devcontainer/` | Воспроизводимая среда разработки | Необязательно |
| `azure.yaml` `metadata` | Информация для галереи и телеметрии | Необязательно (требуется для публикации) |

Здесь нет никакой магии: когда вы запускаете `azd init --template you/your-repo`, azd клонирует репозиторий и читает `azure.yaml`.

---

## Шаг 1: Создание каркаса репозитория

Создайте структуру папок вручную или начните с минимального шаблона и отредактируйте его:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Создать стандартный макет
mkdir -p src infra
```

Типичная готовая структура выглядит так:

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

## Шаг 2: Напишите `azure.yaml`

Это сердце шаблона. Он сообщает azd, что развертывать и как:

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

> Поле `metadata.template` — это то, что использует телеметрия галереи для подсчёта использования. Используйте соглашение `name@version`.

---

## Шаг 3: Параметризация инфраструктуры

Самое важное правило для *повторно используемого* шаблона: **никогда не хардкодьте имена, регионы или значения, специфичные для подписки.** Используйте параметры и паттерн токена ресурса, чтобы один и тот же шаблон работал в любой подписке.

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

Две вещи делают шаблон удобным для повторного использования:

1. **Тег `azd-env-name`** — azd использует его для отслеживания и очистки ресурсов по окружениям.
2. **Токен ресурса `uniqueString(...)`** — генерирует стабильный, глобально-уникальный суффикс, чтобы имена не конфликтовали.

Предоставьте соответствующий файл параметров, который читает значения, которые azd вставляет из окружения:

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

azd автоматически подставляет `${AZURE_ENV_NAME}` и `${AZURE_LOCATION}` из текущего окружения.

---

## Шаг 4: Протестируйте шаблон локально

Перед распространением убедитесь, что шаблон работает с чистого состояния.

**Тестируйте из локальной папки** (отправка в Git не требуется):

```bash
# Из пустой директории инициализируйте, используя путь к локальному шаблону
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Предоставление ресурсов и развертывание от начала до конца
azd auth login
azd up
```

**Затем протестируйте удаление ресурсов** — хороший шаблон полностью очищается:

```bash
azd down --force --purge
```

Если `azd down` оставляет ресурсы, скорее всего, вы пропустили тег `azd-env-name` на ресурсе.

> **Совет:** сначала выполните `azd provision --preview`. Он выполняет what-if и выявляет ошибки шаблона до создания каких-либо ресурсов.

---

## Шаг 5: Опубликуйте шаблон

Запушьте репозиторий в GitHub (публично, если хотите, чтобы другие могли его использовать):

```bash
gh repo create my-azd-template --public --source=. --push
```

Теперь любой может использовать его:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Шаг 6 (по желанию): Отправка в Awesome AZD

Галерея [Awesome AZD](https://azure.github.io/awesome-azd/) содержит шаблоны сообщества. Чтобы быть в списке, ваш репозиторий должен включать:

- ✅ Понятный `README.md` с требованиями, диаграммой архитектуры и примечаниями по стоимости
- ✅ Рабочий `azure.yaml` с `metadata.template`
- ✅ Инфраструктуру, которая развертывается корректно в новой подписке
- ✅ Файл `LICENSE`
- ✅ (Рекомендуется) `.devcontainer/` для однокликового запуска в Codespaces

Отправьте, открыв pull request, который добавляет ваш шаблон в файл данных галереи, следуя руководству по внесению вкладов в репозитории [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Частые ошибки

| Ошибка | Решение |
|---------|-----|
| Жёстко заданные имена ресурсов | Используйте токен ресурса `uniqueString()` |
| `azd down` оставляет ресурсы | Пометьте каждый ресурс (или группу ресурсов) тегом `azd-env-name` |
| Шаблон работает у вас, но не у других | Удалите идентификаторы подписки, идентификаторы тенанта и предположения о регионе |
| Выходные значения не подключены к приложению | Экспортируйте `SERVICE_<NAME>_ENDPOINT_URL` и другие выходы `AZURE_*` |
| Отказ в отправке в галерею | Добавьте `README.md`, `LICENSE` и `metadata.template` |

---

## Резюме

- Шаблон — это обычный репозиторий Git с `azure.yaml`, `infra/` и вашим кодом.
- Параметризуйте всё — имена, регионы и идентификаторы — чтобы он работал везде.
- Всегда помечайте ресурсы тегом `azd-env-name`, чтобы `azd down` корректно удалял их.
- Тестируйте локально с помощью `azd init --template <local-path>` перед публикацией.
- Добавьте метаданные и README, чтобы отправить в Awesome AZD.

---

## 🔗 Навигация

| Направление | Ресурс |
|-----------|----------|
| **Предыдущая** | [Руководство по развертыванию](deployment-guide.md) |
| **Главная главы** | [Глава 4: Инфраструктура как код](README.md) |
| **Следующая глава** | [Глава 5: Многоагентные решения](../chapter-05-multi-agent/README.md) |

## 📖 Связанные ресурсы

- [Развёртывание ресурсов](provisioning.md)
- [Галерея Awesome AZD](https://azure.github.io/awesome-azd/)
- [Официальная документация по шаблонам azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
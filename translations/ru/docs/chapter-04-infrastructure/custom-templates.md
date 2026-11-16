# Создание собственного шаблона azd

**Навигация по главам:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 4 - Инфраструктура как код и развертывание
- **⬅️ Предыдущая**: [Руководство по развертыванию](deployment-guide.md)
- **🚀 Следующая глава**: [Глава 5: Многоагентные решения](../chapter-05-multi-agent/README.md)

> Проверено согласно `azd 1.37.2` (ноябрь 2026). Это **пошаговое создание с частичными файлами**, а не полный шаблон: вы должны предоставить код приложения и `modules/web.bicep` с его средой, реестром, контейнерным приложением и выводами перед развертыванием. В этом обзоре развертывание Azure не выполнялось.

## Введение

До этого вы *использовали* шаблоны с `azd init --template <name>`. Но как только у вас появляется проект с компоновкой, которая нравится вашей команде — например, контейнерное приложение с Cosmos DB и правильным мониторингом — вы захотите превратить его в собственный переиспользуемый шаблон. Шаблон — это просто репозиторий Git с предсказуемой структурой, которую azd умеет читать. В этом уроке показано, как создать его с нуля, протестировать и (опционально) опубликовать в сообществе.

## Цели обучения

К концу этого урока вы:
- Поймете, что делает папку «шаблоном azd»
- Узнаете обязательные файлы и структуру папок
- Добавите `azure.yaml` и `infra/`, которые смогут использовать другие
- Протестируете шаблон локально перед публикацией
- Опубликуете его и (опционально) отправите в коллекцию Awesome AZD

## Результаты обучения

После выполнения урока вы сможете:
- Создать новый шаблонный репозиторий
- Параметризовать инфраструктуру так, чтобы она работала в любой подписке
- Проверить шаблон с помощью `azd init` и `azd up`
- Добавить метаданные, необходимые для галереи сообщества

---

## Что такое шаблон на самом деле?

Шаблон azd — это **репозиторий Git**, который содержит, как минимум:

| Файл / папка | Назначение | Обязательно? |
|---------------|---------|-----------|
| `azure.yaml` | Описывает сервисы, хосты и провайдера инфраструктуры | ✅ Да |
| `infra/` | Определения развертывания Bicep или Terraform | Обязательно для этого примера с явным IaC; проекты с генерируемой инфраструктурой могут опустить |
| `src/` (или ваш код) | Код приложения, который deploy’ит azd | Обязательно для сервисов с исходниками; не все шаблоны содержат код приложения |
| `README.md` | Инструкция по использованию шаблона | ✅ Настоятельно рекомендуется |
| `.azdo/` или `.github/` | Определения CI/CD пайплайна | Опционально |
| `.devcontainer/` | Воспроизводимая среда разработки | Опционально |
| `azure.yaml` `metadata` | Информация об идентификации/телеметрии шаблона | Рекомендуется; для публикации репозитория Git не требуется |

Здесь нет ничего магического: когда вы запускаете `azd init --template you/your-repo`, azd клонирует репозиторий и читает `azure.yaml`.

---

## Шаг 1: Создайте каркас репозитория

Создайте структуру папок вручную или начните с минимального шаблона и отредактируйте его:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Типичная итоговая структура выглядит так:

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

Это сердце шаблона. Он говорит azd, что развертывать и как:

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

> Поле `metadata.template` используется телеметрией галереи для учета использования. Используйте соглашение `name@version`.

---

## Шаг 3: Параметризуйте инфраструктуру

Главное правило для *переиспользуемого* шаблона: **никогда не жестко задавайте имена, регионы или значения, специфичные для подписки.** Используйте параметры и шаблон resource token так, чтобы один и тот же шаблон работал в любой подписке.

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

Две вещи делают шаблон удобным:

1. **Тег `azd-env-name`** — azd использует его для отслеживания и очистки ресурсов для каждой среды.
2. **Ресурсный токен `uniqueString(...)`** — создает стабильный суффикс-хеш для сокращения коллизий; это не гарантия глобальной уникальности.

Отсутствующий `modules/web.bicep` должен принимать `name`, `location` и `tags`, создавать среду/реестр и приложение Container Apps, помечать приложение тегом `azd-service-name: web` и экспортировать `uri`. Также он должен предоставлять значения реестра, необходимые для выбранного процесса сборки и развертывания (например, `AZURE_CONTAINER_REGISTRY_ENDPOINT` из корневого модуля). Один вывод с конечной точкой сам по себе не связывает обнаружение сервисов, настройки приложения или аутентификацию в реестре.

Создайте соответствующий файл параметров, который читает значения, автоматически подставляемые azd из среды:

Сохраните следующий файл как `infra/main.parameters.json`:

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

azd автоматически подставляет `${AZURE_ENV_NAME}` и `${AZURE_LOCATION}` из текущей среды.

---

## Шаг 4: Протестируйте шаблон локально

Перед публикацией убедитесь, что шаблон работает на чистой системе.

**Тестируйте из локальной папки** (без необходимости пуша в Git):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Затем протестируйте удаление** — хороший шаблон полностью очищает ресурсы:

```bash
azd down --force --purge
```

Если `azd down` оставляет ресурсы, проверьте обнаружение среды/группы ресурсов, внешние/общие ресурсы, разрешения, блокировки и защиту от удаления. `--purge` не удаляет локальное состояние `.azure/`.

> **Совет:** после добавления всех недостающих файлов сначала запустите `azd provision --preview`. Проверьте хуки перед предпросмотром, так как они могут выполнять побочные команды. Предпросмотр — это не оценка стоимости и не гарантия успешного развертывания.

---

## Шаг 5: Опубликуйте шаблон

Запушьте репозиторий на GitHub (публично, если хотите, чтобы другие имели доступ):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Теперь любой может его использовать:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Шаг 6 (опционально): Отправьте в Awesome AZD

Галерея [Awesome AZD](https://azure.github.io/awesome-azd/) содержит шаблоны сообщества. Чтобы попасть туда, ваш репозиторий должен содержать:

- ✅ Четкий `README.md` с требованиями, архитектурной схемой и заметками о стоимости
- ✅ Рабочий `azure.yaml` с `metadata.template`
- ✅ Инфраструктура, которая развертывается корректно в новой подписке
- ✅ Файл `LICENSE`
- ✅ (Рекомендуется) `.devcontainer/` для однокликового запуска Codespaces

Отправьте pull request, добавляющий ваш шаблон в файл данных галереи с соблюдением правил вклада в репозитории [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Часто встречающиеся ошибки

| Ошибка | Исправление |
|---------|-----|
| Жестко заданные имена ресурсов | Используйте ресурсный токен `uniqueString()` |
| `azd down` оставляет ресурсы | Помечайте каждый ресурс (или группу ресурсов) тегом `azd-env-name` |
| Шаблон работает у вас, но не у других | Уберите идентификаторы подписок, арендаторов и предположения о регионах |
| Выводы не связаны с приложением | Соответствуйте `azd-service-name`/`resourceName` для развертывания и явно мапьте выводы в настройки приложения |
| Отказано в включении в галерею | Добавьте `README.md`, `LICENSE` и `metadata.template` |

---

## Итог

- Шаблон — это просто репозиторий Git с `azure.yaml`, `infra/` и вашим кодом.
- Параметризуйте всё — имена, регионы и идентификаторы — чтобы он работал везде.
- Всегда помечайте ресурсы тегом `azd-env-name`, чтобы `azd down` работал.
- Тестируйте локально с помощью `azd init --template <local-path>` перед публикацией.
- Добавьте метаданные и README для отправки в Awesome AZD.

---

## 🔗 Навигация

| Направление | Ресурс |
|-----------|----------|
| **Предыдущая** | [Руководство по развертыванию](deployment-guide.md) |
| **Домашняя страница главы** | [Глава 4: Инфраструктура как код](README.md) |
| **Следующая глава** | [Глава 5: Многоагентные решения](../chapter-05-multi-agent/README.md) |

## 📖 Связанные ресурсы

- [Развёртывание ресурсов](provisioning.md)
- [Галерея Awesome AZD](https://azure.github.io/awesome-azd/)
- [Официальная документация шаблонов azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
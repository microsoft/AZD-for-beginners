# Создание собственного шаблона azd

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 4 — Инфраструктура как код и деплоймент
- **⬅️ Предыдущая**: [Руководство по развертыванию](deployment-guide.md)
- **🚀 Следующая глава**: [Глава 5: Многоагентные решения](../chapter-05-multi-agent/README.md)

> Проверено на `azd 1.27.1` в июле 2026 года.

## Введение

До сих пор вы *использовали* шаблоны с помощью `azd init --template <name>`. Но когда у вас появляется структура проекта, которая нравится вашей команде — например, контейнерное приложение с Cosmos DB и нужным мониторингом — вы захотите превратить его в свой собственный повторно используемый шаблон. Шаблон — это просто Git-репозиторий с предсказуемой структурой, которую azd умеет читать. В этом уроке показано, как создать такой шаблон с нуля, протестировать его и (по желанию) опубликовать в сообществе.

## Цели обучения

К концу урока вы:
- Поймёте, что делает папку «шаблоном azd»
- Узнаете, какие файлы и структура папок обязательны
- Добавите `azure.yaml` и `infra/`, которые смогут использовать другие
- Смоделируете работу шаблона локально перед публикацией
- Опубликуете шаблон и (по желанию) отправите его в галерею сообщества

## Результаты обучения

После выполнения этого урока вы сможете:
- Создать новый репозиторий шаблона
- Параметризовать инфраструктуру так, чтобы она работала в любой подписке
- Проверить шаблон с помощью `azd init` и `azd up`
- Добавить метаданные, необходимые галерее сообщества

---

## Что такое шаблон на самом деле?

Шаблон azd — это **Git-репозиторий**, который содержит как минимум:

| Файл / папка | Назначение | Обязательно? |
|---------------|---------|-----------|
| `azure.yaml` | Описывает сервисы, хосты и провайдера инфраструктуры | ✅ Да |
| `infra/` | Bicep, Terraform или Pulumi, которые создают ресурсы | ✅ Да |
| `src/` (или ваш код) | Код приложения, который запускает azd | ✅ Да |
| `README.md` | Инструкция по использованию шаблона | ✅ Настоятельно рекомендуется |
| `.azdo/` или `.github/` | Определения CI/CD конвейеров | Опционально |
| `.devcontainer/` | Воспроизводимая среда разработки | Опционально |
| `azure.yaml` `metadata` | Информация для галереи и телеметрии | Опционально (обязательно для публикации) |

Здесь нет ничего волшебного: когда вы запускаете `azd init --template you/your-repo`, azd клонирует репозиторий и читает `azure.yaml`.

---

## Шаг 1: Создание структуры репозитория

Создайте структуру папок вручную или начните с минимального шаблона и отредактируйте его:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Создать стандартную компоновку
mkdir -p src infra
```

Обычная готовая структура выглядит так:

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

## Шаг 2: Написание `azure.yaml`

Это сердце шаблона. Он говорит azd, что и как развертывать:

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

> Поле `metadata.template` — это то, что телеметрия галереи использует для подсчёта использования. Используйте соглашение `name@version`.

---

## Шаг 3: Параметризация инфраструктуры

Самое важное правило для *повторно используемого* шаблона: **никогда не хардкодьте имена, регионы или значения от подписки.** Используйте параметры и шаблон resource token, чтобы один и тот же шаблон работал в любой подписке.

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

Два момента делают этот шаблон дружелюбным:

1. **Тег `azd-env-name`** — azd использует его для отслеживания и очистки ресурсов по окружениям.
2. **Ресурсный токен `uniqueString(...)`** — генерирует стабильный глобально уникальный суффикс, чтобы имена не конфликтовали.

Добавьте подходящий файл параметров, который читает значения, автоматически подставляемые azd из окружения:

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

azd подставляет `${AZURE_ENV_NAME}` и `${AZURE_LOCATION}` из текущего окружения автоматически.

---

## Шаг 4: Локальное тестирование шаблона

Перед публикацией убедитесь, что шаблон работает с нуля.

**Тестируйте из локальной папки** (не нужно пушить в Git):

```bash
# Из пустого каталога инициализируйте с использованием локального пути к шаблону
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Предоставление и развертывание от начала до конца
azd auth login
azd up
```

**Затем проверьте удаление** — хороший шаблон чисто удаляет ресурсы:

```bash
azd down --force --purge
```

Если `azd down` оставляет ресурсы, вероятно, вы забыли тег `azd-env-name` на каком-то ресурсе.

> **Совет:** сначала выполните `azd provision --preview`. Эта команда показывает, что будет создано, и выявляет ошибки шаблона до создания ресурсов.

---

## Шаг 5: Публикация шаблона

Запушьте репозиторий на GitHub (сделайте его публичным, если хотите, чтобы другие им пользовались):

```bash
gh repo create my-azd-template --public --source=. --push
```

Теперь любой может его использовать:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Шаг 6 (по желанию): Отправка в Awesome AZD

[Галерея Awesome AZD](https://azure.github.io/awesome-azd/) содержит шаблоны сообщества. Чтобы попасть в список, ваш репозиторий должен содержать:

- ✅ Чёткий `README.md` с требованиями, диаграммой архитектуры и заметками по стоимости
- ✅ Рабочий `azure.yaml` с `metadata.template`
- ✅ Инфраструктуру, которая создаётся без проблем в новой подписке
- ✅ Файл `LICENSE`
- ✅ (Рекомендуется) `.devcontainer/` для быстрого запуска в Codespaces

Отправьте пулл-реквест с добавлением шаблона в файл данных галереи, следуя руководству по взносам в репозитории [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Частые ошибки

| Ошибка | Решение |
|---------|-----|
| Жёстко прописанные имена ресурсов | Используйте ресурсный токен `uniqueString()` |
| `azd down` не удаляет ресурсы | Помечайте каждый ресурс (или группу ресурсов) тегом `azd-env-name` |
| Шаблон работает у вас, но не у других | Уберите ID подписок, ID арендаторов и предположения о регионах |
| Выводы не подключены к приложению | Экспортируйте `SERVICE_<NAME>_ENDPOINT_URL` и другие outputs `AZURE_*` |
| Публикация в галерее отклонена | Добавьте `README.md`, `LICENSE` и `metadata.template` |

---

## Итоги

- Шаблон — это просто Git-репозиторий с `azure.yaml`, `infra/` и вашим кодом.
- Параметризуйте всё — имена, регионы и ID — чтобы запуск работал везде.
- Всегда метьте ресурсы тегом `azd-env-name`, чтобы `azd down` корректно удалял.
- Тестируйте локально с `azd init --template <local-path>` перед публикацией.
- Добавьте метаданные и README для отправки в Awesome AZD.

---

## 🔗 Навигация

| Направление | Ресурс |
|-----------|----------|
| **Предыдущая** | [Руководство по развертыванию](deployment-guide.md) |
| **Домашняя страница главы** | [Глава 4: Инфраструктура как код](README.md) |
| **Следующая глава** | [Глава 5: Многоагентные решения](../chapter-05-multi-agent/README.md) |

## 📖 Связанные ресурсы

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Официальная документация по шаблонам azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
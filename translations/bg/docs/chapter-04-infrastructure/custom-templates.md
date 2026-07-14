# Създаване на собствен azd шаблон

**Навигация в главата:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 4 - Инфраструктура като код и внедряване
- **⬅️ Предишна**: [Ръководство за внедряване](deployment-guide.md)
- **🚀 Следваща глава**: [Глава 5: Многоагентни решения](../chapter-05-multi-agent/README.md)

> Валидирано с `azd 1.27.1` през юли 2026 г.

## Въведение

До момента сте *използвали* шаблони с `azd init --template <име>`. Но щом вече имате оформление на проект, което вашият екип харесва — например Container App с Cosmos DB и подходящия мониторинг — ще искате да го превърнете в собствен многократно използваем шаблон. Шаблонът е просто Git хранилище с предсказуема структура, която azd може да чете. Този урок показва как да създадете такъв от нулата, да го тествате и (по желание) да го публикувате в галерията за общността.

## Учебни цели

След края на този урок ще:
- Разберете какво прави една папка „azd шаблон“
- Познавате нужните файлове и структура на папките
- Добавите `azure.yaml` и `infra/`, които други могат да използват
- Тествате шаблона локално, преди да го споделите
- Публикувате шаблона и (по избор) го изпратите в Awesome AZD

## Получени умения

След завършване на урока ще можете:
- Да създадете ново хранилище за шаблони
- Да параметризирате инфраструктурата, така че да работи в която и да е подписка
- Да валидирате шаблон с `azd init` и `azd up`
- Да добавите метаданни, които изисква галерията

---

## Какво всъщност е шаблон?

Azd шаблонът е **Git хранилище**, което съдържа поне:

| Файл / папка | Цел | Задължително? |
|---------------|---------|-----------|
| `azure.yaml` | Описва услуги, хостове и доставчик на инфраструктура | ✅ Да |
| `infra/` | Bicep, Terraform или Pulumi, които осигуряват ресурсите | ✅ Да |
| `src/` (или ваш код) | Кодът на приложението, който azd внедрява | ✅ Да |
| `README.md` | Как да използвате шаблона | ✅ Силно препоръчително |
| `.azdo/` или `.github/` | Дефиниции на CI/CD пайплайни | По избор |
| `.devcontainer/` | Възпроизведима работна среда за разработка | По избор |
| `azure.yaml` `metadata` | Данни за галерията и телеметрия | По избор (задължително за публикуване) |

Няма нищо магическо: когато стартирате `azd init --template you/your-repo`, azd клонира хранилището и чете `azure.yaml`.

---

## Стъпка 1: Създайте структурата на хранилището

Създайте структурата на папките на ръка или започнете от минимален шаблон и го редактирайте:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Създайте стандартното оформление
mkdir -p src infra
```

Типичното завършено оформление изглежда така:

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

## Стъпка 2: Напишете `azure.yaml`

Това е сърцето на шаблона. Казва на azd какво да внедри и как:

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

> Полето `metadata.template` се използва от галерийната телеметрия за отчитане на употребата. Използвайте конвенция `name@version`.

---

## Стъпка 3: Параметризирайте инфраструктурата

Най-важното правило за *многократно използваем* шаблон: **никога не твърдо кодирайте имена, региони или стойности специфични за подписка.** Използвайте параметри и модела на ресурса token, така че същият шаблон да работи в която и да е подписка.

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

Две неща правят шаблона подходящ:

1. **Таг `azd-env-name`** — azd го използва за проследяване и почистване на ресурси по среди.
2. **Ресурсен token `uniqueString(...)`** — произвежда стабилен, глобално уникален суфикс, за да не се сблъскват имената.

Предоставете съвпадащ файл с параметри, който чете стойности, които azd вмъква от средата:

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

azd автоматично замества `${AZURE_ENV_NAME}` и `${AZURE_LOCATION}` със стойности от текущата среда.

---

## Стъпка 4: Тествайте шаблона локално

Преди да споделите, уверете се, че шаблонът работи от чисто състояние.

**Тествайте от локалната папка** (без нужда от Git push):

```bash
# От празна директория, инициализирайте, използвайки локалния път до шаблона си
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Осигуряване + разгръщане от край до край
azd auth login
azd up
```

**След това тествайте демонтирането** — добър шаблон почиства напълно:

```bash
azd down --force --purge
```

Ако `azd down` оставя ресурси, вероятно сте пропуснали таг `azd-env-name` на някой ресурс.

> **Съвет:** първо стартирайте `azd provision --preview`. Това изпълнява какво-ако анализ и показва грешки в шаблона преди създаването на ресурси.

---

## Стъпка 5: Публикувайте шаблона

Избутайте хранилището в GitHub (публично, ако искате други да го използват):

```bash
gh repo create my-azd-template --public --source=. --push
```

Всеки вече може да го използва:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Стъпка 6 (по избор): Изпратете в Awesome AZD

[Галерията Awesome AZD](https://azure.github.io/awesome-azd/) списва шаблони на общността. За да бъдете включени, вашето хранилище трябва да съдържа:

- ✅ Ясен `README.md` с предпоставки, диаграма на архитектурата и бележки за разходите
- ✅ Работещ `azure.yaml` с `metadata.template`
- ✅ Инфраструктура, която се осигурява чисто в нова подписка
- ✅ Файл `LICENSE`
- ✅ (Препоръчително) `.devcontainer/` за едно кликване Codespaces

Изпратете чрез отваряне на pull request, който добавя вашия шаблон към файла с данни на галерията, като следвате ръководството за приноси в [Awesome AZD хранилището](https://github.com/Azure/awesome-azd).

---

## Чести капани

| Капан | Решение |
|---------|---------|
| Твърдо кодирани имена на ресурси | Използвайте ресурсния token `uniqueString()` |
| `azd down` оставя ресурси | Тагвайте всеки ресурс (или групата ресурси) с `azd-env-name` |
| Шаблонът работи при вас, но не и при други | Премахнете ID на подписки, ID на клиенти и регионални предположения |
| Изходите не са свързани в приложението | Експортирайте `SERVICE_<ИМЕ>_ENDPOINT_URL` и други изходи `AZURE_*` |
| Отказ за включване в галерията | Добавете `README.md`, `LICENSE` и `metadata.template` |

---

## Обобщение

- Шаблонът е просто Git хранилище с `azure.yaml`, `infra/` и вашия код.
- Параметризирайте всичко — имена, региони и ID-та — за да работи навсякъде.
- Винаги тагвайте ресурсите с `azd-env-name`, за да работи `azd down`.
- Тествайте локално с `azd init --template <локален-път>`, преди да публикувате.
- Добавете метаданни и README за подаване към Awesome AZD.

---

## 🔗 Навигация

| Посока | Ресурс |
|-----------|----------|
| **Предишна** | [Ръководство за внедряване](deployment-guide.md) |
| **Начало на глава** | [Глава 4: Инфраструктура като код](README.md) |
| **Следваща глава** | [Глава 5: Многоагентни решения](../chapter-05-multi-agent/README.md) |

## 📖 Свързани ресурси

- [Осигуряване на ресурси](provisioning.md)
- [Галерия Awesome AZD](https://azure.github.io/awesome-azd/)
- [Официална документация за azd шаблони](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
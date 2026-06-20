# Създаване на собствен azd шаблон

**Навигация в главата:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 4 - Инфраструктура като код и внедряване
- **⬅️ Предишна**: [Ръководство за внедряване](deployment-guide.md)
- **🚀 Следваща глава**: [Глава 5: Многоагентни решения](../chapter-05-multi-agent/README.md)

> Проверено с `azd 1.25.6` през юни 2026.

## Въведение

Досега сте *използвали* шаблони с `azd init --template <name>`. Но след като имате оформление на проект, което вашият екип харесва — например Container App с Cosmos DB и подходящо наблюдение — ще искате да го превърнете в многократно използваем шаблон. Шаблонът е просто Git хранилище с предвидима структура, която azd може да прочете. В този урок ще видите как да създадете такъв от нулата, да го тествате и (по избор) да го публикувате в галерията на общността.

## Цели на обучението

В края на този урок ще:
- Разберете какво прави една папка „azd шаблон“
- Познавате необходимите файлове и структура на папките
- Добавите `azure.yaml` и `infra/`, които други хора могат да използват повторно
- Тествате вашия шаблон локално преди да го споделите
- Публикувате го и (по избор) го добавите в Awesome AZD

## Резултати от обучението

След завършване на този урок ще можете да:
- Създадете скелет (scaffold) за ново хранилище с шаблон
- Параметризирате инфраструктурата, така че да работи във всеки абонамент
- Валидирате шаблон с `azd init` и `azd up`
- Добавите метаданните, които изисква галерията на общността

---

## Какво всъщност е шаблон?

Шаблон на azd е **Git хранилище**, което съдържа, поне:

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | Описва услуги, хостове и доставчик на инфраструктура | ✅ Да |
| `infra/` | Bicep, Terraform или Pulumi, които създават ресурси | ✅ Да |
| `src/` (or your code) | Кодът на приложението, който azd внедрява | ✅ Да |
| `README.md` | Как да използвате шаблона | ✅ Силно препоръчително |
| `.azdo/` or `.github/` | Дефиниции за CI/CD | По избор |
| `.devcontainer/` | Възпроизводима среда за разработка | По избор |
| `azure.yaml` `metadata` | Информация за галерията и телеметрията | По избор (задължително за публикуване) |

Няма нищо магическо: когато изпълните `azd init --template you/your-repo`, azd клонира хранилището и чете `azure.yaml`.

---

## Стъпка 1: Scaffold the Repository

Създайте структурата на папките ръчно или започнете от минимален шаблон и го редактирайте:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Създайте стандартното оформление
mkdir -p src infra
```

A typical finished layout looks like this:

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

## Стъпка 2: Write `azure.yaml`

Това е сърцето на шаблона. То казва на azd какво да внедри и как:

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

> Полето `metadata.template` е това, което телеметрията на галерията използва, за да отчита използването. Използвайте конвенцията `name@version`.

---

## Стъпка 3: Параметризиране на инфраструктурата

Едно най-важно правило за *многократно използваем* шаблон: **никога не твърдо кодирайте имена, региони или стойности, специфични за абонамент.** Използвайте параметри и шаблона на ресурсните токени (resource token), така че същият шаблон да работи в абонамента на всеки.

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

Две неща правят шаблона подходящ за повторно използване:

1. **таг `azd-env-name`** — azd го използва, за да проследява и почиства ресурсите за всяка среда.
2. **ресурсен токен `uniqueString(...)`** — генерира стабилен, глобално уникален суфикс, така че имената да не се припокриват.

Осигурете съответстващ файл с параметри, който чете стойности, които azd инжектира от средата:

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

azd заменя `${AZURE_ENV_NAME}` и `${AZURE_LOCATION}` от текущата среда автоматично.

---

## Стъпка 4: Тествайте вашия шаблон локално

Преди да споделите, докажете, че шаблонът работи от чисто състояние.

**Тествайте от локалната папка** (не се изисква Git push):

```bash
# От празна директория инициализирайте, като използвате локалния път към шаблона
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Провизиране и разгръщане от край до край
azd auth login
azd up
```

**След това тествайте премахването** — добрият шаблон почиства всичко напълно:

```bash
azd down --force --purge
```

Ако `azd down` оставя ресурси, най-вероятно сте пропуснали тага `azd-env-name` върху ресурс.

> **Съвет:** стартирайте първо `azd provision --preview`. Това изпълнява what-if и показва грешки в шаблона преди да бъде създаден какъвто и да е ресурс.

---

## Стъпка 5: Публикувайте шаблона

Публикувайте хранилището в GitHub (публично, ако искате други да го използват):

```bash
gh repo create my-azd-template --public --source=. --push
```

Сега всеки може да го използва:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Стъпка 6 (по избор): Подайте в Awesome AZD

Галерията [Awesome AZD](https://azure.github.io/awesome-azd/) изброява шаблони от общността. За да бъде включено вашето хранилище, то трябва да съдържа:

- ✅ Ясен `README.md` с предварителни изисквания, диаграма на архитектурата и бележки за разходи
- ✅ Работещ `azure.yaml` с `metadata.template`
- ✅ Инфраструктура, която се провизира чисто в нов абонамент
- ✅ Файл `LICENSE`
- ✅ (Препоръчително) `.devcontainer/` за еднокликни Codespaces

Подайте чрез отваряне на pull request, който добавя вашия шаблон към data файла на галерията, следвайки указанията за приноси в [Awesome AZD репозитория](https://github.com/Azure/awesome-azd).

---

## Чести грешки

| Pitfall | Fix |
|---------|-----|
| Hardcoded resource names | Използвайте ресурсния токен `uniqueString()` |
| `azd down` leaves resources | Тагнете всеки ресурс (или ресурсната група) с `azd-env-name` |
| Template works for you, fails for others | Премахнете ID-та на абонаменти, tenant ID-та и предположения за региони |
| Outputs not wired into the app | Експортирайте `SERVICE_<NAME>_ENDPOINT_URL` и други `AZURE_*` изходи |
| Gallery submission rejected | Добавете `README.md`, `LICENSE`, и `metadata.template` |

---

## Резюме

- Шаблонът е просто Git хранилище с `azure.yaml`, `infra/`, и вашия код.
- Параметризирайте всичко — имена, региони и ID-та — така че да работи навсякъде.
- Винаги тагвайте ресурсите с `azd-env-name`, за да работи `azd down`.
- Тествайте локално с `azd init --template <local-path>` преди публикуване.
- Добавете метаданни и README, за да подадете в Awesome AZD.

---

## 🔗 Навигация

| Direction | Resource |
|-----------|----------|
| **Предишна** | [Ръководство за внедряване](deployment-guide.md) |
| **Начало на глава** | [Глава 4: Инфраструктура като код](README.md) |
| **Следваща глава** | [Глава 5: Многоагентни решения](../chapter-05-multi-agent/README.md) |

## 📖 Свързани ресурси

- [Провизиране на ресурси](provisioning.md)
- [Галерия Awesome AZD](https://azure.github.io/awesome-azd/)
- [Официална документация за azd шаблони](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
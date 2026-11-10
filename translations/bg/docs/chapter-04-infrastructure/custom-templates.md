# Създаване на собствен azd шаблон

**Навигация в глава:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 4 - Инфраструктура като код и внедряване
- **⬅️ Предишна**: [Ръководство за внедряване](deployment-guide.md)
- **🚀 Следваща глава**: [Глава 5: Многослужебни решения](../chapter-05-multi-agent/README.md)

> Прегледано спрямо `azd 1.37.2` (ноември 2026). Това е **преминаване през създаването с частични файлове**, а не пълен шаблон: трябва да осигурите код на приложението и `modules/web.bicep` с неговата среда, регистър, контейнерно приложение и изходи преди внедряване. Azure провизиране не е изпълнено в този преглед.

## Въведение

Досега сте *използвали* шаблони с `azd init --template <name>`. Но след като имате проектна структура, която е харесвана от вашия екип — например, контейнерно приложение с Cosmos DB и подходящ мониторинг — ще искате да го превърнете в шаблон, който може да се използва повторно. Шаблонът е просто Git хранилище с предвидима структура, която azd знае как да чете. Този урок ви показва как да създадете такъв от нулата, да го тествате и (по избор) да го публикувате в галерията на общността.

## Учебни цели

В края на този урок ще можете да:
- Разберете какво прави една папка „azd шаблон“
- Познавате необходимите файлове и структура на папките
- Добавите `azure.yaml` и `infra/`, които други могат да използват повторно
- Тествате своя шаблон локално преди да го споделите
- Публикувате и (по избор) да го изпратите в Awesome AZD

## Резултати от обучението

След завършване на този урок ще можете да:
- Създадете ново хранилище за шаблон
- Параметризирате инфраструктурата, така че да работи във всеки абонамент
- Валидирате шаблон с `azd init` и `azd up`
- Добавите метаданни, които изисква галерията на общността

---

## Какво всъщност е шаблон?

azd шаблон е **Git хранилище**, което съдържа, най-малко:

| Файл / папка | Цел | Задължителен? |
|---------------|---------|-----------|
| `azure.yaml` | Описва услуги, хостове и доставчик на инфраструктура | ✅ Да |
| `infra/` | Дефиниции за провизиране с Bicep или Terraform | Задължително за този пример с явен IaC; проекти с генерирана инфраструктура могат да го пропуснат |
| `src/` (или ваш код) | Код на приложението, който azd внедрява | Задължително при услуги, базирани на източник; не всички шаблони съдържат код на приложението |
| `README.md` | Как да се използва шаблона | ✅ Силно препоръчително |
| `.azdo/` или `.github/` | Дефиниции за CI/CD pipeline | По избор |
| `.devcontainer/` | Възпроизводима среда за разработка | По избор |
| `azure.yaml` `metadata` | Идентичност/телеметрична информация за шаблона | Препоръчително; публикуване на Git хранилище не го изисква |

Няма нищо магическо тук: когато изпълните `azd init --template you/your-repo`, azd клонира хранилището и чете `azure.yaml`.

---

## Стъпка 1: Създайте хранилището

Създайте структурата на папките ръчно или започнете от минимален шаблон и го редактирайте:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
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

Това е сърцето на шаблона. То казва на azd какво да внедри и как:

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

> Полето `metadata.template` е това, което галерията използва в телеметрията за проследяване на използването. Използвайте конвенцията `name@version`.

---

## Стъпка 3: Параметризиране на инфраструктурата

Единственото най-важно правило за *повторно използваем* шаблон: **никога не използвайте твърдо кодирането на имена, региони или стойности, специфични за абонамент.** Използвайте параметри и шаблона на ресурсния токен, за да работи същият шаблон в абонамента на всеки потребител.

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

Две неща правят този шаблон подходящ:

1. **`azd-env-name` етикет** — azd го използва за проследяване и изчистване на ресурси по среди.
2. **`uniqueString(...)` ресурсен токен** — произвежда стабилен хеш суфикс за намаляване на сблъсъци; не гарантира глобална уникалност.

Липсващият `modules/web.bicep` трябва да приема `name`, `location` и `tags`, да провизира средата/регистъра и приложението на контейнерните приложения, да тагва приложението с `azd-service-name: web` и да експортира `uri`. Той трябва също да излага регистърни стойности, необходими за избрания билд/внедрителен поток (например `AZURE_CONTAINER_REGISTRY_ENDPOINT` от коренния модул). Само изходна крайна точка не свързва откриване на услуги, настройки на приложението или удостоверяване в регистъра.

Осигурете съответстващ параметричен файл, който чете стойности, които azd инжектира от средата:

Запишете следното като `infra/main.parameters.json`:

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

azd автоматично замества `${AZURE_ENV_NAME}` и `${AZURE_LOCATION}` от текущата среда.

---

## Стъпка 4: Тествайте шаблона локално

Преди да го споделите, докажете, че шаблонът работи от чисто състояние.

**Тествайте от локалната папка** (не е необходим git push):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**След това тествайте премахването** — добър шаблон почиства напълно:

```bash
azd down --force --purge
```

Ако `azd down` оставя ресурси, проверете откриване на среда/група ресурси, външни/споделени ресурси, разрешения, заключвания и защита от изтриване. `--purge` не изтрива локалното състояние `.azure/`.

> **Съвет:** след добавяне на всички липсващи файлове, първо изпълнете `azd provision --preview`. Проверете hook-овете преди прегледа, защото те могат да изпълнят команди с странични ефекти. Прегледът не е оценка на цена или гаранция, че провизирането ще успее.

---

## Стъпка 5: Публикувайте шаблона

Публикувайте хранилището в GitHub (на публично, ако искате други да го използват):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Всеки сега може да го използва:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Стъпка 6 (по избор): Изпратете в Awesome AZD

Галерията [Awesome AZD](https://azure.github.io/awesome-azd/) изброява общностни шаблони. За да бъде включено вашето репо, то трябва да съдържа:

- ✅ Ясно `README.md` с предварителни условия, диаграма на архитектурата и бележки за разходите
- ✅ Работещ `azure.yaml` с `metadata.template`
- ✅ Инфраструктура, която се инсталира чисто в нов абонамент
- ✅ `LICENSE` файл
- ✅ (Препоръчително) `.devcontainer/` за еднократно стартиране на Codespaces

Изпратете чрез отваряне на pull request, който добавя вашия шаблон към файла с данни на галерията, следвайки ръководството за приноси в [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Чести капани

| Капан | Решение |
|---------|-----|
| Закодирани на твърдо имена на ресурси | Използвайте ресурсния токен `uniqueString()` |
| `azd down` оставя ресурси | Маркирайте всеки ресурс (или ресурсна група) с `azd-env-name` |
| Шаблонът работи при вас, но се проваля при други | Премахнете идентификатори на абонаменти, идентификатори на наематели и предположения за регион |
| Изходните данни не са свързани с приложението | Съвпадайте `azd-service-name`/`resourceName` за разгръщане и явно свържете изходните данни с настройките на приложението |
| Отхвърлена подадена заявка за галерия | Добавете `README.md`, `LICENSE` и `metadata.template` |

---

## Резюме

- Шаблонът е просто Git репо с `azure.yaml`, `infra/` и вашия код.
- Параметризирайте всичко — имена, региони и идентификатори — за да работи навсякъде.
- Винаги маркирайте ресурсите с `azd-env-name`, за да работи `azd down`.
- Тествайте локално с `azd init --template <local-path>` преди публикуване.
- Добавете метаданни и README за подаване в Awesome AZD.

---

## 🔗 Навигация

| Посока | Ресурс |
|-----------|----------|
| **Предишен** | [Deployment Guide](deployment-guide.md) |
| **Начало на глава** | [Chapter 4: Infrastructure as Code](README.md) |
| **Следваща глава** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 Свързани ресурси

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Официална документация за azd шаблони](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
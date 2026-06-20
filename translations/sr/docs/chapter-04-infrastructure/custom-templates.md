# Писање сопственог azd шаблона

**Навигација поглављем:**
- **📚 Почетак курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 4 - Инфраструктура као код и размештање
- **⬅️ Претходно**: [Водич за распоређивање](deployment-guide.md)
- **🚀 Следеће поглавље**: [Поглавље 5: Решења са више агената](../chapter-05-multi-agent/README.md)

> Потврђено са `azd 1.25.6` у јуну 2026.

## Увод

До сада сте *конзумирали* шаблоне помоћу `azd init --template <name>`. Али када имате распоред пројекта који ваш тим воли—на пример, Container App са Cosmos DB и одговарајућим мониторингом—желећете да га претворите у поновно употребљив шаблон. Шаблон је само Git репозиторијум са предвидивом структуром коју azd зна како да прочита. Ова лекција показује како да направите један од нуле, тестирате га и (опционо) објавите га у галерији заједнице.

## Циљеви учења

На крају ове лекције, ви ћете:
- Разумети шта чини фасциклу „azd шаблоном“
- Познавати потребне фајлове и распоред фасцикли
- Додати `azure.yaml` и `infra/` које други могу поново користити
- Тестирати свој шаблон локално пре дељења
- Објавити га и (опционо) послати у Awesome AZD

## Исходи учења

Након завршетка ове лекције, бићете у могућности да:
- Иницијализујете нови репозиторијум шаблона
- Параметризујете инфраструктуру тако да ради у било којој претплати
- Валидацијујете шаблон помоћу `azd init` и `azd up`
- Додате метаподатке које захтева галерија заједнице

---

## Шта је заправо шаблон?

azd шаблон је **Git репозиторијум** који садржи, најмање:

| Фајл / фасцикла | Сврха | Потребно? |
|---------------|---------|-----------|
| `azure.yaml` | Описује сервисе, хостове и провајдера инфраструктуре | ✅ Да |
| `infra/` | Bicep, Terraform или Pulumi који обезбеђују ресурсе | ✅ Да |
| `src/` (or your code) | Код апликације који azd распоређује | ✅ Да |
| `README.md` | Како користити шаблон | ✅ Снажно препоручено |
| `.azdo/` или `.github/` | Дефиниције CI/CD пипелина | Опционо |
| `.devcontainer/` | Репродуцибилно развојно окружење | Опционо |
| `azure.yaml` `metadata` | Информације за галерију и телеметрију | Опционо (потребно за објављивање) |

Нема ту ничег магичног: када покренете `azd init --template you/your-repo`, azd клонира репозиторијум и чита `azure.yaml`.

---

## Корак 1: Постављање репозиторијума

Направите структуру фасцикли ручно или почните од минималног шаблона и измените га:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Направити стандардни распоред
mkdir -p src infra
```

Типичан завршни распоред изгледа овако:

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

## Корак 2: Напишите `azure.yaml`

Ово је срж шаблона. Он говори azd шта да размести и како:

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

> Поље `metadata.template` је оно што галеријска телеметрија користи да броји употребу. Користите конвенцију `name@version`.

---

## Корак 3: Параметризација инфраструктуре

Једно најважније правило за *поновно употребљив* шаблон: **никада не тврдокодирајте имена, регионе или вредности специфичне за претплату.** Користите параметре и образац resource token тако да исти шаблон ради у било чијој претплати.

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

Две ствари чине овај шаблон погодним за поновну употребу:

1. **`azd-env-name` tag** — azd га користи за праћење и чишћење ресурса по окружењу.
2. **`uniqueString(...)` resource token** — генерише стабилан, глобално јединствен суфикс тако да имена не колидирају.

Обезбедите одговарајући фајл параметара који чита вредности које azd убацује из окружења:

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

azd аутоматски замењује `${AZURE_ENV_NAME}` и `${AZURE_LOCATION}` из тренутног окружења.

---

## Корак 4: Тестирајте свој шаблон локално

Пре дељења, докажите да шаблон ради из чистог стања.

**Тестирајте из локалне фасцикле** (није потребно гурање на Git):

```bash
# Из празног директоријума, покрените иницијализацију користећи путању до вашег локалног шаблона
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Обезбеђивање и распоређивање од почетка до краја
azd auth login
azd up
```

**Затим тестирате уклањање (teardown)**—добар шаблон потпуно очисти све:

```bash
azd down --force --purge
```

Ако `azd down` остави ресурсе иза, вероватно сте пропустили `azd-env-name` таг на неком ресурсу.

> **Савет:** покрените `azd provision --preview` прво. Он извршава what-if и приказује грешке шаблона пре него што се креира било који ресурс.

---

## Корак 5: Објавите шаблон

Пошаљите репозиторијум на GitHub (јавни ако желите да га други користе):

```bash
gh repo create my-azd-template --public --source=. --push
```

Сада га свако може користити:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Корак 6 (опционо): Пошаљите у Awesome AZD

Галерија [Awesome AZD](https://azure.github.io/awesome-azd/) листа шаблоне заједнице. Да бисте били наведени, ваш репозиторијум треба да укључује:

- ✅ Јасан `README.md` са предусловима, дијаграмом архитектуре и напоменама о трошковима
- ✅ Функционалан `azure.yaml` са `metadata.template`
- ✅ Инфраструктура која се провизионира исправно у новој претплати
- ✅ Фајл `LICENSE`
- ✅ (Препоручено) `.devcontainer/` за једнокликово покретање у Codespaces

Пошаљите тако што ћете отворити pull request који додаје ваш шаблон у датотеку са подацима галерије, пратећи водич за допринос у [репозиторијуму Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Уобичајене замке

| Замка | Решење |
|---------|-----|
| Тврдокодирана имена ресурса | Користите resource token `uniqueString()` |
| `azd down` оставља ресурсе | Означите сваки ресурс (или групу ресурса) са `azd-env-name` |
| Шаблон ради за вас, не ради за друге | Уклоните ID-ове претплате, ID-ове закупца (tenant) и претпоставке о региону |
| Излази нису повезани у апликацију | Експортујте `SERVICE_<NAME>_ENDPOINT_URL` и друге `AZURE_*` излазе |
| Пријава у галерију одбијена | Додајте `README.md`, `LICENSE` и `metadata.template` |

---

## Резиме

- Шаблон је само Git репо са `azure.yaml`, `infra/` и вашим кодом.
- Параметризујте све — имена, регионе и ID-ове — тако да ради било где.
- Увек означите ресурсе са `azd-env-name` да би `azd down` радио.
- Тестирајте локално помоћу `azd init --template <local-path>` пре објављивања.
- Додајте метаподатке и README да бисте га послали у Awesome AZD.

---

## 🔗 Навигација

| Смер | Ресурс |
|-----------|----------|
| **Претходно** | [Водич за распоређивање](deployment-guide.md) |
| **Почетак поглавља** | [Поглавље 4: Инфраструктура као код](README.md) |
| **Следеће поглавље** | [Поглавље 5: Решења са више агената](../chapter-05-multi-agent/README.md) |

## 📖 Повезани ресурси

- [Провизионирање ресурса](provisioning.md)
- [Галерија Awesome AZD](https://azure.github.io/awesome-azd/)
- [Званична документација azd шаблона](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
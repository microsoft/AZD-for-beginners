# Kuunda Template Yako ya azd

**Uabiri wa Sura:**
- **📚 Nyumbani ya Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 4 - Miundombinu kama Msimbo na Ueneaji
- **⬅️ Iliyotangulia**: [Deployment Guide](deployment-guide.md)
- **🚀 Sura Ifuatayo**: [Sura 5: Suluhisho za Wakala Wengi](../chapter-05-multi-agent/README.md)

> Imethibitishwa dhidi ya `azd 1.25.6` Juni 2026.

## Utangulizi

Hadi sasa ume*metumia* templeti kwa `azd init --template <name>`. Lakini mara tu utakapokuwa na muundo wa mradi timu yako inapenda—kwa mfano, Container App yenye Cosmos DB na utambuzi unaofaa—utataka kuibadilisha kuwa templeti inayoweza kutumiwa tena yako mwenyewe. Templeti ni tu Git repository yenye muundo unaotarajiwa ambao azd inajua jinsi ya kusoma. Somo hili linakuonyesha jinsi ya kujenga moja kutoka mwanzoni, kuijaribu, na (hiari) kuichapisha kwenye gallery ya jamii.

## Malengo ya Kujifunza

Mwisho wa somo hili, utakuwa umeweza:
- Kuelewa kinachofanya folda kuwa "templeti ya azd"
- Kujua faili na mpangilio wa folda zinazohitajika
- Kuongeza `azure.yaml` na `infra/` ambazo watu wengine wanaweza kutumia
- Kuijaribu templeti yako kwa ndani kabla ya kuishiriki
- Kuichapisha na (hiari) kuwasilisha kwa Awesome AZD

## Matokeo ya Kujifunza

Baada ya kumaliza somo hili, utaweza:
- Kuanzisha repository mpya ya templeti
- Kufanya miundombinu iwe na vigezo ili ifanye kazi katika subscription yoyote
- Kuhakiki templeti na `azd init` na `azd up`
- Kuongeza metadata ambayo gallery ya jamii inahitaji

---

## Je, Templeti ni Nini, Kweli?

Templeti ya azd ni **Git repository** inayojumuisha, angalau:

| Faili / folda | Madhumuni | Je inahitajika? |
|---------------|---------|-----------|
| `azure.yaml` | Inaelezea huduma, mwenyeji, na mtoa huduma wa miundombinu | ✅ Ndiyo |
| `infra/` | Bicep, Terraform, au Pulumi zinazotengeneza rasilimali | ✅ Ndiyo |
| `src/` (au msimbo wako) | Msimbo wa programu ambao azd huutuma | ✅ Ndiyo |
| `README.md` | Jinsi ya kutumia templeti | ✅ Inapendekezwa sana |
| `.azdo/` au `.github/` | Ufafanuzi wa pipelines za CI/CD | Hiari |
| `.devcontainer/` | Mazingira ya maendeleo yanayoweza kurudiwa | Hiari |
| `azure.yaml` `metadata` | Habari za gallery + telemetry | Hiari (inahitajika kuchapisha) |

Hakuna uchawi hapa: unaporun `azd init --template you/your-repo`, azd inakopa repo na kusoma `azure.yaml`.

---

## Hatua 1: Tengeneza Repository

Unda muundo wa folda kwa mkono au anza kutoka kwa templeti ndogo na uhariri:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Unda mpangilio wa kawaida
mkdir -p src infra
```

Mpangilio wa kawaida ulio kamilika unaonekana hivi:

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

## Hatua 2: Andika `azure.yaml`

Hili ndilo kiini cha templeti. Linaambia azd nini cha kupeleka na jinsi:

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

> Sehemu ya `metadata.template` ndiyo telemetry ya gallery inayotumiwa kuhesabu matumizi. Tumia desturi ya `name@version`.

---

## Hatua 3: Fanya Miundombinu Iwe na Vigezo

Sheria muhimu zaidi kwa templeti inayoweza kutumiwa tena: **kamwe usiweka majina, mikoa, au thamani maalum za subscription kwa njia ya hardcode.** Tumia vigezo na muundo wa resource token ili templeti ile ile ifanye kazi katika subscription ya mtu yeyote.

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

Mambo mawili hufanya templeti iwe rahisi kutumia:

1. **`azd-env-name` tag** — azd inaitumia kufuatilia na kusafisha rasilimali kwa kila mazingira.
2. **`uniqueString(...)` resource token** — hutoa kifupisho thabiti, cha kipekee kimataifa ili majina yasipigane.

Toa faili ya parameters inayolingana inayosoma thamani ambazo azd inaingiza kutoka kwa mazingira:

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

azd inabadilisha `${AZURE_ENV_NAME}` na `${AZURE_LOCATION}` kutoka kwa mazingira ya sasa moja kwa moja.

---

## Hatua 4: Jaribu Templeti Yako Kwenye Kifaa Chako

Kabla ya kushiriki, thibitisha kwamba templeti inafanya kazi kutoka kwa hali safi.

**Jaribu kutoka folda ya ndani** (hakuna Git push inayohitajika):

```bash
# Kutoka kwenye saraka tupu, anzisha kwa kutumia njia ya kiolezo ya ndani
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Tayarisha rasilimali na weka kutoka mwanzo hadi mwisho
azd auth login
azd up
```

**Kisha jaribu kuondoa**—templeti nzuri inasafisha kabisa:

```bash
azd down --force --purge
```

Kama `azd down` inaacha rasilimali nyuma, huenda ulikosa tag ya `azd-env-name` kwenye rasilimali.

> **Ushauri:** run `azd provision --preview` kwanza. Inafanya what-if na inaonyesha makosa ya templeti kabla ya rasilimali yoyote kuundwa.

---

## Hatua 5: Chapisha Templeti

Push repository kwenye GitHub (public ikiwa unataka wengine waiwezeshe):

```bash
gh repo create my-azd-template --public --source=. --push
```

Sasa mtu yeyote anaweza kuitumia:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Hatua 6 (Hiari): Wasilisha kwa Awesome AZD

[Jukwaa la Awesome AZD](https://azure.github.io/awesome-azd/) linaorodhesha templeti za jamii. Ili kuorodheshwa repo yako inapaswa kujumuisha:

- ✅ README.md wazi yenye vitu vinavyohitajika kabla ya kuanza, mchoro wa usanifu, na maelezo ya gharama
- ✅ `azure.yaml` inayoendeshwa vizuri na `metadata.template`
- ✅ Miundombinu inayoweka rasilimali kwa usafi katika subscription safi
- ✅ Faili ya `LICENSE`
- ✅ (Inayopendekezwa) `.devcontainer/` kwa Codespaces kwa kitufe kimoja

Tuma kwa kufungua pull request inayoongeza templeti yako kwenye faili za data za gallery, ukifuata mwongozo wa michango kwenye [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Makosa Yanayojirudia

| Tatizo | Suluhisho |
|---------|-----|
| Majina ya rasilimali yaliyowekwa kikaboni | Tumia resource token ya `uniqueString()` |
| `azd down` inaacha rasilimali | Tag kila rasilimali (au resource group) na `azd-env-name` |
| Templeti inakufaa, inashindwa kwa wengine | Ondoa subscription IDs, tenant IDs, na makadirio ya mikoa |
| Matokeo hayajounganishwa kwenye app | Export `SERVICE_<NAME>_ENDPOINT_URL` na matokeo mengine ya `AZURE_*` |
| Uwasilisho wa gallery umekataliwa | Ongeza `README.md`, `LICENSE`, na `metadata.template` |

---

## Muhtasari

- Templeti ni tu Git repo yenye `azure.yaml`, `infra/`, na msimbo wako.
- Fanya kila kitu kuwa na vigezo—majina, mikoa, na IDs—ili ionekane popote.
- Daima weka tag ya rasilimali kwa `azd-env-name` ili `azd down` ifanye kazi.
- Jaribu kwa ndani kwa `azd init --template <local-path>` kabla ya kuchapisha.
- Ongeza metadata na README ili kuwasilisha kwa Awesome AZD.

---

## 🔗 Uabiri

| Mwelekeo | Rasilimali |
|-----------|----------|
| **Iliyotangulia** | [Deployment Guide](deployment-guide.md) |
| **Nyumbani wa Sura** | [Sura 4: Miundombinu kama Msimbo](README.md) |
| **Sura Ifuatayo** | [Sura 5: Suluhisho za Wakala Wengi](../chapter-05-multi-agent/README.md) |

## 📖 Rasilimali Zinazohusiana

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Nyaraka rasmi za templeti za azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
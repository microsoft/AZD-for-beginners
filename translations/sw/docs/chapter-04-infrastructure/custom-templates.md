# Kuunda Kiolezo Chako cha azd

**Uelekezaji wa Sura:**
- **📚 Mwanzo wa Kozi**: [AZD Kwa Wananchi Wachanga](../../README.md)
- **📖 Sura ya Sasa**: Sura 4 - Miundombinu kama Msimbo & Utekelezaji
- **⬅️ Iliyopita**: [Mwongozo wa Utekelezaji](deployment-guide.md)
- **🚀 Sura Ifuatayo**: [Sura 5: Suluhisho za Wakala Wengi](../chapter-05-multi-agent/README.md)

> Imethibitishwa dhidi ya `azd 1.27.1` mnamo Julai 2026.

## Utangulizi

Hadi sasa ume *tumia* viungo vya kiolezo na `azd init --template <name>`. Lakini mara tu unapopata mpangilio wa mradi unaopendelewa na timu yako—mfano, Programu ya Kontena yenye Cosmos DB na usimamizi sahihi—utataka kuibadilisha kuwa kiolezo cha kurudiarudia cha mtumiaji mwenyewe. Kiolezo ni tu hifadhi ya Git yenye muundo unaotegemewa ambao azd inajua kusoma. Somo hili linaonyesha jinsi ya kuunda moja kutoka mwanzoni, kuikagua, na (hiari) kuichapisha kwa maktaba ya jamii.

## Malengo ya Kujifunza

Mwisho wa somo hili, utajua:
- Elewa kinachofanya folda kuwa "kiolezo cha azd"
- Jua faili zinazohitajika na mpangilio wa folda
- Ongeza `azure.yaml` na `infra/` ambazo watu wengine wanaweza kutumia tena
- Jaribu kiolezo chako kwa ndani kabla ya kushirikisha
- Chapisha na (hiari) uwasilishe kwa Awesome AZD

## Matokeo ya Kujifunza

Baada ya kukamilisha somo hili, utaweza:
- Tengeneza hifadhi mpya ya kiolezo
- Weka vigezo vya miundombinu ili ifanye kazi kwenye usajili wowote
- Thibitisha kiolezo kwa `azd init` na `azd up`
- Ongeza metadata inayotakiwa na maktaba ya jamii

---

## Kiolezo ni Nini, Kweli?

Kiolezo cha azd ni **hifadhi ya Git** inayojumuisha, kwa chini kabisa:

| Faili / folda | Kusudi | Je, inahitajika? |
|---------------|---------|------------------|
| `azure.yaml` | Inabainisha huduma, mwenyeji, na mtoa huduma wa miundombinu | ✅ Ndiyo |
| `infra/` | Bicep, Terraform, au Pulumi inayounda rasilimali | ✅ Ndiyo |
| `src/` (au msimbo wako) | Msimbo wa programu unaotekelezwa na azd | ✅ Ndiyo |
| `README.md` | Jinsi ya kutumia kiolezo | ✅ Inashauriwa sana |
| `.azdo/` au `.github/` | Maelezo ya mchakato wa CI/CD | Hiari |
| `.devcontainer/` | Mazingira ya maendeleo yanayorekebika | Hiari |
| `azure.yaml` `metadata` | Taarifa za maktaba + telemetry | Hiari (inahitajika kuchapisha) |

Hakuna uchawi hapa: unapoendesha `azd init --template you/your-repo`, azd hunakili repositori na kusoma `azure.yaml`.

---

## Hatua 1: Tengeneza Hifadhi ya Kiolezo

Unda muundo wa folda kwa mkono au anza na kiolezo kidogo na ukibadilishe:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Unda mpangilio wa kawaida
mkdir -p src infra
```

Mpangilio wa kawaida wa mwisho unaonyesha kama huu:

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

Hii ni moyo wa kiolezo. Inamwambia azd nini cha kutekeleza na jinsi:

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

> Sehemu ya `metadata.template` ndio telemetry ya maktaba inayotumia kuhesabu matumizi. Tumia muktadha wa `name@version`.

---

## Hatua 3: Weka Vigezo vya Miundombinu

Kanuni muhimu zaidi kwa kiolezo *kinachoweza kutumika tena*: **usihamasishe majina, mikoa, au thamani za usajili maalum.** Tumia vigezo na muundo wa tokeni ya rasilimali ili kiolezo kimoe kazi kwenye usajili wowote wa mtu yeyote.

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

Kitu kimoja kinachofanya kiolezo hiki kuwa rafiki kwa matumizi tena:

1. **lebo `azd-env-name`** — azd hutumia kufuatilia na kusafisha rasilimali kwa kila mazingira.
2. **tokeni ya rasilimali `uniqueString(...)`** — hutengeneza kiambishi thabiti na cha kipekee duniani ili majina yasigongane.

Toa faili za vigezo zinazolingana zinazosomeka thamani ambazo azd huingiza kutoka kwa mazingira:

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

azd huingiza `${AZURE_ENV_NAME}` na `${AZURE_LOCATION}` kutoka kwa mazingira ya sasa moja kwa moja.

---

## Hatua 4: Jaribu Kiolezo Chako Kwenye Kompyuta Yako

Kabla ya kushirikisha, thibitisha kiolezo kinafanya kazi kutoka hali safi.

**Jaribu kutoka kwenye folda ya ndani** (hakuna usukani wa Git unahitajika):

```bash
# Kutoka kwenye saraka tupu, anzisha kwa kutumia njia ya kiolezo chako cha eneo
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Toa huduma + tumia kutoka mwanzo hadi mwisho
azd auth login
azd up
```

**Kisha jaribu kutokomeza**—kiolezo kizuri husafisha kabisa:

```bash
azd down --force --purge
```

Ikiwa `azd down` inabaki na rasilimali, huenda ulikosa lebo ya `azd-env-name` kwenye rasilimali fulani.

> **Ushauri:** endesha `azd provision --preview` kwanza. Inafanya jaribio la “nini-kitakachotokea” na kuonyesha makosa ya kiolezo kabla rasilimali yoyote haijaundwa.

---

## Hatua 5: Chapisha Kiolezo

Sukuma hifadhi kwenye GitHub (kwa umma ikiwa unataka wengine waitumie):

```bash
gh repo create my-azd-template --public --source=. --push
```

Sasa mtu yeyote anaweza kuitumia:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Hatua 6 (Hiari): Wasilisha kwa Awesome AZD

[Maktaba ya Awesome AZD](https://azure.github.io/awesome-azd/) inaorodhesha viungo vya jamii. Ili kuorodheshwa, repositori yako inapaswa kujumuisha:

- ✅ `README.md` wazi yenye mahitaji, mchoro wa usanifu, na maelezo ya gharama
- ✅ `azure.yaml` inayoendeshwa yenye `metadata.template`
- ✅ Miundombinu inayounda kwa usafi kwenye usajili mpya
- ✅ Faili la `LICENSE`
- ✅ (Inashauriwa) `.devcontainer/` kwa Codespaces kwa bonyezo moja

Wasilishie kwa kufungua ombi la pull linaloongeza kiolezo chako kwenye faili la data la maktaba, ukiifuata mwongozo wa michango kwenye [repositori la Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Makosa ya Kawaida

| Makosa | Rekebisha |
|---------|-----------|
| Majina ya rasilimali yaliyowekwa moja kwa moja | Tumia tokeni ya rasilimali `uniqueString()` |
| `azd down` inaacha rasilimali | Leibisha kila rasilimali (au kikundi cha rasilimali) na `azd-env-name` |
| Kiolezo kinafanya kazi kwako, kinashindwa kwa wengine | Ondoa vitambulisho vya usajili, vitambulisho vya mtenzi, na dhana za mikoa |
| Matokeo hayajapo kwenye programu | Hamisha `SERVICE_<NAME>_ENDPOINT_URL` na matokeo mengine ya `AZURE_*` |
| Uwasilishaji wa maktaba umekataliwa | Ongeza `README.md`, `LICENSE`, na `metadata.template` |

---

## Muhtasari

- Kiolezo ni tu repositori ya Git yenye `azure.yaml`, `infra/`, na msimbo wako.
- Weka vigezo kila sehemu—majina, mikoa, na vitambulisho—ili kiende kote.
- Daima leba rasilimali na `azd-env-name` ili `azd down` ifanye kazi.
- Jaribu ndani kwa kutumia `azd init --template <local-path>` kabla ya kuchapisha.
- Ongeza metadata na README kuwasilisha kwa Awesome AZD.

---

## 🔗 Uelekezaji

| Mwelekeo | Rasilimali |
|-----------|----------|
| **Iliyopita** | [Mwongozo wa Utekelezaji](deployment-guide.md) |
| **Mwanzo wa Sura** | [Sura 4: Miundombinu kama Msimbo](README.md) |
| **Sura Ifuatayo** | [Sura 5: Suluhisho za Wakala Wengi](../chapter-05-multi-agent/README.md) |

## 📖 Rasilimali Zinazohusiana

- [Utoaji wa Rasilimali](provisioning.md)
- [Maktaba ya Awesome AZD](https://azure.github.io/awesome-azd/)
- [Nyaraka Rasmi za kiolezo cha azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
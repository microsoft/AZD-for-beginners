# Kuandika Kiolezo Chako cha azd

**Uelekezaji wa Sura:**
- **📚 Mwanzo wa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Hivi Sasa**: Sura 4 - Miundombinu kama Msimbo & Uwekaji wa Programu
- **⬅️ Iliyopita**: [Mwongozo wa Uwekaji Programu](deployment-guide.md)
- **🚀 Sura Ifuatayo**: [Sura 5: Suluhisho za Wakala Wengi](../chapter-05-multi-agent/README.md)

> Imeangaliwa dhidi ya `azd 1.37.2` (Novemba 2026). Huu ni **mweleleo wa kuandika kwa sehemu za faili**, si kiolezo kamili: lazima utoe msimbo wa programu na `modules/web.bicep` pamoja na mazingira yake, rejista, Container App, na matokeo kabla ya uwekaji. Usambazaji wa Azure haukufanyika katika ukaguzi huu.

## Utangulizi

Mpaka sasa umetumia *malaya* na `azd init --template <name>`. Lakini mara tu unapopata mpangilio wa mradi timu yako inapenda—sema, Container App na Cosmos DB na ufuatiliaji sahihi—utataka kuufanya kuwa kiolezo kinachoweza kutumika tena cha mwenyewe. Kiolezo ni tu hifadhidata ya Git yenye muundo unaoweza kutabirika ambayo azd inajua kusoma. Somo hili linaonyesha jinsi ya kutengeneza kutoka mwanzo, kuikagua, na (hiari) kuchapisha kwenye maktaba ya jumuiya.

## Malengo ya Kujifunza

Mwishoni mwa somo hili, utaweza:
- Elewa kinachofanya folda kuwa "kiolezo cha azd"
- Jua faili na mpangilio wa folda unaohitajika
- Ongeza `azure.yaml` na `infra/` ambazo watu wengine wanaweza kutumia tena
- Jaribu kiolezo chako kwa ndani kabla ya kushirikisha
- Chupia na (hiari) kitume kwenye Awesome AZD

## Matokeo ya Kujifunza

Baada ya kukamilisha somo hili, utaweza:
- Tengeneza hifadhidata mpya ya kiolezo
- Andaa miundombinu ili ifanye kazi katika usajili wowote
- Hakiki kiolezo kwa kutumia `azd init` na `azd up`
- Ongeza meta-data inayohitajika na maktaba ya jumuiya

---

## Kioleo ni Nini, Kweli?

Kiolezo cha azd ni **hifadhidata ya Git** inayojumuisha, angalau:

| Faili / folda | Kusudi | Inahitajika? |
|---------------|---------|-----------|
| `azure.yaml` | Inaelezea huduma, mwenyeji, na mtoa huduma wa miundombinu | ✅ Ndiyo |
| `infra/` | Maelezo ya maandalizi ya Bicep au Terraform | Inahitajika kwa mfano huu wa IaC wazi; miradi ya miundombinu inayotengenezwa inaweza kuiacha |
| `src/` (au msimbo wako) | Msimbo wa programu ambao azd huweka | Inahitajika kwa huduma zinazotegemea chanzo; sio violezo vyote vina msimbo wa programu |
| `README.md` | Jinsi ya kutumia kiolezo | ✅ Inapendekezwa sana |
| `.azdo/` au `.github/` | Maelezo ya mstari wa CI/CD | Hiari |
| `.devcontainer/` | Mazingira ya ukuzaji yanayoweza kuirudiwa | Hiari |
| `azure.yaml` `metadata` | Taarifa za utambulisho / telemetry ya kiolezo | Inapendekezwa; kuchapisha hifadhidata ya Git hakiitaji |

Hakuna uchawi hapa: unapochukua `azd init --template you/your-repo`, azd hufanya kloni ya repo na kusoma `azure.yaml`.

---

## Hatua ya 1: Tengeneza Hifadhidata

Unda muundo wa folda kwa mkono au anza na kiolezo kidogo na kuhariri:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Mpangilio wa kawaida wa mwisho unaonekana kama huu:

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

## Hatua ya 2: Andika `azure.yaml`

Hili ndilo moyo wa kiolezo. Linaambia azd nini kuweka na jinsi:

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

> Sehemu ya `metadata.template` ndilo telemetry ya maktaba inayo tumia kuhesabu matumizi. Tumia muktadha wa `name@version`.

---

## Hatua ya 3: Panga Miundombinu kwa Vigezo

Kanuni muhimu zaidi kwa kiolezo kinachoweza kutumika tena: **usihamasishe majina, maeneo, au thamani za usajili maalum kwa mkono.** Tumia vigezo na muundo wa tokeni ya rasilimali ili kiolezo kionekane kwa usajili wowote.

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

Mambo mawili hufanya kiolezo hiki kirafiki:

1. **lebo ya `azd-env-name`** — azd hutumia kufuatilia na kusafisha rasilimali kwa kila mazingira.
2. **tokeni ya rasilimali ya `uniqueString(...)`** — huunda kiambatanishi thabiti cha hash kupunguza mgongano; si dhamana ya umaalum wa dunia.

`modules/web.bicep` inakosekana lazima ikubali `name`, `location`, na `tags`, iandae mazingira / rejista ya Container Apps na programu, itambue programu yenye lebo ya `azd-service-name: web`, na ichapishe `uri`. Inapaswa pia kuonyesha thamani za rejista zinazohitajika na mtiririko ulioteuliwa wa ujenzi/uwekaji (kwa mfano `AZURE_CONTAINER_REGISTRY_ENDPOINT` kutoka moduli kuu). Matokeo ya kiungo pekee hayahusishi upatikanaji wa huduma, mipangilio ya programu, au uthibitishaji wa rejista.

Toa faili ya vigezo inayolingana inayosoma thamani ambazo azd huingiza kutoka mazingira:

Hifadhi yafuatayo kama `infra/main.parameters.json`:

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

azd huingiza `${AZURE_ENV_NAME}` na `${AZURE_LOCATION}` kutoka mazingira ya sasa moja kwa moja.

---

## Hatua ya 4: Jaribu Kiolezo Chako Kwenye Kompyuta Binafsi

Kabla ya kushirikisha, thibitisha kiolezo kinavyofanya kazi kutoka katika hali safi.

**Jaribu kutoka folda ya ndani** (hakuna Git pressi inahitajika):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Kisha jaribu kuvunja**—kiolezo kizuri husafisha kwa ukamilifu:

```bash
azd down --force --purge
```

Ikiwa `azd down` inaacha rasilimali nyuma, angalia ugunduzi wa mazingira / kikundi cha rasilimali, rasilimali za nje / zilizoshirikiwa, ruhusa, viwambo, na ulinzi wa usafishaji. `--purge` haifuti hali ya ndani ya `.azure/`.

> **Kidokezo:** baada ya kutoa faili zote zinazokosekana, endesha kwanza `azd provision --preview`. Kagua sehemu kabla ya onyesho kwa sababu zinaweza kutekeleza amri zenye athari za pembeni. Onyesho si makadirio ya gharama wala dhamana ya mafanikio ya usambazaji.

---

## Hatua ya 5: Chapisha Kiolezo

Sogeza hifadhidata kwenye GitHub (ya umma ikiwa unataka wengine waitumie):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Sasa mtu yeyote anaweza kuitumia:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Hatua ya 6 (Hiari): Tuma kwa Awesome AZD

Orodha ya [Koleksheni Bora ya AZD](https://azure.github.io/awesome-azd/) ina templati za jamii. Ili kuorodheshwa, repo yako inapaswa kujumuisha:

- ✅ `README.md` wazi yenye mahitaji ya awali, mchoro wa usanifu, na maelezo ya gharama
- ✅ `azure.yaml` inayoendeshwa yenye `metadata.template`
- ✅ Miundombinu inayotoa kwa usafi katika usajili mpya
- ✅ Faili la `LICENSE`
- ✅ (Inapendekezwa) `.devcontainer/` kwa Codespaces ya bofya moja

Tuma kwa kufungua pull request inayoongeza templeti yako kwenye faili la data la koleksheni, ukifuata mwongozo wa mchango katika [repo ya Bora ya AZD](https://github.com/Azure/awesome-azd).

---

## Makosa ya Kawaida

| Matatizo | Suluhisho |
|---------|-----|
| Majina ya rasilimali yaliyowekwa kwa nguvu | Tumia tokeni ya rasilimali ya `uniqueString()` |
| `azd down` hutoa rasilimali | Changanisha kila rasilimali (au kundi la rasilimali) na `azd-env-name` |
| Kiolezo kinafanya kazi kwako, kinashindwa kwa wengine | Ondoa vitambulisho vya usajili, vitambulisho vya mpangaji, na dhana za eneo |
| Matokeo hayajaunganishwa kwenye app | Linganisha `azd-service-name`/`resourceName` kwa ajili ya uenezaji na weka wazi matokeo kwenye mipangilio ya app |
| Uwasilishaji wa matunzio uliokataliwa | Ongeza `README.md`, `LICENSE`, na `metadata.template` |

---

## Muhtasari

- Kiolezo ni tu hifadhidata ya Git yenye `azure.yaml`, `infra/`, na msimbo wako.
- Panga kila kitu—majina, maeneo, na vitambulisho—ili kiweze kuendesha popote.
- Daima weka lebo rasilimali na `azd-env-name` ili `azd down` ifanye kazi.
- Jaribu kwa ndani kwa kutumia `azd init --template <local-path>` kabla ya kuchapisha.
- Ongeza metadata na README ili kuwasilisha kwa Awesome AZD.

---

## 🔗 Uongozi

| Mwelekeo | Rasilimali |
|-----------|----------|
| **Iliyotangulia** | [Mwongozo wa Utekelezaji](deployment-guide.md) |
| **Nyumbani kwa Sura** | [Sura ya 4: Miundombinu kama Msimbo](README.md) |
| **Sura Ifuatayo** | [Sura ya 5: Suluhisho za Wakala Wengi](../chapter-05-multi-agent/README.md) |

## 📖 Rasilimali Zinazohusiana

- [Utoaji wa Rasilimali](provisioning.md)
- [Maktaba ya Awesome AZD](https://azure.github.io/awesome-azd/)
- [Nyaraka rasmi za templeti za azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Leta Programu Yako - Ongeza azd kwa Mradi Umojawapo

**Uvinjari wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 1 - Msingi & Kuanza Haraka
- **⬅️ Iliyotangulia**: [Mradi Wako wa Kwanza](first-project.md)
- **➡️ Ifuatayo**: [Vifungashio vya Maendeleo & Codespaces](dev-containers.md)

> Lengo la ukaguzi wa amri na usanidi: `azd 1.37.2` (Novemba 2026). Faili zilizotengenezwa zinategemea programu iliyobainishwa; usambazaji wa Azure haukujumuishwa katika ukaguzi huu.

## Utangulizi

Katika [Mradi Wako wa Kwanza](first-project.md) uliwasilisha programu kwa kuanza kutoka kwenye kiolezo. Lakini mara nyingi tayari una *programu*—API ya Node.js, huduma ya Python Flask, programu ya wavuti ya .NET—ikiwa kwenye folda kwenye kompyuta yako. Somo hili linaonyesha jinsi ya kuongeza azd kwenye msimbo uliopo ili uweze kuuisambaza kwa kutumia `azd up`, haina haja ya kiolezo.

## Malengo ya Kujifunza

Mwisho wa somo hili, utakuwa na uwezo wa:
- Kuelewa njia tatu za kuanzisha mradi wa azd
- Kuwezesha `azd init` ndani ya msimbo uliopo
- Kuelewa kile `azure.yaml` na folda ya `infra/` hufanya kwa programu yako
- Kujua lini kumruhusu azd kutengeneza miundombinu au kuandika wewe mwenyewe
- Kusambaza programu yako iliyopo kwenye Azure kwa kutumia `azd up`

## Matokeo ya Kujifunza

Baada ya kumaliza somo hili, utaweza:
- Kuanza azd katika mradi uliyonayo tayari
- Kusoma na kuhariri faili msingi la `azure.yaml`
- Kutengeneza miundombinu ya mwanzo kwa kutumia `azd infra generate`
- Kuchagua mwenyeji wa Azure unaofaa kwa programu yako
- Kusambaza na kusafisha programu yako binafsi

---

## Njia Tatu za Kuanzisha Mradi wa azd

| Mahali pa kuanzia | Amri | Lini kutumia |
|----------------|---------|-------------|
| **Kutoka kwenye kiolezo** | `azd init --template <name> .` (folda tupu) | Kujifunza, au kuanza programu mpya kutoka mfano uliothibitishwa |
| **Kutoka kwenye msimbo wako uliopo** | `azd init` (katika folda ya mradi wako) | Tayari una programu na unataka kuisambaza |
| **Kutoka kwenye repo ya Git** | `azd init --from-code` (katika repo iliyochongwa) | Kukubali azd kwa hazina ya kuwepo |

Tayari umejaribu chaguo la kwanza. Somo hili linahusu la pili—hali ya kawaida kabisa katika maisha halisi.

---

## Hatua ya 1: Endesha `azd init` katika Mradi Wako

Fungua terminal **ndani ya folda ya mradi wako uliopo** na endesha:

```bash
cd my-existing-app
azd init
```

azd itauliza jinsi unavyotaka kuanzisha. Chagua:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Chagua **"Tumia msimbo ulioko katika saraka ya sasa."** azd kisha itachunguza folda yako, itagundua lugha na fremu yako, na kupendekeza mwenyeji.

### Kile azd kinachogundua

azd inatafuta ishara za programu kama `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, au `Dockerfile`. Mtiririko wa kutoka-msimbo si mchawi wa uchaguzi wa mwenyeji kwa kila lengo la usambazaji linaloungwa mkono:

| Programu yako | Mwenyeji kwa kawaida |
|----------|----------------------|
| Programu zinazoungwa mkono Node.js / Python / .NET za wavuti | Kawaida Azure Container Apps; angalia maelezo yaliyotengenezwa |
| Programu iliyohifadhiwa kwenye kontena (`Dockerfile`) | Azure Container Apps |
| Programu ya function au Mradi wa Static Web Apps | Tumia kiolezo kinacholingana au tengeneza `azure.yaml` na miundombinu ikiwa kutoka-msimbo hauna msaada kwa mpangilio wako |

Thibitisha huduma zilizotambulika, na azd itaandaa faili unazohitaji.

---

## Hatua ya 2: Elewa Kile azd Kimeumba

Baada ya kuanzisha, angalia `azure.yaml`. Mtiririko wa miundombinu uliotengenezwa unaweza kuweka miundombinu kuwa dhaifu mpaka utakapomshawishi `azd infra generate`; usifikirie `infra/` tayari ipo:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — maelezo ya mradi

Hii ni moyo wa mradi wa azd. Maelezo ya **App Service** yafuatayo yanahitaji miundombinu inayolingana ya App Service; sio sababu ya kubadilisha mwenyeji wa Container Apps ulioundwa bila kubadilisha miundombinu:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Sehemu ya `services` ni muhimu: kila kipengee kimeandikwa kuoanisha folda ya msimbo wako na mwenyeji wa Azure. Ikiwa programu yako ina mbele na API, utakuwa na huduma mbili.

### `infra/` — rasilimali zako za Azure kama msimbo

Folda ya `infra/` ina faili za Bicep ambazo zinaelezea rasilimali za Azure zinazohitajika na programu yako (Huduma ya Programu, msingi wa data, n.k.). Huna haja ya kuziandika kwa mkono—azd hutengeneza sehemu ya mwanzo inayofanya kazi. Una *weza* kuzihariri baadaye kuongeza rasilimali au kuongeza usalama (imeelezwa katika [Sura ya 4](../chapter-04-infrastructure/README.md)).

> **Kidokezo:** Unataka kuona au kubadilisha miundombinu iliyotengenezwa kabla ya kupeleka? Endesha `azd infra generate` (inapatikana pia kama `azd infra synth`) kuandika IaC kwenye diski ili uweze kuikagua na kudhibiti toleo lake.

---

## Hatua ya 3: Weka Mipangilio Inayohitajika

Ikiwa programu yako inahitaji mipangilio au siri (kamba ya muunganisho, ufunguo wa API), usiweke vikali. Tumia thamani za mazingira:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Hii inahifadhi thamani ya ndani pekee. Ili kuathiri programu, itumie waziwazi katika vigezo vya miundombinu, mipangilio ya huduma inayoungwa mkono, au hook; kuweka kigezo chochote bila mpangilio hauwezi kusanidi wakati wa utekelezaji uliowekwa.

Kwa siri halisi, zahirisha katika Key Vault na zitaje kutoka kwa miundombinu yako—ona [Sura ya 3: Mipangilio na Uthibitishaji](../chapter-03-configuration/authsecurity.md).

---

## Hatua ya 4: Weka Kazi

Sasa tumia mnada wa kazi ule ule unaoujua tayari:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Linapomalizika, azd itaonyesha URL ya programu yako. Thibitisha kwa njia ile ile kama programu yoyote ya azd:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Masuala Yanayojitokeza Mara ya Kwanza

| Dalili | Sababu Inayowezekana | Suluhisho |
|---------|--------------|-----|
| azd haikuweza kugundua programu yangu | Mlango wa maelezo haupo (km, `package.json`) | Ongeza mlango wa maelezo, au chagua mwenyeji kwa mkono wakati wa `azd init` |
| Ujenzi unashindwa wakati wa `azd up` | Programu inahitaji hatua ya ujenzi | Sanidi maandishi ya kifurushi cha programu au hook ya huduma `prepackage`; tumia `dist` kwa matokeo ya upeleka, si `buildCommand`/`outputPath` |
| App inaanza lakini inarudisha makosa | Kukosekana kwa config/secret | Tengeneza thamani kwa mipangilio ya runtime ya app au rejeleo la Key Vault; `azd env set` peke yake haitoshi |
| Mtandao mbaya umechaguliwa | Kugundua kiotomatiki hakuhusiani na mahitaji yako | Badilisha zote `host:` na miundombinu inayolingana, au chagua templeti inayofanana |

Kwa zaidi, angalia [Sura ya 7: Kutatua Matatizo](../chapter-07-troubleshooting/README.md).

---

## Safisha

```bash
azd down --force --purge
```

---

## Muhtasari

- `azd init` → **"Tumia msimbo katika saraka ya sasa"** inaongeza azd kwa app unayo tayari.
- `azure.yaml` inaweka ramani folda zako za msimbo kwa viongezi vya Azure; `infra/` inaelezea rasilimali kama Bicep.
- `azd infra generate` inakuwezesha kupitia au kubinafsisha miundombinu iliyotengenezwa.
- Mara ilipoanzishwa, app yako iliyopo hutumia mchakato mmoja wa `azd up` / `azd down` kama app ya msingi wa templeti.

---

## 🔗 Uelekezaji

| Mwelekeo | Somo |
|-----------|--------|
| **Iliyotangulia** | [Mradi Wako wa Kwanza](first-project.md) |
| **Inayofuata** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Rasilimali Zinazohusiana

- [Msingi wa AZD](azd-basics.md)
- [Sura 4: Miundombinu kama Msimbo](../chapter-04-infrastructure/README.md)
- [Masanidi na Uthibitishaji](../chapter-03-configuration/authsecurity.md)
- [Futa Amri](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
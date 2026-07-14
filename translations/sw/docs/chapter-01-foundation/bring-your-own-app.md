# Leta Programu Yako - Ongeza azd kwenye Mradi Uliopo

**Uvinjari wa Sura:**
- **📚 Mwanzo wa Kozi**: [AZD Kwa Wananchi](../../README.md)
- **📖 Sura ya Sasa**: Sura 1 - Msingi & Kuanzia Haraka
- **⬅️ Iliyotangulia**: [Mradi Wako wa Kwanza](first-project.md)
- **➡️ Ifuatayo**: [Makontena ya Maendeleo & Codespaces](dev-containers.md)

> Imethibitishwa dhidi ya `azd 1.27.1` Julai 2026.

## Utangulizi

Katika [Mradi Wako wa Kwanza](first-project.md) ulipeleka programu kwa kuanzia na kiolezo. Lakini mara nyingi tayari una programu—API ya Node.js, huduma ya Python Flask, programu ya wavuti ya .NET—iliyoko katika folda kwenye mashine yako. Somo hili linaonyesha jinsi ya kuongeza azd kwenye msimbo uliopo ili uweze kupeleka kwa kutumia `azd up`, bila kioo kinachohitajika.

## Malengo ya Kujifunza

Mwisho wa somo hili, utakuwa umeweza:
- Elewa njia tatu za kuanzisha mradi wa azd
- Endesha `azd init` ndani ya msimbo uliopo
- Elewa kinachofanywa na `azure.yaml` na folda ya `infra/` kwa programu yako
- Jua lini kumruhusu azd kuzalisha miundombinu na lini kuandika yako mwenyewe
- Tuma programu yako iliyopo kwenda Azure kwa kutumia `azd up`

## Matokeo ya Kujifunza

Baada ya kumaliza somo hili, utaweza:
- Anzisha azd katika mradi uliouwa tayari
- Soma na hariri faili rahisi la `azure.yaml`
- Toa miundombinu ya kuanzia na `azd infra generate`
- Chagua mwenyeji sahihi wa Azure kwa programu yako
- Tuma na safisha programu yako mwenyewe

---

## Njia Tatu za Kuanzisha Mradi wa azd

| Mahali pa kuanzia | Amri | Lini utumie |
|----------------|---------|-------------|
| **Kutoka kwenye kiolezo** | `azd init --template <name>` | Kujifunza, au kuanzisha programu mpya kutoka sampuli iliyothibitishwa |
| **Kutoka kwenye msimbo wako uliopo** | `azd init` (katika folda ya mradi wako) | Tayari una programu na unataka kupeleka |
| **Kutoka kwenye hifadhi ya Git** | `azd init --from-code` (katika hifadhi iliyokopiwa) | Kubadilisha azd kwa hifadhi iliyopo |

Tayari umejaribu njia ya kwanza. Somo hili linahusu ya pili—hali ya kawaida zaidi duniani halisi.

---

## Hatua ya 1: Endesha `azd init` Katika Mradi Wako

Fungua terminal **ndani ya folda ya mradi wako uliopo** kisha endesha:

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

Chagua **"Tumia msimbo uliopo katika saraka hii."** azd kisha utachambua folda yako, utambue lugha yako na mfumo, na kupendekeza mwenyeji.

### Kile azd kinachotambua

azd hutafuta ishara kama `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, au `Dockerfile`, na kupendekeza mwenyeji wa Azure unaofanana:

| Programu yako | Mwenyeji aliyeonekana |
|----------|----------------------|
| Node.js / Python / programu ya wavuti ya .NET | Azure App Service au Container Apps |
| Programu iliyofungashwa (`Dockerfile`) | Azure Container Apps |
| Programu ya Function | Azure Functions |
| Tovuti imara (matokeo ya kujenga React/Vue) | Azure Static Web Apps |

Thibitisha huduma zilizotambuliwa, azd itatengeneza faili unazohitaji.

---

## Hatua ya 2: Elewa Kile azd Kilichotengeneza

Baada ya init, utakuwa na vitu viwili vipya kwenye mradi wako:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — ufafanuzi wa mradi

Hiki ndicho moyo wa mradi wa azd. Mfupi unaonekana hivi:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Sehemu ya `services` ni muhimu: kila kipengee kinaunganisha saraka ya msimbo wako na mwenyeji wa Azure. Ikiwa programu yako ina sehemu ya mbele na API, utakuwa na huduma mbili.

### `infra/` — rasilimali zako za Azure kama msimbo

Folda ya `infra/` ina faili za Bicep zinazobainisha rasilimali za Azure ambazo programu yako inahitaji (App Service, hifadhidata, nk). Huhitaji kuziandika kwa mkono—azd hutengeneza mwanzo unaofanya kazi. Unaweza kuzihariri baadaye kuongeza rasilimali au kuongeza usalama (imeelezwa katika [Sura 4](../chapter-04-infrastructure/README.md)).

> **Vidokezo:** Unataka kuona au kubinafsisha miundombinu iliyotengenezwa kabla ya kupeleka? Endesha `azd infra generate` (inapatikana pia kama `azd infra synth`) ili kuandika IaC kwenye diski kwa ajili ya mapitio na udhibiti wa matoleo.

---

## Hatua ya 3: Weka Usanidi unaohitajika

Ikiwa programu yako inahitaji mipangilio au siri (mkuu wa muunganisho, kitufe cha API), usiingize moja kwa moja. Tumia thamani za mazingira:

```bash
# Unda mazingira
azd env new dev

# Weka thamani isiyo ya siri
azd env set API_VERSION 1.0.0
```

Kwa siri halisi, zihifadhi Key Vault na zirejelee kutoka kwa miundombinu yako—angalia [Sura 3: Usanidi na Uthibitishaji](../chapter-03-configuration/authsecurity.md).

---

## Hatua ya 4: Tuma

Sasa tumia mtiririko wa kazi uleule unaoujua tayari:

```bash
# Thibitisha (inahitajika kwa azd)
azd auth login

# Angalia rasilimali zitakazoundwa
azd provision --preview

# Toa miundombinu na wapeleke msimbo wako
azd up
```

Itakapokamilika, azd itachapisha URL ya programu yako. Thibitisha kwa njia ile ile kama programu yoyote ya azd:

```bash
azd show           # onyesha vituo vya mwisho
azd monitor --logs # angalia kumbukumbu ikiwa inahitajika
```

---

## Masuala ya Kwanza Mara ya Kwanza

| Dalili | Sababu Inayowezekana | Marekebisho |
|---------|--------------|-----|
| azd haikutambua programu yangu | Manifesto haipo (k.m., `package.json`) | Ongeza manifesto, au chagua mwenyeji kwa mkono wakati wa `azd init` |
| Ujenzi unashindwa wakati wa `azd up` | Programu inahitaji hatua ya ujenzi | Ongeza `buildCommand`/`outputPath` chini ya huduma katika `azure.yaml` |
| Programu inaanza lakini inarudisha makosa | Ukosefu wa usanidi/siri | Weka thamani kwa `azd env set` au ungana na Key Vault |
| Mwenyeji si sahihi | Ujitambuzi wa moja kwa moja umekisia | Hariri `host:` katika `azure.yaml` na endesha tena `azd up` |

Kwa zaidi, tazama [Sura 7: Utatuzi wa Matatizo](../chapter-07-troubleshooting/README.md).

---

## Safisha

```bash
azd down --force --purge
```

---

## Muhtasari

- `azd init` → **"Tumia msimbo uliopo katika saraka hii"** huongeza azd kwenye programu uliyonayo tayari.
- `azure.yaml` huunganisha folda zako za msimbo na wenyeji wa Azure; `infra/` hufafanua rasilimali kama Bicep.
- `azd infra generate` hukuruhusu kupitia au kubinafsisha miundombinu iliyotengenezwa.
- Baada ya kuanzishwa, programu yako iliyopo hutumia mtiririko sawa wa `azd up` / `azd down` kama programu inayotegemea kiolezo.

---

## 🔗 Uvinjari

| Mwelekeo | Somo |
|-----------|--------|
| **Iliyotangulia** | [Mradi Wako wa Kwanza](first-project.md) |
| **Ifuatayo** | [Makontena ya Maendeleo & Codespaces](dev-containers.md) |

## 📖 Rasilimali Zinazohusiana

- [Msingi wa AZD](azd-basics.md)
- [Sura 4: Miundombinu kama Msimbo](../chapter-04-infrastructure/README.md)
- [Usanidi & Uthibitishaji](../chapter-03-configuration/authsecurity.md)
- [Karatasi ya Amri](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
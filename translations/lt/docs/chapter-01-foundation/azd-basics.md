# AZD Basics - Understanding Azure Developer CLI

# AZD Basics - Core Concepts and Fundamentals

**Chapter Navigation:**
- **📚 Course Home**: [AZD Pradedantiesiems](../../README.md)
- **📖 Current Chapter**: 1 skyrius - Pagrindai ir Greitas Startas
- **⬅️ Previous**: [Kurso apžvalga](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Next**: [Diegimas ir sąranka](installation.md)
- **🚀 Next Chapter**: [2 skyrius: AI-pirmoji plėtra](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Įvadas

Ši pamoka supažindina jus su Azure Developer CLI (azd) — galingu komandų eilutės įrankiu, kuris pagreitina jūsų kelią nuo vietinio vystymo iki diegimo Azure. Sužinosite pagrindines sąvokas, pagrindines funkcijas ir suprasite, kaip azd supaprastina debesų natūralių programų diegimą.

## Mokymosi tikslai

Baigę šią pamoką jūs:
- Suprasite, kas yra Azure Developer CLI ir koks jo pagrindinis tikslas
- Išmoksite pagrindines sąvokas: šablonai, aplinkos ir paslaugos
- Išnagrinėsite svarbias funkcijas, įskaitant šablonais grindžiamą vystymą ir Infrastruktūrą kaip kodą
- Suprasite azd projekto struktūrą ir darbo eigą
- Būsite pasirengę įdiegti ir konfigūruoti azd savo vystymo aplinkai

## Mokymosi rezultatai

Įveikę šią pamoką galėsite:
- Paaiškinti azd vaidmenį moderniuose debesų plėtros darbo srautuose
- Nustatyti azd projekto struktūros komponentus
- Apibūdinti, kaip kartu veikia šablonai, aplinkos ir paslaugos
- Suprasti Infrastruktūros kaip kodo privalumus naudojant azd
- Atpažinti skirtingas azd komandas ir jų paskirtį

## Kas yra Azure Developer CLI (azd)?

Azure Developer CLI (azd) yra komandų eilutės įrankis, sukurtas pagreitinti jūsų kelią nuo vietinio vystymo iki diegimo Azure. Jis supaprastina debesų natūralių programų kūrimo, diegimo ir valdymo procesą Azure.

### Ką galite diegti su azd?

azd palaiko įvairias darbo krūvio rūšis — ir sąrašas nuolat auga. Šiandien su azd galite diegti:

| Workload Type | Examples | Same Workflow? |
|---------------|----------|----------------|
| **Tradiciškai programos** | Tinklalapiai, REST API, statinės svetainės | ✅ `azd up` |
| **Paslaugos ir mikroservisai** | Container Apps, Function Apps, daugiaservisės backend sistemos | ✅ `azd up` |
| **Dirbtinio intelekto valdomos programos** | Pokalbių programos su Microsoft Foundry modeliais, RAG sprendimai su AI Search | ✅ `azd up` |
| **Intelegentiniai agentai** | Foundry talpinami agentai, multi-agentų orkestracijos | ✅ `azd up` |

Pagrindinė įžvalga yra ta, kad **azd gyvavimo ciklas išlieka toks pats nepaisant to, ką diegiate**. Jūs inicijuojate projektą, parengiama infrastruktūra, diegiate savo kodą, stebite programą ir išvalote — nesvarbu, ar tai paprastas tinklalapis, ar sudėtingas DI agentas.

Tai padaryta sąmoningai. azd traktuoja DI galimybes kaip dar vieną paslaugos tipą, kurį jūsų programa gali naudoti, o ne kaip kažką visiškai kitokio. Pokalbių galinis taškas, palaikomas Microsoft Foundry modelių, iš azd perspektyvos yra tiesiog dar viena paslauga, kurią reikia konfigūruoti ir diegti.

### 🎯 Kodėl naudoti AZD? Palyginimas iš realaus pasaulio

Palyginkime paprasto tinklalapio su duomenų baze diegimą:

#### ❌ BE AZD: Rankinis Azure diegimas (30+ minučių)

```bash
# 1 žingsnis: sukurti resursų grupę
az group create --name myapp-rg --location eastus

# 2 žingsnis: sukurti App Service planą
az appservice plan create --name myapp-plan \
  --resource-group myapp-rg \
  --sku B1 --is-linux

# 3 žingsnis: sukurti Web App
az webapp create --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --plan myapp-plan \
  --runtime "NODE:18-lts"

# 4 žingsnis: sukurti Cosmos DB paskyrą (10–15 minučių)
az cosmosdb create --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --kind MongoDB

# 5 žingsnis: sukurti duomenų bazę
az cosmosdb mongodb database create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --name tododb

# 6 žingsnis: sukurti kolekciją
az cosmosdb mongodb collection create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --database-name tododb \
  --name todos

# 7 žingsnis: gauti prisijungimo eilutę
CONN_STR=$(az cosmosdb keys list \
  --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --type connection-strings \
  --query "connectionStrings[0].connectionString" -o tsv)

# 8 žingsnis: sukonfigūruoti programos nustatymus
az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings MONGODB_URI="$CONN_STR"

# 9 žingsnis: įjungti žurnalavimą
az webapp log config --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --application-logging filesystem \
  --detailed-error-messages true

# 10 žingsnis: nustatyti Application Insights
az monitor app-insights component create \
  --app myapp-insights \
  --location eastus \
  --resource-group myapp-rg

# 11 žingsnis: susieti App Insights su Web App
INSTRUMENTATION_KEY=$(az monitor app-insights component show \
  --app myapp-insights \
  --resource-group myapp-rg \
  --query "instrumentationKey" -o tsv)

az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings APPINSIGHTS_INSTRUMENTATIONKEY="$INSTRUMENTATION_KEY"

# 12 žingsnis: sukurti programą lokaliai
npm install
npm run build

# 13 žingsnis: sukurti diegimo paketą
zip -r app.zip . -x "*.git*" "node_modules/*"

# 14 žingsnis: įdiegti programą
az webapp deployment source config-zip \
  --resource-group myapp-rg \
  --name myapp-web-unique123 \
  --src app.zip

# 15 žingsnis: palaukite ir melskitės, kad tai veiktų 🙏
# (Automatinio patikrinimo nėra, reikalingas rankinis testavimas)
```

**Problemos:**
- ❌ 15+ komandų, kurias reikia prisiminti ir vykdyti tinkama tvarka
- ❌ 30–45 minučių rankinio darbo
- ❌ Lengva padaryti klaidų (rašybos klaidos, neteisingi parametrai)
- ❌ Ryšio eilutės atskleistos terminalo istorijoje
- ❌ Nėra automatinio atsitraukimo, jei kažkas nepavyksta
- ❌ Sunku atkartoti kitiems komandos nariams
- ❌ Kaskart skiriasi (nereprodukuojama)

#### ✅ SU AZD: Automatinis diegimas (5 komandos, 10–15 minučių)

```bash
# Žingsnis 1: Inicializuokite iš šablono
azd init --template todo-nodejs-mongo

# Žingsnis 2: Autentifikuokitės
azd auth login

# Žingsnis 3: Sukurkite aplinką
azd env new dev

# Žingsnis 4: Peržiūrėkite pakeitimus (nebūtina, bet rekomenduojama)
azd provision --preview

# Žingsnis 5: Įdiekite viską
azd up

# ✨ Atlikta! Viskas įdiegta, sukonfigūruota ir stebima
```

**Privalumai:**
- ✅ **5 komandos** prieš 15+ rankinių žingsnių
- ✅ **10–15 minučių** bendras laikas (daugiausia laukimas Azure)
- ✅ **Jokių klaidų** - automatizuota ir išbandyta
- ✅ **Slaptažodžiai saugiai valdomi** per Key Vault
- ✅ **Automatinis atsitraukimas** gedimų atveju
- ✅ **Pilnai reprodukuojama** - tas pats rezultatas kiekvieną kartą
- ✅ **Paruošta komandai** - bet kas gali atlikti diegimą su tomis pačiomis komandomis
- ✅ **Infrastruktūra kaip kodas** - versijomis kontroliuojami Bicep šablonai
- ✅ **Įmontuotas stebėjimas** - Application Insights konfigūruojamas automatiškai

### 📊 Laiko ir klaidų sumažinimas

| Metric | Manual Deployment | AZD Deployment | Improvement |
|:-------|:------------------|:---------------|:------------|
| **Komandos** | 15+ | 5 | 67% mažiau |
| **Laikas** | 30–45 min | 10–15 min | 60% greičiau |
| **Klaidų dažnis** | ~40% | <5% | 88% sumažėjimas |
| **Nuoseklumas** | Mažas (rankinis) | 100% (automatizuotas) | Tobulas |
| **Komandos įvedimas** | 2–4 valandos | 30 minučių | 75% greičiau |
| **Atsitraukimo laikas** | 30+ min (rankinis) | 2 min (automatizuotas) | 93% greičiau |

## Pagrindinės sąvokos

### Šablonai
Šablonai yra azd pagrindas. Jie talpina:
- **Programos kodas** - Jūsų šaltinio kodas ir priklausomybės
- **Infrastruktūros apibrėžimai** - Azure ištekliai aprašyti Bicep ar Terraform
- **Konfigūracijos failai** - Nustatymai ir aplinkos kintamieji
- **Diegimo skriptai** - Automatizuoti diegimo darbo srautai

### Aplinkos
Aplinkos reprezentuoja skirtingus diegimo tikslus:
- **Development** - Testavimui ir vystymui
- **Staging** - Prieprodukcijos aplinka
- **Production** - Veikianti gamybinė aplinka

Kiekviena aplinka palaiko savo:
- Azure išteklių grupę
- Konfigūracijos nustatymus
- Diegimo būseną

### Paslaugos
Paslaugos yra jūsų programos statybiniai blokai:
- **Frontend** - Tinklapių programos, SPA
- **Backend** - API, mikroservisai
- **Duomenų bazė** - Duomenų saugojimo sprendimai
- **Saugykla** - Failų ir blob saugykla

## Pagrindinės funkcijos

### 1. Šablonais grindžiamas vystymas
```bash
# Peržiūrėti turimus šablonus
azd template list

# Pradėti nuo šablono
azd init --template <template-name>
```

### 2. Infrastruktūra kaip kodas
- **Bicep** - Azure domenui specifinė kalba
- **Terraform** - Daugiadebesų infrastruktūros įrankis
- **ARM Templates** - Azure Resource Manager šablonai

### 3. Integruoti darbo srautai
```bash
# Pilnas diegimo procesas
azd up            # Paruošimas + Diegimas — skirtas pirmam nustatymui be rankinio įsikišimo

# 🧪 NAUJA: Peržiūrėkite infrastruktūros pakeitimus prieš diegimą (SAUGU)
azd provision --preview    # Simuliuokite infrastruktūros diegimą nepadarydami pakeitimų

azd provision     # Sukurti Azure išteklius — jei atnaujinote infrastruktūrą, naudokite tai
azd deploy        # Įdiekite programos kodą arba perdiekite jį po atnaujinimo
azd down          # Išvalyti išteklius
```

#### 🛡️ Saugus infrastruktūros planavimas su peržiūra
Komanda `azd provision --preview` yra žaidimo keitėjas saugiems diegimams:
- **Sausas bandymas** - Parodo, kas bus sukurta, pakeista ar ištrinta
- **Nulinė rizika** - Jokių realių pakeitimų nebus atlikta jūsų Azure aplinkoje
- **Komandos bendradarbiavimas** - Dalinkitės peržiūros rezultatais prieš diegdami
- **Kainos įvertinimas** - Supraskite išteklių kaštus prieš įsipareigojant

```bash
# Pavyzdinis peržiūros darbo eiga
azd provision --preview           # Peržiūrėkite, kas pasikeis
# Peržiūrėkite rezultatus, aptarkite su komanda
azd provision                     # Taikykite pakeitimus užtikrintai
```

### 📊 Vizualizacija: AZD vystymo darbo eiga

```mermaid
graph LR
    A[azd init] -->|Inicializuoti projektą| B[azd auth login]
    B -->|Autentifikuoti| C[azd env new]
    C -->|Sukurti aplinką| D{Pirmasis diegimas?}
    D -->|Taip| E[azd up]
    D -->|Ne| F[azd provision --preview]
    F -->|Peržiūrėti pakeitimus| G[azd provision]
    E -->|Paruošia ir diegia| H[Veikiantys resursai]
    G -->|Atnaujina infrastruktūrą| H
    H -->|Stebėti| I[azd monitor]
    I -->|Atlikti kodo pakeitimus| J[azd deploy]
    J -->|Perdiegti tik kodą| H
    H -->|Išvalyti| K[azd down]
    
    style A fill:#e1f5fe
    style E fill:#c8e6c9
    style F fill:#fff9c4
    style H fill:#c5e1a5
    style K fill:#ffcdd2
```
**Darbo eigos paaiškinimas:**
1. **Init** - Pradėkite nuo šablono arba naujo projekto
2. **Auth** - Autentifikuokitės su Azure
3. **Environment** - Sukurkite izoliuotą diegimo aplinką
4. **Preview** - 🆕 Visada pirmiausia peržiūrėkite infrastruktūros pakeitimus (saugi praktika)
5. **Provision** - Sukurkite/atnaujinkite Azure išteklius
6. **Deploy** - Įkelkite savo programos kodą
7. **Monitor** - Stebėkite programos našumą
8. **Iterate** - Atlikite pakeitimus ir iš naujo diegkite kodą
9. **Cleanup** - Pašalinkite išteklius, kai baigta

### 4. Aplinkų valdymas
```bash
# Kurti ir valdyti aplinkas
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

### 5. Priedai ir DI komandos

azd naudoja priedų sistemą, kad pridėtų galimybes už pagrindinio CLI ribų. Tai ypač naudinga DI darbo krūviams:

```bash
# Rodyti prieinamus plėtinius
azd extension list

# Įdiegti Foundry agentų plėtinį
azd extension install azure.ai.agents

# Inicializuoti dirbtinio intelekto agento projektą iš manifesto
azd ai agent init -m agent-manifest.yaml

# Paleisti MCP serverį dirbtinio intelekto pagalba vykstančiam kūrimui (alfa)
azd mcp start
```

> Priedai išsamiai aptariami [2 skyriuje: AI-pirmoji plėtra](../chapter-02-ai-development/agents.md) ir [AZD AI CLI komandų](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) nuorodoje.

## 📁 Projekto struktūra

Tipinė azd projekto struktūra:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Konfigūracijos failai

### azure.yaml
Pagrindinis projekto konfigūracijos failas:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Aplinkai specifinė konfigūracija:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Bendri darbo srautai su praktinėmis užduotimis

> **💡 Mokymosi patarimas:** Atliekite šias užduotis eilės tvarka, kad palaipsniui ugdytumėte savo AZD įgūdžius.

### 🎯 Užduotis 1: Inicijuokite savo pirmą projektą

**Tikslas:** Sukurti AZD projektą ir ištirti jo struktūrą

**Žingsniai:**
```bash
# Naudokite patikrintą šabloną
azd init --template todo-nodejs-mongo

# Peržiūrėkite sugeneruotus failus
ls -la  # Peržiūrėkite visus failus, įskaitant paslėptus

# Sukurti pagrindiniai failai:
# - azure.yaml (pagrindinė konfigūracija)
# - infra/ (infrastruktūros kodas)
# - src/ (programos kodas)
```

**✅ Sėkmė:** Jūs turite azure.yaml, infra/ ir src/ katalogus

---

### 🎯 Užduotis 2: Diegimas į Azure

**Tikslas:** Vykdyti visą diegimo procesą nuo pradžios iki pabaigos

**Žingsniai:**
```bash
# 1. Autentifikuoti
az login && azd auth login

# 2. Sukurti aplinką
azd env new dev
azd env set AZURE_LOCATION eastus

# 3. Peržiūrėti pakeitimus (REKOMENDUOJAMA)
azd provision --preview

# 4. Diegti viską
azd up

# 5. Patikrinti diegimą
azd show    # Peržiūrėkite savo programos URL
```

**Numatomas laikas:** 10–15 minučių  
**✅ Sėkmė:** Programos URL atsidaro naršyklėje

---

### 🎯 Užduotis 3: Kelios aplinkos

**Tikslas:** Diegti į dev ir staging aplinkas

**Žingsniai:**
```bash
# Dev jau yra, sukurkite staging
azd env new staging
azd env set AZURE_LOCATION westus2
azd up

# Perjunkite tarp jų
azd env list
azd env select dev
```

**✅ Sėkmė:** Dvi atskiros išteklių grupės Azure portale

---

### 🛡️ Švarus startas: `azd down --force --purge`

Kai reikia visiškai atstatyti:

```bash
azd down --force --purge
```

**Ką tai daro:**
- `--force`: Nėra patvirtinimo raginimų
- `--purge`: Ištrina visą vietinę būseną ir Azure išteklius

**Naudokite, kai:**
- Diegimas nutrūko viduryje
- Keičiate projektus
- Reikia visiškai švarios pradžios

---

## 🎪 Originali darbo eigos nuoroda

### Naujų projektų pradžia
```bash
# Metodas 1: Naudoti esamą šabloną
azd init --template todo-nodejs-mongo

# Metodas 2: Pradėti nuo nulio
azd init

# Metodas 3: Naudoti dabartinį katalogą
azd init .
```

### Vystymo ciklas
```bash
# Paruošti kūrimo aplinką
azd auth login
azd env new dev
azd env select dev

# Įdiegti viską
azd up

# Atlikti pakeitimus ir įdiegti iš naujo
azd deploy

# Išvalyti po darbo
azd down --force --purge # komanda Azure Developer CLI yra jūsų aplinkos **visiškas atstatymas**—ypač naudinga, kai sprendžiate nesėkmingus diegimus, išvalote paliktus išteklius arba ruošiatės švariam pakartotiniam diegimui.
```

## Supratimas `azd down --force --purge`
Komanda `azd down --force --purge` yra galingas būdas visiškai sunaikinti jūsų azd aplinką ir visus susijusius išteklius. Čia pateikiamas kiekvieno parametro paaiškinimas:
```
--force
```
- Praleidžia patvirtinimo raginimus.
- Naudinga automatizacijai ar skriptams, kur rankinis įvedimas nėra įmanomas.
- Užtikrina, kad išmontavimas vyktų be nutraukimų, net jei CLI aptinka neatitikimus.

```
--purge
```
Ištrina **visus susijusius metaduomenis**, įskaitant:
Aplinkos būseną
Vietinį `.azure` katalogą
Talpinamą diegimo informaciją
Neleidžia azd „prisiminti“ ankstesnių diegimų, kas gali sukelti problemas, pvz., nesuderintas išteklių grupes ar pasenusios registro nuorodas.


### Kodėl naudoti abu?
Kai `azd up` stringa dėl likusios būsenos ar dalinių diegimų, šis derinys užtikrina **švarią pradžią**.

Tai ypač naudinga po rankinio išteklių ištrynimo Azure portale arba keičiant šablonus, aplinkas ar išteklių grupių pavadinimų konvencijas.


### Daugelio aplinkų valdymas
```bash
# Sukurti parengimo (staging) aplinką
azd env new staging
azd env select staging
azd up

# Grįžti į dev
azd env select dev

# Palyginti aplinkas
azd env list
```

## 🔐 Autentifikacija ir kredencialai

Autentifikacijos supratimas yra būtinas sėkmingiems azd diegimams. Azure naudoja kelis autentifikacijos metodus, o azd išnaudoja tą pačią kredencialų grandinę, kurią naudoja kiti Azure įrankiai.

### Azure CLI autentifikacija (`az login`)

Prieš pradėdami naudoti azd, turite autentifikuotis su Azure. Dažniausias metodas yra naudoti Azure CLI:

```bash
# Interaktyvus prisijungimas (atidaro naršyklę)
az login

# Prisijungti su konkrečiu nuomininku
az login --tenant <tenant-id>

# Prisijungti naudojant tarnybinį principalą
az login --service-principal -u <app-id> -p <password> --tenant <tenant-id>

# Patikrinti dabartinę prisijungimo būseną
az account show

# Išvardinti prieinamas prenumeratas
az account list --output table

# Nustatyti numatytąją prenumeratą
az account set --subscription <subscription-id>
```

### Autentifikacijos srautas
1. **Interaktyvus prisijungimas**: Atveriamas numatytasis naršyklės langas autentifikacijai
2. **Device Code Flow**: Skirta aplinkoms be naršyklės prieigos
3. **Service Principal**: Automatizacijos ir CI/CD scenarijams
4. **Managed Identity**: Azure talpinamoms programoms

### DefaultAzureCredential grandinė

`DefaultAzureCredential` yra kredencialų tipas, kuris supaprastina autentifikaciją bandydamas kelis kredencialų šaltinius tam tikra tvarka:

#### Kredencialų grandinės tvarka
```mermaid
graph TD
    A[Numatytasis Azure kredencialas] --> B[Aplinkos kintamieji]
    B --> C[Darbo krūvio tapatybė]
    C --> D[Valdoma tapatybė]
    D --> E[Visual Studio]
    E --> F[Visual Studio Code]
    F --> G[Azure komandų eilutė (CLI)]
    G --> H[Azure PowerShell]
    H --> I[Interaktyvi naršyklė]
```
#### 1. Aplinkos kintamieji
```bash
# Nustatyti aplinkos kintamuosius serviso principalui
export AZURE_CLIENT_ID="<app-id>"
export AZURE_CLIENT_SECRET="<password>"
export AZURE_TENANT_ID="<tenant-id>"
```

#### 2. Workload Identity (Kubernetes/GitHub Actions)
Naudojama automatiškai:
- Azure Kubernetes Service (AKS) su Workload Identity
- GitHub Actions su OIDC federacija
- Kitais federuotų tapatybių scenarijais

#### 3. Managed Identity
Skirta Azure ištekliams, tokiems kaip:
- Virtualios mašinos
- App Service
- Azure Functions
- Container Instances

```bash
# Patikrinti, ar vykdoma Azure resurse su valdomu identitetu
az account show --query "user.type" --output tsv
# Grąžina: "servicePrincipal" jei naudojamas valdomas identitetas
```

#### 4. Integracija su kūrėjų įrankiais
- **Visual Studio**: Automatiškai naudoja prisijungusią paskyrą
- **VS Code**: Naudoja Azure Account plėtinio kredencialus
- **Azure CLI**: Naudoja `az login` kredencialus (dažniausiai vietiniam vystymui)

### AZD autentifikacijos sąranka

```bash
# Metodas 1: Naudokite Azure CLI (rekomenduojama kūrimo metu)
az login
azd auth login  # Naudoja esamus Azure CLI prisijungimo duomenis

# Metodas 2: Tiesioginė azd autentifikacija
azd auth login --use-device-code  # Skirta aplinkoms be grafinės sąsajos

# Patikrinkite autentifikacijos būseną
azd auth login --check-status

# Metodas 4: Atsijunkite ir prisijunkite iš naujo
azd auth logout
azd auth login
```

### Autentifikacijos gerosios praktikos

#### Vietiniam vystymui
```bash
# 1. Prisijunkite naudodami Azure CLI
az login

# 2. Patikrinkite, ar pasirinkta teisinga prenumerata
az account show
az account set --subscription "Your Subscription Name"

# 3. Naudokite azd su esamais kredencialais
azd auth login
```

#### CI/CD kanalui
```yaml
# GitHub Actions example
- name: Azure Login
  uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}

- name: Deploy with azd
  run: |
    azd auth login --client-id ${{ secrets.AZURE_CLIENT_ID }} \
                    --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
                    --tenant-id ${{ secrets.AZURE_TENANT_ID }}
    azd up --no-prompt
```

#### Gamybinėms aplinkoms
- Naudokite **Managed Identity** vykdant ant Azure išteklių
- Naudokite **Service Principal** automatizacijos scenarijams
- Venkite kredencialų saugojimo kode ar konfigūracijos failuose
- Naudokite **Azure Key Vault** jautriai konfigūracijai

### Dažnos autentifikacijos problemos ir sprendimai

#### Problema: "No subscription found"
```bash
# Sprendimas: Nustatyti numatytąją prenumeratą
az account list --output table
az account set --subscription "<subscription-id>"
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"
```

#### Problema: "Insufficient permissions"
```bash
# Sprendimas: patikrinkite ir priskirkite reikiamus vaidmenis
az role assignment list --assignee $(az account show --query user.name --output tsv)

# Dažniausiai reikalingi vaidmenys:
# - Contributor (resursų valdymui)
# - User Access Administrator (vaidmenų priskyrimams)
```

#### Problema: "Token expired"
```bash
# Sprendimas: Prisijunkite iš naujo
az logout
az login
azd auth logout
azd auth login
```

### Autentifikacija skirtinguose scenarijuose

#### Vietinis vystymas
```bash
# Asmeninio tobulėjimo paskyra
az login
azd auth login
```

#### Komandinė plėtra
```bash
# Naudokite konkretų nuomininką organizacijai
az login --tenant contoso.onmicrosoft.com
azd auth login
```

#### Multi-nuomininkų scenarijai
```bash
# Perjungti tarp nuomininkų
az login --tenant tenant1.onmicrosoft.com
# Diegti nuomininkui 1
azd up

az login --tenant tenant2.onmicrosoft.com  
# Diegti nuomininkui 2
azd up
```

### Saugumo svarstymai
1. **Kredencialų saugojimas**: Niekuomet nesaugokite prisijungimo duomenų šaltinio kode
2. **Srities apribojimas**: Naudokite mažiausių teisių principą paslaugų paskyroms
3. **Žetonų rotacija**: Periodiškai keiskite paslaugų paskyrų slaptažodžius
4. **Audito pėdsakas**: Stebėkite autentifikavimo ir diegimo veiklą
5. **Tinklo saugumas**: Kai įmanoma, naudokite privačius galinius taškus

### Autentifikacijos trikčių šalinimas

```bash
# Derinti autentifikavimo problemas
azd auth login --check-status
az account show
az account get-access-token

# Dažnos diagnostikos komandos
whoami                          # Dabartinis vartotojo kontekstas
az ad signed-in-user show      # Azure AD vartotojo duomenys
az group list                  # Patikrinti prieigą prie išteklių
```

## Supratimas apie `azd down --force --purge`

### Aptikimas
```bash
azd template list              # Naršyti šablonus
azd template show <template>   # Šablono detalės
azd init --help               # Inicializavimo parinktys
```

### Projekto valdymas
```bash
azd show                     # Projekto apžvalga
azd env show                 # Dabartinė aplinka
azd config list             # Konfigūracijos nustatymai
```

### Monitoravimas
```bash
azd monitor                  # Atidaryti Azure portalo stebėjimą
azd monitor --logs           # Peržiūrėti programos žurnalus
azd monitor --live           # Peržiūrėti tiesiogines metrikas
azd pipeline config          # Nustatyti CI/CD
```

## Geriausios praktikos

### 1. Naudokite prasmingus pavadinimus
```bash
# Gerai
azd env new production-east
azd init --template web-app-secure

# Venkite
azd env new env1
azd init --template template1
```

### 2. Naudokitės šablonais
- Pradėkite nuo esamų šablonų
- Priderinkite prie savo poreikių
- Sukurkite daugkartinio naudojimo šablonus savo organizacijai

### 3. Aplinkos izoliacija
- Naudokite atskiras aplinkas dev/staging/prod
- Niekada nediekite tiesiogiai į gamybą iš vietinio kompiuterio
- Naudokite CI/CD pipelines gamybiniams diegimams

### 4. Konfigūracijos valdymas
- Naudokite aplinkos kintamuosius jautriems duomenims
- Laikykite konfigūraciją versijų valdyme
- Dokumentuokite aplinkai specifinius nustatymus

## Mokymosi eiga

### Pradedantiesiems (1–2 savaitės)
1. Įdiekite azd ir autentifikuokitės
2. Diegkite paprastą šabloną
3. Supraskite projekto struktūrą
4. Išmokite pagrindines komandas (up, down, deploy)

### Tarpinis (3–4 savaitės)
1. Pritaikykite šablonus
2. Valdykite kelias aplinkas
3. Supraskite infrastruktūros kodą
4. Sukonfigūruokite CI/CD pipelines

### Pažengusiems (5+ savaitės)
1. Kurkite pasirinktinius šablonus
2. Pažangios infrastruktūros modeliai
3. Diegimai keliuose regionuose
4. Įmonės lygio konfigūracijos

## Kiti žingsniai

**📖 Tęskite 1 skyriaus mokymąsi:**
- [Įdiegimas ir nustatymas](installation.md) - Įdiekite ir sukonfigūruokite azd
- [Jūsų pirmasis projektas](first-project.md) - Užbaikite praktinį vadovėlį
- [Konfigūracijos vadovas](configuration.md) - Išplėstiniai konfigūracijos parametrai

**🎯 Pasiruošę kitam skyriui?**
- [2 skyrius: AI orientuotas vystymas](../chapter-02-ai-development/microsoft-foundry-integration.md) - Pradėkite kurti AI programas

## Papildomi ištekliai

- [Azure Developer CLI apžvalga](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Šablonų galerija](https://azure.github.io/awesome-azd/)
- [Bendruomenės pavyzdžiai](https://github.com/Azure-Samples)

---

## 🙋 Dažnai užduodami klausimai

### Bendrieji klausimai

**Q: Kuo skiriasi AZD ir Azure CLI?**

A: Azure CLI (`az`) skirta valdyti atskiras Azure išteklius. AZD (`azd`) skirta valdyti visas programas:

```bash
# Azure CLI - žemo lygio išteklių valdymas
az webapp create --name myapp --resource-group rg
az sql server create --name myserver --resource-group rg
# ...reikia dar daug komandų

# AZD - programos lygio valdymas
azd up  # Diegia visą programą su visais ištekliais
```

**Galvokite apie tai taip:**
- `az` = Veiksmai su atskiromis Lego kaladėlėmis
- `azd` = Darbas su pilnais Lego rinkiniais

---

**Q: Ar reikia žinoti Bicep arba Terraform, kad naudotumėte AZD?**

A: Ne! Pradėkite nuo šablonų:
```bash
# Naudokite esamą šabloną - nereikia žinių apie IaC
azd init --template todo-nodejs-mongo
azd up
```

Bicep galite išmokti vėliau, kad pritaikytumėte infrastruktūrą. Šablonai suteikia veikiančius pavyzdžius, iš kurių galite mokytis.

---

**Q: Kiek kainuoja paleisti AZD šablonus?**

A: Kainos skiriasi priklausomai nuo šablono. Daugumos vystymo šablonų kaina yra $50–150 per mėnesį:

```bash
# Peržiūrėkite išlaidas prieš diegiant
azd provision --preview

# Visada išvalykite, kai nenaudojate
azd down --force --purge  # Pašalina visus išteklius
```

**Naudingas patarimas:** Naudokite nemokamas pakopas, kai jos prieinamos:
- App Service: F1 (Nemokama) pakopa
- Microsoft Foundry modeliai: Azure OpenAI 50,000 žetonų/mėn nemokamai
- Cosmos DB: 1000 RU/s nemokama pakopa

---

**Q: Ar galiu naudoti AZD su esamais Azure ištekliais?**

A: Taip, bet paprasčiau pradėti nuo nulio. AZD geriausiai veikia, kai valdo visą gyvavimo ciklą. Esamiems ištekliams:

```bash
# Parinktis 1: Importuoti esamus išteklius (pažengusiems)
azd init
# Tada modifikuokite infra/, kad nurodytų esamus išteklius

# Parinktis 2: Pradėti iš naujo (rekomenduojama)
azd init --template matching-your-stack
azd up  # Sukuria naują aplinką
```

---

**Q: Kaip pasidalinti projektu su komandos nariais?**

A: Įkelkite AZD projektą į Git (bet NE .azure aplanko):
```bash
# Jau pagal nutylėjimą įtraukta į .gitignore
.azure/        # Sudėtyje yra slaptų duomenų ir aplinkos informacijos
*.env          # Aplinkos kintamieji

# Komandos nariai tuomet:
git clone <your-repo>
azd auth login
azd env new <their-name>-dev
azd up
```

Visi gauna identišką infrastruktūrą iš tų pačių šablonų.

---

### Trikčių šalinimo klausimai

**Q: „azd up“ nepavyko perpus. Ką daryti?**

A: Patikrinkite klaidą, ištaisykite, tada bandykite dar kartą:
```bash
# Peržiūrėti išsamius žurnalus
azd show

# Bendri sprendimai:

# 1. Jei viršyta kvota:
azd env set AZURE_LOCATION "westus2"  # Išbandykite kitą regioną

# 2. Jei konfliktas dėl išteklio pavadinimo:
azd down --force --purge  # Pradėti nuo nulio
azd up  # Bandykite dar kartą

# 3. Jei autentifikacija pasibaigė:
az login
azd auth login
azd up
```

**Dažniausia problema:** Pasirinkta neteisinga Azure prenumerata
```bash
az account list --output table
az account set --subscription "<correct-subscription>"
```

---

**Q: Kaip diegti tik kodo pakeitimus neperkurinėjant infrastruktūros?**

A: Naudokite `azd deploy` vietoje `azd up`:
```bash
azd up          # Pirmą kartą: paruošimas + diegimas (lėtas)

# Atlikite kodo pakeitimus...

azd deploy      # Vėlesniais kartais: tik diegimas (greitas)
```

Greitumo palyginimas:
- `azd up`: 10–15 minučių (sukuria infrastruktūrą)
- `azd deploy`: 2–5 minutės (tik kodas)

---

**Q: Ar galiu pritaikyti infrastruktūros šablonus?**

A: Taip! Redaguokite Bicep failus `infra/`:
```bash
# Po azd init
cd infra/
code main.bicep  # Redaguoti VS Code

# Peržiūrėti pakeitimus
azd provision --preview

# Taikyti pakeitimus
azd provision
```

**Patarimas:** Pradėkite nuo mažų pakeitimų – pirmiausia keiskite SKU:
```bicep
// infra/main.bicep
sku: {
  name: 'B1'  // Change to 'P1V2' for production
}
```

---

**Q: Kaip ištrinti viską, ką sukūrė AZD?**

A: Viena komanda pašalina visus išteklius:
```bash
azd down --force --purge

# Tai ištrina:
# - Visus Azure išteklius
# - Išteklų grupę
# - Vietinės aplinkos būseną
# - Talpykloje saugomus diegimo duomenis
```

**Visada paleiskite tai kai:**
- Baigėte testuoti šabloną
- Perjungiate į kitą projektą
- Norite pradėti iš naujo

**Sąnaudų taupymas:** Neišnaudotų išteklių ištrynimas = $0 mokesčių

---

**Q: Ką daryti, jei netyčia ištrynėte išteklius Azure portale?**

A: AZD būsena gali nesutapti. Švarus startas:
```bash
# 1. Pašalinti vietinę būseną
azd down --force --purge

# 2. Pradėti iš naujo
azd up

# Alternatyva: leisti AZD aptikti ir ištaisyti
azd provision  # Sukurs trūkstamus išteklius
```

---

### Pažangūs klausimai

**Q: Ar galiu naudoti AZD CI/CD pipeline'uose?**

A: Taip! GitHub Actions pavyzdys:
```yaml
# .github/workflows/deploy.yml
name: Deploy with AZD

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Install azd
        run: curl -fsSL https://aka.ms/install-azd.sh | bash
      
      - name: Azure Login
        run: |
          azd auth login \
            --client-id ${{ secrets.AZURE_CLIENT_ID }} \
            --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
            --tenant-id ${{ secrets.AZURE_TENANT_ID }}
      
      - name: Deploy
        run: azd up --no-prompt
```

---

**Q: Kaip tvarkyti slaptus duomenis ir jautrią informaciją?**

A: AZD automatiškai integruojasi su Azure Key Vault:
```bash
# Slaptosios reikšmės saugomos Key Vault, o ne kode
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)"

# AZD automatiškai:
# 1. Sukuria Key Vault
# 2. Saugo slaptą reikšmę
# 3. Suteikia programai prieigą per valdomąją tapatybę
# 4. Įterpia vykdymo metu
```

**Niekada neįtraukite į commit:**
- `.azure/` folder (turi aplinkos duomenis)
- `.env` files (vietiniai slapti duomenys)
- Connection strings

---

**Q: Ar galiu diegti keliuose regionuose?**

A: Taip, sukurkite aplinką kiekvienam regionui:
```bash
# Rytų JAV aplinka
azd env new prod-eastus
azd env set AZURE_LOCATION eastus
azd up

# Vakarų Europos aplinka
azd env new prod-westeurope
azd env set AZURE_LOCATION westeurope
azd up

# Kiekviena aplinka yra nepriklausoma
azd env list
```

Tikroms daugaregionėms programoms pritaikykite Bicep šablonus, kad diegtų į kelis regionus vienu metu.

---

**Q: Kur galiu gauti pagalbą, jei užstrigsiu?**

1. **AZD dokumentacija:** https://learn.microsoft.com/azure/developer/azure-developer-cli/
2. **GitHub problemos (Issues):** https://github.com/Azure/azure-dev/issues
3. **Discord:** [Azure Discord](https://discord.gg/microsoft-azure) - kanalas #azure-developer-cli
4. **Stack Overflow:** Žyma `azure-developer-cli`
5. **Šis kursas:** [Trikčių šalinimo vadovas](../chapter-07-troubleshooting/common-issues.md)

**Naudingas patarimas:** Prieš klausiant paleiskite:
```bash
azd show       # Rodo dabartinę būseną
azd version    # Rodo jūsų versiją
```
Įtraukite šią informaciją į savo klausimą, kad gautumėte greitesnę pagalbą.

---

## 🎓 Kas toliau?

Dabar suprantate AZD pagrindus. Pasirinkite savo kelią:

### 🎯 Pradedantiesiems:
1. **Toliau:** [Įdiegimas ir nustatymas](installation.md) - Įdiekite AZD savo įrenginyje
2. **Tada:** [Jūsų pirmasis projektas](first-project.md) - Paleiskite savo pirmąją programą
3. **Praktika:** Atlikite visus 3 pratimus šiame pamokoje

### 🚀 AI kūrėjams:
1. **Praleiskite į:** [2 skyrius: AI orientuotas vystymas](../chapter-02-ai-development/microsoft-foundry-integration.md)
2. **Diegimas:** Pradėkite su `azd init --template get-started-with-ai-chat`
3. **Mokykitės:** Kurkite diegdami

### 🏗️ Patyrusiems kūrėjams:
1. **Peržiūrėkite:** [Konfigūracijos vadovas](configuration.md) - Išplėstiniai nustatymai
2. **Tyrinėkite:** [Infrastruktūra kaip Kodas](../chapter-04-infrastructure/provisioning.md) - Bicep gilusis įsigilinimas
3. **Kurti:** Sukurkite pritaikytus šablonus savo technologijų rinkiniui

---

**Skyrių naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: Skyrius 1 - Pagrindai ir greitas startas  
- **⬅️ Ankstesnis**: [Kurso apžvalga](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Kitas**: [Įdiegimas ir nustatymas](installation.md)
- **🚀 Kitas skyrius**: [2 skyrius: AI orientuotas vystymas](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už jokius nesusipratimus ar klaidingas interpretacijas, kylančias naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
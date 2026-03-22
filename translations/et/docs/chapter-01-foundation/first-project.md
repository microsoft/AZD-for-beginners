# Teie esimene projekt - praktiline juhend

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 - Alused ja kiire algus
- **⬅️ Eelmine**: [Paigaldus ja seadistamine](installation.md)
- **➡️ Järgmine**: [Konfiguratsioon](configuration.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: Tehisintellekt esimesena arendamine](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Sissejuhatus

Tere tulemast oma esimesse Azure arendaja CLI projekti! See põhjalik praktiline juhend annab täieliku ülevaate täisstack rakenduse loomise, juurutamise ja haldamise kohta Azure’is, kasutades azd-d. Töötate reaalse todo-rakendusega, mis sisaldab Reacti frontend’i, Node.js API backend’i ja MongoDB andmebaasi.

## Õpieesmärgid

Selle juhendi läbimise järel:
- Valdate azd projekti initsialiseerimise töövoogu, kasutades malle
- Mõistate Azure arendaja CLI projekti struktuuri ja konfiguratsioonifaile
- Teostate rakenduse täieliku juurutamise Azure’i koos infrastruktuuri ettevalmistamisega
- Rakendate rakenduse uuendusi ja uuesti juurutamise strateegiaid
- Haldate mitut arengukeskkonda arenduseks ja testimiseks
- Rakendate ressursside puhastamise ja kulude juhtimise praktikaid

## Õpitulemused

Pärast juhendi lõpetamist olete võimeline:
- Algatama ja konfigureerima azd projekte mallidest iseseisvalt
- Efektiivselt navigeerima ja muutma azd projekti struktuuri
- Juurutama täisstack rakendusi Azure’i ühe käsuga
- Lahendama tavalisi juurutamise ja autentimise probleeme
- Halduse mitut Azure keskkonda erinevate juurutusetappide jaoks
- Rakendama pideva juurutamise töövooge rakenduste uuendamiseks

## Alustame

### Nõutavad eeldused
- ✅ Azure Developer CLI paigaldatud ([Paigaldamise juhend](installation.md))
- ✅ Azure CLI paigaldatud ja autentitud
- ✅ Git paigaldatud teie süsteemi
- ✅ Node.js versioon 16 või uuem (selle juhendi jaoks)
- ✅ Visual Studio Code (soovitatav)

### Kontrollige oma seadistust
```bash
# Kontrolli azd paigaldust
azd version
```
### Kontrollige Azure autentimist

```bash
az account show
```

### Kontrollige Node.js versiooni
```bash
node --version
```

## Samm 1: Valige ja initsialiseerige mall

Alustame populaarse todo-rakenduse malliga, mis sisaldab React frontend’i ja Node.js API backend’i.

```bash
# Sirvi saadaolevaid malle
azd template list

# Algata todo-rakenduse mall
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Järgi juhiseid:
# - Sisesta keskkonna nimi: "dev"
# - Vali tellimus (kui sul on mitu)
# - Vali piirkond: "East US 2" (või sinu eelistatud piirkond)
```

### Mis just juhtus?
- Malli kood laaditi alla teie lokaalkataloogi
- Loodi `azure.yaml` fail teenuste definitsioonidega
- Seati üles infrastruktuuri kood kataloogis `infra/`
- Loodi keskkonna konfiguratsioon

## Samm 2: Uurige projekti struktuuri

Vaatame, mida azd meie jaoks lõi:

```bash
# Vaata projekti struktuuri
tree /f   # Windows
# või
find . -type f | head -20   # macOS/Linux
```

Te peaks nägema:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Olulised failid mõistmiseks

**azure.yaml** – teie azd projekti tuum:
```bash
# Vaadake projekti konfiguratsiooni
cat azure.yaml
```

**infra/main.bicep** – infrastruktuuri definitsioon:
```bash
# Vaata infrastruktuuri koodi
head -30 infra/main.bicep
```

## Samm 3: Kohandage oma projekti (valikuline)

Enne juurutamist saate rakendust kohandada:

### Muutke frontend’i
```bash
# Ava React-rakenduse komponent
code src/web/src/App.tsx
```

Tehke lihtne muudatus:
```typescript
// Leia pealkiri ja muuda see
<h1>My Awesome Todo App</h1>
```

### Konfigureerige keskkonnamuutujad
```bash
# Määra kohandatud keskkonnamuutujad
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Vaata kõiki keskkonnamuutujaid
azd env get-values
```

## Samm 4: Juurutage Azure’i

Nüüd põnev osa – juurutame kõik Azure’i!

```bash
# Paiguta infrastruktuur ja rakendus
azd up

# See käsk teeb järgmist:
# 1. Pakub Azure'i ressursse (App Service, Cosmos DB jne)
# 2. Koostab teie rakenduse
# 3. Paigaldab pakutud ressurssidele
# 4. Kuvab rakenduse URL-i
```

### Mis toimub juurutamise ajal?

Käsk `azd up` teeb järgnevad toimingud:
1. **Provision** (`azd provision`) – loob Azure’i ressursid
2. **Package** – koostab teie rakenduse koodi
3. **Deploy** (`azd deploy`) – juurutab koodi Azure’i ressurssidele

### Oodatav väljund
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Samm 5: Testige oma rakendust

### Juurdepääs rakendusele
Klõpsake juurutamise väljundis oleval URL-il või hankige see igal ajal:
```bash
# Hangi rakenduse otspunktid
azd show

# Ava rakendus oma brauseris
azd show --output json | jq -r '.services.web.endpoint'
```

### Testige todo-rakendust
1. **Lisa ülesanne** – klõpsake "Add Todo" ja sisestage ülesanne
2. **Märgista lõpetatuks** – märkige valmis saanud tööd
3. **Kustuta ülesanded** – eemaldage enam vajalikud todo’d

### Jälgige oma rakendust
```bash
# Ava Azure portaal oma ressursside jaoks
azd monitor

# Vaata rakenduse logisid
azd monitor --logs

# Vaata reaalajas mõõdikuid
azd monitor --live
```

## Samm 6: Tehke muudatusi ja juurutage uuesti

Teeme ühe muudatuse ja vaatame, kui lihtne on uuendada:

### Muutke API-d
```bash
# Muuda API koodi
code src/api/src/routes/lists.js
```

Lisage kohandatud vastuse päis:
```javascript
// Leia marsruudi käitleja ja lisa:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Juurutage ainult koodi muudatused
```bash
# Käivitage ainult rakenduse kood (infrastruktuuri vahele jätta)
azd deploy

# See on palju kiirem kui 'azd up', kuna infrastruktuur on juba olemas
```

## Samm 7: Halda mitut keskkonda

Loo staging keskkond muudatuste testimiseks enne tootmisse minekut:

```bash
# Loo uus testkeskkond
azd env new staging

# Paigalda testkeskkonda
azd up

# Vaheta tagasi arenduskeskkonda
azd env select dev

# Loetle kõik keskkonnad
azd env list
```

### Keskkondade võrdlus
```bash
# Vaata arenduskeskkonda
azd env select dev
azd show

# Vaata etappide keskkonda
azd env select staging
azd show
```

## Samm 8: Puhastage ressursid

Kui katsetamine on tehtud, puhastage, et vältida lisakulutusi:

```bash
# Kustuta kõik Azure'i ressursid praeguse keskkonna jaoks
azd down

# Sunnitud kustutamine ilma kinnitamiseta ja pehme kustutatud ressursside puhastamine
azd down --force --purge

# Kustuta konkreetne keskkond
azd env select staging
azd down --force --purge
```

## Klassikaline rakendus vs. tehisintellektil põhinev rakendus: sama töövoog

Te just juurutasite traditsioonilise veebirakenduse. Aga mis siis, kui sooviksite juurutada tehisintellektil põhinevat rakendust — näiteks Microsoft Foundry mudelitega toetatud vestlusrakendust?

Hea uudis: **töövoog on identne.**

| Samm | Klassikaline todo rakendus | AI vestlusrakendus |
|------|----------------------------|--------------------|
| Initsialiseerimine | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentimine | `azd auth login` | `azd auth login` |
| Juurutamine | `azd up` | `azd up` |
| Jälgimine | `azd monitor` | `azd monitor` |
| Puhastamine | `azd down --force --purge` | `azd down --force --purge` |

Ainus erinevus on **mall**, millest alustate. AI mall sisaldab täiendavat infrastruktuuri (näiteks Microsoft Foundry mudelite ressurss või AI Search indeks), kuid azd haldab kogu seda teie eest. Te ei pea õppima uusi käske, kasutama teist tööriista ega muutma lähenemist juurutamisele.

See on azd tuumprintsiip: **üks töövoog, iga töökoormus.** Osavad oskused, mida selles juhendis harjutasite—initsialiseerimine, juurutamine, jälgimine, uuesti juurutamine ja puhastamine—kehtivad võrdselt AI rakenduste ja agentide puhul.

---

## Mida te õppisite

Palju õnne! Olete edukalt:
- ✅ Algatanud azd projekti mallist
- ✅ Uurinud projekti struktuuri ja olulisi faile
- ✅ Juurutanud täisstack rakenduse Azure’i
- ✅ Teinud koodimuudatusi ja juurutanud uuesti
- ✅ Haldenud mitut keskkonda
- ✅ Puhastanud ressursse

## 🎯 Oskuste kinnitamise harjutused

### Harjutus 1: Juurutage teine mall (15 minutit)
**Eesmärk**: Näidata valmidust azd init ja juurutamise töövoos

```bash
# Proovi Python + MongoDB virna
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Kontrolli juurutust
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Puhasta ära
azd down --force --purge
```

**Edu kriteeriumid:**
- [ ] Rakendus juurutub ilma vigadeta
- [ ] Rakendusele pääseb ligi brauseris
- [ ] Rakendus töötab korrektselt (lisamine/eemaldamine todo’de)
- [ ] Kõik ressursid puhastati edukalt

### Harjutus 2: Kohandage konfiguratsiooni (20 minutit)
**Eesmärk**: Harjutada keskkonnamuutujate seadistamist

```bash
cd my-first-azd-app

# Loo kohandatud keskkond
azd env new custom-config

# Sea kohandatud muutujad
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Kontrolli muutujaid
azd env get-values | grep APP_TITLE

# Juhi kasutades kohandatud konfiguratsiooni
azd up
```

**Edu kriteeriumid:**
- [ ] Kohandatud keskkond loodi edukalt
- [ ] Keskkonnamuutujad on seadistatud ja kättesaadavad
- [ ] Rakendus juurutub kohandatud konfiguratsiooniga
- [ ] Kohandatud seaded on juurutatud rakenduses kontrollitavad

### Harjutus 3: Mitmekeskkondade töövoog (25 minutit)
**Eesmärk**: Valdada keskkondade haldamist ja juurutamisstrateegiaid

```bash
# Loo arenduskeskkond
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Märgi üles arenduse URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Loo eelvaatuse keskkond
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Märgi üles eelvaatuse URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Võrdle keskkondi
azd env list

# Testi mõlemat keskkonda
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Puhasta mõlemad
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Edu kriteeriumid:**
- [ ] Loositi kaks keskkonda erinevate seadistustega
- [ ] Mõlemad keskkonnad juurutati edukalt
- [ ] Keskkondi saab vahetada käsuga `azd env select`
- [ ] Keskkonnamuutujad erinevad keskkondade vahel
- [ ] Mõlemad keskkonnad puhastati edukalt

## 📊 Teie edenemine

**Aega kulutatud**: ~60-90 minutit  
**Omandatud oskused**:
- ✅ Mallipõhine projekti initsialiseerimine
- ✅ Azure ressursside ettevalmistamine
- ✅ Rakenduse juurutamise töövood
- ✅ Keskkondade haldamine
- ✅ Konfiguratsiooni haldamine
- ✅ Ressursside puhastamine ja kulude juhtimine

**Järgmine tase**: Olete valmis [Konfiguratsiooni juhendisse](configuration.md), et õppida edasijõudnud konfiguratsioonimustreid!

## Tavaliste probleemide lahendamine

### Autentimise vead
```bash
# Logi Azure'i uuesti sisse
az login

# Kontrolli tellimuse juurdepääsu
az account show
```

### Juurutamise vead
```bash
# Luba silumislogi
export AZD_DEBUG=true
azd up --debug

# Vaata rakenduse logisid Azure'is
azd monitor --logs

# Konteinerirakenduste jaoks kasuta Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Ressursside nime konfliktid
```bash
# Kasuta unikaalset keskkonna nime
azd env new dev-$(whoami)-$(date +%s)
```

### Pordi/võrgu probleemid
```bash
# Kontrollige, kas sadamad on vabad
netstat -an | grep :3000
netstat -an | grep :3100
```

## Järgmised sammud

Nüüd, kui olete esimese projekti lõpetanud, uurige neid edasijõudnutele mõeldud teemasid:

### 1. Kohandage infrastruktuuri
- [Infrastruktuur koodina](../chapter-04-infrastructure/provisioning.md)
- [Lisage andmebaasid, salvestus ja teised teenused](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Seadistage CI/CD
- [Juurutamise juhend](../chapter-04-infrastructure/deployment-guide.md) – täielikud CI/CD töövood
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) – torujuhtme seadistamine

### 3. Tootmise parimad tavad
- [Juurutamise juhend](../chapter-04-infrastructure/deployment-guide.md) – turvalisus, jõudlus ja jälgimine

### 4. Uurige rohkem malle
```bash
# Sirvi malle kategooria järgi
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Proovi erinevaid tehnoloogiapinu
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Täiendavad ressursid

### Õppematerjalid
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure arhitektuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure hästi arhitektuuritud raamistiku juhend](https://learn.microsoft.com/en-us/azure/well-architected/)

### Ühiskond ja tugi
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure arendajate kogukond](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallid ja näited
- [Ametlik mallide galerii](https://azure.github.io/awesome-azd/)
- [Kogukonna mallid](https://github.com/Azure-Samples/azd-templates)
- [Ettevõtte mustrid](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Palju õnne esimese azd projekti lõpetamise puhul!** Nüüd olete valmis usaldusväärselt ehitama ja juurutama suurepäraseid rakendusi Azure’is.

---

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 - Alused ja kiire algus
- **⬅️ Eelmine**: [Paigaldus ja seadistamine](installation.md)
- **➡️ Järgmine**: [Konfiguratsioon](configuration.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: Tehisintellekt esimesena arendamine](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Järgmine õppetund**: [Juurutamise juhend](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame täpsust, tuleb arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument oma emakeeles tuleks pidada autoriteetseks allikaks. Olulise info puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta ühegi selles tõlkes esineva eksituse või valesti mõistmise eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
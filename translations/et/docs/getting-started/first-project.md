<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-24T13:18:42+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "et"
}
-->
# Teie Esimene Projekt - Praktiline Õpetus

**Peatüki Navigeerimine:**
- **📚 Kursuse Kodu**: [AZD Algajatele](../../README.md)
- **📖 Praegune Peatükk**: Peatükk 1 - Alused ja Kiire Algus
- **⬅️ Eelmine**: [Paigaldamine ja Seadistamine](installation.md)
- **➡️ Järgmine**: [Konfiguratsioon](configuration.md)
- **🚀 Järgmine Peatükk**: [Peatükk 2: AI-põhine Arendus](../microsoft-foundry/microsoft-foundry-integration.md)

## Sissejuhatus

Tere tulemast oma esimesse Azure Developer CLI projekti! See põhjalik praktiline õpetus juhendab teid täisfunktsionaalse rakenduse loomisel, juurutamisel ja haldamisel Azure'is, kasutades azd-i. Töötate reaalse todo-rakendusega, mis sisaldab Reacti esikülge, Node.js API tagakülge ja MongoDB andmebaasi.

## Õpieesmärgid

Selle õpetuse läbimisega õpite:
- Valdama azd projekti initsialiseerimise töövoogu, kasutades malle
- Mõistma Azure Developer CLI projekti struktuuri ja konfiguratsioonifaile
- Teostama täielikku rakenduse juurutamist Azure'is koos infrastruktuuri ettevalmistamisega
- Rakendama uuendusi ja uuesti juurutamise strateegiaid
- Halda mitut keskkonda arenduse ja testimise jaoks
- Rakendama ressursside puhastamise ja kulude haldamise praktikaid

## Õpitulemused

Õpetuse lõpuks suudate:
- Iseseisvalt initsialiseerida ja konfigureerida azd projekte mallidest
- Tõhusalt navigeerida ja muuta azd projekti struktuure
- Juurutada täisfunktsionaalseid rakendusi Azure'i, kasutades ühekordseid käske
- Lahendada levinud juurutamisprobleeme ja autentimisprobleeme
- Hallata mitut Azure'i keskkonda erinevate juurutamisetappide jaoks
- Rakendada pideva juurutamise töövooge rakenduse uuenduste jaoks

## Alustamine

### Eeltingimuste Kontrollnimekiri
- ✅ Azure Developer CLI paigaldatud ([Paigaldamise Juhend](installation.md))
- ✅ Azure CLI paigaldatud ja autentitud
- ✅ Git paigaldatud teie süsteemi
- ✅ Node.js 16+ (selle õpetuse jaoks)
- ✅ Visual Studio Code (soovitatav)

### Kontrollige Oma Seadistust
```bash
# Kontrolli azd paigaldust
azd version
```
### Kontrollige Azure'i autentimist

```bash
az account show
```

### Kontrollige Node.js versiooni
```bash
node --version
```

## Samm 1: Valige ja Initsialiseerige Mall

Alustame populaarse todo-rakenduse malliga, mis sisaldab Reacti esikülge ja Node.js API tagakülge.

```bash
# Sirvi saadaolevaid malle
azd template list

# Initsialiseeri ülesannete rakenduse mall
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Järgi juhiseid:
# - Sisesta keskkonna nimi: "dev"
# - Vali tellimus (kui sul on mitu)
# - Vali piirkond: "East US 2" (või sinu eelistatud piirkond)
```

### Mis Just Juhtus?
- Malli kood laaditi alla teie kohalikku kataloogi
- Loodi `azure.yaml` fail teenuste määratlustega
- Seadistati infrastruktuuri kood `infra/` kataloogis
- Loodi keskkonna konfiguratsioon

## Samm 2: Uurige Projekti Struktuuri

Vaatame, mida azd meile lõi:

```bash
# Vaata projekti struktuuri
tree /f   # Windows
# või
find . -type f | head -20   # macOS/Linux
```

Te peaksite nägema:
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

### Olulised Failid, Mida Mõista

**azure.yaml** - Teie azd projekti süda:
```bash
# Vaata projekti konfiguratsiooni
cat azure.yaml
```

**infra/main.bicep** - Infrastruktuuri määratlus:
```bash
# Vaata infrastruktuuri koodi
head -30 infra/main.bicep
```

## Samm 3: Kohandage Oma Projekti (Valikuline)

Enne juurutamist saate rakendust kohandada:

### Muutke Esikülge
```bash
# Ava Reacti rakenduse komponent
code src/web/src/App.tsx
```

Tehke lihtne muudatus:
```typescript
// Leia pealkiri ja muuda seda
<h1>My Awesome Todo App</h1>
```

### Konfigureerige Keskkonnamuutujad
```bash
# Määra kohandatud keskkonnamuutujad
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Vaata kõiki keskkonnamuutujaid
azd env get-values
```

## Samm 4: Juurutage Azure'i

Nüüd kõige põnevam osa - juurutage kõik Azure'i!

```bash
# Paigalda infrastruktuur ja rakendus
azd up

# See käsk teeb järgmist:
# 1. Haldab Azure'i ressursse (App Service, Cosmos DB jne)
# 2. Koostab teie rakenduse
# 3. Paigaldab hallatud ressurssidele
# 4. Kuvab rakenduse URL-i
```

### Mis Juurutamise Käigus Toimub?

`azd up` käsk täidab järgmised sammud:
1. **Ettevalmistus** (`azd provision`) - Loob Azure'i ressursid
2. **Pakendamine** - Koostab teie rakenduse koodi
3. **Juurutamine** (`azd deploy`) - Juurutab koodi Azure'i ressurssidele

### Oodatav Väljund
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Samm 5: Testige Oma Rakendust

### Juurdepääs Rakendusele
Klõpsake juurutamise väljundis antud URL-il või hankige see igal ajal:
```bash
# Hankige rakenduse lõpp-punktid
azd show

# Avage rakendus oma brauseris
azd show --output json | jq -r '.services.web.endpoint'
```

### Testige Todo Rakendust
1. **Lisage todo-üksus** - Klõpsake "Add Todo" ja sisestage ülesanne
2. **Märkige lõpetatuks** - Märkige lõpetatud üksused
3. **Kustutage üksused** - Eemaldage todo-d, mida te enam ei vaja

### Jälgige Oma Rakendust
```bash
# Ava Azure'i portaal oma ressursside jaoks
azd monitor

# Vaata rakenduse logisid
azd logs
```

## Samm 6: Tehke Muudatusi ja Juurutage Uuesti

Teeme muudatuse ja vaatame, kui lihtne on uuendada:

### Muutke API-d
```bash
# Muuda API koodi
code src/api/src/routes/lists.js
```

Lisage kohandatud vastuse päis:
```javascript
// Leia marsruudi töötleja ja lisa:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Juurutage Ainult Koodimuudatused
```bash
# Paigalda ainult rakenduse kood (jäta infrastruktuur vahele)
azd deploy

# See on palju kiirem kui 'azd up', kuna infrastruktuur juba eksisteerib
```

## Samm 7: Hallake Mitut Keskkonda

Looge testkeskkond, et muudatusi enne tootmist testida:

```bash
# Loo uus lavastuskeskkond
azd env new staging

# Paigalda lavastuskeskkonda
azd up

# Lülitu tagasi arenduskeskkonda
azd env select dev

# Loetle kõik keskkonnad
azd env list
```

### Keskkondade Võrdlus
```bash
# Vaata arenduskeskkonda
azd env select dev
azd show

# Vaata lavastuskeskkonda
azd env select staging
azd show
```

## Samm 8: Puhastage Ressursid

Kui olete katsetamise lõpetanud, puhastage ressursid, et vältida pidevaid kulusid:

```bash
# Kustuta kõik Azure'i ressursid praeguse keskkonna jaoks
azd down

# Kustuta sunniviisiliselt ilma kinnitusteta ja puhasta pehmelt kustutatud ressursid
azd down --force --purge

# Kustuta konkreetne keskkond
azd env select staging
azd down --force --purge
```

## Mida Olete Õppinud

Palju õnne! Olete edukalt:
- ✅ Initsialiseerinud azd projekti mallist
- ✅ Uurinud projekti struktuuri ja olulisi faile
- ✅ Juurutanud täisfunktsionaalse rakenduse Azure'i
- ✅ Teinud koodimuudatusi ja juurutanud uuesti
- ✅ Hallanud mitut keskkonda
- ✅ Puhastanud ressursid

## 🎯 Oskuste Kinnitamise Harjutused

### Harjutus 1: Juurutage Teine Mall (15 minutit)
**Eesmärk**: Näidata azd init ja juurutamise töövoo valdamist

```bash
# Proovi Python + MongoDB stacki
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Kontrolli juurutust
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Korista ära
azd down --force --purge
```

**Edu Kriteeriumid:**
- [ ] Rakendus juurutatakse ilma vigadeta
- [ ] Rakenduse URL-ile pääseb brauseris
- [ ] Rakendus töötab korrektselt (todo-de lisamine/eemaldamine)
- [ ] Kõik ressursid on edukalt puhastatud

### Harjutus 2: Kohandage Konfiguratsiooni (20 minutit)
**Eesmärk**: Harjutada keskkonnamuutujate konfigureerimist

```bash
cd my-first-azd-app

# Loo kohandatud keskkond
azd env new custom-config

# Määra kohandatud muutujad
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Kontrolli muutujaid
azd env get-values | grep APP_TITLE

# Paigalda kohandatud konfiguratsiooniga
azd up
```

**Edu Kriteeriumid:**
- [ ] Kohandatud keskkond on edukalt loodud
- [ ] Keskkonnamuutujad on seadistatud ja kättesaadavad
- [ ] Rakendus juurutatakse kohandatud konfiguratsiooniga
- [ ] Kohandatud seaded on juurutatud rakenduses kontrollitavad

### Harjutus 3: Mitme Keskkonna Töövoog (25 minutit)
**Eesmärk**: Valdada keskkonna haldamise ja juurutamise strateegiaid

```bash
# Loo arenduskeskkond
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Märgi arenduse URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Loo testimiskeskkond
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Märgi testimise URL
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

**Edu Kriteeriumid:**
- [ ] Kaks keskkonda on loodud erinevate konfiguratsioonidega
- [ ] Mõlemad keskkonnad on edukalt juurutatud
- [ ] Keskkondade vahel saab vahetada, kasutades `azd env select`
- [ ] Keskkonnamuutujad erinevad keskkondade vahel
- [ ] Mõlemad keskkonnad on edukalt puhastatud

## 📊 Teie Edusammud

**Investeeritud Aeg**: ~60-90 minutit  
**Omandatud Oskused**:
- ✅ Mallipõhine projekti initsialiseerimine
- ✅ Azure'i ressursside ettevalmistamine
- ✅ Rakenduse juurutamise töövood
- ✅ Keskkonna haldamine
- ✅ Konfiguratsiooni haldamine
- ✅ Ressursside puhastamine ja kulude haldamine

**Järgmine Tase**: Olete valmis [Konfiguratsiooni Juhendiks](configuration.md), et õppida edasijõudnud konfiguratsioonimustreid!

## Levinud Probleemide Lahendamine

### Autentimisvead
```bash
# Autendi uuesti Azure'iga
az login

# Kontrolli tellimuse juurdepääsu
az account show
```

### Juurutamise Ebaõnnestumised
```bash
# Luba silumise logimine
export AZD_DEBUG=true
azd up --debug

# Vaata üksikasjalikke logisid
azd logs --service api
azd logs --service web
```

### Ressursinimede Konfliktid
```bash
# Kasuta unikaalset keskkonna nime
azd env new dev-$(whoami)-$(date +%s)
```

### Pordi/Võrgu Probleemid
```bash
# Kontrolli, kas pordid on saadaval
netstat -an | grep :3000
netstat -an | grep :3100
```

## Järgmised Sammud

Nüüd, kui olete oma esimese projekti lõpetanud, uurige neid edasijõudnud teemasid:

### 1. Kohandage Infrastruktuuri
- [Infrastruktuur kui Kood](../deployment/provisioning.md)
- [Lisage andmebaase, salvestusruumi ja muid teenuseid](../deployment/provisioning.md#adding-services)

### 2. Seadistage CI/CD
- [GitHub Actions Integratsioon](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Tootmise Parimad Tavad
- [Turvakonfiguratsioonid](../deployment/best-practices.md#security)
- [Jõudluse optimeerimine](../deployment/best-practices.md#performance)
- [Jälgimine ja logimine](../deployment/best-practices.md#monitoring)

### 4. Uurige Rohkem Malle
```bash
# Sirvi malle kategooriate kaupa
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Proovi erinevaid tehnoloogiapakke
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Täiendavad Ressursid

### Õppematerjalid
- [Azure Developer CLI Dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arhitektuuri Keskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Hästi Arhitektuuri Raamistik](https://learn.microsoft.com/en-us/azure/well-architected/)

### Kogukond ja Tugi
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Arendajate Kogukond](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallid ja Näited
- [Ametlik Malligalerii](https://azure.github.io/awesome-azd/)
- [Kogukonna Mallid](https://github.com/Azure-Samples/azd-templates)
- [Ettevõtte Mustrid](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Palju õnne oma esimese azd projekti lõpetamise puhul!** Olete nüüd valmis looma ja juurutama hämmastavaid rakendusi Azure'is enesekindlalt.

---

**Peatüki Navigeerimine:**
- **📚 Kursuse Kodu**: [AZD Algajatele](../../README.md)
- **📖 Praegune Peatükk**: Peatükk 1 - Alused ja Kiire Algus
- **⬅️ Eelmine**: [Paigaldamine ja Seadistamine](installation.md)
- **➡️ Järgmine**: [Konfiguratsioon](configuration.md)
- **🚀 Järgmine Peatükk**: [Peatükk 2: AI-põhine Arendus](../microsoft-foundry/microsoft-foundry-integration.md)
- **Järgmine Õppetund**: [Juurutamise Juhend](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
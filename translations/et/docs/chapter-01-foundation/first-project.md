# Teie Esimene Projekt - Praktiline Juhend

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD For Beginners](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 - Alused & Kiire algus
- **⬅️ Eelmine**: [Installation & Setup](installation.md)
- **➡️ Järgmine**: [Configuration](configuration.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: AI-esmane arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Sissejuhatus

Tere tulemast teie esimesse Azure Developer CLI projekti! See põhjalik praktiline juhend annab täieliku samm-sammulise ülevaate täis-virna rakenduse loomisest, juurutamisest ja haldamisest Azure'is, kasutades azd. Te töötate reaalse todo-rakendusega, mis sisaldab Reacti frontend'i, Node.js API backend'i ja MongoDB andmebaasi.

## Õpieesmärgid

Selle juhendi läbimise järel:
- Valdate azd projekti initsialiseerimise töövoogu mallide abil
- Mõistate Azure Developer CLI projekti struktuuri ja konfiguratsioonifaile
- Viite läbi rakenduse täieliku juurutamise Azure'i koos infrastruktuuri provisjonimisega
- Rakendate värskenduste ja taasjuurutamise strateegiaid
- Haldate mitut keskkonda arenduseks ja staginguks
- Rakendate ressursside puhastamise ja kulude juhtimise tavasid

## Õpitulemused

Pärast lõpetamist suudate:
- Iseständigilt initsialiseerida ja konfigureerida azd projekte mallidest
- Efektiivselt navigeerida ja muuta azd projekti struktuure
- Juurutada täis-virna rakendusi Azure'i ühekäsklusega
- Tuvastada ja lahendada levinumaid juurutamis- ja autentimisprobleeme
- Haldada mitut Azure keskkonda erinevate juurutusetappide jaoks
- Rakendada pideva juurutamise töövooge rakenduse värskendusteks

## Alustamine

### Nõutavuste kontrollnimekiri
- ✅ Azure Developer CLI paigaldatud ([Installation Guide](installation.md))
- ✅ Azure CLI paigaldatud ja autentitud
- ✅ Git paigaldatud teie süsteemi
- ✅ Node.js 16+ (selle juhendi jaoks)
- ✅ Visual Studio Code (soovitatav)

### Kontrollige oma seadistust
```bash
# Kontrolli azd-i paigaldust
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

Alustame populaarse todo-rakenduse malliga, mis sisaldab Reacti frontend'i ja Node.js API backend'i.

```bash
# Sirvige saadaolevaid malle
azd template list

# Initsialiseerige todo-rakenduse mall
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Järgige juhiseid:
# - Sisestage keskkonna nimi: "dev"
# - Valige tellimus (kui teil on mitu)
# - Valige regioon: "East US 2" (või teie eelistatud regioon)
```

### Mis just juhtus?
- Malli kood laeti teie kohalikku kataloogi alla
- Loodi `azure.yaml` fail teenuste määratlusega
- Seati üles infrastruktuuri kood kausta `infra/`
- Loodi keskkonna konfiguratsioon

## Samm 2: Uurige projekti struktuuri

Vaatame, mida azd meile lõi:

```bash
# Kuva projekti struktuur
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

### Olulised failid, mida mõista

**azure.yaml** - Teie azd projekti süda:
```bash
# Vaata projekti konfiguratsiooni
cat azure.yaml
```

**infra/main.bicep** - Infrastruktuuri definitsioon:
```bash
# Vaata infrastruktuuri koodi
head -30 infra/main.bicep
```

## Samm 3: Kohandage oma projekti (valikuline)

Enne juurutamist saate rakendust kohandada:

### Muutke frontend'i
```bash
# Ava Reacti rakenduse komponent
code src/web/src/App.tsx
```

Tegage lihtne muudatus:
```typescript
// Leia pealkiri ja muuda seda
<h1>My Awesome Todo App</h1>
```

### Konfigureerige keskkonnamuutujad
```bash
# Määra kohandatud keskkonnamuutujad
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Kuva kõik keskkonnamuutujad
azd env get-values
```

## Samm 4: Juurutage Azure'i

Nüüd põnev osa - juurutage kõik Azure'i!

```bash
# Infrastruktuuri ja rakenduse juurutamine
azd up

# See käsk teeb järgmist:
# 1. loob Azure'i ressursid (App Service, Cosmos DB jne)
# 2. ehitab teie rakenduse
# 3. juurutab rakenduse loodud ressurssidele
# 4. kuvab rakenduse URL-i
```

### Mis juhtub juurutamise ajal?

Käsklus `azd up` sooritab need sammud:
1. **Provision** (`azd provision`) - Loob Azure'i ressursse
2. **Package** - Koostab teie rakenduse koodi
3. **Deploy** (`azd deploy`) - Juurutab koodi Azure'i ressurssidele

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
Klõpsake juurutamise väljundis antud URL-il või leidke see igal ajal:
```bash
# Hangi rakenduse lõpp-punktid
azd show

# Ava rakendus brauseris
azd show --output json | jq -r '.services.web.endpoint'
```

### Testige Todo-rakendust
1. **Lisa todo-üksus** - Klõpsake "Add Todo" ja sisestage ülesanne
2. **Märgista lõpetatuks** - Märkige lõpetatud üksused
3. **Kustuta üksused** - Eemaldage todo'd, mida enam ei vaja

### Jälgige oma rakendust
```bash
# Ava Azure'i portaal oma ressursside jaoks
azd monitor

# Vaata rakenduse logisid
azd monitor --logs

# Vaata reaalajas mõõdikuid
azd monitor --live
```

## Samm 6: Tehke muudatusi ja taasjuurutage

Teeme nüüd muutuse ja näeme, kui lihtne on uuendada:

### Muutke API-d
```bash
# Muuda API-koodi
code src/api/src/routes/lists.js
```

Lisage kohandatud vastuse päis:
```javascript
// Leia marsruudi käitleja ja lisa:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Juurutage ainult koodimuutused
```bash
# Paigalda ainult rakenduse kood (jäta infrastruktuur vahele)
azd deploy

# See on palju kiirem kui 'azd up', kuna infrastruktuur juba olemas on
```

## Samm 7: Halda mitut keskkonda

Looge staging-keskkond, et testida muudatusi enne tootmisse minekut:

```bash
# Loo uus staging-keskkond
azd env new staging

# Paigalda staging-keskkonda
azd up

# Lülitu tagasi arenduskeskkonda
azd env select dev

# Loetle kõik keskkonnad
azd env list
```

### Keskkondade võrdlus
```bash
# Vaata arenduskeskkonda
azd env select dev
azd show

# Vaata eeltootmiskeskkonda
azd env select staging
azd show
```

## Samm 8: Puhastage ressursid

Kui olete eksperimenteerimise lõpetanud, puhastage ressursid, et vältida pidevaid kulutusi:

```bash
# Kustuta kõik Azure'i ressursid praegusest keskkonnast
azd down

# Sunniviisiliselt kustuta ilma kinnitamiseta ning puhasta pehmelt kustutatud ressursid
azd down --force --purge

# Kustuta konkreetne keskkond
azd env select staging
azd down --force --purge
```

## Mida te õppisite

Palju õnne! Te olete edukalt:
- ✅ Initsialiseerinud azd projekti mallist
- ✅ Uurinud projekti struktuuri ja olulisi faile
- ✅ Juurutanud täis-virna rakenduse Azure'i
- ✅ Teinud koodimuudatusi ja taasjuurutanud
- ✅ Halda mitut keskkonda
- ✅ Puhastanud ressursid

## 🎯 Oskuste valideerimise harjutused

### Harjutus 1: Juurutage teine mall (15 minutit)
**Eesmärk**: Tõestada azd init ja juurutamise töövoo valdamist

```bash
# Proovi Python + MongoDB virna
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Kontrolli juurutust
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Puhasta
azd down --force --purge
```

**Õnnestumise kriteeriumid:**
- [ ] Rakendus juurdub ilma vigadeta
- [ ] Saab brauseris juurde pääseda rakenduse URL-ile
- [ ] Rakendus töötab korrektselt (lisa/eemalda todo)
- [ ] Kõik ressursid puhastati edukalt

### Harjutus 2: Kohandage konfiguratsiooni (20 minutit)
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

# Juuruta kohandatud konfiguratsiooniga
azd up
```

**Õnnestumise kriteeriumid:**
- [ ] Kohandatud keskkond loodud edukalt
- [ ] Keskkonnamuutujad seadistatud ja leitavad
- [ ] Rakendus juurdub kohandatud konfiguratsiooniga
- [ ] Saab kinnitada kohandatud seadeid juurutatud rakenduses

### Harjutus 3: Mitme keskkonna töövoog (25 minutit)
**Eesmärk**: Valdada keskkondade haldust ja juurutamisstrateegiaid

```bash
# Loo arenduskeskkond
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Märgi arenduskeskkonna URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Loo staging-keskkond
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Märgi staging-keskkonna URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Võrdle keskkondi
azd env list

# Testi mõlemaid keskkondi
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Puhasta mõlemaid keskkondi
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Õnnestumise kriteeriumid:**
- [ ] Loodud kaks keskkonda erinevate konfiguratsioonidega
- [ ] Mõlemad keskkonnad juurdusid edukalt
- [ ] Saab vahetada keskkondade vahel kasutades `azd env select`
- [ ] Keskkonnamuutujad erinevad keskkondade vahel
- [ ] Mõlemad keskkonnad puhastati edukalt

## 📊 Teie edenemine

**Aega kulus**: ~60–90 minutit  
**Omandatud oskused**:
- ✅ Mallipõhine projekti initsialiseerimine
- ✅ Azure'i ressursside provisjonimine
- ✅ Rakenduse juurutamise töövood
- ✅ Keskkondade haldus
- ✅ Konfiguratsiooni haldus
- ✅ Ressursside puhastamine ja kulude haldamine

**Järgmine tase**: Olete valmis [Configuration Guide](configuration.md) õppima täiustatud konfiguratsioonimustreid!

## Levinumate probleemide tõrkeotsing

### Autentimisvead
```bash
# Logi Azure'i uuesti sisse
az login

# Kontrolli tellimuse juurdepääsu
az account show
```

### Juurutamisvead
```bash
# Luba silumise logimine
export AZD_DEBUG=true
azd up --debug

# Vaata rakenduse logisid Azure'is
azd monitor --logs

# Container Appside jaoks kasuta Azure CLI-d:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Ressursside nimede konfliktid
```bash
# Kasuta ainulaadset keskkonna nime
azd env new dev-$(whoami)-$(date +%s)
```

### Pordi/võrgu probleemid
```bash
# Kontrolli, kas pordid on saadaval
netstat -an | grep :3000
netstat -an | grep :3100
```

## Järgmised sammud

Nüüd, kui olete oma esimese projekti lõpetanud, uurige neid täiustatud teemasid:

### 1. Kohandage infrastruktuuri
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Lisa andmebaasid, salvestusruum ja teised teenused](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Seadistage CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Täielikud CI/CD töövood
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Torujuhtme konfiguratsioon

### 3. Tootmise parimad tavad
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Turvalisus, jõudlus ja jälgimine

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

## Lisamaterjalid

### Õppematerjalid
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Kogukond & tugi
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallid & Näited
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Palju õnne esimesest azd projektist!** Olete nüüd valmis enesekindlalt ehitama ja juurutama hämmastavaid rakendusi Azure'is.

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD For Beginners](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 - Alused & Kiire algus
- **⬅️ Eelmine**: [Installation & Setup](installation.md)
- **➡️ Järgmine**: [Configuration](configuration.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: AI-esmane arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Järgmine õppetund**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastutusest loobumine:
See dokument on tõlgitud tehisintellekti tõlketeenuse Co-op Translator (https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsuse, tuleb arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algset dokumenti selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta nende arusaamatuste või valesti tõlgendamise eest, mis võivad tuleneda selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
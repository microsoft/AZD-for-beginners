# Teie esimene projekt – praktiline juhend

**Lõikude navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 – Alus ja kiire algus
- **⬅️ Eelmine**: [Paigaldamine ja seadistamine](installation.md)
- **➡️ Järgmine**: [Konfigureerimine](configuration.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: Tehisintellekti-eelne arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Sissejuhatus

Tere tulemast oma esimese Azure Developer CLI projektiga! See põhjalik praktiline juhend annab täieliku ülevaate täisvirna (full-stack) rakenduse loomise, juurutamise ja haldamise kohta Azure'is, kasutades azd-d. Töötate tõelise todo-rakendusega, mis sisaldab React-i kasutajaliidest, Node.js API tagapoolt ja MongoDB andmebaasi.

## Õpieesmärgid

Selle juhendi lõpetamisel:
- Valdate azd projekti initsialiseerimise töövoogu mallide abil
- Mõistate Azure Developer CLI projekti struktuuri ja konfiguratsioonifaile
- Suudate teostada rakenduse täieliku juurutamise Azure’is koos infrastruktuuri loomisega
- Rakendate rakenduse uuendamise ja uuesti juurutamise strateegiaid
- Haldate mitut keskkonda arenduseks ja testimiseks
- Rakendate ressursside puhastamise ja kulude haldamise praktikaid

## Õpitulemused

Pärast juhendi lõpetamist saate:
- Iseseisvalt algatada ja konfigureerida azd projekte mallidest
- Tõhusalt navigeerida ja muuta azd projekti struktuuri
- Juurutada täisvirna rakendusi Azure’i kasutades ühe käsuga
- Lahendada levinud juurutamis- ja autentimisprobleeme
- Hallata Azure’i mitut keskkonda erinevate juurutusetappide jaoks
- Rakendada pideva juurutamise töövoogusid rakenduse uuendamiseks

## Alustamine

### Eeldused
- ✅ Azure Developer CLI on installitud ([Paigaldusjuhend](installation.md))
- ✅ AZD autentimine tehtud käsuga `azd auth login`
- ✅ Git on süsteemis installitud
- ✅ Node.js 16+ (selle juhendi jaoks)
- ✅ Visual Studio Code (soovitatav)

Enne jätkamist käivitage repositooriumi juurkataloogist seadistuse valideerija:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Kontrolli oma seadistust
```bash
# Kontrolli azd paigaldust
azd version

# Kontrolli AZD autentimist
azd auth login --check-status
```

### Kontrolli valikulist Azure CLI autentimist

```bash
az account show
```

### Kontrolli Node.js versiooni
```bash
node --version
```

## Samm 1: Vali ja initsialiseeri mall

Alustame populaarse todo-rakenduse malliga, mis sisaldab React-i kasutajaliidest ja Node.js API tagapoolt.

```bash
# Sirvige saadaolevaid malle
azd template list

# Algatage todo-rakenduse mall
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Järgige juhiseid:
# - Sisestage keskkonna nimi: "dev"
# - Valige tellimus (kui teil on mitu)
# - Valige piirkond: "East US 2" (või teie eelistatud piirkond)
```

### Mis just juhtus?
- Laaditi mallikood teie kohalikku kataloogi
- Loodi `azure.yaml` fail teenuste määratlustega
- Seati infrastruktuuri kood kataloogi `infra/`
- Loodi keskkonna konfiguratsioon

## Samm 2: Uuri projekti struktuuri

Vaatame, mida azd meie jaoks lõi:

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

### Olulised failid mõistmiseks

**azure.yaml** – teie azd projekti süda:
```bash
# Vaata projekti konfiguratsiooni
cat azure.yaml
```

**infra/main.bicep** – infrastruktuuri määratlus:
```bash
# Vaata infrastruktuuri koodi
head -30 infra/main.bicep
```

## Samm 3: Kohanda oma projekti (valikuline)

Enne juurutamist võite rakendust kohandada:

### Muuda kasutajaliidest
```bash
# Ava Reacti rakenduse komponent
code src/web/src/App.tsx
```

Tee lihtne muudatus:
```typescript
// Leia pealkiri ja muuda see
<h1>My Awesome Todo App</h1>
```

### Sea keskkonnamuutujad
```bash
# Määra kohandatud keskkonnamuutujad
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Vaata kõiki keskkonnamuutujaid
azd env get-values
```

## Samm 4: Juuruta Azure’i

Nüüd põnev hetk – juuruta kõik Azure’i!

```bash
# Paigalda infrastruktuur ja rakendus
azd up

# See käsk teeb järgmist:
# 1. Hoiab Azure ressursid ette (App Service, Cosmos DB jne)
# 2. Koostab sinu rakenduse
# 3. Paigaldab ettevalmistatud ressurssidele
# 4. Kuvab rakenduse URL-i
```

### Mis juhtub juurutamise ajal?

Käsk `azd up` teostab järgmisi samme:
1. **Provision** (`azd provision`) – loob Azure ressursse
2. **Package** – ehitab rakenduse koodi
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

## Samm 5: Testi oma rakendust

### Juurdepääs rakendusele
Klõpsake juurutusväljundis olevat URL-i või hankige see igal ajal:
```bash
# Hangi rakenduse lõpp-punktid
azd show

# Ava rakendus oma brauseris
azd show --output json | jq -r '.services.web.endpoint'
```

### Testi todo-rakendust
1. **Lisa todo-ülesanne** – Klõpsa "Add Todo" ja sisesta ülesanne
2. **Märgi täidetuks** – Märgi lõpetatud ülesanded
3. **Kustuta üksused** – Eemalda mittevajalikud todo-d

### Jälgi oma rakendust
```bash
# Ava Azure'i portaal oma ressursside jaoks
azd monitor

# Vaata rakenduse logisid
azd monitor --logs

# Vaata reaalajas mõõdikuid
azd monitor --live
```

### ✅ Kontrolli oma juurutust

Enne edasi liikumist läbi see kiire kontrollnimekiri, et kinnitada kõik töötab – ära eelda, et "juurutus õnnestus" tähendab "rakendus töötab":

```bash
# 1. Kinnitage, et lõpp-punkt eksisteerib ja sellele pääseb ligi
azd show

# 2. Tehke lõpp-punkti kiire kontrolltest (ootab HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Kontrollige tervise lõpp-punkti, kui teie rakendus selle avaldab
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Juurutus on kinnitatud, kui:**
- ✅ `azd show` näitab ligipääsetavat lõpp-punkti URL-i
- ✅ URL avaneb brauseris ilma vigadeta
- ✅ Põhifunktsioonid töötavad (todo lisamine/märgistamine/kustutamine)
- ✅ `azd monitor --logs` näitab saabunud päringuid ilma ootamatute vigadeta

Kui mõni kontroll ebaõnnestub, liikuge [Peatükk 7: Tõrkeotsing](../chapter-07-troubleshooting/README.md).

## Samm 6: Tee muudatusi ja juuruta uuesti

Teeme muudatuse ja vaatame, kui lihtne on uuendada:

### Muuda API-d
```bash
# Muuda API koodi
code src/api/src/routes/lists.js
```

Lisa kohandatud vastuse päis:
```javascript
// Leia marsruudi käsitleja ja lisa:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Juuruta ainult koodimuudatused
```bash
# Paigalda ainult rakenduse kood (jää infrastruktuur vahele)
azd deploy

# See on palju kiirem kui 'azd up', kuna infrastruktuur on juba olemas
```

## Samm 7: Halda mitut keskkonda

Loo testkeskkond muudatuste testimiseks enne tootmispakkumist:

```bash
# Loo uus testkeskkond
azd env new staging

# Kasuta testkeskkonda
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

# Vaata etapi keskkonda
azd env select staging
azd show
```

## Samm 8: Puhasta ressursid

Kui oled katsetamise lõpetanud, puhasta, et vältida edasisi kulusid:

```bash
# Kustuta kõik Azure ressursid praeguse keskkonna jaoks
azd down

# Sundkustuta ilma kinnitusteta ja tühjenda pehmemõõduga kustutatud ressursid
azd down --force --purge

# Kustuta konkreetne keskkond
azd env select staging
azd down --force --purge
```

## Klassikaline rakendus vs. AI-toega rakendus: sama töövoog

Sa just juurutasid traditsioonilise veebirakenduse. Aga mis juhtub, kui soovid juurutada AI-toega rakenduse – näiteks Microsoft Foundry mudelitega vestlusrakenduse?

Hea uudis: **töövoog on identne.**

| Samm | Klassikaline todo-rakendus | AI vestlusrakendus |
|------|----------------------------|--------------------|
| Initsialiseeri | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentimine | `azd auth login` | `azd auth login` |
| Juurutamine | `azd up` | `azd up` |
| Jälgimine | `azd monitor` | `azd monitor` |
| Puhastamine | `azd down --force --purge` | `azd down --force --purge` |

Ainus erinevus on **mall**, millest alustada. AI mall sisaldab lisainfrastruktuuri (näiteks Microsoft Foundry mudelite ressurss või AI Search indeks), kuid azd haldab seda kõike teie eest. Sul ei ole vaja õppida uusi käske, kasutusele võtta teist tööriista ega muuta juurutamise mõtlemist.

See ongi azd põhiprintsiip: **üks töövoog, iga töökoormus.** Osavad oskused, mida selles juhendis harjutasid – initsialiseerimine, juurutamine, jälgimine, uuesti juurutamine ja puhastamine – kehtivad ühtemoodi nii AI-rakenduste kui ka agentide puhul.

---

## Mida õppisite

Palju õnne! Olete edukalt:
- ✅ Algatanud azd projekti mallist
- ✅ Uurinud projekti struktuuri ja olulisi faile
- ✅ Juurutanud täisvirna rakenduse Azure’i
- ✅ Teinud koodimuudatusi ja juurutanud uuesti
- ✅ Haldanud mitut keskkonda
- ✅ Puhastanud ressursse

## 🎯 Oskuste valideerimise harjutused

### Harjutus 1: Juurutage erinev mall (15 minutit)
**Eesmärk**: Tõestada azd init ja juurutustöövoo valdamist

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
- [ ] Rakendus juurutub ilma vigadeta
- [ ] Saab rakenduse URL-i brauseris avada
- [ ] Rakendus töötab korrektselt (todo lisamine/ kustutamine)
- [ ] Kõik ressursid puhastati edukalt

### Harjutus 2: Kohanda konfiguratsiooni (20 minutit)
**Eesmärk**: Harjutada keskkonnamuutujate seadistamist

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

# Käivita kohandatud konfiguratsiooniga
azd up
```

**Õnnestumise kriteeriumid:**
- [ ] Kohandatud keskkond on loodud edukalt
- [ ] Keskkonnamuutujad on seadistatud ja kättesaadavad
- [ ] Rakendus juurutub kohandatud konfiguratsiooniga
- [ ] Saab kontrollida kohandatud seadeid juurutatud rakenduses

### Harjutus 3: Mitme keskkonna töövoog (25 minutit)
**Eesmärk**: Valdada keskkondade haldamist ja juurutamisstrateegiaid

```bash
# Loo arenduskeskkond
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Märgi arenduse URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Loo testkeskkond
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Märgi testimise URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Võrdle keskkondi
azd env list

# Testi mõlemaid keskkondi
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Puhasta mõlemad
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Õnnestumise kriteeriumid:**
- [ ] Loodud on kaks keskkonda erinevate konfiguratsioonidega
- [ ] Mõlema keskkonna juurutus on õnnestunud
- [ ] Saab keskkondi muuta käsuga `azd env select`
- [ ] Keskkonnamuutujad erinevad keskkondade vahel
- [ ] Mõlemad keskkonnad on puhtaks tehtud edukalt

## 📊 Teie edenemine

**Kuluvas aeg**: ~60–90 minutit  
**Omandatud oskused**:
- ✅ Malle kasutades projekti alustamine
- ✅ Azure ressursside loomine
- ✅ Rakenduse juurutamise töövood
- ✅ Keskkondade haldamine
- ✅ Konfiguratsiooni haldamine
- ✅ Ressursside puhastamine ja kulude haldamine

**Järgmine tase**: Olete valmis [Konfigureerimisjuhendiks](configuration.md) õppimaks edasijõudnute konfiguratsioonimustreid!

## Levinud probleemide lahendamine

### Autentimisvead
```bash
# Autendi uuesti Azure'is
az login

# Kontrolli tellimuse juurdepääsu
az account show
```

### Juurutuse ebaõnnestumised
```bash
# Luba silumislogimine
export AZD_DEBUG=true
azd up --debug

# Vaata rakenduse logisid Azure'is
azd monitor --logs

# Konteinerirakenduste jaoks kasuta Azure CLI-d:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Ressursinimede konfliktid
```bash
# Kasutage unikaalset keskkonna nime
azd env new dev-$(whoami)-$(date +%s)
```

### Pordi/võrgu probleemid
```bash
# Kontrolli, kas pordid on vabad
netstat -an | grep :3000
netstat -an | grep :3100
```

## Järgmised sammud

Nüüd kui olete oma esimese projekti lõpetanud, uurige neid edasijõudnute teemasid:

### 1. Kohanda infrastruktuuri
- [Infrastruktuur koodina](../chapter-04-infrastructure/provisioning.md)
- [Lisa andmebaase, salvestust ja muid teenuseid](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Seadista CI/CD
- [Juurutamisjuhend](../chapter-04-infrastructure/deployment-guide.md) – täielikud CI/CD töövood
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) – torujuhtme konfiguratsioon

### 3. Tootmiskõlblikud head praktikad
- [Juurutamisjuhend](../chapter-04-infrastructure/deployment-guide.md) – turvalisus, jõudlus ja jälgimine

### 4. Uuri rohkem malle
```bash
# Sirvi malle kategooria järgi
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Proovi erinevaid tehnoloogiapakke
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Lisamaterjalid

### Õppematerjalid
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure arhitektuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure hästi arhitektuuri raamistik](https://learn.microsoft.com/en-us/azure/well-architected/)

### Ühendus ja tugi
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer kogukond](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow – azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallid ja näited
- [Ametlik malligalerii](https://azure.github.io/awesome-azd/)
- [Kogukonna mallid](https://github.com/Azure-Samples/azd-templates)
- [Ettevõtte mustrid](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Palju õnne oma esimese azd projekti lõpetamise puhul!** Olete nüüd valmis enesekindlalt Azure’is hämmastavaid rakendusi ehitama ja juurutama.

---

**Lõikude navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 – Alus ja kiire algus
- **⬅️ Eelmine**: [Paigaldamine ja seadistamine](installation.md)
- **➡️ Järgmine**: [Too enda rakendus](bring-your-own-app.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: Tehisintellekti-eelne arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
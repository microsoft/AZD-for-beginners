# Teie esimene projekt – praktiline juhend

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 – Alused ja kiire algus
- **⬅️ Eelmine**: [Paigaldus ja seadistamine](installation.md)
- **➡️ Järgmine**: [Konfiguratsioon](configuration.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: AI-esimene arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Sissejuhatus

Tere tulemast oma esimese Azure arendaja CLI projekti juurde! See põhjalik praktiline juhend annab teile täieliku ülevaate täispinu rakenduse loomise, juurutamise ja haldamise kohta Azure'is kasutades azd tööriista. Töötate reaalse todo-rakendusega, mis sisaldab Reacti esipaneeli, Node.js API taustsüsteemi ja MongoDB andmebaasi.

## Õpieesmärgid

Selle juhendi läbimist lõpetades:
- Õpite azd projekti algatamise töövoogu mallide abil
- Mõistate Azure arendaja CLI projekti struktuuri ja konfiguratsioonifaile
- Suudate täielikult rakenduse juurutada Azure'i koos infrastruktuuri loomisega
- Rakendate uuendusi ja uuesti juurutamise strateegiaid
- Haldate mitut keskkonda arenduseks ja testimiseks
- Kasutate ressursside koristamist ja kulude juhtimise praktikaid

## Õpitulemused

Juhendi lõpetamisel oskate:
- Ise algatada ja konfigureerida azd projekte mallidest
- Efektiivselt navigeerida ja muuta azd projekti struktuuri
- Rakendada täispinu rakendusi Azure'i ühe käsuga
- Lahendada tavalisi juurutamisvigade ja autentimisprobleeme
- Hallata mitmeid Azure keskkondi erinevate juurutusetappide jaoks
- Rakendada pideva juurutamise töövooge rakenduse uuendamiseks

## Alustamine

### Nõuete kontrollnimekiri
- ✅ Azure Developer CLI paigaldatud ([Paigaldusjuhend](installation.md))
- ✅ AZD autentimine lõpetatud käsuga `azd auth login`
- ✅ Git teie süsteemis
- ✅ Node.js 16+ (selle juhendi jaoks)
- ✅ Visual Studio Code (soovituslik)

Enne jätkamist käivitage hoidla juurkataloogist seadistusvalidaator:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Kontrollige oma seadistust
```bash
# Kontrolli azd paigaldust
azd version

# Kontrolli AZD autentimist
azd auth login --check-status
```

### Kontrollige valikulist Azure CLI autentimist

```bash
az account show
```

### Kontrollige Node.js versiooni
```bash
node --version
```

## 1. samm: Valige ja algatage mall

Alustame populaarsest todo-rakenduse mallist, mis sisaldab Reacti esipaneeli ja Node.js API tausta.

```bash
# Sirvi saadaval olevaid malle
azd template list

# Initsialiseeri todo rakenduse mall
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Järgi juhiseid:
# - Sisesta keskkonna nimi: "dev"
# - Vali tellimus (kui sul on mitu)
# - Vali piirkond: "East US 2" (või sinu eelistatud piirkond)
```

### Mis just juhtus?
- Malli kood laaditi alla teie kohalikku kataloogi
- Loodi `azure.yaml` fail teenuste definitsioonidega
- Seati üles infrastruktuuri kood kataloogis `infra/`
- Loodi keskkonna konfiguratsioon

## 2. samm: Uurige projektistruktuuri

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

### Olulised failid mõistmiseks

**azure.yaml** – teie azd projekti süda:
```bash
# Vaata projekti konfiguratsiooni
cat azure.yaml
```

**infra/main.bicep** – infrastruktuuri definitsioon:
```bash
# Vaata infrastruktuuri koodi
head -30 infra/main.bicep
```

## 3. samm: Kohandage oma projekti (valikuline)

Enne juurutamist saate rakendust kohandada:

### Muutke esipaneeli
```bash
# Ava Reacti rakenduse komponent
code src/web/src/App.tsx
```

Tehke lihtne muudatus:
```typescript
// Leia pealkiri ja muuda see
<h1>My Awesome Todo App</h1>
```

### Keskkonnamuutujate seadistamine
```bash
# Määra kohandatud keskkonnamuutujad
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Vaata kõiki keskkonnamuutujaid
azd env get-values
```

## 4. samm: Juurutage Azure'i

Nüüd põnev osa – juurutame kõik Azure'i!

```bash
# Paigalda infrastruktuur ja rakendus
azd up

# See käsklus teeb järgmist:
# 1. Varustab Azure'i ressursid (App Service, Cosmos DB jne)
# 2. Koostab sinu rakenduse
# 3. Paigaldab varustatud ressurssidele
# 4. Kuvab rakenduse URL-i
```

### Mis juhtub juurutamise ajal?

Käsk `azd up` teeb järgmised toimingud:
1. **Eeltöötlus** (`azd provision`) – loob Azure'i ressursid
2. **Pakendamine** – ehitab teie rakenduse koodi
3. **Juurutamine** (`azd deploy`) – juurutab koodi Azure'i ressurssidesse

### Oodatav väljund
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 5. samm: Testige oma rakendust

### Rakendusele ligipääs
Klõpsake juurutamise väljundis toodud URL-i või hankige see igal ajal:
```bash
# Hangi rakenduse lõpp-punktid
azd show

# Ava rakendus oma brauseris
azd show --output json | jq -r '.services.web.endpoint'
```

### Testige todo-rakendust
1. **Lisa todo ülesanne** – klõpsake "Add Todo" ja sisestage ülesanne
2. **Märgi lõpetatuks** – märkige lõpetatud ülesanded
3. **Kustuta ülesanded** – eemaldage enam vajaminevad todo kirjed

### Jälgige oma rakendust
```bash
# Ava Azure portaal oma ressursside jaoks
azd monitor

# Vaata rakenduse logisid
azd monitor --logs

# Vaata reaalajas mõõdikuid
azd monitor --live
```

## 6. samm: Tehke muudatusi ja juurutage uuesti

Teeme muudatuse ja vaatame kui lihtne on uuendada:

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

### Juurutage ainult koodimuudatused
```bash
# Paigaldage ainult rakenduse kood (jätke infrastruktuur vahele)
azd deploy

# See on palju kiirem kui 'azd up', sest infrastruktuur on juba olemas
```

## 7. samm: Halda mitut keskkonda

Looge testkeskkond muudatuste kontrollimiseks enne tootmisse minekut:

```bash
# Loo uus testkeskkond
azd env new staging

# Paiguta testkeskkonda
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

# Vaata testkeskkonda
azd env select staging
azd show
```

## 8. samm: Ressursside koristamine

Kui olete testimise lõpetanud, tühjendage ressursid pidevate kulude vältimiseks:

```bash
# Kustuta kõik Azure'i ressursid praeguse keskkonna jaoks
azd down

# Sunnitud kustutamine ilma kinnitamiseta ja pehme kustutusega ressursside puhastamine
azd down --force --purge

# Kustuta konkreetne keskkond
azd env select staging
azd down --force --purge
```

## Klassikaline rakendus vs. AI-põhine rakendus: sama töövoog

Just juurutasite traditsioonilise veebirakenduse. Aga mis siis, kui soovite juurutada AI-põhist rakendust, näiteks Microsoft Foundry mudelitega toetet chat-rakendust?

Hea uudis: **töövoog on identselt sama.**

| Samm | Klassikaline Todo rakendus | AI Chat rakendus |
|------|----------------------------|------------------|
| Algata | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentimine | `azd auth login` | `azd auth login` |
| Juuruta | `azd up` | `azd up` |
| Jälgi | `azd monitor` | `azd monitor` |
| Korista | `azd down --force --purge` | `azd down --force --purge` |

Erinevus on ainult **mallis**, millest alustate. AI-mall sisaldab täiendavat infrastruktuuri (näiteks Microsoft Foundry mudelite ressurss või AI Search indeks), kuid azd haldab kõike seda teie eest. Te ei pea õppima uusi käske, kasutusele võtma teist tööriista ega muutma oma lähenemist juurutamisele.

See ongi azd põhialus: **üks töövoog, mis sobib iga koormuse puhul.** Järgides juhendis harjutatut – algatamine, juurutamine, jälgimine, uuesti juurutamine ja koristamine – sobib see igasugustele AI rakendustele ja agentidele.

---

## Mida te õppisite

Palju õnne! Olete edukalt:
- ✅ Algatanud azd projekti mallist
- ✅ Uurinud projekti struktuuri ja olulisi faile
- ✅ Juurutanud täispinu rakenduse Azure'i
- ✅ Teinud koodimuudatusi ja juurutanud uuesti
- ✅ Haldanud mitut keskkonda
- ✅ Koristanud ressursse

## 🎯 Oskuste kontrollharjutused

### Harjutus 1: Juurutage teine mall (15 minutit)
**Eesmärk**: Demonstreerida oskust azd init ja juurutuse töövoos

```bash
# Proovi Python + MongoDB virna
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Kinnita juurutamine
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Puhasta üles
azd down --force --purge
```

**Edu kriteeriumid:**
- [ ] Rakendus juurdub vigadeta
- [ ] Veebibrauseris juurdepääs rakenduse URL-ile
- [ ] Rakendus töötab korrektselt (todo lisamine/eemaldamine)
- [ ] Kõik ressursid edukalt koristatud

### Harjutus 2: Konfiguratsiooni kohandamine (20 minutit)
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

# Paigalda kohandatud konfiguratsiooniga
azd up
```

**Edu kriteeriumid:**
- [ ] Loomine kohandatud keskkond
- [ ] Keskkonnamuutujate seadistamine ja lugemine
- [ ] Rakendus juurdub kohandatud konfiguratsiooniga
- [ ] Kohandatud seaded juurutatud rakenduses kontrollitavad

### Harjutus 3: Mitme keskkonna töövoog (25 minutit)
**Eesmärk**: Omandada mitme keskkonna haldamine ja juurutamise strateegiad

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

# Märgi testkeskkonna URL
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

**Edu kriteeriumid:**
- [ ] Kahe erineva konfiguratsiooniga keskkonna loomine
- [ ] Mõlema keskkonna edukas juurutamine
- [ ] Võime vahetada keskkondi käsuga `azd env select`
- [ ] Keskkonnamuutujad erinevad keskkondade lõikes
- [ ] Mõlema keskkonna edukas koristamine

## 📊 Teie edusammud

**Seadistamiseks kulunud aeg**: ~60-90 minutit  
**Omandatud oskused**:
- ✅ Mallipõhine projekti algatamine
- ✅ Azure ressurside loomine
- ✅ Rakenduse juurutamise töövood
- ✅ Keskkonnaidude haldamine
- ✅ Konfiguratsiooni haldamine
- ✅ Ressursside koristamine ja kulude juhtimine

**Järgmine tase**: Olete valmis õppima [Konfiguratsiooni juhendist](configuration.md) keerukamaid konfiguratsioonimustreid!

## Levinud probleemide lahendamine

### Autentimisvead
```bash
# Autendi uuesti Azure'i kaudu
az login

# Kontrolli tellimuse juurdepääsu
az account show
```

### Juurutamisvead
```bash
# Lubage silumislogimine
export AZD_DEBUG=true
azd up --debug

# Vaadake rakenduse logisid Azure'is
azd monitor --logs

# Kasutamiseks konteinerirakendustes, kasutage Azure CLI-d:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Ressursinimede konfliktid
```bash
# Kasutage unikaalset keskkonna nime
azd env new dev-$(whoami)-$(date +%s)
```

### Pordi/võrgu probleemid
```bash
# Kontrolli, kas pordid on saadaval
netstat -an | grep :3000
netstat -an | grep :3100
```

## Järgmised sammud

Nüüd kui olete esimese projekti lõpetanud, uurige järgmisi edasijõudnute teemasid:

### 1. Kohandage infrastruktuuri
- [Infrastruktuur koodina](../chapter-04-infrastructure/provisioning.md)
- [Lisa andmebaasid, salvestus ja muud teenused](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Seadistage CI/CD
- [Juurutamise juhend](../chapter-04-infrastructure/deployment-guide.md) – Täielikud CI/CD töövood
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) – Torujuhtme konfiguratsioon

### 3. Tootmiskeskkonna parimad tavad
- [Juurutamise juhend](../chapter-04-infrastructure/deployment-guide.md) – Turvalisus, jõudlus ja jälgimine

### 4. Uurige rohkem malle
```bash
# Sirvige malle kategooria järgi
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Proovige erinevaid tehnoloogiapinu
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Lisamaterjalid

### Õppematerjalid
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure arhitektuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure hästi arhitektuuri raamistik](https://learn.microsoft.com/en-us/azure/well-architected/)

### Kogukond ja tugi
- [Azure Developer CLI GitHubis](https://github.com/Azure/azure-dev)
- [Azure arendajate kogukond](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallid ja näited
- [Ametlik malligalerii](https://azure.github.io/awesome-azd/)
- [Kogukonna mallid](https://github.com/Azure-Samples/azd-templates)
- [Ettevõtte mustrid](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Palju õnne esimese azd projekti lõpetamisel!** Olete nüüd valmis ehitama ja juurutama hämmastavaid rakendusi Azure'is kindlameelselt.

---

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 – Alused ja kiire algus
- **⬅️ Eelmine**: [Paigaldus ja seadistamine](installation.md)
- **➡️ Järgmine**: [Konfiguratsioon](configuration.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: AI-esimene arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Järgmine õppetund**: [Juurutamise juhend](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud tehisintellektil põhineva tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, tuleb arvestada, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument sisekeeles tuleks pidada autoriteetseks allikaks. Kriitilise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta võimalike arusaamatuste või valesti tõlgendamise eest, mis võivad tekkida selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
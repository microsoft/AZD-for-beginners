# Jūsų pirmasis projektas – praktyninė pamoka

**Skyriaus naršymas:**  
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)  
- **📖 Dabartinis skyrius**: 1 skyrius – Pagrindai ir greitas startas  
- **⬅️ Ankstesnis**: [Įdiegimas ir paruošimas](installation.md)  
- **➡️ Sekantis**: [Konfigūracija](configuration.md)  
- **🚀 Kitas skyrius**: [2 skyrius: AI-pirmasis kūrimas](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Įvadas

Sveiki atvykę į savo pirmą Azure Developer CLI projektą! Ši išsami praktiška pamoka suteiks jums visišką žingsnis po žingsnio gidą, kaip sukurti, diegti ir valdyti viso kaupiko programą Azure aplinkoje naudojant azd. Dirbsite su tikra todo programa, kurią sudaro React frontend, Node.js API backend ir MongoDB duomenų bazė.

## Mokymosi tikslai

Baigę šią pamoką jūs:  
- Išmoksite azd projekto inicijavimo procesą naudojant šablonus  
- Suprasite Azure Developer CLI projekto struktūrą ir konfigūracijos failus  
- Atliksite pilną programos diegimą į Azure kartu su infrastruktūros sudarymu  
- Įgyvendinsite programos atnaujinimus ir perdiegimo strategijas  
- Valdysite kelias aplinkas kūrimui ir testavimui  
- Taikysite išteklių valymo ir sąnaudų valdymo praktikas

## Įgyjami gebėjimai

Baigę pamoką galėsite:  
- Savarankiškai inicijuoti ir konfigūruoti azd projektus iš šablonų  
- Efektyviai naršyti ir keisti azd projekto struktūrą  
- Vienu komandos įsakymu diegti viso kaupiko programas į Azure  
- Spręsti dažnas diegimo ir autentifikacijos problemas  
- Valdyti kelias Azure aplinkas skirtingiems diegimo etapams  
- Įgyvendinti tęstinio diegimo procesus programos atnaujinimams

## Pradžia

### Reikalingi dalykai  
- ✅ Įdiegtas Azure Developer CLI ([įdiegimo vadovas](installation.md))  
- ✅ Užbaigtas azd autentifikavimas su `azd auth login`  
- ✅ Git įdiegtas jūsų sistemoje  
- ✅ Node.js 16+ (šioms pamokoms)  
- ✅ Visual Studio Code (rekomenduojama)

Prieš tęsdami, paleiskite paruošiamąją patikrą iš savo repozitorijos šaknies:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Patikrinkite savo aplinką  
```bash
# Patikrinkite azd diegimą
azd version

# Patikrinkite AZD autentifikavimą
azd auth login --check-status
```
  
### Pasirinktinė Azure CLI autentifikacija

```bash
az account show
```
  
### Patikrinkite Node.js versiją  
```bash
node --version
```
  
## 1 žingsnis: Pasirinkite ir inicijuokite šabloną

Pradėkime nuo populiaraus todo programos šablono su React frontend ir Node.js API backendu.

```bash
# Naršyti turimus šablonus
azd template list

# Inicijuoti užduočių programos šabloną
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Sekite nurodymus:
# - Įveskite aplinkos pavadinimą: "dev"
# - Pasirinkite prenumeratą (jei turite kelias)
# - Pasirinkite regioną: "East US 2" (arba jūsų pageidaujamą regioną)
```
  
### Kas ką tik įvyko?  
- Atsisiųsta šablono kodo versija į jūsų vietinį katalogą  
- Sukurtas `azure.yaml` failas su paslaugų aprašymais  
- Paruoštas infrastruktūros kodas `infra/` kataloge  
- Sukurta aplinkos konfigūracija  

## 2 žingsnis: Peržiūrėkite projekto struktūrą

Pažiūrėkime, ką mums sukūrė azd:

```bash
# Peržiūrėti projekto struktūrą
tree /f   # Windows
# arba
find . -type f | head -20   # macOS/Linux
```
  
Turėtumėte matyti:  
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
  
### Svarbūs failai, kuriuos reikia suprasti

**azure.yaml** - Jūsų azd projekto pagrindas:  
```bash
# Peržiūrėkite projekto konfigūraciją
cat azure.yaml
```
  
**infra/main.bicep** - Infrastruktūros aprašymas:  
```bash
# Peržiūrėkite infrastruktūros kodą
head -30 infra/main.bicep
```
  
## 3 žingsnis: Pritaikykite projektą (pasirinktinai)

Prieš diegdami, galite personalizuoti programą:

### Keiskite frontendą  
```bash
# Atidarykite React programos komponentą
code src/web/src/App.tsx
```
  
Padarykite paprastą pakeitimą:  
```typescript
// Suraskite pavadinimą ir pakeiskite jį
<h1>My Awesome Todo App</h1>
```
  
### Konfigūruokite aplinkos kintamuosius  
```bash
# Nustatyti pasirinktinius aplinkos kintamuosius
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Peržiūrėti visus aplinkos kintamuosius
azd env get-values
```
  
## 4 žingsnis: Diegimas į Azure

Dabar įdomioji dalis – įdiekime viską į Azure!

```bash
# Diegti infrastruktūrą ir programą
azd up

# Ši komanda atliks:
# 1. Paruoš Azure išteklius (App Service, Cosmos DB ir kt.)
# 2. Sukurti jūsų programą
# 3. Diegti į paruoštus išteklius
# 4. Rodyti programos URL
```
  
### Kas vyksta diegimo metu?

Komanda `azd up` atlieka šiuos veiksmus:  
1. **Sukuria infrastruktūrą** (`azd provision`) – sukuria Azure išteklius  
2. **Sukuria paketą** – sudaro jūsų programos kodą  
3. **Diegia** (`azd deploy`) – įkelia kodą į Azure išteklius  

### Tikėtinas rezultatas  
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```
  
## 5 žingsnis: Išbandykite programą

### Pasiekite savo programą  
Spustelėkite URL, nurodytą diegimo rezultatuose, arba gaukite jį bet kada:  
```bash
# Gauti programos galinius taškus
azd show

# Atidarykite programą naršyklėje
azd show --output json | jq -r '.services.web.endpoint'
```
  
### Išbandykite todo programą  
1. **Pridėkite užduotį** – spustelėkite „Add Todo“ ir įveskite užduotį  
2. **Pažymėkite kaip atliktą** – pažymėkite atliktas užduotis  
3. **Ištrinkite užduotis** – pašalinkite nebereikalingas todo užduotis  

### Stebėkite savo programą  
```bash
# Atidarykite „Azure“ portalą savo ištekliams
azd monitor

# Peržiūrėkite programos žurnalus
azd monitor --logs

# Peržiūrėkite tiesioginius rodiklius
azd monitor --live
```
  
## 6 žingsnis: Pakeiskite kodą ir perdiekite

Padarykime pakeitimą ir pamatykime, kaip paprasta atnaujinti:

### Keiskite API  
```bash
# Redaguoti API kodą
code src/api/src/routes/lists.js
```
  
Pridėkite specialų atsakymo antraštės laukelį:  
```javascript
// Suraskite maršruto tvarkyklę ir pridėkite:
res.header('X-Powered-By', 'Azure Developer CLI');
```
  
### Diekite tik kodo pakeitimus  
```bash
# Diegti tik programos kodą (praleisti infrastruktūrą)
azd deploy

# Tai daug greičiau nei 'azd up', nes infrastruktūra jau egzistuoja
```
  
## 7 žingsnis: Valdykite kelias aplinkas

Sukurkite testavimo aplinką, kad galėtumėte išbandyti pakeitimus prieš gamybą:

```bash
# Sukurti naują laikinosios aplinkos sistemą
azd env new staging

# Diegti į laikinosios aplinkos sistemą
azd up

# Perjungti atgal į kūrimo aplinką
azd env select dev

# Išvardinti visas aplinkas
azd env list
```
  
### Aplinkų palyginimas  
```bash
# Peržiūrėti kūrimo aplinką
azd env select dev
azd show

# Peržiūrėti etapavimo aplinką
azd env select staging
azd show
```
  
## 8 žingsnis: Išvalykite išteklius

Baigę eksperimentus, atlikite išteklių valymą, kad išvengtumėte nuolatinio apmokestinimo:

```bash
# Ištrinti visus Azure išteklius dabartinei aplinkai
azd down

# Priverstinai ištrinti be patvirtinimo ir pašalinti minkštai ištrintus išteklius
azd down --force --purge

# Ištrinti konkrečią aplinką
azd env select staging
azd down --force --purge
```
  
## Klasikinė programa ir AI pagrindu kuriama programa: tas pats darbo eiga

Jūs ką tik įdiegėte tradicinę interneto programą. O jei norėtumėte įdiegti AI pagrindu sukurtą programą – pavyzdžiui, pokalbių programą, paremta Microsoft Foundry modeliais?

Gera žinia: **darbo eiga ta pati.**

| Žingsnis | Klasikinė todo programa | AI pokalbių programa |  
|----------|-------------------------|---------------------|  
| Inicializuoti | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |  
| Autentifikuoti | `azd auth login` | `azd auth login` |  
| Diegti | `azd up` | `azd up` |  
| Stebėti | `azd monitor` | `azd monitor` |  
| Išvalyti | `azd down --force --purge` | `azd down --force --purge` |

Vienintelis skirtumas yra pradinis **šablonas**. AI šablonas turi papildomą infrastruktūrą (pvz., Microsoft Foundry Models resursą arba AI Search indeksą), bet azd tai visa tvarko už jus. Jums nereikia mokytis naujų komandų, naudoti kitų įrankių ar keisti, kaip galvojate apie diegimą.

Tai yra pagrindinė azd idėja: **viena darbo eiga, bet kokiam krūviui.** Gebėjimai, kuriuos įgijote šioje pamokoje – inicijuoti, diegti, stebėti, perdiegti ir išvalyti – taikomi tiek AI programoms, tiek agentams.

---

## Ko išmokote

Sveikiname! Sėkmingai:  
- ✅ Inicijavote azd projektą iš šablono  
- ✅ Išnagrinėjote projekto struktūrą ir svarbius failus  
- ✅ Įdiegėte viso kaupiko programą į Azure  
- ✅ Padarėte kodo pakeitimus ir perdiegėte  
- ✅ Tvarkėte kelias aplinkas  
- ✅ Išvalėte išteklius  

## 🎯 Gebėjimų tikrinimo užduotys

### 1 užduotis: Įdiekite kitą šabloną (15 min)  
**Tikslas**: įrodyti azd init ir diegimo darbo eigos įvaldytumą

```bash
# Išbandykite Python + MongoDB rinkinį
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Patikrinkite diegimą
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Išvalykite
azd down --force --purge
```
  
**Sėkmės kriterijai:**  
- [ ] Programa diegiama be klaidų  
- [ ] Galima pasiekti programą per naršyklę  
- [ ] Programa veikia teisingai (pridėti/pašalinti todos)  
- [ ] Sėkmingai išvalyti visi ištekliai  

### 2 užduotis: Personalizuokite konfigūraciją (20 min)  
**Tikslas**: praktikuoti aplinkos kintamųjų konfigūravimą

```bash
cd my-first-azd-app

# Sukurkite pasirinktą aplinką
azd env new custom-config

# Nustatykite pasirinktinius kintamuosius
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Patikrinkite kintamuosius
azd env get-values | grep APP_TITLE

# Diegkite su pasirinktine konfigūracija
azd up
```
  
**Sėkmės kriterijai:**  
- [ ] Sėkmingai sukurta pasirinktinė aplinka  
- [ ] Nustatyti ir pasiekiami aplinkos kintamieji  
- [ ] Programa sėkmingai įdiegta su personalizuota konfigūracija  
- [ ] Galima patikrinti pasirinktinius nustatymus diegtoje programoje  

### 3 užduotis: Darbo eiga su keliomis aplinkomis (25 min)  
**Tikslas**: įvaldyti aplinkų valdymą ir diegimo strategijas

```bash
# Sukurti kūrimo aplinką
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Užrašyti kūrimo URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Sukurti tarpinę aplinką
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Užrašyti tarpinės URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Palyginti aplinkas
azd env list

# Išbandyti abi aplinkas
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Išvalyti abi
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```
  
**Sėkmės kriterijai:**  
- [ ] Sukurtos dvi aplinkos su skirtingomis konfigūracijomis  
- [ ] Abi aplinkos sėkmingai diegiamos  
- [ ] Galima perjungti aplinkas komanda `azd env select`  
- [ ] Aplinkos kintamieji skiriasi tarp aplinkų  
- [ ] Sėkmingai išvalytos abi aplinkos  

## 📊 Jūsų pažanga

**Skirtas laikas**: ~60–90 minučių  
**Įgyti įgūdžiai**:  
- ✅ Projektų inicijavimas iš šablonų  
- ✅ Azure išteklių kūrimas  
- ✅ Programų diegimo darbo eiga  
- ✅ Aplinkų valdymas  
- ✅ Konfigūracijos valdymas  
- ✅ Išteklių valymas ir sąnaudų valdymas  

**Kitas žingsnis**: esate pasiruošę [Konfigūracijos vadovui](configuration.md) mokytis pažangesnių konfiguravimo modelių!

## Dažniausiai pasitaikančių problemų diagnostika

### Autentifikacijos klaidos  
```bash
# Pakartotinai autentifikuokitės su Azure
az login

# Patikrinkite prenumeratos prieigą
az account show
```
  
### Diegimo klaidos  
```bash
# Įjungti derinimo žurnalo fiksavimą
export AZD_DEBUG=true
azd up --debug

# Peržiūrėti programos žurnalus Azure
azd monitor --logs

# Container Apps atveju naudokite Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```
  
### Išteklių pavadinimų konfliktai  
```bash
# Naudokite unikalų aplinkos pavadinimą
azd env new dev-$(whoami)-$(date +%s)
```
  
### Prievado/tinklo problemos  
```bash
# Patikrinkite, ar prievadai yra prieinami
netstat -an | grep :3000
netstat -an | grep :3100
```
  
## Tolimesni žingsniai

Dabar, kai baigėte pirmąjį projektą, tyrinėkite šias pažangias temas:

### 1. Personalizuokite infrastruktūrą  
- [Infrastruktūra kaip kodas](../chapter-04-infrastructure/provisioning.md)  
- [Pridėkite duomenų bazes, saugyklas ir kitas paslaugas](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Sukurkite CI/CD  
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md) – pilna CI/CD darbo eiga  
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) – vamzdyno konfigūracija

### 3. Gamybos gerosios praktikos  
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md) – saugumas, našumas ir stebėjimas

### 4. Tyrinėkite daugiau šablonų  
```bash
# Naršykite šablonus pagal kategoriją
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Išbandykite skirtingas technologijų sankabas
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```
  
## Papildomi ištekliai

### Mokymosi medžiaga  
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure gerai architektūruoto projekto gairės](https://learn.microsoft.com/en-us/azure/well-architected/)

### Bendruomenė ir pagalba  
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)  
- [Azure kūrėjų bendruomenė](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)  
- [Stack Overflow – azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablonai ir pavyzdžiai  
- [Oficialių šablonų galerija](https://azure.github.io/awesome-azd/)  
- [Bendruomenės šablonai](https://github.com/Azure-Samples/azd-templates)  
- [Įmonių modeliai](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Sveikiname baigus pirmąjį azd projektą!** Dabar esate pasiruošę kurti ir patikimai diegti nuostabias programas Azure aplinkoje.

---

**Skyriaus naršymas:**  
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)  
- **📖 Dabartinis skyrius**: 1 skyrius – Pagrindai ir greitas startas  
- **⬅️ Ankstesnis**: [Įdiegimas ir paruošimas](installation.md)  
- **➡️ Sekantis**: [Konfigūracija](configuration.md)  
- **🚀 Kitas skyrius**: [2 skyrius: AI-pirmasis kūrimas](../chapter-02-ai-development/microsoft-foundry-integration.md)  
- **Kita pamoka**: [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už bet kokius nesusipratimus ar neteisingus aiškinimus, kilusius naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
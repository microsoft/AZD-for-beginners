# Jūsų pirmasis projektas - praktinis vadovas

**Chapter Navigation:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: Chapter 1 - Foundation & Quick Start
- **⬅️ Ankstesnis**: [Diegimas ir nustatymas](installation.md)
- **➡️ Kitas**: [Konfigūracija](configuration.md)
- **🚀 Kitas skyrius**: [2 skyrius: AI pirmasis vystymas](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Įvadas

Sveikiname su pirmuoju Azure Developer CLI projektu! Šis išsamus praktinis vadovas pateikia pilną žingsnių seką, kaip sukurti, įdiegti ir valdyti pilno steko programą Azure naudojant azd. Dirbsite su realia todo programa, kuri apima React vartotojo sąsają, Node.js API galinę dalį ir MongoDB duomenų bazę.

## Mokymosi tikslai

Baigę šį vadovą, jūs:
- Įvaldysite azd projekto inicializavimo srautą naudojant šablonus
- Suprasite Azure Developer CLI projekto struktūrą ir konfigūracinius failus
- Atliksite pilną programos diegimą į Azure kartu su infrastruktūros paruošimu
- Įgyvendinsite programos atnaujinimus ir pakartotinio diegimo strategijas
- Valdymą kelioms aplinkoms vystymui ir testavimui
- Taikysite išteklių šalinimo ir išlaidų valdymo praktiką

## Mokymosi rezultatai

Baigę, sugebėsite:
- Savarankiškai inicializuoti ir konfigūruoti azd projektus iš šablonų
- Efektyviai naršyti ir keisti azd projekto struktūras
- Diegti pilno steko programas į Azure naudojant vieną komandą
- Spręsti dažniausias diegimo problemas ir autentifikacijos trikdžius
- Valdyti kelias Azure aplinkas skirtingiems diegimo etapams
- Įgyvendinti nuolatinio diegimo (CI/CD) srautus programos atnaujinimams

## Pradžia

### Būtini reikalavimai
- ✅ Azure Developer CLI įdiegtas ([Diegimo vadovas](installation.md))
- ✅ Įvykdyta AZD autentifikacija naudojant `azd auth login`
- ✅ Git įdiegtas jūsų sistemoje
- ✅ Node.js 16+ (šiam vadovui)
- ✅ Visual Studio Code (rekomenduojama)

Prieš tęsdami, paleiskite sąrankos tikrintuvą iš saugyklos šaknies:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Patikrinkite savo sąranką
```bash
# Patikrinti azd įdiegimą
azd version

# Patikrinti AZD autentifikaciją
azd auth login --check-status
```

### Patikrinkite pasirenkamą Azure CLI autentifikaciją

```bash
az account show
```

### Patikrinkite Node.js versiją
```bash
node --version
```

## 1 žingsnis: Pasirinkite ir inicializuokite šabloną

Pradėkime nuo populiaraus todo programos šablono, kuris apima React frontend'ą ir Node.js API backend'ą.

```bash
# Peržiūrėti prieinamus šablonus
azd template list

# Inicializuoti todo programėlės šabloną
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Sekite nurodymus:
# - Įveskite aplinkos pavadinimą: "dev"
# - Pasirinkite prenumeratą (jei turite kelias prenumeratas)
# - Pasirinkite regioną: "East US 2" (arba jūsų pageidaujamą regioną)
```

### Kas ką tik įvyko?
- Atsisiųstas šablono kodas į jūsų vietinį katalogą
- Sukurtas `azure.yaml` failas su paslaugų apibrėžimais
- Parengtas infrastruktūros kodas `infra/` kataloge
- Sukurta aplinkos konfigūracija

## 2 žingsnis: Tyrinėkite projekto struktūrą

Pažiūrėkime, ką azd mums sukūrė:

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

### Svarbiausi failai, kuriuos reikia suprasti

**azure.yaml** - Jūsų azd projekto širdis:
```bash
# Peržiūrėti projekto konfigūraciją
cat azure.yaml
```

**infra/main.bicep** - Infrastruktūros apibrėžimas:
```bash
# Peržiūrėti infrastruktūros kodą
head -30 infra/main.bicep
```

## 3 žingsnis: Pritaikykite savo projektą (pasirinktinai)

Prieš diegdami, galite pritaikyti programą:

### Redaguokite frontend'ą
```bash
# Atidarykite React programėlės komponentą
code src/web/src/App.tsx
```

Atlikite paprastą pakeitimą:
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

## 4 žingsnis: Diegti į Azure

Dabar įdomioji dalis – įdiekite viską į Azure!

```bash
# Diegti infrastruktūrą ir programą
azd up

# Ši komanda atliks:
# 1. Paruošti Azure išteklius (App Service, Cosmos DB ir kt.)
# 2. Sukurti jūsų programą
# 3. Diegti į paruoštus išteklius
# 4. Parodyti programos URL
```

### Kas vyksta diegiant?

Komanda `azd up` atlieka šiuos veiksmus:
1. **Provizionavimas** (`azd provision`) - Sukuria Azure išteklius
2. **Paketavimas** - Surenka jūsų programos kodą
3. **Diegimas** (`azd deploy`) - Diegia kodą į Azure išteklius

### Tikėtinas rezultatas
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 5 žingsnis: Išbandykite savo programą

### Prisijunkite prie programos
Spustelėkite diegimo išvestyje nurodytą URL arba gaukite jį bet kada:
```bash
# Gauti programos galinius taškus
azd show

# Atidarykite programą savo naršyklėje
azd show --output json | jq -r '.services.web.endpoint'
```

### Išbandykite Todo programą
1. **Pridėti užduotį** - Spustelėkite „Pridėti užduotį“ ir įveskite užduotį
2. **Pažymėti kaip atliktą** - Pažymėkite atliktas užduotis
3. **Ištrinti elementus** - Pašalinkite užduotis, kurių nebereikia

### Stebėkite savo programą
```bash
# Atidarykite Azure portalą savo ištekliams
azd monitor

# Peržiūrėti programos žurnalus
azd monitor --logs

# Peržiūrėti tiesioginius rodiklius
azd monitor --live
```

### ✅ Patikrinkite diegimą

Prieš judėdami toliau, perženkite šį greitą kontrolinį sąrašą, kad patvirtintumėte, jog viskas iš tikrųjų veikia — nesiimkite prielaidos, kad „diegiant pavyko“ reiškia „programa veikia“:

```bash
# 1. Patvirtinkite, kad galinis taškas egzistuoja ir yra pasiekiamas
azd show

# 2. Atlikite greitą patikrinimą (smoke-test) galiniam taškui (tikimasi HTTP 200 atsakymo)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Patikrinkite sveikatos (health) galinį tašką, jei jūsų programa jį teikia
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Diegimas yra patvirtintas kai:**
- ✅ `azd show` pateikia pasiekiamą galinio taško URL
- ✅ URL atsidaro jūsų naršyklėje be klaidų
- ✅ Pagrindinės funkcijos veikia (pridėti/pažymėti kaip atlikta/ištrinti užduotį)
- ✅ `azd monitor --logs` rodo užklausas be nenumatytų klaidų

Jei kurio nors patikrinimo metu kažkas nepavyksta, eikite į [7 skyrius: Trikčių šalinimas](../chapter-07-troubleshooting/README.md).

## 6 žingsnis: Atlikite pakeitimus ir vėl įdiekite

Padarykime pakeitimą ir pažiūrėkime, kaip paprasta atnaujinti:

### Pakeiskite API
```bash
# Redaguokite API kodą
code src/api/src/routes/lists.js
```

Pridėkite pasirinktinę atsako antraštę:
```javascript
// Raskite maršruto tvarkyklę ir pridėkite:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Diegti tik kodo pakeitimus
```bash
# Diegti tik programos kodą (praleisti infrastruktūrą)
azd deploy

# Tai žymiai greičiau nei 'azd up', nes infrastruktūra jau egzistuoja
```

## 7 žingsnis: Valdykite kelias aplinkas

Sukurkite laikinos (staging) aplinką, kad išbandytumėte pakeitimus prieš diegiant į gamybą:

```bash
# Sukurti naują paruošimo (staging) aplinką
azd env new staging

# Diegti į paruošimo (staging) aplinką
azd up

# Perjungti atgal į vystymo (dev) aplinką
azd env select dev

# Išvardyti visas aplinkas
azd env list
```

### Aplinkų palyginimas
```bash
# Peržiūrėti vystymo aplinką
azd env select dev
azd show

# Peržiūrėti paruošiamąją aplinką
azd env select staging
azd show
```

## 8 žingsnis: Išvalykite išteklius

Kai baigsite eksperimentuoti, išvalykite išteklius, kad išvengtumėte nuolatinių išlaidų:

```bash
# Ištrinti visus Azure išteklius iš dabartinės aplinkos
azd down

# Priverstinai ištrinti be patvirtinimo ir galutinai pašalinti laikinai ištrintus išteklius
azd down --force --purge

# Ištrinti konkrečią aplinką
azd env select staging
azd down --force --purge
```

## Klasikinė programa vs. AI palaikoma programa: tas pats darbo srautas

Ką tik įdiegėte tradicinę žiniatinklio programą. O jei norėtumėte vietoje to įdiegti AI palaikomą programą — pavyzdžiui, pokalbių programą, paremta Microsoft Foundry Models?

Gera naujiena: **darbo eiga identiška.**

| Žingsnis | Klasikinė Todo programa | AI pokalbių programa |
|------|-----------------|-------------|
| Inicializuoti | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentifikuoti | `azd auth login` | `azd auth login` |
| Diegti | `azd up` | `azd up` |
| Stebėti | `azd monitor` | `azd monitor` |
| Išvalyti | `azd down --force --purge` | `azd down --force --purge` |

Vienintelis skirtumas yra **šablonas**, nuo kurio pradedate. AI šablonas apima papildomą infrastruktūrą (pvz., Microsoft Foundry Models išteklių arba AI Search indeksą), tačiau azd pasirūpina visu tuo už jus. Jums nereikia mokytis naujų komandų, pereiti prie kito įrankio ar keisti požiūrio į diegimą.

Tai yra pagrindinė azd principo esmė: **vienas darbo srautas, bet kokia darbo apkrova.** Įgūdžiai, kuriuos praktikuojote šiame vadove — inicializavimas, diegimas, stebėjimas, pakartotinis diegimas ir išvalymas — taikomi tiek AI programoms, tiek agentams.

---

## Ko išmokote

Sveikiname! Jūs sėkmingai:
- ✅ Inicializavote azd projektą iš šablono
- ✅ Išnagrinėjote projekto struktūrą ir pagrindinius failus
- ✅ Įdiegėte pilno steko programą į Azure
- ✅ Atlikote kodo pakeitimus ir pakartotinai įdiegėte
- ✅ Valdėte kelias aplinkas
- ✅ Išvalėte išteklius

## 🎯 Įgūdžių patikros užduotys

### Uždavinys 1: Įdiekite kitą šabloną (15 minučių)
**Tikslas**: Įrodyti gebėjimą naudotis azd init ir diegimo srautu

```bash
# Išbandyti Python + MongoDB technologijų rinkinį
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Patikrinti diegimą
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Išvalyti
azd down --force --purge
```

**Sėkmės kriterijai:**
- [ ] Programa diegiama be klaidų
- [ ] Gali pasiekti programos URL naršyklėje
- [ ] Programa veikia tinkamai (pridėti/pašalinti užduotis)
- [ ] Sėkmingai išvalyti visi ištekliai

### Uždavinys 2: Pritaikykite konfigūraciją (20 minučių)
**Tikslas**: Praktikuoti aplinkos kintamųjų konfigūraciją

```bash
cd my-first-azd-app

# Sukurti pasirinktą aplinką
azd env new custom-config

# Nustatyti pasirinktinius kintamuosius
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Patikrinti kintamuosius
azd env get-values | grep APP_TITLE

# Diegti su pasirinkta konfigūracija
azd up
```

**Sėkmės kriterijai:**
- [ ] Pritaikyta aplinka sukurta sėkmingai
- [ ] Aplinkos kintamieji nustatyti ir pasiekiami
- [ ] Programa įdiegta su pritaikyta konfigūracija
- [ ] Galima patikrinti pritaikytus nustatymus diegtoje programoje

### Uždavinys 3: Kelios aplinkos (25 minutes)
**Tikslas**: Įvaldyti aplinkų valdymą ir diegimo strategijas

```bash
# Sukurti vystymo aplinką
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Užfiksuoti vystymo URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Sukurti etapinę aplinką
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Užfiksuoti etapinės aplinkos URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Palyginti aplinkas
azd env list

# Išbandyti abi aplinkas
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Išvalyti abi aplinkas
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Sėkmės kriterijai:**
- [ ] Sukurtos dvi aplinkos su skirtingomis konfigūracijomis
- [ ] Abi aplinkos sėkmingai įdiegtos
- [ ] Galima persijungti tarp aplinkų naudojant `azd env select`
- [ ] Aplinkos kintamieji skiriasi tarp aplinkų
- [ ] Sėkmingai išvalytos abi aplinkos

## 📊 Jūsų pažanga

**Skirtas laikas**: ~60-90 minučių  
**Įgyti įgūdžiai**:
- ✅ Projekto inicializavimas pagal šabloną
- ✅ Azure išteklių provizionavimas
- ✅ Programos diegimo srautai
- ✅ Aplinkų valdymas
- ✅ Konfigūracijos valdymas
- ✅ Išteklių išvalymas ir išlaidų valdymas

**Kitas lygis**: Esate pasiruošę [Konfigūracijos vadovas](configuration.md) sužinoti pažangius konfigūracijos šablonus!

## Dažniausiai pasitaikančios problemos

### Autentifikacijos klaidos
```bash
# Iš naujo prisijunkite prie Azure
az login

# Patikrinkite prenumeratos prieigą
az account show
```

### Diegimo klaidos
```bash
# Įjungti derinimo žurnalavimą
export AZD_DEBUG=true
azd up --debug

# Peržiūrėti programos žurnalus Azure
azd monitor --logs

# Container Apps atveju, naudokite Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Išteklių pavadinimų konfliktai
```bash
# Naudokite unikalų aplinkos pavadinimą
azd env new dev-$(whoami)-$(date +%s)
```

### Prievado/tinklo problemos
```bash
# Patikrinti, ar prievadai prieinami
netstat -an | grep :3000
netstat -an | grep :3100
```

## Kiti žingsniai

Dabar, kai baigėte pirmą projektą, ištirkite šias pažangias temas:

### 1. Pritaikyti infrastruktūrą
- [Infrastruktūra kaip kodas](../chapter-04-infrastructure/provisioning.md)
- [Pridėti duomenų bazes, saugyklą ir kitas paslaugas](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Nustatyti CI/CD
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md) - Pilni CI/CD srautai
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Vamzdyno konfigūravimas

### 3. Gamybos geriausios praktikos
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md) - Saugumas, našumas ir stebėjimas

### 4. Naršykite daugiau šablonų
```bash
# Naršykite šablonus pagal kategoriją
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Išbandykite skirtingus technologijų rinkinius
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Papildomi ištekliai

### Mokymosi medžiaga
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure gerai suprojektuota sistema (Well-Architected Framework)](https://learn.microsoft.com/en-us/azure/well-architected/)

### Bendruomenė ir palaikymas
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablonai ir pavyzdžiai
- [Oficiali šablonų galerija](https://azure.github.io/awesome-azd/)
- [Bendruomenės šablonai](https://github.com/Azure-Samples/azd-templates)
- [Enterprise šablonai](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Sveikiname, kad baigėte pirmą azd projektą!** Dabar esate pasiruošę su pasitikėjimu kurti ir diegti nuostabias programas Azure.

---

**Chapter Navigation:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: Chapter 1 - Foundation & Quick Start
- **⬅️ Ankstesnis**: [Diegimas ir nustatymas](installation.md)
- **➡️ Kitas**: [Naudokite savo programą](bring-your-own-app.md)
- **🚀 Kitas skyrius**: [2 skyrius: AI pirmasis vystymas](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
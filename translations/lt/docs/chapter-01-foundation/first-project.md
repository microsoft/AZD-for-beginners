# Jūsų Pirmasis Projektas - Praktinis Vadovas

**Chapter Navigation:**
- **📚 Course Home**: [AZD pradedantiesiems](../../README.md)
- **📖 Current Chapter**: 1 skyrius - Pagrindai & Greitas pradžios vadovas
- **⬅️ Previous**: [Diegimas ir nustatymas](installation.md)
- **➡️ Next**: [Konfigūracija](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Įžanga

Sveiki atvykę į savo pirmąjį Azure Developer CLI projektą! Šis išsamus praktinis vadovas pateikia pilną žingsnių seką, kaip sukurti, įdiegti ir valdyti pilno režimo programą Azure naudojant azd. Dirbsite su tikra todo programa, kurią sudaro React frontend, Node.js API backend ir MongoDB duomenų bazė.

## Mokymosi tikslai

Baigę šį vadovą jūs:
- Įvaldysite azd projekto inicializavimo srautą naudojant šablonus
- Suprasite Azure Developer CLI projekto struktūrą ir konfigūracijos failus
- Atliksite pilną programos diegimą į Azure su infrastruktūros paruošimu
- Įgyvendinsite programos atnaujinimus ir pakartotinį diegimą
- Valdysite kelias aplinkas vystymui ir paruošimui
- Taikysite išteklių valymo ir kaštų valdymo praktiką

## Mokymosi rezultatai

Baigę, galėsite:
- Nepriklausomai inicializuoti ir konfigūruoti azd projektus iš šablonų
- Naršyti ir keisti azd projekto struktūras efektyviai
- Vienu komandu diegti pilno komplekto programas į Azure
- Spręsti dažniausias diegimo ir autentifikacijos problemas
- Valdyti kelias Azure aplinkas skirtingiems diegimo etapiams
- Įdiegti nuolatinio diegimo (CD) srautus programos atnaujinimams

## Pradžia

### Išankstiniai reikalavimai
- ✅ Azure Developer CLI įdiegtas ([Diegimo vadovas](installation.md))
- ✅ Azure CLI įdiegtas ir autentifikuotas
- ✅ Git įdiegtas jūsų sistemoje
- ✅ Node.js 16+ (šiam vadovui)
- ✅ Visual Studio Code (rekomenduojama)

### Patikrinkite savo aplinką
```bash
# Patikrinkite azd diegimą
azd version
```
### Patikrinkite Azure autentifikaciją

```bash
az account show
```

### Patikrinkite Node.js versiją
```bash
node --version
```

## 1 žingsnis: Pasirinkite ir inicializuokite šabloną

Pradėkime nuo populiaraus todo programos šablono, kuriame yra React frontend ir Node.js API backend.

```bash
# Peržiūrėti galimus šablonus
azd template list

# Inicializuoti todo programėlės šabloną
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Sekite nurodymus:
# - Įveskite aplinkos pavadinimą: "dev"
# - Pasirinkite prenumeratą (jei turite kelias)
# - Pasirinkite regioną: "East US 2" (arba pageidaujamą regioną)
```

### Kas ką tik įvyko?
- Parsisiųstas šablono kodas į jūsų vietinį katalogą
- Sukurtas `azure.yaml` failas su paslaugų apibrėžimais
- Paruoštas infrastruktūros kodas `infra/` kataloge
- Sukonfigūruota aplinkos konfigūracija

## 2 žingsnis: Išnagrinėkite projekto struktūrą

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

### Svarbūs failai, kuriuos reikia suprasti

**azure.yaml** - Jūsų azd projekto šerdis:
```bash
# Peržiūrėti projekto konfigūraciją
cat azure.yaml
```

**infra/main.bicep** - Infrastruktūros apibrėžimas:
```bash
# Peržiūrėti infrastruktūros kodą
head -30 infra/main.bicep
```

## 3 žingsnis: Tinkinkite savo projektą (pasirinktinai)

Prieš diegiant, galite pritaikyti programą:

### Redaguokite frontend'ą
```bash
# Atidarykite React programėlės komponentą
code src/web/src/App.tsx
```

Atlikite paprastą pakeitimą:
```typescript
// Raskite pavadinimą ir pakeiskite jį
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

Dabar pats įdomiausias etapas – įdiekite viską į Azure!

```bash
# Diegti infrastruktūrą ir programą
azd up

# Ši komanda atliks:
# 1. Paruošti Azure išteklius (App Service, Cosmos DB ir kt.)
# 2. Sukurti jūsų programą
# 3. Diegti į paruoštus išteklius
# 4. Parodyti programos URL adresą
```

### Kas vyksta diegimo metu?

`azd up` komanda atlieka šiuos žingsnius:
1. **Paruošimas** (`azd provision`) - Sukuria Azure išteklius
2. **Paketavimas** - Surenka jūsų programos kodą
3. **Diegimas** (`azd deploy`) - Diegia kodą į Azure išteklius

### Laukiama išvestis
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 5 žingsnis: Išbandykite savo programą

### Prieiga prie jūsų programos
Spustelėkite URL, pateiktą diegimo išvestyje, arba pasiekite jį bet kada:
```bash
# Gaukite programos galinius taškus
azd show

# Atidarykite programą naršyklėje
azd show --output json | jq -r '.services.web.endpoint'
```

### Išbandykite Todo programėlę
1. **Pridėti užduotį** - Spustelėkite "Add Todo" ir įveskite užduotį
2. **Pažymėti kaip atliktą** - Pažymėkite atliktas užduotis
3. **Ištrinti elementus** - Pašalinkite užduotis, kurių nebereikia

### Stebėkite savo programą
```bash
# Atidarykite Azure portalą savo ištekliams
azd monitor

# Peržiūrėkite programos žurnalus
azd monitor --logs

# Peržiūrėkite tiesioginius rodiklius
azd monitor --live
```

## 6 žingsnis: Atlikite pakeitimus ir diegkite iš naujo

Padarykime pakeitimą ir pamatykime, kaip lengva atnaujinti:

### Redaguokite API
```bash
# Redaguokite API kodą
code src/api/src/routes/lists.js
```

Pridėkite pasirinktą atsakymo antraštę:
```javascript
// Raskite maršruto tvarkyklę ir pridėkite:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Įdiekite tik kodo pakeitimus
```bash
# Diegti tik programos kodą (praleisti infrastruktūrą)
azd deploy

# Tai gerokai greičiau nei 'azd up', nes infrastruktūra jau egzistuoja
```

## 7 žingsnis: Valdykite kelias aplinkas

Sukurkite parengimo (staging) aplinką, kad išbandytumėte pakeitimus prieš gamybinę aplinką:

```bash
# Sukurti naują tarpinę aplinką
azd env new staging

# Diegti į tarpinę aplinką
azd up

# Perjungti atgal į kūrimo aplinką
azd env select dev

# Išvardinti visas aplinkas
azd env list
```

### Aplinkų palyginimas
```bash
# Peržiūrėti vystymo aplinką
azd env select dev
azd show

# Peržiūrėti parengiamąją aplinką
azd env select staging
azd show
```

## 8 žingsnis: Išvalykite išteklius

Kai baigsite eksperimentuoti, išvalykite, kad išvengtumėte nuolatinių mokesčių:

```bash
# Ištrinti visus Azure išteklius dabartinei aplinkai
azd down

# Priverstinai ištrinti be patvirtinimo ir galutinai pašalinti minkštai ištrintus išteklius
azd down --force --purge

# Ištrinti konkrečią aplinką
azd env select staging
azd down --force --purge
```

## Klasikinė programa vs. AI palaikoma programa: tas pats darbo srautas

Jūs ką tik įdiegėte tradicinę žiniatinklio programą. O ką daryti, jei norėtumėte įdiegti AI palaikomą programą — pavyzdžiui, pokalbių programą, paremta Microsoft Foundry modeliais?

Gera žinia: **darbo eiga yra identiška.**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Vienintelis skirtumas yra **šablonas**, nuo kurio pradedate. AI šablonas apima papildomą infrastruktūrą (pvz., Microsoft Foundry Models išteklių arba AI Search indeksą), tačiau azd visa tai suvaldo už jus. Jums nereikia išmokti naujų komandų, taikyti kitos priemonės ar keisti, kaip mąstote apie diegimą.

Tai yra pagrindinis azd principas: **vienas darbo srautas, bet koks darbo krūvis.** Įgūdžiai, kuriuos praktikuojotės šiame vadove — inicializavimas, diegimas, stebėjimas, pakartotinis diegimas ir išteklių valymas — vienodai taikomi AI programoms ir agentams.

---

## Ko išmokote

Sveikiname! Jūs sėkmingai:
- ✅ Inicializavote azd projektą iš šablono
- ✅ Išnagrinėjote projekto struktūrą ir svarbius failus
- ✅ Įdiegėte pilno komplekto programą į Azure
- ✅ Atlikote kodo pakeitimus ir pertvarkėte (redeploy)
- ✅ Valdėte kelias aplinkas
- ✅ Išvalėte išteklius

## 🎯 Įgūdžių patvirtinimo užduotys

### Užduotis 1: Įdiekite kitą šabloną (15 minučių)
**Tikslas**: Parodyti įvaldytą azd init ir diegimo darbo eigą

```bash
# Išbandyti Python + MongoDB technologijų steką
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
- [ ] Programa diegiasi be klaidų
- [ ] Gali pasiekti programos URL naršyklėje
- [ ] Programa veikia tinkamai (pridėti/pašalinti užduotis)
- [ ] Sėkmingai išvalyti visi ištekliai

### Užduotis 2: Tinkinkite konfigūraciją (20 minučių)
**Tikslas**: Pasitreniruoti aplinkos kintamųjų konfigūravimą

```bash
cd my-first-azd-app

# Sukurti pasirinktą aplinką
azd env new custom-config

# Nustatyti pasirinktus kintamuosius
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Patikrinti kintamuosius
azd env get-values | grep APP_TITLE

# Diegti su pasirinkta konfigūracija
azd up
```

**Sėkmės kriterijai:**
- [ ] Sukurta pasirinktinė aplinka sėkmingai
- [ ] Aplinkos kintamieji nustatyti ir pasiekiami
- [ ] Programa diegiama su pasirinkta konfigūracija
- [ ] Galima patikrinti pasirinktinius nustatymus diegtoje programoje

### Užduotis 3: Darbo eiga kelioms aplinkoms (25 minutės)
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

# Sukurti parengimo aplinką
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Užfiksuoti parengimo aplinkos URL
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
- [ ] Gali perjungti aplinkas naudojant `azd env select`
- [ ] Aplinkos kintamieji skiriasi tarp aplinkų
- [ ] Sėkmingai išvalytos abi aplinkos

## 📊 Jūsų pažanga

**Investuotas laikas**: ~60–90 minučių  
**Įgyti įgūdžiai**:
- ✅ Projekto inicializavimas naudojant šablonus
- ✅ Azure išteklių paruošimas
- ✅ Programos diegimo srautai
- ✅ Aplinkų valdymas
- ✅ Konfigūracijos valdymas
- ✅ Išteklių valymas ir kaštų valdymas

**Kitas lygis**: Jūs pasiruošę [Konfigūracijos vadovui](configuration.md) mokytis pažangių konfigūracijos modelių!

## Dažniausiai pasitaikančios problemos

### Autentifikacijos klaidos
```bash
# Pakartotinai autentifikuokitės su Azure
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

# Container Apps atveju naudokite Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Išteklių vardų konfliktai
```bash
# Naudokite unikalų aplinkos pavadinimą
azd env new dev-$(whoami)-$(date +%s)
```

### Prievado/tinklų problemos
```bash
# Patikrinti, ar prievadai yra prieinami
netstat -an | grep :3000
netstat -an | grep :3100
```

## Tolimesni veiksmai

Dabar, kai baigėte savo pirmą projektą, ištirkite šias pažangias temas:

### 1. Tinkinkite infrastruktūrą
- [Infrastruktūra kaip kodas](../chapter-04-infrastructure/provisioning.md)
- [Pridėti duomenų bazes, saugyklą ir kitas paslaugas](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Sukonfigūruokite CI/CD
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md) - Pilni CI/CD srautai
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Tiesioginės CI/CD gaires

### 3. Gamybinio naudojimo geriausios praktikos
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md) - Saugumas, našumas ir stebėjimas

### 4. Tyrinėkite daugiau šablonų
```bash
# Naršyti šablonus pagal kategoriją
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
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Bendruomenė ir palaikymas
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablonai ir pavyzdžiai
- [Oficiali šablonų galerija](https://azure.github.io/awesome-azd/)
- [Bendruomenės šablonai](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Sveikiname, kad užbaigėte savo pirmą azd projektą!** Dabar esate pasiruošę kurti ir diegti nuostabias programas Azure su pasitikėjimu.

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD pradedantiesiems](../../README.md)
- **📖 Current Chapter**: 1 skyrius - Pagrindai & Greitas pradžios vadovas
- **⬅️ Previous**: [Diegimas ir nustatymas](installation.md)
- **➡️ Next**: [Konfigūracijos](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Esant kritinei informacijai rekomenduojamas profesionalus, žmogaus atliktas vertimas. Mes neatsakome už jokius nesusipratimus ar klaidingas interpretacijas, kylančias iš šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
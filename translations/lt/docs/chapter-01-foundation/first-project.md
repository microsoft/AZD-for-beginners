# Jūsų pirmasis projektas - Praktinė pamoka

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: Chapter 1 - Foundation & Quick Start
- **⬅️ Ankstesnis**: [Diegimas ir nustatymas](installation.md)
- **➡️ Kitas**: [Konfigūracija](configuration.md)
- **🚀 Kitas skyrius**: [2 skyrius: Plėtra, orientuota į dirbtinį intelektą](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Įvadas

Sveiki atvykę į savo pirmą Azure Developer CLI projektą! Šis visapusiškas praktinis vadovas pateikia pilną žingsnis po žingsnio instrukciją, kaip sukurti, diegti ir valdyti viso steko programą Azure naudojant azd. Dirbsite su tikra todo programa, kuri apima React priekinę dalį, Node.js API galinę dalį ir MongoDB duomenų bazę.

## Mokymosi tikslai

Baigę šį vadovą, jūs:
- Įvaldysite azd projekto inicializavimo darbo eigą, naudojant šablonus
- Suprasite Azure Developer CLI projekto struktūrą ir konfigūracijos failus
- Atliksite pilną programos diegimą į Azure su infrastruktūros paruošimu
- Įgyvendinsite programos atnaujinimus ir perdiegimo strategijas
- Valdysite kelias aplinkas vystymui ir bandymams
- Taikysite išteklių šalinimo ir kaštų valdymo praktikas

## Mokymosi rezultatai

Baigę kursą, galėsite:
- Nepriklausomai inicializuoti ir konfigūruoti azd projektus iš šablonų
- Efektyviai naršyti ir keisti azd projektų struktūras
- Diegti viso steko programas į Azure vienais komandomis
- Spręsti dažniausias diegimo problemas ir autentifikacijos klaidas
- Valdyti kelias Azure aplinkas skirtingiems diegimo etapams
- Įgyvendinti nuolatinio diegimo darbo eigas programos atnaujinimams

## Pradžia

### Išankstiniai reikalavimai
- ✅ Azure Developer CLI įdiegta ([Diegimo vadovas](installation.md))
- ✅ Azure CLI įdiegta ir autentifikuota
- ✅ Git įdiegtas jūsų sistemoje
- ✅ Node.js 16+ (šiam vadovui)
- ✅ Visual Studio Code (rekomenduojama)

### Patikrinkite savo sąranką
```bash
# Patikrinkite azd diegimą
azd version
```
### Patvirtinkite Azure autentifikaciją

```bash
az account show
```

### Patikrinkite Node.js versiją
```bash
node --version
```

## 1 žingsnis: Pasirinkite ir inicializuokite šabloną

Pradėkime nuo populiaraus todo programėlės šablono, kuris apima React priekinę dalį ir Node.js API galinę dalį.

```bash
# Naršyti prieinamus šablonus
azd template list

# Inicializuoti todo programėlės šabloną
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Vykdykite nurodymus:
# - Įveskite aplinkos pavadinimą: "dev"
# - Pasirinkite prenumeratą (jei turite kelias)
# - Pasirinkite regioną: "East US 2" (arba pageidaujamą regioną)
```

### Kas ką tik įvyko?
- Atsisiųstas šablono kodas į jūsų vietinį katalogą
- Sukurtas `azure.yaml` failas su paslaugų apibrėžimais
- Paruoštas infrastruktūros kodas `infra/` kataloge
- Sukurta aplinkos konfigūracija

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

### Svarbiausi failai, kuriuos reikia suprasti

**azure.yaml** - Jūsų azd projekto širdis:
```bash
# Peržiūrėti projekto konfigūraciją
cat azure.yaml
```

**infra/main.bicep** - Infrastruktūros aprašymas:
```bash
# Peržiūrėti infrastruktūros kodą
head -30 infra/main.bicep
```

## 3 žingsnis: Tinkinkite savo projektą (neprivaloma)

Prieš diegdami, galite pritaikyti programą:

### Redaguokite priekinę dalį
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

## 4 žingsnis: Diegti į Azure

Dabar – įdomioji dalis – diegti viską į Azure!

```bash
# Diegti infrastruktūrą ir programą
azd up

# Ši komanda atliks:
# 1. Sukurti Azure išteklius (App Service, Cosmos DB ir kt.)
# 2. Sukompiliuoti jūsų programą
# 3. Diegti į sukurtus išteklius
# 4. Parodyti programos URL
```

### Kas vyksta diegimo metu?

Komanda `azd up` atlieka šiuos veiksmus:
1. **Provision** (`azd provision`) - Sukuria Azure išteklius
2. **Package** - Surenka jūsų programos kodą
3. **Deploy** (`azd deploy`) - Diegia kodą į Azure išteklius

### Tikėtinas išvestis
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
Spustelėkite diegimo išvestyje pateiktą URL arba pasiekite jį bet kada:
```bash
# Gauti programos galinius taškus
azd show

# Atidarykite programą naršyklėje
azd show --output json | jq -r '.services.web.endpoint'
```

### Išbandykite Todo programėlę
1. **Add a todo item** - Spustelėkite "Add Todo" ir įveskite užduotį
2. **Mark as complete** - Pažymėkite užbaigtus įrašus
3. **Delete items** - Ištrinkite nebereikalingus todo elementus

### Stebėkite savo programą
```bash
# Atidaryti Azure portalą savo ištekliams
azd monitor

# Peržiūrėti programos žurnalus
azd monitor --logs

# Peržiūrėti tiesioginius rodiklius
azd monitor --live
```

## 6 žingsnis: Atlikite pakeitimus ir iš naujo įdiekite

Atlikime pakeitimą ir pažiūrėkime, kaip lengva atnaujinti:

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

# Tai daug greičiau nei 'azd up', nes infrastruktūra jau egzistuoja
```

## 7 žingsnis: Valdykite kelias aplinkas

Sukurkite testavimo (staging) aplinką, kad išbandytumėte pakeitimus prieš diegiant gamyboje:

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
# Peržiūrėti kūrimo aplinką
azd env select dev
azd show

# Peržiūrėti parengtinę aplinką
azd env select staging
azd show
```

## 8 žingsnis: Išvalykite išteklius

Kai baigsite eksperimentuoti, išvalykite išteklius, kad išvengtumėte nuolatinių mokesčių:

```bash
# Ištrinti visus Azure išteklius dabartinei aplinkai
azd down

# Priverstinai ištrinti be patvirtinimo ir galutinai pašalinti minkštai ištrintus išteklius
azd down --force --purge

# Ištrinti konkrečią aplinką
azd env select staging
azd down --force --purge
```

## Ko išmokote

Sveikiname! Jums sėkmingai pavyko:
- ✅ Inicializuoti azd projektą iš šablono
- ✅ Išnagrinėti projekto struktūrą ir svarbius failus
- ✅ Įdiegti viso steko programą į Azure
- ✅ Atlikti kodo pakeitimus ir perdiegti
- ✅ Valdyti kelias aplinkas
- ✅ Išvalyti išteklius

## 🎯 Įgūdžių patikrinimo užduotys

### Užduotis 1: Įdiekite kitą šabloną (15 minučių)
**Tikslas**: Įrodyti azd init ir diegimo proceso įvaldymą

```bash
# Išbandyti Python ir MongoDB derinį
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
- [ ] Programa įdiegta be klaidų
- [ ] Galima pasiekti programos URL naršyklėje
- [ ] Programa veikia teisingai (pridėti/pašalinti todo)
- [ ] Sėkmingai išvalyti visi ištekliai

### Užduotis 2: Tinkinkite konfigūraciją (20 minučių)
**Tikslas**: Praktikuoti aplinkos kintamųjų konfigūravimą

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
- [ ] Sukurta pasirinktinė aplinka sėkmingai
- [ ] Aplinkos kintamieji nustatyti ir juos galima gauti
- [ ] Programa įdiegta su pasirinktinėmis konfigūracijomis
- [ ] Galima patikrinti pasirinktines nuostatas diegtoje programoje

### Užduotis 3: Darbas su keliomis aplinkomis (25 minučių)
**Tikslas**: Įvaldyti aplinkų valdymą ir diegimo strategijas

```bash
# Sukurti kūrimo aplinką
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Užfiksuoti kūrimo URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Sukurti parengimo aplinką
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Užfiksuoti parengimo URL
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
- [ ] Galima perjungti aplinkas naudojant `azd env select`
- [ ] Aplinkos kintamieji skiriasi tarp aplinkų
- [ ] Sėkmingai išvalytos abi aplinkos

## 📊 Jūsų pažanga

**Investuotas laikas**: ~60-90 minučių  
**Įgyti įgūdžiai**:
- ✅ Projekto inicializavimas naudojant šablonus
- ✅ Azure išteklių paruošimas
- ✅ Programos diegimo darbo eiga
- ✅ Aplinkų valdymas
- ✅ Konfigūracijos valdymas
- ✅ Išteklių šalinimas ir kaštų valdymas

**Kitas lygis**: Esate pasiruošę peržiūrėti [Konfigūracijos vadovą](configuration.md), kad sužinotumėte pažangesnius konfigūracijos modelius!

## Dažniausiai pasitaikančios problemos

### Autentifikacijos klaidos
```bash
# Iš naujo autentifikuoti su Azure
az login

# Patikrinti prieigą prie prenumeratos
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

### Išteklių pavadinimų konfliktai
```bash
# Naudokite unikalų aplinkos pavadinimą
azd env new dev-$(whoami)-$(date +%s)
```

### Prievado/tinklo problemos
```bash
# Patikrinkite, ar prievadai yra laisvi
netstat -an | grep :3000
netstat -an | grep :3100
```

## Kiti žingsniai

Kadangi baigėte savo pirmą projektą, ištirkite šias pažangias temas:

### 1. Tinkinkite infrastruktūrą
- [Infrastruktūra kaip kodas](../chapter-04-infrastructure/provisioning.md)
- [Pridėti duomenų bazes, saugyklas ir kitas paslaugas](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Sukurkite CI/CD
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md) - Pilnos CI/CD darbo eigos
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - CI/CD vamzdynų konfigūracija

### 3. Gamybinės aplinkos geriausios praktikos
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md) - Saugumas, našumas ir stebėjimas

### 4. Ištirkite daugiau šablonų
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
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Bendruomenė ir palaikymas
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablonai ir pavyzdžiai
- [Oficiali šablonų galerija](https://azure.github.io/awesome-azd/)
- [Bendruomenės šablonai](https://github.com/Azure-Samples/azd-templates)
- [Įmonių modeliai](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Sveikiname baigus savo pirmą azd projektą!** Dabar esate pasirengę kurti ir diegti nuostabias programas Azure su pasitikėjimu.

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: Chapter 1 - Foundation & Quick Start
- **⬅️ Ankstesnis**: [Diegimas ir nustatymas](installation.md)
- **➡️ Kitas**: [Konfigūracija](configuration.md)
- **🚀 Kitas skyrius**: [2 skyrius: Plėtra, orientuota į dirbtinį intelektą](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Kitas pamoka**: [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės atsisakymas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti vertimo tikslumą, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo pradinėje (originalioje) kalboje turėtų būti laikomas autoritetingu šaltiniu. Esant svarbiai arba kritinei informacijai rekomenduojame pasitelkti profesionalų žmogaus vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingas interpretacijas, kilusias dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
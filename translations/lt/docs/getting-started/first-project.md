<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-24T09:52:05+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "lt"
}
-->
# Jūsų pirmasis projektas - praktinis vadovas

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 1 skyrius - Pagrindai ir greitas startas
- **⬅️ Ankstesnis**: [Įdiegimas ir nustatymas](installation.md)
- **➡️ Kitas**: [Konfigūracija](configuration.md)
- **🚀 Kitas skyrius**: [2 skyrius: AI-pirmasis vystymas](../microsoft-foundry/microsoft-foundry-integration.md)

## Įvadas

Sveiki atvykę į savo pirmąjį Azure Developer CLI projektą! Šis išsamus praktinis vadovas suteiks jums pilną apžvalgą, kaip sukurti, diegti ir valdyti pilno funkcionalumo aplikaciją Azure naudojant azd. Jūs dirbsite su realia užduočių aplikacija, kuri apima React frontendą, Node.js API backendą ir MongoDB duomenų bazę.

## Mokymosi tikslai

Baigę šį vadovą, jūs:
- Įvaldysite azd projekto inicializavimo procesą naudojant šablonus
- Suprasite Azure Developer CLI projekto struktūrą ir konfigūracijos failus
- Vykdysite pilną aplikacijos diegimą Azure su infrastruktūros paruošimu
- Įgyvendinsite aplikacijos atnaujinimus ir pakartotinio diegimo strategijas
- Valdysite kelias aplinkas vystymui ir testavimui
- Taikysite resursų valymo ir kaštų valdymo praktikas

## Mokymosi rezultatai

Baigę, jūs galėsite:
- Savarankiškai inicializuoti ir konfigūruoti azd projektus iš šablonų
- Efektyviai naršyti ir modifikuoti azd projekto struktūras
- Diegti pilno funkcionalumo aplikacijas Azure naudojant vieną komandą
- Spręsti dažniausiai pasitaikančias diegimo ir autentifikacijos problemas
- Valdyti kelias Azure aplinkas skirtingiems diegimo etapams
- Įgyvendinti nuolatinio diegimo procesus aplikacijos atnaujinimams

## Pradžia

### Būtini reikalavimai
- ✅ Įdiegtas Azure Developer CLI ([Įdiegimo vadovas](installation.md))
- ✅ Įdiegtas ir autentifikuotas Azure CLI
- ✅ Įdiegtas Git jūsų sistemoje
- ✅ Node.js 16+ (šiam vadovui)
- ✅ Visual Studio Code (rekomenduojama)

### Patikrinkite savo nustatymus
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

Pradėkime nuo populiaraus užduočių aplikacijos šablono, kuris apima React frontendą ir Node.js API backendą.

```bash
# Naršykite galimus šablonus
azd template list

# Inicializuokite užduočių programos šabloną
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Sekite nurodymus:
# - Įveskite aplinkos pavadinimą: "dev"
# - Pasirinkite prenumeratą (jei turite kelias)
# - Pasirinkite regioną: "East US 2" (arba jūsų pageidaujamą regioną)
```

### Kas ką tik įvyko?
- Atsisiųstas šablono kodas į jūsų vietinį katalogą
- Sukurtas `azure.yaml` failas su paslaugų apibrėžimais
- Nustatytas infrastruktūros kodas kataloge `infra/`
- Sukurta aplinkos konfigūracija

## 2 žingsnis: Ištyrinėkite projekto struktūrą

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

### Pagrindiniai failai, kuriuos reikia suprasti

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

## 3 žingsnis: Pritaikykite savo projektą (pasirinktinai)

Prieš diegiant, galite pritaikyti aplikaciją:

### Modifikuokite frontendą
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

Dabar pats įdomiausias momentas - viską diegiame į Azure!

```bash
# Diegti infrastruktūrą ir programą
azd up

# Ši komanda atliks:
# 1. Paruoš Azure išteklius (App Service, Cosmos DB ir kt.)
# 2. Sukurs jūsų programą
# 3. Diegs į paruoštus išteklius
# 4. Parodys programos URL
```

### Kas vyksta diegimo metu?

Komanda `azd up` atlieka šiuos veiksmus:
1. **Paruošimas** (`azd provision`) - Sukuria Azure resursus
2. **Pakavimas** - Sukuria jūsų aplikacijos kodą
3. **Diegimas** (`azd deploy`) - Diegia kodą į Azure resursus

### Tikėtinas rezultatas
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 5 žingsnis: Testuokite savo aplikaciją

### Pasiekite savo aplikaciją
Spustelėkite URL, pateiktą diegimo išvestyje, arba pasiekite jį bet kada:
```bash
# Gauti programos galinius taškus
azd show

# Atidaryti programą naršyklėje
azd show --output json | jq -r '.services.web.endpoint'
```

### Testuokite užduočių aplikaciją
1. **Pridėkite užduotį** - Spustelėkite "Pridėti užduotį" ir įveskite užduotį
2. **Pažymėkite kaip atliktą** - Pažymėkite atliktas užduotis
3. **Ištrinkite užduotis** - Pašalinkite nereikalingas užduotis

### Stebėkite savo aplikaciją
```bash
# Atidarykite Azure portalą savo ištekliams
azd monitor

# Peržiūrėkite programos žurnalus
azd logs
```

## 6 žingsnis: Padarykite pakeitimus ir pakartotinai diekite

Padarykime pakeitimą ir pažiūrėkime, kaip lengva atnaujinti:

### Modifikuokite API
```bash
# Redaguoti API kodą
code src/api/src/routes/lists.js
```

Pridėkite pasirinktą atsakymo antraštę:
```javascript
// Raskite maršruto tvarkyklę ir pridėkite:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Diekite tik kodo pakeitimus
```bash
# Diegti tik programos kodą (praleisti infrastruktūrą)
azd deploy

# Tai yra daug greičiau nei 'azd up', nes infrastruktūra jau egzistuoja
```

## 7 žingsnis: Valdykite kelias aplinkas

Sukurkite testavimo aplinką, kad patikrintumėte pakeitimus prieš gamybą:

```bash
# Sukurti naują paruošimo aplinką
azd env new staging

# Diegti į paruošimo aplinką
azd up

# Grįžti į kūrimo aplinką
azd env select dev

# Išvardinti visas aplinkas
azd env list
```

### Aplinkų palyginimas
```bash
# Peržiūrėti kūrimo aplinką
azd env select dev
azd show

# Peržiūrėti testavimo aplinką
azd env select staging
azd show
```

## 8 žingsnis: Išvalykite resursus

Kai baigsite eksperimentuoti, išvalykite, kad išvengtumėte nuolatinių mokesčių:

```bash
# Ištrinti visus Azure išteklius dabartinei aplinkai
azd down

# Priverstinai ištrinti be patvirtinimo ir išvalyti minkštai ištrintus išteklius
azd down --force --purge

# Ištrinti konkrečią aplinką
azd env select staging
azd down --force --purge
```

## Ką išmokote

Sveikiname! Jūs sėkmingai:
- ✅ Inicializavote azd projektą iš šablono
- ✅ Ištyrinėjote projekto struktūrą ir pagrindinius failus
- ✅ Diegėte pilno funkcionalumo aplikaciją į Azure
- ✅ Padarėte kodo pakeitimus ir pakartotinai diegėte
- ✅ Valdėte kelias aplinkas
- ✅ Išvalėte resursus

## 🎯 Įgūdžių patikrinimo užduotys

### Užduotis 1: Diekite kitą šabloną (15 minučių)
**Tikslas**: Pademonstruoti azd inicializavimo ir diegimo procesų įvaldymą

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
- [ ] Aplikacija diegiama be klaidų
- [ ] Galite pasiekti aplikacijos URL naršyklėje
- [ ] Aplikacija veikia tinkamai (pridėti/pašalinti užduotis)
- [ ] Sėkmingai išvalyti visi resursai

### Užduotis 2: Pritaikykite konfigūraciją (20 minučių)
**Tikslas**: Praktikuoti aplinkos kintamųjų konfigūraciją

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
- [ ] Sėkmingai sukurta pasirinktinė aplinka
- [ ] Aplinkos kintamieji nustatyti ir pasiekiami
- [ ] Aplikacija diegiama su pasirinktinėmis konfigūracijomis
- [ ] Galite patikrinti pasirinktinės konfigūracijos nustatymus aplikacijoje

### Užduotis 3: Daugiaaplinkos darbo eiga (25 minutės)
**Tikslas**: Įvaldyti aplinkų valdymo ir diegimo strategijas

```bash
# Sukurti kūrimo aplinką
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Pažymėti kūrimo URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Sukurti testavimo aplinką
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Pažymėti testavimo URL
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
- [ ] Galite perjungti aplinkas naudodami `azd env select`
- [ ] Aplinkos kintamieji skiriasi tarp aplinkų
- [ ] Sėkmingai išvalytos abi aplinkos

## 📊 Jūsų pažanga

**Investuotas laikas**: ~60-90 minučių  
**Įgyti įgūdžiai**:
- ✅ Šablonais pagrįsta projekto inicializacija
- ✅ Azure resursų paruošimas
- ✅ Aplikacijos diegimo procesai
- ✅ Aplinkų valdymas
- ✅ Konfigūracijos valdymas
- ✅ Resursų valymas ir kaštų valdymas

**Kitas lygis**: Jūs pasiruošę [Konfigūracijos vadovui](configuration.md), kad išmoktumėte pažangias konfigūracijos schemas!

## Dažniausiai pasitaikančių problemų sprendimas

### Autentifikacijos klaidos
```bash
# Pakartotinai autentifikuokite su Azure
az login

# Patikrinkite prenumeratos prieigą
az account show
```

### Diegimo nesėkmės
```bash
# Įjungti derinimo žurnalavimą
export AZD_DEBUG=true
azd up --debug

# Peržiūrėti išsamius žurnalus
azd logs --service api
azd logs --service web
```

### Resursų pavadinimų konfliktai
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

## Kiti žingsniai

Dabar, kai baigėte savo pirmąjį projektą, išnagrinėkite šias pažangias temas:

### 1. Pritaikykite infrastruktūrą
- [Infrastruktūra kaip kodas](../deployment/provisioning.md)
- [Pridėkite duomenų bazes, saugyklas ir kitas paslaugas](../deployment/provisioning.md#adding-services)

### 2. Nustatykite CI/CD
- [GitHub Actions integracija](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Gamybos geriausios praktikos
- [Saugumo konfigūracijos](../deployment/best-practices.md#security)
- [Veikimo optimizavimas](../deployment/best-practices.md#performance)
- [Stebėjimas ir žurnalai](../deployment/best-practices.md#monitoring)

### 4. Išbandykite daugiau šablonų
```bash
# Naršykite šablonus pagal kategoriją
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Išbandykite skirtingas technologijų grupes
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Papildomi ištekliai

### Mokymosi medžiaga
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure gerai suprojektuota sistema](https://learn.microsoft.com/en-us/azure/well-architected/)

### Bendruomenė ir palaikymas
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer bendruomenė](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablonai ir pavyzdžiai
- [Oficiali šablonų galerija](https://azure.github.io/awesome-azd/)
- [Bendruomenės šablonai](https://github.com/Azure-Samples/azd-templates)
- [Įmonių modeliai](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Sveikiname baigus savo pirmąjį azd projektą!** Dabar esate pasiruošę kurti ir diegti nuostabias aplikacijas Azure su pasitikėjimu.

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 1 skyrius - Pagrindai ir greitas startas
- **⬅️ Ankstesnis**: [Įdiegimas ir nustatymas](installation.md)
- **➡️ Kitas**: [Konfigūracija](configuration.md)
- **🚀 Kitas skyrius**: [2 skyrius: AI-pirmasis vystymas](../microsoft-foundry/microsoft-foundry-integration.md)
- **Kita pamoka**: [Diegimo vadovas](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus aiškinimus, atsiradusius naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
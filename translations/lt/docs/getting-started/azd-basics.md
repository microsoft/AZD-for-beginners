<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b0f9bb7d2efce4196ceab8e3269080d3",
  "translation_date": "2025-09-10T13:47:19+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "lt"
}
-->
# AZD Pagrindai - Azure Developer CLI supratimas

## Įvadas

Šioje pamokoje susipažinsite su Azure Developer CLI (azd) – galingu komandų eilutės įrankiu, kuris pagreitina perėjimą nuo vietinio kūrimo iki diegimo Azure. Sužinosite pagrindines sąvokas, pagrindines funkcijas ir kaip azd supaprastina debesų technologijomis paremtų programų diegimą.

## Mokymosi tikslai

Šios pamokos pabaigoje jūs:
- Suprasite, kas yra Azure Developer CLI ir jo pagrindinę paskirtį
- Išmoksite pagrindines sąvokas apie šablonus, aplinkas ir paslaugas
- Susipažinsite su pagrindinėmis funkcijomis, įskaitant šablonais paremtą kūrimą ir infrastruktūrą kaip kodą
- Suprasite azd projekto struktūrą ir darbo eigą
- Būsite pasiruošę įdiegti ir sukonfigūruoti azd savo kūrimo aplinkoje

## Mokymosi rezultatai

Baigę šią pamoką, jūs galėsite:
- Paaiškinti azd vaidmenį šiuolaikinėse debesų kūrimo darbo eigose
- Atpažinti azd projekto struktūros komponentus
- Apibūdinti, kaip šablonai, aplinkos ir paslaugos veikia kartu
- Suprasti infrastruktūros kaip kodo privalumus naudojant azd
- Atpažinti skirtingas azd komandas ir jų paskirtį

## Kas yra Azure Developer CLI (azd)?

Azure Developer CLI (azd) yra komandų eilutės įrankis, skirtas pagreitinti perėjimą nuo vietinio kūrimo iki diegimo Azure. Jis supaprastina debesų technologijomis paremtų programų kūrimo, diegimo ir valdymo procesą.

## Pagrindinės sąvokos

### Šablonai
Šablonai yra azd pagrindas. Jie apima:
- **Programos kodą** – jūsų šaltinio kodą ir priklausomybes
- **Infrastruktūros apibrėžimus** – Azure išteklius, apibrėžtus naudojant Bicep arba Terraform
- **Konfigūracijos failus** – nustatymus ir aplinkos kintamuosius
- **Diegimo scenarijus** – automatizuotas diegimo darbo eigas

### Aplinkos
Aplinkos atspindi skirtingas diegimo paskirtis:
- **Kūrimas** – testavimui ir kūrimui
- **Bandomoji** – prieš gamybą skirta aplinka
- **Gamybinė** – veikianti gamybinė aplinka

Kiekviena aplinka turi savo:
- Azure išteklių grupę
- Konfigūracijos nustatymus
- Diegimo būseną

### Paslaugos
Paslaugos yra jūsų programos sudedamosios dalys:
- **Priekinė dalis** – žiniatinklio programos, vieno puslapio programos (SPA)
- **Galinė dalis** – API, mikropaslaugos
- **Duomenų bazė** – duomenų saugojimo sprendimai
- **Saugykla** – failų ir blob saugykla

## Pagrindinės funkcijos

### 1. Šablonais paremtas kūrimas
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastruktūra kaip kodas
- **Bicep** – Azure specifinė kalba
- **Terraform** – daugiadebesinė infrastruktūros priemonė
- **ARM šablonai** – Azure Resource Manager šablonai

### 3. Integruotos darbo eigos
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Aplinkų valdymas
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Projekto struktūra

Tipinė azd projekto struktūra:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Konfigūracijos failai

### azure.yaml
Pagrindinis projekto konfigūracijos failas:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Aplinkai specifinė konfigūracija:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Dažniausios darbo eigos

### Naujo projekto pradžia
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Kūrimo ciklas
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## Komandos `azd down --force --purge` supratimas
Komanda `azd down --force --purge` yra galingas būdas visiškai pašalinti jūsų azd aplinką ir visus susijusius išteklius. Štai ką daro kiekvienas parametras:
```
--force
```
- Praleidžia patvirtinimo užklausas.
- Naudinga automatizavimui ar scenarijams, kur rankinis įsikišimas nėra įmanomas.
- Užtikrina, kad pašalinimas vyktų be pertraukų, net jei CLI aptinka neatitikimų.

```
--purge
```
Ištrina **visą susijusią metainformaciją**, įskaitant:
- Aplinkos būseną
- Vietinį `.azure` aplanką
- Talpykloje saugomą diegimo informaciją
- Neleidžia azd „atsiminti“ ankstesnių diegimų, kurie gali sukelti problemų, pvz., neatitinkančias išteklių grupes ar pasenusias registrų nuorodas.

### Kodėl naudoti abu?
Kai susiduriate su problemomis naudojant `azd up` dėl likusios būsenos ar dalinių diegimų, šis derinys užtikrina **švarią pradžią**.

Tai ypač naudinga po rankinio išteklių pašalinimo Azure portale arba keičiant šablonus, aplinkas ar išteklių grupių pavadinimų konvencijas.

### Kelių aplinkų valdymas
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Navigacijos komandos

### Atradimas
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Projekto valdymas
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Stebėjimas
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Geriausios praktikos

### 1. Naudokite prasmingus pavadinimus
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Pasinaudokite šablonais
- Pradėkite nuo esamų šablonų
- Pritaikykite juos savo poreikiams
- Kurkite pakartotinai naudojamus šablonus savo organizacijai

### 3. Aplinkų izoliacija
- Naudokite atskiras aplinkas kūrimui/bandomajai/gamybinei aplinkai
- Niekada nediekite tiesiai į gamybinę aplinką iš vietinio kompiuterio
- Naudokite CI/CD procesus gamybinėms diegimams

### 4. Konfigūracijos valdymas
- Naudokite aplinkos kintamuosius jautriems duomenims
- Laikykite konfigūraciją versijų valdymo sistemoje
- Dokumentuokite aplinkai specifinius nustatymus

## Mokymosi progresija

### Pradedantysis (1-2 savaitės)
1. Įdiekite azd ir autentifikuokite
2. Diekite paprastą šabloną
3. Supraskite projekto struktūrą
4. Išmokite pagrindines komandas (up, down, deploy)

### Vidutinis (3-4 savaitės)
1. Pritaikykite šablonus
2. Valdykite kelias aplinkas
3. Supraskite infrastruktūros kodą
4. Sukurkite CI/CD procesus

### Pažengęs (5+ savaitės)
1. Kurkite savo šablonus
2. Pažangūs infrastruktūros modeliai
3. Diegimai keliuose regionuose
4. Įmonės lygio konfigūracijos

## Kiti žingsniai

- [Diegimas ir nustatymas](installation.md) – Įdiekite ir sukonfigūruokite azd
- [Jūsų pirmasis projektas](first-project.md) – Praktinis vadovas
- [Konfigūracijos vadovas](configuration.md) – Pažangios konfigūracijos parinktys

## Papildomi ištekliai

- [Azure Developer CLI apžvalga](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Šablonų galerija](https://azure.github.io/awesome-azd/)
- [Bendruomenės pavyzdžiai](https://github.com/Azure-Samples)

---

**Navigacija**
- **Ankstesnė pamoka**: [README](../../README.md)
- **Kita pamoka**: [Diegimas ir nustatymas](installation.md)

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius naudojant šį vertimą.
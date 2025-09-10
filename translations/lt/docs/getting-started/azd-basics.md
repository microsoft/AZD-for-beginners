<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-10T06:15:37+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "lt"
}
-->
# AZD Pagrindai - Azure Developer CLI supratimas

## Įvadas

Ši pamoka supažindins jus su Azure Developer CLI (azd), galingu komandų eilutės įrankiu, kuris pagreitina jūsų kelią nuo vietinio kūrimo iki diegimo Azure platformoje. Sužinosite pagrindines sąvokas, pagrindines funkcijas ir kaip azd supaprastina debesų technologijomis pagrįstų programų diegimą.

## Mokymosi tikslai

Pamokos pabaigoje jūs:
- Suprasite, kas yra Azure Developer CLI ir jo pagrindinę paskirtį
- Išmoksite pagrindines sąvokas, tokias kaip šablonai, aplinkos ir paslaugos
- Susipažinsite su pagrindinėmis funkcijomis, įskaitant šablonais pagrįstą kūrimą ir infrastruktūrą kaip kodą
- Suprasite azd projekto struktūrą ir darbo eigą
- Būsite pasiruošę įdiegti ir sukonfigūruoti azd savo kūrimo aplinkoje

## Mokymosi rezultatai

Baigę šią pamoką, galėsite:
- Paaiškinti azd vaidmenį šiuolaikiniuose debesų technologijų kūrimo procesuose
- Identifikuoti azd projekto struktūros komponentus
- Apibūdinti, kaip šablonai, aplinkos ir paslaugos veikia kartu
- Suprasti infrastruktūros kaip kodo privalumus naudojant azd
- Atpažinti skirtingas azd komandas ir jų paskirtį

## Kas yra Azure Developer CLI (azd)?

Azure Developer CLI (azd) yra komandų eilutės įrankis, sukurtas pagreitinti jūsų kelią nuo vietinio kūrimo iki diegimo Azure platformoje. Jis supaprastina debesų technologijomis pagrįstų programų kūrimo, diegimo ir valdymo procesus.

## Pagrindinės sąvokos

### Šablonai
Šablonai yra azd pagrindas. Jie apima:
- **Programos kodą** - Jūsų šaltinio kodą ir priklausomybes
- **Infrastruktūros apibrėžimus** - Azure išteklius, apibrėžtus naudojant Bicep arba Terraform
- **Konfigūracijos failus** - Nustatymus ir aplinkos kintamuosius
- **Diegimo scenarijus** - Automatizuotus diegimo procesus

### Aplinkos
Aplinkos atspindi skirtingus diegimo tikslus:
- **Kūrimas** - Testavimui ir kūrimui
- **Tarpinė** - Prieš gamybos aplinka
- **Gamyba** - Veikianti gamybos aplinka

Kiekviena aplinka turi savo:
- Azure išteklių grupę
- Konfigūracijos nustatymus
- Diegimo būseną

### Paslaugos
Paslaugos yra jūsų programos statybiniai blokai:
- **Frontend** - Internetinės programos, SPAs
- **Backend** - API, mikroservisai
- **Duomenų bazė** - Duomenų saugojimo sprendimai
- **Saugykla** - Failų ir blob saugykla

## Pagrindinės funkcijos

### 1. Šablonais pagrįstas kūrimas
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastruktūra kaip kodas
- **Bicep** - Azure specifinė kalba
- **Terraform** - Įrankis kelių debesų infrastruktūrai
- **ARM šablonai** - Azure Resource Manager šablonai

### 3. Integruotos darbo eigos
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
azd down          # Clean up resources
```

### 4. Aplinkos valdymas
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
azd down --force --purge
```

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

### Paieška
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
- Pritaikykite pagal savo poreikius
- Kurkite pakartotinai naudojamus šablonus savo organizacijai

### 3. Aplinkų izoliacija
- Naudokite atskiras aplinkas kūrimui/tarpinei/gamybai
- Niekada nediegkite tiesiai į gamybą iš vietinio kompiuterio
- Naudokite CI/CD procesus gamybos diegimams

### 4. Konfigūracijos valdymas
- Naudokite aplinkos kintamuosius jautriems duomenims
- Laikykite konfigūraciją versijų kontrolėje
- Dokumentuokite aplinkai specifinius nustatymus

## Mokymosi progresija

### Pradedantysis (1-2 savaitės)
1. Įdiekite azd ir autentifikuokite
2. Diegkite paprastą šabloną
3. Supraskite projekto struktūrą
4. Išmokite pagrindines komandas (up, down, deploy)

### Vidutinis (3-4 savaitės)
1. Pritaikykite šablonus
2. Valdykite kelias aplinkas
3. Supraskite infrastruktūros kodą
4. Nustatykite CI/CD procesus

### Pažengęs (5+ savaitės)
1. Kurkite pasirinktinius šablonus
2. Išplėstiniai infrastruktūros modeliai
3. Diegimai keliuose regionuose
4. Konfigūracijos sprendimai įmonės lygmeniu

## Kiti žingsniai

- [Diegimas ir nustatymas](installation.md) - Įdiekite ir sukonfigūruokite azd
- [Jūsų pirmasis projektas](first-project.md) - Praktinis vadovas
- [Konfigūracijos vadovas](configuration.md) - Išplėstinės konfigūracijos parinktys

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
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipiame dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojame kreiptis į profesionalius vertėjus. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus aiškinimus, kylančius dėl šio vertimo naudojimo.
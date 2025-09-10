<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-10T06:14:07+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "hr"
}
-->
# Osnove AZD-a - Razumijevanje Azure Developer CLI

## Uvod

Ova lekcija uvodi vas u Azure Developer CLI (azd), moćan alat naredbenog retka koji ubrzava vaš put od lokalnog razvoja do implementacije na Azure. Naučit ćete osnovne koncepte, ključne značajke i razumjeti kako azd pojednostavljuje implementaciju aplikacija prilagođenih oblaku.

## Ciljevi učenja

Na kraju ove lekcije, moći ćete:
- Razumjeti što je Azure Developer CLI i njegovu primarnu svrhu
- Naučiti osnovne koncepte poput predložaka, okruženja i usluga
- Istražiti ključne značajke, uključujući razvoj temeljen na predlošcima i infrastrukturu kao kod
- Razumjeti strukturu i tijek rada azd projekata
- Biti spremni instalirati i konfigurirati azd za svoj razvojni okoliš

## Ishodi učenja

Nakon završetka ove lekcije, moći ćete:
- Objasniti ulogu azd-a u modernim radnim tijekovima razvoja oblaka
- Identificirati komponente strukture azd projekta
- Opisati kako predlošci, okruženja i usluge međusobno djeluju
- Razumjeti prednosti infrastrukture kao kod uz azd
- Prepoznati različite azd naredbe i njihove svrhe

## Što je Azure Developer CLI (azd)?

Azure Developer CLI (azd) je alat naredbenog retka dizajniran za ubrzavanje vašeg puta od lokalnog razvoja do implementacije na Azure. Pojednostavljuje proces izgradnje, implementacije i upravljanja aplikacijama prilagođenim oblaku na Azureu.

## Osnovni koncepti

### Predlošci
Predlošci su temelj azd-a. Sadrže:
- **Kod aplikacije** - Vaš izvorni kod i ovisnosti
- **Definicije infrastrukture** - Azure resurse definirane u Bicep-u ili Terraform-u
- **Konfiguracijske datoteke** - Postavke i varijable okruženja
- **Skripte za implementaciju** - Automatizirani tijekovi implementacije

### Okruženja
Okruženja predstavljaju različite ciljeve implementacije:
- **Razvoj** - Za testiranje i razvoj
- **Staging** - Predprodukcijsko okruženje
- **Produkcija** - Živo produkcijsko okruženje

Svako okruženje održava vlastite:
- Azure resursne grupe
- Konfiguracijske postavke
- Stanje implementacije

### Usluge
Usluge su gradivni blokovi vaše aplikacije:
- **Frontend** - Web aplikacije, SPAs
- **Backend** - API-jevi, mikroservisi
- **Baza podataka** - Rješenja za pohranu podataka
- **Pohrana** - Pohrana datoteka i blobova

## Ključne značajke

### 1. Razvoj temeljen na predlošcima
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastruktura kao kod
- **Bicep** - Specifični jezik za Azure
- **Terraform** - Alat za infrastrukturu na više oblaka
- **ARM predlošci** - Predlošci za Azure Resource Manager

### 3. Integrirani tijekovi rada
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
azd down          # Clean up resources
```

### 4. Upravljanje okruženjima
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Struktura projekta

Tipična struktura azd projekta:
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

## 🔧 Konfiguracijske datoteke

### azure.yaml
Glavna konfiguracijska datoteka projekta:
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
Konfiguracija specifična za okruženje:
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

## 🎪 Uobičajeni tijekovi rada

### Pokretanje novog projekta
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Razvojni ciklus
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

### Upravljanje višestrukim okruženjima
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

## 🧭 Naredbe za navigaciju

### Otkrivanje
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Upravljanje projektima
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Praćenje
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Najbolje prakse

### 1. Koristite smislena imena
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Iskoristite predloške
- Započnite s postojećim predlošcima
- Prilagodite ih svojim potrebama
- Kreirajte predloške za višekratnu upotrebu unutar svoje organizacije

### 3. Izolacija okruženja
- Koristite odvojena okruženja za razvoj/staging/produkciju
- Nikada ne implementirajte direktno u produkciju s lokalnog računala
- Koristite CI/CD tijekove rada za produkcijske implementacije

### 4. Upravljanje konfiguracijom
- Koristite varijable okruženja za osjetljive podatke
- Držite konfiguraciju pod verzijskom kontrolom
- Dokumentirajte postavke specifične za okruženje

## Napredak u učenju

### Početnik (1.-2. tjedan)
1. Instalirajte azd i autentificirajte se
2. Implementirajte jednostavan predložak
3. Razumite strukturu projekta
4. Naučite osnovne naredbe (up, down, deploy)

### Srednji nivo (3.-4. tjedan)
1. Prilagodite predloške
2. Upravljajte višestrukim okruženjima
3. Razumite kod infrastrukture
4. Postavite CI/CD tijekove rada

### Napredni nivo (5. tjedan i dalje)
1. Kreirajte prilagođene predloške
2. Napredni obrasci infrastrukture
3. Implementacije u više regija
4. Konfiguracije na razini poduzeća

## Sljedeći koraci

- [Instalacija i postavljanje](installation.md) - Instalirajte i konfigurirajte azd
- [Vaš prvi projekt](first-project.md) - Praktični vodič
- [Vodič za konfiguraciju](configuration.md) - Napredne opcije konfiguracije

## Dodatni resursi

- [Pregled Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Galerija predložaka](https://azure.github.io/awesome-azd/)
- [Primjeri iz zajednice](https://github.com/Azure-Samples)

---

**Navigacija**
- **Prethodna lekcija**: [README](../../README.md)
- **Sljedeća lekcija**: [Instalacija i postavljanje](installation.md)

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za bilo kakva nesporazuma ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b0f9bb7d2efce4196ceab8e3269080d3",
  "translation_date": "2025-09-10T13:43:05+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "sl"
}
-->
# Osnove AZD - Razumevanje Azure Developer CLI

## Uvod

Ta lekcija vas uvaja v Azure Developer CLI (azd), zmogljivo orodje ukazne vrstice, ki pospeši vašo pot od lokalnega razvoja do uvajanja v Azure. Spoznali boste temeljne koncepte, ključne funkcije in razumeli, kako azd poenostavi uvajanje aplikacij, zasnovanih za oblak.

## Cilji učenja

Do konca te lekcije boste:
- Razumeli, kaj je Azure Developer CLI in njegov glavni namen
- Spoznali temeljne koncepte predlog, okolij in storitev
- Raziskali ključne funkcije, vključno z razvojem na podlagi predlog in infrastrukturo kot kodo
- Razumeli strukturo projekta azd in delovni tok
- Pripravljeni na namestitev in konfiguracijo azd za vaše razvojno okolje

## Rezultati učenja

Po zaključku te lekcije boste sposobni:
- Pojasniti vlogo azd v sodobnih delovnih tokovih razvoja za oblak
- Prepoznati komponente strukture projekta azd
- Opisati, kako predloge, okolja in storitve delujejo skupaj
- Razumeti prednosti infrastrukture kot kode z azd
- Prepoznati različne ukaze azd in njihove namene

## Kaj je Azure Developer CLI (azd)?

Azure Developer CLI (azd) je orodje ukazne vrstice, zasnovano za pospešitev vaše poti od lokalnega razvoja do uvajanja v Azure. Poenostavi proces gradnje, uvajanja in upravljanja aplikacij, zasnovanih za oblak, na Azure.

## Temeljni koncepti

### Predloge
Predloge so osnova azd. Vsebujejo:
- **Kodo aplikacije** - Vašo izvorno kodo in odvisnosti
- **Definicije infrastrukture** - Azure vire, definirane v Bicep ali Terraform
- **Konfiguracijske datoteke** - Nastavitve in okoljske spremenljivke
- **Skripte za uvajanje** - Avtomatizirani delovni tokovi uvajanja

### Okolja
Okolja predstavljajo različne cilje uvajanja:
- **Razvojno** - Za testiranje in razvoj
- **Staging** - Predprodukcijsko okolje
- **Produkcijsko** - Živo produkcijsko okolje

Vsako okolje ima svoje:
- Skupino virov Azure
- Konfiguracijske nastavitve
- Stanje uvajanja

### Storitve
Storitve so gradniki vaše aplikacije:
- **Frontend** - Spletne aplikacije, SPAs
- **Backend** - API-ji, mikrostoritve
- **Baza podatkov** - Rešitve za shranjevanje podatkov
- **Shranjevanje** - Shranjevanje datotek in blobov

## Ključne funkcije

### 1. Razvoj na podlagi predlog
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastruktura kot koda
- **Bicep** - Domensko specifičen jezik Azure
- **Terraform** - Orodje za infrastrukturo v več oblakih
- **ARM predloge** - Predloge Azure Resource Manager

### 3. Integrirani delovni tokovi
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Upravljanje okolij
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Struktura projekta

Tipična struktura projekta azd:
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
Konfiguracija, specifična za okolje:
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

## 🎪 Pogosti delovni tokovi

### Začetek novega projekta
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Razvojni cikel
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

## Razumevanje `azd down --force --purge`
Ukaz `azd down --force --purge` je zmogljiv način za popolno odstranitev vašega azd okolja in vseh povezanih virov. Tukaj je razčlenitev, kaj vsak parameter naredi:
```
--force
```
- Preskoči potrditvene pozive.
- Koristno za avtomatizacijo ali skriptiranje, kjer ročni vnos ni izvedljiv.
- Zagotovi, da se odstranitev nadaljuje brez prekinitev, tudi če CLI zazna nedoslednosti.

```
--purge
```
Izbriše **vse povezane metapodatke**, vključno z:
Stanje okolja
Lokalna mapa `.azure`
Predpomnjene informacije o uvajanju
Prepreči, da bi azd "zapomnil" prejšnja uvajanja, kar lahko povzroči težave, kot so neusklajene skupine virov ali zastarele reference registracije.

### Zakaj uporabiti oboje?
Ko naletite na težave z `azd up` zaradi preostalega stanja ali delnih uvajanj, ta kombinacija zagotovi **čisto stanje**.

Še posebej uporabno po ročnih brisanjih virov v Azure portalu ali pri preklapljanju predlog, okolij ali konvencij poimenovanja skupin virov.

### Upravljanje več okolij
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

## 🧭 Ukazi za navigacijo

### Odkritje
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Upravljanje projektov
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Spremljanje
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Najboljše prakse

### 1. Uporabljajte smiselna imena
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Izkoristite predloge
- Začnite z obstoječimi predlogami
- Prilagodite jih svojim potrebam
- Ustvarite ponovno uporabne predloge za svojo organizacijo

### 3. Izolacija okolij
- Uporabljajte ločena okolja za razvoj/staging/produkcijo
- Nikoli ne uvajajte neposredno v produkcijo z lokalnega računalnika
- Uporabljajte CI/CD pipeline za produkcijska uvajanja

### 4. Upravljanje konfiguracije
- Uporabljajte okoljske spremenljivke za občutljive podatke
- Hranite konfiguracijo v nadzoru različic
- Dokumentirajte nastavitve, specifične za okolje

## Napredovanje učenja

### Začetnik (1-2 tedna)
1. Namestite azd in se prijavite
2. Uvedite preprosto predlogo
3. Razumite strukturo projekta
4. Naučite se osnovnih ukazov (up, down, deploy)

### Srednji nivo (3-4 tedna)
1. Prilagodite predloge
2. Upravljajte več okolij
3. Razumite infrastrukturo kot kodo
4. Nastavite CI/CD pipeline

### Napredni nivo (5+ tednov)
1. Ustvarite lastne predloge
2. Napredni vzorci infrastrukture
3. Uvajanja v več regijah
4. Konfiguracije na ravni podjetja

## Naslednji koraki

- [Namestitev in nastavitev](installation.md) - Namestite in konfigurirajte azd
- [Vaš prvi projekt](first-project.md) - Praktični vodič
- [Vodnik za konfiguracijo](configuration.md) - Napredne možnosti konfiguracije

## Dodatni viri

- [Pregled Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Galerija predlog](https://azure.github.io/awesome-azd/)
- [Primeri skupnosti](https://github.com/Azure-Samples)

---

**Navigacija**
- **Prejšnja lekcija**: [README](../../README.md)
- **Naslednja lekcija**: [Namestitev in nastavitev](installation.md)

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za strojno prevajanje [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo strokovno človeško prevajanje. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
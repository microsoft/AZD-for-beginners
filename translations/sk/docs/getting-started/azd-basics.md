<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-10T06:12:29+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "sk"
}
-->
# AZD Základy - Porozumenie Azure Developer CLI

## Úvod

Táto lekcia vás zoznámi s Azure Developer CLI (azd), výkonným nástrojom príkazového riadku, ktorý urýchľuje váš prechod od lokálneho vývoja k nasadeniu na Azure. Naučíte sa základné koncepty, kľúčové funkcie a pochopíte, ako azd zjednodušuje nasadenie cloud-native aplikácií.

## Ciele učenia

Na konci tejto lekcie budete:
- Rozumieť, čo je Azure Developer CLI a jeho hlavný účel
- Naučíte sa základné koncepty šablón, prostredí a služieb
- Preskúmate kľúčové funkcie vrátane vývoja založeného na šablónach a Infrastructure as Code
- Pochopíte štruktúru projektu azd a pracovný postup
- Budete pripravení nainštalovať a nakonfigurovať azd pre vaše vývojové prostredie

## Výsledky učenia

Po dokončení tejto lekcie budete schopní:
- Vysvetliť úlohu azd v moderných pracovných postupoch cloudového vývoja
- Identifikovať komponenty štruktúry projektu azd
- Opísať, ako šablóny, prostredia a služby spolupracujú
- Pochopiť výhody Infrastructure as Code s azd
- Rozpoznať rôzne príkazy azd a ich účely

## Čo je Azure Developer CLI (azd)?

Azure Developer CLI (azd) je nástroj príkazového riadku navrhnutý na urýchlenie vášho prechodu od lokálneho vývoja k nasadeniu na Azure. Zjednodušuje proces budovania, nasadzovania a správy cloud-native aplikácií na Azure.

## Základné koncepty

### Šablóny
Šablóny sú základom azd. Obsahujú:
- **Aplikačný kód** - Váš zdrojový kód a závislosti
- **Definície infraštruktúry** - Azure zdroje definované v Bicep alebo Terraform
- **Konfiguračné súbory** - Nastavenia a environmentálne premenné
- **Nasadzovacie skripty** - Automatizované pracovné postupy nasadenia

### Prostredia
Prostredia predstavujú rôzne cieľové miesta nasadenia:
- **Vývoj** - Na testovanie a vývoj
- **Staging** - Predprodukčné prostredie
- **Produkcia** - Živé produkčné prostredie

Každé prostredie udržiava svoje vlastné:
- Azure resource group
- Konfiguračné nastavenia
- Stav nasadenia

### Služby
Služby sú stavebné bloky vašej aplikácie:
- **Frontend** - Webové aplikácie, SPAs
- **Backend** - API, mikroslužby
- **Databáza** - Riešenia na ukladanie dát
- **Úložisko** - Súborové a blobové úložisko

## Kľúčové funkcie

### 1. Vývoj založený na šablónach
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Doménovo špecifický jazyk Azure
- **Terraform** - Nástroj pre infraštruktúru na viacerých cloudoch
- **ARM Templates** - Šablóny Azure Resource Manager

### 3. Integrované pracovné postupy
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
azd down          # Clean up resources
```

### 4. Správa prostredí
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Štruktúra projektu

Typická štruktúra projektu azd:
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

## 🔧 Konfiguračné súbory

### azure.yaml
Hlavný konfiguračný súbor projektu:
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
Konfigurácia špecifická pre prostredie:
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

## 🎪 Bežné pracovné postupy

### Začiatok nového projektu
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Vývojový cyklus
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

### Správa viacerých prostredí
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

## 🧭 Navigačné príkazy

### Objavovanie
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Správa projektov
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Monitorovanie
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Najlepšie postupy

### 1. Používajte zmysluplné názvy
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Využívajte šablóny
- Začnite s existujúcimi šablónami
- Prispôsobte ich svojim potrebám
- Vytvorte opakovane použiteľné šablóny pre vašu organizáciu

### 3. Izolácia prostredí
- Používajte samostatné prostredia pre vývoj/staging/produkciu
- Nikdy nenasadzujte priamo do produkcie z lokálneho počítača
- Používajte CI/CD pipelines pre produkčné nasadenia

### 4. Správa konfigurácie
- Používajte environmentálne premenné pre citlivé údaje
- Udržujte konfiguráciu vo verziovacom systéme
- Dokumentujte nastavenia špecifické pre prostredie

## Postup učenia

### Začiatočník (1-2 týždne)
1. Nainštalujte azd a autentifikujte sa
2. Nasadte jednoduchú šablónu
3. Pochopte štruktúru projektu
4. Naučte sa základné príkazy (up, down, deploy)

### Stredne pokročilý (3-4 týždne)
1. Prispôsobte šablóny
2. Spravujte viaceré prostredia
3. Pochopte kód infraštruktúry
4. Nastavte CI/CD pipelines

### Pokročilý (5+ týždňov)
1. Vytvorte vlastné šablóny
2. Pokročilé vzory infraštruktúry
3. Nasadenia vo viacerých regiónoch
4. Konfigurácie na úrovni podniku

## Ďalšie kroky

- [Inštalácia a nastavenie](installation.md) - Nainštalujte a nakonfigurujte azd
- [Váš prvý projekt](first-project.md) - Praktický tutoriál
- [Sprievodca konfiguráciou](configuration.md) - Pokročilé možnosti konfigurácie

## Ďalšie zdroje

- [Prehľad Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Galéria šablón](https://azure.github.io/awesome-azd/)
- [Ukážky komunity](https://github.com/Azure-Samples)

---

**Navigácia**
- **Predchádzajúca lekcia**: [README](../../README.md)
- **Nasledujúca lekcia**: [Inštalácia a nastavenie](installation.md)

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby na automatický preklad [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, upozorňujeme, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Za autoritatívny zdroj by sa mal považovať pôvodný dokument v jeho pôvodnom jazyku. Pre dôležité informácie odporúčame profesionálny preklad vykonaný človekom. Nezodpovedáme za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
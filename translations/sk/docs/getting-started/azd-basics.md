<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "88986b920b82d096f82d6583f5e0a6e6",
  "translation_date": "2025-09-18T10:02:42+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "sk"
}
-->
# AZD Základy - Porozumenie Azure Developer CLI

# AZD Základy - Hlavné koncepty a základy

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD Pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy & Rýchly štart
- **⬅️ Predchádzajúca**: [Prehľad kurzu](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Ďalšia**: [Inštalácia & Nastavenie](installation.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: AI-First Vývoj](../ai-foundry/azure-ai-foundry-integration.md)

## Úvod

Táto lekcia vás zoznámi s Azure Developer CLI (azd), výkonným nástrojom príkazového riadku, ktorý urýchľuje váš prechod od lokálneho vývoja k nasadeniu na Azure. Naučíte sa základné koncepty, hlavné funkcie a pochopíte, ako azd zjednodušuje nasadenie cloud-native aplikácií.

## Ciele učenia

Na konci tejto lekcie budete:
- Rozumieť, čo je Azure Developer CLI a jeho hlavný účel
- Naučíte sa základné koncepty šablón, prostredí a služieb
- Preskúmate kľúčové funkcie vrátane vývoja na základe šablón a Infrastructure as Code
- Pochopíte štruktúru projektu azd a pracovný postup
- Pripravení na inštaláciu a konfiguráciu azd pre vaše vývojové prostredie

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
- **Kód aplikácie** - Váš zdrojový kód a závislosti
- **Definície infraštruktúry** - Azure zdroje definované v Bicep alebo Terraform
- **Konfiguračné súbory** - Nastavenia a environmentálne premenné
- **Skripty nasadenia** - Automatizované pracovné postupy nasadenia

### Prostredia
Prostredia predstavujú rôzne ciele nasadenia:
- **Vývoj** - Na testovanie a vývoj
- **Staging** - Predprodukčné prostredie
- **Produkcia** - Živé produkčné prostredie

Každé prostredie si udržiava vlastné:
- Azure resource group
- Konfiguračné nastavenia
- Stav nasadenia

### Služby
Služby sú stavebné bloky vašej aplikácie:
- **Frontend** - Webové aplikácie, SPAs
- **Backend** - API, mikroslužby
- **Databáza** - Riešenia na ukladanie dát
- **Úložisko** - Ukladanie súborov a blobov

## Kľúčové funkcie

### 1. Vývoj na základe šablón
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
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
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
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## Pochopenie `azd down --force --purge`
Príkaz `azd down --force --purge` je výkonný spôsob, ako úplne odstrániť vaše prostredie azd a všetky súvisiace zdroje. Tu je rozpis, čo jednotlivé flagy robia:
```
--force
```
- Preskočí potvrdenia.
- Užitočné pre automatizáciu alebo skriptovanie, kde manuálny vstup nie je možný.
- Zabezpečuje, že odstránenie prebehne bez prerušenia, aj keď CLI zistí nekonzistencie.

```
--purge
```
Odstráni **všetky súvisiace metadáta**, vrátane:
Stav prostredia
Lokálny `.azure` priečinok
Cache informácií o nasadení
Zabraňuje azd "pamätať si" predchádzajúce nasadenia, čo môže spôsobiť problémy ako nesprávne resource groups alebo zastarané registry.

### Prečo použiť oboje?
Keď narazíte na problémy s `azd up` kvôli pretrvávajúcemu stavu alebo čiastočným nasadeniam, táto kombinácia zabezpečí **čistý štart**.

Je obzvlášť užitočná po manuálnom odstránení zdrojov v Azure portáli alebo pri zmene šablón, prostredí alebo konvencií pomenovania resource groups.

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
- Udržujte konfiguráciu vo verziovacej kontrole
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
2. Pokročilé infraštruktúrne vzory
3. Nasadenia vo viacerých regiónoch
4. Konfigurácie na úrovni podniku

## Ďalšie kroky

**📖 Pokračujte v učení kapitoly 1:**
- [Inštalácia & Nastavenie](installation.md) - Nainštalujte a nakonfigurujte azd
- [Váš prvý projekt](first-project.md) - Dokončite praktický tutoriál
- [Konfiguračný sprievodca](configuration.md) - Pokročilé možnosti konfigurácie

**🎯 Pripravení na ďalšiu kapitolu?**
- [Kapitola 2: AI-First Vývoj](../ai-foundry/azure-ai-foundry-integration.md) - Začnite budovať AI aplikácie

## Ďalšie zdroje

- [Prehľad Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Galéria šablón](https://azure.github.io/awesome-azd/)
- [Ukážky komunity](https://github.com/Azure-Samples)

---

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD Pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy & Rýchly štart  
- **⬅️ Predchádzajúca**: [Prehľad kurzu](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Ďalšia**: [Inštalácia & Nastavenie](installation.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: AI-First Vývoj](../ai-foundry/azure-ai-foundry-integration.md)

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
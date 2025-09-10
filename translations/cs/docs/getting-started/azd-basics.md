<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b0f9bb7d2efce4196ceab8e3269080d3",
  "translation_date": "2025-09-10T13:35:29+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "cs"
}
-->
# AZD Základy - Porozumění Azure Developer CLI

## Úvod

Tato lekce vás seznámí s Azure Developer CLI (azd), výkonným nástrojem příkazového řádku, který urychluje cestu od lokálního vývoje k nasazení na Azure. Naučíte se základní koncepty, klíčové funkce a pochopíte, jak azd zjednodušuje nasazení cloudově orientovaných aplikací.

## Cíle učení

Na konci této lekce budete:
- Rozumět tomu, co je Azure Developer CLI a jeho hlavnímu účelu
- Naučíte se základní koncepty šablon, prostředí a služeb
- Prozkoumáte klíčové funkce, včetně vývoje založeného na šablonách a Infrastructure as Code
- Pochopíte strukturu projektu azd a pracovní postupy
- Připraveni nainstalovat a nakonfigurovat azd pro vaše vývojové prostředí

## Výsledky učení

Po dokončení této lekce budete schopni:
- Vysvětlit roli azd v moderních pracovních postupech cloudového vývoje
- Identifikovat komponenty struktury projektu azd
- Popsat, jak šablony, prostředí a služby spolupracují
- Pochopit výhody Infrastructure as Code s azd
- Rozpoznat různé příkazy azd a jejich účely

## Co je Azure Developer CLI (azd)?

Azure Developer CLI (azd) je nástroj příkazového řádku navržený k urychlení cesty od lokálního vývoje k nasazení na Azure. Zjednodušuje proces vytváření, nasazení a správy cloudově orientovaných aplikací na Azure.

## Základní koncepty

### Šablony
Šablony jsou základem azd. Obsahují:
- **Aplikační kód** - váš zdrojový kód a závislosti
- **Definice infrastruktury** - Azure zdroje definované v Bicep nebo Terraform
- **Konfigurační soubory** - nastavení a proměnné prostředí
- **Skripty nasazení** - automatizované pracovní postupy nasazení

### Prostředí
Prostředí představují různé cíle nasazení:
- **Vývojové** - pro testování a vývoj
- **Staging** - předprodukční prostředí
- **Produkční** - živé produkční prostředí

Každé prostředí udržuje své vlastní:
- Azure resource group
- Konfigurační nastavení
- Stav nasazení

### Služby
Služby jsou stavebními bloky vaší aplikace:
- **Frontend** - webové aplikace, SPAs
- **Backend** - API, mikroslužby
- **Databáze** - řešení pro ukládání dat
- **Úložiště** - souborové a blobové úložiště

## Klíčové funkce

### 1. Vývoj založený na šablonách
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - doménově specifický jazyk Azure
- **Terraform** - nástroj pro infrastrukturu napříč cloudy
- **ARM Templates** - šablony Azure Resource Manager

### 3. Integrované pracovní postupy
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Správa prostředí
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Struktura projektu

Typická struktura projektu azd:
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

## 🔧 Konfigurační soubory

### azure.yaml
Hlavní konfigurační soubor projektu:
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
Konfigurace specifická pro prostředí:
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

## 🎪 Běžné pracovní postupy

### Zahájení nového projektu
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

## Porozumění `azd down --force --purge`
Příkaz `azd down --force --purge` je výkonný způsob, jak kompletně odstranit vaše prostředí azd a všechny související zdroje. Zde je rozpis, co jednotlivé příznaky dělají:
```
--force
```
- Přeskakuje potvrzovací výzvy.
- Užitečné pro automatizaci nebo skriptování, kde není možné manuální zadávání.
- Zajišťuje, že odstranění proběhne bez přerušení, i když CLI detekuje nekonzistence.

```
--purge
```
Maže **veškerá související metadata**, včetně:
Stavu prostředí
Lokální složky `.azure`
Informací o uloženém nasazení
Zabraňuje azd v "zapamatování" předchozích nasazení, což může způsobit problémy, jako jsou nesprávné resource groups nebo zastaralé registry.

### Proč použít obojí?
Když narazíte na problémy s `azd up` kvůli přetrvávajícímu stavu nebo částečným nasazením, tato kombinace zajistí **čistý start**.

Je obzvláště užitečné po manuálním odstranění zdrojů v Azure portálu nebo při přepínání šablon, prostředí nebo konvencí pojmenování resource groups.

### Správa více prostředí
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

## 🧭 Navigační příkazy

### Objevování
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Správa projektů
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Monitoring
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Nejlepší postupy

### 1. Používejte smysluplné názvy
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Využívejte šablony
- Začněte s existujícími šablonami
- Přizpůsobte je svým potřebám
- Vytvářejte opakovaně použitelné šablony pro vaši organizaci

### 3. Izolace prostředí
- Používejte oddělená prostředí pro vývoj/staging/produkci
- Nikdy nenasazujte přímo do produkce z lokálního stroje
- Používejte CI/CD pipelines pro produkční nasazení

### 4. Správa konfigurace
- Používejte proměnné prostředí pro citlivá data
- Udržujte konfiguraci ve verzovacím systému
- Dokumentujte nastavení specifická pro prostředí

## Postup učení

### Začátečník (1.-2. týden)
1. Nainstalujte azd a autentizujte se
2. Nasazení jednoduché šablony
3. Porozumění struktuře projektu
4. Naučte se základní příkazy (up, down, deploy)

### Pokročilý (3.-4. týden)
1. Přizpůsobení šablon
2. Správa více prostředí
3. Porozumění infrastrukturnímu kódu
4. Nastavení CI/CD pipelines

### Expert (5. týden a dále)
1. Vytváření vlastních šablon
2. Pokročilé infrastrukturní vzory
3. Nasazení do více regionů
4. Konfigurace na úrovni podniku

## Další kroky

- [Instalace a nastavení](installation.md) - Nainstalujte a nakonfigurujte azd
- [Váš první projekt](first-project.md) - Praktický tutoriál
- [Průvodce konfigurací](configuration.md) - Pokročilé možnosti konfigurace

## Další zdroje

- [Přehled Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Galerie šablon](https://azure.github.io/awesome-azd/)
- [Ukázky komunity](https://github.com/Azure-Samples)

---

**Navigace**
- **Předchozí lekce**: [README](../../README.md)
- **Další lekce**: [Instalace a nastavení](installation.md)

---

**Upozornění**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o co největší přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za závazný zdroj. Pro důležité informace doporučujeme profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné výklady vyplývající z použití tohoto překladu.
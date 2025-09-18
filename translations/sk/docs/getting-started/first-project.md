<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-09-18T10:01:18+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "sk"
}
-->
# Váš prvý projekt - Praktický tutoriál

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD Pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy & Rýchly štart
- **⬅️ Predchádzajúca**: [Inštalácia & Nastavenie](installation.md)
- **➡️ Ďalšia**: [Konfigurácia](configuration.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: AI-First Vývoj](../ai-foundry/azure-ai-foundry-integration.md)

## Úvod

Vitajte vo vašom prvom projekte s Azure Developer CLI! Tento komplexný praktický tutoriál vás prevedie celým procesom vytvorenia, nasadenia a správy full-stack aplikácie na Azure pomocou azd. Budete pracovať s reálnou todo aplikáciou, ktorá zahŕňa React frontend, Node.js API backend a MongoDB databázu.

## Ciele učenia

Po dokončení tohto tutoriálu budete:
- Ovládať workflow inicializácie projektu azd pomocou šablón
- Rozumieť štruktúre projektu Azure Developer CLI a konfiguračným súborom
- Vykonávať kompletné nasadenie aplikácie na Azure vrátane provisioningu infraštruktúry
- Implementovať stratégie aktualizácie aplikácie a opätovného nasadenia
- Spravovať viacero prostredí pre vývoj a staging
- Aplikovať postupy na čistenie zdrojov a správu nákladov

## Výsledky učenia

Po dokončení budete schopní:
- Samostatne inicializovať a konfigurovať projekty azd zo šablón
- Efektívne navigovať a upravovať štruktúru projektov azd
- Nasadzovať full-stack aplikácie na Azure pomocou jediného príkazu
- Riešiť bežné problémy s nasadením a autentifikáciou
- Spravovať viacero prostredí Azure pre rôzne fázy nasadenia
- Implementovať workflowy kontinuálneho nasadenia pre aktualizácie aplikácií

## Začíname

### Kontrolný zoznam predpokladov
- ✅ Nainštalovaný Azure Developer CLI ([Sprievodca inštaláciou](installation.md))
- ✅ Nainštalovaný a autentifikovaný Azure CLI
- ✅ Nainštalovaný Git na vašom systéme
- ✅ Node.js 16+ (pre tento tutoriál)
- ✅ Visual Studio Code (odporúčané)

### Overenie nastavenia
```bash
# Check azd installation
azd version
```
### Overenie autentifikácie Azure

```bash
az account show
```

### Kontrola verzie Node.js
```bash
node --version
```

## Krok 1: Výber a inicializácia šablóny

Začnime populárnou šablónou todo aplikácie, ktorá zahŕňa React frontend a Node.js API backend.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Čo sa práve stalo?
- Stiahli ste kód šablóny do lokálneho adresára
- Vytvorili ste súbor `azure.yaml` s definíciami služieb
- Nastavili ste infraštruktúrny kód v adresári `infra/`
- Vytvorili ste konfiguráciu prostredia

## Krok 2: Preskúmanie štruktúry projektu

Pozrime sa, čo nám azd vytvoril:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Mali by ste vidieť:
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

### Kľúčové súbory na pochopenie

**azure.yaml** - Srdce vášho projektu azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definícia infraštruktúry:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Krok 3: Prispôsobenie projektu (voliteľné)

Pred nasadením môžete aplikáciu prispôsobiť:

### Úprava frontendu
```bash
# Open the React app component
code src/web/src/App.tsx
```

Urobte jednoduchú zmenu:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Konfigurácia environmentálnych premenných
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Krok 4: Nasadenie na Azure

Teraz prichádza vzrušujúca časť - nasadenie všetkého na Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Čo sa deje počas nasadenia?

Príkaz `azd up` vykonáva tieto kroky:
1. **Provision** (`azd provision`) - Vytvára zdroje Azure
2. **Package** - Zostavuje kód vašej aplikácie
3. **Deploy** (`azd deploy`) - Nasadzuje kód na zdroje Azure

### Očakávaný výstup
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Krok 5: Testovanie aplikácie

### Prístup k aplikácii
Kliknite na URL uvedenú vo výstupe nasadenia alebo ju získajte kedykoľvek:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Testovanie Todo aplikácie
1. **Pridajte položku todo** - Kliknite na "Add Todo" a zadajte úlohu
2. **Označte ako dokončené** - Zaškrtnite dokončené položky
3. **Odstráňte položky** - Odstráňte todo, ktoré už nepotrebujete

### Monitorovanie aplikácie
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Krok 6: Zmeny a opätovné nasadenie

Urobme zmenu a uvidíme, aké jednoduché je aktualizovať:

### Úprava API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Pridajte vlastný odpovedný header:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nasadenie iba zmien v kóde
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Krok 7: Správa viacerých prostredí

Vytvorte staging prostredie na testovanie zmien pred produkciou:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Porovnanie prostredí
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Krok 8: Vyčistenie zdrojov

Keď skončíte s experimentovaním, vyčistite zdroje, aby ste sa vyhli ďalším poplatkom:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Čo ste sa naučili

Gratulujeme! Úspešne ste:
- Inicializovali projekt azd zo šablóny
- Preskúmali štruktúru projektu a kľúčové súbory
- Nasadili full-stack aplikáciu na Azure
- Urobili zmeny v kóde a opätovne nasadili
- Spravovali viacero prostredí
- Vyčistili zdroje

## Riešenie bežných problémov

### Chyby autentifikácie
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Zlyhania nasadenia
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Konflikty názvov zdrojov
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Problémy s portom/sieťou
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Ďalšie kroky

Teraz, keď ste dokončili svoj prvý projekt, preskúmajte tieto pokročilé témy:

### 1. Prispôsobenie infraštruktúry
- [Infraštruktúra ako kód](../deployment/provisioning.md)
- [Pridanie databáz, úložísk a ďalších služieb](../deployment/provisioning.md#adding-services)

### 2. Nastavenie CI/CD
- [Integrácia GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Najlepšie praktiky pre produkciu
- [Konfigurácie bezpečnosti](../deployment/best-practices.md#security)
- [Optimalizácia výkonu](../deployment/best-practices.md#performance)
- [Monitorovanie a logovanie](../deployment/best-practices.md#monitoring)

### 4. Preskúmanie ďalších šablón
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Dodatočné zdroje

### Materiály na učenie
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunita & Podpora
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Komunita Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablóny & Príklady
- [Oficiálna galéria šablón](https://azure.github.io/awesome-azd/)
- [Komunitné šablóny](https://github.com/Azure-Samples/azd-templates)
- [Podnikové vzory](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulujeme k dokončeniu vášho prvého projektu azd!** Teraz ste pripravení s istotou vytvárať a nasadzovať úžasné aplikácie na Azure.

---

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD Pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy & Rýchly štart
- **⬅️ Predchádzajúca**: [Inštalácia & Nastavenie](installation.md)
- **➡️ Ďalšia**: [Konfigurácia](configuration.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: AI-First Vývoj](../ai-foundry/azure-ai-foundry-integration.md)
- **Ďalšia lekcia**: [Sprievodca nasadením](../deployment/deployment-guide.md)

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
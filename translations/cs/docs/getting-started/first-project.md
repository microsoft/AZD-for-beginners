<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d0054b58dbf5baa786403593d848de4a",
  "translation_date": "2025-09-10T13:34:26+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "cs"
}
-->
# Váš první projekt - Praktický tutoriál

## Úvod

Vítejte u svého prvního projektu s Azure Developer CLI! Tento komplexní praktický tutoriál vás provede celým procesem vytvoření, nasazení a správy full-stack aplikace na Azure pomocí azd. Budete pracovat s reálnou aplikací pro správu úkolů, která zahrnuje React frontend, Node.js API backend a databázi MongoDB.

## Cíle učení

Po dokončení tohoto tutoriálu:
- Zvládnete inicializaci projektů azd pomocí šablon
- Pochopíte strukturu projektů a konfigurační soubory Azure Developer CLI
- Provedete kompletní nasazení aplikace na Azure včetně zajištění infrastruktury
- Implementujete aktualizace aplikace a strategie pro opětovné nasazení
- Budete spravovat více prostředí pro vývoj a testování
- Aplikujete postupy pro úklid zdrojů a řízení nákladů

## Výsledky učení

Po dokončení budete schopni:
- Samostatně inicializovat a konfigurovat projekty azd ze šablon
- Efektivně se orientovat ve struktuře projektů azd a provádět úpravy
- Nasazovat full-stack aplikace na Azure pomocí jediných příkazů
- Řešit běžné problémy s nasazením a autentizací
- Spravovat více prostředí Azure pro různé fáze nasazení
- Implementovat kontinuální nasazení pro aktualizace aplikací

## Začínáme

### Kontrolní seznam předpokladů
- ✅ Nainstalovaný Azure Developer CLI ([Průvodce instalací](installation.md))
- ✅ Nainstalovaný a autentizovaný Azure CLI
- ✅ Nainstalovaný Git na vašem systému
- ✅ Node.js 16+ (pro tento tutoriál)
- ✅ Visual Studio Code (doporučeno)

### Ověření nastavení
```bash
# Check azd installation
azd version
```
### Ověření autentizace Azure

```bash
az account show
```

### Kontrola verze Node.js
```bash
node --version
```

## Krok 1: Výběr a inicializace šablony

Začněme s oblíbenou šablonou aplikace pro správu úkolů, která zahrnuje React frontend a Node.js API backend.

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

### Co se právě stalo?
- Šablona byla stažena do vašeho lokálního adresáře
- Byl vytvořen soubor `azure.yaml` s definicemi služeb
- Byly nastaveny infrastrukturní kódy v adresáři `infra/`
- Byla vytvořena konfigurace prostředí

## Krok 2: Prozkoumání struktury projektu

Podívejme se, co nám azd vytvořil:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Měli byste vidět:
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

### Klíčové soubory k pochopení

**azure.yaml** - Srdce vašeho projektu azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definice infrastruktury:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Krok 3: Přizpůsobení projektu (volitelné)

Před nasazením můžete aplikaci přizpůsobit:

### Úprava frontendu
```bash
# Open the React app component
code src/web/src/App.tsx
```

Proveďte jednoduchou změnu:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Konfigurace proměnných prostředí
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Krok 4: Nasazení na Azure

Teď přichází ta vzrušující část - nasazení všeho na Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Co se děje během nasazení?

Příkaz `azd up` provádí tyto kroky:
1. **Provision** (`azd provision`) - Vytvoří Azure zdroje
2. **Package** - Sestaví kód vaší aplikace
3. **Deploy** (`azd deploy`) - Nasadí kód na Azure zdroje

### Očekávaný výstup
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Krok 5: Testování aplikace

### Přístup k aplikaci
Klikněte na URL uvedenou ve výstupu nasazení, nebo ji získejte kdykoli:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Testování aplikace pro správu úkolů
1. **Přidání úkolu** - Klikněte na "Add Todo" a zadejte úkol
2. **Označení jako dokončené** - Zaškrtněte dokončené úkoly
3. **Odstranění úkolů** - Odstraňte úkoly, které již nepotřebujete

### Monitorování aplikace
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Krok 6: Provedení změn a opětovné nasazení

Proveďme změnu a podívejme se, jak snadné je aktualizovat:

### Úprava API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Přidejte vlastní hlavičku odpovědi:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nasazení pouze změn v kódu
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Krok 7: Správa více prostředí

Vytvořte testovací prostředí pro ověření změn před nasazením do produkce:

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

### Porovnání prostředí
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Krok 8: Úklid zdrojů

Až skončíte s experimentováním, proveďte úklid, abyste se vyhnuli dalším nákladům:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Co jste se naučili

Gratulujeme! Úspěšně jste:
- Inicializovali projekt azd ze šablony
- Prozkoumali strukturu projektu a klíčové soubory
- Nasadili full-stack aplikaci na Azure
- Provedli změny v kódu a opětovně nasadili
- Spravovali více prostředí
- Provedli úklid zdrojů

## Řešení běžných problémů

### Chyby autentizace
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Selhání nasazení
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Konflikty názvů zdrojů
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Problémy s porty/sítí
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Další kroky

Nyní, když jste dokončili svůj první projekt, prozkoumejte tyto pokročilé témata:

### 1. Přizpůsobení infrastruktury
- [Infrastruktura jako kód](../deployment/provisioning.md)
- [Přidání databází, úložišť a dalších služeb](../deployment/provisioning.md#adding-services)

### 2. Nastavení CI/CD
- [Integrace s GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Nejlepší postupy pro produkci
- [Bezpečnostní konfigurace](../deployment/best-practices.md#security)
- [Optimalizace výkonu](../deployment/best-practices.md#performance)
- [Monitorování a logování](../deployment/best-practices.md#monitoring)

### 4. Prozkoumání dalších šablon
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

## Další zdroje

### Výukové materiály
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunita a podpora
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablony a příklady
- [Oficiální galerie šablon](https://azure.github.io/awesome-azd/)
- [Komunitní šablony](https://github.com/Azure-Samples/azd-templates)
- [Podnikové vzory](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulujeme k dokončení vašeho prvního projektu azd!** Nyní jste připraveni s jistotou vytvářet a nasazovat úžasné aplikace na Azure.

---

**Navigace**
- **Předchozí lekce**: [Konfigurace](configuration.md)
- **Další lekce**: [Průvodce nasazením](../deployment/deployment-guide.md)

---

**Upozornění**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o co největší přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Za autoritativní zdroj by měl být považován původní dokument v jeho původním jazyce. Pro důležité informace doporučujeme profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné výklady vyplývající z použití tohoto překladu.
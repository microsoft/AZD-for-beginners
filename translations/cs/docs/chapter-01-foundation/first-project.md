# Váš první projekt – praktický tutoriál

**Navigace kapitolou:**
- **📚 Domů kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy a rychlý start
- **⬅️ Předchozí**: [Instalace a nastavení](installation.md)
- **➡️ Další**: [Přines si vlastní aplikaci](bring-your-own-app.md)
- **🚀 Další kapitola**: [Kapitola 2: AI-first vývoj](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Vítejte u svého prvního projektu v Azure Developer CLI! Nasadíte aplikaci todo s frontendem v Reactu, API v Node.js a databází Azure Cosmos DB. Šablona si uchovává historický název `todo-nodejs-mongo`; její současná infrastruktura používá Cosmos DB pro NoSQL, takže si prohlédněte stažený README a `infra/` místo toho, abyste podle názvu odhadovali API databáze.

> Kontrolováno vůči `azd 1.37.2` a veřejné šabloně v listopadu 2026. Níže uvedené příklady využívají Bash; extrakce JSON vyžaduje také `jq`. Azure nasazení jsou zpoplatněná a při této kontrole nebyla prováděna.

## Cíle učení

Dokončením tohoto tutoriálu budete:
- Mistrem inicializačního postupu projektu azd pomocí šablon
- Rozumět struktuře projektu Azure Developer CLI a konfiguračním souborům
- Dokázat kompletní nasazení aplikace do Azure včetně provisioningu infrastruktury
- Implementovat aktualizace aplikace a strategie přenasazení
- Spravovat více prostředí pro vývoj a staging
- Aplikovat praktiky úklidu zdrojů a správy nákladů

## Výsledky učení

Po dokončení budete umět:
- Samostatně inicializovat a konfigurovat projekty azd ze šablon
- Efektivně se orientovat a upravovat strukturu projektu azd
- Nasazovat full-stack aplikace do Azure jedním příkazem
- Řešit běžné problémy s nasazením a autentizací
- Spravovat více Azure prostředí pro různé fáze nasazení
- Implementovat kontinuální deployment workflow pro aktualizace aplikace

## Začínáme

### Kontrolní seznam předpokladů
- ✅ Azure Developer CLI nainstalován ([Instalační průvodce](installation.md))
- ✅ Autentizace AZD dokončena pomocí `azd auth login`
- ✅ Na vašem počítači nainstalován Git
- ✅ Node.js 22 LTS (nebo verze podporovaná staženou šablonou)
- ✅ Visual Studio Code (doporučeno)

Než budete pokračovat, spusťte validátor nastavení z kořenového adresáře repozitáře:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Ověřte své nastavení
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Ověřte volitelnou autentizaci Azure CLI

```bash
az account show
```

### Zkontrolujte verzi Node.js
```bash
node --version
```

## Krok 1: Vyberte a inicializujte šablonu

Začněme populární šablonou aplikace todo, která zahrnuje React frontend a Node.js API backend.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Co se právě stalo?
- Stažen kód šablony do vašeho lokálního adresáře
- Vytvořen soubor `azure.yaml` s definicemi služeb
- Nastaven kód infrastruktury v adresáři `infra/`
- Vytvořena konfigurace prostředí

## Krok 2: Prozkoumejte strukturu projektu

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
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Klíčové soubory k pochopení

**azure.yaml** – Srdce vašeho projektu azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** – Definice infrastruktury:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Krok 3: Přizpůsobte svůj projekt (volitelné)

Před nasazením můžete aplikaci upravit:

### Upravte frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Proveďte jednoduchou změnu:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Nakonfigurujte proměnné prostředí
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Tyto dvě vlastní hodnoty demonstrují pouze lokální úložiště. Základní šablona nekonzumuje `WEBSITE_TITLE` ani `API_VERSION`, takže aplikaci nemění. Výše explicitní zdrojová úprava mění zobrazený název.

## Krok 4: Nasazení do Azure

Teď ta vzrušující část – nasadit vše do Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Co se během nasazení děje?

Workflow provádí provisioning infrastruktury a balíčkuje/nasazuje kód. Přesné pořadí lze upravit pomocí `workflows.up` v `azure.yaml`; tato šablona definuje provisioning následovaný nasazením. Nespoléhejte se na univerzální pořadí fází pro každou šablonu.

### Očekávaný výstup
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Krok 5: Otestujte svou aplikaci

### Přístup k aplikaci
Klikněte na URL adresu z výstupu nasazení nebo ji získejte kdykoli:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Otestujte aplikaci Todo
1. **Přidejte položku todo** – klikněte na „Add Todo“ a zadejte úkol
2. **Označte jako dokončené** – označte splněné položky
3. **Smažte položky** – odstraňte tody, které již nepotřebujete

### Sledujte aplikaci
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Ověřte nasazení

Než půjdete dál, projděte krátký kontrolní seznam, abyste potvrdili, že vše skutečně funguje – nedomnívejte se, že „nasazení uspělo“ znamená „aplikace funguje“:

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Nasazení je ověřené, pokud:**
- ✅ `azd show` vypisuje dostupné URL koncového bodu
- ✅ URL se v prohlížeči otevře bez chyb
- ✅ Základní funkce fungují (přidání/dokončení/smazání todo)
- ✅ `azd monitor --logs` ukazuje příchod požadavků bez neočekávaných chyb

Pokud některá kontrola selže, přejděte do [Kapitoly 7: Řešení problémů](../chapter-07-troubleshooting/README.md).

## Krok 6: Proveďte změny a znovu nasaďte

Proveďme změnu a uvidíme, jak snadno lze aktualizovat:

### Upravte API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Přidejte vlastní hlavičku odpovědi:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nasadit pouze změny kódu
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Krok 7: Správa více prostředí

Vytvořte staging prostředí pro testování změn před produkcí:

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

Až skončíte s experimentováním, očistěte zdroje, abyste se vyhnuli dalším poplatkům:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Klasická aplikace vs. AI-aplikace: stejný workflow

Právě jste nasadili tradiční webovou aplikaci. Co když byste chtěli nasadit AI-aplikaci – například chat aplikaci založenou na modelech Microsoft Foundry?

Dobrá zpráva: **workflow je totožné.**

| Krok | Klasická todo aplikace | AI Chat aplikace |
|------|-----------------|-------------|
| Inicializace (prázdný adresář) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Autentizace | `azd auth login` | `azd auth login` |
| Nasazení | `azd up` | `azd up` |
| Monitoring | `azd monitor` | `azd monitor` |
| Úklid | `azd down --force --purge` | `azd down --force --purge` |

Příkazy životního cyklu jsou stejné, ale předpoklady se liší. AI šablona může vyžadovat přístup k modelu, regionální kvóty, ingestování dat a další konfiguraci. Přečtěte si její README před nasazením; `azd up` nemůže dodat chybějící oprávnění ani kvóty.

To je základní princip azd: **jeden workflow, jakýkoli workload.** Dovednosti, které jste si procvičili v tomto tutoriálu – inicializace, nasazení, monitoring, přenasazení a úklid – platí stejně pro AI aplikace i agenty.

---

## Co jste se naučili

Gratulujeme! Úspěšně jste:
- ✅ Inicializovali projekt azd ze šablony
- ✅ Prozkoumali strukturu projektu a klíčové soubory
- ✅ Nasadili full-stack aplikaci do Azure
- ✅ Provedli změny v kódu a znovu nasadili
- ✅ Spravovali více prostředí
- ✅ Uklidili zdroje

## 🎯 Cvičení pro ověření dovedností

### Cvičení 1: Nasadit jinou šablonu (15 minut)
**Cíl**: Ukázat zvládnutí inicializace azd a workflow nasazení

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Kritéria úspěchu:**
- [ ] Aplikace se nasadí bez chyb
- [ ] Je možné se dostat na URL aplikace v prohlížeči
- [ ] Aplikace správně funguje (přidání/odebrání tod)
- [ ] Všechny zdroje jsou úspěšně uklizeny

### Cvičení 2: Přizpůsobení konfigurace (20 minut)
**Cíl**: Procvičit ukládání hodnot lokálního prostředí bez záměny za runtime konfiguraci

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Kritéria úspěchu:**
- [ ] Vlastní prostředí bylo úspěšně vytvořeno
- [ ] Proměnné prostředí jsou nastaveny a dostupné
- [ ] `azd env get-value APP_TITLE` vypisuje `My Custom Todo App`
- [ ] Dokážete vysvětlit, proč tyto hodnoty v základní aplikaci nemění nic, pokud je kód/infrastruktura nekonzumují

### Cvičení 3: Workflow více prostředí (25 minut)
**Cíl**: Ovládnout správu prostředí a nasazovací strategie

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kritéria úspěchu:**
- [ ] Byla vytvořena dvě prostředí s rozdílnou konfigurací
- [ ] Obě prostředí byla úspěšně nasazena
- [ ] Mezi prostředími lze přepínat pomocí `azd env select`
- [ ] Proměnné prostředí se liší mezi prostředími
- [ ] Obě prostředí byla úspěšně uklizena

## 📊 Váš pokrok

**Investovaný čas**: ~60–90 minut  
**Získané dovednosti:**
- ✅ Inicializace projektu na základě šablon
- ✅ Provisioning Azure zdrojů
- ✅ Workflow nasazení aplikace
- ✅ Správa prostředí
- ✅ Správa konfigurace
- ✅ Úklid zdrojů a správa nákladů

**Další úroveň**: Jste připraveni na [Průvodce konfigurací](../chapter-03-configuration/configuration.md) pro naučení pokročilých konfiguračních vzorů!

## Řešení běžných problémů

### Chyby autentizace
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Selhání nasazení
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikty názvů zdrojů
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Problémy s portem/sítí
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Další kroky

Teď, když jste dokončili první projekt, prozkoumejte tyto pokročilé témata:

### 1. Přizpůsobte infrastrukturu
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Přidání infrastruktury databáze](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Nastavte CI/CD
- [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md) – kompletní workflow CI/CD
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) – konfigurace pipeline

### 3. Nejlepší postupy pro produkci
- [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md) – bezpečnost, výkon a monitoring

### 4. Prozkoumejte další šablony
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Další zdroje

### Výukové materiály
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure dobře navržený rámec](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunita a podpora
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow – azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablony a příklady
- [Oficiální galerie šablon](https://azure.github.io/awesome-azd/)
- [Příspěvky komunitních šablon](https://github.com/Azure/awesome-azd)
- [Zdroj šablony Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Gratulujeme k dokončení vašeho prvního projektu azd!** Nyní jste připraveni s jistotou vytvářet a nasazovat skvělé aplikace na Azure.

---

**Navigace kapitolou:**
- **📚 Domů kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy a rychlý start
- **⬅️ Předchozí**: [Instalace a nastavení](installation.md)
- **➡️ Další**: [Přines si vlastní aplikaci](bring-your-own-app.md)
- **🚀 Další kapitola**: [Kapitola 2: AI-first vývoj](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
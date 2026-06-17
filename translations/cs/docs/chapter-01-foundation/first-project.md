# Your First Project - Hands-On Tutorial

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Vítejte u svého prvního projektu s Azure Developer CLI! Tento praktický tutoriál poskytuje kompletní průvodce vytvořením, nasazením a správou full-stack aplikace na Azure pomocí azd. Budete pracovat s reálnou todo aplikací, která obsahuje React frontend, Node.js API backend a databázi MongoDB.

## Learning Goals

Po dokončení tohoto tutoriálu budete umět:
- Ovládnout workflow inicializace projektu azd pomocí šablon
- Pochopit strukturu projektu Azure Developer CLI a konfigurační soubory
- Provést kompletní nasazení aplikace do Azure včetně provisioningu infrastruktury
- Implementovat aktualizace aplikace a strategie opětovného nasazení
- Spravovat více prostředí pro vývoj a staging
- Aplikovat postupy pro úklid zdrojů a správu nákladů

## Learning Outcomes

Po dokončení budete schopni:
- Samostatně inicializovat a konfigurovat projekty azd ze šablon
- Efektivně se orientovat a upravovat strukturu projektu azd
- Nasazovat full-stack aplikace do Azure jedním příkazem
- Řešit běžné problémy s nasazením a autentizací
- Spravovat více Azure prostředí pro různé fáze nasazení
- Implementovat pracovní postupy kontinuálního nasazení pro aktualizace aplikací

## Getting Started

### Prerequisites Checklist
- ✅ Azure Developer CLI nainstalován ([Installation Guide](installation.md))
- ✅ AZD autentizace dokončena pomocí `azd auth login`
- ✅ Git nainstalován ve vašem systému
- ✅ Node.js 16+ (pro tento tutoriál)
- ✅ Visual Studio Code (doporučeno)

Než budete pokračovat, spusťte validátor nastavení z kořenového adresáře repozitáře:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verify Your Setup
```bash
# Zkontrolujte instalaci azd
azd version

# Zkontrolujte autentizaci AZD
azd auth login --check-status
```

### Verify optional Azure CLI authentication

```bash
az account show
```

### Check Node.js version
```bash
node --version
```

## Step 1: Choose and Initialize a Template

Začněme s populární šablonou todo aplikace, která obsahuje React frontend a Node.js API backend.

```bash
# Procházet dostupné šablony
azd template list

# Inicializovat šablonu aplikace todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Postupujte podle pokynů:
# - Zadejte název prostředí: "dev"
# - Vyberte předplatné (pokud jich máte více)
# - Vyberte oblast: "East US 2" (nebo vámi preferovanou oblast)
```

### What Just Happened?
- Stažení kódu šablony do vašeho lokálního adresáře
- Vytvoření souboru `azure.yaml` s definicemi služeb
- Nastavení infrastrukturního kódu v adresáři `infra/`
- Vytvoření konfigurace prostředí

## Step 2: Explore the Project Structure

Pojďme si prohlédnout, co nám azd vytvořil:

```bash
# Zobrazit strukturu projektu
tree /f   # Windows
# nebo
find . -type f | head -20   # macOS/Linux
```

You should see:
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

### Key Files to Understand

**azure.yaml** - Srdce vašeho azd projektu:
```bash
# Zobrazit konfiguraci projektu
cat azure.yaml
```

**infra/main.bicep** - Definice infrastruktury:
```bash
# Zobrazit kód infrastruktury
head -30 infra/main.bicep
```

## Step 3: Customize Your Project (Optional)

Před nasazením můžete aplikaci upravit:

### Modify the Frontend
```bash
# Otevřete komponentu aplikace React
code src/web/src/App.tsx
```

Make a simple change:
```typescript
// Najděte název a změňte jej
<h1>My Awesome Todo App</h1>
```

### Configure Environment Variables
```bash
# Nastavit vlastní proměnné prostředí
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Zobrazit všechny proměnné prostředí
azd env get-values
```

## Step 4: Deploy to Azure

A nyní to vzrušující — nasadíme vše do Azure!

```bash
# Nasadit infrastrukturu a aplikaci
azd up

# Tento příkaz provede:
# 1. Zajistí prostředky Azure (App Service, Cosmos DB atd.)
# 2. Sestaví vaši aplikaci
# 3. Nasadí do zřízených prostředků
# 4. Zobrazí adresu URL aplikace
```

### What's Happening During Deployment?

Příkaz `azd up` provede tyto kroky:
1. **Provision** (`azd provision`) - Vytvoří Azure prostředky
2. **Package** - Sestaví kód vaší aplikace
3. **Deploy** (`azd deploy`) - Nasadí kód do Azure prostředků

### Expected Output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Step 5: Test Your Application

### Access Your Application
Klikněte na URL uvedenou ve výstupu nasazení, nebo ji získejte kdykoli:
```bash
# Získejte koncové body aplikace
azd show

# Otevřete aplikaci ve svém prohlížeči
azd show --output json | jq -r '.services.web.endpoint'
```

### Test the Todo App
1. **Přidejte položku todo** - Klikněte na „Add Todo“ a zadejte úkol
2. **Označte jako dokončené** - Zaškrtněte dokončené položky
3. **Odstraňte položky** - Odstraňte todo položky, které již nepotřebujete

### Monitor Your Application
```bash
# Otevřít portál Azure pro vaše prostředky
azd monitor

# Zobrazit protokoly aplikace
azd monitor --logs

# Zobrazit metriky v reálném čase
azd monitor --live
```

### ✅ Verify Your Deployment

Než budete pokračovat, projděte tento rychlý kontrolní seznam, abyste potvrdili, že vše skutečně funguje — nepředpokládejte, že "nasazení proběhlo úspěšně" znamená "aplikace funguje":

```bash
# 1. Ověřte, že koncový bod existuje a je dosažitelný
azd show

# 2. Proveďte smoke-test koncového bodu (očekává HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Zkontrolujte health koncový bod, pokud jej vaše aplikace vystavuje
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Nasazení je ověřeno, když:**
- ✅ `azd show` zobrazuje dostupnou URL koncového bodu
- ✅ URL se v prohlížeči otevře bez chyb
- ✅ Základní funkce fungují (přidání/označení/odstranění todo)
- ✅ `azd monitor --logs` ukazuje příchozí požadavky bez neočekávaných chyb

Pokud některá kontrola selže, přejděte na [Kapitola 7: Odstraňování problémů](../chapter-07-troubleshooting/README.md).

## Step 6: Make Changes and Redeploy

Proveďme změnu a uvidíme, jak snadné je aktualizovat:

### Modify the API
```bash
# Upravte kód API
code src/api/src/routes/lists.js
```

Add a custom response header:
```javascript
// Najděte obslužnou funkci trasy a přidejte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Deploy Just the Code Changes
```bash
# Nasadit pouze aplikační kód (vynechat infrastrukturu)
azd deploy

# To je mnohem rychlejší než 'azd up', protože infrastruktura již existuje
```

## Step 7: Manage Multiple Environments

Vytvořte stagingové prostředí k otestování změn před produkcí:

```bash
# Vytvořit nové stagingové prostředí
azd env new staging

# Nasadit na staging
azd up

# Přepnout zpět na vývojové prostředí
azd env select dev

# Vypsat všechna prostředí
azd env list
```

### Environment Comparison
```bash
# Zobrazit vývojové prostředí
azd env select dev
azd show

# Zobrazit předprodukční prostředí
azd env select staging
azd show
```

## Step 8: Clean Up Resources

Až dokončíte experimentování, vyčistěte prostředky, abyste předešli průběžným poplatkům:

```bash
# Odstranit všechny prostředky Azure pro aktuální prostředí
azd down

# Vynutit smazání bez potvrzení a trvale odstranit dočasně smazané prostředky
azd down --force --purge

# Odstranit konkrétní prostředí
azd env select staging
azd down --force --purge
```

## Classic App vs. AI-Powered App: Same Workflow

Právě jste nasadili tradiční webovou aplikaci. Co když byste místo toho chtěli nasadit aplikaci poháněnou AI — třeba chatovací aplikaci využívající Microsoft Foundry Models?

Dobrá zpráva: **pracovní postup je totožný.**

| Krok | Klasická aplikace Todo | AI Chat aplikace |
|------|-------------------------|------------------|
| Inicializace | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentizace | `azd auth login` | `azd auth login` |
| Nasazení | `azd up` | `azd up` |
| Monitorování | `azd monitor` | `azd monitor` |
| Vyčištění | `azd down --force --purge` | `azd down --force --purge` |

Jediný rozdíl je v **šabloně**, se kterou začnete. AI šablona zahrnuje další infrastrukturu (např. Microsoft Foundry Models resource nebo AI Search index), ale azd se o to postará za vás. Nemusíte se učit nové příkazy, přebírat jiný nástroj nebo měnit způsob myšlení o nasazení.

To je hlavní princip azd: **jeden pracovní postup pro libovolné úlohy.** Dovednosti, které jste procvičili v tomto tutoriálu — inicializace, nasazení, monitorování, opětovné nasazení a úklid — platí stejně pro AI aplikace a agenty.

---

## What You've Learned

Gratulujeme! Úspěšně jste:
- ✅ Inicializovali azd projekt ze šablony
- ✅ Prozkoumali strukturu projektu a klíčové soubory
- ✅ Nasadili full-stack aplikaci do Azure
- ✅ Provedli změny v kódu a znovu nasadili
- ✅ Spravovali více prostředí
- ✅ Vyčistili prostředky

## 🎯 Skill Validation Exercises

### Exercise 1: Deploy a Different Template (15 minutes)
**Goal**: Demonstrate mastery of azd init and deployment workflow

```bash
# Vyzkoušejte stack Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Ověřte nasazení
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Vyčistěte
azd down --force --purge
```

**Kritéria úspěchu:**
- [ ] Aplikace se nasadí bez chyb
- [ ] Lze otevřít URL aplikace v prohlížeči
- [ ] Aplikace funguje správně (přidávání/odstraňování todo)
- [ ] Všechny prostředky byly úspěšně odstraněny

### Exercise 2: Customize Configuration (20 minutes)
**Goal**: Practice environment variable configuration

```bash
cd my-first-azd-app

# Vytvořit vlastní prostředí
azd env new custom-config

# Nastavit vlastní proměnné
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Ověřit proměnné
azd env get-values | grep APP_TITLE

# Nasadit s vlastní konfigurací
azd up
```

**Kritéria úspěchu:**
- [ ] Vlastní prostředí vytvořeno úspěšně
- [ ] Proměnné prostředí nastaveny a dostupné
- [ ] Aplikace nasazena s vlastní konfigurací
- [ ] Lze ověřit vlastní nastavení v nasazené aplikaci

### Exercise 3: Multi-Environment Workflow (25 minutes)
**Goal**: Master environment management and deployment strategies

```bash
# Vytvořit vývojové prostředí
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Poznamenejte URL vývojového prostředí
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Vytvořit stagingové prostředí
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Poznamenejte URL stagingového prostředí
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Porovnat prostředí
azd env list

# Otestovat obě prostředí
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Vyčistit obě prostředí
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kritéria úspěchu:**
- [ ] Vytvořena dvě prostředí s různými konfiguracemi
- [ ] Obě prostředí nasazena úspěšně
- [ ] Lze přepínat mezi prostředími pomocí `azd env select`
- [ ] Proměnné prostředí se liší mezi prostředími
- [ ] Obě prostředí úspěšně vyčištěna

## 📊 Your Progress

**Time Invested**: ~60-90 minutes  
**Skills Acquired**:
- ✅ Inicializace projektu ze šablony
- ✅ Provisioning Azure zdrojů
- ✅ Workflows nasazení aplikací
- ✅ Správa prostředí
- ✅ Správa konfigurací
- ✅ Úklid zdrojů a správa nákladů

**Next Level**: Jste připraveni na [Průvodce konfigurací](configuration.md) pro naučení pokročilých konfiguračních vzorů!

## Troubleshooting Common Issues

### Authentication Errors
```bash
# Znovu se přihlaste do Azure
az login

# Ověřte přístup k předplatnému
az account show
```

### Deployment Failures
```bash
# Povolit ladicí logování
export AZD_DEBUG=true
azd up --debug

# Zobrazit protokoly aplikace v Azure
azd monitor --logs

# Pro Container Apps použijte Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resource Name Conflicts
```bash
# Použijte jedinečný název prostředí
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network Issues
```bash
# Zkontrolujte, zda jsou porty dostupné
netstat -an | grep :3000
netstat -an | grep :3100
```

## Next Steps

Nyní, když jste dokončili svůj první projekt, prozkoumejte tato pokročilá témata:

### 1. Customize Infrastructure
- [Infrastruktura jako kód](../chapter-04-infrastructure/provisioning.md)
- [Přidat databáze, úložiště a další služby](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Set Up CI/CD
- [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md) - Kompletní CI/CD workflowy
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfigurace pipeline

### 3. Production Best Practices
- [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md) - Bezpečnost, výkon a monitorování

### 4. Explore More Templates
```bash
# Procházet šablony podle kategorie
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Vyzkoušet různé sady technologií
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Additional Resources

### Learning Materials
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates & Examples
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Podnikové vzory](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulujeme k dokončení vašeho prvního azd projektu!** Nyní jste připraveni s jistotou vytvářet a nasazovat úžasné aplikace na Azure.

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
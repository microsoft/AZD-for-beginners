# Váš prvý projekt - praktický návod

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a rýchly štart
- **⬅️ Predchádzajúca**: [Inštalácia a nastavenie](installation.md)
- **➡️ Nasledujúca**: [Prines si vlastnú aplikáciu](bring-your-own-app.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Vitajte vo vašom prvom projekte Azure Developer CLI! Nainštalujete todo aplikáciu s frontendom v Reacte, Node.js API a Azure Cosmos DB. Šablóna si ponechala pôvodný názov `todo-nodejs-mongo`; jej súčasná infraštruktúra používa Cosmos DB pre NoSQL, preto si preštudujte stiahnutý README a `infra/` namiesto vyvodzovania rozhrania databázy podľa názvu.

> Recenzované podľa `azd 1.37.2` a verejnej šablóny v novembri 2026. Príklady nižšie používajú Bash; extrakcia JSON vyžaduje aj `jq`. Nasadenia na Azure účtujú poplatky a neboli vykonané počas tejto kontroly.

## Ciele učenia

Po dokončení tohto návodu:
- Ovládnete vytváranie projektu azd z šablón
- Pochopíte štruktúru projektu Azure Developer CLI a konfiguračné súbory
- Vykonáte kompletné nasadenie aplikácie na Azure vrátane sprístupnenia infraštruktúry
- Implementujete aktualizácie aplikácie a stratégie znovunasadenia
- Spravujete viacero prostredí na vývoj a testovanie
- Aplikujete praktiky čistenia zdrojov a riadenia nákladov

## Výsledky učenia

Po dokončení budete schopní:
- Samostatne inicializovať a konfigurovať projekty azd zo šablón
- Efektívne navigovať a modifikovať štruktúru projektu azd
- Nasadzovať full-stack aplikácie na Azure jedným príkazom
- Riešiť bežné problémy pri nasadení a autentifikácii
- Spravovať viaceré Azure prostredia pre rôzne fázy nasadenia
- Implementovať kontinuálne pracovné toky nasadenia pre aktualizácie aplikácií

## Začíname

### Kontrolný zoznam predpokladov
- ✅ Azure Developer CLI nainštalovaný ([Inštalačný návod](installation.md))
- ✅ Dokončená autentifikácia AZD pomocou `azd auth login`
- ✅ Git nainštalovaný v systéme
- ✅ Node.js 22 LTS (alebo podporovaná verzia podľa použitej šablóny)
- ✅ Visual Studio Code (odporúčané)

Pred pokračovaním spustite validátor nastavenia z koreňového adresára repozitára:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Overte svoje nastavenie
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Overte voliteľnú autentifikáciu Azure CLI

```bash
az account show
```

### Skontrolujte verziu Node.js
```bash
node --version
```

## Krok 1: Vyberte a inicializujte šablónu

Začnime s populárnou todo aplikáciou, ktorá obsahuje React frontend a Node.js API backend.

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

### Čo sa práve stalo?
- Šablóna kódu bola stiahnutá do lokálneho adresára
- Vytvorený súbor `azure.yaml` so službami
- Nastavený infraštruktúrny kód v priečinku `infra/`
- Vytvorená konfigurácia prostredia

## Krok 2: Preskúmajte štruktúru projektu

Pozrime sa, čo azd vytvoril:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Mali by ste vidieť:
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

### Kľúčové súbory na pochopenie

**azure.yaml** - Srdce vášho azd projektu:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definícia infraštruktúry:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Krok 3: Prispôsobte svoj projekt (voliteľné)

Pred nasadením môžete prispôsobiť aplikáciu:

### Upravte frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Urobte jednoduchú zmenu:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Konfigurujte premenné prostredia
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Tieto dve vlastné hodnoty demonštrujú len lokálne uloženie. Štandardná šablóna nevyužíva `WEBSITE_TITLE` ani `API_VERSION`, takže aplikáciu nemenia. Explicitná úprava zdroja vyššie mení zobrazený titulok.

## Krok 4: Nasadzujte na Azure

Teraz tá vzrušujúca časť - nasadí sa všetko na Azure!

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

Pracovný tok sprístupňuje infraštruktúru a balíčkuje/nasadzuje kód. Presné poradie možno prispôsobiť cez `workflows.up` v `azure.yaml`; táto šablóna určuje najprv provision, potom deploy. Nespoliehajte sa na jedno univerzálne poradie fáz pre každú šablónu.

### Očakávaný výstup
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Krok 5: Otestujte svoju aplikáciu

### Prístup k aplikácii
Kliknite na URL v nasadzovacom výstupe, alebo ju získate kedykoľvek:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Otestujte todo aplikáciu
1. **Pridajte položku todo** - Kliknite na "Add Todo" a zadajte úlohu
2. **Označte ako dokončené** - Označte splnené položky
3. **Vymažte položky** - Odstráňte nepotrebné úlohy

### Sledujte svoju aplikáciu
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Overte svoje nasadenie

Pred pokračovaním prejdite túto rýchlu kontrolu, aby ste si boli istí, že všetko naozaj funguje—nepredpokladajte, že "nasadenie úspešné" znamená "aplikácia funguje":

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

**Nasadenie je overené, ak:**
- ✅ `azd show` zobrazí dosiahnuteľnú URL endpointu
- ✅ URL sa otvorí v prehliadači bez chýb
- ✅ Základné funkcie fungujú (pridanie/dokončenie/odstránenie todo)
- ✅ `azd monitor --logs` ukazuje prichádzajúce požiadavky bez neočakávaných chýb

Ak niektorá kontrola zlyhá, prejdite na [Kapitola 7: Riešenie problémov](../chapter-07-troubleshooting/README.md).

## Krok 6: Urobte zmeny a znovu nasadzujte

Urobme zmenu a uvidíme, aké ľahké je aktualizovať:

### Upravte API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Pridajte vlastný hlavičkový parameter odpovede:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nasadzujte len zmeny v kóde
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Krok 7: Spravujte viaceré prostredia

Vytvorte testovacie prostredie na overenie zmien pred produkciou:

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

## Krok 8: Vyčistite zdroje

Po skončení experimentovania vyčistite zdroje, aby ste predišli zbytočným poplatkom:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Klasická aplikácia vs. AI poháňaná aplikácia: Rovnaký pracovný tok

Práve ste nasadili tradičnú webovú aplikáciu. Čo ak by ste chceli namiesto toho nasadiť AI poháňanú aplikáciu – napríklad chat aplikáciu podporovanú Microsoft Foundry Modelmi?

Dobrá správa: **pracovný tok je rovnaký.**

| Krok | Klasická Todo App | AI Chat App |
|------|-----------------|-------------|
| Inicializácia (prázdny adresár) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Autentifikácia | `azd auth login` | `azd auth login` |
| Nasadenie | `azd up` | `azd up` |
| Monitorovanie | `azd monitor` | `azd monitor` |
| Čistenie | `azd down --force --purge` | `azd down --force --purge` |

Príkazy životného cyklu sú rovnaké, ale predpoklady sa líšia. AI šablóna môže vyžadovať prístup k modelu, regionálny kvóta, príjem dát a ďalšiu konfiguráciu. Pred nasadením si prečítajte jej README; `azd up` nemôže pridať chýbajúce povolenia alebo kvóty.

Toto je jadro princípu azd: **jeden pracovný tok, akékoľvek zaťaženie.** Zručnosti, ktoré ste trénovali v tomto návode – inicializácia, nasadenie, monitorovanie, znovunásadenie a čistenie – platia rovnako pre AI aplikácie a agentov.

---

## Čo ste sa naučili

Gratulujeme! Úspešne ste:
- ✅ Inicializovali azd projekt zo šablóny
- ✅ Preskúmali štruktúru projektu a kľúčové súbory
- ✅ Nasadili full-stack aplikáciu na Azure
- ✅ Urobili zmeny v kóde a znovu nasadili
- ✅ Spravovali viaceré prostredia
- ✅ Vyčistili zdroje

## 🎯 Cvičenia na overenie zručností

### Cvičenie 1: Nasadiť inú šablónu (15 minút)
**Cieľ**: Ukázať ovládanie azd init a pracovného toku nasadenia

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

**Kritériá úspechu:**
- [ ] Aplikácia sa nasadí bez chýb
- [ ] Možnosť pristúpiť k URL aplikácie v prehliadači
- [ ] Aplikácia funguje správne (pridávanie/odstraňovanie todo)
- [ ] Úspešne vyčistené všetky zdroje

### Cvičenie 2: Prispôsobte konfiguráciu (20 minút)
**Cieľ**: Precvičiť ukladanie hodnôt do lokálneho prostredia bez zamieňania za runtime konfiguráciu

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

**Kritériá úspechu:**
- [ ] Vlastné prostredie úspešne vytvorené
- [ ] Premenné prostredia nastavené a dostupné
- [ ] `azd env get-value APP_TITLE` vypíše `My Custom Todo App`
- [ ] Vedieť vysvetliť, prečo tieto hodnoty nemenia štandardnú aplikáciu, pokiaľ ich kód/infra nevyužíva

### Cvičenie 3: Viacprostredový pracovný tok (25 minút)
**Cieľ**: Ovládnuť správu prostredí a stratégie nasadenia

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

**Kritériá úspechu:**
- [ ] Vytvorené dve prostredia s odlišnou konfiguráciou
- [ ] Obe prostredia úspešne nasadené
- [ ] Možnosť prepínať medzi prostrediami pomocou `azd env select`
- [ ] Premenné prostredia sa líšia medzi prostrediami
- [ ] Obe prostredia úspešne vyčistené

## 📊 Váš postup

**Investovaný čas**: ~60-90 minút  
**Nadobudnuté zručnosti**:
- ✅ Inicializácia projektov zo šablón
- ✅ Provisionovanie Azure zdrojov
- ✅ Pracovné toky nasadenia aplikácií
- ✅ Správa prostredí
- ✅ Správa konfigurácie
- ✅ Čistenie zdrojov a riadenie nákladov

**Ďalšie kroky**: Ste pripravení na [Sprievodcu konfiguráciou](../chapter-03-configuration/configuration.md) a naučiť sa pokročilé vzory konfigurácie!

## Riešenie bežných problémov

### Chyby autentifikácie
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Zlyhania nasadenia
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikty mien zdrojov
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Problémy s portami/sieťou
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Ďalšie kroky

Po dokončení prvého projektu preskúmajte tieto pokročilé témy:

### 1. Prispôsobte infraštruktúru
- [Infrastruktúra ako kód](../chapter-04-infrastructure/provisioning.md)
- [Pridajte infraštruktúru databázy](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Nastavte CI/CD
- [Sprievodca nasadením](../chapter-04-infrastructure/deployment-guide.md) - Kompletné CI/CD pracovné toky
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfigurácia pipeline

### 3. Best practices pre produkciu
- [Sprievodca nasadením](../chapter-04-infrastructure/deployment-guide.md) - Bezpečnosť, výkon a monitorovanie

### 4. Preskúmajte ďalšie šablóny
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

## Doplnkové zdroje

### Vzdelávacie materiály
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunita a podpora
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablóny a príklady
- [Oficiálna galéria šablón](https://azure.github.io/awesome-azd/)
- [Príspevky komunitných šablón](https://github.com/Azure/awesome-azd)
- [Zdroj šablóny Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Gratulujeme k dokončeniu vášho prvého projektu azd!** Teraz ste pripravení s istotou vytvárať a nasadzovať úžasné aplikácie na Azure.

---

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a rýchly štart
- **⬅️ Predchádzajúca**: [Inštalácia a nastavenie](installation.md)
- **➡️ Nasledujúca**: [Prines si vlastnú aplikáciu](bring-your-own-app.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
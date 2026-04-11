# Váš první projekt – praktický tutoriál

**Navigace kapitolou:**
- **📚 Domů kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 – Základy & Rychlý start
- **⬅️ Předchozí**: [Instalace a nastavení](installation.md)
- **➡️ Další**: [Konfigurace](configuration.md)
- **🚀 Další kapitola**: [Kapitola 2: Vývoj s AI na prvním místě](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Vítejte u vašeho prvního projektu s Azure Developer CLI! Tento rozsáhlý praktický průvodce vás provede kompletní tvorbou, nasazením a správou full-stack aplikace na Azure pomocí azd. Budete pracovat s reálnou todo aplikací, která obsahuje frontend v Reactu, backend API v Node.js a databázi MongoDB.

## Cíle učení

Po dokončení tohoto tutoriálu budete umět:
- Ovládnout workflow inicializace azd projektů pomocí šablon
- Porozumět struktuře projektu Azure Developer CLI a konfiguračním souborům
- Provést kompletní nasazení aplikace na Azure včetně poskytování infrastruktury
- Implementovat aktualizace aplikace a strategie opětovného nasazení
- Spravovat více prostředí pro vývoj a staging
- Aplikovat postupy čištění zdrojů a řízení nákladů

## Výsledky učení

Po dokončení budete schopni:
- Samostatně inicializovat a konfigurovat azd projekty ze šablon
- Efektivně se orientovat ve struktuře azd projektů a upravovat ji
- Nasazovat full-stack aplikace na Azure jedním příkazem
- Řešit běžné problémy s nasazením a autentizací
- Spravovat různá Azure prostředí pro různé fáze nasazení
- Implementovat kontinuální deploy workflow pro aktualizace aplikace

## Začínáme

### Kontrolní seznam požadavků
- ✅ Nainstalovaný Azure Developer CLI ([Průvodce instalací](installation.md))
- ✅ Přihlášení přes `azd auth login`
- ✅ Git nainstalovaný ve vašem systému
- ✅ Node.js 16+ (pro tento tutoriál)
- ✅ Doporučený editor Visual Studio Code

Před pokračováním spusťte validátor nastavení z kořene repozitáře:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Ověřte své nastavení
```bash
# Zkontrolujte instalaci azd
azd version

# Zkontrolujte ověřování AZD
azd auth login --check-status
```

### Volitelná autentizace přes Azure CLI

```bash
az account show
```

### Zkontrolujte verzi Node.js
```bash
node --version
```

## Krok 1: Vyberte a inicializujte šablonu

Začneme s populární šablonou todo aplikace, která obsahuje frontend v Reactu a backend API v Node.js.

```bash
# Procházet dostupné šablony
azd template list

# Inicializovat šablonu aplikace todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Postupujte podle pokynů:
# - Zadejte název prostředí: "dev"
# - Vyberte předplatné (pokud máte více)
# - Vyberte oblast: "East US 2" (nebo preferovanou oblast)
```

### Co se právě stalo?
- Šablona kódu byla stažena do vašeho lokálního adresáře
- Vytvořen soubor `azure.yaml` s definicí služeb
- Nastaven kód infrastruktury ve složce `infra/`
- Vytvořena konfigurace prostředí

## Krok 2: Prozkoumejte strukturu projektu

Podívejme se, co azd pro nás vytvořil:

```bash
# Zobrazit strukturu projektu
tree /f   # Windows
# nebo
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

### Klíčové soubory, které byste měli znát

**azure.yaml** – Srdce vašeho azd projektu:
```bash
# Zobrazit konfiguraci projektu
cat azure.yaml
```

**infra/main.bicep** – Definice infrastruktury:
```bash
# Zobrazit infrastrukturu kódu
head -30 infra/main.bicep
```

## Krok 3: Přizpůsobte si projekt (volitelné)

Před nasazením můžete aplikaci upravit:

### Úprava frontendu
```bash
# Otevřete komponentu aplikace React
code src/web/src/App.tsx
```

Proveďte jednoduchou změnu:
```typescript
// Najděte název a změňte ho
<h1>My Awesome Todo App</h1>
```

### Konfigurace proměnných prostředí
```bash
# Nastavit vlastní proměnné prostředí
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Zobrazit všechny proměnné prostředí
azd env get-values
```

## Krok 4: Nasazení na Azure

Přichází ten vzrušující okamžik – nasazení všeho na Azure!

```bash
# Nasadit infrastrukturu a aplikaci
azd up

# Tento příkaz udělá:
# 1. Zřídí zdroje Azure (App Service, Cosmos DB, atd.)
# 2. Sestaví vaši aplikaci
# 3. Nasadí na zřízené zdroje
# 4. Zobrazí URL aplikace
```

### Co se děje během nasazení?

Příkaz `azd up` provádí tyto kroky:
1. **Provisioning** (`azd provision`) - Vytvoření Azure zdrojů
2. **Package** - Sestavení aplikačního kódu
3. **Deploy** (`azd deploy`) - Nasazení kódu na Azure zdroje

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
Klikněte na URL uvedenou ve výstupu nasazení nebo ji získejte kdykoli:
```bash
# Získat koncové body aplikace
azd show

# Otevřete aplikaci ve svém prohlížeči
azd show --output json | jq -r '.services.web.endpoint'
```

### Testujte aplikaci Todo
1. **Přidat položku** – Klikněte na "Add Todo" a zadejte úkol
2. **Označit jako splněné** – Zaškrtněte dokončené položky
3. **Smazat položky** – Odeberte nepotřebné todo úkoly

### Sledujte aplikaci
```bash
# Otevřít Azure portál pro vaše zdroje
azd monitor

# Zobrazit protokoly aplikace
azd monitor --logs

# Zobrazit živé metriky
azd monitor --live
```

## Krok 6: Proveďte změny a nasazení znovu

Proveďme změnu a uvidíme, jak snadná je aktualizace:

### Úprava API
```bash
# Upravte kód API
code src/api/src/routes/lists.js
```

Přidejte vlastní záhlaví odpovědi:
```javascript
// Najděte zpracovatele trasy a přidejte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nasadit pouze změny kódu
```bash
# Nasazení pouze aplikačního kódu (přeskočit infrastrukturu)
azd deploy

# Toto je mnohem rychlejší než 'azd up', protože infrastruktura již existuje
```

## Krok 7: Správa více prostředí

Vytvořte stagingové prostředí pro testování před produkcí:

```bash
# Vytvořit nové staging prostředí
azd env new staging

# Nasadit do staging
azd up

# Přepnout zpět do vývojového prostředí
azd env select dev

# Vypsat všechna prostředí
azd env list
```

### Porovnání prostředí
```bash
# Zobrazit vývojové prostředí
azd env select dev
azd show

# Zobrazit testovací prostředí
azd env select staging
azd show
```

## Krok 8: Vyčistěte zdroje

Když skončíte s testováním, vyčistěte zdroje, abyste se vyhnuli dalším poplatkům:

```bash
# Odstraňte všechny zdroje Azure pro aktuální prostředí
azd down

# Vynucené smazání bez potvrzení a vymazání měkkých smazaných zdrojů
azd down --force --purge

# Odstraňte konkrétní prostředí
azd env select staging
azd down --force --purge
```

## Klasická aplikace vs. aplikace s AI: stejný workflow

Právě jste nasadili tradiční webovou aplikaci. Co když ale chcete nasadit AI aplikaci — například chat aplikaci založenou na Microsoft Foundry modelech?

Dobrá zpráva: **workflow je stejné.**

| Krok | Klasická todo aplikace | AI chat aplikace |
|------|-----------------------|------------------|
| Inicializace | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentizace | `azd auth login` | `azd auth login` |
| Nasazení | `azd up` | `azd up` |
| Monitorování | `azd monitor` | `azd monitor` |
| Úklid | `azd down --force --purge` | `azd down --force --purge` |

Jediný rozdíl je **šablona**, ze které začnete. AI šablona zahrnuje další infrastrukturu (jako zdroj Microsoft Foundry Models nebo index AI Search), ale azd se o to vše postará. Nemusíte se učit nové příkazy, přecházet na jiný nástroj nebo měnit způsob myšlení o nasazení.

To je základní princip azd: **jedno workflow, jakákoliv zátěž.** Dovednosti, které jste si osvojili v tomto tutoriálu – inicializace, nasazení, monitorování, opakované nasazení a úklid – platí stejně pro AI aplikace a agenty.

---

## Co jste se naučili

Gratulujeme! Úspěšně jste:
- ✅ Inicializovali azd projekt ze šablony
- ✅ Prozkoumali strukturu projektu a klíčové soubory
- ✅ Nasadili full-stack aplikaci na Azure
- ✅ Provedli změny kódu a znovu nasadili
- ✅ Spravovali více prostředí
- ✅ Vyčistili zdroje

## 🎯 Ověřovací cvičení dovedností

### Cvičení 1: Nasazení jiné šablony (15 minut)
**Cíl**: Ukázat zvládnutí `azd init` a workflow nasazení

```bash
# Vyzkoušejte zásobník Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Ověřte nasazení
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Vyčistit
azd down --force --purge
```

**Kritéria úspěchu:**
- [ ] Aplikace se nasadí bez chyb
- [ ] Je možné načíst URL aplikace v prohlížeči
- [ ] Aplikace funguje správně (přidávání/odstraňování todos)
- [ ] Zdrojů bylo úspěšně vyčištěno

### Cvičení 2: Přizpůsobení konfigurace (20 minut)
**Cíl**: Procvičit konfiguraci proměnných prostředí

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

# Nasadit s vlastním nastavením
azd up
```

**Kritéria úspěchu:**
- [ ] Vlastní prostředí bylo úspěšně vytvořeno
- [ ] Proměnné prostředí jsou nastaveny a dostupné
- [ ] Aplikace se nasadila s vlastní konfigurací
- [ ] Můžete ověřit vlastní nastavení nasazené aplikace

### Cvičení 3: Workflow více prostředí (25 minut)
**Cíl**: Mistrovství v správě a strategiích nasazení prostředí

```bash
# Vytvořit vývojové prostředí
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Poznamenejte si vývojovou URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Vytvořit testovací prostředí
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Poznamenejte si testovací URL
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
- [ ] Vytvořena dvě prostředí s odlišnou konfigurací
- [ ] Obě prostředí byla úspěšně nasazena
- [ ] Můžete přepínat mezi prostředími pomocí `azd env select`
- [ ] Proměnné prostředí se liší mezi prostředími
- [ ] Obě prostředí byla úspěšně vyčištěna

## 📊 Váš pokrok

**Čas investovaný**: ~60-90 minut  
**Získané dovednosti**:
- ✅ Inicializace projektu ze šablony
- ✅ Poskytování Azure zdrojů
- ✅ Workflow nasazení aplikací
- ✅ Správa prostředí
- ✅ Správa konfigurace
- ✅ Úklid zdrojů a řízení nákladů

**Další krok**: Jste připraveni na [Průvodce konfigurací](configuration.md), kde se naučíte pokročilé konfigurační vzory!

## Řešení běžných problémů

### Chyby autentizace
```bash
# Znovu se ověřte pomocí Azure
az login

# Ověřte přístup k odběru
az account show
```

### Selhání nasazení
```bash
# Povolit ladicí protokolování
export AZD_DEBUG=true
azd up --debug

# Zobrazit protokoly aplikace v Azure
azd monitor --logs

# Pro Container Apps použijte Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikty názvů zdrojů
```bash
# Použijte jedinečný název prostředí
azd env new dev-$(whoami)-$(date +%s)
```

### Problémy s porty/sítí
```bash
# Zkontrolujte, zda jsou porty dostupné
netstat -an | grep :3000
netstat -an | grep :3100
```

## Další kroky

Po dokončení prvního projektu prozkoumejte tyto pokročilé témata:

### 1. Přizpůsobte si infrastrukturu
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Přidání databází, úložišť a dalších služeb](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Nastavte CI/CD
- [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md) – kompletní CI/CD workflow
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) – konfigurace pipeline

### 3. Nejlepší praktiky pro produkci
- [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md) – bezpečnost, výkon a monitorování

### 4. Prozkoumejte více šablon
```bash
# Prohlížejte šablony podle kategorie
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Vyzkoušejte různé technologické stacky
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Další zdroje

### Vzdělávací materiály
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
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulujeme k dokončení vašeho prvního projektu s azd!** Nyní jste připraveni s důvěrou vytvářet a nasazovat skvělé aplikace na Azure.

---

**Navigace kapitolou:**
- **📚 Domů kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 – Základy & Rychlý start
- **⬅️ Předchozí**: [Instalace a nastavení](installation.md)
- **➡️ Další**: [Konfigurace](configuration.md)
- **🚀 Další kapitola**: [Kapitola 2: Vývoj s AI na prvním místě](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Další lekce**: [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nebereme na sebe odpovědnost za jakékoliv nedorozumění nebo nesprávné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
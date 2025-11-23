<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-23T11:22:41+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "cs"
}
-->
# Váš první projekt - Praktický tutoriál

**Navigace kapitol:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy & Rychlý start
- **⬅️ Předchozí**: [Instalace & Nastavení](installation.md)
- **➡️ Další**: [Konfigurace](configuration.md)
- **🚀 Další kapitola**: [Kapitola 2: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)

## Úvod

Vítejte u svého prvního projektu s Azure Developer CLI! Tento komplexní praktický tutoriál vás provede procesem vytvoření, nasazení a správy full-stack aplikace na Azure pomocí azd. Budete pracovat s reálnou aplikací pro správu úkolů, která zahrnuje React frontend, Node.js API backend a databázi MongoDB.

## Cíle učení

Po dokončení tohoto tutoriálu budete:
- Ovládat workflow inicializace projektu azd pomocí šablon
- Rozumět struktuře projektu Azure Developer CLI a konfiguračním souborům
- Provádět kompletní nasazení aplikace na Azure včetně zajištění infrastruktury
- Implementovat aktualizace aplikace a strategie pro opětovné nasazení
- Spravovat více prostředí pro vývoj a testování
- Aplikovat postupy pro čištění zdrojů a správu nákladů

## Výsledky učení

Po dokončení budete schopni:
- Samostatně inicializovat a konfigurovat projekty azd ze šablon
- Efektivně se orientovat ve struktuře projektů azd a provádět úpravy
- Nasazovat full-stack aplikace na Azure pomocí jediného příkazu
- Řešit běžné problémy s nasazením a autentizací
- Spravovat více prostředí Azure pro různé fáze nasazení
- Implementovat workflow pro kontinuální nasazení aktualizací aplikace

## Začínáme

### Kontrolní seznam předpokladů
- ✅ Nainstalovaný Azure Developer CLI ([Průvodce instalací](installation.md))
- ✅ Nainstalovaný a autentizovaný Azure CLI
- ✅ Nainstalovaný Git na vašem systému
- ✅ Node.js 16+ (pro tento tutoriál)
- ✅ Visual Studio Code (doporučeno)

### Ověření nastavení
```bash
# Zkontrolujte instalaci azd
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

Začněme populární šablonou aplikace pro správu úkolů, která zahrnuje React frontend a Node.js API backend.

```bash
# Procházet dostupné šablony
azd template list

# Inicializovat šablonu aplikace úkolů
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Postupujte podle pokynů:
# - Zadejte název prostředí: "dev"
# - Vyberte předplatné (pokud máte více)
# - Vyberte region: "East US 2" (nebo váš preferovaný region)
```

### Co se právě stalo?
- Stažený kód šablony do vašeho lokálního adresáře
- Vytvořený soubor `azure.yaml` s definicemi služeb
- Nastavený kód infrastruktury v adresáři `infra/`
- Vytvořená konfigurace prostředí

## Krok 2: Prozkoumání struktury projektu

Podívejme se, co nám azd vytvořil:

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

### Klíčové soubory k pochopení

**azure.yaml** - Srdce vašeho projektu azd:
```bash
# Zobrazit konfiguraci projektu
cat azure.yaml
```

**infra/main.bicep** - Definice infrastruktury:
```bash
# Zobrazit kód infrastruktury
head -30 infra/main.bicep
```

## Krok 3: Přizpůsobení projektu (volitelné)

Před nasazením můžete aplikaci přizpůsobit:

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

Teď přichází vzrušující část - nasazení všeho na Azure!

```bash
# Nasadit infrastrukturu a aplikaci
azd up

# Tento příkaz provede:
# 1. Zajištění prostředků Azure (App Service, Cosmos DB, atd.)
# 2. Sestavení vaší aplikace
# 3. Nasazení na zajištěné prostředky
# 4. Zobrazení URL aplikace
```

### Co se děje během nasazení?

Příkaz `azd up` provádí tyto kroky:
1. **Zajištění** (`azd provision`) - Vytvoření zdrojů na Azure
2. **Balíček** - Sestavení kódu aplikace
3. **Nasazení** (`azd deploy`) - Nasazení kódu na zdroje Azure

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

### Přístup k vaší aplikaci
Klikněte na URL uvedenou ve výstupu nasazení nebo ji získejte kdykoli:
```bash
# Získejte koncové body aplikace
azd show

# Otevřete aplikaci ve svém prohlížeči
azd show --output json | jq -r '.services.web.endpoint'
```

### Testování aplikace pro správu úkolů
1. **Přidání úkolu** - Klikněte na "Add Todo" a zadejte úkol
2. **Označení jako dokončené** - Zaškrtněte dokončené úkoly
3. **Odstranění úkolů** - Odstraňte úkoly, které již nepotřebujete

### Monitorování aplikace
```bash
# Otevřete Azure portál pro vaše zdroje
azd monitor

# Zobrazit protokoly aplikace
azd logs
```

## Krok 6: Provedení změn a opětovné nasazení

Proveďme změnu a podívejme se, jak snadné je aktualizovat:

### Úprava API
```bash
# Upravit kód API
code src/api/src/routes/lists.js
```

Přidejte vlastní hlavičku odpovědi:
```javascript
// Najděte obslužnou funkci trasy a přidejte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nasazení pouze změn v kódu
```bash
# Nasadit pouze aplikační kód (přeskočit infrastrukturu)
azd deploy

# To je mnohem rychlejší než 'azd up', protože infrastruktura již existuje
```

## Krok 7: Správa více prostředí

Vytvořte testovací prostředí pro ověření změn před produkcí:

```bash
# Vytvořte nové testovací prostředí
azd env new staging

# Nasadit do testovacího prostředí
azd up

# Přepnout zpět na vývojové prostředí
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

## Krok 8: Vyčištění zdrojů

Až skončíte s experimentováním, vyčistěte zdroje, abyste se vyhnuli dalším poplatkům:

```bash
# Smazat všechny prostředky Azure pro aktuální prostředí
azd down

# Vynutit smazání bez potvrzení a vymazat měkce smazané prostředky
azd down --force --purge

# Smazat konkrétní prostředí
azd env select staging
azd down --force --purge
```

## Co jste se naučili

Gratulujeme! Úspěšně jste:
- ✅ Inicializovali projekt azd ze šablony
- ✅ Prozkoumali strukturu projektu a klíčové soubory
- ✅ Nasadili full-stack aplikaci na Azure
- ✅ Provedli změny v kódu a opětovné nasazení
- ✅ Spravovali více prostředí
- ✅ Vyčistili zdroje

## 🎯 Cvičení pro ověření dovedností

### Cvičení 1: Nasazení jiné šablony (15 minut)
**Cíl**: Prokázat zvládnutí workflow inicializace a nasazení azd

```bash
# Vyzkoušejte stack Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Ověřte nasazení
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Uklidit
azd down --force --purge
```

**Kritéria úspěchu:**
- [ ] Aplikace se nasadí bez chyb
- [ ] Přístup k URL aplikace v prohlížeči
- [ ] Aplikace funguje správně (přidání/odstranění úkolů)
- [ ] Úspěšně vyčištěny všechny zdroje

### Cvičení 2: Přizpůsobení konfigurace (20 minut)
**Cíl**: Procvičit konfiguraci proměnných prostředí

```bash
cd my-first-azd-app

# Vytvořte vlastní prostředí
azd env new custom-config

# Nastavte vlastní proměnné
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Ověřte proměnné
azd env get-values | grep APP_TITLE

# Nasazení s vlastní konfigurací
azd up
```

**Kritéria úspěchu:**
- [ ] Úspěšně vytvořeno vlastní prostředí
- [ ] Nastavené a dostupné proměnné prostředí
- [ ] Aplikace nasazena s vlastní konfigurací
- [ ] Ověření vlastních nastavení v nasazené aplikaci

### Cvičení 3: Workflow více prostředí (25 minut)
**Cíl**: Zvládnout správu prostředí a strategie nasazení

```bash
# Vytvořte vývojové prostředí
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Poznamenejte si URL vývoje
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Vytvořte testovací prostředí
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Poznamenejte si URL testování
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Porovnejte prostředí
azd env list

# Otestujte obě prostředí
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Vyčistěte obě
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kritéria úspěchu:**
- [ ] Vytvořena dvě prostředí s různými konfiguracemi
- [ ] Obě prostředí úspěšně nasazena
- [ ] Možnost přepínání mezi prostředími pomocí `azd env select`
- [ ] Proměnné prostředí se liší mezi prostředími
- [ ] Úspěšně vyčištěna obě prostředí

## 📊 Váš pokrok

**Investovaný čas**: ~60-90 minut  
**Získané dovednosti**:
- ✅ Inicializace projektu na základě šablony
- ✅ Zajištění zdrojů na Azure
- ✅ Workflow nasazení aplikace
- ✅ Správa prostředí
- ✅ Správa konfigurace
- ✅ Čištění zdrojů a správa nákladů

**Další úroveň**: Jste připraveni na [Průvodce konfigurací](configuration.md), kde se naučíte pokročilé vzory konfigurace!

## Řešení běžných problémů

### Chyby autentizace
```bash
# Znovu se ověřte pomocí Azure
az login

# Ověřte přístup k předplatnému
az account show
```

### Selhání nasazení
```bash
# Povolit ladicí protokolování
export AZD_DEBUG=true
azd up --debug

# Zobrazit podrobné protokoly
azd logs --service api
azd logs --service web
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

Nyní, když jste dokončili svůj první projekt, prozkoumejte tyto pokročilé témata:

### 1. Přizpůsobení infrastruktury
- [Infrastructure as Code](../deployment/provisioning.md)
- [Přidání databází, úložišť a dalších služeb](../deployment/provisioning.md#adding-services)

### 2. Nastavení CI/CD
- [Integrace GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Nejlepší praktiky pro produkci
- [Bezpečnostní konfigurace](../deployment/best-practices.md#security)
- [Optimalizace výkonu](../deployment/best-practices.md#performance)
- [Monitorování a logování](../deployment/best-practices.md#monitoring)

### 4. Prozkoumání dalších šablon
```bash
# Procházet šablony podle kategorií
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Vyzkoušet různé technologické stacky
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Další zdroje

### Výukové materiály
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunita & Podpora
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Komunita Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablony & Příklady
- [Oficiální galerie šablon](https://azure.github.io/awesome-azd/)
- [Komunitní šablony](https://github.com/Azure-Samples/azd-templates)
- [Podnikové vzory](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulujeme k dokončení vašeho prvního projektu azd!** Nyní jste připraveni s jistotou vytvářet a nasazovat úžasné aplikace na Azure.

---

**Navigace kapitol:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy & Rychlý start
- **⬅️ Předchozí**: [Instalace & Nastavení](installation.md)
- **➡️ Další**: [Konfigurace](configuration.md)
- **🚀 Další kapitola**: [Kapitola 2: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)
- **Další lekce**: [Průvodce nasazením](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
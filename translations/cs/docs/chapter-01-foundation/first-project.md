# Váš první projekt - praktický návod

**Navigace kapitol:**
- **📚 Domů kurz**: [AZD For Beginners](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy & Rychlý start
- **⬅️ Předchozí**: [Installation & Setup](installation.md)
- **➡️ Další**: [Configuration](configuration.md)
- **🚀 Další kapitola**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Vítejte u svého prvního projektu s Azure Developer CLI! Tento komplexní praktický návod poskytuje úplný průvodce vytvořením, nasazením a správou full-stack aplikace na Azure pomocí azd. Budete pracovat s reálnou aplikací todo, která obsahuje React frontend, Node.js API backend a MongoDB databázi.

## Cíle učení

Po dokončení tohoto návodu budete:
- Zvládat workflow inicializace projektu azd pomocí šablon
- Rozumět struktuře projektu Azure Developer CLI a konfiguračním souborům
- Provést kompletní nasazení aplikace do Azure včetně provisioning infrastruktury
- Implementovat aktualizace aplikace a strategie opětovného nasazení
- Spravovat více prostředí pro vývoj a staging
- Aplikovat postupy pro úklid prostředků a řízení nákladů

## Výstupy učení

Po dokončení budete moci:
- Samostatně inicializovat a konfigurovat projekty azd ze šablon
- Efektivně procházet a upravovat struktury projektů azd
- Nasazovat full-stack aplikace do Azure jedním příkazem
- Řešit běžné problémy s nasazením a autentizací
- Spravovat více Azure prostředí pro různé fáze nasazení
- Implementovat kontinuální nasazení pro aktualizace aplikací

## Začínáme

### Kontrolní seznam předpokladů
- ✅ Azure Developer CLI nainstalováno ([Průvodce instalací](installation.md))
- ✅ Azure CLI nainstalováno a autentizováno
- ✅ Git nainstalován ve vašem systému
- ✅ Node.js 16+ (pro tento návod)
- ✅ Visual Studio Code (doporučeno)

### Ověřte své nastavení
```bash
# Zkontrolujte instalaci azd
azd version
```
### Ověřte autentizaci do Azure

```bash
az account show
```

### Zkontrolujte verzi Node.js
```bash
node --version
```

## Krok 1: Vyberte a inicializujte šablonu

Začněme populární šablonou todo aplikace, která obsahuje React frontend a Node.js API backend.

```bash
# Prohlédnout dostupné šablony
azd template list

# Inicializovat šablonu aplikace To-Do
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Postupujte podle pokynů:
# - Zadejte název prostředí: "dev"
# - Vyberte předplatné (pokud jich máte více)
# - Vyberte oblast: "East US 2" (nebo preferovanou oblast)
```

### Co se právě stalo?
- Šablona kódu byla stažena do vašeho lokálního adresáře
- Vytvořen soubor `azure.yaml` s definicemi služeb
- Nastaven kód infrastruktury v adresáři `infra/`
- Vytvořena konfigurace prostředí

## Krok 2: Prozkoumejte strukturu projektu

Pojďme zjistit, co nám azd vytvořil:

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

## Krok 3: Přizpůsobte svůj projekt (volitelné)

Před nasazením můžete aplikaci přizpůsobit:

### Upravit frontend
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

## Krok 4: Nasazení do Azure

Teď ta vzrušující část - nasadíme vše do Azure!

```bash
# Nasadit infrastrukturu a aplikaci
azd up

# Tento příkaz provede:
# 1. Vytvoří prostředky Azure (App Service, Cosmos DB atd.)
# 2. Sestaví vaši aplikaci
# 3. Nasadí na vytvořené prostředky
# 4. Zobrazí URL aplikace
```

### Co se děje během nasazení?

Příkaz `azd up` provede tyto kroky:
1. **Provision** (`azd provision`) - Vytvoří Azure prostředky
2. **Package** - Sestaví kód vaší aplikace
3. **Deploy** (`azd deploy`) - Nasadí kód do Azure prostředků

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

### Přístup k vaší aplikaci
Klikněte na URL uvedenou ve výstupu nasazení, nebo ji získejte kdykoli:
```bash
# Získat koncové body aplikace
azd show

# Otevřete aplikaci ve svém prohlížeči
azd show --output json | jq -r '.services.web.endpoint'
```

### Otestujte aplikaci Todo
1. **Přidejte todo položku** - Klikněte na "Add Todo" a zadejte úkol
2. **Označit jako dokončené** - Zaškrtněte dokončené položky
3. **Smazat položky** - Odstraňte todo položky, které již nepotřebujete

### Monitorování vaší aplikace
```bash
# Otevřete Azure portál pro vaše prostředky
azd monitor

# Zobrazit protokoly aplikace
azd monitor --logs

# Zobrazit metriky v reálném čase
azd monitor --live
```

## Krok 6: Proveďte změny a znovu nasazujte

Proveďme změnu a uvidíme, jak snadné je aktualizovat:

### Upravit API
```bash
# Upravte kód API
code src/api/src/routes/lists.js
```

Přidejte vlastní hlavičku odpovědi:
```javascript
// Najděte obslužnou funkci pro trasu a přidejte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nasadit jen změny kódu
```bash
# Nasadit pouze aplikační kód (vynechat infrastrukturu)
azd deploy

# To je mnohem rychlejší než 'azd up', protože infrastruktura už existuje
```

## Krok 7: Správa více prostředí

Vytvořte stagingové prostředí pro otestování změn před produkcí:

```bash
# Vytvořit nové stagingové prostředí
azd env new staging

# Nasadit do stagingového prostředí
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

# Zobrazit stagingové prostředí
azd env select staging
azd show
```

## Krok 8: Vyčištění prostředků

Až skončíte s experimentováním, vyčistěte prostředky, abyste se vyhnuli průběžným poplatkům:

```bash
# Smazat všechny zdroje Azure pro aktuální prostředí
azd down

# Vynutit smazání bez potvrzení a trvale odstranit soft-smazané zdroje
azd down --force --purge

# Smazat konkrétní prostředí
azd env select staging
azd down --force --purge
```

## Co jste se naučili

Gratulujeme! Úspěšně jste:
- ✅ Inicializovali projekt azd ze šablony
- ✅ Prozkoumali strukturu projektu a klíčové soubory
- ✅ Nasadili full-stack aplikaci do Azure
- ✅ Provedli změny v kódu a znovu nasadili
- ✅ Spravovali více prostředí
- ✅ Vyčistili prostředky

## 🎯 Cvičení pro ověření dovedností

### Cvičení 1: Nasadit jinou šablonu (15 minut)
**Cíl**: Prokázat zvládnutí azd init a workflow nasazení

```bash
# Vyzkoušet stack Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Ověřit nasazení
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Vyčistit
azd down --force --purge
```

**Kritéria úspěchu:**
- [ ] Aplikace se nasadí bez chyb
- [ ] Lze otevřít URL aplikace v prohlížeči
- [ ] Aplikace funguje správně (přidávání/odebírání todo položek)
- [ ] Úspěšně vyčištěny všechny prostředky

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

# Nasadit s vlastní konfigurací
azd up
```

**Kritéria úspěchu:**
- [ ] Vytvořeno vlastní prostředí úspěšně
- [ ] Proměnné prostředí nastaveny a dohledatelné
- [ ] Aplikace nasazena s vlastní konfigurací
- [ ] Lze ověřit vlastní nastavení v nasazené aplikaci

### Cvičení 3: Workflow s více prostředími (25 minut)
**Cíl**: Ovládnout správu prostředí a strategie nasazení

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

# Porovnat obě prostředí
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
- [ ] Obě prostředí úspěšně nasazena
- [ ] Lze přepínat mezi prostředími pomocí `azd env select`
- [ ] Proměnné prostředí se liší mezi prostředími
- [ ] Úspěšně vyčištěna obě prostředí

## 📊 Váš pokrok

**Věnovaný čas**: ~60-90 minut  
**Získané dovednosti**:
- ✅ Inicializace projektu založená na šabloně
- ✅ Provisioning Azure prostředků
- ✅ Workflow nasazení aplikací
- ✅ Správa prostředí
- ✅ Správa konfigurace
- ✅ Úklid prostředků a řízení nákladů

**Další krok**: Jste připraveni na [Configuration Guide](configuration.md) pro naučení pokročilých vzorů konfigurace!

## Řešení běžných problémů

### Chyby autentizace
```bash
# Znovu se přihlaste k Azure
az login

# Ověřte přístup k předplatnému
az account show
```

### Selhání nasazení
```bash
# Povolit ladicí logování
export AZD_DEBUG=true
azd up --debug

# Zobrazit protokoly aplikace v Azure
azd monitor --logs

# Pro Container Apps použijte Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikty názvů prostředků
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

### 1. Přizpůsobit infrastrukturu
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Přidat databáze, storage a další služby](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Nastavit CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Kompletní CI/CD workflowy
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfigurace pipeline

### 3. Osvědčené postupy pro produkci
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Bezpečnost, výkon a monitoring

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

### Výukové materiály
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunita a podpora
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablony a ukázky
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulujeme k dokončení vašeho prvního projektu s azd!** Nyní jste připraveni s důvěrou vytvářet a nasazovat úžasné aplikace na Azure.

---

**Navigace kapitol:**
- **📚 Domů kurz**: [AZD For Beginners](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy & Rychlý start
- **⬅️ Předchozí**: [Installation & Setup](installation.md)
- **➡️ Další**: [Configuration](configuration.md)
- **🚀 Další kapitola**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Další lekce**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Upozornění**:
Tento dokument byl přeložen pomocí AI překladatelské služby Co-op Translator (https://github.com/Azure/co-op-translator). Ačkoli usilujeme o přesnost, vezměte prosím na vědomí, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho originálním jazyce by měl být považován za autoritativní zdroj. Pro zásadní informace doporučujeme profesionální překlad provedený člověkem. Nejsme odpovědni za žádná nedorozumění nebo mylné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
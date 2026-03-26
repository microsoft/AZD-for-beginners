# Váš první projekt - Praktický tutoriál

**Navigace kapitolou:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy a rychlý start
- **⬅️ Předchozí**: [Instalace a nastavení](installation.md)
- **➡️ Další**: [Konfigurace](configuration.md)
- **🚀 Další kapitola**: [Kapitola 2: Vývoj zaměřený na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Vítejte u vašeho prvního projektu Azure Developer CLI! Tento komplexní praktický návod poskytuje úplný průvodce vytvořením, nasazením a správou full-stack aplikace na Azure pomocí azd. Budete pracovat s reálnou todo aplikací, která zahrnuje frontend v Reactu, backend API v Node.js a databázi MongoDB.

## Cíle učení

Po dokončení tohoto návodu budete:
- Ovládnout pracovní postup inicializace projektu azd pomocí šablon
- Porozumět struktuře projektu Azure Developer CLI a konfiguračním souborům
- Provest úplné nasazení aplikace do Azure včetně zajištění infrastruktury
- Implementovat aktualizace aplikace a strategie opětovného nasazení
- Spravovat více prostředí pro vývoj a staging
- Použít postupy pro úklid prostředků a řízení nákladů

## Výstupy učení

Po dokončení budete schopni:
- Inicializovat a konfigurovat projekty azd ze šablon samostatně
- Navigovat a upravovat struktury projektu azd efektivně
- Nasadit full-stack aplikace do Azure pomocí jediného příkazu
- Řešit běžné problémy s nasazením a autentizací
- Spravovat více Azure prostředí pro různé fáze nasazení
- Implementovat workflow pro kontinuální nasazování aktualizací aplikací

## Začínáme

### Kontrolní seznam požadavků
- ✅ Azure Developer CLI nainstalován ([Průvodce instalací](installation.md))
- ✅ Azure CLI nainstalován a přihlášen
- ✅ Git nainstalován na vašem počítači
- ✅ Node.js 16+ (pro tento návod)
- ✅ Visual Studio Code (doporučeno)

### Ověřte své nastavení
```bash
# Zkontrolujte instalaci azd
azd version
```
### Ověřte autentizaci Azure

```bash
az account show
```

### Zkontrolujte verzi Node.js
```bash
node --version
```

## Krok 1: Vyberte a inicializujte šablonu

Začněme populární šablonou todo aplikace, která obsahuje frontend v Reactu a backend API v Node.js.

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
- Stažen kód šablony do místního adresáře
- Vytvořen soubor `azure.yaml` s definicemi služeb
- Nastaven infrastrukturní kód v adresáři `infra/`
- Vytvořena konfigurace prostředí

## Krok 2: Prozkoumejte strukturu projektu

Pojďme se podívat, co pro nás azd vytvořil:

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

Před nasazením můžete aplikaci upravit:

### Upravte frontend
```bash
# Otevřete komponentu aplikace React
code src/web/src/App.tsx
```

Proveďte jednoduchou změnu:
```typescript
// Najděte nadpis a změňte ho.
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

A teď ta vzrušující část - nasadíme vše do Azure!

```bash
# Nasadit infrastrukturu a aplikaci
azd up

# Tento příkaz provede:
# 1. Zajistí prostředky Azure (App Service, Cosmos DB atd.)
# 2. Sestaví vaši aplikaci
# 3. Nasadí na připravené prostředky
# 4. Zobrazí URL aplikace
```

### Co se děje během nasazení?

Příkaz `azd up` provede tyto kroky:
1. **Zajištění** (`azd provision`) - Vytváří zdroje Azure
2. **Sbalení** - Sestaví kód vaší aplikace
3. **Nasazení** (`azd deploy`) - Nasadí kód do Azure zdrojů

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
# Získejte koncové body aplikace
azd show

# Otevřete aplikaci ve svém prohlížeči
azd show --output json | jq -r '.services.web.endpoint'
```

### Otestujte todo aplikaci
1. **Add a todo item** - Klikněte na "Add Todo" a zadejte úkol
2. **Mark as complete** - Zaškrtněte dokončené položky
3. **Delete items** - Odstraňte todos, které již nepotřebujete

### Monitorování vaší aplikace
```bash
# Otevřít Azure portál pro vaše zdroje
azd monitor

# Zobrazit protokoly aplikace
azd monitor --logs

# Zobrazit metriky v reálném čase
azd monitor --live
```

## Krok 6: Proveďte změny a opětovné nasazení

Proveďme změnu a uvidíme, jak snadné je aktualizovat:

### Upravte API
```bash
# Upravte kód API
code src/api/src/routes/lists.js
```

Přidejte vlastní hlavičku odpovědi:
```javascript
// Najděte obslužnou funkci trasy a přidejte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nasadit pouze změny v kódu
```bash
# Nasadit pouze aplikační kód (vynechat infrastrukturu)
azd deploy

# To je mnohem rychlejší než 'azd up', protože infrastruktura již existuje
```

## Krok 7: Správa více prostředí

Vytvořte staging prostředí pro otestování změn před produkcí:

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

# Zobrazit předprodukční prostředí
azd env select staging
azd show
```

## Krok 8: Vyčištění prostředků

Až skončíte s experimentováním, vyčistěte prostředky, abyste se vyhnuli průběžným poplatkům:

```bash
# Smazat všechny zdroje Azure pro aktuální prostředí
azd down

# Vynutit smazání bez potvrzení a úplně odstranit dočasně smazané zdroje
azd down --force --purge

# Smazat konkrétní prostředí
azd env select staging
azd down --force --purge
```

## Klasická aplikace vs. aplikace s AI: Stejný pracovní postup

Právě jste nasadili tradiční webovou aplikaci. Ale co kdybyste místo toho chtěli nasadit aplikaci s podporou AI — například chatovací aplikaci založenou na Microsoft Foundry Models?

Dobrá zpráva: **pracovní postup je totožný.**

| Krok | Klasická todo aplikace | AI chat aplikace |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Jediným rozdílem je **šablona**, ze které začnete. AI šablona zahrnuje další infrastrukturu (např. Microsoft Foundry Models resource nebo AI Search index), ale azd se o to vše postará za vás. Nemusíte se učit nové příkazy, přecházet na jiný nástroj ani měnit způsob, jak přemýšlíte o nasazení.

To je základní princip azd: **jeden pracovní postup, libovolné zatížení.** Dovednosti, které jste nacvičili v tomto návodu — inicializace, nasazení, monitoring, opětovné nasazení a úklid — platí stejně pro AI aplikace a agenty.

---

## Co jste se naučili

Gratulujeme! Úspěšně jste:
- ✅ Inicializovali azd projekt ze šablony
- ✅ Prozkoumali strukturu projektu a klíčové soubory
- ✅ Nasadili full-stack aplikaci do Azure
- ✅ Provedli změny v kódu a znovu nasadili
- ✅ Spravovali více prostředí
- ✅ Vyčistili prostředky

## 🎯 Cvičení pro ověření dovedností

### Cvičení 1: Nasadit jinou šablonu (15 minut)
**Cíl**: Prokázat zvládnutí azd init a pracovního postupu nasazení

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
- [ ] Lze přistoupit na URL aplikace v prohlížeči
- [ ] Aplikace funguje správně (přidávání/odstraňování todo položek)
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
- [ ] Vlastní prostředí úspěšně vytvořeno
- [ ] Proměnné prostředí nastaveny a dohledatelné
- [ ] Aplikace se nasadí s vlastním nastavením
- [ ] Lze ověřit vlastní nastavení v nasazené aplikaci

### Cvičení 3: Pracovní postup pro více prostředí (25 minut)
**Cíl**: Ovládnout správu prostředí a strategie nasazení

```bash
# Vytvořit vývojové prostředí
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Poznamenat URL vývojového prostředí
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Vytvořit stagingové prostředí
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Poznamenat URL stagingového prostředí
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
- [ ] Dvě prostředí vytvořena s odlišnou konfigurací
- [ ] Obě prostředí úspěšně nasazena
- [ ] Lze přepínat mezi prostředími pomocí `azd env select`
- [ ] Proměnné prostředí se liší mezi prostředími
- [ ] Obě prostředí úspěšně vyčištěna

## 📊 Váš pokrok

**Vložený čas**: ~60-90 minut  
**Získané dovednosti**:
- ✅ Inicializace projektu ze šablony
- ✅ Zajištění prostředků Azure
- ✅ Pracovní postupy nasazení aplikací
- ✅ Správa prostředí
- ✅ Správa konfigurace
- ✅ Úklid prostředků a řízení nákladů

**Další úroveň**: Jste připraveni na [Průvodce konfigurací](configuration.md) pro naučení pokročilých konfiguračních vzorů!

## Řešení běžných problémů

### Chyby autentizace
```bash
# Znovu se přihlásit do Azure
az login

# Ověřit přístup k předplatnému
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

Nyní, když jste dokončili první projekt, prozkoumejte tyto pokročilé témata:

### 1. Přizpůsobení infrastruktury
- [Infrastruktura jako kód](../chapter-04-infrastructure/provisioning.md)
- [Přidat databáze, úložiště a další služby](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Nastavení CI/CD
- [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md) - Kompletní CI/CD pracovní postupy
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfigurace pipeline

### 3. Doporučené postupy pro produkci
- [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md) - Bezpečnost, výkon a monitorování

### 4. Prozkoumejte více šablon
```bash
# Procházet šablony podle kategorie
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Vyzkoušejte různé sady technologií
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Další zdroje

### Studijní materiály
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrum architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunita & Podpora
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Komunita Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablony a ukázky
- [Oficiální galerie šablon](https://azure.github.io/awesome-azd/)
- [Komunitní šablony](https://github.com/Azure-Samples/azd-templates)
- [Podnikové vzory](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulujeme k dokončení vašeho prvního azd projektu!** Nyní jste připraveni s jistotou vytvářet a nasazovat úžasné aplikace v Azure.

---

**Navigace kapitolou:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy a rychlý start
- **⬅️ Předchozí**: [Instalace a nastavení](installation.md)
- **➡️ Další**: [Konfigurace](configuration.md)
- **🚀 Další kapitola**: [Kapitola 2: Vývoj zaměřený na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakákoliv nedorozumění nebo chybné výklady vzniklé v důsledku používání tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
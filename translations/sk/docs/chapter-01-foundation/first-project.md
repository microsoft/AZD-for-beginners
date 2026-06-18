# Váš prvý projekt - praktický tutoriál

**Navigácia kapitoly:**
- **📚 Domov kurzu**: [AZD For Beginners](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy & Rýchly štart
- **⬅️ Predchádzajúca**: [Installation & Setup](installation.md)
- **➡️ Ďalšia**: [Configuration](configuration.md)
- **🚀 Nasledujúca kapitola**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Vitajte pri svojom prvom projekte s Azure Developer CLI! Tento komplexný praktický návod poskytuje úplný prehľad vytvorenia, nasadenia a správy full-stack aplikácie na Azure pomocou azd. Budete pracovať s reálnou aplikáciou todo, ktorá obsahuje React frontend, Node.js API backend a databázu MongoDB.

## Ciele učenia

Po dokončení tohto tutoriálu budete:
- Ovládať pracovný postup inicializácie azd projektu pomocou šablón
- Pochopiť štruktúru projektu Azure Developer CLI a konfiguračné súbory
- Vykonať úplné nasadenie aplikácie do Azure vrátane provisioningu infraštruktúry
- Implementovať aktualizácie aplikácie a stratégie opätovného nasadenia
- Spravovať viacero prostredí pre vývoj a staging
- Použiť postupy pre čistenie zdrojov a riadenie nákladov

## Výsledky učenia

Po dokončení budete schopní:
- Samostatne inicializovať a konfigurovať azd projekty zo šablón
- Efektívne sa orientovať a upravovať štruktúru azd projektu
- Nasadzovať full-stack aplikácie do Azure jediným príkazom
- Riešiť bežné problémy s nasadením a otázky autentifikácie
- Spravovať viacero Azure prostredí pre rôzne fázy nasadenia
- Implementovať kontinuálne nasadzovanie pre aktualizácie aplikácie

## Začíname

### Kontrolný zoznam požiadaviek
- ✅ Azure Developer CLI nainštalovaný ([Príručka inštalácie](installation.md))
- ✅ Overenie AZD dokončené pomocou `azd auth login`
- ✅ Git nainštalovaný vo vašom systéme
- ✅ Node.js 16+ (pre tento tutoriál)
- ✅ Visual Studio Code (odporúčané)

Pred pokračovaním spustite validátor nastavenia z koreňa repozitára:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Overte svoje nastavenie
```bash
# Skontrolujte inštaláciu azd
azd version

# Skontrolujte autentifikáciu AZD
azd auth login --check-status
```

### Overenie voliteľného overenia Azure CLI

```bash
az account show
```

### Skontrolujte verziu Node.js
```bash
node --version
```

## Krok 1: Vyberte a inicializujte šablónu

Začnime s populárnou šablónou aplikácie todo, ktorá obsahuje React frontend a Node.js API backend.

```bash
# Prezrite si dostupné šablóny
azd template list

# Inicializujte šablónu aplikácie To-Do
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Postupujte podľa pokynov:
# - Zadajte názov prostredia: "dev"
# - Vyberte predplatné (ak máte viacero)
# - Vyberte región: "East US 2" (alebo váš preferovaný región)
```

### Čo sa práve stalo?
- Stiahol sa kód šablóny do lokálneho adresára
- Vytvoril sa súbor `azure.yaml` s definíciami služieb
- Nastavil sa kód infraštruktúry v adresári `infra/`
- Vytvorilo sa prostredie konfigurácie

## Krok 2: Preskúmajte štruktúru projektu

Pozrime sa, čo za nás azd vytvoril:

```bash
# Zobraziť štruktúru projektu
tree /f   # Windows
# alebo
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

**azure.yaml** - Srdce vášho azd projektu:
```bash
# Zobraziť konfiguráciu projektu
cat azure.yaml
```

**infra/main.bicep** - Definícia infraštruktúry:
```bash
# Zobraziť kód infraštruktúry
head -30 infra/main.bicep
```

## Krok 3: Prispôsobte svoj projekt (voliteľné)

Pred nasadením môžete aplikáciu prispôsobiť:

### Upraviť frontend
```bash
# Otvoriť komponent React aplikácie
code src/web/src/App.tsx
```

Urobte jednoduchú zmenu:
```typescript
// Nájdite názov a zmeňte ho
<h1>My Awesome Todo App</h1>
```

### Nakonfigurujte premenné prostredia
```bash
# Nastaviť vlastné premenné prostredia
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Zobraziť všetky premenné prostredia
azd env get-values
```

## Krok 4: Nasadiť do Azure

Teraz prichádza vzrušujúca časť - nasadiť všetko do Azure!

```bash
# Nasadiť infraštruktúru a aplikáciu
azd up

# Tento príkaz vykoná:
# 1. Zriadí prostriedky Azure (App Service, Cosmos DB, atď.)
# 2. Zostaví vašu aplikáciu
# 3. Nasadí ju na zriadené prostriedky
# 4. Zobrazí URL aplikácie
```

### Čo sa deje počas nasadzovania?

Príkaz `azd up` vykonáva tieto kroky:
1. **Provision** (`azd provision`) - Vytvorí Azure zdroje
2. **Package** - Zostaví váš aplikačný kód
3. **Deploy** (`azd deploy`) - Nasadí kód na Azure zdroje

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

### Prístup k vašej aplikácii
Kliknite na URL uvedenú vo výstupe nasadenia, alebo ju získajte kedykoľvek:
```bash
# Získajte koncové body aplikácie
azd show

# Otvorte aplikáciu vo vašom prehliadači
azd show --output json | jq -r '.services.web.endpoint'
```

### Otestujte aplikáciu Todo
1. **Pridať položku todo** - Kliknite na "Add Todo" a zadajte úlohu
2. **Označiť ako dokončené** - Zaškrtnite dokončené položky
3. **Odstrániť položky** - Odstráňte todos, ktoré už nepotrebujete

### Monitorujte svoju aplikáciu
```bash
# Otvoriť portál Azure pre vaše zdroje
azd monitor

# Zobraziť protokoly aplikácie
azd monitor --logs

# Zobraziť metriky v reálnom čase
azd monitor --live
```

### ✅ Overte svoje nasadenie

Pred pokračovaním prejdite rýchly kontrolný zoznam, aby ste potvrdili, že všetko skutočne funguje — nepredpokladajte, že "nasadenie prebehlo úspešne" automaticky znamená "aplikácia funguje":

```bash
# 1. Overte, či koncový bod existuje a je dosiahnuteľný
azd show

# 2. Urobte rýchly test koncového bodu (očakáva sa HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Skontrolujte koncový bod stavu, ak ho vaša aplikácia vystavuje
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Nasadenie je overené, keď:**
- ✅ `azd show` vypisuje dostupnú endpoint URL
- ✅ URL sa otvorí vo vašom prehliadači bez chýb
- ✅ Základné funkcie fungujú (pridať/označiť/odstrániť todo)
- ✅ `azd monitor --logs` zobrazuje prichádzajúce požiadavky bez neočakávaných chýb

Ak niektorá kontrola zlyhá, prejdite na [Kapitolu 7: Riešenie problémov](../chapter-07-troubleshooting/README.md).

## Krok 6: Urobte zmeny a znovu nasadzujte

Urobme zmenu a pozrime sa, aké jednoduché je aktualizovať:

### Upraviť API
```bash
# Upraviť kód API
code src/api/src/routes/lists.js
```

Pridajte vlastný hlavičkový parameter odpovede:
```javascript
// Nájdite spracovateľa trasy a pridajte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nasadiť len zmeny kódu
```bash
# Nasadiť iba kód aplikácie (preskočiť infraštruktúru)
azd deploy

# Toto je omnoho rýchlejšie než 'azd up', pretože infraštruktúra už existuje
```

## Krok 7: Spravujte viacero prostredí

Vytvorte staging prostredie na testovanie zmien pred produkciou:

```bash
# Vytvoriť nové stagingové prostredie
azd env new staging

# Nasadiť do stagingového prostredia
azd up

# Prepnúť späť na vývojové prostredie
azd env select dev

# Zobraziť všetky prostredia
azd env list
```

### Porovnanie prostredí
```bash
# Zobraziť vývojové prostredie
azd env select dev
azd show

# Zobraziť preprodukčné prostredie
azd env select staging
azd show
```

## Krok 8: Vyčistenie zdrojov

Keď ste skončili s experimentovaním, vyčistite zdroje, aby ste sa vyhli ďalším poplatkom:

```bash
# Odstrániť všetky Azure zdroje pre aktuálne prostredie
azd down

# Vynútene odstrániť bez potvrdenia a natrvalo vymazať dočasne odstránené zdroje
azd down --force --purge

# Odstrániť konkrétne prostredie
azd env select staging
azd down --force --purge
```

## Klasická aplikácia vs. AI-poháňaná aplikácia: rovnaký pracovný postup

Práve ste nasadili tradičnú webovú aplikáciu. Ale čo keď by ste chceli nasadiť AI-poháňanú aplikáciu — napríklad chat aplikáciu založenú na Microsoft Foundry Models?

Dobrá správa: **pracovný postup je identický.**

| Krok | Klasická aplikácia Todo | AI chat aplikácia |
|------|-------------------------|-------------------|
| Inicializovať | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Overiť | `azd auth login` | `azd auth login` |
| Nasadiť | `azd up` | `azd up` |
| Monitorovať | `azd monitor` | `azd monitor` |
| Vyčistiť | `azd down --force --purge` | `azd down --force --purge` |

Jediný rozdiel je **šablóna**, z ktorej začínate. AI šablóna zahŕňa dodatočnú infraštruktúru (napr. zdroj Microsoft Foundry Models alebo AI Search index), ale azd sa o to všetko postará za vás. Nemusíte sa učiť nové príkazy, osvojujete si iný nástroj ani meniť spôsob rozmýšľania o nasadení.

Toto je jadro princípu azd: **jeden pracovný postup, akékoľvek zaťaženie.** Zručnosti, ktoré ste si precvičili v tomto tutoriáli — inicializácia, nasadenie, monitorovanie, opätovné nasadenie a čistenie — platia rovnako pre AI aplikácie a agenty.

---

## Čo ste sa naučili

Gratulujeme! Úspešne ste:
- ✅ Inicializovali azd projekt zo šablóny
- ✅ Preskúmali štruktúru projektu a kľúčové súbory
- ✅ Nasadili full-stack aplikáciu do Azure
- ✅ Urobili zmeny v kóde a znovu ich nasadili
- ✅ Spravovali viacero prostredí
- ✅ Vyčistili zdroje

## 🎯 Cvičenia na overenie zručností

### Cvičenie 1: Nasadiť inú šablónu (15 minút)
**Cieľ**: Preukázať ovládanie azd init a pracovného postupu nasadenia

```bash
# Vyskúšať stack Python a MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Overiť nasadenie
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Vyčistiť
azd down --force --purge
```

**Kritériá úspechu:**
- [ ] Aplikácia sa nasadí bez chýb
- [ ] Je možné pristúpiť k URL aplikácie v prehliadači
- [ ] Aplikácia funguje správne (pridať/odstrániť todos)
- [ ] Všetky zdroje boli úspešne vyčistené

### Cvičenie 2: Prispôsobiť konfiguráciu (20 minút)
**Cieľ**: Precvičiť konfiguráciu premenných prostredia

```bash
cd my-first-azd-app

# Vytvoriť vlastné prostredie
azd env new custom-config

# Nastaviť vlastné premenné
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Overiť premenné
azd env get-values | grep APP_TITLE

# Nasadiť s vlastnou konfiguráciou
azd up
```

**Kritériá úspechu:**
- [ ] Vlastné prostredie bolo úspešne vytvorené
- [ ] Premenné prostredia nastavené a získateľné
- [ ] Aplikácia sa nasadí s vlastnou konfiguráciou
- [ ] Je možné overiť vlastné nastavenia v nasadenej aplikácii

### Cvičenie 3: Pracovný postup s viacerými prostrediami (25 minút)
**Cieľ**: Ovládnuť správu prostredí a stratégie nasadzovania

```bash
# Vytvoriť vývojové prostredie
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Poznamenať URL vývojového prostredia
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Vytvoriť stagingové prostredie
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Poznamenať URL stagingového prostredia
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Porovnať prostredia
azd env list

# Otestovať obe prostredia
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Vyčistiť obe prostredia
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kritériá úspechu:**
- [ ] Vytvorené dve prostredia s odlišnými konfiguráciami
- [ ] Obe prostredia nasadené úspešne
- [ ] Je možné prepínať medzi prostrediami pomocou `azd env select`
- [ ] Premenné prostredia sa líšia medzi prostrediami
- [ ] Obe prostredia boli úspešne vyčistené

## 📊 Váš pokrok

**Čas investovaný**: ~60-90 minút  
**Osvojené zručnosti**:
- ✅ Inicializácia projektu zo šablóny
- ✅ Provisioning Azure zdrojov
- ✅ Pracovné postupy nasadenia aplikácií
- ✅ Správa prostredí
- ✅ Riadenie konfigurácie
- ✅ Čistenie zdrojov a riadenie nákladov

**Ďalšia úroveň**: Ste pripravení na [Configuration Guide](configuration.md) na naučenie pokročilých konfiguračných vzorov!

## Riešenie bežných problémov

### Chyby overenia
```bash
# Znovu sa prihlásiť do Azure
az login

# Overiť prístup k predplatnému
az account show
```

### Neúspešné nasadenia
```bash
# Povoliť ladené logovanie
export AZD_DEBUG=true
azd up --debug

# Zobraziť protokoly aplikácie v Azure
azd monitor --logs

# Pre Container Apps použite Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikty názvov zdrojov
```bash
# Použite jedinečný názov prostredia
azd env new dev-$(whoami)-$(date +%s)
```

### Problémy s portami/sietou
```bash
# Skontrolovať, či sú porty dostupné
netstat -an | grep :3000
netstat -an | grep :3100
```

## Ďalšie kroky

Keď ste dokončili svoj prvý projekt, preskúmajte tieto pokročilé témy:

### 1. Prispôsobenie infraštruktúry
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Nastavenie CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Kompletné CI/CD pracovné postupy
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfigurácia pipeline

### 3. Najlepšie postupy pre produkciu
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Bezpečnosť, výkon a monitorovanie

### 4. Preskúmajte ďalšie šablóny
```bash
# Prezrite si šablóny podľa kategórie
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Vyskúšajte rôzne technologické sady
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Ďalšie zdroje

### Vzdelávacie materiály
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunita a podpora
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablóny a príklady
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulujeme k dokončeniu vášho prvého azd projektu!** Teraz ste pripravení s dôverou vytvárať a nasadzovať úžasné aplikácie na Azure.

---

**Navigácia kapitoly:**
- **📚 Domov kurzu**: [AZD For Beginners](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy & Rýchly štart
- **⬅️ Predchádzajúca**: [Installation & Setup](installation.md)
- **➡️ Ďalšia**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Nasledujúca kapitola**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
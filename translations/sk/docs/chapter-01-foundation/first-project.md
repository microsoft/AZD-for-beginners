# Váš prvý projekt - praktický návod

**Navigácia kapitoly:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy & Rýchly štart
- **⬅️ Predchádzajúca**: [Inštalácia a nastavenie](installation.md)
- **➡️ Ďalšia**: [Konfigurácia](configuration.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Vitajte pri vašom prvom projekte Azure Developer CLI! Tento komplexný praktický návod poskytuje úplný prehľad o vytváraní, nasadzovaní a správe full-stack aplikácie na Azure pomocou azd. Budete pracovať s reálnou todo aplikáciou, ktorá obsahuje React frontend, Node.js API backend a databázu MongoDB.

## Ciele učenia

Po dokončení tohto tutoriálu budete:
- Ovládať pracovný tok inicializácie projektu azd pomocou šablón
- Pochopiť štruktúru projektu Azure Developer CLI a konfiguračné súbory
- Vykonať kompletné nasadenie aplikácie na Azure s provisionovaním infraštruktúry
- Implementovať aktualizácie aplikácie a stratégie opätovného nasadenia
- Spravovať viacero prostredí pre vývoj a staging
- Aplikovať postupy upratovania zdrojov a riadenia nákladov

## Očakávané výsledky

Po dokončení budete schopní:
- Samostatne inicializovať a konfigurovať azd projekty zo šablón
- Efektívne sa orientovať a upravovať štruktúry azd projektov
- Nasadzovať full-stack aplikácie na Azure pomocou jedného príkazu
- Riešiť bežné problémy s nasadením a autentifikáciou
- Spravovať viacero Azure prostredí pre rôzne fázy nasadenia
- Implementovať pracovné postupy pre kontinuálne nasadzovanie aktualizácií aplikácií

## Začíname

### Kontrolný zoznam predpokladov
- ✅ Azure Developer CLI nainštalovaný ([Installation Guide](installation.md))
- ✅ Azure CLI nainštalovaný a autentifikovaný
- ✅ Git nainštalovaný vo vašom systéme
- ✅ Node.js 16+ (pre tento tutoriál)
- ✅ Visual Studio Code (odporúčané)

### Overte svoje nastavenie
```bash
# Skontrolujte inštaláciu azd
azd version
```
### Verify Azure authentication

```bash
az account show
```

### Skontrolujte verziu Node.js
```bash
node --version
```

## Krok 1: Vyberte a inicializujte šablónu

Začnime populárnou šablónou todo aplikácie, ktorá obsahuje React frontend a Node.js API backend.

```bash
# Prezrite si dostupné šablóny
azd template list

# Inicializujte šablónu todo aplikácie
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Postupujte podľa pokynov:
# - Zadajte názov prostredia: "dev"
# - Vyberte predplatné (ak máte viacero)
# - Vyberte región: "East US 2" (alebo váš preferovaný región)
```

### Čo sa práve stalo?
- Stiahol sa kód šablóny do vášho lokálneho adresára
- Vytvoril sa súbor `azure.yaml` s definíciami služieb
- Nastavil sa infra kód v adresári `infra/`
- Vytvorila sa konfigurácia prostredia

## Krok 2: Preskúmajte štruktúru projektu

Poďme preskúmať, čo pre nás azd vytvoril:

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

### Kľúčové súbory, ktoré treba pochopiť

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
# Otvorte komponent aplikácie React
code src/web/src/App.tsx
```

Urobte jednoduchú zmenu:
```typescript
// Nájdite nadpis a zmeňte ho
<h1>My Awesome Todo App</h1>
```

### Konfigurácia premenných prostredia
```bash
# Nastaviť vlastné premenné prostredia
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Zobraziť všetky premenné prostredia
azd env get-values
```

## Krok 4: Nasadiť na Azure

Teraz prichádza vzrušujúca časť - nasadiť všetko na Azure!

```bash
# Nasadiť infraštruktúru a aplikáciu
azd up

# Tento príkaz vykoná:
# 1. Vytvoriť Azure zdroje (App Service, Cosmos DB atď.)
# 2. Zostaviť vašu aplikáciu
# 3. Nasadiť do zriadených zdrojov
# 4. Zobraziť URL adresu aplikácie
```

### Čo sa deje počas nasadzovania?

Príkaz `azd up` vykonáva tieto kroky:
1. **Provision** (`azd provision`) - Vytvorí Azure zdroje
2. **Package** - Zostaví kód vašej aplikácie
3. **Deploy** (`azd deploy`) - Nasadí kód do Azure zdrojov

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
Kliknite na URL zobrazenú vo výstupe nasadenia, alebo ju získajte kedykoľvek:
```bash
# Získajte koncové body aplikácie
azd show

# Otvorte aplikáciu vo svojom prehliadači
azd show --output json | jq -r '.services.web.endpoint'
```

### Otestujte Todo aplikáciu
1. **Pridať položku todo** - Kliknite na „Add Todo“ a zadajte úlohu
2. **Označiť ako dokončené** - Zaškrtnite dokončené položky
3. **Zmazať položky** - Odstráňte todos, ktoré už nepotrebujete

### Monitorovanie aplikácie
```bash
# Otvorte portál Azure pre vaše zdroje
azd monitor

# Zobraziť protokoly aplikácie
azd monitor --logs

# Zobraziť metriky v reálnom čase
azd monitor --live
```

## Krok 6: Urobte zmeny a znovu nasadte

Urobme zmenu a uvidíme, ako ľahké je ju aktualizovať:

### Upraviť API
```bash
# Upravte kód API
code src/api/src/routes/lists.js
```

Pridať vlastnú hlavičku odpovede:
```javascript
// Nájdite spracovateľa trasy a pridajte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nasadiť len zmeny v kóde
```bash
# Nasadiť iba kód aplikácie (preskočiť infraštruktúru)
azd deploy

# Toto je oveľa rýchlejšie než 'azd up', pretože infraštruktúra už existuje
```

## Krok 7: Spravujte viacero prostredí

Vytvorte staging prostredie na otestovanie zmien pred produkciou:

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

# Zobraziť predprodukčné prostredie
azd env select staging
azd show
```

## Krok 8: Vyčistiť zdroje

Keď skončíte s experimentovaním, vyčistite zdroje, aby ste zabránili pretrvávajúcim poplatkom:

```bash
# Odstrániť všetky Azure zdroje pre aktuálne prostredie
azd down

# Vynútiť odstránenie bez potvrdenia a natrvalo odstrániť dočasne vymazané zdroje
azd down --force --purge

# Odstrániť konkrétne prostredie
azd env select staging
azd down --force --purge
```

## Klasická aplikácia vs. aplikácia poháňaná AI: rovnaký pracovný postup

Práve ste nasadili tradičnú webovú aplikáciu. Ale čo ak by ste chceli namiesto toho nasadiť aplikáciu poháňanú AI — napríklad chatovaciu aplikáciu s podporou Microsoft Foundry Models?

Dobrá správa: **pracovný postup je identický.**

| Krok | Klasická Todo aplikácia | AI chat aplikácia |
|------|-------------------------|-------------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Jediný rozdiel je v **šablóne**, z ktorej začínate. AI šablóna obsahuje dodatočnú infraštruktúru (napr. Microsoft Foundry Models resource alebo AI Search index), ale azd sa o to postará za vás. Nemusíte sa učiť nové príkazy, prechádzať na iný nástroj alebo meniť spôsob, akým uvažujete o nasadzovaní.

Toto je jadro princípu azd: **jeden pracovný postup, akékoľvek zaťaženie.** Zručnosti, ktoré ste si precvičili v tomto návode — inicializácia, nasadenie, monitorovanie, opätovné nasadenie a upratovanie — platia rovnako pre AI aplikácie a agenty.

---

## Čo ste sa naučili

Gratulujeme! Úspešne ste:
- ✅ Inicializovali azd projekt zo šablóny
- ✅ Preskúmali štruktúru projektu a kľúčové súbory
- ✅ Nasadili full-stack aplikáciu na Azure
- ✅ Urobili zmeny v kóde a znovu nasadili
- ✅ Spravovali viacero prostredí
- ✅ Vyčistili zdroje

## 🎯 Cvičenia na overenie zručností

### Cvičenie 1: Nasadiť inú šablónu (15 minút)
**Cieľ**: Preukázať zvládnutie azd init a pracovného postupu nasadzovania

```bash
# Vyskúšajte stack Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Overte nasadenie
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Vyčistite
azd down --force --purge
```

**Kritériá úspechu:**
- [ ] Aplikácia sa nasadí bez chýb
- [ ] Je možné pristúpiť na URL aplikácie v prehliadači
- [ ] Aplikácia funguje správne (pridať/odstrániť todos)
- [ ] Úspešne vyčistené všetky zdroje

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
- [ ] Vlastné prostredie úspešne vytvorené
- [ ] Premenné prostredia nastavené a dohľadateľné
- [ ] Aplikácia nasadená s vlastnou konfiguráciou
- [ ] Môžete overiť vlastné nastavenia v nasadenej aplikácii

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

# Vytvoriť predprodukčné prostredie
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Poznamenať URL predprodukčného prostredia
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
- [ ] Obe prostredia úspešne nasadené
- [ ] Možnosť prepínať medzi prostrediami pomocou `azd env select`
- [ ] Premenné prostredia sa líšia medzi prostrediami
- [ ] Úspešne vyčistené obe prostredia

## 📊 Váš pokrok

**Vložený čas**: ~60-90 minút  
**Získané zručnosti**:
- ✅ Inicializácia projektu na základe šablóny
- ✅ Provisionovanie Azure zdrojov
- ✅ Pracovné postupy nasadzovania aplikácií
- ✅ Správa prostredí
- ✅ Konfiguračné riadenie
- ✅ Upratovanie zdrojov a riadenie nákladov

**Ďalšia úroveň**: Ste pripravení na [Sprievodca konfiguráciou](configuration.md) na naučenie pokročilých konfiguračných vzorov!

## Riešenie bežných problémov

### Chyby overovania
```bash
# Znovu sa prihlásiť do Azure
az login

# Overiť prístup k predplatnému
az account show
```

### Zlyhania nasadenia
```bash
# Povoliť protokolovanie v režime ladenia
export AZD_DEBUG=true
azd up --debug

# Zobraziť protokoly aplikácie v Azure
azd monitor --logs

# Pre Container Apps použite Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikty mien zdrojov
```bash
# Použite jedinečný názov prostredia
azd env new dev-$(whoami)-$(date +%s)
```

### Problémy s portami/sieťou
```bash
# Skontrolujte, či sú porty dostupné
netstat -an | grep :3000
netstat -an | grep :3100
```

## Ďalšie kroky

Teraz, keď ste dokončili svoj prvý projekt, preskúmajte tieto pokročilé témy:

### 1. Prispôsobenie infraštruktúry
- [Infrastruktúra ako kód](../chapter-04-infrastructure/provisioning.md)
- [Pridanie databáz, úložísk a ďalších služieb](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Nastavenie CI/CD
- [Sprievodca nasadením](../chapter-04-infrastructure/deployment-guide.md) - Kompletné CI/CD pracovné postupy
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfigurácia pipeline

### 3. Najlepšie postupy pre produkciu
- [Sprievodca nasadením](../chapter-04-infrastructure/deployment-guide.md) - Bezpečnosť, výkon a monitorovanie

### 4. Preskúmajte viac šablón
```bash
# Prehliadajte šablóny podľa kategórie
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Vyskúšajte rôzne technologické zostavy
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Ďalšie zdroje

### Učebné materiály
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunita a podpora
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablóny a príklady
- [Oficiálna galéria šablón](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulujeme k dokončeniu vášho prvého azd projektu!** Teraz ste pripravení s istotou vytvárať a nasadzovať úžasné aplikácie na Azure.

---

**Navigácia kapitoly:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy & Rýchly štart
- **⬅️ Predchádzajúca**: [Inštalácia a nastavenie](installation.md)
- **➡️ Ďalšia**: [Konfigurácia](configuration.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Ďalšia lekcia**: [Sprievodca nasadením](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
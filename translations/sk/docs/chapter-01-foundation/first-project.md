# Váš prvý projekt - Praktický návod

**Navigácia medzi kapitolami:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Aktuálna kapitola**: Chapter 1 - Foundation & Quick Start
- **⬅️ Predchádzajúca**: [Inštalácia a nastavenie](installation.md)
- **➡️ Ďalšia**: [Konfigurácia](configuration.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Vitajte pri vašom prvom projekte s Azure Developer CLI! Tento komplexný praktický návod poskytuje úplný postup vytvorenia, nasadenia a správy full-stack aplikácie v Azure pomocou azd. Budete pracovať s reálnou todo aplikáciou, ktorá obsahuje React frontend, Node.js API backend a databázu MongoDB.

## Ciele učenia

Po dokončení tohto návodu budete:
- Ovládnuť pracovný postup inicializácie projektu azd pomocou šablón
- Pochopiť štruktúru projektu Azure Developer CLI a konfiguračné súbory
- Vykonať kompletné nasadenie aplikácie do Azure s provisioningom infraštruktúry
- Implementovať stratégie aktualizácií aplikácie a opätovného nasadenia
- Spravovať viacero prostredí pre vývoj a staging
- Aplikovať postupy čistenia zdrojov a riadenia nákladov

## Výsledky učenia

Po dokončení budete schopní:
- Samostatne inicializovať a konfigurovať projekty azd zo šablón
- Efektívne sa orientovať a upravovať štruktúru projektu azd
- Nasadiť full-stack aplikácie do Azure pomocou jediného príkazu
- Riešiť bežné problémy s nasadením a autentifikáciou
- Spravovať viacero Azure prostredí pre rôzne fázy nasadenia
- Implementovať pracovné toky kontinuálneho nasadenia pre aktualizácie aplikácie

## Začíname

### Kontrolný zoznam požiadaviek
- ✅ Azure Developer CLI nainštalovaný ([Sprievodca inštaláciou](installation.md))
- ✅ Azure CLI nainštalovaný a autentifikovaný
- ✅ Git nainštalovaný vo vašom systéme
- ✅ Node.js 16+ (pre tento návod)
- ✅ Visual Studio Code (odporúčané)

### Overte svoje nastavenie
```bash
# Skontrolujte inštaláciu azd
azd version
```
### Overte Azure autentifikáciu

```bash
az account show
```

### Skontrolujte verziu Node.js
```bash
node --version
```

## Krok 1: Vyberte a inicializujte šablónu

Začnime s populárnou šablónou todo aplikácie, ktorá obsahuje React frontend a Node.js API backend.

```bash
# Prehliadať dostupné šablóny
azd template list

# Inicializovať šablónu aplikácie todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Postupujte podľa pokynov:
# - Zadajte názov prostredia: "dev"
# - Vyberte predplatné (ak máte viacero)
# - Vyberte región: "East US 2" (alebo váš preferovaný región)
```

### Čo sa práve stalo?
- Stiahol sa kód šablóny do vášho lokálneho priečinka
- Vytvoril sa súbor `azure.yaml` s definíciami služieb
- Nastavil sa kód infraštruktúry v priečinku `infra/`
- Vytvorila sa konfigurácia prostredia

## Krok 2: Preskúmajte štruktúru projektu

Pozrime sa, čo nám azd vytvoril:

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

**azure.yaml** - Jadro vášho projektu azd:
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

### Upravte frontend
```bash
# Otvorte komponent aplikácie React
code src/web/src/App.tsx
```

Urobte jednoduchú zmenu:
```typescript
// Nájdite názov a zmeňte ho.
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

## Krok 4: Nasadiť do Azure

Teraz nasleduje vzrušujúca časť - nasadiť všetko do Azure!

```bash
# Nasadiť infraštruktúru a aplikáciu
azd up

# Tento príkaz vykoná:
# 1. Zriadi prostriedky Azure (App Service, Cosmos DB, atď.)
# 2. Zostaví vašu aplikáciu
# 3. Nasadí na zriadené prostriedky
# 4. Zobrazí URL adresu aplikácie
```

### Čo sa deje počas nasadenia?

Príkaz `azd up` vykonáva tieto kroky:
1. **Provision** (`azd provision`) - Vytvorí Azure zdroje
2. **Package** - Zostaví váš aplikačný kód
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
Kliknite na URL uvedenú vo výstupe nasadenia, alebo ju získate kedykoľvek:
```bash
# Získajte koncové body aplikácie
azd show

# Otvorte aplikáciu vo vašom prehliadači
azd show --output json | jq -r '.services.web.endpoint'
```

### Otestujte Todo aplikáciu
1. **Pridať položku todo** - Kliknite na "Add Todo" a zadajte úlohu
2. **Označiť ako dokončené** - Začiarknite dokončené položky
3. **Vymazať položky** - Odstráňte todos, ktoré už nepotrebujete

### Monitorovanie vašej aplikácie
```bash
# Otvoriť portál Azure pre vaše zdroje
azd monitor

# Zobraziť protokoly aplikácie
azd monitor --logs

# Zobraziť metriky v reálnom čase
azd monitor --live
```

## Krok 6: Urobte zmeny a znovu nasaďte

Urobme zmenu a pozrime sa, aké jednoduché je aktualizovať:

### Upravte API
```bash
# Upravte kód API
code src/api/src/routes/lists.js
```

Pridajte vlastnú hlavičku odpovede:
```javascript
// Nájdite spracovateľa trasy a pridajte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nasadiť iba zmeny v kóde
```bash
# Nasadiť iba aplikačný kód (preskočiť infraštruktúru)
azd deploy

# Toto je oveľa rýchlejšie ako 'azd up', pretože infraštruktúra už existuje
```

## Krok 7: Spravujte viaceré prostredia

Vytvorte stagingové prostredie na testovanie zmien pred produkciou:

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

## Krok 8: Vyčistenie zdrojov

Keď skončíte s experimentovaním, odstráňte zdroje, aby ste predišli priebežným poplatkom:

```bash
# Odstrániť všetky Azure zdroje pre aktuálne prostredie
azd down

# Vynútiť odstránenie bez potvrdenia a trvalo odstrániť dočasne zmazané zdroje
azd down --force --purge

# Odstrániť konkrétne prostredie
azd env select staging
azd down --force --purge
```

## Čo ste sa naučili

Gratulujeme! Úspešne ste:
- ✅ Inicializovali projekt azd zo šablóny
- ✅ Preskúmali štruktúru projektu a kľúčové súbory
- ✅ Nasadili full-stack aplikáciu do Azure
- ✅ Urobili zmeny v kóde a znovu nasadili
- ✅ Spravovali viacero prostredí
- ✅ Vyčistili zdroje

## 🎯 Cvičenia na overenie zručností

### Cvičenie 1: Nasadiť inú šablónu (15 minút)
**Cieľ**: Preukázať ovládanie príkazu azd init a pracovného postupu nasadenia

```bash
# Vyskúšať stack Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Overiť nasadenie
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Upratať
azd down --force --purge
```

**Kritériá úspechu:**
- [ ] Aplikácia sa nasadí bez chýb
- [ ] Je možné otvoriť URL aplikácie v prehliadači
- [ ] Aplikácia funguje správne (pridávanie/odstraňovanie todo položiek)
- [ ] Všetky zdroje boli úspešne odstránené

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
- [ ] Premenné prostredia nastavené a dostupné
- [ ] Aplikácia nasadená s vlastnou konfiguráciou
- [ ] Dokážete overiť vlastné nastavenia v nasadenej aplikácii

### Cvičenie 3: Pracovný postup s viacerými prostrediami (25 minút)
**Cieľ**: Ovládnuť správu prostredí a stratégie nasadenia

```bash
# Vytvoriť vývojové prostredie
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Poznačiť vývojové URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Vytvoriť predprodukčné prostredie
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Poznačiť predprodukčné URL
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
- [ ] Vytvorené dve prostredia s rôznymi konfiguráciami
- [ ] Obe prostredia boli úspešne nasadené
- [ ] Dokážete prepínať medzi prostrediami pomocou `azd env select`
- [ ] Premenné prostredia sa líšia medzi prostrediami
- [ ] Obe prostredia boli úspešne odstránené

## 📊 Váš pokrok

**Časová investícia**: ~60-90 minút  
**Získané zručnosti**:
- ✅ Inicializácia projektu zo šablóny
- ✅ Provisioning Azure zdrojov
- ✅ Pracovné toky nasadenia aplikácií
- ✅ Správa prostredí
- ✅ Konfiguračné riadenie
- ✅ Vyčistenie zdrojov a riadenie nákladov

**Ďalšia úroveň**: Ste pripravení na [Sprievodcu konfiguráciou](configuration.md) na naučenie pokročilých vzorov konfigurácie!

## Riešenie bežných problémov

### Chyby overenia
```bash
# Znovu sa autentifikovať v Azure
az login

# Overiť prístup k predplatnému
az account show
```

### Zlyhania nasadenia
```bash
# Povoliť ladené protokolovanie
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

Teraz, keď ste dokončili váš prvý projekt, preskúmajte tieto pokročilé témy:

### 1. Prispôsobiť infraštruktúru
- [Infrastruktúra ako kód](../chapter-04-infrastructure/provisioning.md)
- [Pridajte databázy, úložisko a ďalšie služby](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Nastaviť CI/CD
- [Sprievodca nasadením](../chapter-04-infrastructure/deployment-guide.md) - Kompletné pracovné toky CI/CD
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfigurácia pipeline

### 3. Najlepšie postupy pre produkciu
- [Sprievodca nasadením](../chapter-04-infrastructure/deployment-guide.md) - Bezpečnosť, výkon a monitorovanie

### 4. Preskúmajte viac šablón
```bash
# Prehliadať šablóny podľa kategórie
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
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrum architektúry Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Rámec Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunita a podpora
- [Azure Developer CLI na GitHub](https://github.com/Azure/azure-dev)
- [Komunita Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablóny a príklady
- [Oficiálna galéria šablón](https://azure.github.io/awesome-azd/)
- [Komunitné šablóny](https://github.com/Azure-Samples/azd-templates)
- [Vzory pre podniky](https://github.com/Azure/azure-dev/tree/main/templates)

---

Gratulujeme k dokončeniu vášho prvého projektu azd! Teraz ste pripravení s dôverou vytvárať a nasadzovať úžasné aplikácie v Azure.

---

**Navigácia medzi kapitolami:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Aktuálna kapitola**: Chapter 1 - Foundation & Quick Start
- **⬅️ Predchádzajúca**: [Inštalácia a nastavenie](installation.md)
- **➡️ Ďalšia**: [Konfigurácia](configuration.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Ďalšia lekcia**: [Sprievodca nasadením](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vylúčenie zodpovednosti:
Tento dokument bol preložený pomocou prekladateľskej služby využívajúcej umelú inteligenciu [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, berte prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by sa mal považovať za autoritatívny zdroj. Pre kritické informácie odporúčame profesionálny preklad vykonaný človekom. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne výklady vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
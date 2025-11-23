<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-23T11:57:42+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "sk"
}
-->
# Váš prvý projekt - Praktický tutoriál

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a rýchly štart
- **⬅️ Predchádzajúce**: [Inštalácia a nastavenie](installation.md)
- **➡️ Ďalšie**: [Konfigurácia](configuration.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)

## Úvod

Vitajte pri vašom prvom projekte s Azure Developer CLI! Tento komplexný praktický tutoriál vás prevedie celým procesom vytvárania, nasadzovania a správy full-stack aplikácie na Azure pomocou azd. Budete pracovať s reálnou aplikáciou na správu úloh, ktorá zahŕňa React frontend, Node.js API backend a databázu MongoDB.

## Ciele učenia

Po dokončení tohto tutoriálu budete:
- Ovládať inicializačný proces projektu azd pomocou šablón
- Rozumieť štruktúre projektov Azure Developer CLI a konfiguračným súborom
- Vykonávať kompletné nasadenie aplikácie na Azure vrátane provisioningu infraštruktúry
- Implementovať aktualizácie aplikácie a stratégie opätovného nasadenia
- Spravovať viacero prostredí pre vývoj a testovanie
- Aplikovať postupy na čistenie zdrojov a správu nákladov

## Výsledky učenia

Po dokončení budete schopní:
- Samostatne inicializovať a konfigurovať projekty azd zo šablón
- Efektívne sa orientovať v štruktúre projektov azd a upravovať ich
- Nasadzovať full-stack aplikácie na Azure pomocou jednoduchých príkazov
- Riešiť bežné problémy s nasadzovaním a autentifikáciou
- Spravovať viacero prostredí Azure pre rôzne fázy nasadzovania
- Implementovať kontinuálne nasadzovanie pre aktualizácie aplikácií

## Začíname

### Kontrolný zoznam predpokladov
- ✅ Nainštalovaný Azure Developer CLI ([Sprievodca inštaláciou](installation.md))
- ✅ Nainštalovaný a autentifikovaný Azure CLI
- ✅ Nainštalovaný Git na vašom systéme
- ✅ Node.js 16+ (pre tento tutoriál)
- ✅ Visual Studio Code (odporúčané)

### Overenie nastavenia
```bash
# Skontrolujte inštaláciu azd
azd version
```
### Overenie autentifikácie Azure

```bash
az account show
```

### Kontrola verzie Node.js
```bash
node --version
```

## Krok 1: Výber a inicializácia šablóny

Začnime s populárnou šablónou aplikácie na správu úloh, ktorá zahŕňa React frontend a Node.js API backend.

```bash
# Prezrite si dostupné šablóny
azd template list

# Inicializujte šablónu aplikácie úloh
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Postupujte podľa pokynov:
# - Zadajte názov prostredia: "dev"
# - Vyberte predplatné (ak máte viacero)
# - Vyberte región: "East US 2" (alebo váš preferovaný región)
```

### Čo sa práve stalo?
- Stiahli ste kód šablóny do lokálneho adresára
- Vytvoril sa súbor `azure.yaml` s definíciami služieb
- Nastavil sa kód infraštruktúry v adresári `infra/`
- Vytvorila sa konfigurácia prostredia

## Krok 2: Preskúmanie štruktúry projektu

Pozrime sa, čo pre nás azd vytvoril:

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

**azure.yaml** - Srdce vášho projektu azd:
```bash
# Zobraziť konfiguráciu projektu
cat azure.yaml
```

**infra/main.bicep** - Definícia infraštruktúry:
```bash
# Zobraziť kód infraštruktúry
head -30 infra/main.bicep
```

## Krok 3: Prispôsobenie projektu (voliteľné)

Pred nasadením môžete aplikáciu prispôsobiť:

### Úprava frontendu
```bash
# Otvorte komponent React aplikácie
code src/web/src/App.tsx
```

Urobte jednoduchú zmenu:
```typescript
// Nájdite názov a zmeňte ho
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

## Krok 4: Nasadenie na Azure

Teraz prichádza vzrušujúca časť - nasadenie všetkého na Azure!

```bash
# Nasadiť infraštruktúru a aplikáciu
azd up

# Tento príkaz vykoná:
# 1. Zabezpečí Azure zdroje (App Service, Cosmos DB, atď.)
# 2. Vytvorí vašu aplikáciu
# 3. Nasadí na zabezpečené zdroje
# 4. Zobrazí URL aplikácie
```

### Čo sa deje počas nasadzovania?

Príkaz `azd up` vykonáva tieto kroky:
1. **Provision** (`azd provision`) - Vytvára zdroje na Azure
2. **Package** - Zostavuje kód vašej aplikácie
3. **Deploy** (`azd deploy`) - Nasadzuje kód na zdroje Azure

### Očakávaný výstup
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Krok 5: Testovanie aplikácie

### Prístup k vašej aplikácii
Kliknite na URL uvedenú vo výstupe nasadzovania alebo ju získajte kedykoľvek:
```bash
# Získajte koncové body aplikácie
azd show

# Otvorte aplikáciu vo svojom prehliadači
azd show --output json | jq -r '.services.web.endpoint'
```

### Testovanie aplikácie na správu úloh
1. **Pridajte úlohu** - Kliknite na "Add Todo" a zadajte úlohu
2. **Označte ako dokončené** - Zaškrtnite dokončené položky
3. **Odstráňte položky** - Odstráňte úlohy, ktoré už nepotrebujete

### Monitorovanie aplikácie
```bash
# Otvorte portál Azure pre vaše zdroje
azd monitor

# Zobraziť denníky aplikácie
azd logs
```

## Krok 6: Urobte zmeny a opätovne nasadzujte

Urobme zmenu a pozrime sa, aké jednoduché je aktualizovať:

### Úprava API
```bash
# Upraviť kód API
code src/api/src/routes/lists.js
```

Pridajte vlastnú hlavičku odpovede:
```javascript
// Nájdite obslužnú funkciu trasy a pridajte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nasadenie iba zmien v kóde
```bash
# Nasadiť iba aplikačný kód (preskočiť infraštruktúru)
azd deploy

# Toto je oveľa rýchlejšie ako 'azd up', pretože infraštruktúra už existuje
```

## Krok 7: Správa viacerých prostredí

Vytvorte testovacie prostredie na overenie zmien pred produkciou:

```bash
# Vytvorte nové testovacie prostredie
azd env new staging

# Nasadiť do testovacieho prostredia
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

# Zobraziť testovacie prostredie
azd env select staging
azd show
```

## Krok 8: Vyčistenie zdrojov

Keď skončíte s experimentovaním, vyčistite zdroje, aby ste sa vyhli ďalším poplatkom:

```bash
# Odstrániť všetky Azure zdroje pre aktuálne prostredie
azd down

# Nútené odstránenie bez potvrdenia a vymazanie mäkko odstránených zdrojov
azd down --force --purge

# Odstrániť konkrétne prostredie
azd env select staging
azd down --force --purge
```

## Čo ste sa naučili

Gratulujeme! Úspešne ste:
- ✅ Inicializovali projekt azd zo šablóny
- ✅ Preskúmali štruktúru projektu a kľúčové súbory
- ✅ Nasadili full-stack aplikáciu na Azure
- ✅ Urobili zmeny v kóde a opätovne nasadili
- ✅ Spravovali viacero prostredí
- ✅ Vyčistili zdroje

## 🎯 Cvičenia na overenie zručností

### Cvičenie 1: Nasadenie inej šablóny (15 minút)
**Cieľ**: Preukázať zvládnutie inicializácie a nasadzovania projektu azd

```bash
# Vyskúšajte Python + MongoDB stack
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
- [ ] Prístup k URL aplikácie v prehliadači
- [ ] Aplikácia funguje správne (pridávanie/odstraňovanie úloh)
- [ ] Úspešne vyčistené všetky zdroje

### Cvičenie 2: Prispôsobenie konfigurácie (20 minút)
**Cieľ**: Precvičiť konfiguráciu premenných prostredia

```bash
cd my-first-azd-app

# Vytvorte vlastné prostredie
azd env new custom-config

# Nastavte vlastné premenné
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Overte premenné
azd env get-values | grep APP_TITLE

# Nasadzujte s vlastnou konfiguráciou
azd up
```

**Kritériá úspechu:**
- [ ] Úspešne vytvorené vlastné prostredie
- [ ] Premenné prostredia nastavené a dostupné
- [ ] Aplikácia nasadená s vlastnou konfiguráciou
- [ ] Overenie vlastných nastavení v nasadenej aplikácii

### Cvičenie 3: Workflow s viacerými prostrediami (25 minút)
**Cieľ**: Ovládnuť správu prostredí a stratégie nasadzovania

```bash
# Vytvorte vývojové prostredie
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Poznámka k URL vývojového prostredia
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Vytvorte testovacie prostredie
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Poznámka k URL testovacieho prostredia
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Porovnajte prostredia
azd env list

# Otestujte obe prostredia
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Vyčistite obe
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kritériá úspechu:**
- [ ] Vytvorené dve prostredia s rôznymi konfiguráciami
- [ ] Obe prostredia úspešne nasadené
- [ ] Prepínanie medzi prostrediami pomocou `azd env select`
- [ ] Premenné prostredia sa líšia medzi prostrediami
- [ ] Úspešne vyčistené obe prostredia

## 📊 Váš pokrok

**Investovaný čas**: ~60-90 minút  
**Získané zručnosti**:
- ✅ Inicializácia projektu na základe šablóny
- ✅ Provisioning zdrojov Azure
- ✅ Workflow nasadzovania aplikácií
- ✅ Správa prostredí
- ✅ Správa konfigurácie
- ✅ Vyčistenie zdrojov a správa nákladov

**Ďalšia úroveň**: Ste pripravení na [Sprievodcu konfiguráciou](configuration.md), kde sa naučíte pokročilé vzory konfigurácie!

## Riešenie bežných problémov

### Chyby autentifikácie
```bash
# Znova sa autentifikujte s Azure
az login

# Overte prístup k predplatnému
az account show
```

### Zlyhania nasadzovania
```bash
# Povoliť ladenie protokolovania
export AZD_DEBUG=true
azd up --debug

# Zobraziť podrobné protokoly
azd logs --service api
azd logs --service web
```

### Konflikty názvov zdrojov
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
- [Infraštruktúra ako kód](../deployment/provisioning.md)
- [Pridanie databáz, úložísk a ďalších služieb](../deployment/provisioning.md#adding-services)

### 2. Nastavenie CI/CD
- [Integrácia s GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Najlepšie praktiky pre produkciu
- [Bezpečnostné konfigurácie](../deployment/best-practices.md#security)
- [Optimalizácia výkonu](../deployment/best-practices.md#performance)
- [Monitorovanie a logovanie](../deployment/best-practices.md#monitoring)

### 4. Preskúmajte ďalšie šablóny
```bash
# Prehliadajte šablóny podľa kategórie
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Vyskúšajte rôzne technologické balíky
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Dodatočné zdroje

### Študijné materiály
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunita a podpora
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Komunita Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablóny a príklady
- [Oficiálna galéria šablón](https://azure.github.io/awesome-azd/)
- [Komunitné šablóny](https://github.com/Azure-Samples/azd-templates)
- [Podnikové vzory](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulujeme k dokončeniu vášho prvého projektu azd!** Teraz ste pripravení s istotou vytvárať a nasadzovať úžasné aplikácie na Azure.

---

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a rýchly štart
- **⬅️ Predchádzajúce**: [Inštalácia a nastavenie](installation.md)
- **➡️ Ďalšie**: [Konfigurácia](configuration.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)
- **Ďalšia lekcia**: [Sprievodca nasadzovaním](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Váš prvý projekt – praktický návod

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 – Základy a rýchly štart
- **⬅️ Predchádzajúca**: [Inštalácia a nastavenie](installation.md)
- **➡️ Ďalšia**: [Konfigurácia](configuration.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: Vývoj s dôrazom na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Vitajte vo vašom prvom projekte Azure Developer CLI! Tento komplexný praktický návod poskytuje úplný prehľad tvorby, nasadenia a správy full-stack aplikácie na Azure pomocou azd. Budete pracovať s reálnou todo aplikáciou, ktorá obsahuje React frontend, Node.js API backend a MongoDB databázu.

## Ciele učenia

Po dokončení tohto návodu:
- Ovládnete workflow inicializácie projektu azd pomocou šablón
- Pochopíte štruktúru projektu Azure Developer CLI a konfiguračné súbory
- Dokážete nasadiť kompletnú aplikáciu na Azure spolu s infraštruktúrou
- Zvládnete aktualizácie aplikácie a stratégie opätovného nasadenia
- Spravujete viaceré prostredia pre vývoj a testovanie
- Použijete postupy na čistenie zdrojov a správu nákladov

## Výstupy učenia

Po dokončení budete schopní:
- Samostatne inicializovať a konfigurovať projekty azd zo šablón
- Efektívne sa pohybovať a upravovať štruktúru projektu azd
- Nasadzovať full-stack aplikácie na Azure jedným príkazom
- Riešiť bežné problémy s nasadením a autentifikáciou
- Spravovať viaceré Azure prostredia pre rôzne fázy deploymentu
- Implementovať kontinuálne workflow nasadenia pre aktualizácie aplikácie

## Začíname

### Kontrolný zoznam predpokladov
- ✅ Nainštalovaný Azure Developer CLI ([Sprievodca inštaláciou](installation.md))
- ✅ Dokončená autentifikácia AZD pomocou `azd auth login`
- ✅ Git nainštalovaný vo vašom systéme
- ✅ Node.js 16+ (pre tento návod)
- ✅ Visual Studio Code (odporúčaný)

Pred pokračovaním spustite validátor nastavení z koreňového adresára repozitára:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Overte svoje nastavenie
```bash
# Skontrolujte inštaláciu azd
azd version

# Skontrolujte overenie AZD
azd auth login --check-status
```

### Overenie voliteľnej autentifikácie Azure CLI

```bash
az account show
```

### Skontrolujte verziu Node.js
```bash
node --version
```

## Krok 1: Vyberte a inicializujte šablónu

Začneme populárnou šablónou todo aplikácie, ktorá obsahuje React frontend a Node.js API backend.

```bash
# Prehliadať dostupné šablóny
azd template list

# Inicializovať šablónu aplikácie úloh
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Postupujte podľa pokynov:
# - Zadajte názov prostredia: "dev"
# - Vyberte predplatné (ak máte viacero)
# - Vyberte región: "East US 2" (alebo preferovaný región)
```

### Čo sa práve stalo?
- Stiahol sa kód šablóny do vášho lokálneho adresára
- Vytvoril sa súbor `azure.yaml` s definíciami služieb
- Vytvoril sa infraštrukturálny kód v priečinku `infra/`
- Vytvorila sa konfigurácia prostredia

## Krok 2: Preskúmajte štruktúru projektu

Pozrime sa, čo azd vytvoril pre nás:

```bash
# Pozri si štruktúru projektu
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

**azure.yaml** – Srdce vášho azd projektu:
```bash
# Zobraziť konfiguráciu projektu
cat azure.yaml
```

**infra/main.bicep** – Definícia infraštruktúry:
```bash
# Zobraziť kód infraštruktúry
head -30 infra/main.bicep
```

## Krok 3: Prispôsobte projekt (voliteľné)

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

Teraz prichádza zaujímavá časť – nasadíme všetko na Azure!

```bash
# Nasadiť infraštruktúru a aplikáciu
azd up

# Tento príkaz vykoná:
# 1. Zabezpečí zdroje Azure (App Service, Cosmos DB, atď.)
# 2. Zostaví vašu aplikáciu
# 3. Nasadí na zabezpečené zdroje
# 4. Zobrazí URL aplikácie
```

### Čo sa deje počas nasadzovania?

Príkaz `azd up` vykoná tieto kroky:
1. **Provision** (`azd provision`) – vytvorí Azure zdroje
2. **Package** – zostaví váš aplikačný kód
3. **Deploy** (`azd deploy`) – nasadí kód na Azure zdroje

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
Kliknite na URL z výstupu nasadenia, alebo si ju získajte kedykoľvek:
```bash
# Získajte koncové body aplikácie
azd show

# Otvorte aplikáciu vo svojom prehliadači
azd show --output json | jq -r '.services.web.endpoint'
```

### Testovanie todo aplikácie
1. **Pridajte úlohu** – kliknite na „Add Todo“ a zadajte úlohu
2. **Označte ako dokončené** – zaškrtnite dokončené položky
3. **Vymažte úlohy** – odstráňte nepotrebné todo položky

### Monitorovanie aplikácie
```bash
# Otvorte portál Azure pre vaše zdroje
azd monitor

# Zobraziť denníky aplikácií
azd monitor --logs

# Zobraziť živé metriky
azd monitor --live
```

## Krok 6: Urobte zmeny a opätovne nasadte

Urobme zmenu a uvidíme, aké jednoduché je aktualizovať:

### Úprava API
```bash
# Upraviť API kód
code src/api/src/routes/lists.js
```

Pridajte vlastný hlavičkový parameter odpovede:
```javascript
// Nájdite spracovateľa trasy a pridajte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Nasadenie len zmeneného kódu
```bash
# Nasadiť iba kód aplikácie (preskočiť infraštruktúru)
azd deploy

# Toto je oveľa rýchlejšie ako 'azd up', pretože infraštruktúra už existuje
```

## Krok 7: Správa viacerých prostredí

Vytvorte testovacie prostredie na overenie zmien pred produkciou:

```bash
# Vytvoriť nové testovacie prostredie
azd env new staging

# Nasadiť do testovacieho prostredia
azd up

# Prepnúť späť do vývojového prostredia
azd env select dev

# Zoznam všetkých prostredí
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

Keď skončíte s experimentovaním, vyčistite zdroje, aby ste predišli ďalším poplatkom:

```bash
# Odstráňte všetky zdroje Azure pre aktuálne prostredie
azd down

# Vynútiť odstránenie bez potvrdenia a vyčistiť mäkko odstránené zdroje
azd down --force --purge

# Odstrániť konkrétne prostredie
azd env select staging
azd down --force --purge
```

## Klasická aplikácia verzus AI aplikácia: rovnaký workflow

Práve ste nasadili klasickú webovú aplikáciu. Čo ak by ste chceli nasadiť AI aplikáciu – napríklad chat s Microsoft Foundry Models?

Dobrá správa: **workflow je rovnaký.**

| Krok | Klasická todo aplikácia | AI chat aplikácia |
|------|------------------------|-------------------|
| Inicializácia | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentifikácia | `azd auth login` | `azd auth login` |
| Nasadenie | `azd up` | `azd up` |
| Monitorovanie | `azd monitor` | `azd monitor` |
| Vyčistenie | `azd down --force --purge` | `azd down --force --purge` |

Jediný rozdiel je v **šablóne**, od ktorej začínate. AI šablóna obsahuje ďalšiu infraštruktúru (napríklad Microsoft Foundry Models alebo AI Search index), ale azd to všetko spravuje za vás. Nemusíte sa učiť nové príkazy, používať iné nástroje ani meniť spôsob myslenia o nasadení.

To je základný princíp azd: **jeden workflow, akákoľvek záťaž.** Zručnosti, ktoré ste si osvojili v tomto návode – inicializácia, nasadenie, monitorovanie, opätovné nasadenie a čistenie – platia rovnako pre AI aplikácie aj agentov.

---

## Čo ste sa naučili

Gratulujeme! Úspešne ste:
- ✅ Inicializovali azd projekt zo šablóny
- ✅ Preskúmali štruktúru projektu a kľúčové súbory
- ✅ Nasadili full-stack aplikáciu na Azure
- ✅ Urobili zmeny v kóde a opätovne nasadili
- ✅ Spravovali viaceré prostredia
- ✅ Vyčistili zdroje

## 🎯 Overenie zručností – Cvičenia

### Cvičenie 1: Nasadenie inej šablóny (15 minút)
**Cieľ:** Preukázať ovládanie `azd init` a deployment workflow

```bash
# Vyskúšajte stack Python + MongoDB
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
- [ ] Aplikácia sa nasadila bez chýb
- [ ] Prístup k URL aplikácie v prehliadači
- [ ] Aplikácia správne funguje (pridávanie/odstraňovanie todo)
- [ ] Všetky zdroje úspešne vyčistené

### Cvičenie 2: Prispôsobenie konfigurácie (20 minút)
**Cieľ:** Precvičiť konfiguráciu premenných prostredia

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

# Nasadiť s vlastným nastavením
azd up
```

**Kritériá úspechu:**
- [ ] Vlastné prostredie vytvorené úspešne
- [ ] Premenné prostredia nastavené a dostupné
- [ ] Aplikácia nasadená s vlastnou konfiguráciou
- [ ] Overenie vlastných nastavení v nasadenej aplikácii

### Cvičenie 3: Workflow s viacerými prostrediami (25 minút)
**Cieľ:** Ovládnuť správu prostredí a stratégie nasadenia

```bash
# Vytvorte vývojové prostredie
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Poznačte si URL vývoja
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Vytvorte staging prostredie
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Poznačte si URL stagingu
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
- [ ] Vytvorené dva prostredia s rôznymi konfiguráciami
- [ ] Obidve prostredia úspešne nasadené
- [ ] Prepínanie medzi prostrediami pomocou `azd env select`
- [ ] Premenné prostredia sa líšia medzi prostrediami
- [ ] Obidve prostredia úspešne vyčistené

## 📊 Váš pokrok

**Čas investovaný:** ~60–90 minút  
**Získané zručnosti:**
- ✅ Inicializácia projektu zo šablóny
- ✅ Provisionovanie Azure zdrojov
- ✅ Workflow nasadenia aplikácie
- ✅ Správa prostredí
- ✅ Správa konfigurácie
- ✅ Čistenie zdrojov a riadenie nákladov

**Ďalšia úroveň:** Ste pripravení na [Sprievodcu konfiguráciou](configuration.md), kde sa naučíte pokročilé vzory konfigurácie!

## Riešenie bežných problémov

### Chyby autentifikácie
```bash
# Opätovne sa overte v Azure
az login

# Overiť prístup k predplatnému
az account show
```

### Zlyhania pri nasadení
```bash
# Povoliť ladenie protokolovania
export AZD_DEBUG=true
azd up --debug

# Prezerať denníky aplikácie v Azure
azd monitor --logs

# Pre Container Apps použite Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
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

Keďže ste dokončili prvý projekt, preskúmajte tieto pokročilé témy:

### 1. Prispôsobte infraštruktúru
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Pridanie databáz, úložísk a iných služieb](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Nastavte CI/CD
- [Sprievodca nasadením](../chapter-04-infrastructure/deployment-guide.md) – Kompletné CI/CD workflow
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) – Konfigurácia pipeline

### 3. Najlepšie praktiky pre produkciu
- [Sprievodca nasadením](../chapter-04-infrastructure/deployment-guide.md) – Bezpečnosť, výkon a monitorovanie

### 4. Preskúmajte viac šablón
```bash
# Prezerať šablóny podľa kategórie
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Vyskúšajte rôzne technologické sady
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Ďalšie zdroje

### Materiály na učenie
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komunita a podpora
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablóny a príklady
- [Oficiálna galéria šablón](https://azure.github.io/awesome-azd/)
- [Komunitné šablóny](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulujeme k dokončeniu vášho prvého azd projektu!** Teraz ste pripravení s dôverou vytvárať a nasadzovať úžasné aplikácie na Azure.

---

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 – Základy a rýchly štart
- **⬅️ Predchádzajúca**: [Inštalácia a nastavenie](installation.md)
- **➡️ Ďalšia**: [Konfigurácia](configuration.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: Vývoj s dôrazom na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Ďalšia lekcia**: [Sprievodca nasadením](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Upozornenie**:  
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, uvedomte si, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne výklady vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
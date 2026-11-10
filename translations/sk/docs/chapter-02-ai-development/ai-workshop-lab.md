# AI Workshop Lab: Vytvorenie vašich AI riešení nasaditeľných cez AZD

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj s AI na prvom mieste
- **⬅️ Predchádzajúca**: [Nasadenie AI modelu](ai-model-deployment.md)
- **➡️ Ďalšia**: [Najlepšie postupy pre produkčné AI](../chapter-08-production/production-ai-practices.md)
- **🚀 Ďalšia kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

## Prehľad workshopu

Tento praktický lab sprevádza vývojárov procesom prevzatia existujúcej AI šablóny a jej nasadením pomocou Azure Developer CLI (AZD). Naučíte sa základné vzory pre produkčné nasadenie AI s využitím služieb Microsoft Foundry.

> **Revize vydania (2026-11-04):** Návody pre príkazy AZD a vzorové názvy konfigurácií boli overené voči vydaniu `azd` `1.37.2` a aktuálnej konfigurácii priloženého vzoru. Ide o kontrolu dokumentácie, nie o overenie živého nasadenia. RAG lab nevyžaduje rozšírenie agenta; pre hodnotenie agentov používajte samostatné rozšírenie `azure.ai.evaluations` a [aktuálny hodnotiaci workflow](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), nie staré príkazy pre hodnotenie agentov.

**Dĺžka:** 2-3 hodiny  
**Úroveň:** Stredne pokročilá  
**Predpoklady:** Základné znalosti Azure, oboznámenie sa s konceptmi AI/ML

## 🎓 Ciele učenia

Na konci tohto workshopu budete schopní:
- ✅ Preskúmať existujúcu AI AZD šablónu a naplánovať konverziu vlastnej aplikácie
- ✅ Nakonfigurovať služby Microsoft Foundry pomocou AZD
- ✅ Implementovať bezpečnú správu prístupových údajov pre AI služby
- ✅ Nasadiť referenčnú AI aplikáciu s monitoringom
- ✅ Riešiť bežné problémy pri nasadení AI

## Predpoklady

### Požadované nástroje
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nainštalovaný
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nainštalovaný
- [Git](https://git-scm.com/) nainštalovaný
- Edito kódu (odporúča sa VS Code)

Tieto bloky príkazov používajú Bash syntax (vrátane pokračovaní riadkov a `grep`). Na Windows použite Git Bash/WSL alebo ich preložte do PowerShell. Tiež nainštalujte jazykové, správce balíčkov a kontajnerové nástroje uvedené v [nastavení lokálneho prostredia príkladu](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Azure zdroje
- Azure predplatné s povoleniami na poskytovanie zdrojov a priraďovanie rolí (sám len prispievateľ nemôže vytvárať RBAC priradenia; použite oprávneného administrátora rolí alebo dokumentovaný ekvivalent príkladu)
- Prístup k službám Microsoft Foundry Models (alebo možnosť požiadať o prístup)
- Povolenia na vytvorenie skupiny zdrojov

### Predpoklady vedomostí
- Základné porozumenie službám Azure
- Znalosť rozhraní príkazového riadku
- Základné pojmy AI/ML (API, modely, výzvy)

## Nastavenie laboratória

### Krok 1: Príprava prostredia

1. **Overte inštalácie nástrojov:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Ak pracujete cez viacerých nájomníkov alebo vaše predplatné sa nerozpozná automaticky, skúste znova s `azd auth login --tenant-id <tenant-id>`.

2. **Naklonujte repozitár workshopu:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Pochopenie štruktúry AZD pre AI aplikácie

### Anatomia AI AZD šablóny

Preskúmajte kľúčové súbory v AI pripravenom AZD šablóne:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

Skontrolovaný príklad sa môže meniť; `.azure/` sa objaví po inicializácii prostredia, nie nevyhnutne v čerstvom klone. Skúmajte reálnu checkout verziu namiesto tvorby chýbajúcich adresárov na zladenie s týmto schémou.

### **Cvičenie laboratória 1.1: Skúmanie konfigurácie**

1. **Preskúmajte súbor azure.yaml:**
```bash
cat azure.yaml
```

**Na čo sa zamerať:**
- Definície služieb pre AI komponenty
- Mapovania premenných prostredia
- Konfigurácie hostiteľa

2. **Preskúmajte hlavnú bicep infraštruktúru:**
```bash
cat infra/main.bicep
```

**Kľúčové AI vzory na identifikáciu:**
- Provisioning služby Microsoft Foundry Models
- Integrácia Azure AI Search
- Bezpečná správa kľúčov
- Konfigurácie zabezpečenia siete

### **Diskusný bod:** Prečo sú tieto vzory dôležité pre AI

- **Závislosti služieb**: AI aplikácie často vyžadujú koordinované viaceré služby
- **Zabezpečenie**: API kľúče a koncové body treba bezpečne spravovať
- **Škálovateľnosť**: AI záťaže majú špecifické požiadavky na škálovanie
- **Správa nákladov**: AI služby môžu byť nákladné, ak nie sú správne nastavené

## Modul 2: Nasadenie vašej prvej AI aplikácie

### Krok 2.1: Inicializácia prostredia

1. **Vytvorte nové AZD prostredie:**
```bash
azd env new myai-workshop
```

2. **Nastavte potrebné parametre:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Krok 2.2: Nasadenie infraštruktúry a aplikácie

1. **Nasadiť pomocou AZD:**
```bash
azd up
```

**Čo sa deje počas `azd up`:**
- ✅ Zavádza sa služba Microsoft Foundry Models
- ✅ Vytvára sa Azure AI Search služba
- ✅ Nastavuje sa Azure Container Apps pre backend a zabalený frontend (aktuálny predvolený príklad)
- ✅ Konfigurácia sietí a zabezpečenia
- ✅ Nasádza sa kód aplikácie
- ✅ Nastavuje sa monitorovanie a logovanie

2. **Sledujte priebeh nasadenia** a zaznamenajte vznikajúce zdroje.

### Krok 2.3: Overenie nasadenia

1. **Skontrolujte nasadené zdroje:**
```bash
azd show
```

2. **Otvorte nasadenú aplikáciu:**
```bash
azd show
```

Otvorte webový koncový bod zobrazený v `azd show` výstupe.

3. **Otestujte AI funkčnosť:**
   - Prejdite na webovú aplikáciu
   - Vyskúšajte vzorové otázky
   - Overte, či AI odpovede fungujú

### **Cvičenie laboratória 2.1: Prax riešenia problémov**

**Situácia**: Nasadenie sa podarilo, ale AI neodpovedá.

**Bežné problémy na skontrolovanie:**
1. **Autentifikácia**: Skontrolujte spravovanú identitu a priradenia rolí; API kľúče kontrolujte iba, ak ste zámerne povolili autentifikáciu na základe kľúča
2. **Dostupnosť modelu**: Skontrolujte, či váš región podporuje model
3. **Sieťová konektivita**: Uistite sa, že služby môžu komunikovať
4. **RBAC povolenia**: Overte, či má aplikácia prístup k OpenAI

**Príkazy na ladenie:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prispôsobenie AI aplikácií podľa vašich potrieb

### Krok 3.1: Upraviť AI konfiguráciu

1. **Aktualizujte OpenAI model:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Pridajte ďalšie AI služby:**

Upravte `infra/main.bicep` na pridanie Document Intelligence:

Nasledujúci fragment je ilustračný, nie kompletná šablóna. Príklad môže už provisionovať služby spracovania dokumentov: preskúmajte aktuálnu infraštruktúru pred pridaním duplicitných zdrojov. Vlastné doplnky vyžadujú zviazanie výstupov, identít a konfigurácie aplikácie.

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Krok 3.2: Konfigurácie špecifické pre prostredie

**Najlepšia prax**: Rozdielne konfigurácie pre vývoj a produkciu.

1. **Vytvorte produkčné prostredie:**
```bash
azd env new myai-production
```

2. **Nastavte produkčné parametre:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Tieto mená pochádzajú z [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) príkladu. `azd env set` ukladá hodnotu, ale neaktivuje ju len tak: šablóna ju musí použiť. Pred zakázaním verejného prístupu si preštudujte [sprievodcu izoláciou siete](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) a na aplikovanie infraštruktúrnych zmien použite `azd up`. OpenAI SKU `S0` sám o sebe neurčuje priepustnosť modelu; dôležitý je aj typ a kapacita nasadenia modelu.

### **Cvičenie laboratória 3.1: Optimalizácia nákladov**

**Výzva**: Nakonfigurujte šablónu na nákladovo efektívny vývoj.

**Úlohy:**
1. Vyberte použiteľné workshop prostredie: `azd env select myai-workshop`.
2. Zaznamenajte aktuálny Search SKU a kapacitu modelu z `infra/main.parameters.json` a zvoleného prostredia.
3. Použite podporované vstupy nižšie, po overení kvóty modelu/regiónu:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Skontrolujte Search SKU a kapacitu nasadenia v portáli a odhadnite rozdiel v kalkulačke cien. Neočakávajte okamžitú aktualizáciu fakturačných dát.

**Kritériá úspechu:** Search používa Basic, chatové nasadenie má požadovanú podporovanú kapacitu a aplikácia stále odpovedá na ukážkovú otázku. Kapacita `10` nie je zľavou na token, ale alokáciou rýchlostného limitu. Zmeny úrovne Search môžu byť obmedzené alebo si vyžadujú opätovné vytvorenie; nevykonávajte experimenty na produkčných zdrojoch. F0 je špecifické pre službu a nie je SKU modelu Azure OpenAI.

## Modul 4: Zabezpečenie a najlepšie produkčné postupy

### Krok 4.1: Bezpečné spravovanie poverení

**Aktuálna výzva**: Mnohé AI aplikácie majú pevne zakódované API kľúče alebo používajú nezabezpečené úložiská.

**Riešenie AZD**: Managed Identity + integrácia Key Vault.

1. **Skontrolujte bezpečnostnú konfiguráciu vo vašej šablóne:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Overte, že Managed Identity funguje:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Sieťová bezpečnosť

1. **Povoľte súkromné koncové body** pomocou podporovanej sieťovej konfigurácie príkladu (ak ešte nie je nastavené).

Pre vlastnú šablónu ukazuje tento ilustračný fragment pripojenie k OpenAI endpointu. Potrebuje tiež VNet, súkromnú DNS konfiguráciu a konektivitu aplikácie; nelepte ho nezmenený do príkladu, ktorý už má moduly pre súkromné koncové body:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### Krok 4.3: Monitorovanie a pozorovateľnosť

1. **Nakonfigurujte Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Povoľte integráciu Application Insights príkladu:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Instrumentácia príkladu vysiela telemetriu; ľubovoľné nastavenie `OPENAI_MONITOR_ENABLED` neaktivuje AI metriky. Prezrite stopy volaní modelu, latencie, zlyhaní a využitia tokenov a vyhnite sa záznamu citlivých výziev alebo odpovedí.

### **Cvičenie laboratória 4.1: Bezpečnostný audit**

**Úloha**: Skontrolujte svoje nasadenie z hľadiska najlepších bezpečnostných postupov.

**Kontrolný zoznam:**
- [ ] Žiadne pevne zakódované tajomstvá v kóde alebo konfigurácii
- [ ] Použitie Managed Identity na overenie služieb medzi sebou
- [ ] Key Vault uchováva citlivú konfiguráciu
- [ ] Prístup do siete je správne obmedzený
- [ ] Monitorovanie a logovanie sú povolené

## Modul 5: Konverzia vlastnej AI aplikácie

### Krok 5.1: Hodnotiaci pracovný list

**Pred konverziou aplikácie** odpovedzte na tieto otázky:

1. **Architektúra aplikácie:**
   - Aké AI služby vaša aplikácia používa?
   - Aké výpočtové zdroje potrebuje?
   - Potrebuje databázu?
   - Aké sú závislosti medzi službami?

2. **Bezpečnostné požiadavky:**
   - Aké citlivé údaje vaša aplikácia spracúva?
   - Aké požiadavky na súlad máte?
   - Potrebujete súkromnú sieť?

3. **Požiadavky na škálovanie:**
   - Aké je očakávané zaťaženie?
   - Potrebujete automatické škálovanie?
   - Sú regionálne požiadavky?

### Krok 5.2: Vytvorte svoju AZD šablónu

**Postupujte podľa tohto vzoru pri konverzii aplikácie:**

**Len kostra:** Táto časť neposkytuje zdroj API/web aplikácie, infraštruktúru hostiteľa, nasadenie modelov, identity/RBAC ani dokončený `main.parameters.json`. Zdrojovo-obmedzený Bicep ukazuje tvorbu modulu; typický vstup na úrovni prenájmu AZD musí vytvoriť skupinu zdrojov a vyvolať ju v tomto rozsahu. Neočakávajte, že `azd up` nasadí kompletnú aplikáciu po skopírovaní iba týchto fragmentov. Na spustiteľný základ použite stále RAG šablónu z Modulu 1.

1. **Vytvorte základnú štruktúru:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
```

2. **Vytvorte azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Vytvorte infraštruktúrne šablóny:**

**infra/main.bicep** - Hlavná šablóna:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI modul:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Cvičenie laboratória 5.1: Výzva na tvorbu šablóny**

**Výzva**: Vytvorte AZD šablónu pre AI aplikáciu spracovania dokumentov.

**Požiadavky:**
- Microsoft Foundry Models pre analýzu obsahu
- Document Intelligence pre OCR
- Účet úložiska pre nahrávanie dokumentov
- Function App pre spracovateľskú logiku
- Webová aplikácia pre používateľské rozhranie

**Bonusové body:**
- Pridajte správu chýb
- Zahŕňajte odhad nákladov
- Nastavte monitorovacie panely

## Modul 6: Riešenie bežných problémov

### Bežné problémy pri nasadení

#### Problém 1: Prekročenie kvóty služby OpenAI
**Príznaky:** Nasadenie zlyhá s chybou kvóty
**Riešenia:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Problém 2: Model nie je dostupný v regióne
**Príznaky:** Zlyhanie AI odpovedí alebo chyby nasadenia modelu
**Riešenia:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Problém 3: Problémy s povoleniami
**Príznaky:** 403 Forbidden chyby pri volaniach AI služieb
**Riešenia:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Výkonnostné problémy

#### Problém 4: Pomalé AI odpovede
**Kroky vyšetrovania:**
1. Skontrolujte metriky výkonu v Application Insights
2. Prezrite metriky OpenAI služby v Azure portáli
3. Overte sieťovú konektivitu a latenciu

**Riešenia:**
- Implementujte cachovanie pre bežné dotazy
- Použite vhodný OpenAI model pre váš prípad použitia
- Škálujte repliky aplikácie až po overení limitov RPM/TPM modelu; Azure OpenAI nasadenia neponúkajú všeobecné nastavenie "read replica" databázy

### **Cvičenie laboratória 6.1: Výzva na ladenie**

**Situácia**: Nasadenie bolo úspešné, ale aplikácia vracia chyby 500.

**Úlohy na ladenie:**
1. Skontrolujte logy aplikácie
2. Overte konektivitu služieb
3. Testovanie autentifikácie
4. Preskúmanie konfigurácie

**Použiteľné nástroje:**
- `azd show` pre prehľad nasadenia
- Azure portál pre detailné denníky služieb
- Application Insights pre telemetriu aplikácie

## Modul 7: Monitorovanie a optimalizácia

### Krok 7.1: Nastavenie komplexného monitorovania

1. **Vytvorte vlastné dashboardy:**

Prejdite na Azure portál a vytvorte dashboard s:
- Počtom a latenciou požiadaviek OpenAI
- Mierou chýb aplikácie
- Využitím zdrojov
- Sledovaním nákladov

2. **Nastavte upozornenia:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Overte, že komponent vysiela telemetriu požiadaviek a pridajte akčnú skupinu, ak sú potrebné notifikácie. Metrika je počet, nie percento zlyhaní; upozornenie na mieru potrebuje vhodný dotaz a menovateľ.

### Krok 7.2: Optimalizácia nákladov

1. **Analyzujte aktuálne náklady:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Nahraďte dátumové zástupné symboly. Podpora Consumption API závisí od fakturačnej dohody; použite Cost Management v portáli, ak nie sú dostupné detaily o využití. Náklady sú oneskorené, nie je to test v reálnom čase.

2. **Implementujte kontrolu nákladov:**
- Nastavte upozornenia rozpočtu
- Používajte autoscaling politiky
- Implementujte cache požiadaviek
- Sledujte použitie tokenov pre OpenAI

### **Cvičenie v laboratóriu 7.1: Optimalizácia výkonu**

**Úloha**: Optimalizujte svoju AI aplikáciu pre výkon aj náklady.

**Metriky na zlepšenie:**
- Znížiť priemerný čas odozvy o 20 %
- Znížiť mesačné náklady o 15 %
- Definovať 99,9 % dostupnosť SLO a meracie okno (krátke laboratórium nemôže preukázať mesačnú dostupnosť)

**Stratégie na vyskúšanie:**
- Implementovať cache odpovedí
- Optimalizovať prompt-y pre efektivitu tokenov
- Použiť vhodné výpočtové SKU
- Nastaviť správny autoscaling

## Záverečná výzva: Implementácia od začiatku do konca

### Scenár výzvy

Toto je **voliteľná architektonická/designová výzva**, nie dodané spustiteľné cvičenie ani certifikácia pre produkciu. Navrhnite chatbot zákazníckej služby poháňaný AI a zdokumentujte, ktoré požiadavky potrebujú ďalšiu implementáciu a dôkazy:

**Funkčné požiadavky:**
- Webové rozhranie pre interakciu so zákazníkmi
- Integrácia s Microsoft Foundry Models pre odpovede
- Vyhľadávanie v dokumentoch pomocou Azure AI Search
- Integrácia so existujúcou databázou zákazníkov
- Podpora viacerých jazykov

**Nefunkčné požiadavky:**
- Podpora 1000 súbežných používateľov
- SLA dostupnosť 99,9 %
- Dodržiavanie SOC 2
- Náklady pod 500 $ mesačne
- Nasadenie do viacerých prostredí (vývoj, staging, produkcia)

Ide o hypotetické požiadavky stakeholderov, nie garantované výsledky naraz. Definujte mieru požiadaviek, veľkosť promptov/výstupov a trvanie relácie pred odhadom nákladov; 1000 súbežných používateľov neurčuje záťaž ani nedokazuje, že rozpočet 500 $ je uskutočniteľný. SOC 2 je výsledok organizačného auditu, nie prepínač povolený šablónou AZD. Identifikujte kompromisy a zamietnite nereálne požiadavky s dôkazmi.

### Kroky implementácie

1. **Navrhnite architektúru**
2. **Vytvorte šablónu AZD**
3. **Implementujte bezpečnostné opatrenia**
4. **Nastavte monitorovanie a upozornenia**
5. **Vytvorte pipeline pre nasadenie**
6. **Zdokumentujte riešenie**

### Kritériá hodnotenia

- ✅ **Funkčnosť**: Sú implementované schopnosti preukázané a sú zrejmé zostávajúce medzery?
- ✅ **Bezpečnosť**: Sú implementované osvedčené postupy?
- ✅ **Škálovateľnosť**: Zvládne záťaž?
- ✅ **Udržiavateľnosť**: Je kód a infraštruktúra dobre organizovaná?
- ✅ **Náklady**: Je riešenie v rámci rozpočtu?

## Ďalšie zdroje

### Dokumentácia Microsoftu
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Ukážkové šablóny
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Komunitné zdroje
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Kontrolný bod dokončenia

Gratulujeme! Dokončili ste laboratórium AI Workshop. Mali by ste teraz vedieť:

- ✅ Vysvetliť, ako prispôsobiť existujúcu AI aplikáciu pre šablónu AZD
- ✅ Nasadiť a otestovať referenčnú AI aplikáciu
- ✅ Implementovať bezpečnostné osvedčené postupy pre AI pracovné zaťaženia
- ✅ Monitorovať a optimalizovať výkon AI aplikácie
- ✅ Riešiť bežné problémy nasadenia

**Vyčistenie:** Spustite `azd env list`, vyberte každé dočasné prostredie vytvorené v tomto laboratóriu (`myai-workshop`, a ak bolo nasadené `myai-production`/`myai-quota-test`), a spustite `azd down` v každom z nich. Skontrolujte plán mazania; vymazanie miestnej konfigurácie prostredia samotnej nevymaže Azure zdroje. Vyhnite sa `--purge`, pokiaľ úplne nechápete nezvratné odstránenie mäkko zmazaných zdrojov.

### Ďalšie kroky
1. Použite tieto vzory vo vlastných AI projektoch
2. Prispievajte so šablónami späť do komunity
3. Pridajte sa do Microsoft Foundry Discord pre priebežnú podporu
4. Preskúmajte pokročilé témy ako nasadenie v multiregiónoch

---

**Spätná väzba k workshopu**: Pomôžte nám zlepšiť tento workshop zdieľaním svojej skúsenosti v [Microsoft Foundry Discord #Azure kanáli](https://discord.gg/microsoft-azure).

---

**Navigácia kapitoly:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Predchádzajúca**: [Nasadenie AI modelu](ai-model-deployment.md)
- **➡️ Nasledujúca**: [Najlepšie postupy produkčného AI](../chapter-08-production/production-ai-practices.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

**Potrebujete pomoc?** Pridajte sa do našej komunity pre podporu a diskusie o AZD a AI nasadeniach.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# AI Workshop Lab: Ako spraviť vaše AI riešenia nasaditeľné pomocou AZD

**Chapter Navigation:**
- **📚 Domov kurzu**: [AZD Pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj s AI na prvom mieste
- **⬅️ Predchádzajúce**: [Nasadenie AI modelu](ai-model-deployment.md)
- **➡️ Ďalšie**: [Najlepšie postupy pre produkčné AI](production-ai-practices.md)
- **🚀 Ďalšia kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

## Prehľad workshopu

Tento praktický lab prevedie vývojárov procesom, ako vziať existujúcu AI šablónu a nasadiť ju pomocou Azure Developer CLI (AZD). Naučíte sa základné vzory pre produkčné nasadenia AI s použitím služieb Microsoft Foundry.

**Trvanie:** 2-3 hodiny  
**Úroveň:** Stredne pokročilá  
**Predpoklady:** Základné znalosti Azure, znalosť konceptov AI/ML

## 🎓 Ciele workshopu

By the end of this workshop, you will be able to:
- ✅ Previesť existujúcu AI aplikáciu na používanie AZD šablón
- ✅ Konfigurovať služby Microsoft Foundry pomocou AZD
- ✅ Implementovať bezpečné spravovanie poverení pre AI služby
- ✅ Nasadiť produkčné AI aplikácie pripravené na prevádzku s monitorovaním
- ✅ Riešiť bežné problémy pri nasadzovaní AI

## Predpoklady

### Požadované nástroje
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nainštalovaný
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nainštalovaný
- [Git](https://git-scm.com/) nainštalovaný
- Editor kódu (odporúča sa VS Code)

### Azure zdroje
- Azure predplatné s právami prispievateľa
- Prístup k službám Azure OpenAI (alebo možnosť požiadať o prístup)
- Oprávnenia na vytváranie skupín prostriedkov

### Potrebné vedomosti
- Základné porozumenie službám Azure
- Znalosť príkazového riadku
- Základné koncepty AI/ML (API, modely, výzvy)

## Nastavenie labu

### Krok 1: Príprava prostredia

1. **Overte inštalácie nástrojov:**
```bash
# Skontrolujte inštaláciu AZD
azd version

# Skontrolujte Azure CLI
az --version

# Prihláste sa do Azure
az login
azd auth login
```

2. **Klonujte repozitár workshopu:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Pochopenie štruktúry AZD pre AI aplikácie

### Stavba AI AZD šablóny

Preskúmajte kľúčové súbory v AZD šablóne pripravenej na AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab cvičenie 1.1: Preskúmajte konfiguráciu**

1. **Skontrolujte súbor azure.yaml:**
```bash
cat azure.yaml
```

**Na čo sa zamerať:**
- Definície služieb pre AI komponenty
- Mapovania premenných prostredia
- Konfigurácie hostiteľa

2. **Preskúmajte infraštruktúru main.bicep:**
```bash
cat infra/main.bicep
```

**Kľúčové AI vzory na identifikáciu:**
- Zriaďovanie služby Azure OpenAI
- Integrácia Cognitive Search
- Bezpečné spravovanie kľúčov
- Konfigurácie sieťovej bezpečnosti

### **Diskusný bod:** Prečo sú tieto vzory dôležité pre AI

- **Závislosti služieb**: AI aplikácie často vyžadujú viacero koordinovaných služieb
- **Bezpečnosť**: API kľúče a koncové body potrebujú bezpečné spravovanie
- **Škálovateľnosť**: AI pracovné zaťaženia majú špecifické požiadavky na škálovanie
- **Riadenie nákladov**: AI služby môžu byť drahé, ak nie sú správne nakonfigurované

## Modul 2: Nasadenie vašej prvej AI aplikácie

### Krok 2.1: Inicializácia prostredia

1. **Vytvorte nové AZD prostredie:**
```bash
azd env new myai-workshop
```

2. **Nastavte požadované parametre:**
```bash
# Nastavte preferovaný región Azure
azd env set AZURE_LOCATION eastus

# Voliteľné: Nastavte konkrétny model OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Krok 2.2: Nasadenie infraštruktúry a aplikácie

1. **Nasadiť pomocou AZD:**
```bash
azd up
```

**Čo sa deje počas `azd up`:**
- ✅ Zriaďuje službu Azure OpenAI
- ✅ Vytvára službu Cognitive Search
- ✅ Nastavuje App Service pre webovú aplikáciu
- ✅ Konfiguruje sieťovanie a bezpečnosť
- ✅ Nasadzuje kód aplikácie
- ✅ Nastavuje monitorovanie a logovanie

2. **Sledujte priebeh nasadenia** a zaznamenajte vytvárané prostriedky.

### Krok 2.3: Overte svoje nasadenie

1. **Skontrolujte nasadené prostriedky:**
```bash
azd show
```

2. **Otvorte nasadenú aplikáciu:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Otestujte AI funkčnosť:**
   - Prejdite do webovej aplikácie
   - Vyskúšajte ukážkové dotazy
   - Overte, že odpovede AI fungujú

### **Lab cvičenie 2.1: Cvičenie riešenia problémov**

**Scenár**: Nasadenie prebehlo úspešne, ale AI neodpovedá.

**Bežné problémy, ktoré treba skontrolovať:**
1. **OpenAI API kľúče**: Overte, či sú správne nastavené
2. **Dostupnosť modelu**: Skontrolujte, či váš región podporuje daný model
3. **Sieťové pripojenie**: Uistite sa, že služby môžu komunikovať
4. **RBAC oprávnenia**: Overte, či aplikácia má prístup k OpenAI

**Príkazy na ladenie:**
```bash
# Skontrolovať premenné prostredia
azd env get-values

# Zobraziť protokoly nasadenia
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Skontrolovať stav nasadenia OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prispôsobenie AI aplikácií pre vaše potreby

### Krok 3.1: Úprava konfigurácie AI

1. **Aktualizujte OpenAI model:**
```bash
# Prepnite na iný model (ak je vo vašom regióne dostupný)
azd env set AZURE_OPENAI_MODEL gpt-4

# Znovu nasaďte s novou konfiguráciou
azd deploy
```

2. **Pridajte ďalšie AI služby:**

Upravte `infra/main.bicep` na pridanie Document Intelligence:

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

**Najlepší postup**: Rôzne konfigurácie pre vývoj a produkciu.

1. **Vytvorte produkčné prostredie:**
```bash
azd env new myai-production
```

2. **Nastavte parametre špecifické pre produkciu:**
```bash
# V produkčnom prostredí sa zvyčajne používajú vyššie SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Povoliť ďalšie bezpečnostné funkcie
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab cvičenie 3.1: Optimalizácia nákladov**

**Výzva**: Nakonfigurujte šablónu pre nákladovo efektívny vývoj.

**Úlohy:**
1. Určte, ktoré SKU je možné nastaviť na bezplatné/základné úrovne
2. Nakonfigurujte premenné prostredia pre minimálne náklady
3. Nasadiť a porovnať náklady s produkčnou konfiguráciou

**Náznaky riešenia:**
- Použite F0 (bezplatnú) úroveň pre Cognitive Services, kde je to možné
- Použite Basic úroveň pre Search Service vo vývoji
- Zvážte použitie Consumption plánu pre Functions

## Modul 4: Bezpečnosť a produkčné najlepšie postupy

### Krok 4.1: Bezpečné spravovanie poverení

**Aktuálny problém**: Mnoho AI aplikácií má API kľúče natvrdo v kóde alebo používa nebezpečné úložisko.

**Riešenie AZD**: Managed Identity + integrácia Key Vault.

1. **Skontrolujte bezpečnostnú konfiguráciu vo vašej šablóne:**
```bash
# Vyhľadajte konfiguráciu Key Vault a spravovanej identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Overte, že Managed Identity funguje:**
```bash
# Skontrolujte, či má webová aplikácia správnu konfiguráciu identity
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Sieťová bezpečnosť

1. **Povoľte súkromné koncové body** (ak ešte nie sú nakonfigurované):

Pridajte do vašej bicep šablóny:
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
# Application Insights by mal byť automaticky nakonfigurovaný
# Skontrolujte konfiguráciu:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Nastavte monitorovanie špecifické pre AI:**

Pridajte vlastné metriky pre AI operácie:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Lab cvičenie 4.1: Bezpečnostný audit**

**Úloha**: Skontrolujte svoje nasadenie z hľadiska bezpečnostných najlepších postupov.

**Kontrolný zoznam:**
- [ ] Žiadne natvrdo zadané tajomstvá v kóde alebo konfigurácii
- [ ] Managed Identity používaná na autentifikáciu medzi službami
- [ ] Key Vault ukladá citlivú konfiguráciu
- [ ] Sieťový prístup je správne obmedzený
- [ ] Monitorovanie a logovanie sú povolené

## Modul 5: Konverzia vašej vlastnej AI aplikácie

### Krok 5.1: Hodnotiaci pracovný list

**Pred konverziou vašej aplikácie**, odpovedzte na tieto otázky:

1. **Architektúra aplikácie:**
   - Aké AI služby vaša aplikácia používa?
   - Aké výpočtové prostriedky potrebuje?
   - Vyžaduje si databázu?
   - Aké sú závislosti medzi službami?

2. **Bezpečnostné požiadavky:**
   - Aké citlivé údaje vaša aplikácia spracúva?
   - Aké požiadavky na súlad (compliance) máte?
   - Potrebujete súkromné sieťovanie?

3. **Požiadavky na škálovanie:**
   - Aké je očakávané zaťaženie?
   - Potrebujete automatické škálovanie?
   - Sú nejaké regionálne požiadavky?

### Krok 5.2: Vytvorte svoju AZD šablónu

**Nasledujte tento vzor pri konverzii vašej aplikácie:**

1. **Vytvorte základnú štruktúru:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializovať šablónu AZD
azd init --template minimal
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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Lab cvičenie 5.1: Výzva na vytvorenie šablóny**

**Výzva**: Vytvorte AZD šablónu pre AI aplikáciu na spracovanie dokumentov.

**Požiadavky:**
- Azure OpenAI pre analýzu obsahu
- Document Intelligence pre OCR
- Storage Account pre nahrávanie dokumentov
- Function App pre spracovateľskú logiku
- Web app pre používateľské rozhranie

**Bonusové body:**
- Pridajte správnu obsluhu chýb
- Zahrňte odhad nákladov
- Nastavte monitorovacie panely

## Modul 6: Riešenie bežných problémov

### Bežné problémy pri nasadení

#### Problém 1: Prekročená kvóta služby OpenAI
**Príznaky:** Nasadenie zlyhá s chybou kvóty
**Riešenia:**
```bash
# Skontrolujte aktuálne kvóty
az cognitiveservices usage list --location eastus

# Požiadajte o zvýšenie kvóty alebo vyskúšajte iný región
azd env set AZURE_LOCATION westus2
azd up
```

#### Problém 2: Model nie je dostupný v regióne
**Príznaky:** Odpovede AI zlyhávajú alebo chyby pri nasadzovaní modelu
**Riešenia:**
```bash
# Skontrolujte dostupnosť modelu podľa regiónu
az cognitiveservices model list --location eastus

# Aktualizujte na dostupný model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problém 3: Problémy s oprávneniami
**Príznaky:** 403 Forbidden chyby pri volaní AI služieb
**Riešenia:**
```bash
# Skontrolujte priradenia rolí
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Pridajte chýbajúce role
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Výkonové problémy

#### Problém 4: Pomalé odpovede AI
**Kroky vyšetrovania:**
1. Skontrolujte Application Insights pre výkonové metriky
2. Skontrolujte metriky služby OpenAI v Azure portáli
3. Overte sieťové pripojenie a latenciu

**Riešenia:**
- Implementujte cache pre bežné dotazy
- Použite vhodný OpenAI model pre váš prípad použitia
- Zvážte read repliku pre scenáre s vysokým zaťažením

### **Lab cvičenie 6.1: Výzva na ladenie**

**Scenár**: Nasadenie prebehlo úspešne, ale aplikácia vracia chyby 500.

**Úlohy na ladenie:**
1. Skontrolujte logy aplikácie
2. Overte konektivitu služieb
3. Otestujte autentifikáciu
4. Skontrolujte konfiguráciu

**Nástroje na použitie:**
- `azd show` pre prehľad nasadenia
- Azure portál pre podrobné logy služieb
- Application Insights pre telemetriu aplikácie

## Modul 7: Monitorovanie a optimalizácia

### Krok 7.1: Nastavenie komplexného monitorovania

1. **Vytvorte vlastné panely (dashboards):**

Prejdite do Azure portálu a vytvorte dashboard s:
- Počet požiadaviek OpenAI a latencia
- Miera chýb aplikácie
- Využitie prostriedkov
- Sledovanie nákladov

2. **Nastavte upozornenia:**
```bash
# Upozornenie na vysokú chybovosť
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Krok 7.2: Optimalizácia nákladov

1. **Analyzujte aktuálne náklady:**
```bash
# Použite Azure CLI na získanie údajov o nákladoch
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementujte opatrenia na riadenie nákladov:**
- Nastavte upozornenia rozpočtu
- Použite politiky automatického škálovania
- Implementujte cache požiadaviek
- Sledujte využitie tokenov pre OpenAI

### **Lab cvičenie 7.1: Optimalizácia výkonu**

**Úloha**: Optimalizujte svoju AI aplikáciu pre výkon aj náklady.

**Metriky na zlepšenie:**
- Znížte priemerný čas odozvy o 20%
- Znížte mesačné náklady o 15%
- Zachovajte 99.9% dostupnosť

**Stratégie na vyskúšanie:**
- Implementujte cache odpovedí
- Optimalizujte prompty pre efektívnosť tokenov
- Použite vhodné compute SKU
- Nastavte správne automatické škálovanie

## Záverečná výzva: End-to-End implementácia

### Scenár výzvy

Máte za úlohu vytvoriť produkčného chatbota pre zákaznícku podporu poháňaného AI s týmito požiadavkami:

**Funkčné požiadavky:**
- Webové rozhranie pre interakcie so zákazníkmi
- Integrácia so službou Azure OpenAI pre odpovede
- Schopnosť vyhľadávania dokumentov pomocou Cognitive Search
- Integrácia so existujúcou databázou zákazníkov
- Podpora viacerých jazykov

**Nefunkčné požiadavky:**
- Zvládnuť 1000 súbežných používateľov
- SLA 99,9% dostupnosť
- Súlad so SOC 2
- Náklady pod 500 $/mesiac
- Nasadiť do viacerých prostredí (dev, staging, prod)

### Kroky implementácie

1. Navrhnite architektúru
2. Vytvorte AZD šablónu
3. Implementujte bezpečnostné opatrenia
4. Nastavte monitorovanie a upozorňovanie
5. Vytvorte deployment pipeliny
6. Zdokumentujte riešenie

### Kritériá hodnotenia

- ✅ **Funkčnosť**: Spĺňa všetky požiadavky?
- ✅ **Bezpečnosť**: Sú implementované najlepšie postupy?
- ✅ **Škálovateľnosť**: Zvládne zaťaženie?
- ✅ **Udržiavateľnosť**: Je kód a infraštruktúra dobre organizovaná?
- ✅ **Náklady**: Drží sa v rozpočte?

## Doplnkové zdroje

### Dokumentácia Microsoftu
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentácia služby Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentácia Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Vzorkové šablóny
- [Ukážková aplikácia Azure OpenAI Chat](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Rýchly štart OpenAI Chat App](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Komunitné zdroje
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Skvelé AZD šablóny](https://azure.github.io/awesome-azd/)

## 🎓 Certifikát o absolvovaní
Gratulujeme! Dokončili ste AI Workshop Lab. Teraz by ste mali byť schopní:

- ✅ Previesť existujúce AI aplikácie na AZD šablóny
- ✅ Nasadiť AI aplikácie pripravené na produkciu
- ✅ Implementovať osvedčené bezpečnostné postupy pre AI pracovné zaťaženia
- ✅ Monitorovať a optimalizovať výkon AI aplikácií
- ✅ Riešiť bežné problémy pri nasadení

### Ďalšie kroky
1. Aplikujte tieto postupy vo vlastných AI projektoch
2. Prispievajte šablóny späť komunite
3. Pripojte sa na Microsoft Foundry Discord pre priebežnú podporu
4. Preskúmajte pokročilé témy, napríklad nasadenia v viacerých regiónoch

---

**Workshop Feedback**: Pomôžte nám zlepšiť tento workshop tým, že sa podelíte o svoje skúsenosti v [Microsoft Foundry Discord kanáli #Azure](https://discord.gg/microsoft-azure).

---

**Navigácia kapitol:**
- **📚 Course Home**: [AZD pre začiatočníkov](../../README.md)
- **📖 Current Chapter**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Predchádzajúca**: [Nasadenie AI modelu](ai-model-deployment.md)
- **➡️ Ďalšia**: [Najlepšie postupy pre produkčné AI](production-ai-practices.md)
- **🚀 Ďalšia kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

**Potrebujete pomoc?** Pripojte sa k našej komunite pre podporu a diskusie o AZD a nasadeniach AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vylúčenie zodpovednosti:
Tento dokument bol preložený pomocou služby automatického prekladu umelej inteligencie [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, vezmite prosím na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho originálnom jazyku by mal byť považovaný za rozhodujúci zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nezodpovedáme za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
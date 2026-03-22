# AI Workshop Lab: Nasadenie vašich AI riešení pomocou AZD

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Predchádzajúca**: [Nasadenie AI modelu](ai-model-deployment.md)
- **➡️ Ďalšia**: [Najlepšie postupy pre produkčné AI](production-ai-practices.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

## Prehľad workshopu

Toto praktické laboratórium vedie vývojárov procesom prevodu existujúcej AI šablóny a jej nasadenia pomocou Azure Developer CLI (AZD). Naučíte sa základné vzory pre produkčné nasadenia AI pomocou služieb Microsoft Foundry.

**Trvanie:** 2-3 hodiny  
**Úroveň:** Stredne pokročilá  
**Predpoklady:** Základné znalosti Azure, znalosť konceptov AI/ML

## 🎓 Ciele učenia

Na konci tohto workshopu budete schopní:
- ✅ Previesť existujúcu AI aplikáciu na použitie AZD šablón
- ✅ Nakonfigurovať služby Microsoft Foundry pomocou AZD
- ✅ Implementovať bezpečné spravovanie poverení pre AI služby
- ✅ Nasadiť produkčne pripravené AI aplikácie s monitorovaním
- ✅ Riešiť bežné problémy pri nasadení AI

## Predpoklady

### Požadované nástroje
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nainštalovaný
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nainštalovaný
- [Git](https://git-scm.com/) nainštalovaný
- Editor kódu (odporúča sa VS Code)

### Azure zdroje
- Predplatné Azure s právami prispievateľa
- Prístup k službám Microsoft Foundry Models (alebo možnosť požiadať o prístup)
- Oprávnenia na vytváranie skupín prostriedkov

### Potrebné znalosti
- Základné porozumenie službám Azure
- Prax s príkazovým riadkom
- Základy AI/ML (API, modely, promptov)

## Nastavenie laboratória

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

Preskúmajte kľúčové súbory v AZD šablóne pripravené na AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
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
- Zriadenie služby Microsoft Foundry Models
- Integrácia Cognitive Search
- Bezpečné riadenie kľúčov
- Konfigurácie sieťovej bezpečnosti

### **Diskusný bod:** Prečo sú tieto vzory dôležité pre AI

- **Závislosti služieb**: AI aplikácie často vyžadujú viacero koordinovaných služieb
- **Bezpečnosť**: API kľúče a koncové body potrebujú bezpečné riadenie
- **Škálovateľnosť**: AI pracovné záťaže majú špecifické požiadavky na škálovanie
- **Riadenie nákladov**: AI služby môžu byť drahé, ak nie sú správne nakonfigurované

## Modul 2: Nasadenie vašej prvej AI aplikácie

### Krok 2.1: Inicializujte prostredie

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
- ✅ Provisioning služby Microsoft Foundry Models
- ✅ Vytvorenie služby Cognitive Search
- ✅ Nastavenie App Service pre webovú aplikáciu
- ✅ Konfigurácia sietí a bezpečnosti
- ✅ Nasadenie kódu aplikácie
- ✅ Nastavenie monitorovania a protokolovania

2. **Sledujte priebeh nasadenia** a zaznamenajte vytvárané prostriedky.

### Krok 2.3: Overenie vášho nasadenia

1. **Skontrolujte nasadené prostriedky:**
```bash
azd show
```

2. **Otvorte nasadenú aplikáciu:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Otestujte AI funkčnosť:**
   - Prejdite na webovú aplikáciu
   - Vyskúšajte ukážkové dopyty
   - Overte, že AI odpovede fungujú

### **Lab cvičenie 2.1: Prax riešenia problémov**

**Scenár**: Nasadenie bolo úspešné, ale AI neodpovedá.

**Bežné problémy na kontrolu:**
1. **OpenAI API kľúče**: Overte, či sú správne nastavené
2. **Dostupnosť modelu**: Skontrolujte, či váš región podporuje model
3. **Sieťová konektivita**: Uistite sa, že služby môžu komunikovať
4. **RBAC oprávnenia**: Overte, či má aplikácia prístup k OpenAI

**Ladiace príkazy:**
```bash
# Skontrolujte premenné prostredia
azd env get-values

# Zobrazte protokoly nasadenia
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Skontrolujte stav nasadenia OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prispôsobenie AI aplikácií podľa vašich potrieb

### Krok 3.1: Úprava AI konfigurácie

1. **Aktualizujte OpenAI model:**
```bash
# Prepnite na iný model (ak je dostupný vo vašom regióne)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Znovu nasadiť s novou konfiguráciou
azd deploy
```

2. **Pridajte ďalšie AI služby:**

Upravte `infra/main.bicep`, aby ste pridali Document Intelligence:

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
# V produkcii sa zvyčajne používajú vyššie SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Povoliť ďalšie bezpečnostné funkcie
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab cvičenie 3.1: Optimalizácia nákladov**

**Výzva**: Nakonfigurujte šablónu pre nákladovo efektívny vývoj.

**Úlohy:**
1. Identifikujte, ktoré SKU je možné nastaviť na free/basic úrovne
2. Nakonfigurujte premenné prostredia pre minimálne náklady
3. Nasadte a porovnajte náklady s produkčnou konfiguráciou

**Tipy k riešeniu:**
- Použite F0 (bezplatný) stupeň pre Cognitive Services, keď je to možné
- Použite Basic stupeň pre Search Service vo vývoji
- Zvážte použitie Consumption plánu pre Functions

## Modul 4: Bezpečnosť a najlepšie postupy pre produkciu

### Krok 4.1: Bezpečné spravovanie poverení

**Súčasná výzva**: Mnoho AI aplikácií má API kľúče natvrdo v kóde alebo používa nebezpečné úložiská.

**Riešenie AZD**: Managed Identity + integrácia s Key Vault.

1. **Skontrolujte bezpečnostnú konfiguráciu vo vašej šablóne:**
```bash
# Skontrolujte konfiguráciu Key Vault a spravovanej identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Overte, či Managed Identity funguje:**
```bash
# Skontrolujte, či má webová aplikácia správnu konfiguráciu identity
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Sieťová bezpečnosť

1. **Povoliť privátne endpointy** (ak ešte nie sú nakonfigurované):

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

### Krok 4.3: Monitorovanie a observabilita

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
- [ ] Žiadne natvrdo vložené tajné údaje v kóde alebo konfigurácii
- [ ] Managed Identity používané pre autentifikáciu medzi službami
- [ ] Key Vault uchováva citlivé konfigurácie
- [ ] Prístup do siete je správne obmedzený
- [ ] Monitorovanie a protokolovanie sú povolené

## Modul 5: Konverzia vašej vlastnej AI aplikácie

### Krok 5.1: Hodnotiaci formulár

**Pred konverziou aplikácie** odpovedzte na tieto otázky:

1. **Architektúra aplikácie:**
   - Aké AI služby vaša aplikácia používa?
   - Aké výpočtové prostriedky potrebuje?
   - Vyžaduje databázu?
   - Aké sú závislosti medzi službami?

2. **Bezpečnostné požiadavky:**
   - S akými citlivými údajmi vaša aplikácia pracuje?
   - Aké požiadavky na súlad (compliance) máte?
   - Potrebujete privátnu sieť?

3. **Požiadavky na škálovanie:**
   - Aké zaťaženie očakávate?
   - Potrebujete automatické škálovanie?
   - Existujú regionálne požiadavky?

### Krok 5.2: Vytvorte vašu AZD šablónu

**Postupujte podľa tohto vzoru pri konverzii aplikácie:**

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

**infra/modules/openai.bicep** - Modul OpenAI:
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
- Microsoft Foundry Models pre analýzu obsahu
- Document Intelligence pre OCR
- Storage Account pre nahrávanie dokumentov
- Function App pre spracovnú logiku
- Webová aplikácia pre používateľské rozhranie

**Bonusové body:**
- Pridajte riadne ošetrenie chýb
- Zahrňte odhad nákladov
- Nastavte monitorovacie dashboardy

## Modul 6: Riešenie bežných problémov

### Bežné problémy pri nasadení

#### Problém 1: Prekročená kvóta služby OpenAI
**Príznaky:** Nasadenie zlyhá s chybou kvóty
**Riešenia:**
```bash
# Skontrolujte aktuálne kvóty
az cognitiveservices usage list --location eastus

# Požiadajte o zvýšenie kvóty alebo skúste iný región
azd env set AZURE_LOCATION westus2
azd up
```

#### Problém 2: Model nie je dostupný v regióne
**Príznaky:** AI odpovede zlyhávajú alebo sú chyby pri nasadzovaní modelu
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
# Skontrolovať priradenia rolí
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Pridať chýbajúce role
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problémy s výkonom

#### Problém 4: Pomalé AI odpovede
**Kroky vyšetrovania:**
1. Skontrolujte Application Insights pre metriky výkonu
2. Preskúmajte metriky služby OpenAI v Azure porte
3. Overte sieťovú konektivitu a latenciu

**Riešenia:**
- Implementujte cache pre časté dopyty
- Použite vhodný OpenAI model pre váš prípad použitia
- Zvážte read repliky pre scenáre s vysokým zaťažením

### **Lab cvičenie 6.1: Ladiaca výzva**

**Scenár**: Nasadenie bolo úspešné, ale aplikácia vracia chyby 500.

**Úlohy pri ladení:**
1. Skontrolujte logy aplikácie
2. Overte konektivitu služieb
3. Otestujte autentifikáciu
4. Preskúmajte konfiguráciu

**Nástroje na použitie:**
- `azd show` pre prehľad nasadenia
- Azure portál pre detailné logy služieb
- Application Insights pre telemetriu aplikácie

## Modul 7: Monitorovanie a optimalizácia

### Krok 7.1: Nastavte komplexné monitorovanie

1. **Vytvorte vlastné dashboardy:**

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

2. **Zaviesť kontroly nákladov:**
- Nastavte upozornenia na rozpočet
- Použite autoscaling politiky
- Implementujte cache požiadaviek
- Sledujte využitie tokenov pre OpenAI

### **Lab cvičenie 7.1: Optimalizácia výkonu**

**Úloha**: Optimalizujte vašu AI aplikáciu z hľadiska výkonu aj nákladov.

**Metriky na zlepšenie:**
- Znížiť priemerný čas odpovede o 20%
- Znížiť mesačné náklady o 15%
- Udržať 99.9% dostupnosť

**Stratégie na vyskúšanie:**
- Implementujte response caching
- Optimalizujte prompty pre efektívnosť tokenov
- Použite vhodné compute SKU
- Nastavte správne autoscaling

## Záverečná výzva: End-to-End implementácia

### Scenár výzvy

Vašou úlohou je vytvoriť produkčný AI chatbot pre zákaznícku podporu s týmito požiadavkami:

**Funkčné požiadavky:**
- Webové rozhranie pre interakcie so zákazníkmi
- Integrácia s Microsoft Foundry Models pre odpovede
- Vyhľadávanie dokumentov pomocou Cognitive Search
- Integrácia s existujúcou databázou zákazníkov
- Podpora viacerých jazykov

**Nefunkčné požiadavky:**
- Zvládnuť 1000 súbežných používateľov
- 99.9% SLA dostupnosť
- SOC 2 súlad
- Náklady do 500 $/mesiac
- Nasadenie do viacerých prostredí (dev, staging, prod)

### Kroky implementácie

1. **Návrh architektúry**
2. **Vytvorenie AZD šablóny**
3. **Implementácia bezpečnostných opatrení**
4. **Nastavenie monitorovania a alertovania**
5. **Vytvorenie pipeline pre nasadzovanie**
6. **Zdokumentovanie riešenia**

### Kritériá hodnotenia

- ✅ **Funkčnosť**: Spĺňa všetky požiadavky?
- ✅ **Bezpečnosť**: Sú implementované najlepšie postupy?
- ✅ **Škálovateľnosť**: Zvládne požadované zaťaženie?
- ✅ **Udržiavateľnosť**: Je kód a infraštruktúra dobre zorganizovaná?
- ✅ **Náklady**: Je v stanovenom rozpočte?

## Ďalšie zdroje

### Dokumentácia Microsoftu
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentácia služby Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentácia Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Ukážkové šablóny
- [Chat aplikácia Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Rýchly štart OpenAI chat aplikácie](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Komunitné zdroje
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certifikát o absolvovaní

Gratulujeme! Dokončili ste AI Workshop Lab. Mali by ste teraz byť schopní:
- ✅ Previesť existujúce AI aplikácie na šablóny AZD
- ✅ Nasadiť produkčne pripravené AI aplikácie
- ✅ Implementovať osvedčené bezpečnostné postupy pre AI pracovné zaťaženia
- ✅ Monitorovať a optimalizovať výkon AI aplikácií
- ✅ Riešiť bežné problémy pri nasadzovaní

### Ďalšie kroky
1. Aplikujte tieto vzory do vlastných AI projektov
2. Prispievajte šablóny späť komunite
3. Pridajte sa na Microsoft Foundry Discord pre priebežnú podporu
4. Preskúmajte pokročilé témy, napríklad nasadenia do viacerých regiónov

---

**Spätná väzba k workshopu**: Pomôžte nám zlepšiť tento workshop tým, že sa podelíte o svoje skúsenosti v [kanáli Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj zameraný na AI
- **⬅️ Predchádzajúca**: [Nasadenie AI modelu](ai-model-deployment.md)
- **➡️ Nasledujúca**: [Najlepšie postupy pre produkčné AI](production-ai-practices.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

**Potrebujete pomoc?** Pridajte sa k našej komunite pre podporu a diskusie o AZD a nasadeniach AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vylúčenie zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, berte prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu nenesieme zodpovednosť.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# AI Workshop Lab: Vytvorenie AI riešení pripravených na nasadenie pomocou AZD

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Predchádzajúca**: [Nasadenie AI modelu](ai-model-deployment.md)
- **➡️ Nasledujúca**: [Najlepšie postupy pre produkčné AI](production-ai-practices.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 3: Konfigurácia](../getting-started/configuration.md)

## Prehľad workshopu

Tento praktický workshop prevedie vývojárov procesom použitia existujúcej AI šablóny a jej nasadenia pomocou Azure Developer CLI (AZD). Naučíte sa základné vzory pre produkčné nasadenie AI pomocou služieb Microsoft Foundry.

**Trvanie:** 2-3 hodiny  
**Úroveň:** Stredne pokročilý  
**Predpoklady:** Základné znalosti Azure, oboznámenie sa s konceptmi AI/ML

## 🎓 Ciele učenia

Na konci tohto workshopu budete schopní:
- ✅ Konvertovať existujúcu AI aplikáciu na použitie AZD šablón
- ✅ Konfigurovať služby Microsoft Foundry pomocou AZD
- ✅ Implementovať bezpečné spravovanie poverení pre AI služby
- ✅ Nasadiť produkčne pripravené AI aplikácie s monitorovaním
- ✅ Riešiť bežné problémy pri nasadení AI

## Predpoklady

### Potrebné nástroje
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nainštalovaný
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nainštalovaný
- [Git](https://git-scm.com/) nainštalovaný
- Editor kódu (odporúča sa VS Code)

### Azure zdroje
- Azure predplatné s prístupom prispievateľa
- Prístup k službám Azure OpenAI (alebo možnosť požiadať o prístup)
- Povolenia na vytváranie skupín zdrojov

### Znalostné predpoklady
- Základné pochopenie služieb Azure
- Oboznámenie sa s rozhraniami príkazového riadku
- Základné koncepty AI/ML (API, modely, výzvy)

## Nastavenie laboratória

### Krok 1: Príprava prostredia

1. **Overte inštaláciu nástrojov:**
```bash
# Skontrolujte inštaláciu AZD
azd version

# Skontrolujte Azure CLI
az --version

# Prihláste sa do Azure
az login
azd auth login
```

2. **Naklonujte repozitár workshopu:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Porozumenie štruktúre AZD pre AI aplikácie

### Anatómia AI šablóny pripravené na AZD

Preskúmajte kľúčové súbory v šablóne pripravené na AI:

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

### **Cvičenie 1.1: Preskúmajte konfiguráciu**

1. **Preskúmajte súbor azure.yaml:**
```bash
cat azure.yaml
```

**Na čo sa zamerať:**
- Definície služieb pre AI komponenty
- Mapovanie premenných prostredia
- Konfigurácie hostiteľa

2. **Preskúmajte infraštruktúru main.bicep:**
```bash
cat infra/main.bicep
```

**Kľúčové AI vzory na identifikáciu:**
- Zriadenie služby Azure OpenAI
- Integrácia Cognitive Search
- Bezpečné spravovanie kľúčov
- Konfigurácie sieťovej bezpečnosti

### **Diskusný bod:** Prečo sú tieto vzory dôležité pre AI

- **Závislosti služieb**: AI aplikácie často vyžadujú koordinované služby
- **Bezpečnosť**: API kľúče a koncové body potrebujú bezpečné spravovanie
- **Škálovateľnosť**: AI pracovné zaťaženia majú jedinečné požiadavky na škálovanie
- **Správa nákladov**: AI služby môžu byť drahé, ak nie sú správne nakonfigurované

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

1. **Nasadenie pomocou AZD:**
```bash
azd up
```

**Čo sa deje počas `azd up`:**
- ✅ Zriadi službu Azure OpenAI
- ✅ Vytvorí službu Cognitive Search
- ✅ Nastaví App Service pre webovú aplikáciu
- ✅ Konfiguruje sieťovanie a bezpečnosť
- ✅ Nasadí aplikačný kód
- ✅ Nastaví monitorovanie a logovanie

2. **Monitorujte priebeh nasadenia** a zaznamenajte vytvorené zdroje.

### Krok 2.3: Overte svoje nasadenie

1. **Skontrolujte nasadené zdroje:**
```bash
azd show
```

2. **Otvorte nasadenú aplikáciu:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Otestujte funkčnosť AI:**
   - Prejdite na webovú aplikáciu
   - Vyskúšajte ukážkové dotazy
   - Overte, či AI odpovede fungujú

### **Cvičenie 2.1: Prax riešenia problémov**

**Scenár**: Vaše nasadenie bolo úspešné, ale AI nereaguje.

**Bežné problémy na kontrolu:**
1. **OpenAI API kľúče**: Overte, či sú správne nastavené
2. **Dostupnosť modelu**: Skontrolujte, či váš región podporuje model
3. **Sieťová konektivita**: Uistite sa, že služby môžu komunikovať
4. **RBAC povolenia**: Overte, či aplikácia má prístup k OpenAI

**Príkazy na ladenie:**
```bash
# Skontrolujte premenné prostredia
azd env get-values

# Zobraziť denníky nasadenia
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Skontrolujte stav nasadenia OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prispôsobenie AI aplikácií vašim potrebám

### Krok 3.1: Úprava konfigurácie AI

1. **Aktualizujte model OpenAI:**
```bash
# Zmeniť na iný model (ak je dostupný vo vašom regióne)
azd env set AZURE_OPENAI_MODEL gpt-4

# Znovu nasadiť s novou konfiguráciou
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

**Najlepšia prax**: Rôzne konfigurácie pre vývoj vs produkciu.

1. **Vytvorte produkčné prostredie:**
```bash
azd env new myai-production
```

2. **Nastavte parametre špecifické pre produkciu:**
```bash
# Produkcia zvyčajne používa vyššie SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Povoliť ďalšie bezpečnostné funkcie
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Cvičenie 3.1: Optimalizácia nákladov**

**Výzva**: Nakonfigurujte šablónu pre nákladovo efektívny vývoj.

**Úlohy:**
1. Identifikujte, ktoré SKU môžu byť nastavené na bezplatné/základné úrovne
2. Nakonfigurujte premenné prostredia pre minimálne náklady
3. Nasadte a porovnajte náklady s produkčnou konfiguráciou

**Tipy na riešenie:**
- Použite F0 (bezplatnú) úroveň pre Cognitive Services, ak je to možné
- Použite základnú úroveň pre Search Service vo vývoji
- Zvážte použitie Consumption plánu pre Functions

## Modul 4: Bezpečnosť a najlepšie postupy pre produkciu

### Krok 4.1: Bezpečné spravovanie poverení

**Aktuálna výzva**: Mnohé AI aplikácie majú pevne zakódované API kľúče alebo používajú nebezpečné úložisko.

**Riešenie AZD**: Integrácia Managed Identity + Key Vault.

1. **Preskúmajte bezpečnostnú konfiguráciu vo vašej šablóne:**
```bash
# Vyhľadajte konfiguráciu Key Vault a Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Overte, že Managed Identity funguje:**
```bash
# Skontrolujte, či má webová aplikácia správnu konfiguráciu identity
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Sieťová bezpečnosť

1. **Povoľte privátne koncové body** (ak ešte nie sú nakonfigurované):

Pridajte do svojej bicep šablóny:
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

1. **Konfigurujte Application Insights:**
```bash
# Aplikácia Insights by mala byť automaticky nakonfigurovaná
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

### **Cvičenie 4.1: Bezpečnostný audit**

**Úloha**: Preskúmajte svoje nasadenie z hľadiska najlepších bezpečnostných postupov.

**Kontrolný zoznam:**
- [ ] Žiadne pevne zakódované tajomstvá v kóde alebo konfigurácii
- [ ] Použitá Managed Identity pre autentifikáciu medzi službami
- [ ] Key Vault uchováva citlivú konfiguráciu
- [ ] Prístup k sieti je správne obmedzený
- [ ] Monitorovanie a logovanie sú povolené

## Modul 5: Konverzia vlastnej AI aplikácie

### Krok 5.1: Hodnotiaci pracovný list

**Pred konverziou vašej aplikácie** odpovedzte na tieto otázky:

1. **Architektúra aplikácie:**
   - Aké AI služby vaša aplikácia používa?
   - Aké výpočtové zdroje potrebuje?
   - Vyžaduje databázu?
   - Aké sú závislosti medzi službami?

2. **Požiadavky na bezpečnosť:**
   - Aké citlivé údaje vaša aplikácia spracováva?
   - Aké požiadavky na súlad máte?
   - Potrebujete privátne sieťovanie?

3. **Požiadavky na škálovanie:**
   - Aké je vaše očakávané zaťaženie?
   - Potrebujete automatické škálovanie?
   - Existujú regionálne požiadavky?

### Krok 5.2: Vytvorte svoju AZD šablónu

**Postupujte podľa tohto vzoru na konverziu vašej aplikácie:**

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

### **Cvičenie 5.1: Výzva na vytvorenie šablóny**

**Výzva**: Vytvorte AZD šablónu pre aplikáciu na spracovanie dokumentov pomocou AI.

**Požiadavky:**
- Azure OpenAI pre analýzu obsahu
- Document Intelligence pre OCR
- Úložný účet pre nahrávanie dokumentov
- Function App pre spracovanie logiky
- Webová aplikácia pre používateľské rozhranie

**Bonusové body:**
- Pridajte správne spracovanie chýb
- Zahrňte odhad nákladov
- Nastavte monitorovacie panely

## Modul 6: Riešenie bežných problémov

### Bežné problémy pri nasadení

#### Problém 1: Prekročenie kvóty služby OpenAI
**Príznaky:** Nasadenie zlyhá s chybou kvóty
**Riešenia:**
```bash
# Skontrolujte aktuálne kvóty
az cognitiveservices usage list --location eastus

# Požiadajte o zvýšenie kvóty alebo skúste inú oblasť
azd env set AZURE_LOCATION westus2
azd up
```

#### Problém 2: Model nie je dostupný v regióne
**Príznaky:** AI odpovede zlyhajú alebo chyby pri nasadení modelu
**Riešenia:**
```bash
# Skontrolujte dostupnosť modelu podľa regiónu
az cognitiveservices model list --location eastus

# Aktualizujte na dostupný model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problém 3: Problémy s povoleniami
**Príznaky:** Chyby 403 Forbidden pri volaní AI služieb
**Riešenia:**
```bash
# Skontrolovať priradenie rolí
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Pridať chýbajúce roly
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problémy s výkonom

#### Problém 4: Pomalé AI odpovede
**Kroky vyšetrovania:**
1. Skontrolujte metriky výkonu v Application Insights
2. Preskúmajte metriky služby OpenAI v Azure portáli
3. Overte sieťovú konektivitu a latenciu

**Riešenia:**
- Implementujte cache pre bežné dotazy
- Použite vhodný model OpenAI pre váš prípad použitia
- Zvážte repliky na čítanie pre scenáre s vysokým zaťažením

### **Cvičenie 6.1: Výzva na ladenie**

**Scenár**: Vaše nasadenie bolo úspešné, ale aplikácia vracia chyby 500.

**Úlohy ladenia:**
1. Skontrolujte logy aplikácie
2. Overte konektivitu služieb
3. Otestujte autentifikáciu
4. Preskúmajte konfiguráciu

**Nástroje na použitie:**
- `azd show` pre prehľad nasadenia
- Azure portál pre podrobné logy služieb
- Application Insights pre telemetriu aplikácie

## Modul 7: Monitorovanie a optimalizácia

### Krok 7.1: Nastavte komplexné monitorovanie

1. **Vytvorte vlastné panely:**

Prejdite na Azure portál a vytvorte panel s:
- Počtom požiadaviek a latenciou OpenAI
- Mierou chýb aplikácie
- Využitím zdrojov
- Sledovaním nákladov

2. **Nastavte upozornenia:**
```bash
# Upozornenie na vysokú mieru chýb
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

2. **Implementujte kontrolu nákladov:**
- Nastavte upozornenia na rozpočet
- Použite politiky automatického škálovania
- Implementujte cache požiadaviek
- Monitorujte používanie tokenov pre OpenAI

### **Cvičenie 7.1: Optimalizácia výkonu**

**Úloha**: Optimalizujte svoju AI aplikáciu pre výkon aj náklady.

**Metriky na zlepšenie:**
- Znížte priemerný čas odpovede o 20 %
- Znížte mesačné náklady o 15 %
- Udržujte dostupnosť na úrovni 99,9 %

**Stratégie na vyskúšanie:**
- Implementujte cache odpovedí
- Optimalizujte výzvy pre efektivitu tokenov
- Použite vhodné SKU pre výpočty
- Nastavte správne automatické škálovanie

## Záverečná výzva: Implementácia od začiatku do konca

### Scenár výzvy

Vašou úlohou je vytvoriť produkčne pripravený AI chatbot pre zákaznícky servis s týmito požiadavkami:

**Funkčné požiadavky:**
- Webové rozhranie pre interakcie so zákazníkmi
- Integrácia s Azure OpenAI pre odpovede
- Schopnosť vyhľadávať dokumenty pomocou Cognitive Search
- Integrácia s existujúcou databázou zákazníkov
- Podpora viacerých jazykov

**Nefunkčné požiadavky:**
- Spracovanie 1000 súčasných používateľov
- SLA dostupnosti 99,9 %
- Súlad so SOC 2
- Náklady pod 500 USD/mesiac
- Nasadenie do viacerých prostredí (vývoj, staging, produkcia)

### Kroky implementácie

1. **Navrhnite architektúru**
2. **Vytvorte AZD šablónu**
3. **Implementujte bezpečnostné opatrenia**
4. **Nastavte monitorovanie a upozornenia**
5. **Vytvorte nasadzovacie pipeline**
6. **Zdokumentujte riešenie**

### Kritériá hodnotenia

- ✅ **Funkčnosť**: Spĺňa všetky požiadavky?
- ✅ **Bezpečnosť**: Sú implementované najlepšie postupy?
- ✅ **Škálovateľnosť**: Dokáže zvládnuť zaťaženie?
- ✅ **Udržiavateľnosť**: Je kód a infraštruktúra dobre organizovaná?
- ✅ **Náklady**: Zostáva v rámci rozpočtu?

## Dodatočné zdroje

### Dokumentácia Microsoftu
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentácia služby Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentácia Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Ukážkové šablóny
- [Azure OpenAI Chat App](https://github.com/Azure-S
Gratulujeme! Dokončili ste AI Workshop Lab. Teraz by ste mali byť schopní:

- ✅ Konvertovať existujúce AI aplikácie na AZD šablóny
- ✅ Nasadiť AI aplikácie pripravené na produkciu
- ✅ Implementovať najlepšie bezpečnostné postupy pre AI pracovné zaťaženie
- ✅ Monitorovať a optimalizovať výkon AI aplikácií
- ✅ Riešiť bežné problémy pri nasadzovaní

### Ďalšie kroky
1. Použite tieto vzory vo svojich vlastných AI projektoch
2. Prispievajte šablónami späť do komunity
3. Pripojte sa k Microsoft Foundry Discord pre priebežnú podporu
4. Preskúmajte pokročilé témy, ako sú nasadenia vo viacerých regiónoch

---

**Spätná väzba k workshopu**: Pomôžte nám zlepšiť tento workshop tým, že sa podelíte o svoje skúsenosti v [Microsoft Foundry Discord #Azure kanáli](https://discord.gg/microsoft-azure).

---

**Navigácia kapitolami:**
- **📚 Domov kurzu**: [AZD Pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - AI-First Development
- **⬅️ Predchádzajúca**: [Nasadenie AI modelu](ai-model-deployment.md)
- **➡️ Ďalšia**: [Najlepšie postupy pre produkčné AI](production-ai-practices.md)
- **🚀 Ďalšia kapitola**: [Kapitola 3: Konfigurácia](../getting-started/configuration.md)

**Potrebujete pomoc?** Pripojte sa k našej komunite pre podporu a diskusie o AZD a AI nasadeniach.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
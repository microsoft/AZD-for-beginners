# AI Workshop Lab: Ako spraviť vaše AI riešenia nasaditeľné pomocou AZD

**Navigácia kapitolami:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj s dôrazom na AI
- **⬅️ Predchádzajúca**: [Nasadenie AI modelu](ai-model-deployment.md)
- **➡️ Nasledujúca**: [Osvedčené postupy pre produkčné AI](production-ai-practices.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

## Prehľad workshopu

Tento praktický workshop sprevádza vývojárov procesom použitia existujúcej AI šablóny a nasadenia pomocou Azure Developer CLI (AZD). Naučíte sa základné vzory pre produkčné AI nasadenia pomocou služieb Microsoft Foundry.

> **Poznámka k validácii (2026-03-25):** Tento workshop bol overený na `azd` verzii `1.23.12`. Ak máte lokálnu inštaláciu staršiu, aktualizujte AZD pred začatím, aby workflow overenia, šablón a nasadenia zodpovedal nižšie uvedeným krokom.

**Dĺžka:** 2-3 hodiny  
**Úroveň:** Stredne pokročilí  
**Predpoklady:** Základné znalosti Azure, znalosť konceptov AI/ML

## 🎓 Výukové ciele

Na konci tohto workshopu budete schopní:
- ✅ Konvertovať existujúcu AI aplikáciu na použitie AZD šablón
- ✅ Konfigurovať služby Microsoft Foundry pomocou AZD
- ✅ Implementovať bezpečnú správu prihlasovacích údajov pre AI služby
- ✅ Nasadiť produkčné AI aplikácie s monitorovaním
- ✅ Riešiť bežné problémy pri nasadzovaní AI

## Predpoklady

### Požadované nástroje
- Nainštalovaný [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Nainštalovaný [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Nainštalovaný [Git](https://git-scm.com/)
- Editor kódu (odporúčaný VS Code)

### Azure zdroje
- Azure predplatné s právom prispievateľa
- Prístup k službám Microsoft Foundry Models (alebo možnosť požiadať o prístup)
- Práva na vytváranie skupiny zdrojov

### Potrebné znalosti
- Základné porozumenie Azure službám
- Znalosť príkazového riadku
- Základy AI/ML konceptov (API, modely, prompt)

## Nastavenie laboratória

### Krok 1: Príprava prostredia

1. **Overenie inštalácie nástrojov:**
```bash
# Skontrolujte inštaláciu AZD
azd version

# Skontrolujte Azure CLI
az --version

# Prihláste sa do Azure pre workflow AZD
azd auth login

# Prihláste sa do Azure CLI iba, ak plánujete spúšťať príkazy az počas diagnostiky
az login
```

Ak pracujete v rôznych tenantoch alebo vaše predplatné nie je automaticky detekované, skúste prihlásenie pomocou `azd auth login --tenant-id <tenant-id>`.

2. **Klonovanie repozitára workshopu:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Porozumenie štruktúre AZD pre AI aplikácie

### Anatomia AI AZD šablóny

Preskúmajte kľúčové súbory v AZD šablóne pripravené pre AI:

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

### **Cvičenie 1.1: Preskúmajte konfiguráciu**

1. **Preskúmajte súbor azure.yaml:**
```bash
cat azure.yaml
```

**Na čo sa zamerať:**
- Definície služieb pre AI komponenty
- Priradenie premenných prostredia
- Konfigurácie hostiteľa

2. **Prejdite infraštruktúru v main.bicep:**
```bash
cat infra/main.bicep
```

**Kľúčové AI vzory na identifikáciu:**
- Provisioning služby Microsoft Foundry Models
- Integrácia Cognitive Search
- Bezpečná správa kľúčov
- Konfigurácie bezpečnosti siete

### **Diskusný bod:** Prečo sú tieto vzory dôležité pre AI

- **Závislosti služieb**: AI aplikácie často vyžadujú koordinované služby
- **Bezpečnosť**: API kľúče a koncové body treba bezpečne spravovať
- **Škálovateľnosť**: AI záťaže majú špecifické požiadavky na škálovanie
- **Manažment nákladov**: AI služby môžu byť nákladné, ak nie sú správne nakonfigurované

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

# Nepovinné: Nastavte konkrétny model OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Krok 2.2: Nasadenie infraštruktúry a aplikácie

1. **Nasadte pomocou AZD:**
```bash
azd up
```

**Čo sa deje počas `azd up`:**
- ✅ Provisionuje službu Microsoft Foundry Models
- ✅ Vytvára službu Cognitive Search
- ✅ Nastavuje App Service pre webovú aplikáciu
- ✅ Konfiguruje sieťovanie a bezpečnosť
- ✅ Nasadzuje kód aplikácie
- ✅ Nastavuje monitorovanie a protokolovanie

2. **Sledujte priebeh nasadenia** a zaznamenajte vytvárané zdroje.

### Krok 2.3: Overte svoje nasadenie

1. **Skontrolujte nasadené zdroje:**
```bash
azd show
```

2. **Otvorte nasadenú aplikáciu:**
```bash
azd show
```

Otvorte webový koncový bod zobrazený vo výstupe `azd show`.

3. **Otestujte AI funkčnosť:**
   - Prejdite do webovej aplikácie
   - Vyskúšajte ukážkové dopyty
   - Overte, že AI odpovede fungujú

### **Cvičenie 2.1: Praktika riešenia problémov**

**Scenár**: Nasadenie prebehlo, ale AI neodpovedá.

**Bežné problémy na kontrolu:**
1. **OpenAI API kľúče**: Overte správne nastavenie
2. **Dostupnosť modelu**: Skontrolujte, či váš región podporuje model
3. **Sieťová konektivita**: Zabezpečte, aby služby mohli komunikovať
4. **RBAC práva**: Overte, či aplikácia má prístup k OpenAI

**Príkazy na ladenie:**
```bash
# Skontrolujte premenné prostredia
azd env get-values

# Prezrite si denníky nasadenia
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Skontrolujte stav nasadenia OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Prispôsobenie AI aplikácií podľa vašich potrieb

### Krok 3.1: Úprava AI konfigurácie

1. **Aktualizujte OpenAI model:**
```bash
# Prepnúť na iný model (ak je dostupný vo vašom regióne)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Nasadiť znova s novou konfiguráciou
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

**Najlepší postup:** Rozdielne konfigurácie pre vývoj a produkciu.

1. **Vytvorte produkčné prostredie:**
```bash
azd env new myai-production
```

2. **Nastavte produkčné parametre:**
```bash
# Produkcia zvyčajne používa vyššie SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Povoliť ďalšie bezpečnostné funkcie
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Cvičenie 3.1: Optimalizácia nákladov**

**Výzva:** Nakonfigurujte šablónu na nákladovo efektívny vývoj.

**Úlohy:**
1. Identifikujte SKU, ktoré môžu byť nastavené na free/basic úroveň
2. Nakonfigurujte premenné prostredia pre minimálne náklady
3. Nasadte a porovnajte náklady s produkčnou konfiguráciou

**Tipy na riešenie:**
- Použite F0 (zdarma) úroveň pre Cognitive Services, keď je to možné
- Použite Basic úroveň pre Search Service vo vývoji
- Zvážte použitie Consumption plánu pre Functions

## Modul 4: Bezpečnosť a osvedčené produkčné postupy

### Krok 4.1: Bezpečná správa prihlasovacích údajov

**Aktuálny problém:** Mnohé AI aplikácie majú API kľúče natvrdo zakódované alebo používajú nezabezpečené úložiská.

**AZD riešenie:** Managed Identity + integrácia s Key Vault.

1. **Preskúmajte bezpečnostnú konfiguráciu vo vašej šablóne:**
```bash
# Hľadajte konfiguráciu Key Vault a riadenej identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Overte, že Managed Identity funguje:**
```bash
# Skontrolujte, či má webová aplikácia správnu konfiguráciu identity
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Sieťová bezpečnosť

1. **Povoľte privátne koncové body** (ak ešte nie sú nakonfigurované):

Pridajte do bicep šablóny:
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
# Skontrolujte nastavenie:
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

### **Cvičenie 4.1: Audit bezpečnosti**

**Úloha:** Prezrite vaše nasadenie z hľadiska bezpečnostných osvedčených postupov.

**Kontrolný zoznam:**
- [ ] Žiadne natvrdo zakódované tajomstvá v kóde alebo konfigurácii
- [ ] Použitie Managed Identity pre autentifikáciu služba-na-službu
- [ ] Key Vault uchováva citlivé konfigurácie
- [ ] Prístup do siete je správne obmedzený
- [ ] Monitorovanie a protokolovanie sú nastavené

## Modul 5: Konverzia vlastnej AI aplikácie

### Krok 5.1: Hodnotiaci pracovný list

**Pred konverziou vašej aplikácie** odpovedzte na tieto otázky:

1. **Architektúra aplikácie:**
   - Aké AI služby vaša aplikácia využíva?
   - Aké výpočtové zdroje potrebuje?
   - Potrebuje databázu?
   - Aké sú závislosti medzi službami?

2. **Bezpečnostné požiadavky:**
   - Aké citlivé dáta aplikácia spracováva?
   - Aké požiadavky na súlad máte?
   - Potrebujete privátnu sieť?

3. **Požiadavky na škálovanie:**
   - Aká je vaša očakávaná záťaž?
   - Potrebujete automatické škálovanie?
   - Sú regionálne požiadavky?

### Krok 5.2: Vytvorte vašu AZD šablónu

**Nasledujte tento vzor na konverziu aplikácie:**

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

**infra/main.bicep** - hlavná šablóna:
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

### **Cvičenie 5.1: Výzva na tvorbu šablóny**

**Výzva:** Vytvorte AZD šablónu pre AI aplikáciu na spracovanie dokumentov.

**Požiadavky:**
- Microsoft Foundry Models na analýzu obsahu
- Document Intelligence na OCR
- Storage Account na nahrávanie dokumentov
- Function App na spracovateľskú logiku
- Webová aplikácia pre užívateľské rozhranie

**Bonusové body:**
- Pridajte správne ošetrovanie chýb
- Zahŕňajte odhad nákladov
- Nastavte monitorovacie panely

## Modul 6: Riešenie bežných problémov

### Bežné problémy pri nasadení

#### Problém 1: Prekročený limit služby OpenAI
**Príznaky:** Nasadenie zlyhá s chybou limitu
**Riešenia:**
```bash
# Skontrolujte aktuálne limity
az cognitiveservices usage list --location eastus

# Požiadajte o zvýšenie limitu alebo vyskúšajte iný región
azd env set AZURE_LOCATION westus2
azd up
```

#### Problém 2: Model nie je dostupný v regióne
**Príznaky:** AI odpovede zlyhávajú alebo chyba pri nasadení modelu
**Riešenia:**
```bash
# Skontrolujte dostupnosť modelu podľa regiónu
az cognitiveservices model list --location eastus

# Aktualizovať na dostupný model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problém 3: Problémy s oprávneniami
**Príznaky:** 403 Forbidden chyby pri volaní AI služieb
**Riešenia:**
```bash
# Skontrolujte priradenia rolí
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Pridajte chýbajúce roly
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problémy s výkonom

#### Problém 4: Pomalé AI odpovede
**Kroky vyšetrovania:**
1. Skontrolujte metriky výkonu v Application Insights
2. Prezrite metriky OpenAI služby v Azure portáli
3. Overte sieťovú konektivitu a latenciu

**Riešenia:**
- Implementujte cache pre bežné dopyty
- Používajte vhodný OpenAI model pre váš prípad použitia
- Zvážte čítacie repliky pre vysoké zaťaženie

### **Cvičenie 6.1: Výzva na ladenie**

**Scenár:** Nasadenie prebehlo úspešne, ale aplikácia vracia chyby 500.

**Úlohy na ladenie:**
1. Skontrolujte aplikačné logy
2. Overte konektivitu služieb
3. Otestujte autentifikáciu
4. Prezrite konfiguráciu

**Použiteľné nástroje:**
- `azd show` pre prehľad nasadenia
- Azure portál pre detailné logy služieb
- Application Insights pre telemetriu aplikácie

## Modul 7: Monitorovanie a optimalizácia

### Krok 7.1: Nastavte komplexné monitorovanie

1. **Vytvorte vlastné panely:**

Prejdite do Azure portálu a vytvorte panel s:
- Počet požiadaviek a latencia OpenAI
- Miera chýb aplikácie
- Využitie zdrojov
- Sledovanie nákladov

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
- Používajte autoscaling
- Implementujte cache požiadaviek
- Monitorujte využívanie tokenov pre OpenAI

### **Cvičenie 7.1: Optimalizácia výkonu**

**Úloha:** Optimalizujte vašu AI aplikáciu pre výkon aj náklady.

**Metriky na zlepšenie:**
- Zníženie priemerného času odozvy o 20%
- Zníženie mesačných nákladov o 15%
- Udržanie dostupnosti 99,9%

**Stratégie na vyskúšanie:**
- Implementujte cache odpovedí
- Optimalizujte prompty pre efektívnosť tokenov
- Použite vhodné výpočtové SKU
- Nastavte správne autoscaling

## Záverečná výzva: End-to-End implementácia

### Scenár výzvy

Máte za úlohu vytvoriť produkčného AI chatbota pre zákaznícky servis so všetkými týmito požiadavkami:

**Funkčné požiadavky:**
- Webové rozhranie pre zákaznícke interakcie
- Integrácia s Microsoft Foundry Models pre odpovede
- Vyhľadávanie dokumentov pomocou Cognitive Search
- Integrácia s existujúcou zákazníckou databázou
- Podpora viacerých jazykov

**Ne-funkčné požiadavky:**
- Obsluha 1000 súčasných užívateľov
- 99,9% SLA dostupnosť
- SOC 2 súlad
- Náklady do 500 $/mesiac
- Nasadenie do viacerých prostredí (vývoj, staging, produkcia)

### Implementačné kroky

1. **Navrhnite architektúru**
2. **Vytvorte AZD šablónu**
3. **Implementujte bezpečnostné opatrenia**
4. **Nastavte monitorovanie a upozornenia**
5. **Vytvorte deploy pipeline**
6. **Zdokumentujte riešenie**

### Kritériá hodnotenia

- ✅ **Funkčnosť**: Spĺňa všetky požiadavky?
- ✅ **Bezpečnosť**: Sú implementované osvedčené bezpečnostné postupy?
- ✅ **Škálovateľnosť**: Zvládne požadovanú záťaž?
- ✅ **Udržiavateľnosť**: Je kód a infraštruktúra dobre organizovaná?
- ✅ **Náklady**: Zodpovedá rozpočtu?

## Ďalšie zdroje

### Dokumentácia Microsoft
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentácia Microsoft Foundry Models služby](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Dokumentácia](https://learn.microsoft.com/azure/ai-studio/)

### Ukážkové šablóny
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Zdrojová komunita
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD šablóny](https://azure.github.io/awesome-azd/)

## 🎓 Certifikát o ukončení

Gratulujeme! Úspešne ste absolvovali AI Workshop Lab. Teraz by ste mali byť schopní:

- ✅ Preklopiť existujúce AI aplikácie na AZD šablóny
- ✅ Nasadiť AI aplikácie pripravené do produkcie
- ✅ Implementovať najlepšie bezpečnostné postupy pre AI pracovné záťaže
- ✅ Monitorovať a optimalizovať výkon AI aplikácií
- ✅ Riešiť bežné problémy pri nasadzovaní

### Ďalšie kroky
1. Aplikujte tieto vzory na svoje vlastné AI projekty
2. Prispievajte šablónami späť komunite
3. Pridajte sa do Microsoft Foundry Discord pre priebežnú podporu
4. Preskúmajte pokročilé témy ako viacregionálne nasadenia

---

**Spätná väzba k workshopu**: Pomôžte nám zlepšiť tento workshop zdieľaním vašich skúseností na [Microsoft Foundry Discord #Azure kanáli](https://discord.gg/microsoft-azure).

---

**Navigácia kapitolou:**
- **📚 Domovská stránka kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj s AI na prvom mieste
- **⬅️ Predchádzajúca**: [Nasadenie AI modelu](ai-model-deployment.md)
- **➡️ Ďalšia**: [Najlepšie postupy pre produkčný AI](production-ai-practices.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

**Potrebujete pomoc?** Pridajte sa k našej komunite pre podporu a diskusie o nasadení AZD a AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zrieknutí sa zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, majte prosím na pamäti, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu nenesieme zodpovednosť.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
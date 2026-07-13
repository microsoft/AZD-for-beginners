# AI Workshop Lab: Ako spraviť vaše AI riešenia nasaditeľné pomocou AZD

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Predchádzajúca**: [Nasadenie AI modelu](ai-model-deployment.md)
- **➡️ Ďalšia**: [Najlepšie postupy produkčnej AI](production-ai-practices.md)
- **🚀 Ďalšia kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

## Prehľad workshopu

Tento praktický lab prevedie vývojárov procesom použitia existujúcej AI šablóny a jej nasadenia pomocou Azure Developer CLI (AZD). Naučíte sa základné vzory pre produkčné nasadenie AI využívajúce služby Microsoft Foundry.

> **Poznámka validácie (2026-07-13):** Tento workshop bol overený na verzii `azd` `1.27.1`. Ak máte staršiu lokálnu inštaláciu, pred začatím aktualizujte AZD, aby overovanie, šablóna a proces nasadenia zodpovedali nižšie uvedeným krokom.

**Dĺžka:** 2-3 hodiny  
**Úroveň:** Stredne pokročilý  
**Požiadavky:** Základné znalosti Azure, znalosť konceptov AI/ML

## 🎓 Ciele učenia

Po absolvovaní tohto workshopu budete schopní:
- ✅ Konvertovať existujúcu AI aplikáciu na používanie AZD šablón
- ✅ Konfigurovať Microsoft Foundry služby pomocou AZD
- ✅ Implementovať bezpečnú správu poverení pre AI služby
- ✅ Nasadiť produkčne pripravené AI aplikácie s monitorovaním
- ✅ Riešiť bežné problémy pri nasadení AI

## Požiadavky

### Potrebné nástroje
- Nainštalovaný [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Nainštalovaný [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Nainštalovaný [Git](https://git-scm.com/)
- Editor kódu (odporúča sa VS Code)

### Azure zdroje
- Azure predplatné s právami prispievateľa
- Prístup k službám Microsoft Foundry Models (alebo možnosť požiadať o prístup)
- Práva na vytvorenie resource group

### Požadované znalosti
- Základné pochopenie Azure služieb
- Znalosť práce s príkazovým riadkom
- Základy AI/ML konceptov (API, modely, prompti)

## Nastavenie labu

### Krok 1: Príprava prostredia

1. **Overte inštaláciu nástrojov:**
```bash
# Skontrolujte inštaláciu AZD
azd version

# Skontrolujte Azure CLI
az --version

# Prihláste sa do Azure pre pracovné toky AZD
azd auth login

# Prihláste sa do Azure CLI len ak plánujete vykonávať príkazy az počas diagnostiky
az login
```

Ak pracujete vo viacerých tenantoch alebo vaše predplatné nie je automaticky detekované, skúste `azd auth login --tenant-id <tenant-id>`.

2. **Stiahnite repozitár workshopu:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Porozumenie štruktúre AZD pre AI aplikácie

### Anatómia AI AZD šablóny

Preskúmajte kľúčové súbory v AI pripravenom AZD šablóne:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab úloha 1.1: Preskúmajte konfiguráciu**

1. **Skontrolujte súbor azure.yaml:**
```bash
cat azure.yaml
```

**Na čo si dávať pozor:**
- Definície služieb pre AI komponenty
- Mapovania environmentálnych premenných
- Konfigurácie hostiteľa

2. **Preskúmajte hlavnú infraštruktúru main.bicep:**
```bash
cat infra/main.bicep
```

**Kľúčové AI vzory na identifikáciu:**
- Provisioning služby Microsoft Foundry Models
- Integrácia Azure AI Search
- Bezpečná správa kľúčov
- Sieťové bezpečnostné konfigurácie

### **Diskusný bod:** Prečo sú tieto vzory dôležité pre AI

- **Závislosti služieb**: AI aplikácie často vyžadujú koordináciu viacerých služieb
- **Bezpečnosť**: API kľúče a endpointy musia byť bezpečne spravované
- **Škálovateľnosť**: AI záťaže majú špecifické požiadavky na škálovanie
- **Správa nákladov**: AI služby môžu byť drahé, ak nie sú správne nakonfigurované

## Modul 2: Nasadenie vašej prvej AI aplikácie

### Krok 2.1: Inicializácia prostredia

1. **Vytvorte nové AZD prostredie:**
```bash
azd env new myai-workshop
```

2. **Nastavte požadované parametre:**
```bash
# Nastavte svoju preferovanú oblasť Azure
azd env set AZURE_LOCATION eastus

# Voliteľné: Nastavte konkrétny model OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Krok 2.2: Nasadenie infraštruktúry a aplikácie

1. **Nasadenie pomocou AZD:**
```bash
azd up
```

**Čo sa deje počas `azd up`:**
- ✅ Provisionuje službu Microsoft Foundry Models
- ✅ Vytvára Azure AI Search službu
- ✅ Nastavuje App Service pre webovú aplikáciu
- ✅ Konfiguruje sieť a bezpečnosť
- ✅ Nasadzuje kód aplikácie
- ✅ Nastavuje monitorovanie a logovanie

2. **Sledujte priebeh nasadenia** a zaznamenajte vytvárané zdroje.

### Krok 2.3: Overenie nasadenia

1. **Skontrolujte nasadené zdroje:**
```bash
azd show
```

2. **Otvorte nasadenú aplikáciu:**
```bash
azd show
```

Otvorte webový endpoint zobrazený vo výstupe `azd show`.

3. **Otestujte funkčnosť AI:**
   - Prejdite na webovú aplikáciu
   - Vyskúšajte ukážkové otázky
   - Overte, či AI odpovede fungujú

### **Lab úloha 2.1: Praktický tréning riešenia problémov**

**Scenár**: Nasadenie prebehlo úspešne, ale AI neodpovedá.

**Bežné problémy na kontrolu:**
1. **OpenAI API kľúče**: Overte, či sú správne nastavené
2. **Dostupnosť modelu**: Skontrolujte, či váš región model podporuje
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

## Modul 3: Prispôsobovanie AI aplikácií podľa vašich potrieb

### Krok 3.1: Úprava AI konfigurácie

1. **Aktualizujte OpenAI model:**
```bash
# Zmeňte na iný model (ak je dostupný vo vašom regióne)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Znovu nasadiť s novou konfiguráciou
azd deploy
```

2. **Pridajte ďalšie AI služby:**

Upravte `infra/main.bicep` pre pridanie Document Intelligence:

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

**Najlepšia prax**: Rôzne konfigurácie pre vývoj a produkciu.

1. **Vytvorte produkčné prostredie:**
```bash
azd env new myai-production
```

2. **Nastavte produkčné parametre:**
```bash
# Výroba zvyčajne používa vyššie SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Povoliť dodatočné bezpečnostné funkcie
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab úloha 3.1: Optimalizácia nákladov**

**Výzva**: Konfigurujte šablónu na nákladovo efektívny vývoj.

**Úlohy:**
1. Identifikujte, ktoré SKU možno nastaviť na bezplatné/základné úrovne
2. Nastavte environmentálne premenné pre minimálne náklady
3. Nasadte a porovnajte náklady s produkčnou konfiguráciou

**Nápoveda k riešeniu:**
- Používajte F0 (bezplatnú) úroveň pre Azure AI služby kde je to možné
- Používajte základnú úroveň (Basic) pre Search Service vo vývoji
- Zvážte použitie plánu Consumption pre Functions

## Modul 4: Bezpečnosť a produkčné najlepšie praktiky

### Krok 4.1: Bezpečná správa poverení

**Súčasný problém**: Mnohé AI aplikácie tvrdokódujú API kľúče alebo používajú nezabezpečené úložiská.

**AZD riešenie**: Managed Identity + integrácia s Key Vault.

1. **Preskúmajte bezpečnostnú konfiguráciu vo vašej šablóne:**
```bash
# Vyhľadajte konfiguráciu Key Vault a spravovanej identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Overte funkčnosť Managed Identity:**
```bash
# Skontrolujte, či má webová aplikácia správnu konfiguráciu identity
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Sieťová bezpečnosť

1. **Povoľte privátne endpointy** (ak ešte nie sú nakonfigurované):

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

1. **Konfigurujte Application Insights:**
```bash
# Application Insights by sa mala automaticky nakonfigurovať
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

### **Lab úloha 4.1: Bezpečnostný audit**

**Úloha**: Preskúmajte svoje nasadenie z hľadiska bezpečnostných najlepších praktík.

**Kontrolný zoznam:**
- [ ] Žiadne tvrdokódované tajomstvá v kóde alebo konfigurácii
- [ ] Používanie Managed Identity pre overovanie služba-so-slúžbou
- [ ] Key Vault na ukladanie citlivých konfigurácií
- [ ] Sieťový prístup je správne obmedzený
- [ ] Monitorovanie a logovanie sú povolené

## Modul 5: Konverzia vašej vlastnej AI aplikácie

### Krok 5.1: Hodnotiaci dotazník

**Pred konverziou aplikácie** zodpovedzte tieto otázky:

1. **Architektúra aplikácie:**
   - Aké AI služby vaša aplikácia používa?
   - Aké výpočtové zdroje potrebuje?
   - Potrebuje databázu?
   - Aké sú závislosti medzi službami?

2. **Požiadavky na bezpečnosť:**
   - Aké citlivé údaje vaša aplikácia spracováva?
   - Aké máte požiadavky na súlad (compliance)?
   - Potrebujete privátnu sieť?

3. **Požiadavky na škálovanie:**
   - Aké zaťaženie očakávate?
   - Potrebujete auto-škálovanie?
   - Existujú regionálne požiadavky?

### Krok 5.2: Vytvorte vašu AZD šablónu

**Postupujte podľa tohto vzoru na konverziu aplikácie:**

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

### **Lab úloha 5.1: Výzva na tvorbu šablóny**

**Výzva:** Vytvorte AZD šablónu pre AI aplikáciu spracúvajúcu dokumenty.

**Požiadavky:**
- Microsoft Foundry Models na analýzu obsahu
- Document Intelligence pre OCR
- Storage Account pre nahrávanie dokumentov
- Function App pre spracovateľskú logiku
- Webová aplikácia ako používateľské rozhranie

**Bonusové body:**
- Pridajte správu chýb
- Zahrňte odhad nákladov
- Nastavte monitorovacie dashboardy

## Modul 6: Riešenie bežných problémov

### Bežné problémy pri nasadení

#### Problém 1: Prekročený kvót OpenAI služby
**Príznaky:** Nasadenie zlyháva s chybou kvóty
**Riešenia:**
```bash
# Skontrolujte aktuálne kvóty
az cognitiveservices usage list --location eastus

# Požiadajte o zvýšenie kvóty alebo skúste inú oblasť
azd env set AZURE_LOCATION westus2
azd up
```

#### Problém 2: Model nie je dostupný v regióne
**Príznaky:** AI odpovede zlyhávajú alebo chyba nasadenia modelu
**Riešenia:**
```bash
# Skontrolujte dostupnosť modelu podľa regiónu
az cognitiveservices model list --location eastus

# Aktualizovať na dostupný model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problém 3: Povolenia
**Príznaky:** Chyby 403 Forbidden pri volaniach AI služieb
**Riešenia:**
```bash
# Skontrolujte priradenie rolí
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
1. Skontrolujte Application Insights pre metriky výkonu
2. Preskúmajte metriky OpenAI služby v Azure portáli
3. Overte sieťovú konektivitu a latenciu

**Riešenia:**
- Implementujte cache pre bežné dotazy
- Použite vhodný OpenAI model pre váš prípad použitia
- Zvážte read repliku pre vysoké zaťaženie

### **Lab úloha 6.1: Výzva na ladenie**

**Scenár:** Nasadenie prebehlo úspešne, ale aplikácia vracia chyby 500.

**Úlohy pre ladenie:**
1. Skontrolujte logy aplikácie
2. Overte konektivitu služby
3. Testujte autentifikáciu
4. Preskúmajte konfiguráciu

**Nástroje na použitie:**
- `azd show` na prehľad nasadenia
- Azure portál pre podrobné logy služieb
- Application Insights na telemetriu aplikácie

## Modul 7: Monitorovanie a optimalizácia

### Krok 7.1: Nastavenie komplexného monitorovania

1. **Vytvorte vlastné dashboardy:**

Prejdite do Azure portálu a vytvorte dashboard s:
- Počtom a latenciou požiadaviek OpenAI
- Mírou chýb aplikácie
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

1. **Analyzujte súčasné náklady:**
```bash
# Použite Azure CLI na získanie údajov o nákladoch
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementujte kontrolu nákladov:**
- Nastavte rozpočtové upozornenia
- Používajte autoscaling politiky
- Implementujte cache na požiadavky
- Monitorujte použitie tokenov pre OpenAI

### **Lab úloha 7.1: Optimalizácia výkonu**

**Úloha:** Optimalizujte vašu AI aplikáciu pre výkon a náklady.

**Metriky na zlepšenie:**
- Znížiť priemerný čas odozvy o 20%
- Znížiť mesačné náklady o 15%
- Zachovať 99,9% dostupnosť

**Stratégie na vyskúšanie:**
- Implementujte cache odpovedí
- Optimalizujte prompti pre efektívnosť tokenov
- Použite vhodné výpočtové SKU
- Nastavte správne autoscaling

## Záverečná výzva: Kompletná implementácia

### Scenár výzvy

Máte za úlohu vytvoriť produkčne pripraveného AI chatbota pre zákaznícky servis s týmito požiadavkami:

**Funkčné požiadavky:**
- Webové rozhranie pre zákaznícke interakcie
- Integrácia s Microsoft Foundry Models na odpovede
- Možnosť prehľadávania dokumentov pomocou Azure AI Search
- Integrácia so existujúcou databázou zákazníkov
- Podpora viacerých jazykov

**Nefunkčné požiadavky:**
- Zvládnuť 1000 súbežných používateľov
- SLA 99,9% dostupnosť
- Súlad s normou SOC 2
- Náklady pod 500 USD mesačne
- Nasadenie do viacerých prostredí (dev, staging, prod)

### Krok implementácie

1. **Navrhnite architektúru**
2. **Vytvorte AZD šablónu**
3. **Implementujte bezpečnostné opatrenia**
4. **Nastavte monitorovanie a upozornenia**
5. **Vytvorte deploy pipeline**
6. **Zdokumentujte riešenie**

### Kritériá hodnotenia

- ✅ **Funkčnosť:** Spĺňa všetky požiadavky?
- ✅ **Bezpečnosť:** Sú implementované najlepšie praktiky?
- ✅ **Škálovateľnosť:** Zvládne požadované zaťaženie?
- ✅ **Udržiavateľnosť:** Je kód a infraštruktúra dobre organizovaná?
- ✅ **Náklady:** Zostáva v rámci rozpočtu?

## Ďalšie zdroje

### Dokumentácia Microsoft
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentácia služby Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentácia Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Ukážkové šablóny
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Komunitné zdroje
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certifikát o absolvovaní

Gratulujeme! Dokončili ste AI Workshop Lab. Teraz by ste mali byť schopní:

- ✅ Konvertovať existujúce AI aplikácie na AZD šablóny
- ✅ Nasadiť AI aplikácie pripravené na produkciu
- ✅ Implementovať najlepšie bezpečnostné praktiky pre AI pracovné záťaže
- ✅ Monitorovať a optimalizovať výkon AI aplikácií
- ✅ Riešiť bežné problémy s nasadením

### Ďalšie kroky
1. Aplikujte tieto vzory vo vlastných AI projektoch
2. Prispievajte šablónami späť do komunity
3. Pridajte sa do Microsoft Foundry Discord pre priebežnú podporu
4. Preskúmajte pokročilé témy ako nasadenia v multi-regiónoch

---

**Spätná väzba k workshopu**: Pomôžte nám zlepšiť tento workshop zdieľaním vašich skúseností na [Microsoft Foundry Discord kanáli #Azure](https://discord.gg/microsoft-azure).

---

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Súčasná kapitola**: Kapitola 2 - AI-First vývoj
- **⬅️ Predchádzajúca**: [Nasadenie AI modelu](ai-model-deployment.md)
- **➡️ Ďalšia**: [Najlepšie praktiky produkčného AI](production-ai-practices.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

**Potrebujete pomoc?** Pridajte sa do našej komunity pre podporu a diskusie o AZD a AI nasadeniach.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
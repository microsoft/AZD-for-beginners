# AI Workshop Lab: Ako urobiť vaše AI riešenia nasaditeľné pomocou AZD

**Navigácia kapitoly:**
- **📚 Domov kurzu**: [AZD For Beginners](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Predchádzajúca**: [Nasadenie AI modelu](ai-model-deployment.md)
- **➡️ Nasledujúca**: [Najlepšie postupy pre produkčné AI](production-ai-practices.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

## Prehľad workshopu

Tento praktický lab prevedie vývojárov procesom zobratie existujúcej AI šablóny a jej nasadenia pomocou Azure Developer CLI (AZD). Naučíte sa základné vzory pre produkčné nasadenia AI pomocou služieb Microsoft Foundry.

> **Poznámka overenia (2026-03-25):** Tento workshop bol kontrolovaný voči `azd` `1.23.12`. Ak je vaša lokálna inštalácia staršia, aktualizujte AZD pred začatím, aby autentifikácia, šablóna a pracovný postup nasadenia zodpovedali krokom nižšie.

**Trvanie:** 2-3 hodiny  
**Úroveň:** Stredne pokročilá  
**Predpoklady:** Základné znalosti Azure, oboznámenie sa s AI/ML pojmami

## 🎓 Ciele učenia

Na konci tohto workshopu budete vedieť:
- ✅ Konvertovať existujúcu AI aplikáciu na použitie AZD šablón
- ✅ Nakonfigurovať služby Microsoft Foundry pomocou AZD
- ✅ Implementovať bezpečné spravovanie poverení pre AI služby
- ✅ Nasadiť produkčne pripravené AI aplikácie s monitorovaním
- ✅ Riešiť bežné problémy pri nasadzovaní AI

## Predpoklady

### Požadované nástroje
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nainštalovaný
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nainštalovaný
- [Git](https://git-scm.com/) nainštalovaný
- Editor kódu (odporúčaný VS Code)

### Azure zdroje
- Predplatné Azure s prístupom prispievateľa
- Prístup k službám Microsoft Foundry Models (alebo možnosť požiadať o prístup)
- Povolenia na vytváranie skupín prostriedkov

### Požadované znalosti
- Základné znalosti služieb Azure
- Znalosť príkazového riadku
- Základné koncepty AI/ML (API, modely, prompty)

## Nastavenie laboratória

### Krok 1: Príprava prostredia

1. **Overte inštaláciu nástrojov:**
```bash
# Skontrolujte inštaláciu AZD
azd version

# Skontrolujte Azure CLI
az --version

# Prihláste sa do Azure pre pracovné postupy AZD
azd auth login

# Prihláste sa do Azure CLI iba ak plánujete počas diagnostiky spúšťať príkazy az
az login
```

Ak pracujete naprieč viacerými tenantmi alebo vaše predplatné nie je detegované automaticky, skúste znova s `azd auth login --tenant-id <tenant-id>`.

2. **Klonujte repozitár workshopu:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Pochopenie štruktúry AZD pre AI aplikácie

### Štruktúra AI AZD šablóny

Preskúmajte kľúčové súbory v AZD šablóne pripravené pre AI:

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

### **Cvičenie v laboratóriu 1.1: Preskúmajte konfiguráciu**

1. **Preskúmajte súbor azure.yaml:**
```bash
cat azure.yaml
```

**Na čo sa zamerať:**
- Definície služieb pre AI komponenty
- Mapovanie premenných prostredia
- Konfigurácie hostiteľa

2. **Prejdite si infraštruktúru main.bicep:**
```bash
cat infra/main.bicep
```

**Kľúčové AI vzory na identifikovanie:**
- Nasadzovanie služby Microsoft Foundry Models
- Integrácia Azure AI Search
- Bezpečné spravovanie kľúčov
- Konfigurácie sieťovej bezpečnosti

### **Diskusný bod:** Prečo sú tieto vzory dôležité pre AI

- **Závislosti služieb**: AI aplikácie často vyžadujú viacero koordinovaných služieb
- **Bezpečnosť**: API kľúče a koncové body potrebujú bezpečné spravovanie
- **Škálovateľnosť**: AI pracovné záťaže majú špecifické požiadavky na škálovanie
- **Riadenie nákladov**: AI služby môžu byť drahé, ak nie sú správne nakonfigurované

## Modul 2: Nasadte svoju prvú AI aplikáciu

### Krok 2.1: Inicializujte prostredie

1. **Vytvorte nové prostredie AZD:**
```bash
azd env new myai-workshop
```

2. **Nastavte požadované parametre:**
```bash
# Nastavte preferovaný región Azure
azd env set AZURE_LOCATION eastus

# Voliteľné: Nastavte konkrétny model OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Krok 2.2: Nasadenie infraštruktúry a aplikácie

1. **Nasadiť pomocou AZD:**
```bash
azd up
```

**Čo sa deje počas `azd up`:**
- ✅ Vytvorí službu Microsoft Foundry Models
- ✅ Vytvorí službu Azure AI Search
- ✅ Nastaví App Service pre webovú aplikáciu
- ✅ Konfiguruje sieť a bezpečnosť
- ✅ Nasadí kód aplikácie
- ✅ Nastaví monitorovanie a logovanie

2. **Sledujte priebeh nasadenia** a zaznamenajte vytvárané prostriedky.

### Krok 2.3: Overte svoje nasadenie

1. **Skontrolujte nasadené prostriedky:**
```bash
azd show
```

2. **Otvorte nasadenú aplikáciu:**
```bash
azd show
```

Otvorte webový koncový bod zobrazený vo výstupe `azd show`.

3. **Otestujte AI funkčnosť:**
   - Prejdite na webovú aplikáciu
   - Vyskúšajte ukážkové dopyty
   - Overte, že AI odpovede fungujú

### **Cvičenie v laboratóriu 2.1: Cvičenie riešenia problémov**

**Scenár**: Nasadenie prebehlo úspešne, ale AI neodpovedá.

**Bežné problémy na kontrolu:**
1. **OpenAI API kľúče**: Overte, či sú správne nastavené
2. **Dostupnosť modelu**: Skontrolujte, či váš región podporuje model
3. **Sieťová konektivita**: Uistite sa, že služby môžu komunikovať
4. **RBAC povolenia**: Overte, že aplikácia má prístup k OpenAI

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

### Krok 3.1: Zmeňte konfiguráciu AI

1. **Aktualizujte OpenAI model:**
```bash
# Prepnite na iný model (ak je dostupný vo vašom regióne)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Znova nasaďte s novou konfiguráciou
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

### **Cvičenie 3.1: Optimalizácia nákladov**

**Úloha**: Nakonfigurujte šablónu pre nákladovo efektívny vývoj.

**Úlohy:**
1. Identifikujte, ktoré SKU je možné nastaviť na free/basic tier
2. Nakonfigurujte premenné prostredia pre minimálne náklady
3. Nasadte a porovnajte náklady s produkčnou konfiguráciou

**Nápovedy k riešeniu:**
- Použite F0 (free) tier pre Azure AI Services, kde je to možné
- Použite Basic tier pre Search Service vo vývoji
- Zvážte použitie Consumption plánu pre Functions

## Modul 4: Bezpečnosť a osvedčené postupy pre produkciu

### Krok 4.1: Bezpečné spravovanie poverení

**Súčasný problém**: Mnoho AI aplikácií má zakódované API kľúče alebo používa nezabezpečené ukladanie.

**Riešenie AZD**: Managed Identity + integrácia Key Vault.

1. **Prejdite si bezpečnostnú konfiguráciu vo vašej šablóne:**
```bash
# Hľadajte konfiguráciu Key Vault a spravovanej identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Overte, že Managed Identity funguje:**
```bash
# Skontrolujte, či má webová aplikácia správnu konfiguráciu identity
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Sieťová bezpečnosť

1. **Povoliť súkromné koncové body** (ak nie sú už nakonfigurované):

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

### **Cvičenie 4.1: Bezpečnostný audit**

**Úloha**: Preverte svoje nasadenie podľa bezpečnostných osvedčených postupov.

**Kontrolný zoznam:**
- [ ] Žiadne zakódované tajomstvá v kóde alebo konfigurácii
- [ ] Managed Identity používaná pre autentifikáciu medzi službami
- [ ] Key Vault uchováva citlivú konfiguráciu
- [ ] Sieťový prístup je správne obmedzený
- [ ] Monitorovanie a logovanie sú povolené

## Modul 5: Konverzia vlastnej AI aplikácie

### Krok 5.1: Hodnotiaci pracovný hárok

**Pred konverziou aplikácie**, odpovedzte na tieto otázky:

1. **Architektúra aplikácie:**
   - Aké AI služby vaša aplikácia využíva?
   - Aké výpočtové prostriedky potrebuje?
   - Vyžaduje databázu?
   - Aké sú závislosti medzi službami?

2. **Požiadavky na bezpečnosť:**
   - Aké citlivé údaje vaša aplikácia spracúva?
   - Aké požiadavky na súlad (compliance) máte?
   - Potrebujete súkromné sietové prepojenie?

3. **Požiadavky na škálovanie:**
   - Aké je očakávané zaťaženie?
   - Potrebujete automatické škálovanie?
   - Sú požiadavky na regióny?

### Krok 5.2: Vytvorte svoju AZD šablónu

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

### **Cvičenie 5.1: Úloha vytvorenia šablóny**

**Úloha**: Vytvorte AZD šablónu pre AI aplikáciu na spracovanie dokumentov.

**Požiadavky:**
- Microsoft Foundry Models pre analýzu obsahu
- Document Intelligence pre OCR
- Storage Account pre nahrávanie dokumentov
- Function App pre spracovateľskú logiku
- Web app pre používateľské rozhranie

**Bonusové body:**
- Pridajte správne spracovanie chýb
- Zahrňte odhad nákladov
- Nastavte monitorovacie dashboardy

## Modul 6: Riešenie bežných problémov

### Bežné problémy nasadenia

#### Problém 1: Vyčerpaná kvóta služby OpenAI
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
**Príznaky:** Odpovede AI zlyhávajú alebo sú chyby pri nasadení modelu
**Riešenia:**
```bash
# Skontrolujte dostupnosť modelu podľa regiónu
az cognitiveservices model list --location eastus

# Aktualizujte na dostupný model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problém 3: Problémy s povoleniami
**Príznaky:** Chyby 403 Forbidden pri volaní AI služieb
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

### Výkonnostné problémy

#### Problém 4: Pomalé odpovede AI
**Kroky vyšetrovania:**
1. Skontrolujte Application Insights pre metriky výkonu
2. Prejdite metriky služby OpenAI v Azure portáli
3. Overte sieťovú konektivitu a latenciu

**Riešenia:**
- Implementujte cache pre bežné dopyty
- Použite vhodný OpenAI model pre váš prípad použitia
- Zvážte read replica riešenia pre scenáre s vysokým zaťažením

### **Cvičenie 6.1: Výzva na ladenie**

**Scenár**: Nasadenie prebehlo úspešne, ale aplikácia vracia 500 chyby.

**Úlohy na ladenie:**
1. Skontrolujte logy aplikácie
2. Overte konektivitu služieb
3. Otestujte autentifikáciu
4. Prejdite konfiguráciu

**Nástroje na použitie:**
- `azd show` pre prehľad nasadenia
- Azure portál pre podrobné logy služieb
- Application Insights pre telemetriu aplikácie

## Modul 7: Monitorovanie a optimalizácia

### Krok 7.1: Nastavte komplexné monitorovanie

1. **Vytvorte vlastné dashboardy:**

Prejdite do Azure portálu a vytvorte dashboard s:
- Počtom požiadaviek a latenciou OpenAI
- Miera chýb aplikácie
- Využitie prostriedkov
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

2. **Implementujte kontroly nákladov:**
- Nastavte upozornenia na rozpočet
- Použite autoscaling politiky
- Implementujte cache požiadaviek
- Monitorujte používanie tokenov pre OpenAI

### **Cvičenie 7.1: Optimalizácia výkonu**

**Úloha**: Optimalizujte vašu AI aplikáciu z hľadiska výkonu aj nákladov.

**Metriky na zlepšenie:**
- Znížiť priemerný čas odozvy o 20%
- Znížiť mesačné náklady o 15%
- Udržať dostupnosť 99,9%

**Stratégie na vyskúšanie:**
- Implementujte cache odpovedí
- Optimalizujte prompty pre efektívnosť tokenov
- Použite vhodné compute SKU
- Nastavte správne autoscaling

## Záverečná výzva: Kompletná implementácia

### Scenár výzvy

Máte za úlohu vytvoriť produkčne pripraveného AI chatbota pre zákaznícky servis s týmito požiadavkami:

**Funkčné požiadavky:**
- Webové rozhranie pre interakcie so zákazníkmi
- Integrácia s Microsoft Foundry Models pre generovanie odpovedí
- Možnosť vyhľadávania v dokumentoch pomocou Azure AI Search
- Integrácia s existujúcou databázou zákazníkov
- Podpora viacerých jazykov

**Nefunkčné požiadavky:**
- Zvládnuť 1000 súbežných používateľov
- SLA 99,9% dostupnosť
- Soulad SOC 2
- Náklady do $500/mesiac
- Nasadenie do viacerých prostredí (dev, staging, prod)

### Kroky implementácie

1. Navrhnite architektúru
2. Vytvorte AZD šablónu
3. Implementujte bezpečnostné opatrenia
4. Nastavte monitorovanie a upozornenia
5. Vytvorte nasadzovacie pipeline
6. Zdokumentujte riešenie

### Kritériá hodnotenia

- ✅ **Funkčnosť**: Spĺňa všetky požiadavky?
- ✅ **Bezpečnosť**: Sú implementované osvedčené postupy?
- ✅ **Škálovateľnosť**: Zvládne zaťaženie?
- ✅ **Udržateľnosť**: Je kód a infraštruktúra dobre zorganizovaná?
- ✅ **Náklady**: Drží sa v rozpočte?

## Ďalšie zdroje

### Dokumentácia Microsoftu
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentácia služby Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentácia Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Vzory šablón
- [Ukážková chat aplikácia Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Rýchly štart aplikácie OpenAI Chat](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Komunitné zdroje
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certifikát o dokončení

Gratulujeme! Dokončili ste AI Workshop Lab. Teraz by ste mali byť schopní:

- ✅ Previesť existujúce AI aplikácie na AZD šablóny
- ✅ Nasadiť AI aplikácie pripravené do produkcie
- ✅ Implementovať osvedčené bezpečnostné postupy pre AI pracovné záťaže
- ✅ Monitorovať a optimalizovať výkon AI aplikácií
- ✅ Riešiť bežné problémy pri nasadzovaní

### Ďalšie kroky
1. Aplikujte tieto vzory na vlastné AI projekty
2. Prispievajte šablóny späť komunite
3. Pridajte sa na Microsoft Foundry Discord pre priebežnú podporu
4. Preskúmajte pokročilé témy ako nasadenia v viacerých regiónoch

---

**Spätná väzba k workshopu**: Pomôžte nám vylepšiť tento workshop zdieľaním vašich skúseností v [Microsoft Foundry Discord kanáli #Azure](https://discord.gg/microsoft-azure).

---

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Predchádzajúca**: [Nasadenie AI modelu](ai-model-deployment.md)
- **➡️ Ďalšia**: [Najlepšie postupy pre produkčné AI](production-ai-practices.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

**Potrebujete pomoc?** Pridajte sa do našej komunity pre podporu a diskusie o AZD a nasadeniach AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
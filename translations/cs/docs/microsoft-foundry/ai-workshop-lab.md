# AI Workshop Lab: Jak vytvořit AI řešení připravené pro nasazení pomocí AZD

**Navigace kapitol:**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj zaměřený na AI
- **⬅️ Předchozí**: [Nasazení AI modelu](ai-model-deployment.md)
- **➡️ Další**: [Nejlepší postupy pro produkční AI](production-ai-practices.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../getting-started/configuration.md)

## Přehled workshopu

Tento praktický workshop provede vývojáře procesem převzetí existující šablony AI a jejího nasazení pomocí Azure Developer CLI (AZD). Naučíte se základní vzory pro nasazení AI v produkčním prostředí s využitím služeb Microsoft Foundry.

**Délka trvání:** 2-3 hodiny  
**Úroveň:** Středně pokročilí  
**Předpoklady:** Základní znalosti Azure, povědomí o konceptech AI/ML

## 🎓 Cíle učení

Na konci tohoto workshopu budete schopni:
- ✅ Převést existující AI aplikaci na použití šablon AZD
- ✅ Konfigurovat služby Microsoft Foundry pomocí AZD
- ✅ Implementovat bezpečnou správu přihlašovacích údajů pro AI služby
- ✅ Nasadit AI aplikace připravené pro produkci s monitoringem
- ✅ Řešit běžné problémy při nasazování AI

## Předpoklady

### Požadované nástroje
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nainstalován
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nainstalován
- [Git](https://git-scm.com/) nainstalován
- Editor kódu (doporučeno VS Code)

### Azure zdroje
- Předplatné Azure s přístupem přispěvatele
- Přístup ke službám Azure OpenAI (nebo možnost požádat o přístup)
- Oprávnění k vytváření skupin prostředků

### Znalostní předpoklady
- Základní porozumění službám Azure
- Znalost příkazového řádku
- Základní koncepty AI/ML (API, modely, promptování)

## Nastavení laboratoře

### Krok 1: Příprava prostředí

1. **Ověřte instalaci nástrojů:**
```bash
# Zkontrolujte instalaci AZD
azd version

# Zkontrolujte Azure CLI
az --version

# Přihlaste se do Azure
az login
azd auth login
```

2. **Naklonujte repozitář workshopu:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Porozumění struktuře AZD pro AI aplikace

### Anatomie šablony AZD připravené pro AI

Prozkoumejte klíčové soubory v šabloně AZD připravené pro AI:

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

### **Cvičení 1.1: Prozkoumejte konfiguraci**

1. **Prozkoumejte soubor azure.yaml:**
```bash
cat azure.yaml
```

**Na co se zaměřit:**
- Definice služeb pro AI komponenty
- Mapování proměnných prostředí
- Konfigurace hostingu

2. **Projděte si hlavní infrastrukturu main.bicep:**
```bash
cat infra/main.bicep
```

**Klíčové AI vzory k identifikaci:**
- Zajištění služby Azure OpenAI
- Integrace Cognitive Search
- Bezpečná správa klíčů
- Konfigurace síťové bezpečnosti

### **Diskusní bod:** Proč jsou tyto vzory důležité pro AI

- **Závislosti služeb**: AI aplikace často vyžadují koordinaci více služeb
- **Bezpečnost**: API klíče a koncové body potřebují bezpečnou správu
- **Škálovatelnost**: AI pracovní zátěže mají specifické požadavky na škálování
- **Správa nákladů**: AI služby mohou být drahé, pokud nejsou správně nakonfigurovány

## Modul 2: Nasazení vaší první AI aplikace

### Krok 2.1: Inicializace prostředí

1. **Vytvořte nové prostředí AZD:**
```bash
azd env new myai-workshop
```

2. **Nastavte požadované parametry:**
```bash
# Nastavte preferovaný region Azure
azd env set AZURE_LOCATION eastus

# Volitelné: Nastavte konkrétní model OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Krok 2.2: Nasazení infrastruktury a aplikace

1. **Nasazení pomocí AZD:**
```bash
azd up
```

**Co se děje během `azd up`:**
- ✅ Zajišťuje službu Azure OpenAI
- ✅ Vytváří službu Cognitive Search
- ✅ Nastavuje App Service pro webovou aplikaci
- ✅ Konfiguruje síť a bezpečnost
- ✅ Nasazuje aplikační kód
- ✅ Nastavuje monitoring a logování

2. **Sledujte průběh nasazení** a zaznamenejte si vytvářené zdroje.

### Krok 2.3: Ověření nasazení

1. **Zkontrolujte nasazené zdroje:**
```bash
azd show
```

2. **Otevřete nasazenou aplikaci:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Otestujte funkčnost AI:**
   - Přejděte na webovou aplikaci
   - Vyzkoušejte ukázkové dotazy
   - Ověřte, že AI odpovědi fungují

### **Cvičení 2.1: Procvičování řešení problémů**

**Scénář**: Vaše nasazení bylo úspěšné, ale AI nereaguje.

**Běžné problémy ke kontrole:**
1. **API klíče OpenAI**: Ověřte, že jsou správně nastaveny
2. **Dostupnost modelu**: Zkontrolujte, zda váš region podporuje model
3. **Síťová konektivita**: Ujistěte se, že služby mohou komunikovat
4. **Oprávnění RBAC**: Ověřte, že aplikace má přístup k OpenAI

**Příkazy pro ladění:**
```bash
# Zkontrolujte proměnné prostředí
azd env get-values

# Zobrazit protokoly nasazení
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Zkontrolujte stav nasazení OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Přizpůsobení AI aplikací vašim potřebám

### Krok 3.1: Úprava konfigurace AI

1. **Aktualizujte model OpenAI:**
```bash
# Změňte na jiný model (pokud je dostupný ve vašem regionu)
azd env set AZURE_OPENAI_MODEL gpt-4

# Znovu nasadit s novou konfigurací
azd deploy
```

2. **Přidejte další AI služby:**

Upravte `infra/main.bicep` pro přidání Document Intelligence:

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

### Krok 3.2: Konfigurace specifické pro prostředí

**Nejlepší praxe**: Různé konfigurace pro vývoj a produkci.

1. **Vytvořte produkční prostředí:**
```bash
azd env new myai-production
```

2. **Nastavte parametry specifické pro produkci:**
```bash
# Produkce obvykle používá vyšší SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Povolit další bezpečnostní funkce
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Cvičení 3.1: Optimalizace nákladů**

**Výzva**: Nakonfigurujte šablonu pro nákladově efektivní vývoj.

**Úkoly:**
1. Identifikujte, které SKU lze nastavit na bezplatné/základní úrovně
2. Nakonfigurujte proměnné prostředí pro minimální náklady
3. Nasazujte a porovnejte náklady s produkční konfigurací

**Tipy k řešení:**
- Použijte úroveň F0 (bezplatná) pro Cognitive Services, pokud je to možné
- Použijte základní úroveň pro Search Service ve vývoji
- Zvažte použití plánu Consumption pro Functions

## Modul 4: Bezpečnost a nejlepší postupy pro produkci

### Krok 4.1: Bezpečná správa přihlašovacích údajů

**Současná výzva**: Mnoho AI aplikací tvrdě kóduje API klíče nebo používá nezabezpečené úložiště.

**Řešení AZD**: Integrace Managed Identity + Key Vault.

1. **Projděte si bezpečnostní konfiguraci ve vaší šabloně:**
```bash
# Hledejte konfiguraci Key Vault a Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Ověřte, že Managed Identity funguje:**
```bash
# Zkontrolujte, zda má webová aplikace správnou konfiguraci identity
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Síťová bezpečnost

1. **Povolte privátní koncové body** (pokud ještě nejsou nakonfigurovány):

Přidejte do své šablony bicep:
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

### Krok 4.3: Monitoring a sledovatelnost

1. **Nakonfigurujte Application Insights:**
```bash
# Aplikace Insights by měla být automaticky nakonfigurována
# Zkontrolujte konfiguraci:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Nastavte monitoring specifický pro AI:**

Přidejte vlastní metriky pro AI operace:
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

### **Cvičení 4.1: Bezpečnostní audit**

**Úkol**: Projděte si své nasazení z hlediska bezpečnostních nejlepších postupů.

**Kontrolní seznam:**
- [ ] Žádné tvrdě kódované tajné klíče v kódu nebo konfiguraci
- [ ] Managed Identity použita pro autentizaci mezi službami
- [ ] Key Vault ukládá citlivou konfiguraci
- [ ] Síťový přístup je správně omezen
- [ ] Monitoring a logování jsou povoleny

## Modul 5: Převod vaší vlastní AI aplikace

### Krok 5.1: Hodnotící dotazník

**Před převodem vaší aplikace** odpovězte na tyto otázky:

1. **Architektura aplikace:**
   - Jaké AI služby vaše aplikace používá?
   - Jaké výpočetní zdroje potřebuje?
   - Potřebuje databázi?
   - Jaké jsou závislosti mezi službami?

2. **Požadavky na bezpečnost:**
   - Jaká citlivá data vaše aplikace zpracovává?
   - Jaké máte požadavky na shodu?
   - Potřebujete privátní síť?

3. **Požadavky na škálování:**
   - Jaké je vaše očekávané zatížení?
   - Potřebujete automatické škálování?
   - Jsou zde regionální požadavky?

### Krok 5.2: Vytvoření vaší šablony AZD

**Postupujte podle tohoto vzoru pro převod vaší aplikace:**

1. **Vytvořte základní strukturu:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializovat šablonu AZD
azd init --template minimal
```

2. **Vytvořte azure.yaml:**
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

3. **Vytvořte šablony infrastruktury:**

**infra/main.bicep** - Hlavní šablona:
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

### **Cvičení 5.1: Výzva k vytvoření šablony**

**Výzva**: Vytvořte šablonu AZD pro AI aplikaci na zpracování dokumentů.

**Požadavky:**
- Azure OpenAI pro analýzu obsahu
- Document Intelligence pro OCR
- Účet úložiště pro nahrávání dokumentů
- Function App pro zpracování logiky
- Webová aplikace pro uživatelské rozhraní

**Bonusové body:**
- Přidejte správné zpracování chyb
- Zahrňte odhad nákladů
- Nastavte monitorovací panely

## Modul 6: Řešení běžných problémů

### Běžné problémy při nasazení

#### Problém 1: Překročená kvóta služby OpenAI
**Příznaky:** Nasazení selže s chybou kvóty
**Řešení:**
```bash
# Zkontrolujte aktuální kvóty
az cognitiveservices usage list --location eastus

# Požádejte o zvýšení kvóty nebo zkuste jiný region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problém 2: Model není dostupný v regionu
**Příznaky:** AI odpovědi selhávají nebo chyby při nasazení modelu
**Řešení:**
```bash
# Zkontrolujte dostupnost modelu podle regionu
az cognitiveservices model list --location eastus

# Aktualizujte na dostupný model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problém 3: Problémy s oprávněními
**Příznaky:** Chyby 403 Forbidden při volání AI služeb
**Řešení:**
```bash
# Zkontrolujte přiřazení rolí
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Přidejte chybějící role
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problémy s výkonem

#### Problém 4: Pomalé AI odpovědi
**Kroky vyšetřování:**
1. Zkontrolujte metriky výkonu v Application Insights
2. Projděte si metriky služby OpenAI v Azure portálu
3. Ověřte síťovou konektivitu a latenci

**Řešení:**
- Implementujte cache pro běžné dotazy
- Použijte vhodný model OpenAI pro váš případ použití
- Zvažte čtecí repliky pro scénáře s vysokou zátěží

### **Cvičení 6.1: Výzva k ladění**

**Scénář**: Vaše nasazení bylo úspěšné, ale aplikace vrací chyby 500.

**Úkoly ladění:**
1. Zkontrolujte logy aplikace
2. Ověřte konektivitu služeb
3. Otestujte autentizaci
4. Projděte si konfiguraci

**Nástroje k použití:**
- `azd show` pro přehled nasazení
- Azure portál pro podrobné logy služeb
- Application Insights pro telemetrii aplikace

## Modul 7: Monitoring a optimalizace

### Krok 7.1: Nastavení komplexního monitoringu

1. **Vytvořte vlastní panely:**

Přejděte do Azure portálu a vytvořte panel s:
- Počtem požadavků a latencí OpenAI
- Chybovostí aplikace
- Využitím zdrojů
- Sledováním nákladů

2. **Nastavte upozornění:**
```bash
# Upozornění na vysokou míru chyb
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Krok 7.2: Optimalizace nákladů

1. **Analyzujte aktuální náklady:**
```bash
# Použijte Azure CLI k získání údajů o nákladech
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementujte kontrolu nákladů:**
- Nastavte upozornění na rozpočet
- Použijte politiky automatického škálování
- Implementujte cache požadavků
- Sledujte využití tokenů pro OpenAI

### **Cvičení 7.1: Optimalizace výkonu**

**Úkol**: Optimalizujte svou AI aplikaci pro výkon i náklady.

**Metriky ke zlepšení:**
- Snížit průměrnou dobu odezvy o 20 %
- Snížit měsíční náklady o 15 %
- Udržet dostupnost 99,9 %

**Strategie k vyzkoušení:**
- Implementujte cache odpovědí
- Optimalizujte prompty pro efektivitu tokenů
- Použijte vhodné SKU pro výpočetní zdroje
- Nastavte správné automatické škálování

## Závěrečná výzva: Implementace od začátku do konce

### Scénář výzvy

Vaším úkolem je vytvořit produkčně připravený AI chatbot pro zákaznický servis s těmito požadavky:

**Funkční požadavky:**
- Webové rozhraní pro interakce se zákazníky
- Integrace s Azure OpenAI pro odpovědi
- Možnost vyhledávání v dokumentech pomocí Cognitive Search
- Integrace s existující zákaznickou databází
- Podpora více jazyků

**Nefunkční požadavky:**
- Zvládnout 1000 současných uživatelů
- SLA dostupnosti 99,9 %
- Shoda se SOC 2
- Náklady pod $500/měsíc
- Nasazení do více prostředí (vývoj, testování, produkce)

### Kroky implementace

1. **Navrhněte architekturu**
2. **Vytvořte šablonu AZD**
3. **Implementujte bezpečnostní opatření**
4. **Nastavte monitoring a upozornění**
5. **Vytvořte nasazovací pipeline**
6. **Zdokumentujte řešení**

### Kritéria hodnocení

- ✅ **Funkčnost**: Splňuje všechny požadavky?
- ✅ **Bezpečnost**: Jsou implementovány nejlepší postupy?
- ✅ **Škálovatelnost**: Zvládne zátěž?
- ✅ **Udržovatelnost**: Je kód a infrastruktura dobře organizovaná?
- ✅ **Náklady**: Zůstává v rámci rozpočtu?

## Další zdroje

### Dokumentace Microsoftu
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentace Azure OpenAI Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentace Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Ukázkové šablony
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Komunitní zdroje
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)

Gratulujeme! Dokončili jste AI Workshop Lab. Nyní byste měli být schopni:

- ✅ Převést stávající AI aplikace na šablony AZD
- ✅ Nasadit AI aplikace připravené pro produkční prostředí
- ✅ Implementovat osvědčené bezpečnostní postupy pro AI pracovní zátěže
- ✅ Monitorovat a optimalizovat výkon AI aplikací
- ✅ Řešit běžné problémy s nasazením

### Další kroky
1. Aplikujte tyto vzory na své vlastní AI projekty
2. Přispějte šablonami zpět do komunity
3. Připojte se k Microsoft Foundry Discord pro průběžnou podporu
4. Prozkoumejte pokročilá témata, jako jsou nasazení ve více regionech

---

**Zpětná vazba k workshopu**: Pomozte nám zlepšit tento workshop sdílením svých zkušeností na [Microsoft Foundry Discord #Azure kanálu](https://discord.gg/microsoft-azure).

---

**Navigace kapitolami:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj zaměřený na AI
- **⬅️ Předchozí**: [Nasazení AI modelu](ai-model-deployment.md)
- **➡️ Další**: [Osvědčené postupy pro produkční AI](production-ai-practices.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../getting-started/configuration.md)

**Potřebujete pomoc?** Připojte se k naší komunitě pro podporu a diskuze o AZD a nasazení AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
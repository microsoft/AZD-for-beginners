<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ed84aca3294b926341ef9e0a5a78059e",
  "translation_date": "2025-09-18T09:38:34+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "cs"
}
-->
# AI Workshop Lab: Jak učinit vaše AI řešení nasaditelnými pomocí AZD

**Navigace kapitol:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj zaměřený na AI
- **⬅️ Předchozí**: [Nasazení AI modelu](ai-model-deployment.md)
- **➡️ Další**: [Nejlepší postupy pro produkční AI](production-ai-practices.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../getting-started/configuration.md)

## Přehled workshopu

Tento praktický workshop provede vývojáře procesem úpravy existující AI aplikace tak, aby byla nasaditelná pomocí Azure Developer CLI (AZD). Naučíte se klíčové vzory pro produkční nasazení AI pomocí služeb Azure AI Foundry.

**Délka:** 2-3 hodiny  
**Úroveň:** Středně pokročilá  
**Předpoklady:** Základní znalost Azure, povědomí o AI/ML konceptech

## 🎓 Cíle učení

Na konci tohoto workshopu budete schopni:
- ✅ Převést existující AI aplikaci na použití AZD šablon
- ✅ Konfigurovat služby Azure AI Foundry pomocí AZD
- ✅ Implementovat bezpečnou správu přihlašovacích údajů pro AI služby
- ✅ Nasadit produkčně připravené AI aplikace s monitoringem
- ✅ Řešit běžné problémy při nasazení AI

## Předpoklady

### Požadované nástroje
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nainstalováno
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nainstalováno
- [Git](https://git-scm.com/) nainstalováno
- Editor kódu (doporučeno VS Code)

### Azure zdroje
- Azure předplatné s přístupem pro přispěvatele
- Přístup ke službám Azure OpenAI (nebo možnost požádat o přístup)
- Oprávnění k vytváření skupin zdrojů

### Znalostní předpoklady
- Základní porozumění službám Azure
- Znalost příkazových řádků
- Základní koncepty AI/ML (API, modely, prompty)

## Nastavení workshopu

### Krok 1: Příprava prostředí

1. **Ověřte instalaci nástrojů:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Naklonujte repozitář workshopu:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Porozumění struktuře AZD pro AI aplikace

### Anatomie AZD šablony připravené pro AI

Prozkoumejte klíčové soubory v AZD šabloně připravené pro AI:

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

1. **Prohlédněte si soubor azure.yaml:**
```bash
cat azure.yaml
```

**Na co se zaměřit:**
- Definice služeb pro AI komponenty
- Mapování proměnných prostředí
- Konfigurace hostingu

2. **Prozkoumejte hlavní infrastrukturu v main.bicep:**
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

1. **Vytvořte nové AZD prostředí:**
```bash
azd env new myai-workshop
```

2. **Nastavte požadované parametry:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
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

2. **Sledujte průběh nasazení** a zaznamenejte vytvářené zdroje.

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

### **Cvičení 2.1: Praxe řešení problémů**

**Scénář**: Nasazení bylo úspěšné, ale AI neodpovídá.

**Běžné problémy ke kontrole:**
1. **API klíče OpenAI**: Ověřte, že jsou správně nastaveny
2. **Dostupnost modelu**: Zkontrolujte, zda váš region podporuje model
3. **Síťová konektivita**: Ujistěte se, že služby mohou komunikovat
4. **RBAC oprávnění**: Ověřte, že aplikace má přístup k OpenAI

**Příkazy pro ladění:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Přizpůsobení AI aplikací vašim potřebám

### Krok 3.1: Úprava konfigurace AI

1. **Aktualizujte model OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
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

**Nejlepší praxe**: Různé konfigurace pro vývoj vs produkci.

1. **Vytvořte produkční prostředí:**
```bash
azd env new myai-production
```

2. **Nastavte parametry specifické pro produkci:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Cvičení 3.1: Optimalizace nákladů**

**Výzva**: Nakonfigurujte šablonu pro nákladově efektivní vývoj.

**Úkoly:**
1. Identifikujte, které SKU lze nastavit na bezplatné/základní úrovně
2. Nakonfigurujte proměnné prostředí pro minimální náklady
3. Nasazení a porovnání nákladů s produkční konfigurací

**Tipy na řešení:**
- Použijte F0 (bezplatnou) úroveň pro Cognitive Services, pokud je to možné
- Použijte základní úroveň pro Search Service ve vývoji
- Zvažte použití Consumption plánu pro Functions

## Modul 4: Bezpečnost a nejlepší postupy pro produkci

### Krok 4.1: Bezpečná správa přihlašovacích údajů

**Současná výzva**: Mnoho AI aplikací má pevně zakódované API klíče nebo používá nezabezpečené úložiště.

**Řešení AZD**: Integrace Managed Identity + Key Vault.

1. **Prohlédněte si bezpečnostní konfiguraci ve vaší šabloně:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Ověřte, že Managed Identity funguje:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Síťová bezpečnost

1. **Povolte privátní koncové body** (pokud ještě nejsou nakonfigurovány):

Přidejte do šablony bicep:
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

### Krok 4.3: Monitoring a pozorovatelnost

1. **Konfigurujte Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
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

**Úkol**: Zkontrolujte své nasazení podle bezpečnostních nejlepších postupů.

**Kontrolní seznam:**
- [ ] Žádné pevně zakódované tajné údaje v kódu nebo konfiguraci
- [ ] Použití Managed Identity pro autentizaci mezi službami
- [ ] Key Vault ukládá citlivou konfiguraci
- [ ] Síťový přístup je správně omezen
- [ ] Monitoring a logování jsou povoleny

## Modul 5: Převod vaší vlastní AI aplikace

### Krok 5.1: Hodnotící pracovní list

**Před převodem vaší aplikace** odpovězte na tyto otázky:

1. **Architektura aplikace:**
   - Jaké AI služby vaše aplikace používá?
   - Jaké výpočetní zdroje potřebuje?
   - Vyžaduje databázi?
   - Jaké jsou závislosti mezi službami?

2. **Požadavky na bezpečnost:**
   - Jaká citlivá data vaše aplikace zpracovává?
   - Jaké máte požadavky na shodu?
   - Potřebujete privátní síť?

3. **Požadavky na škálování:**
   - Jaké je vaše očekávané zatížení?
   - Potřebujete automatické škálování?
   - Existují regionální požadavky?

### Krok 5.2: Vytvořte svou AZD šablonu

**Postupujte podle tohoto vzoru pro převod vaší aplikace:**

1. **Vytvořte základní strukturu:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
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

3. **Vytvořte infrastrukturu šablon:**

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

**Výzva**: Vytvořte AZD šablonu pro AI aplikaci na zpracování dokumentů.

**Požadavky:**
- Azure OpenAI pro analýzu obsahu
- Document Intelligence pro OCR
- Úložiště pro nahrávání dokumentů
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
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problém 2: Model není dostupný v regionu
**Příznaky:** AI odpovědi selhávají nebo chyby při nasazení modelu
**Řešení:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problém 3: Problémy s oprávněními
**Příznaky:** Chyby 403 Forbidden při volání AI služeb
**Řešení:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problémy s výkonem

#### Problém 4: Pomalé AI odpovědi
**Kroky vyšetřování:**
1. Zkontrolujte metriky výkonu v Application Insights
2. Prohlédněte si metriky služby OpenAI v Azure portálu
3. Ověřte síťovou konektivitu a latenci

**Řešení:**
- Implementujte cache pro běžné dotazy
- Použijte vhodný model OpenAI pro váš případ použití
- Zvažte čtecí repliky pro vysokou zátěž

### **Cvičení 6.1: Výzva k ladění**

**Scénář**: Nasazení bylo úspěšné, ale aplikace vrací chyby 500.

**Úkoly ladění:**
1. Zkontrolujte logy aplikace
2. Ověřte konektivitu služeb
3. Otestujte autentizaci
4. Projděte konfiguraci

**Nástroje k použití:**
- `azd show` pro přehled nasazení
- Azure portál pro podrobné logy služeb
- Application Insights pro telemetrii aplikace

## Modul 7: Monitoring a optimalizace

### Krok 7.1: Nastavte komplexní monitoring

1. **Vytvořte vlastní panely:**

Přejděte do Azure portálu a vytvořte panel s:
- Počtem požadavků OpenAI a latencí
- Mírou chyb aplikace
- Využitím zdrojů
- Sledováním nákladů

2. **Nastavte upozornění:**
```bash
# Alert for high error rate
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
# Use Azure CLI to get cost data
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
- Snižte průměrnou dobu odpovědi o 20 %
- Snižte měsíční náklady o 15 %
- Udržujte dostupnost 99,9 %

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
- Možnost vyhledávání dokumentů pomocí Cognitive Search
- Integrace s existující databází zákazníků
- Podpora více jazyků

**Nefunkční požadavky:**
- Zvládnutí 1000 současných uživatelů
- SLA dostupnosti 99,9 %
- Shoda se SOC 2
- Náklady pod $500/měsíc
- Nasazení do více prostředí (vývoj, staging, produkce)

### Kroky implementace

1. **Navrhněte architekturu**
2. **Vytvořte AZD šablonu**
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
- [Dokumentace Azure OpenAI služby](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentace Azure AI Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Ukázkové šablony
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Komunitní zdroje
- [Discord Azure AI Foundry](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certifikát o dokončení

Gratulujeme! Úspěšně jste dokončili AI Workshop Lab. Nyní byste měli být schopni:

- ✅ Převést existující AI aplikace na AZD šablony
- ✅ Nasadit AI aplikace připravené pro produkční prostředí
- ✅ Implementovat nejlepší bezpečnostní postupy pro AI pracovní zátěže
- ✅ Monitorovat a optimalizovat výkon AI aplikací
- ✅ Řešit běžné problémy při nasazení

### Další kroky
1. Použijte tyto vzory ve svých vlastních AI projektech
2. Přispějte šablonami zpět komunitě
3. Připojte se na Discord Azure AI Foundry pro průběžnou podporu
4. Prozkoumejte pokročilá témata, jako jsou nasazení do více regionů

---

**Zpětná vazba k workshopu**: Pomozte nám zlepšit tento workshop sdílením svých zkušeností na [Azure AI Foundry Discord #Azure kanálu](https://discord.gg/microsoft-azure).

---

**Navigace kapitolami:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj zaměřený na AI
- **⬅️ Předchozí**: [Nasazení AI modelu](ai-model-deployment.md)
- **➡️ Další**: [Nejlepší postupy pro produkční AI](production-ai-practices.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../getting-started/configuration.md)

**Potřebujete pomoc?** Připojte se ke komunitě pro podporu a diskuse o AZD a nasazení AI.

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace doporučujeme profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
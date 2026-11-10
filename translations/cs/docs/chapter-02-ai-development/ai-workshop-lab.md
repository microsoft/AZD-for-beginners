# AI Workshop Lab: Jak učinit vaše AI řešení nasaditelnými pomocí AZD

**Navigace kapitolou:**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj s důrazem na AI
- **⬅️ Předchozí**: [Nasazení AI modelu](ai-model-deployment.md)
- **➡️ Další**: [Nejlepší postupy pro produkční AI](../chapter-08-production/production-ai-practices.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

## Přehled workshopu

Tento praktický lab provede vývojáře procesem převzetí existující šablony AI a jejího nasazení pomocí Azure Developer CLI (AZD). Naučíte se zásadní vzory pro produkční nasazení AI za použití služeb Microsoft Foundry.

> **Revize vydání (2026-11-04):** Návody příkazů AZD a příklady konfiguračních názvů byly ověřeny vůči vydání `azd` `1.37.2` a aktuální konfiguraci propojeného příkladu. Jedná se o revizi dokumentace, nikoliv o ověření živého nasazení. Lab RAG nevyžaduje agentní rozšíření; pro hodnocení agenta použijte samostatné rozšíření `azure.ai.evaluations` a [aktuální hodnotící postup](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), nikoliv příkazy hodnocení starého agenta.

**Trvání:** 2-3 hodiny  
**Úroveň:** Středně pokročilý  
**Předpoklady:** Základní znalosti Azure, seznámení s pojmy AI/ML

## 🎓 Výukové cíle

Na konci tohoto workshopu budete schopni:
- ✅ Prozkoumat existující AI AZD šablonu a naplánovat konverzi vlastní aplikace
- ✅ Konfigurovat služby Microsoft Foundry pomocí AZD
- ✅ Implementovat bezpečnou správu pověření pro AI služby
- ✅ Nasadit AI referenční aplikaci s monitorováním
- ✅ Řešit běžné problémy s nasazením AI

## Předpoklady

### Požadované nástroje
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nainstalován
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nainstalován
- [Git](https://git-scm.com/) nainstalován
- Editor kódu (doporučený VS Code)

Tyto bloky příkazů používají syntax Bash (včetně pokračování řádků a `grep`). Na Windows použijte Git Bash/WSL nebo je přeložte do PowerShell. Také nainstalujte nástroje pro jazyk, správce balíčků a kontejnery uvedené v [nastavení lokálního prostředí vzorku](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Azure zdroje
- Předplatné Azure s oprávněními pro poskytování zdrojů a přiřazování rolí (samo Contributor nemůže vytvářet RBAC přiřazení; použijte autorizovaného správce rolí nebo ekvivalent dokumentovaný ve vzorku)
- Přístup ke službám Microsoft Foundry Models (nebo možnost požádat o přístup)
- Oprávnění k vytváření skupin zdrojů

### Předešlé znalosti
- Základní znalosti Azure služeb
- Znalost práce s příkazovou řádkou
- Základní AI/ML pojmy (API, modely, požadavky)

## Nastavení laboratoře

### Krok 1: Příprava prostředí

1. **Ověřte instalaci nástrojů:**
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

Pokud pracujete napříč více tenanty nebo není vaše předplatné automaticky detekováno, zkuste to znovu s `azd auth login --tenant-id <tenant-id>`.

2. **Naklonujte repozitář workshopu:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Pochopení struktury AZD pro AI aplikace

### Stavba AI AZD šablony

Prozkoumejte klíčové soubory v AI připravené AZD šabloně:

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

Zkontrolovaný vzorek se může měnit; `.azure/` se zobrazí po inicializaci prostředí, nikoli nutně v novém klonu. Prohlédněte si skutečný checkout místo vytváření chybějících adresářů podle tohoto schématu.

### **Lab cvičení 1.1: Prozkoumejte konfiguraci**

1. **Prohlédněte soubor azure.yaml:**
```bash
cat azure.yaml
```

**Na co se zaměřit:**
- Definice služeb AI komponent
- Mapování proměnných prostředí
- Konfigurace hostitele

2. **Prohlédněte hlavní infrastrukturu main.bicep:**
```bash
cat infra/main.bicep
```

**Klíčové vzory AI, které identifikovat:**
- Poskytování služby Microsoft Foundry Models
- Integrace Azure AI Search
- Bezpečné řízení klíčů
- Konfigurace síťové bezpečnosti

### **Diskusní téma:** Proč jsou tyto vzory důležité pro AI

- **Závislosti služeb**: AI aplikace často vyžadují více koordinovaných služeb
- **Bezpečnost**: API klíče a koncové body je třeba bezpečně spravovat
- **Škálovatelnost**: AI zatížení má speciální požadavky na škálování
- **Řízení nákladů**: AI služby mohou být nákladné, pokud nejsou správně nastaveny

## Modul 2: Nasazení Vaší první AI aplikace

### Krok 2.1: Inicializace prostředí

1. **Vytvořte nové AZD prostředí:**
```bash
azd env new myai-workshop
```

2. **Nastavte požadované parametry:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Krok 2.2: Nasazení infrastruktury a aplikace

1. **Nasazení pomocí AZD:**
```bash
azd up
```

**Co se děje během `azd up`:**
- ✅ Provede provision služby Microsoft Foundry Models
- ✅ Vytvoří službu Azure AI Search
- ✅ Nastaví Azure Container Apps pro backend a zabalený frontend (aktuální výchozí vzorek)
- ✅ Nakonfiguruje síťování a zabezpečení
- ✅ Nasadí aplikační kód
- ✅ Nastaví monitorování a logování

2. **Sledujte průběh nasazení** a zaznamenávejte vytvářené zdroje.

### Krok 2.3: Ověřte své nasazení

1. **Zkontrolujte nasazené zdroje:**
```bash
azd show
```

2. **Otevřete nasazenou aplikaci:**
```bash
azd show
```

Otevřete webový endpoint uvedený ve výstupu `azd show`.

3. **Otestujte AI funkčnost:**
   - Navigujte se do webové aplikace
   - Vyzkoušejte ukázkové dotazy
   - Ověřte správnou funkci AI odpovědí

### **Lab cvičení 2.1: Praxe řešení problémů**

**Scénář**: Nasazení proběhlo úspěšně, ale AI neodpovídá.

**Časté problémy k ověření:**
1. **Autentizace**: Ověřte spravovanou identitu a přiřazení rolí; API klíče kontrolujte pouze pokud jste vědomě zapnuli autentizaci na základě klíče
2. **Dostupnost modelu**: Zkontrolujte, zda váš region podporuje model
3. **Síťové připojení**: Ujistěte se, že služby mohou komunikovat
4. **RBAC oprávnění**: Ověřte, že aplikace má přístup k OpenAI

**Příkazy pro ladění:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Přizpůsobení AI aplikací pro vaše potřeby

### Krok 3.1: Úprava AI konfigurace

1. **Aktualizujte model OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Přidejte další AI služby:**

Upravte `infra/main.bicep` pro přidání Document Intelligence:

Následující je ilustrační úryvek, nikoli kompletní šablona. Vzorek může již služby pro zpracování dokumentů poskytovat: prohlédněte jejich aktuální infrastrukturu před přidáním duplicitních zdrojů. Vlastní přídavky vyžadují propojení výstupů, identit a aplikační konfigurace.

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

**Nejlepší praxe**: Různá nastavení pro vývojové a produkční prostředí.

1. **Vytvořte produkční prostředí:**
```bash
azd env new myai-production
```

2. **Nastavte produkční specifické parametry:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Tato jména pocházejí z [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) vzorku. `azd env set` uchovává hodnotu, ale nesmí být účinné bez spotřeby v šabloně. Před zrušením veřejného přístupu si přečtěte [návod na izolaci sítě](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) vzorku a použijte `azd up` pro aplikaci změn infrastruktury. Samotný SKU OpenAI `S0` neurčuje propustnost modelu; důležitý je taky typ a kapacita nasazení modelu.

### **Lab cvičení 3.1: Optimalizace nákladů**

**Výzva**: Nakonfigurujte šablonu pro cenově efektivní vývoj.

**Úkoly:**
1. Vyberte si pracovní prostředí pro jednorázové použití: `azd env select myai-workshop`.
2. Zaznamenejte aktuální Search SKU a kapacitu modelu z `infra/main.parameters.json` a vybraného prostředí.
3. Použijte podporované vstupy níže, po ověření kvóty modelu/regionu:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Ověřte Search SKU a kapacitu nasazení v portálu a odhadněte rozdíl pomocí kalkulátoru cen. Neočekávejte okamžitou aktualizaci fakturačních údajů.

**Kritéria úspěchu:** Search používá Basic, chat deployment má požadovanou podporovanou kapacitu a aplikace stále odpovídá na ukázkovou otázku. Kapacita `10` je alokace rychlostního limitu, nikoli sleva na cenu tokenů. Změny úrovně Search mohou být omezené nebo vyžadovat nové vytvoření; neexperimentujte na produkčních zdrojích. F0 je specifické pro službu a není SKU modelu Azure OpenAI.

## Modul 4: Bezpečnost a nejlepší výrobní praktiky

### Krok 4.1: Bezpečná správa přihlašovacích údajů

**Současný problém**: Mnoho AI aplikací tvrdě kóduje API klíče nebo používá nezabezpečené ukládání.

**Řešení AZD**: Spravovaná identita + integrace Key Vault.

1. **Zkontrolujte bezpečnostní konfiguraci ve vaší šabloně:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Ověřte funkčnost spravované identity:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Síťová bezpečnost

1. **Povolte privátní koncové body** s použitím podporované síťové konfigurace vzorku (pokud ještě nejsou nastaveny).

Pro vlastní šablonu ukazuje ilustrační úryvek připojení k OpenAI endpointu. Potřebuje také VNet, konfiguraci privátního DNS a aplikaci konektivity; nelepte ho nezměněný do vzorku, který už obsahuje moduly privátních koncových bodů:
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

### Krok 4.3: Monitorování a pozorovatelnost

1. **Nakonfigurujte Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Povolte integraci Application Insights ve vzorku:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Instrumentace vzorku vysílá telemetrii; libovolné nastavení `OPENAI_MONITOR_ENABLED` nezapíná AI metriky. Prohlédněte si stopy volání modelu, latenci, chyby a využití tokenů, a vyhněte se záznamu citlivých požadavků nebo odpovědí.

### **Lab cvičení 4.1: Bezpečnostní audit**

**Úkol**: Zkontrolujte svá nasazení z hlediska bezpečnostních osvědčených postupů.

**Kontrolní seznam:**
- [ ] Žádná tvrdě zakódovaná tajemství v kódu nebo konfiguraci
- [ ] Spravovaná identita použitá pro autentizaci služba ke službě
- [ ] Key Vault uchovává citlivou konfiguraci
- [ ] Síťový přístup je řádně omezen
- [ ] Monitorování a logování jsou povoleny

## Modul 5: Převod vlastní AI aplikace

### Krok 5.1: Hodnotící formulář

**Před konverzí aplikace** zodpovězte tyto otázky:

1. **Architektura aplikace:**
   - Jaké AI služby vaše aplikace používá?
   - Jaké výpočetní zdroje potřebuje?
   - Vyžaduje databázi?
   - Jaké jsou závislosti mezi službami?

2. **Bezpečnostní požadavky:**
   - Jaká citlivá data vaše aplikace zpracovává?
   - Jaké máte požadavky na dodržování předpisů?
   - Potřebujete privátní síťování?

3. **Požadavky na škálování:**
   - Jaké je očekávané zatížení?
   - Potřebujete automatické škálování?
   - Jsou regionální požadavky?

### Krok 5.2: Vytvořte svou AZD šablonu

**Řiďte se tímto vzorem pro konverzi aplikace:**

**Pouze strukturování:** Tato sekce neposkytuje zdroj API/web aplikace, hostitelskou infrastrukturu, nasazení modelů, identitu/RBAC ani hotový `main.parameters.json`. Bicep omezený na skupinu zdrojů ukazuje složení modulů; typická vstupní metoda AZD na úrovni předplatného musí vytvořit skupinu zdrojů a spustit ji v tomto rozsahu. Neočekávejte, že `azd up` po kopírování jen těchto úryvků nasadí kompletní aplikaci. Pro provozovatelný základní bod pokračujte v používání RAG šablony z Modulu 1.

1. **Vytvořte základní strukturu:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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

### **Lab cvičení 5.1: Výzva pro vytvoření šablony**

**Výzva**: Vytvořte AZD šablonu pro AI aplikaci na zpracování dokumentů.

**Požadavky:**
- Microsoft Foundry Models pro analýzu obsahu
- Document Intelligence pro OCR
- Storage Account pro nahrané dokumenty
- Function App pro zpracovatelskou logiku
- Webová aplikace pro uživatelské rozhraní

**Bonusové body:**
- Přidejte správnou obsluhu chyb
- Zahrňte odhad nákladů
- Nastavte monitorovací panely

## Modul 6: Řešení běžných problémů

### Běžné problém nasazení

#### Problém 1: Překročena kvóta služby OpenAI
**Příznaky:** Nasazení selže s chybou kvóty
**Řešení:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Problém 2: Model není k dispozici v regionu
**Příznaky:** AI odpovědi selhávají nebo chyby nasazení modelu
**Řešení:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Problém 3: Problémy s oprávněním
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

### Výkonnostní problémy

#### Problém 4: Pomalé AI odpovědi
**Kroky vyšetřování:**
1. Zkontrolujte metriky výkonu v Application Insights
2. Prohlédněte metriky služby OpenAI v Azure portálu
3. Ověřte síťové připojení a latenci

**Řešení:**
- Implementujte cachování pro běžné dotazy
- Použijte vhodný OpenAI model pro váš případ použití
- Škálujte repliky aplikace až po kontrole limitů RPM/TPM modelu; nasazení Azure OpenAI neumožňuje obecné nastavení databázových read replik

### **Lab cvičení 6.1: Výzva pro ladění**

**Scénář**: Nasazení proběhlo úspěšně, ale aplikace vrací chyby 500.

**Úkoly pro ladění:**
1. Zkontrolujte logy aplikace
2. Ověřte konektivitu služeb
3. Test ověření
4. Přezkoumání konfigurace

**Nástroje k použití:**
- `azd show` pro přehled nasazení
- Azure portál pro podrobné servisní logy
- Application Insights pro telemetrii aplikace

## Modul 7: Monitorování a optimalizace

### Krok 7.1: Nastavení komplexního monitorování

1. **Vytvořte vlastní dashboardy:**

Přejděte do Azure portálu a vytvořte dashboard s:
- Počtem požadavků OpenAI a latencí
- Mírou chyb aplikace
- Využitím zdrojů
- Sledováním nákladů

2. **Nastavte upozornění:**
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

Ověřte, že komponenta vysílá telemetrii požadavků a přidejte akční skupinu, pokud jsou požadována oznámení. Metrika je počet, ne procento chyb; upozornění na míru vyžaduje vhodný dotaz a jmenovatel.

### Krok 7.2: Optimalizace nákladů

1. **Analyzujte aktuální náklady:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Nahraďte zástupné symboly data. Podpora Consumption API se liší dle fakturační smlouvy; použijte Cost Management v portálu, pokud nejsou detaily použití k dispozici. Náklady jsou zpožděné, nejsou reálným testovacím orákulem.

2. **Zaveďte kontrolu nákladů:**
- Nastavte upozornění rozpočtu
- Použijte autoscaling politiky
- Implementujte ukládání odpovědí do cache
- Sledujte využití tokenů pro OpenAI

### **Laboratorní cvičení 7.1: Optimalizace výkonu**

**Úkol**: Optimalizujte vaši AI aplikaci jak pro výkon, tak pro náklady.

**Metriky ke zlepšení:**
- Snižte průměrnou dobu odezvy o 20%
- Snižte měsíční náklady o 15%
- Definujte 99,9% dostupnost SLO a měřicí okno (krátké cvičení nemůže demonstrovat měsíční dostupnost)

**Strategie k vyzkoušení:**
- Implementujte ukládání odpovědí do cache
- Optimalizujte podněty pro efektivitu tokenů
- Použijte vhodné výpočetní SKU
- Nastavte správný autoscaling

## Závěrečná výzva: Kompletní implementace

### Scénář výzvy

Toto je **volitelná výzva na architekturu/design**, nikoli poskytnuté spustitelné cvičení nebo certifikace produkce. Navrhněte AI poháněný chatbot pro zákaznický servis a zdokumentujte, které požadavky vyžadují další implementaci a důkazy:

**Funkční požadavky:**
- Webové rozhraní pro interakce se zákazníky
- Integrace s Microsoft Foundry Models pro odpovědi
- Hledání v dokumentech pomocí Azure AI Search
- Integrace s existující zákaznickou databází
- Podpora více jazyků

**Nefunkční požadavky:**
- Zvládnout 1000 současných uživatelů
- SLA 99,9% dostupnosti
- Soulad s SOC 2
- Náklady pod 500 USD/měsíc
- Nasazení do více prostředí (vývoj, testování, produkce)

Toto jsou hypotetická omezení zúčastněných stran, nikoli současně zaručené výsledky. Definujte rychlost požadavků, velikosti podnětů/výstupů a délku relace před odhadem nákladů; 1000 současných uživatelů nezaručuje pracovní zátěž ani neprokáže realizovatelnost rozpočtu $500. SOC 2 je organizační auditní výsledek, nikoli přepínač povolený šablonou AZD. Identifikujte kompromisy a odmítejte nereálné požadavky s důkazy.

### Kroky implementace

1. **Navrhněte architekturu**
2. **Vytvořte AZD šablonu**
3. **Implementujte bezpečnostní opatření**
4. **Nastavte monitorování a upozornění**
5. **Vytvořte nasazovací pipeline**
6. **Zdokumentujte řešení**

### Kritéria hodnocení

- ✅ **Funkčnost**: Jsou demonstrovány implementované schopnosti a zřejmé zbývající mezery?
- ✅ **Bezpečnost**: Jsou implementovány nejlepší praktiky?
- ✅ **Škálovatelnost**: Zvládne zátěž?
- ✅ **Udržovatelnost**: Je kód a infrastruktura dobře uspořádaná?
- ✅ **Náklady**: Je to v rámci rozpočtu?

## Další zdroje

### Dokumentace Microsoftu
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentace Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Dokumentace](https://learn.microsoft.com/azure/ai-studio/)

### Vzorové šablony
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Komunitní zdroje
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Kontrola dokončení

Gratulujeme! Dokončili jste AI Workshop Lab. Nyní byste měli být schopni:

- ✅ Vysvětlit, jak přizpůsobit existující AI aplikaci šabloně AZD
- ✅ Nasadit a otestovat referenční AI aplikaci
- ✅ Implementovat nejlepší bezpečnostní praktiky pro AI pracovní zátěže
- ✅ Monitorovat a optimalizovat výkon AI aplikace
- ✅ Řešit běžné problémy s nasazením

**Úklid:** Spusťte `azd env list`, vyberte každé použitelné prostředí vytvořené v tomto labu (`myai-workshop`, a pokud bylo nasazeno `myai-production`/`myai-quota-test`), a spusťte `azd down` v každém z nich. Přezkoumejte plán mazání; samotné smazání lokální konfigurace prostředí neodstraní zdroje Azure. Vyhněte se `--purge`, pokud nerozumíte nevratnému odstranění soft-delete zdrojů.

### Další kroky
1. Uplatněte tyto vzory ve svých vlastních AI projektech
2. Přispívejte šablonami zpět komunitě
3. Přidejte se do Microsoft Foundry Discord pro průběžnou podporu
4. Prozkoumejte pokročilá témata jako nasazení v několika regionech

---

**Zpětná vazba k workshopu**: Pomozte nám vylepšit tento workshop sdílením své zkušenosti v [Microsoft Foundry Discord kanálu Azure](https://discord.gg/microsoft-azure).

---

**Navigace kapitolou:**
- **📚 Domů kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj zaměřený na AI
- **⬅️ Předchozí**: [Nasazení AI modelu](ai-model-deployment.md)
- **➡️ Další**: [Nejlepší postupy pro produkční AI](../chapter-08-production/production-ai-practices.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

**Potřebujete pomoc?** Přidejte se do naší komunity pro podporu a diskuse o AZD a nasazeních AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
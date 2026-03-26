# Laboratoř AI Workshop: Nasazení vašich AI řešení pomocí AZD

**Navigace kapitoly:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj zaměřený na AI
- **⬅️ Předchozí**: [Nasazení AI modelu](ai-model-deployment.md)
- **➡️ Další**: [Nejlepší postupy pro produkční AI](production-ai-practices.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

## Přehled workshopu

Tento praktický lab provede vývojáře procesem převodu existující AI šablony a jejího nasazení pomocí Azure Developer CLI (AZD). Naučíte se zásadní vzory pro produkční nasazení AI pomocí služeb Microsoft Foundry.

**Doba trvání:** 2-3 hodiny  
**Úroveň:** Středně pokročilá  
**Požadavky předem:** Základní znalosti Azure, povědomí o konceptech AI/ML

## 🎓 Cíle učení

Na konci workshopu budete schopni:
- ✅ Převést existující AI aplikaci tak, aby používala šablony AZD
- ✅ Konfigurovat služby Microsoft Foundry pomocí AZD
- ✅ Implementovat bezpečné řízení přístupových údajů pro AI služby
- ✅ Nasadit produkčně připravené AI aplikace s monitorováním
- ✅ Řešit běžné problémy při nasazení AI

## Požadavky

### Požadované nástroje
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nainstalovaný
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nainstalovaný
- [Git](https://git-scm.com/) nainstalovaný
- Editor kódu (doporučeno VS Code)

### Azure prostředky
- Předplatné Azure s přístupem Contributor
- Přístup ke službám Microsoft Foundry Models (nebo možnost požádat o přístup)
- Oprávnění k vytváření skupin prostředků

### Požadované znalosti
- Základní porozumění službám Azure
- Zkušenost s příkazovým řádkem
- Základní koncepty AI/ML (API, modely, promptování)

## Nastavení laboratoře

### Krok 1: Příprava prostředí

1. **Ověření instalace nástrojů:**
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

### Anatomie AI šablony AZD

Prozkoumejte klíčové soubory v AZD šabloně připravené pro AI:

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

### **Cvičení 1.1: Prozkoumejte konfiguraci**

1. **Prohlédněte si soubor azure.yaml:**
```bash
cat azure.yaml
```

**Na co se zaměřit:**
- Definice služeb pro AI komponenty
- Mapování proměnných prostředí
- Konfigurace hostitelů

2. **Zkontrolujte hlavní infrastrukturu main.bicep:**
```bash
cat infra/main.bicep
```

**Klíčové AI vzory k identifikaci:**
- Provisioning služby Microsoft Foundry Models
- Integrace Cognitive Search
- Bezpečné řízení klíčů
- Konfigurace síťového zabezpečení

### **Diskusní bod:** Proč jsou tyto vzory důležité pro AI

- **Závislosti služeb**: AI aplikace často vyžadují více koordinovaných služeb
- **Zabezpečení**: API klíče a koncové body je třeba bezpečně spravovat
- **Škálovatelnost**: AI pracovní zatížení má specifické požadavky na škálování
- **Řízení nákladů**: AI služby mohou být nákladné, pokud nejsou správně nakonfigurovány

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
- ✅ Provisionuje službu Microsoft Foundry Models
- ✅ Vytvoří službu Cognitive Search
- ✅ Nastaví App Service pro webovou aplikaci
- ✅ Konfiguruje síťování a zabezpečení
- ✅ Nasadí kód aplikace
- ✅ Nastaví monitorování a logování

2. **Sledujte průběh nasazení** a poznamenejte vytvářené prostředky.

### Krok 2.3: Ověření vašeho nasazení

1. **Zkontrolujte nasazené prostředky:**
```bash
azd show
```

2. **Otevřete nasazenou aplikaci:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Otestujte AI funkčnost:**
   - Přejděte do webové aplikace
   - Vyzkoušejte ukázkové dotazy
   - Ověřte, že odpovědi AI fungují

### **Cvičení 2.1: Praktické řešení problémů**

**Scénář**: Nasazení bylo úspěšné, ale AI neodpovídá.

**Běžné problémy k prověření:**
1. **OpenAI API klíče**: Ověřte, že jsou správně nastaveny
2. **Dostupnost modelu**: Zkontrolujte, zda váš region podporuje model
3. **Síťová konektivita**: Ujistěte se, že služby mohou komunikovat
4. **RBAC oprávnění**: Ověřte, že aplikace má přístup k OpenAI

**Příkazy pro ladění:**
```bash
# Zkontrolovat proměnné prostředí
azd env get-values

# Zobrazit protokoly nasazení
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Zkontrolovat stav nasazení OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Přizpůsobení AI aplikací vašim potřebám

### Krok 3.1: Úprava AI konfigurace

1. **Aktualizujte model OpenAI:**
```bash
# Přejít na jiný model (pokud je ve vaší oblasti dostupný)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Znovu nasadit s novou konfigurací
azd deploy
```

2. **Přidejte další AI služby:**

Upravte `infra/main.bicep`, aby přidal Document Intelligence:

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

**Doporučený postup**: Různé konfigurace pro vývoj a produkci.

1. **Vytvořte produkční prostředí:**
```bash
azd env new myai-production
```

2. **Nastavte parametry specifické pro produkci:**
```bash
# V produkci se obvykle používají vyšší SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Povolit další bezpečnostní funkce
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Cvičení 3.1: Optimalizace nákladů**

**Úkol**: Nakonfigurujte šablonu pro ekonomický vývoj.

**Úkoly:**
1. Identifikujte, které SKU lze nastavit na free/basic úrovně
2. Nakonfigurujte proměnné prostředí pro minimální náklady
3. Nasadte a porovnejte náklady s produkční konfigurací

**Nápověda k řešení:**
- Použijte F0 (bezplatnou) úroveň pro Cognitive Services, pokud je to možné
- Použijte Basic tier pro Search Service ve vývoji
- Zvažte použití Consumption plánu pro Functions

## Modul 4: Zabezpečení a nejlepší postupy pro provoz

### Krok 4.1: Bezpečná správa přihlašovacích údajů

**Současný problém**: Mnoho AI aplikací zakódovává API klíče přímo do kódu nebo používá nezabezpečené úložiště.

**Řešení AZD**: Integrace Managed Identity + Key Vault.

1. **Zkontrolujte bezpečnostní konfiguraci ve vaší šabloně:**
```bash
# Hledejte konfiguraci Key Vaultu a spravované identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Ověřte, že Managed Identity funguje:**
```bash
# Zkontrolujte, zda má webová aplikace správné nastavení identity.
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Síťové zabezpečení

1. **Povolte privátní endpoints** (pokud nejsou již nakonfigurovány):

Přidejte do vašeho bicep šablony:
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
# Application Insights by měl být nakonfigurován automaticky
# Zkontrolujte konfiguraci:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Nastavte monitorování specifické pro AI:**

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

**Úkol**: Zkontrolujte své nasazení z hlediska bezpečnostních osvědčených postupů.

**Kontrolní seznam:**
- [ ] Žádné hardcodované tajné klíče v kódu nebo konfiguraci
- [ ] Managed Identity použita pro autentizaci mezi službami
- [ ] Key Vault ukládá citlivou konfiguraci
- [ ] Přístup k síti je správně omezen
- [ ] Monitorování a logování jsou povoleny

## Modul 5: Převod vaší vlastní AI aplikace

### Krok 5.1: Pracovní list pro posouzení

**Před převodem vaší aplikace** odpovězte na tyto otázky:

1. **Architektura aplikace:**
   - Jaké AI služby vaše aplikace používá?
   - Jaké výpočetní zdroje potřebuje?
   - Vyžaduje databázi?
   - Jaké jsou závislosti mezi službami?

2. **Požadavky na zabezpečení:**
   - Jak citlivá data vaše aplikace zpracovává?
   - Jaké požadavky na shodu (compliance) máte?
   - Potřebujete privátní síťování?

3. **Požadavky na škálování:**
   - Jaké je očekávané zatížení?
   - Potřebujete automatické škálování?
   - Jsou požadavky na regiony?

### Krok 5.2: Vytvořte svou AZD šablonu

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

3. **Vytvořte infrastrukturové šablony:**

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

**Úkol**: Vytvořte AZD šablonu pro aplikaci AI na zpracování dokumentů.

**Požadavky:**
- Microsoft Foundry Models pro analýzu obsahu
- Document Intelligence pro OCR
- Storage Account pro nahrávání dokumentů
- Function App pro zpracovatelskou logiku
- Webová aplikace pro uživatelské rozhraní

**Bonusové body:**
- Přidejte správnou obsluhu chyb
- Zahrňte odhad nákladů
- Nastavte monitoring dashboardy

## Modul 6: Řešení běžných problémů

### Běžné problémy při nasazení

#### Problém 1: Překročena kvóta služby OpenAI
**Příznaky:** Nasazení selže s chybou kvóty
**Řešení:**
```bash
# Zkontrolujte aktuální kvóty
az cognitiveservices usage list --location eastus

# Požádejte o zvýšení kvót nebo zkuste jiný region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problém 2: Model není dostupný v regionu
**Příznaky:** Odpovědi AI selhávají nebo nastávají chyby při nasazení modelu
**Řešení:**
```bash
# Zkontrolovat dostupnost modelu podle regionu
az cognitiveservices model list --location eastus

# Aktualizovat na dostupný model
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

### Výkonové problémy

#### Problém 4: Pomalé odpovědi AI
**Kroky vyšetřování:**
1. Zkontrolujte Application Insights pro metriky výkonu
2. Prohlédněte metriky služby OpenAI v Azure portálu
3. Ověřte síťovou konektivitu a latenci

**Řešení:**
- Implementujte cache pro běžné dotazy
- Použijte vhodný OpenAI model pro váš případ použití
- Zvažte read repliky pro scénáře s vysokým zatížením

### **Cvičení 6.1: Ladící výzva**

**Scénář**: Nasazení bylo úspěšné, ale aplikace vrací chyby 500.

**Úkoly pro ladění:**
1. Zkontrolujte logy aplikace
2. Ověřte konektivitu služeb
3. Otestujte autentizaci
4. Zkontrolujte konfiguraci

**Nástroje k použití:**
- `azd show` pro přehled nasazení
- Azure portal pro podrobné logy služeb
- Application Insights pro telemetrii aplikace

## Modul 7: Monitorování a optimalizace

### Krok 7.1: Nastavení komplexního monitorování

1. **Vytvořte vlastní panely (dashboards):**

Přejděte do Azure portálu a vytvořte panel s:
- Počtem a latencí požadavků OpenAI
- Mírou chyb aplikace
- Využitím prostředků
- Sledováním nákladů

2. **Nastavte upozornění:**
```bash
# Upozornění na vysokou chybovost
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

2. **Implementujte kontroly nákladů:**
- Nastavte upozornění rozpočtu
- Použijte politiky autoscalingu
- Implementujte cache požadavků
- Sledujte využití tokenů pro OpenAI

### **Cvičení 7.1: Optimalizace výkonu**

**Úkol**: Optimalizujte vaši AI aplikaci pro výkon i náklady.

**Metriky k vylepšení:**
- Snížit průměrnou dobu odpovědi o 20%
- Snížit měsíční náklady o 15%
- Udržet dostupnost 99,9%

**Strategie k vyzkoušení:**
- Implementujte cache odpovědí
- Optimalizujte promptování pro úsporu tokenů
- Použijte vhodné výpočetní SKU
- Nastavte správné autoscaling

## Závěrečná výzva: Kompletní implementace

### Scénář výzvy

Vaším úkolem je vytvořit produkční chatbot pro zákaznický servis poháněný AI s těmito požadavky:

**Funkční požadavky:**
- Webové rozhraní pro zákaznické interakce
- Integrace s Microsoft Foundry Models pro generování odpovědí
- Vyhledávání dokumentů pomocí Cognitive Search
- Integrace s existující zákaznickou databází
- Podpora více jazyků

**Nefunkční požadavky:**
- Zvládnout 1000 současných uživatelů
- SLA 99,9% dostupnost
- Soulad se SOC 2
- Náklady do 500 USD/měsíc
- Nasadit do více prostředí (dev, staging, prod)

### Kroky implementace

1. **Navrhněte architekturu**
2. **Vytvořte AZD šablonu**
3. **Implementujte bezpečnostní opatření**
4. **Nastavte monitorování a alerty**
5. **Vytvořte deployment pipeline**
6. **Zdokumentujte řešení**

### Kritéria hodnocení

- ✅ **Funkčnost**: Splňuje všechny požadavky?
- ✅ **Zabezpečení**: Jsou implementovány osvědčené postupy?
- ✅ **Škálovatelnost**: Zvládne požadované zatížení?
- ✅ **Udržovatelnost**: Je kód a infrastruktura dobře organizovaná?
- ✅ **Náklady**: Drží se v rozpočtu?

## Další zdroje

### Dokumentace Microsoftu
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Ukázkové šablony
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Komunitní zdroje
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certifikát o absolvování

Gratulujeme! Dokončili jste AI Workshop Lab. Nyní byste měli být schopni:
- ✅ Převést existující AI aplikace na šablony AZD
- ✅ Nasadit produkčně připravené AI aplikace
- ✅ Zavést osvědčené bezpečnostní postupy pro AI pracovní zátěže
- ✅ Sledovat a optimalizovat výkon AI aplikací
- ✅ Řešit běžné problémy s nasazením

### Další kroky
1. Aplikujte tyto vzory ve svých vlastních AI projektech
2. Přispějte šablonami zpět komunitě
3. Připojte se k Microsoft Foundry Discordu pro průběžnou podporu
4. Prozkoumejte pokročilá témata, jako je nasazení ve více regionech

---

**Zpětná vazba k workshopu**: Pomozte nám zlepšit tento workshop sdílením svých zkušeností v [kanálu #Azure na Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Navigace kapitol:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Předchozí**: [Nasazení AI modelu](ai-model-deployment.md)
- **➡️ Další**: [Nejlepší postupy pro produkční AI](production-ai-practices.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

**Potřebujete pomoc?** Připojte se k naší komunitě pro podporu a diskuse o AZD a nasazeních AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí služby pro překlad s umělou inteligencí [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho mateřském jazyce by měl být považován za závazný zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za žádná nedorozumění nebo mylné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
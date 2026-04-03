# AI Workshop Lab: Jak udělat vaše AI řešení nasaditelná pomocí AZD

**Navigace kapitolou:**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj zaměřený na AI
- **⬅️ Předchozí**: [Nasazení AI modelu](ai-model-deployment.md)
- **➡️ Další**: [Nejlepší postupy pro produkční AI](production-ai-practices.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

## Přehled workshopu

Tento praktický lab provede vývojáře procesem převzetí existující AI šablony a jejím nasazením pomocí Azure Developer CLI (AZD). Naučíte se základní vzory pro produkční nasazení AI pomocí služeb Microsoft Foundry.

> **Poznámka k validaci (2026-03-25):** Tento workshop byl testován s verzí `azd` `1.23.12`. Pokud máte starší lokální instalaci, aktualizujte AZD před začátkem, aby autentizace, šablona a nasazovací proces odpovídaly níže uvedeným krokům.

**Délka:** 2-3 hodiny  
**Úroveň:** Středně pokročilá  
**Předpoklady:** Základní znalosti Azure, povědomí o AI/ML konceptech

## 🎓 Výukové cíle

Na konci tohoto workshopu budete schopni:
- ✅ Převést existující AI aplikaci na použití AZD šablon
- ✅ Konfigurovat služby Microsoft Foundry pomocí AZD
- ✅ Zavést bezpečné řízení přístupových údajů pro AI služby
- ✅ Nasadit produkčně připravené AI aplikace s monitorováním
- ✅ Řešit běžné problémy s nasazením AI

## Předpoklady

### Požadované nástroje
- Nainstalovaný [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Nainstalovaný [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Nainstalovaný [Git](https://git-scm.com/)
- Kódový editor (doporučen VS Code)

### Azure zdroje
- Azure předplatné s přístupem přispěvatele
- Přístup ke službám Microsoft Foundry Models (nebo možnost požádat o přístup)
- Oprávnění pro vytváření resource group

### Požadované znalosti
- Základní pochopení služeb Azure
- Znalost příkazových řádek
- Základní AI/ML pojmy (API, modely, prompt)

## Nastavení laboratoře

### Krok 1: Příprava prostředí

1. **Ověření instalace nástrojů:**
```bash
# Zkontrolujte instalaci AZD
azd version

# Zkontrolujte Azure CLI
az --version

# Přihlaste se k Azure pro pracovní postupy AZD
azd auth login

# Přihlaste se k Azure CLI pouze pokud plánujete během diagnostiky spouštět příkazy az
az login
```

Pokud pracujete napříč více tenanty nebo vaše předplatné není automaticky detekováno, opakujte přihlášení příkazem `azd auth login --tenant-id <tenant-id>`.

2. **Naklonujte repozitář workshopu:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Porozumění struktuře AZD pro AI aplikace

### Anatomie AI AZD šablony

Prozkoumejte klíčové soubory v AI připravené AZD šabloně:

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

### **Cvičení 1.1: Prozkoumání konfigurace**

1. **Prohlédněte si soubor azure.yaml:**
```bash
cat azure.yaml
```

**Na co se zaměřit:**
- Definice služeb AI komponent
- Mapování proměnných prostředí
- Hostitelské konfigurace

2. **Projděte hlavní infrastrukturu main.bicep:**
```bash
cat infra/main.bicep
```

**Důležité AI vzory k identifikaci:**
- Provisioning služby Microsoft Foundry Models
- Integrace Cognitive Search
- Bezpečné řízení klíčů
- Konfigurace síťové bezpečnosti

### **Diskusní bod:** Proč jsou tyto vzory důležité pro AI

- **Závislosti služeb**: AI aplikace často potřebují koordinaci několika služeb
- **Bezpečnost**: API klíče a endpointy musí být bezpečně spravovány
- **Škálovatelnost**: AI workloady mají specifické požadavky na škálování
- **Řízení nákladů**: AI služby mohou být drahé, pokud nejsou správně nastaveny

## Modul 2: Nasazení první AI aplikace

### Krok 2.1: Inicializace prostředí

1. **Vytvořte nové AZD prostředí:**
```bash
azd env new myai-workshop
```

2. **Nastavte požadované parametry:**
```bash
# Nastavte preferovaný region Azure
azd env set AZURE_LOCATION eastus

# Nepovinné: Nastavte konkrétní model OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Krok 2.2: Nasazení infrastruktury a aplikace

1. **Nasazení pomocí AZD:**
```bash
azd up
```

**Co se stane při `azd up`:**
- ✅ Provisování služby Microsoft Foundry Models
- ✅ Vytvoření služby Cognitive Search
- ✅ Nastavení App Service pro webovou aplikaci
- ✅ Konfigurace sítě a bezpečnosti
- ✅ Nasazení aplikačního kódu
- ✅ Nastavení monitoringu a logování

2. **Sledujte průběh nasazení** a všímejte si vytvářených zdrojů.

### Krok 2.3: Ověření nasazení

1. **Zkontrolujte nasazené zdroje:**
```bash
azd show
```

2. **Otevřete nasazenou aplikaci:**
```bash
azd show
```

Otevřete webový endpoint uvedený v `azd show`.

3. **Otestujte AI funkčnost:**
   - Přejděte do webové aplikace
   - Vyzkoušejte ukázkové dotazy
   - Ověřte funkčnost odpovědí AI

### **Cvičení 2.1: Praxe řešení problémů**

**Scénář**: Nasazení proběhlo, ale AI neodpovídá.

**Běžné problémy ke kontrole:**
1. **OpenAI API klíče**: Ověřte správné nastavení
2. **Dostupnost modelu**: Zkontrolujte podporu modelu ve vašem regionu
3. **Síťové připojení**: Ujistěte se, že služby spolu komunikují
4. **RBAC oprávnění**: Zkontrolujte, zda aplikace má přístup k OpenAI

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

### Krok 3.1: Úprava AI konfigurace

1. **Aktualizujte model OpenAI:**
```bash
# Přepnout na jiný model (je-li dostupný ve vaší oblasti)
azd env set AZURE_OPENAI_MODEL gpt-4.1

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

### Krok 3.2: Konfigurace podle prostředí

**Nejlepší praxe**: Rozlišovat konfigurace pro vývoj a produkci.

1. **Vytvořte produkční prostředí:**
```bash
azd env new myai-production
```

2. **Nastavte parametry specifické pro produkci:**
```bash
# Výroba obvykle používá vyšší SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Povolit další bezpečnostní funkce
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Cvičení 3.1: Optimalizace nákladů**

**Výzva**: Nakonfigurujte šablonu pro nákladově efektivní vývoj.

**Úkoly:**
1. Identifikujte SKU, které lze nastavit na free/basic úrovně
2. Nastavte proměnné prostředí pro minimální náklady
3. Nasadíte a porovnejte náklady s produkční konfigurací

**Nápovědy:**
- Využijte F0 (free) tier pro Cognitive Services kde je to možné
- Použijte Basic tier pro Search Service ve vývoji
- Zvažte použití Consumption plánu pro Functions

## Modul 4: Bezpečnost a nejlepší produkční praktiky

### Krok 4.1: Bezpečná správa přístupových údajů

**Současná výzva**: Mnoho AI aplikací ukládá API klíče přímo v kódu nebo nebezpečně.

**Řešení AZD**: Managed Identity + integrace Key Vault.

1. **Prohlédněte bezpečnostní konfiguraci ve vaší šabloně:**
```bash
# Hledejte konfiguraci Key Vault a spravované identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Ověřte funkčnost Managed Identity:**
```bash
# Zkontrolujte, zda má webová aplikace správné nastavení identity
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Síťová bezpečnost

1. **Povolte privátní endpointy** (pokud nejsou již nakonfigurovány):

Přidejte do bicep šablony:
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

1. **Nastavte Application Insights:**
```bash
# Application Insights by měl být automaticky nakonfigurován
# Zkontrolujte konfiguraci:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Nastavte AI-specifický monitoring:**

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

**Úkol**: Prohlédněte nasazení z hlediska nejlepších bezpečnostních praktik.

**Checklist:**
- [ ] Žádná hardcoded tajemství v kódu či konfiguraci
- [ ] Využití Managed Identity pro ověřování mezi službami
- [ ] Key Vault uchovává citlivou konfiguraci
- [ ] Síťový přístup je správně omezený
- [ ] Zapnutý monitoring a logování

## Modul 5: Převod vlastní AI aplikace

### Krok 5.1: Pracovní list hodnocení

**Před konverzí aplikace** zodpovězte tyto otázky:

1. **Architektura aplikace:**
   - Jaké AI služby aplikace používá?
   - Jaké výpočetní zdroje potřebuje?
   - Potřebuje databázi?
   - Jaké jsou závislosti mezi službami?

2. **Bezpečnostní požadavky:**
   - Jak citlivá data aplikace zpracovává?
   - Jaké jsou požadavky na soulad s předpisy?
   - Potřebujete privátní síť?

3. **Požadavky na škálování:**
   - Jaký očekáváte provoz?
   - Potřebujete automatické škálování?
   - Jsou regionální požadavky?

### Krok 5.2: Vytvoření AZD šablony

**Postupujte podle tohoto vzoru pro převod aplikace:**

1. **Vytvořte základní strukturu:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializujte šablonu AZD
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

3. **Vytvořte infrastruktturní šablony:**

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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Cvičení 5.1: Výzva pro tvorbu šablony**

**Úkol:** Vytvořte AZD šablonu pro AI aplikaci zpracování dokumentů.

**Požadavky:**
- Microsoft Foundry Models pro analýzu obsahu
- Document Intelligence pro OCR
- Storage Account pro nahrávání dokumentů
- Function App pro zpracovatelskou logiku
- Webová aplikace pro uživatelské rozhraní

**Bonusové body:**
- Přidejte správu chyb
- Zahrňte odhad nákladů
- Nastavte monitorovací dashboardy

## Modul 6: Řešení běžných problémů

### Běžné problémy nasazení

#### Problém 1: Překročen kvóta služby OpenAI
**Příznaky:** Nasazení končí chybou kvóty  
**Řešení:**
```bash
# Zkontrolujte aktuální kvóty
az cognitiveservices usage list --location eastus

# Požádejte o zvýšení kvóty nebo vyzkoušejte jiný region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problém 2: Model není dostupný v regionu
**Příznaky:** Selhání AI odpovědí nebo chyby nasazení modelu  
**Řešení:**
```bash
# Zkontrolujte dostupnost modelu podle regionu
az cognitiveservices model list --location eastus

# Aktualizujte na dostupný model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
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

#### Problém 4: Pomale odpovědi AI
**Kroky vyšetřování:**
1. Zkontrolujte Application Insights pro metriky výkonu
2. Prohlédněte si metriky služby OpenAI v Azure portálu
3. Ověřte síťové připojení a latenci

**Řešení:**
- Zavést cachování pro běžné dotazy
- Použít vhodný OpenAI model pro váš případ použití
- Zvážit read replica pro vysokou zátěž

### **Cvičení 6.1: Výzva pro ladění**

**Scénář:** Nasazení proběhlo, ale aplikace vrací chyby 500.

**Úkoly pro ladění:**
1. Zkontrolujte aplikační logy
2. Ověřte připojení ke službám
3. Otestujte autentizaci
4. Prohlédněte konfiguraci

**Použité nástroje:**
- `azd show` pro přehled nasazení
- Azure portál pro podrobné logy služeb
- Application Insights pro telemetrii aplikace

## Modul 7: Monitoring a optimalizace

### Krok 7.1: Nastavení komplexního monitoringu

1. **Vytvořte vlastní dashboardy:**

Přejděte do Azure portálu a vytvořte dashboard s:
- Počtem a latencí OpenAI požadavků
- Mírou chyb aplikace
- Využitím zdrojů
- Sledováním nákladů

2. **Nastavte upozornění:**
```bash
# Upozornění na vysokou míru chybovosti
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
# Použijte Azure CLI ke získání údajů o nákladech
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementujte kontrolu nákladů:**
- Nastavte upozornění na rozpočet
- Použijte autoscaling politiky
- Zavádějte cachování požadavků
- Sledujte spotřebu tokenů pro OpenAI

### **Cvičení 7.1: Optimalizace výkonu**

**Úkol:** Optimalizujte AI aplikaci pro výkon i náklady.

**Metriky zlepšení:**
- Snížení průměrné doby odpovědi o 20 %
- Snížení měsíčních nákladů o 15 %
- Udržení dostupnosti 99,9 %

**Strategie k vyzkoušení:**
- Zavedení cachování odpovědí
- Optimalizace promptů pro efektivitu tokenů
- Použití vhodných compute SKU
- Nastavení správného autoscalingu

## Závěrečná výzva: End-to-end implementace

### Zadání výzvy

Máte za úkol vytvořit produkčně připraveného AI chatbota pro zákaznický servis s těmito požadavky:

**Funkční požadavky:**
- Webové rozhraní pro interakce se zákazníky
- Integrace s Microsoft Foundry Models pro odpovědi
- Vyhledávání dokumentů pomocí Cognitive Search
- Integrace se stávající databází zákazníků
- Podpora více jazyků

**Nefunkční požadavky:**
- Zvládnout 1000 současných uživatelů
- SLA 99,9 % dostupnost
- Compliance SOC 2
- Náklady pod 500 $ měsíčně
- Nasazení do více prostředí (vývoj, test, produkce)

### Kroky implementace

1. Navrhněte architekturu  
2. Vytvořte AZD šablonu  
3. Implementujte bezpečnostní opatření  
4. Nastavte monitoring a alerty  
5. Vytvořte deploy pipeline  
6. Zdokumentujte řešení  

### Hodnoticí kritéria

- ✅ **Funkčnost**: Splňuje všechny požadavky?  
- ✅ **Bezpečnost**: Jsou dodrženy nejlepší postupy?  
- ✅ **Škálovatelnost**: Zvládne požadovanou zátěž?  
- ✅ **Údržba**: Je kód a infrastruktura přehledná?  
- ✅ **Náklady**: Dodrží rozpočet?  

## Další zdroje

### Dokumentace Microsoftu
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentace služby Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentace Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Ukázkové šablony
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Komunitní zdroje
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certifikát o dokončení

Gratulujeme! Dokončili jste AI Workshop. Nyní byste měli být schopni:

- ✅ Převést existující AI aplikace na šablony AZD
- ✅ Nasadit AI aplikace připravené pro produkci
- ✅ Implementovat nejlepší bezpečnostní postupy pro AI pracovní zátěže
- ✅ Monitorovat a optimalizovat výkon AI aplikací
- ✅ Řešit běžné problémy s nasazením

### Další kroky
1. Aplikujte tyto vzory ve svých vlastních AI projektech
2. Přispějte šablony zpět komunitě
3. Připojte se k Microsoft Foundry Discord pro průběžnou podporu
4. Prozkoumejte pokročilá témata jako nasazení do více regionů

---

**Zpětná vazba k workshopu**: Pomozte nám workshop zlepšit tím, že se podělíte o své zkušenosti na [Microsoft Foundry Discord kanálu #Azure](https://discord.gg/microsoft-azure).

---

**Navigace kapitolami:**
- **📚 Domů kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj s AI na prvním místě
- **⬅️ Předchozí**: [Nasazení AI modelu](ai-model-deployment.md)
- **➡️ Další**: [Nejlepší postupy pro produkční AI](production-ai-practices.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

**Potřebujete pomoc?** Připojte se k naší komunitě pro podporu a diskuze o AZD a nasazeních AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zřeknutí se odpovědnosti**:  
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nezodpovídáme za jakákoliv nedorozumění nebo chyby vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
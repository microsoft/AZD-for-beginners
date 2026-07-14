# AI Workshop Lab: Jak učinit vaše AI řešení nasaditelná pomocí AZD

**Navigace kapitolou:**
- **📚 Úvod do kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj s AI na prvním místě
- **⬅️ Předchozí**: [Nasazení AI modelu](ai-model-deployment.md)
- **➡️ Další**: [Nejlepší praktiky produkční AI](production-ai-practices.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

## Přehled workshopu

Tento praktický lab provede vývojáře procesem převzetí existujícího AI šablony a jeho nasazením pomocí Azure Developer CLI (AZD). Naučíte se základní vzory pro produkční nasazení AI pomocí služeb Microsoft Foundry.

> **Poznámka k validaci (2026-07-13):** Tento workshop byl ověřen na verzi `azd` `1.27.1`. Pokud máte starší nainstalovanou verzi, aktualizujte AZD před spuštěním, aby autentizace, šablony a nasazovací postup odpovídaly níže uvedeným krokům.

**Doba trvání:** 2-3 hodiny  
**Úroveň:** Středně pokročilá  
**Předpoklady:** Základní znalosti Azure, povědomí o konceptech AI/ML

## 🎓 Výukové cíle

Po dokončení tohoto workshopu budete schopni:
- ✅ Převést existující AI aplikaci na použití AZD šablon
- ✅ Konfigurovat Microsoft Foundry služby s AZD
- ✅ Implementovat bezpečnou správu přihlašovacích údajů pro AI služby
- ✅ Nasadit produkčně připravené AI aplikace s monitoringem
- ✅ Řešit běžné problémy při nasazení AI

## Předpoklady

### Požadované nástroje
- Nainstalovaný [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Nainstalovaný [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Nainstalovaný [Git](https://git-scm.com/)
- Editor kódu (doporučeno VS Code)

### Azure zdroje
- Azure předplatné s přístupem přispěvatele
- Přístup ke službám Microsoft Foundry Models (nebo možnost požádat o přístup)
- Oprávnění pro vytváření skupin zdrojů

### Požadované znalosti
- Základní porozumění Azure službám
- Povědomí o příkazovém řádku
- Základní koncepty AI/ML (API, modely, promptování)

## Nastavení labu

### Krok 1: Příprava prostředí

1. **Ověřte instalaci nástrojů:**
```bash
# Zkontrolujte instalaci AZD
azd version

# Zkontrolujte Azure CLI
az --version

# Přihlaste se k Azure pro pracovní postupy AZD
azd auth login

# Přihlaste se do Azure CLI pouze v případě, že plánujete během diagnostiky spouštět příkazy az
az login
```

Pokud pracujete na více tenantů nebo vaše předplatné není automaticky detekováno, zkuste `azd auth login --tenant-id <tenant-id>`.

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
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab cvičení 1.1: Prozkoumejte konfiguraci**

1. **Prozkoumejte soubor azure.yaml:**
```bash
cat azure.yaml
```

**Čemu věnovat pozornost:**
- Definice služeb pro AI komponenty
- Namapování proměnných prostředí
- Konfigurace hostitele

2. **Prohlédněte si hlavní infrastrukturu main.bicep:**
```bash
cat infra/main.bicep
```

**Klíčové AI vzory k identifikaci:**
- Provisioning Microsoft Foundry Models služeb
- Integrace Azure AI Search
- Bezpečná správa klíčů
- Konfigurace síťové bezpečnosti

### **Diskuzní téma:** Proč jsou tyto vzory důležité pro AI

- **Závislosti služeb**: AI aplikace často vyžadují koordinaci více služeb
- **Bezpečnost**: API klíče a endpointy je potřeba bezpečně spravovat
- **Škálovatelnost**: AI úlohy mají specifické požadavky na škálování
- **Řízení nákladů**: AI služby mohou být nákladné, pokud nejsou správně nastavené

## Modul 2: Nasazení první AI aplikace

### Krok 2.1: Inicializace prostředí

1. **Vytvoření nového AZD prostředí:**
```bash
azd env new myai-workshop
```

2. **Nastavení požadovaných parametrů:**
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

**Co se děje během `azd up`:**
- ✅ Provisionuje Microsoft Foundry Models službu
- ✅ Vytváří Azure AI Search službu
- ✅ Nastavuje App Service pro webovou aplikaci
- ✅ Konfiguruje síť a bezpečnost
- ✅ Nasazuje aplikační kód
- ✅ Nastavuje monitoring a logování

2. **Sledujte průběh nasazení** a poznamenejte si vytvářené zdroje.

### Krok 2.3: Ověření nasazení

1. **Zkontrolujte nasazené zdroje:**
```bash
azd show
```

2. **Otevřete nasazenou aplikaci:**
```bash
azd show
```

Otevřete webový endpoint zobrazený ve výstupu `azd show`.

3. **Otestujte AI funkcionalitu:**
   - Přejděte do webové aplikace
   - Vyzkoušejte ukázkové dotazy
   - Ověřte, zda AI odpovědi fungují správně

### **Lab cvičení 2.1: Praktika řešení problémů**

**Scénář**: Nasazení proběhlo úspěšně, ale AI neodpovídá.

**Běžné problémy k prověření:**
1. **OpenAI API klíče**: Zkontrolujte jejich správné nastavení
2. **Dostupnost modelu**: Zkontrolujte podporu modelu ve vaší oblasti
3. **Síťové připojení**: Ověřte, zda mohou služby komunikovat
4. **Oprávnění RBAC**: Zkontrolujte, zda aplikace má přístup k OpenAI

**Příkazy pro ladění:**
```bash
# Zkontrolujte proměnné prostředí
azd env get-values

# Zobrazit protokoly nasazení
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Zkontrolujte stav nasazení OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Přizpůsobení AI aplikací dle vašich potřeb

### Krok 3.1: Úprava AI konfigurace

1. **Aktualizujte OpenAI model:**
```bash
# Změnit na jiný model (pokud je dostupný ve vaší oblasti)
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

### Krok 3.2: Konfigurace specifické pro prostředí

**Nejlepší praxe**: Různé konfigurace pro vývoj a produkci.

1. **Vytvořte produkční prostředí:**
```bash
azd env new myai-production
```

2. **Nastavte produkční parametry:**
```bash
# Výroba obvykle používá vyšší čísla SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Povolit další bezpečnostní funkce
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab cvičení 3.1: Optimalizace nákladů**

**Úkol**: Nakonfigurujte šablonu pro nákladově efektivní vývoj.

**Úkoly:**
1. Identifikujte, které SKUs lze nastavit na bezplatné/ základní úrovně
2. Konfigurujte proměnné prostředí pro minimální náklady
3. Nasazení a porovnání nákladů s produkční konfigurací

**Nápovědy k řešení:**
- Použijte úroveň F0 (zdarma) pro Azure AI Služby, pokud je to možné
- Použijte základní úroveň pro Search službu ve vývoji
- Zvažte použití Consumption plánu pro Functions

## Modul 4: Bezpečnost a nejlepší produkční praktiky

### Krok 4.1: Bezpečná správa přihlašovacích údajů

**Současný problém**: Mnoho AI aplikací tvrdě kóduje API klíče nebo používá nezabezpečené úložiště.

**Řešení AZD**: Managed Identity + integrace s Key Vault.

1. **Projděte bezpečnostní konfiguraci ve vaší šabloně:**
```bash
# Hledejte konfiguraci Key Vault a Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Ověřte funkčnost Managed Identity:**
```bash
# Zkontrolujte, zda má webová aplikace správnou konfiguraci identity
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Krok 4.2: Síťová bezpečnost

1. **Povolte privátní endpointy** (pokud ještě nejsou nastaveny):

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

### Krok 4.3: Monitoring a observabilita

1. **Konfigurace Application Insights:**
```bash
# Application Insights by mělo být automaticky nakonfigurováno
# Zkontrolujte konfiguraci:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Nastavení AI specifického monitoringu:**

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

### **Lab cvičení 4.1: Bezpečnostní audit**

**Úkol**: Projděte své nasazení a ověřte dodržování bezpečnostních nejlepších praktik.

**Kontrolní seznam:**
- [ ] Žádná tvrdě zakódovaná tajemství v kódu nebo konfiguraci
- [ ] Pro autentizaci služeb používána Managed Identity
- [ ] Key Vault uchovává citlivou konfiguraci
- [ ] Přístup do sítě správně omezen
- [ ] Povolen monitoring a logování

## Modul 5: Převod vlastní AI aplikace

### Krok 5.1: Pracovní list hodnocení

**Před převodem vaší aplikace odpovězte na tyto otázky:**

1. **Architektura aplikace:**
   - Jaké AI služby vaše aplikace využívá?
   - Jaké výpočetní zdroje potřebuje?
   - Potřebuje databázi?
   - Jaké jsou závislosti mezi službami?

2. **Požadavky na bezpečnost:**
   - Jaké citlivé údaje aplikace zpracovává?
   - Jaké legislativní požadavky musíte splnit?
   - Potřebujete privátní síť?

3. **Požadavky na škálování:**
   - Jaké je očekávané zatížení?
   - Potřebujete automatické škálování?
   - Jsou nějaké regionální požadavky?

### Krok 5.2: Vytvoření vlastní AZD šablony

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

**infra/main.bicep** - hlavní šablona:
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

### **Lab cvičení 5.1: Výzva na tvorbu šablony**

**Výzva**: Vytvořte AZD šablonu pro AI aplikaci zpracovávající dokumenty.

**Požadavky:**
- Microsoft Foundry Models pro analýzu obsahu
- Document Intelligence pro OCR
- Storage Account pro nahrávání dokumentů
- Function App pro zpracovatelskou logiku
- Webová aplikace pro uživatelské rozhraní

**Bonusové body:**
- Přidejte správu chyb
- Uveďte odhad nákladů
- Nastavte sledovací dashboardy

## Modul 6: Řešení běžných problémů

### Běžné problémy při nasazení

#### Problém 1: Překročená kvóta služby OpenAI
**Příznaky:** Nasazení selhává s chybou kvóty
**Řešení:**
```bash
# Zkontrolujte aktuální limity
az cognitiveservices usage list --location eastus

# Požádejte o zvýšení limitu nebo vyzkoušejte jiný region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problém 2: Model není dostupný v regionu
**Příznaky:** AI neodpovídá nebo chyby při nasazení modelu
**Řešení:**
```bash
# Zkontrolujte dostupnost modelu podle regionu
az cognitiveservices model list --location eastus

# Aktualizovat na dostupný model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problém 3: Problémy s oprávněními
**Příznaky:** 403 Forbidden chyby při volání AI služeb
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

### Výkonnostní problémy

#### Problém 4: Pomalé AI odpovědi
**Vyšetřovací kroky:**
1. Prohlédněte metriky výkonu v Application Insights
2. Zkontrolujte metriky OpenAI služby v Azure portálu
3. Ověřte síťové připojení a latenci

**Řešení:**
- Implementujte cachování běžných dotazů
- Použijte vhodný OpenAI model pro váš případ použití
- Zvažte read replicas pro scénáře s vysokým zatížením

### **Lab cvičení 6.1: Výzva k ladění**

**Scénář**: Nasazení bylo úspěšné, ale aplikace vrací chyby 500.

**Úkoly pro ladění:**
1. Prohlédněte si aplikační logy
2. Ověřte konektivitu služeb
3. Otestujte autentizaci
4. Zkontrolujte konfiguraci

**Nástroje k použití:**
- `azd show` pro přehled nasazení
- Azure portál pro detailní logy služeb
- Application Insights pro telemetrii aplikace

## Modul 7: Monitoring a optimalizace

### Krok 7.1: Nastavení komplexního monitoringu

1. **Vytvořte vlastní dashboardy:**

Přihlaste se do Azure portálu a vytvořte dashboard s:
- Počtem a latencí požadavků OpenAI
- Mírou chyb aplikace
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
# Použijte Azure CLI pro získání dat o nákladech
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementujte řízení nákladů:**
- Nastavte upozornění na rozpočet
- Používejte politiky automatického škálování
- Implementujte cachování požadavků
- Sledujte spotřebu tokenů pro OpenAI

### **Lab cvičení 7.1: Optimalizace výkonu**

**Úkol**: Optimalizujte vaši AI aplikaci pro výkon i náklady.

**Metriky k vylepšení:**
- Snižte průměrnou dobu odpovědi o 20%
- Snižte měsíční náklady o 15%
- Udržujte 99.9% dostupnost

**Strategie k vyzkoušení:**
- Implementujte cachování odpovědí
- Optimalizujte promptování pro efektivitu tokenů
- Použijte vhodné výpočetní SKU
- Nastavte správné automatické škálování

## Závěrečná výzva: End-to-End implementace

### Scénář výzvy

Máte za úkol vytvořit produkčně připraveného AI chatbota pro zákaznickou podporu se těmito požadavky:

**Funkční požadavky:**
- Webové rozhraní pro interakce se zákazníky
- Integrace s Microsoft Foundry Models pro odpovědi
- Vyhledávání dokumentů pomocí Azure AI Search
- Integrace se stávající databází zákazníků
- Vícejazyčná podpora

**Nefunkční požadavky:**
- Zvládnout 1000 současných uživatelů
- SLA 99.9% dostupnosti
- SOC 2 shoda
- Náklady pod 500 USD/měsíc
- Nasazení do více prostředí (vývoj, test, produkce)

### Kroky implementace

1. **Navrhněte architekturu**
2. **Vytvořte AZD šablonu**
3. **Implementujte bezpečnostní opatření**
4. **Nastavte monitoring a upozornění**
5. **Vytvořte deployment pipeline**
6. **Zdokumentujte řešení**

### Kritéria hodnocení

- ✅ **Funkčnost**: Splňuje všechny požadavky?
- ✅ **Bezpečnost**: Jsou implementovány nejlepší bezpečnostní praktiky?
- ✅ **Škálovatelnost**: Zvládne zatížení?
- ✅ **Udržovatelnost**: Je kód a infrastruktura dobře organizovaná?
- ✅ **Náklady**: Je dodržen rozpočet?

## Další zdroje

### Microsoft dokumentace
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentace Microsoft Foundry Models služeb](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentace Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Vzorové šablony
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Komunitní zdroje
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD šablony](https://azure.github.io/awesome-azd/)

## 🎓 Certifikát o absolvování

Gratulujeme! Úspěšně jste absolvovali AI Workshop Lab. Nyní byste měli být schopni:

- ✅ Převést existující AI aplikace na šablony AZD
- ✅ Nasadit AI aplikace připravené pro produkci
- ✅ Implementovat bezpečnostní nejlepší postupy pro AI pracovní zátěže
- ✅ Monitorovat a optimalizovat výkon AI aplikací
- ✅ Řešit běžné problémy při nasazení

### Další kroky
1. Aplikujte tyto vzory do vašich vlastních AI projektů
2. Přispívejte šablonami zpět komunitě
3. Připojte se k Microsoft Foundry Discord pro průběžnou podporu
4. Prozkoumejte pokročilá témata jako nasazení do více regionů

---

**Zpětná vazba k workshopu**: Pomozte nám zlepšit tento workshop sdílením vašich zkušeností v [Microsoft Foundry Discord #Azure kanálu](https://discord.gg/microsoft-azure).

---

**Navigace kapitol:**
- **📚 Domovská stránka kurzu**: [AZD Pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj s AI na prvním místě
- **⬅️ Předchozí**: [Nasazení AI modelu](ai-model-deployment.md)
- **➡️ Další**: [Nejlepší postupy produkčního AI](production-ai-practices.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

**Potřebujete pomoc?** Připojte se k naší komunitě pro podporu a diskuze o AZD a nasazeních AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
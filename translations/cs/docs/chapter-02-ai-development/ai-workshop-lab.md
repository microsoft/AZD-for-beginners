# AI Workshop Lab: Nasazení vašich AI řešení pomocí AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD pro začátečníky](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

Tento praktický lab vede vývojáře procesem převodu existující AI šablony a jejím nasazením pomocí Azure Developer CLI (AZD). Naučíte se zásadní vzory pro produkční nasazení AI pomocí služeb Microsoft Foundry.

> **Validation note (2026-03-25):** Tento workshop byl zkontrolován proti `azd` `1.23.12`. Pokud je vaše lokální instalace starší, aktualizujte AZD před zahájením, aby autentizace, šablony a proces nasazení odpovídaly krokům níže.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Základní znalosti Azure, povědomí o AI/ML konceptech

## 🎓 Learning Objectives

Na konci tohoto workshopu budete schopni:
- ✅ Převést existující AI aplikaci tak, aby používala AZD šablony
- ✅ Nakonfigurovat služby Microsoft Foundry pomocí AZD
- ✅ Implementovat bezpečné řízení přihlašovacích údajů pro AI služby
- ✅ Nasadit produkčně připravené AI aplikace s monitorováním
- ✅ Řešit běžné problémy při nasazování AI

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nainstalovaný
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nainstalovaný
- [Git](https://git-scm.com/) nainstalovaný
- Editor kódu (doporučený VS Code)

### Azure Resources
- Azure subscription s právy přispěvatele (contributor)
- Přístup ke službám Microsoft Foundry Models (nebo možnost požádat o přístup)
- Oprávnění pro vytváření resource group

### Knowledge Prerequisites
- Základní porozumění Azure službám
- Zkušenost s příkazovým řádkem
- Základní AI/ML koncepty (API, modely, promptování)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# Zkontrolovat instalaci AZD
azd version

# Zkontrolovat Azure CLI
az --version

# Přihlásit se do Azure pro pracovní postupy AZD
azd auth login

# Přihlásit se do Azure CLI pouze pokud plánujete spouštět příkazy az během diagnostiky
az login
```

If you work across multiple tenants or your subscription is not detected automatically, retry with `azd auth login --tenant-id <tenant-id>`.

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

Prozkoumejte klíčové soubory v AZD šabloně připravené pro AI:

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

### **Lab Exercise 1.1: Explore the Configuration**

1. **Examine the azure.yaml file:**
```bash
cat azure.yaml
```

**What to look for:**
- Definice služeb pro AI komponenty
- Mapování proměnných prostředí
- Hostitelké konfigurace

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Zřizování služby Microsoft Foundry Models
- Integrace Azure AI Search
- Bezpečné řízení klíčů
- Konfigurace síťové bezpečnosti

### **Discussion Point:** Why These Patterns Matter for AI

- **Service Dependencies**: AI aplikace často vyžadují více koordinovaných služeb
- **Security**: API klíče a koncové body potřebují bezpečné uložení
- **Scalability**: AI pracovní zátěže mají specifické požadavky na škálování
- **Cost Management**: AI služby mohou být nákladné, pokud nejsou správně nastaveny

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# Nastavte preferovaný region Azure
azd env set AZURE_LOCATION eastus

# Volitelné: Nastavte konkrétní model OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Zřizuje službu Microsoft Foundry Models
- ✅ Vytváří službu Azure AI Search
- ✅ Nastavuje App Service pro webovou aplikaci
- ✅ Konfiguruje síťování a bezpečnost
- ✅ Nasazuje kód aplikace
- ✅ Nastavuje monitorování a logování

2. **Monitor the deployment progress** and note the resources being created.

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show
```

Open the web endpoint shown in the `azd show` output.

3. **Test the AI functionality:**
   - Přejděte do webové aplikace
   - Vyzkoušejte ukázkové dotazy
   - Ověřte, že AI odpovědi fungují

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: Nasazení proběhlo úspěšně, ale AI neodpovídá.

**Common issues to check:**
1. **OpenAI API keys**: Ověřte, že jsou správně nastaveny
2. **Model availability**: Zkontrolujte, zda váš region model podporuje
3. **Network connectivity**: Ujistěte se, že služby mohou komunikovat
4. **RBAC permissions**: Ověřte, že aplikace má přístup k OpenAI

**Debugging commands:**
```bash
# Zkontrolovat proměnné prostředí
azd env get-values

# Zobrazit protokoly nasazení
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Zkontrolovat stav nasazení OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# Přejít na jiný model (pokud je ve vašem regionu dostupný)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Znovu nasadit s novou konfigurací
azd deploy
```

2. **Add additional AI services:**

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

### Step 3.2: Environment-Specific Configurations

**Best Practice**: Různé konfigurace pro vývoj vs produkci.

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# Ve výrobě se obvykle používají vyšší SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Povolit další bezpečnostní funkce
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: Nakonfigurujte šablonu pro nákladově efektivní vývoj.

**Tasks:**
1. Identifikujte, které SKU lze nastavit na free/basic úrovně
2. Nakonfigurujte proměnné prostředí pro minimální náklady
3. Nasazení a porovnání nákladů s produkční konfigurací

**Solution hints:**
- Použijte F0 (free) tier pro Azure AI Services, kde je to možné
- Použijte Basic tier pro Search Service ve vývoji
- Zvažte použití Consumption plánu pro Functions

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: Mnoho AI aplikací má v kódu napevno zadané API klíče nebo je ukládá nebezpečným způsobem.

**AZD Solution**: Spravovaná identita + integrace s Key Vault.

1. **Review the security configuration in your template:**
```bash
# Hledejte konfiguraci Key Vault a spravované identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# Zkontrolujte, zda má webová aplikace správnou konfiguraci identity
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (if not already configured):

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

### Step 4.3: Monitoring and Observability

1. **Configure Application Insights:**
```bash
# Application Insights by měl být automaticky nakonfigurován
# Zkontrolujte konfiguraci:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

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

### **Lab Exercise 4.1: Security Audit**

**Task**: Zkontrolujte své nasazení z hlediska bezpečnostních doporučení.

**Checklist:**
- [ ] Žádné hardcodované tajné údaje v kódu nebo konfiguraci
- [ ] Používá se Managed Identity pro autentifikaci mezi službami
- [ ] Key Vault ukládá citlivou konfiguraci
- [ ] Přístup do sítě je správně omezen
- [ ] Monitorování a logování jsou povoleny

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Before converting your app**, odpovězte na tyto otázky:

1. **Application Architecture:**
   - Jaké AI služby vaše aplikace používá?
   - Jaké výpočetní prostředky potřebuje?
   - Potřebuje databázi?
   - Jaké jsou závislosti mezi službami?

2. **Security Requirements:**
   - Jaké citlivé údaje vaše aplikace zpracovává?
   - Jaké požadavky na compliance máte?
   - Potřebujete privátní síťování?

3. **Scaling Requirements:**
   - Jaké jsou očekávané zátěže?
   - Potřebujete autoscaling?
   - JSou regionální požadavky?

### Step 5.2: Create Your AZD Template

**Follow this pattern to convert your app:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializovat AZD šablonu
azd init --template minimal
```

2. **Create azure.yaml:**
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

3. **Create infrastructure templates:**

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

### **Lab Exercise 5.1: Template Creation Challenge**

**Challenge**: Vytvořte AZD šablonu pro AI aplikaci zpracovávající dokumenty.

**Requirements:**
- Microsoft Foundry Models pro analýzu obsahu
- Document Intelligence pro OCR
- Storage Account pro nahrávání dokumentů
- Function App pro zpracovatelskou logiku
- Web app pro uživatelské rozhraní

**Bonus points:**
- Přidejte správné zpracování chyb
- Začněte odhad nákladů
- Nastavte monitorovací dashboardy

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** Nasazení selže s chybou kvóty
**Solutions:**
```bash
# Zkontrolujte aktuální kvóty
az cognitiveservices usage list --location eastus

# Požádejte o zvýšení kvóty nebo vyzkoušejte jiný region
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** AI odpovědi selhávají nebo se objeví chyby při nasazení modelu
**Solutions:**
```bash
# Zkontrolujte dostupnost modelu podle regionu
az cognitiveservices model list --location eastus

# Aktualizujte na dostupný model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** 403 Forbidden chyby při volání AI služeb
**Solutions:**
```bash
# Zkontrolujte přiřazení rolí
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Přidejte chybějící role
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. Zkontrolujte Application Insights pro metriky výkonu
2. Prohlédněte metriky služby OpenAI v Azure portálu
3. Ověřte síťovou konektivitu a latenci

**Solutions:**
- Implementujte cache pro běžné dotazy
- Použijte vhodný OpenAI model pro váš případ použití
- Zvažte read repliku pro scénáře s vysokým zatížením

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: Nasazení proběhlo úspěšně, ale aplikace vrací 500 chyby.

**Debugging tasks:**
1. Zkontrolujte logy aplikace
2. Ověřte konektivitu služeb
3. Otestujte autentifikaci
4. Prohlédněte konfiguraci

**Tools to use:**
- `azd show` pro přehled nasazení
- Azure portal pro podrobné logy služeb
- Application Insights pro telemetrii aplikace

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Přejděte do Azure portálu a vytvořte dashboard obsahující:
- Počet požadavků na OpenAI a latenci
- Míra chyb aplikace
- Využití zdrojů
- Sledování nákladů

2. **Set up alerts:**
```bash
# Upozornění na vysokou chybovost
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **Analyze current costs:**
```bash
# Použijte Azure CLI k získání dat o nákladech
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- Nastavte upozornění na rozpočet
- Použijte autoscaling politiky
- Implementujte cache požadavků
- Sledujte využití tokenů pro OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Task**: Optimalizujte vaši AI aplikaci jak pro výkon, tak pro náklady.

**Metrics to improve:**
- Snížit průměrný čas odpovědi o 20%
- Snížit měsíční náklady o 15%
- Udržet dostupnost 99,9 %

**Strategies to try:**
- Implementovat response caching
- Optimalizovat promptování pro efektivitu tokenů
- Použít vhodné compute SKU
- Nastavit správný autoscaling

## Final Challenge: End-to-End Implementation

### Challenge Scenario

Máte za úkol vytvořit produkčně připraveného AI chatbota pro zákaznickou podporu s těmito požadavky:

**Functional Requirements:**
- Webové rozhraní pro interakce se zákazníky
- Integrace s Microsoft Foundry Models pro generování odpovědí
- Vyhledávání dokumentů pomocí Azure AI Search
- Integrace se stávající zákaznickou databází
- Podpora vícejazyčnosti

**Non-Functional Requirements:**
- Zvládnout 1000 současných uživatelů
- SLA 99.9% dostupnost
- Soulad s SOC 2
- Náklady pod $500/měsíc
- Nasazení do více prostředí (dev, staging, prod)

### Implementation Steps

1. Navrhněte architekturu
2. Vytvořte AZD šablonu
3. Implementujte bezpečnostní opatření
4. Nastavte monitorování a alertování
5. Vytvořte deployment pipelines
6. Zdokumentujte řešení

### Evaluation Criteria

- ✅ **Functionality**: Splňuje všechny požadavky?
- ✅ **Security**: Jsou implementovány nejlepší postupy?
- ✅ **Scalability**: Zvládne zatížení?
- ✅ **Maintainability**: Je kód a infrastruktura dobře uspořádána?
- ✅ **Cost**: Drží se v rozpočtu?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Komunitní zdroje
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Osvědčení o dokončení

Gratulujeme! Dokončili jste AI Workshop Lab. Nyní byste měli být schopni:

- ✅ Převést existující AI aplikace na šablony AZD
- ✅ Nasadit produkčně připravené AI aplikace
- ✅ Implementovat osvědčené bezpečnostní postupy pro AI pracovní zátěže
- ✅ Monitorovat a optimalizovat výkon AI aplikací
- ✅ Řešit běžné problémy při nasazování

### Další kroky
1. Použijte tyto vzory ve svých vlastních AI projektech
2. Přispějte šablonami zpět komunitě
3. Připojte se k Microsoft Foundry Discordu pro průběžnou podporu
4. Prozkoumejte pokročilá témata, jako je nasazování v několika regionech

---

**Workshop Feedback**: Pomozte nám vylepšit tento workshop tím, že s námi sdílíte své zkušenosti v [Microsoft Foundry Discord kanálu #Azure](https://discord.gg/microsoft-azure).

---

**Navigace kapitolami:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Předchozí**: [Nasazení AI modelu](ai-model-deployment.md)
- **➡️ Další**: [Nejlepší postupy pro produkční AI](production-ai-practices.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

**Potřebujete pomoc?** Připojte se k naší komunitě pro podporu a diskuse o AZD a nasazování AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
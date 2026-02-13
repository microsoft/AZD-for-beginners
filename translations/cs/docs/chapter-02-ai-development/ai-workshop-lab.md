# AI Workshop Lab: Vytvoření vašich AI řešení nasaditelných pomocí AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

Tento praktický lab provede vývojáře procesem převzetí existující AI šablony a jejím nasazením pomocí Azure Developer CLI (AZD). Naučíte se zásadní vzory pro produkční nasazení AI pomocí služeb Microsoft Foundry.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Learning Objectives

Na konci tohoto workshopu budete schopni:
- ✅ Převést existující AI aplikaci tak, aby používala AZD šablony
- ✅ Konfigurovat služby Microsoft Foundry pomocí AZD
- ✅ Implementovat bezpečnou správu pověření pro AI služby
- ✅ Nasadit produkčně připravené AI aplikace s monitoringem
- ✅ Řešit běžné problémy při nasazení AI

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) nainstalovaný
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) nainstalovaný
- [Git](https://git-scm.com/) nainstalovaný
- Editor kódu (doporučen VS Code)

### Azure Resources
- Azure předplatné s oprávněním přispěvatele
- Přístup k Azure OpenAI službám (nebo možnost požádat o přístup)
- Oprávnění k vytváření skupin prostředků

### Knowledge Prerequisites
- Základní porozumění službám Azure
- Zkušenost s příkazovým řádkem
- Základní koncepty AI/ML (API, modely, promptování)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# Zkontrolujte instalaci AZD
azd version

# Zkontrolujte Azure CLI
az --version

# Přihlaste se do Azure
az login
azd auth login
```

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
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
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
- Konfigurace hostitele

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Provisioning služby Azure OpenAI
- Integrace Cognitive Search
- Bezpečná správa klíčů
- Nastavení síťového zabezpečení

### **Discussion Point:** Why These Patterns Matter for AI

- **Service Dependencies**: AI aplikace často vyžadují více koordinovaných služeb
- **Security**: API klíče a koncové body je potřeba spravovat bezpečně
- **Scalability**: AI zátěže mají specifické požadavky na škálování
- **Cost Management**: AI služby mohou být nákladné, pokud nejsou správně konfigurovány

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
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Provisions Azure OpenAI service
- ✅ Creates Cognitive Search service
- ✅ Sets up App Service for the web application
- ✅ Configures networking and security
- ✅ Deploys application code
- ✅ Sets up monitoring and logging

2. **Monitor the deployment progress** and note the resources being created.

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Test the AI functionality:**
   - Přejděte na webovou aplikaci
   - Vyzkoušejte ukázkové dotazy
   - Ověřte, že AI odpovědi fungují

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: Nasazení proběhlo úspěšně, ale AI neodpovídá.

**Common issues to check:**
1. **OpenAI API keys**: Ověřte, že jsou správně nastavené
2. **Model availability**: Zkontrolujte, zda váš region model podporuje
3. **Network connectivity**: Zajistěte, aby služby mohly komunikovat
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
# Přepnout na jiný model (pokud je ve vašem regionu k dispozici)
azd env set AZURE_OPENAI_MODEL gpt-4

# Znovu nasadit s novou konfigurací
azd deploy
```

2. **Add additional AI services:**

Edit `infra/main.bicep` to add Document Intelligence:

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

**Best Practice**: Různé konfigurace pro vývoj a produkci.

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# V produkci se obvykle používají SKU vyšší třídy
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
3. Nasadťe a porovnejte náklady s produkční konfigurací

**Solution hints:**
- Použijte F0 (free) úroveň pro Cognitive Services, když je to možné
- Použijte Basic úroveň pro Search Service ve vývoji
- Zvažte použití Consumption plánu pro Functions

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: Mnoho AI aplikací má API klíče napevno v kódu nebo používá nezabezpečené úložiště.

**AZD Solution**: Managed Identity + Key Vault integrace.

1. **Review the security configuration in your template:**
```bash
# Hledejte konfiguraci Key Vault a spravované identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# Zkontrolujte, zda má webová aplikace správnou konfiguraci identity.
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (if not already configured):

Add to your bicep template:
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
# Application Insights by mělo být automaticky nakonfigurováno
# Zkontrolujte konfiguraci:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

Add custom metrics for AI operations:
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

**Task**: Zkontrolujte své nasazení z hlediska bezpečnostních osvědčených postupů.

**Checklist:**
- [ ] Žádné tvrdě zakódované tajné klíče v kódu nebo konfiguraci
- [ ] Managed Identity použita pro autentizaci služba-ke-službě
- [ ] Key Vault ukládá citlivé konfigurace
- [ ] Přístup v síti je řádně omezen
- [ ] Monitoring a logging jsou povoleny

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Before converting your app**, odpovězte na tyto otázky:

1. **Application Architecture:**
   - Jaké AI služby vaše aplikace používá?
   - Jaké výpočetní zdroje potřebuje?
   - Vyžaduje databázi?
   - Jaké jsou závislosti mezi službami?

2. **Security Requirements:**
   - Jaké citlivé údaje aplikace zpracovává?
   - Jaké požadavky na shodu (compliance) máte?
   - Potřebujete privátní síťování?

3. **Scaling Requirements:**
   - Jaké je očekávané zatížení?
   - Potřebujete auto-scaling?
   - Jsou požadavky na regiony?

### Step 5.2: Create Your AZD Template

**Follow this pattern to convert your app:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializovat šablonu AZD
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

### **Lab Exercise 5.1: Template Creation Challenge**

**Challenge**: Vytvořte AZD šablonu pro AI aplikaci zpracovávající dokumenty.

**Requirements:**
- Azure OpenAI pro analýzu obsahu
- Document Intelligence pro OCR
- Storage Account pro nahrávání dokumentů
- Function App pro zpracovatelskou logiku
- Webová aplikace pro uživatelské rozhraní

**Bonus points:**
- Přidejte správné zpracování chyb
- Zahrňte odhad nákladů
- Nastavte monitoring dashboardy

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** Nasazení selže s chybou kvóty
**Solutions:**
```bash
# Zkontrolujte aktuální kvóty
az cognitiveservices usage list --location eastus

# Požádejte o zvýšení kvót nebo zkuste jiný region
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** AI odpovědi selhávají nebo chyby při nasazení modelu
**Solutions:**
```bash
# Zkontrolovat dostupnost modelu podle regionu
az cognitiveservices model list --location eastus

# Aktualizovat na dostupný model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
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
- Implementujte cache pro časté dotazy
- Použijte vhodný OpenAI model pro váš případ užití
- Zvažte read repliky pro scénáře s vysokým zatížením

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: Nasazení proběhlo úspěšně, ale aplikace vrací 500 chyby.

**Debugging tasks:**
1. Zkontrolujte logy aplikace
2. Ověřte konektivitu služeb
3. Otestujte autentizaci
4. Zkontrolujte konfiguraci

**Tools to use:**
- `azd show` pro přehled nasazení
- Azure portál pro detailní logy služeb
- Application Insights pro telemetrii aplikace

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Přejděte do Azure portálu a vytvořte dashboard s:
- Počtem požadavků na OpenAI a latencí
- Mírou chyb aplikace
- Využitím zdrojů
- Sledováním nákladů

2. **Set up alerts:**
```bash
# Upozornění na vysokou míru chyb
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
# Použijte Azure CLI k získání údajů o nákladech
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- Nastavte upozornění rozpočtu
- Použijte autoscaling politiky
- Implementujte cache požadavků
- Sledujte spotřebu tokenů pro OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Task**: Optimalizujte vaši AI aplikaci z hlediska výkonu i nákladů.

**Metrics to improve:**
- Snížit průměrnou dobu odezvy o 20%
- Snížit měsíční náklady o 15%
- Udržet dostupnost 99.9%

**Strategies to try:**
- Implementujte cache odpovědí
- Optimalizujte promptování pro efektivitu tokenů
- Použijte vhodné compute SKU
- Nastavte správné autoscaling

## Final Challenge: End-to-End Implementation

### Challenge Scenario

Máte za úkol vytvořit produkčně připraveného AI chatbota pro zákaznickou podporu s těmito požadavky:

**Functional Requirements:**
- Webové rozhraní pro interakce se zákazníky
- Integrace s Azure OpenAI pro odpovědi
- Vyhledávání v dokumentech pomocí Cognitive Search
- Integrace se stávající databází zákazníků
- Podpora více jazyků

**Non-Functional Requirements:**
- Zvládnout 1000 současných uživatelů
- SLA 99.9% uptime
- Soulad se SOC 2
- Náklady pod $500/měsíc
- Nasazení do více prostředí (dev, staging, prod)

### Implementation Steps

1. **Design the architecture**
2. **Create the AZD template**
3. **Implement security measures**
4. **Set up monitoring and alerting**
5. **Create deployment pipelines**
6. **Document the solution**

### Evaluation Criteria

- ✅ **Functionality**: Splňuje všechny požadavky?
- ✅ **Security**: Jsou implementovány osvědčené postupy?
- ✅ **Scalability**: Zvládne zatížení?
- ✅ **Maintainability**: Je kód a infrastruktura dobře organizovaná?
- ✅ **Cost**: Drží se v rámci rozpočtu?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate
Gratulujeme! Úspěšně jste dokončili AI Workshop Lab. Nyní byste měli být schopni:

- ✅ Převést stávající AI aplikace na šablony AZD
- ✅ Nasadit produkčně připravené AI aplikace
- ✅ Uplatnit nejlepší bezpečnostní postupy pro AI pracovní zátěže
- ✅ Monitorovat a optimalizovat výkon AI aplikací
- ✅ Řešit běžné problémy s nasazením

### Další kroky
1. Aplikujte tyto vzory ve svých vlastních AI projektech
2. Přispějte šablonami zpět komunitě
3. Připojte se k Microsoft Foundry Discordu pro průběžnou podporu
4. Prozkoumejte pokročilá témata, jako je nasazení do více regionů

---

**Zpětná vazba k workshopu**: Pomozte nám zlepšit tento workshop sdílením své zkušenosti v [kanálu #Azure na Microsoft Foundry Discordu](https://discord.gg/microsoft-azure).

---

**Navigace kapitol:**
- **📚 Domov kurzu**: [AZD For Beginners](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj zaměřený na AI
- **⬅️ Předchozí**: [Nasazení AI modelu](ai-model-deployment.md)
- **➡️ Další**: [Nejlepší postupy pro produkční AI](production-ai-practices.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

**Potřebujete pomoc?** Připojte se k naší komunitě pro podporu a diskuse o AZD a nasazení AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí služby automatického překladu [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro kritické informace doporučujeme využít profesionální lidský překlad. Nejsme odpovědni za žádná nedorozumění nebo mylné výklady, které mohou vzniknout v důsledku použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
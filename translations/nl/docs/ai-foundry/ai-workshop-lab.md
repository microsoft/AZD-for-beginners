<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ed84aca3294b926341ef9e0a5a78059e",
  "translation_date": "2025-09-18T06:49:06+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "nl"
}
-->
# AI Workshop Lab: Je AI-oplossingen AZD-Deployable maken

**Hoofdstuk Navigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-First Ontwikkeling
- **⬅️ Vorige**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Volgende**: [Productie AI Best Practices](production-ai-practices.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../getting-started/configuration.md)

## Workshop Overzicht

Deze praktische lab begeleidt ontwikkelaars bij het proces van het nemen van een bestaande AI-toepassing en deze deployable maken met behulp van Azure Developer CLI (AZD). Je leert essentiële patronen voor productie AI-deployments met Azure AI Foundry-services.

**Duur:** 2-3 uur  
**Niveau:** Gemiddeld  
**Vereisten:** Basiskennis van Azure, bekendheid met AI/ML-concepten

## 🎓 Leerdoelen

Aan het einde van deze workshop kun je:
- ✅ Een bestaande AI-toepassing omzetten naar AZD-sjablonen
- ✅ Azure AI Foundry-services configureren met AZD
- ✅ Veilige credential management implementeren voor AI-services
- ✅ Productieklare AI-toepassingen deployen met monitoring
- ✅ Veelvoorkomende AI-deployment problemen oplossen

## Vereisten

### Benodigde Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) geïnstalleerd
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) geïnstalleerd
- [Git](https://git-scm.com/) geïnstalleerd
- Code-editor (VS Code aanbevolen)

### Azure Resources
- Azure-abonnement met contributor-toegang
- Toegang tot Azure OpenAI-services (of mogelijkheid om toegang aan te vragen)
- Machtigingen om resourcegroepen te maken

### Kennisvereisten
- Basisbegrip van Azure-services
- Bekendheid met command-line interfaces
- Basis AI/ML-concepten (API's, modellen, prompts)

## Lab Setup

### Stap 1: Voorbereiding van de omgeving

1. **Controleer toolinstallaties:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Clone de workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Begrijpen van AZD-structuur voor AI-toepassingen

### Anatomie van een AI AZD-sjabloon

Verken de belangrijkste bestanden in een AI-klaar AZD-sjabloon:

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

### **Lab Oefening 1.1: Verken de Configuratie**

1. **Bekijk het azure.yaml-bestand:**
```bash
cat azure.yaml
```

**Waar op te letten:**
- Service-definities voor AI-componenten
- Mapping van omgevingsvariabelen
- Hostconfiguraties

2. **Bekijk de main.bicep infrastructuur:**
```bash
cat infra/main.bicep
```

**Belangrijke AI-patronen om te identificeren:**
- Provisioning van Azure OpenAI-service
- Integratie van Cognitive Search
- Beheer van beveiligde sleutels
- Netwerkbeveiligingsconfiguraties

### **Discussiepunt:** Waarom deze patronen belangrijk zijn voor AI

- **Service-afhankelijkheden**: AI-apps vereisen vaak meerdere gecoördineerde services
- **Beveiliging**: API-sleutels en endpoints moeten veilig worden beheerd
- **Schaalbaarheid**: AI-workloads hebben unieke schaalvereisten
- **Kostenbeheer**: AI-services kunnen duur zijn als ze niet goed worden geconfigureerd

## Module 2: Je eerste AI-toepassing deployen

### Stap 2.1: Initialiseer de omgeving

1. **Maak een nieuwe AZD-omgeving aan:**
```bash
azd env new myai-workshop
```

2. **Stel vereiste parameters in:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Stap 2.2: Deploy de infrastructuur en toepassing

1. **Deploy met AZD:**
```bash
azd up
```

**Wat gebeurt er tijdens `azd up`:**
- ✅ Provisioning van Azure OpenAI-service
- ✅ Aanmaken van Cognitive Search-service
- ✅ Instellen van App Service voor de webtoepassing
- ✅ Configureren van netwerk en beveiliging
- ✅ Deployen van applicatiecode
- ✅ Instellen van monitoring en logging

2. **Monitor de voortgang van de deployment** en noteer de aangemaakte resources.

### Stap 2.3: Verifieer je deployment

1. **Controleer de gedeployde resources:**
```bash
azd show
```

2. **Open de gedeployde toepassing:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Test de AI-functionaliteit:**
   - Navigeer naar de webtoepassing
   - Probeer voorbeeldvragen
   - Controleer of AI-antwoorden werken

### **Lab Oefening 2.1: Oefening in Probleemoplossing**

**Scenario**: Je deployment is geslaagd, maar de AI reageert niet.

**Veelvoorkomende problemen om te controleren:**
1. **OpenAI API-sleutels**: Controleer of ze correct zijn ingesteld
2. **Modelbeschikbaarheid**: Controleer of je regio het model ondersteunt
3. **Netwerkconnectiviteit**: Zorg ervoor dat services kunnen communiceren
4. **RBAC-machtigingen**: Controleer of de app toegang heeft tot OpenAI

**Debugging commando's:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: AI-toepassingen aanpassen aan jouw behoeften

### Stap 3.1: Wijzig de AI-configuratie

1. **Update het OpenAI-model:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Voeg extra AI-services toe:**

Bewerk `infra/main.bicep` om Document Intelligence toe te voegen:

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

### Stap 3.2: Omgevingsspecifieke configuraties

**Best Practice**: Verschillende configuraties voor ontwikkeling versus productie.

1. **Maak een productieomgeving aan:**
```bash
azd env new myai-production
```

2. **Stel productie-specifieke parameters in:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Oefening 3.1: Kostenoptimalisatie**

**Uitdaging**: Configureer de sjabloon voor kosteneffectieve ontwikkeling.

**Taken:**
1. Identificeer welke SKUs kunnen worden ingesteld op gratis/basisniveaus
2. Configureer omgevingsvariabelen voor minimale kosten
3. Deploy en vergelijk kosten met de productieconfiguratie

**Oplossingssuggesties:**
- Gebruik F0 (gratis) niveau voor Cognitive Services waar mogelijk
- Gebruik Basic niveau voor Search Service in ontwikkeling
- Overweeg het gebruik van Consumption plan voor Functions

## Module 4: Beveiliging en productie best practices

### Stap 4.1: Beveiligd Credential Management

**Huidige uitdaging**: Veel AI-apps hardcoderen API-sleutels of gebruiken onveilige opslag.

**AZD Oplossing**: Managed Identity + Key Vault integratie.

1. **Bekijk de beveiligingsconfiguratie in je sjabloon:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Controleer of Managed Identity werkt:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Stap 4.2: Netwerkbeveiliging

1. **Schakel private endpoints in** (indien nog niet geconfigureerd):

Voeg toe aan je bicep-sjabloon:
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

### Stap 4.3: Monitoring en Observability

1. **Configureer Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Stel AI-specifieke monitoring in:**

Voeg aangepaste metrics toe voor AI-operaties:
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

### **Lab Oefening 4.1: Beveiligingsaudit**

**Taak**: Controleer je deployment op beveiligingsbest practices.

**Checklist:**
- [ ] Geen hardcoded secrets in code of configuratie
- [ ] Managed Identity gebruikt voor service-to-service authenticatie
- [ ] Key Vault slaat gevoelige configuratie op
- [ ] Netwerktoegang is goed beperkt
- [ ] Monitoring en logging zijn ingeschakeld

## Module 5: Je eigen AI-toepassing omzetten

### Stap 5.1: Beoordelingswerkblad

**Voordat je je app omzet**, beantwoord deze vragen:

1. **Applicatiearchitectuur:**
   - Welke AI-services gebruikt je app?
   - Welke compute resources heeft het nodig?
   - Heeft het een database nodig?
   - Wat zijn de afhankelijkheden tussen services?

2. **Beveiligingsvereisten:**
   - Welke gevoelige gegevens verwerkt je app?
   - Welke compliancevereisten heb je?
   - Heb je privé-netwerken nodig?

3. **Schaalvereisten:**
   - Wat is je verwachte belasting?
   - Heb je auto-scaling nodig?
   - Zijn er regionale vereisten?

### Stap 5.2: Maak je AZD-sjabloon

**Volg dit patroon om je app om te zetten:**

1. **Maak de basisstructuur:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **Maak azure.yaml:**
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

3. **Maak infrastructuursjablonen:**

**infra/main.bicep** - Hoofdsjabloon:
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

**infra/modules/openai.bicep** - OpenAI-module:
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

### **Lab Oefening 5.1: Sjablooncreatie Uitdaging**

**Uitdaging**: Maak een AZD-sjabloon voor een documentverwerkings-AI-app.

**Vereisten:**
- Azure OpenAI voor inhoudsanalyse
- Document Intelligence voor OCR
- Storage Account voor documentuploads
- Function App voor verwerkingslogica
- Webapp voor gebruikersinterface

**Bonuspunten:**
- Voeg goede foutafhandeling toe
- Inclusief kostenraming
- Stel monitoring dashboards in

## Module 6: Veelvoorkomende problemen oplossen

### Veelvoorkomende deployment problemen

#### Probleem 1: OpenAI Service Quota Overschreden
**Symptomen:** Deployment faalt met quota fout
**Oplossingen:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Probleem 2: Model Niet Beschikbaar in Regio
**Symptomen:** AI-antwoorden falen of model deployment fouten
**Oplossingen:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Probleem 3: Machtigingsproblemen
**Symptomen:** 403 Forbidden fouten bij het aanroepen van AI-services
**Oplossingen:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Prestatieproblemen

#### Probleem 4: Trage AI-antwoorden
**Onderzoeksstappen:**
1. Controleer Application Insights voor prestatiemetrics
2. Bekijk OpenAI-service metrics in Azure portal
3. Controleer netwerkconnectiviteit en latentie

**Oplossingen:**
- Implementeer caching voor veelvoorkomende vragen
- Gebruik een geschikt OpenAI-model voor je use case
- Overweeg read replicas voor hoge belasting scenario's

### **Lab Oefening 6.1: Debugging Uitdaging**

**Scenario**: Je deployment is geslaagd, maar de toepassing geeft 500 fouten.

**Debugging taken:**
1. Controleer applicatielogs
2. Verifieer serviceconnectiviteit
3. Test authenticatie
4. Bekijk configuratie

**Tools om te gebruiken:**
- `azd show` voor deployment overzicht
- Azure portal voor gedetailleerde service logs
- Application Insights voor applicatie telemetrie

## Module 7: Monitoring en Optimalisatie

### Stap 7.1: Stel uitgebreide monitoring in

1. **Maak aangepaste dashboards:**

Navigeer naar Azure portal en maak een dashboard met:
- OpenAI aanvraag aantal en latentie
- Applicatiefoutpercentages
- Resourcegebruik
- Kostenbewaking

2. **Stel waarschuwingen in:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Stap 7.2: Kostenoptimalisatie

1. **Analyseer huidige kosten:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementeer kostenbeheersing:**
- Stel budgetwaarschuwingen in
- Gebruik autoscaling policies
- Implementeer aanvraag caching
- Monitor tokengebruik voor OpenAI

### **Lab Oefening 7.1: Prestatieoptimalisatie**

**Taak**: Optimaliseer je AI-toepassing voor zowel prestaties als kosten.

**Metrics om te verbeteren:**
- Verminder gemiddelde responstijd met 20%
- Verminder maandelijkse kosten met 15%
- Behoud 99,9% uptime

**Strategieën om te proberen:**
- Implementeer responscaching
- Optimaliseer prompts voor token efficiëntie
- Gebruik geschikte compute SKUs
- Stel juiste autoscaling in

## Einduitdaging: End-to-End Implementatie

### Uitdagingsscenario

Je krijgt de taak om een productieklare AI-aangedreven klantenservice chatbot te maken met deze vereisten:

**Functionele Vereisten:**
- Webinterface voor klantinteracties
- Integratie met Azure OpenAI voor antwoorden
- Documentzoekfunctionaliteit met Cognitive Search
- Integratie met bestaande klantendatabase
- Meertalige ondersteuning

**Niet-Functionele Vereisten:**
- Ondersteuning voor 1000 gelijktijdige gebruikers
- 99,9% uptime SLA
- SOC 2 compliance
- Kosten onder $500/maand
- Deploy naar meerdere omgevingen (dev, staging, prod)

### Implementatiestappen

1. **Ontwerp de architectuur**
2. **Maak de AZD-sjabloon**
3. **Implementeer beveiligingsmaatregelen**
4. **Stel monitoring en waarschuwingen in**
5. **Maak deployment pipelines**
6. **Documenteer de oplossing**

### Evaluatiecriteria

- ✅ **Functionaliteit**: Voldoet het aan alle vereisten?
- ✅ **Beveiliging**: Zijn best practices geïmplementeerd?
- ✅ **Schaalbaarheid**: Kan het de belasting aan?
- ✅ **Onderhoudbaarheid**: Is de code en infrastructuur goed georganiseerd?
- ✅ **Kosten**: Blijft het binnen budget?

## Aanvullende Bronnen

### Microsoft Documentatie
- [Azure Developer CLI Documentatie](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentatie](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Azure AI Foundry Documentatie](https://learn.microsoft.com/azure/ai-studio/)

### Voorbeeld Sjablonen
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Bronnen
- [Azure AI Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificaat van Voltooiing

Gefeliciteerd! Je hebt de AI Workshop Lab afgerond. Je zou nu in staat moeten zijn om:

- ✅ Bestaande AI-toepassingen om te zetten naar AZD-sjablonen
- ✅ Productieklare AI-toepassingen te implementeren
- ✅ Beste beveiligingspraktijken toe te passen voor AI-werkbelastingen
- ✅ De prestaties van AI-toepassingen te monitoren en te optimaliseren
- ✅ Veelvoorkomende implementatieproblemen op te lossen

### Volgende Stappen
1. Pas deze patronen toe op je eigen AI-projecten
2. Draag sjablonen terug aan de community
3. Word lid van de Azure AI Foundry Discord voor voortdurende ondersteuning
4. Verken geavanceerde onderwerpen zoals multi-regio implementaties

---

**Workshop Feedback**: Help ons deze workshop te verbeteren door je ervaring te delen in de [Azure AI Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Hoofdstuk Navigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-First Ontwikkeling
- **⬅️ Vorige**: [AI Model Implementatie](ai-model-deployment.md)
- **➡️ Volgende**: [Productie AI Beste Praktijken](production-ai-practices.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../getting-started/configuration.md)

**Hulp Nodig?** Word lid van onze community voor ondersteuning en discussies over AZD en AI-implementaties.

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in zijn oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
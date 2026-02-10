# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-First-ontwikkeling
- **⬅️ Vorige**: [AI-modelimplementatie](ai-model-deployment.md)
- **➡️ Volgende**: [Best practices voor productie-AI](production-ai-practices.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

## Workshop Overview

Deze hands-on lab begeleidt ontwikkelaars bij het proces van het nemen van een bestaand AI-sjabloon en het implementeren ervan met behulp van Azure Developer CLI (AZD). Je leert essentiële patronen voor productieklare AI-implementaties met Microsoft Foundry-services.

**Duur:** 2-3 uur  
**Niveau:** Gemiddeld  
**Vereisten:** Basiskennis van Azure, vertrouwdheid met AI/ML-concepten

## 🎓 Leerdoelen

Aan het einde van deze workshop kun je:
- ✅ Een bestaande AI-toepassing omzetten naar AZD-sjablonen
- ✅ Microsoft Foundry-services configureren met AZD
- ✅ Beveiligd beheer van referenties voor AI-services implementeren
- ✅ Productieklare AI-toepassingen implementeren met monitoring
- ✅ Veelvoorkomende AI-implementatieproblemen oplossen

## Vereisten

### Vereiste tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) geïnstalleerd
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) geïnstalleerd
- [Git](https://git-scm.com/) geïnstalleerd
- Code-editor (aanbevolen: VS Code)

### Azure-resources
- Azure-abonnement met toegang als bijdrager
- Toegang tot Azure OpenAI-services (of mogelijkheid om toegang aan te vragen)
- Machtigingen om resourcegroepen te maken

### Vereiste kennis
- Basisbegrip van Azure-services
- Vertrouwdheid met command-line interfaces
- Basis AI/ML-concepten (API's, modellen, prompts)

## Lab Setup

### Stap 1: Omgevingsvoorbereiding

1. **Controleer toolinstallaties:**
```bash
# Controleer AZD-installatie
azd version

# Controleer Azure CLI
az --version

# Log in op Azure
az login
azd auth login
```

2. **Clone de workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Begrijpen van de AZD-structuur voor AI-toepassingen

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

### **Lab Oefening 1.1: Verken de configuratie**

1. **Onderzoek het bestand azure.yaml:**
```bash
cat azure.yaml
```

**Waar je op moet letten:**
- Service-definities voor AI-componenten
- Omgevingsvariabele-mappings
- Hostconfiguraties

2. **Bekijk de main.bicep-infrastructuur:**
```bash
cat infra/main.bicep
```

**Belangrijke AI-patronen om te identificeren:**
- Azure OpenAI-service provisioning
- Integratie met Cognitive Search
- Beveiligd sleutelbeheer
- Netwerkbeveiligingsconfiguraties

### **Discussiepunt:** Waarom deze patronen belangrijk zijn voor AI

- **Serviceafhankelijkheden**: AI-apps vereisen vaak meerdere gecoördineerde services
- **Beveiliging**: API-sleutels en endpoints moeten veilig beheerd worden
- **Schaalbaarheid**: AI-workloads hebben unieke schaalvereisten
- **Kostenbeheer**: AI-services kunnen duur worden als ze niet correct zijn geconfigureerd

## Module 2: Implementeer je eerste AI-toepassing

### Stap 2.1: Initialiseer de omgeving

1. **Maak een nieuwe AZD-omgeving aan:**
```bash
azd env new myai-workshop
```

2. **Stel vereiste parameters in:**
```bash
# Stel uw voorkeursregio voor Azure in
azd env set AZURE_LOCATION eastus

# Optioneel: Stel een specifiek OpenAI-model in
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Stap 2.2: Implementeer de infrastructuur en de toepassing

1. **Implementeer met AZD:**
```bash
azd up
```

**Wat gebeurt er tijdens `azd up`:**
- ✅ Voorziet de Azure OpenAI-service
- ✅ Maakt de Cognitive Search-service aan
- ✅ Stelt App Service in voor de webapplicatie
- ✅ Configureert netwerk en beveiliging
- ✅ Implementeert applicatiecode
- ✅ Stelt monitoring en logging in

2. **Houd de voortgang van de implementatie in de gaten** en noteer de aangemaakte resources.

### Stap 2.3: Verifieer je implementatie

1. **Controleer de geïmplementeerde resources:**
```bash
azd show
```

2. **Open de geïmplementeerde toepassing:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Test de AI-functionaliteit:**
   - Navigeer naar de webapplicatie
   - Probeer voorbeeldqueries
   - Verifieer dat AI-antwoorden werken

### **Lab Oefening 2.1: Oefening in probleemoplossing**

**Scenario**: Je implementatie is gelukt, maar de AI reageert niet.

**Veelvoorkomende problemen om te controleren:**
1. **OpenAI API-sleutels**: Controleer of ze correct zijn ingesteld
2. **Modelbeschikbaarheid**: Controleer of je regio het model ondersteunt
3. **Netwerkconnectiviteit**: Zorg dat services met elkaar kunnen communiceren
4. **RBAC-machtigingen**: Controleer of de app toegang heeft tot OpenAI

**Foutopsporingsopdrachten:**
```bash
# Controleer omgevingsvariabelen
azd env get-values

# Bekijk implementatielogs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Controleer de status van de OpenAI-implementatie
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: AI-toepassingen aanpassen aan jouw behoeften

### Stap 3.1: Wijzig de AI-configuratie

1. **Werk het OpenAI-model bij:**
```bash
# Schakel over naar een ander model (als dat in uw regio beschikbaar is)
azd env set AZURE_OPENAI_MODEL gpt-4

# Opnieuw uitrollen met de nieuwe configuratie
azd deploy
```

2. **Voeg extra AI-diensten toe:**

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

**Beste praktijk**: Verschillende configuraties voor ontwikkeling en productie.

1. **Maak een productieomgeving aan:**
```bash
azd env new myai-production
```

2. **Stel productie-specifieke parameters in:**
```bash
# In productie worden doorgaans hogere SKU's gebruikt
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Schakel aanvullende beveiligingsfuncties in
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Oefening 3.1: Kostenoptimalisatie**

**Uitdaging**: Configureer het sjabloon voor kosteneffectieve ontwikkeling.

**Taken:**
1. Identificeer welke SKUs ingesteld kunnen worden op gratis/basisniveaus
2. Configureer omgevingsvariabelen voor minimale kosten
3. Implementeer en vergelijk kosten met de productieconfiguratie

**Oplossingshints:**
- Gebruik indien mogelijk de F0 (gratis) tier voor Cognitive Services
- Gebruik de Basic-tier voor de Search Service in ontwikkeling
- Overweeg het Consumption-plan voor Functions

## Module 4: Beveiliging en best practices voor productie

### Stap 4.1: Beveiligd beheer van referenties

**Huidige uitdaging**: Veel AI-apps coderen API-sleutels hard of gebruiken onveilige opslag.

**AZD-oplossing**: Managed Identity + Key Vault-integratie.

1. **Bekijk de beveiligingsconfiguratie in je sjabloon:**
```bash
# Controleer de configuratie van Key Vault en Managed Identity.
grep -r "keyVault\|managedIdentity" infra/
```

2. **Controleer of Managed Identity werkt:**
```bash
# Controleer of de webapp de juiste identiteitsconfiguratie heeft.
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Stap 4.2: Netwerkbeveiliging

1. **Schakel private endpoints in** (als deze nog niet zijn geconfigureerd):

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

### Stap 4.3: Monitoring en observeerbaarheid

1. **Configureer Application Insights:**
```bash
# Application Insights moet automatisch worden geconfigureerd
# Controleer de configuratie:
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

**Taak**: Beoordeel je implementatie op beveiligingsbest practices.

**Checklist:**
- [ ] Geen hardcoded geheimen in code of configuratie
- [ ] Managed Identity gebruikt voor service-tot-service authenticatie
- [ ] Key Vault slaat gevoelige configuratie op
- [ ] Netwerktoegang is correct beperkt
- [ ] Monitoring en logging zijn ingeschakeld

## Module 5: Je eigen AI-toepassing converteren

### Stap 5.1: Beoordelingsformulier

**Beantwoord voordat je je app converteert deze vragen:**

1. **Applicatiearchitectuur:**
   - Welke AI-diensten gebruikt je app?
   - Welke compute-resources heeft het nodig?
   - Heeft het een database nodig?
   - Wat zijn de afhankelijkheden tussen diensten?

2. **Beveiligingseisen:**
   - Welke gevoelige gegevens verwerkt je app?
   - Welke compliance-eisen heb je?
   - Heb je private netwerken nodig?

3. **Schaaleisen:**
   - Wat is je verwachte belasting?
   - Heb je autoscaling nodig?
   - Zijn er regionale vereisten?

### Stap 5.2: Maak je AZD-sjabloon

**Volg dit patroon om je app te converteren:**

1. **Maak de basisstructuur:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialiseer AZD-sjabloon
azd init --template minimal
```

2. **Maak azure.yaml aan:**
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

3. **Maak infrastructuursjablonen aan:**

**infra/main.bicep** - Hoofdtemplate:
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

### **Lab Oefening 5.1: Sjablooncreatie-uitdaging**

**Uitdaging**: Maak een AZD-sjabloon voor een documentverwerkende AI-app.

**Vereisten:**
- Azure OpenAI voor inhoudsanalyse
- Document Intelligence voor OCR
- Storage Account voor documentuploads
- Function App voor verwerkingslogica
- Webapp voor gebruikersinterface

**Bonuspunten:**
- Voeg juiste foutafhandeling toe
- Neem kostenraming op
- Stel monitoringdashboards in

## Module 6: Problemen oplossen - veelvoorkomende issues

### Veelvoorkomende implementatieproblemen

#### Probleem 1: OpenAI-servicequotum overschreden
**Symptomen:** Implementatie faalt met quota-fout  
**Oplossingen:**
```bash
# Controleer de huidige quota
az cognitiveservices usage list --location eastus

# Vraag een verhoging van de quota aan of probeer een andere regio
azd env set AZURE_LOCATION westus2
azd up
```

#### Probleem 2: Model niet beschikbaar in regio
**Symptomen:** AI-antwoorden falen of modelimplementatiefouten  
**Oplossingen:**
```bash
# Controleer de beschikbaarheid van modellen per regio
az cognitiveservices model list --location eastus

# Schakel over naar een beschikbaar model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Probleem 3: Machtigingsproblemen
**Symptomen:** 403 Forbidden-fouten bij het aanroepen van AI-diensten  
**Oplossingen:**
```bash
# Controleer roltoewijzingen
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Voeg ontbrekende rollen toe
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Prestatieproblemen

#### Probleem 4: Trage AI-responsen
**Onderzoeksstappen:**
1. Controleer Application Insights voor prestatiestatistieken
2. Bekijk OpenAI-service-metrics in de Azure-portal
3. Verifieer netwerkconnectiviteit en latency

**Oplossingen:**
- Implementeer caching voor veelvoorkomende queries
- Gebruik het juiste OpenAI-model voor je use case
- Overweeg read replicas voor scenario's met hoge belasting

### **Lab Oefening 6.1: Debugging-uitdaging**

**Scenario**: Je implementatie is gelukt, maar de applicatie geeft 500-fouten terug.

**Foutopsporingsopdrachten:**
1. Controleer applicatielogs
2. Verifieer serviceconnectiviteit
3. Test authenticatie
4. Bekijk de configuratie

**Te gebruiken tools:**
- `azd show` voor implementatieoverzicht
- Azure-portal voor gedetailleerde servicelogs
- Application Insights voor applicatietelemetrie

## Module 7: Monitoring en optimalisatie

### Stap 7.1: Stel uitgebreide monitoring in

1. **Maak aangepaste dashboards:**

Ga naar de Azure-portal en maak een dashboard met:
- Aantal OpenAI-aanvragen en latentie
- Applicatiefoutpercentages
- Resourcegebruik
- Kostenbewaking

2. **Stel waarschuwingen in:**
```bash
# Waarschuwing voor een hoog foutpercentage
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Stap 7.2: Kostenoptimalisatie

1. **Analyseer de huidige kosten:**
```bash
# Gebruik Azure CLI om kostengegevens op te halen
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Voer kostenbeheersmaatregelen in:**
- Stel budgetwaarschuwingen in
- Gebruik autoscaling-beleid
- Implementeer request-caching
- Monitor tokengebruik voor OpenAI

### **Lab Oefening 7.1: Prestatie-optimalisatie**

**Taak**: Optimaliseer je AI-toepassing voor zowel prestatie als kosten.

**Te verbeteren metrics:**
- Verminder de gemiddelde responstijd met 20%
- Verminder de maandelijkse kosten met 15%
- Behoud 99,9% uptime

**Strategieën om te proberen:**
- Implementeer response caching
- Optimaliseer prompts voor token-efficiëntie
- Gebruik geschikte compute-SKUs
- Stel juiste autoscaling in

## Einduitdaging: End-to-End implementatie

### Uitdagningsscenario

Je krijgt de taak om een productieklare AI-gestuurde klantenservice-chatbot te creëren met de volgende vereisten:

**Functionele vereisten:**
- Webinterface voor klantinteracties
- Integratie met Azure OpenAI voor antwoorden
- Documentzoekfunctionaliteit met Cognitive Search
- Integratie met bestaande klantendatabase
- Meertalige ondersteuning

**Niet-functionele vereisten:**
- Ondersteun 1000 gelijktijdige gebruikers
- 99,9% uptime SLA
- SOC 2-conformiteit
- Kosten onder $500/maand
- Implementeer naar meerdere omgevingen (dev, staging, prod)

### Implementatiestappen

1. **Ontwerp de architectuur**
2. **Maak het AZD-sjabloon**
3. **Implementeer beveiligingsmaatregelen**
4. **Stel monitoring en alerting in**
5. **Maak deployment-pijplijnen**
6. **Documenteer de oplossing**

### Evaluatiecriteria

- ✅ **Functionaliteit**: Voldoet het aan alle vereisten?
- ✅ **Beveiliging**: Zijn best practices geïmplementeerd?
- ✅ **Schaalbaarheid**: Kan het de belasting aan?
- ✅ **Onderhoudbaarheid**: Is de code en infrastructuur goed georganiseerd?
- ✅ **Kosten**: Blijft het binnen het budget?

## Aanvullende bronnen

### Microsoft-documentatie
- [Azure Developer CLI-documentatie](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentatie Azure OpenAI-service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry-documentatie](https://learn.microsoft.com/azure/ai-studio/)

### Voorbeeldsjablonen
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Communitybronnen
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Voltooiingscertificaat
Gefeliciteerd! Je hebt de AI Workshop Lab voltooid. Je zou nu in staat moeten zijn om:

- ✅ Bestaande AI-toepassingen converteren naar AZD-sjablonen
- ✅ Productieklaar AI-toepassingen implementeren
- ✅ Beste beveiligingspraktijken voor AI-workloads implementeren
- ✅ AI-toepassingsprestaties monitoren en optimaliseren
- ✅ Veelvoorkomende implementatieproblemen oplossen

### Volgende stappen
1. Pas deze patronen toe op je eigen AI-projecten
2. Draag sjablonen bij aan de community
3. Sluit je aan bij de Microsoft Foundry Discord voor voortdurende ondersteuning
4. Verken geavanceerde onderwerpen zoals implementaties in meerdere regio's

---

**Workshopfeedback**: Help ons deze workshop te verbeteren door je ervaring te delen in het [Microsoft Foundry Discord #Azure-kanaal](https://discord.gg/microsoft-azure).

---

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD voor beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 2 - AI-first ontwikkeling
- **⬅️ Vorige**: [AI-modelimplementatie](ai-model-deployment.md)
- **➡️ Volgende**: [Best practices voor productie-AI](production-ai-practices.md)
- **🚀 Volgend hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

**Hulp nodig?** Sluit je aan bij onze community voor ondersteuning en discussies over AZD en AI-implementaties.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel wij naar nauwkeurigheid streven, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal dient als gezaghebbende bron te worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
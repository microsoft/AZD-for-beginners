# AI Workshop Lab: Je AI-oplossingen AZD-deploybaar maken

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Hoofdstuk 2 - AI-First-ontwikkeling
- **⬅️ Previous**: [AI-modelimplementatie](ai-model-deployment.md)
- **➡️ Next**: [Best practices voor productie-AI](production-ai-practices.md)
- **🚀 Next Chapter**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

## Overzicht van de workshop

Deze hands-on lab begeleidt ontwikkelaars bij het proces om een bestaand AI-template te nemen en het te deployen met Azure Developer CLI (AZD). Je leert essentiële patronen voor productieklare AI-implementaties met Microsoft Foundry-services.

> **Validation note (2026-03-25):** This workshop was reviewed against `azd` `1.23.12`. If your local installation is older, update AZD before starting so the auth, template, and deployment workflow matches the steps below.

**Duur:** 2-3 uur  
**Niveau:** Gevorderd  
**Vereisten:** Basiskennis van Azure, vertrouwdheid met AI/ML-concepten

## 🎓 Leerdoelen

Aan het einde van deze workshop kun je:
- ✅ Een bestaande AI-applicatie omzetten naar AZD-templates
- ✅ Microsoft Foundry-services configureren met AZD
- ✅ Veilig credentialbeheer voor AI-services implementeren
- ✅ Productieklare AI-toepassingen deployen met monitoring
- ✅ Veelvoorkomende AI-implementatieproblemen oplossen

## Vereisten

### Vereiste tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) geïnstalleerd
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) geïnstalleerd
- [Git](https://git-scm.com/) geïnstalleerd
- Code-editor (aanbevolen: VS Code)

### Azure-resources
- Azure-abonnement met Contributor-toegang
- Toegang tot Microsoft Foundry Models-services (of de mogelijkheid om toegang aan te vragen)
- Machtigingen om resourcegroepen te maken

### Kennisvereisten
- Basisbegrip van Azure-services
- Vertrouwdheid met command-line interfaces
- Basisconcepten van AI/ML (API's, modellen, prompts)

## Labconfiguratie

### Stap 1: Voorbereiding van de omgeving

1. **Controleer de installatie van de tools:**
```bash
# Controleer AZD-installatie
azd version

# Controleer Azure CLI
az --version

# Log in bij Azure voor AZD-workflows
azd auth login

# Log alleen in bij de Azure CLI als je van plan bent az-commando's uit te voeren tijdens de diagnose
az login
```

If you work across multiple tenants or your subscription is not detected automatically, retry with `azd auth login --tenant-id <tenant-id>`.

2. **Clone de workshop-repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Inzicht in de AZD-structuur voor AI-toepassingen

### Anatomie van een AI AZD-template

Ontdek de belangrijkste bestanden in een AI-klaar AZD-template:

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

### **Lab oefening 1.1: Verken de configuratie**

1. **Bekijk het azure.yaml-bestand:**
```bash
cat azure.yaml
```

**Waar op te letten:**
- Servicedefinities voor AI-componenten
- Koppelingen van omgevingsvariabelen
- Hostconfiguraties

2. **Bekijk de main.bicep-infrastructuur:**
```bash
cat infra/main.bicep
```

**Belangrijke AI-patronen om te identificeren:**
- Provisioning van Microsoft Foundry Models-service
- Integratie met Azure AI Search
- Veilig sleutelbeheer
- Netwerkbeveiligingsconfiguraties

### **Discussiepunt:** Waarom deze patronen belangrijk zijn voor AI

- **Service-afhankelijkheden**: AI-apps vereisen vaak meerdere gecoördineerde services
- **Beveiliging**: API-sleutels en eindpunten moeten veilig worden beheerd
- **Schaalbaarheid**: AI-workloads hebben unieke schaalvereisten
- **Kostenbeheer**: AI-services kunnen duur zijn als ze niet goed geconfigureerd zijn

## Module 2: Implementeer je eerste AI-toepassing

### Stap 2.1: Initialiseer de omgeving

1. **Maak een nieuwe AZD-omgeving aan:**
```bash
azd env new myai-workshop
```

2. **Stel de vereiste parameters in:**
```bash
# Stel uw voorkeurs-Azure-regio in
azd env set AZURE_LOCATION eastus

# Optioneel: Stel een specifiek OpenAI-model in
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Stap 2.2: Implementeer de infrastructuur en applicatie

1. **Implementeer met AZD:**
```bash
azd up
```

**Wat gebeurt er tijdens `azd up`:**
- ✅ Voorziet de Microsoft Foundry Models-service
- ✅ Maakt de Azure AI Search-service aan
- ✅ Zet App Service op voor de webapplicatie
- ✅ Configureert netwerk en beveiliging
- ✅ Implementeert de applicatiecode
- ✅ Stelt monitoring en logging in

2. **Monitor de voortgang van de implementatie** en noteer de resources die worden gemaakt.

### Stap 2.3: Verifieer je implementatie

1. **Controleer de geïmplementeerde resources:**
```bash
azd show
```

2. **Open de geïmplementeerde applicatie:**
```bash
azd show
```

Open het web-eindpunt dat wordt weergegeven in de `azd show` output.

3. **Test de AI-functionaliteit:**
   - Navigeer naar de webapplicatie
   - Probeer voorbeeldqueries
   - Verifieer dat AI-reacties werken

### **Lab oefening 2.1: Oefening in probleemoplossing**

**Scenario**: Je implementatie is geslaagd, maar de AI reageert niet.

**Veelvoorkomende problemen om te controleren:**
1. **OpenAI API-sleutels**: Controleer of deze correct zijn ingesteld
2. **Beschikbaarheid van het model**: Controleer of je regio het model ondersteunt
3. **Netwerkconnectiviteit**: Zorg dat services met elkaar kunnen communiceren
4. **RBAC-machtigingen**: Controleer of de app toegang heeft tot OpenAI

**Opdrachten voor foutopsporing:**
```bash
# Controleer omgevingsvariabelen
azd env get-values

# Bekijk implementatielogboeken
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Controleer de status van de OpenAI-implementatie
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Pas AI-toepassingen aan naar jouw behoeften

### Stap 3.1: Pas de AI-configuratie aan

1. **Werk het OpenAI-model bij:**
```bash
# Overschakelen naar een ander model (indien beschikbaar in uw regio)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Heruitrollen met de nieuwe configuratie
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

### Stap 3.2: Omgeving-specifieke configuraties

**Best practice**: Verschillende configuraties voor ontwikkeling en productie.

1. **Maak een productieomgeving aan:**
```bash
azd env new myai-production
```

2. **Stel productie-specifieke parameters in:**
```bash
# Productie gebruikt doorgaans hogere SKU's
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Schakel aanvullende beveiligingsfuncties in
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab oefening 3.1: Kostenoptimalisatie**

**Uitdaging**: Configureer het template voor kosteneffectieve ontwikkeling.

**Taken:**
1. Identificeer welke SKUs kunnen worden ingesteld op gratis/basisniveaus
2. Configureer omgevingsvariabelen voor minimale kosten
3. Implementeer en vergelijk kosten met de productieconfiguratie

**Hints voor de oplossing:**
- Gebruik de F0 (gratis) tier voor Azure AI Services waar mogelijk
- Gebruik de Basic-tier voor de Search Service tijdens ontwikkeling
- Overweeg het gebruik van een Consumption-plan voor Functions

## Module 4: Beveiliging en best practices voor productie

### Stap 4.1: Beveiligd beheer van referenties

**Huidige uitdaging**: Veel AI-apps coderen API-sleutels hard of gebruiken onveilige opslag.

**AZD-oplossing**: Managed Identity + Key Vault-integratie.

1. **Bekijk de beveiligingsconfiguratie in je template:**
```bash
# Zoek naar Key Vault- en Managed Identity-configuratie
grep -r "keyVault\|managedIdentity" infra/
```

2. **Controleer of Managed Identity werkt:**
```bash
# Controleer of de webapp de juiste identiteitsconfiguratie heeft
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Stap 4.2: Netwerkbeveiliging

1. **Schakel private endpoints in** (als dit nog niet is geconfigureerd):

Voeg toe aan je bicep-template:
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

### **Lab oefening 4.1: Beveiligingsaudit**

**Taak**: Beoordeel je implementatie op beveiligingsbest practices.

**Checklist:**
- [ ] Geen hardgecodeerde geheimen in code of configuratie
- [ ] Managed Identity gebruikt voor service-tot-service-authenticatie
- [ ] Key Vault slaat gevoelige configuratie op
- [ ] Netwerktoegang is correct beperkt
- [ ] Monitoring en logging zijn ingeschakeld

## Module 5: Je eigen AI-toepassing converteren

### Stap 5.1: Beoordelingsformulier

**Voordat je je app converteert**, beantwoord deze vragen:

1. **Applicatie-architectuur:**
   - Welke AI-services gebruikt je app?
   - Welke compute-resources heeft het nodig?
   - Heeft het een database nodig?
   - Wat zijn de afhankelijkheden tussen services?

2. **Beveiligingseisen:**
   - Met welke gevoelige gegevens werkt je app?
   - Welke compliance-eisen gelden er?
   - Heb je private netwerken nodig?

3. **Schaalvereisten:**
   - Wat is je verwachte belasting?
   - Heb je auto-scaling nodig?
   - Zijn er regionale vereisten?

### Stap 5.2: Maak je AZD-template

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

### **Lab oefening 5.1: Template-creatie-uitdaging**

**Uitdaging**: Maak een AZD-template voor een documentverwerkings-AI-app.

**Vereisten:**
- Microsoft Foundry Models voor inhoudsanalyse
- Document Intelligence voor OCR
- Storage Account voor documentuploads
- Function App voor verwerkingslogica
- Webapp voor de gebruikersinterface

**Bonuspunten:**
- Voeg juiste foutafhandeling toe
- Neem kostenraming op
- Stel monitoring-dashboards in

## Module 6: Problemen oplossen van veelvoorkomende issues

### Veelvoorkomende implementatieproblemen

#### Probleem 1: OpenAI-servicequotum overschreden
**Symptomen:** De implementatie mislukt met een quota-fout
**Oplossingen:**
```bash
# Controleer huidige quota
az cognitiveservices usage list --location eastus

# Vraag een verhoging van de quota aan of probeer een andere regio
azd env set AZURE_LOCATION westus2
azd up
```

#### Probleem 2: Model niet beschikbaar in de regio
**Symptomen:** AI-reacties falen of modelimplementatiefouten
**Oplossingen:**
```bash
# Controleer de beschikbaarheid van het model per regio
az cognitiveservices model list --location eastus

# Bijwerken naar een beschikbaar model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Probleem 3: Machtigingsproblemen
**Symptomen:** 403 Forbidden-fouten bij het aanroepen van AI-services
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

#### Probleem 4: Trage AI-reacties
**Onderzoeksstappen:**
1. Controleer Application Insights op prestatiemetrics
2. Bekijk OpenAI-servicemetrics in de Azure-portal
3. Controleer netwerkconnectiviteit en latency

**Oplossingen:**
- Implementeer caching voor veelvoorkomende queries
- Gebruik het juiste OpenAI-model voor jouw use case
- Overweeg leesreplica's voor scenario's met hoge belasting

### **Lab oefening 6.1: Debugging-uitdaging**

**Scenario**: Je implementatie is geslaagd, maar de applicatie geeft 500-fouten terug.

**Taken voor foutopsporing:**
1. Controleer applicatielogs
2. Controleer serviceconnectiviteit
3. Test authenticatie
4. Bekijk de configuratie

**Te gebruiken tools:**
- `azd show` voor implementatieoverzicht
- Azure-portal voor gedetailleerde servicelogboeken
- Application Insights voor applicatietelemetrie

## Module 7: Monitoring en optimalisatie

### Stap 7.1: Stel uitgebreide monitoring in

1. **Maak aangepaste dashboards:**

Navigeer naar de Azure-portal en maak een dashboard met:
- Aantal OpenAI-aanvragen en latency
- Applicatiefoutpercentages
- Resourcegebruik
- Kostenbewaking

2. **Stel waarschuwingen in:**
```bash
# Waarschuwing voor hoog foutpercentage
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

2. **Implementeer kostenbeheersing:**
- Stel budgetwaarschuwingen in
- Gebruik autoscaling-beleid
- Implementeer requestcaching
- Bewaak tokengebruik voor OpenAI

### **Lab oefening 7.1: Prestatieoptimalisatie**

**Taak**: Optimaliseer je AI-toepassing voor zowel prestaties als kosten.

**Metrics om te verbeteren:**
- Verminder de gemiddelde reactietijd met 20%
- Verminder de maandelijkse kosten met 15%
- Behoud 99,9% uptime

**Strategieën om te proberen:**
- Implementeer responsecaching
- Optimaliseer prompts voor token-efficiëntie
- Gebruik geschikte compute-SKUs
- Stel juiste autoscaling in

## Einduitdaging: End-to-End-implementatie

### Uitdagingsscenario

Je krijgt de opdracht om een productieklare AI-aangedreven klantenservice-chatbot te maken met de volgende vereisten:

**Functionele eisen:**
- Webinterface voor klantinteracties
- Integratie met Microsoft Foundry Models voor reacties
- Documentzoekfunctie met Azure AI Search
- Integratie met bestaande klantendatabase
- Ondersteuning voor meerdere talen

**Niet-functionele eisen:**
- Ondersteunen van 1000 gelijktijdige gebruikers
- 99,9% uptime SLA
- SOC 2-compliance
- Kosten onder $500/maand
- Implementeren naar meerdere omgevingen (dev, staging, prod)

### Implementatiestappen

1. **Ontwerp de architectuur**
2. **Maak het AZD-template**
3. **Implementeer beveiligingsmaatregelen**
4. **Stel monitoring en waarschuwingen in**
5. **Maak deployment-pijplijnen**
6. **Documenteer de oplossing**

### Beoordelingscriteria

- ✅ **Functionaliteit**: Voldoet het aan alle eisen?
- ✅ **Beveiliging**: Zijn best practices geïmplementeerd?
- ✅ **Schaalbaarheid**: Kan het de belasting aan?
- ✅ **Onderhoudbaarheid**: Is de code en infrastructuur goed georganiseerd?
- ✅ **Kosten**: Blijft het binnen het budget?

## Aanvullende bronnen

### Microsoft-documentatie
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Voorbeeldtemplates
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Communitybronnen
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificaat van voltooiing

Gefeliciteerd! Je hebt de AI Workshop Lab voltooid. Je zou nu het volgende moeten kunnen:

- ✅ Bestaande AI-toepassingen omzetten naar AZD-sjablonen
- ✅ Productieklare AI-toepassingen implementeren
- ✅ Beveiligingsbest practices voor AI-workloads implementeren
- ✅ De prestaties van AI-toepassingen monitoren en optimaliseren
- ✅ Veelvoorkomende implementatieproblemen oplossen

### Volgende stappen
1. Pas deze patronen toe op je eigen AI-projecten
2. Draag sjablonen bij aan de community
3. Word lid van de Microsoft Foundry Discord voor voortdurende ondersteuning
4. Verken geavanceerde onderwerpen zoals multi-regio-implementaties

---

**Workshopfeedback**: Help ons deze workshop verbeteren door je ervaring te delen in het [Microsoft Foundry Discord #Azure-kanaal](https://discord.gg/microsoft-azure).

---

**Hoofdstuknavigatie:**
- **📚 Cursusstartpagina**: [AZD For Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 2 - AI-First-ontwikkeling
- **⬅️ Vorige**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Volgende**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Volgend hoofdstuk**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Hulp nodig?** Word lid van onze community voor ondersteuning en discussies over AZD en AI-implementaties.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
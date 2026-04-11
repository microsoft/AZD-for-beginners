# AI Workshop Lab: Je AI-oplossingen AZD-deployable maken

**Chapter Navigation:**
- **📚 Course Home**: [AZD Voor Beginners](../../README.md)
- **📖 Current Chapter**: Hoofdstuk 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

## Workshop Overview

Deze hands-on lab begeleidt ontwikkelaars bij het proces om een bestaand AI-template te nemen en uit te rollen met behulp van Azure Developer CLI (AZD). Je leert essentiële patronen voor productieklare AI-deployments met Microsoft Foundry-diensten.

> **Validatienotitie (2026-03-25):** Deze workshop is gecontroleerd met `azd` `1.23.12`. Als je lokale installatie ouder is, werk AZD bij voordat je begint zodat de auth-, template- en deploymentworkflow overeenkomt met de onderstaande stappen.

**Duur:** 2-3 uur  
**Niveau:** Middenniveau  
**Vereisten:** Basiskennis van Azure, bekendheid met AI/ML-concepten

## 🎓 Leerdoelen

Aan het einde van deze workshop kun je:
- ✅ Een bestaande AI-toepassing omzetten naar AZD-templates
- ✅ Microsoft Foundry-diensten configureren met AZD
- ✅ Veilig credentialbeheer implementeren voor AI-diensten
- ✅ Productieklaar AI-applicaties uitrollen met monitoring
- ✅ Veelvoorkomende AI-deploymentsproblemen oplossen

## Vereisten

### Vereiste Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) geïnstalleerd
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) geïnstalleerd
- [Git](https://git-scm.com/) geïnstalleerd
- Code-editor (VS Code aanbevolen)

### Azure-resources
- Azure-abonnement met contributor-toegang
- Toegang tot Microsoft Foundry Models-diensten (of mogelijkheid om toegang aan te vragen)
- Machtigingen om resource groups te maken

### Kennisvereisten
- Basisbegrip van Azure-diensten
- Bekendheid met command-line interfaces
- Basis AI/ML-concepten (API's, modellen, prompts)

## Lab Setup

### Stap 1: Omgeving Voorbereiden

1. **Controleer toolinstallaties:**
```bash
# Controleer AZD-installatie
azd version

# Controleer Azure CLI
az --version

# Log in op Azure voor AZD-workflows
azd auth login

# Log alleen in op de Azure CLI als je van plan bent tijdens de diagnostiek az-opdrachten uit te voeren
az login
```

Als je in meerdere tenants werkt of je abonnement niet automatisch wordt gedetecteerd, probeer dan opnieuw met `azd auth login --tenant-id <tenant-id>`.

2. **Clone de workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Begrijpen van AZD-structuur voor AI-toepassingen

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
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab Oefening 1.1: Onderzoek de Configuratie**

1. **Onderzoek het azure.yaml bestand:**
```bash
cat azure.yaml
```

**Waar je op moet letten:**
- Servicedefinities voor AI-componenten
- Omgevingsvariabele-mappingen
- Hostconfiguraties

2. **Bekijk de main.bicep infrastructuur:**
```bash
cat infra/main.bicep
```

**Belangrijke AI-patronen om te identificeren:**
- Microsoft Foundry Models-service provisioning
- Integratie met Cognitive Search
- Veilig sleutelbeheer
- Netwerkbeveiligingsconfiguraties

### **Discussiepunt:** Waarom deze patronen belangrijk zijn voor AI

- **Service-afhankelijkheden**: AI-apps vereisen vaak meerdere gecoördineerde services
- **Beveiliging**: API-sleutels en endpoints moeten veilig beheerd worden
- **Schaalbaarheid**: AI-workloads hebben unieke schaalvereisten
- **Kostenbeheer**: AI-diensten kunnen duur zijn als ze niet goed geconfigureerd zijn

## Module 2: Implementeer je eerste AI-toepassing

### Stap 2.1: Initialiseer de Omgeving

1. **Maak een nieuwe AZD-omgeving aan:**
```bash
azd env new myai-workshop
```

2. **Stel vereiste parameters in:**
```bash
# Stel uw voorkeurs-Azure-regio in
azd env set AZURE_LOCATION eastus

# Optioneel: Stel een specifiek OpenAI-model in
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Stap 2.2: Deploy de Infrastructuur en Applicatie

1. **Deploy met AZD:**
```bash
azd up
```

**Wat er gebeurt tijdens `azd up`:**
- ✅ Provisioning van Microsoft Foundry Models-service
- ✅ Creatie van Cognitive Search-service
- ✅ Opzet van App Service voor de webapplicatie
- ✅ Configuratie van netwerken en beveiliging
- ✅ Deployen van applicatiecode
- ✅ Opzetten van monitoring en logging

2. **Monitor de voortgang van de deployment** en noteer de resources die worden aangemaakt.

### Stap 2.3: Verifieer je Deployment

1. **Controleer de uitgerolde resources:**
```bash
azd show
```

2. **Open de uitgerolde applicatie:**
```bash
azd show
```

Open het webendpoint dat wordt getoond in de `azd show` output.

3. **Test de AI-functionaliteit:**
   - Navigeer naar de webapplicatie
   - Probeer voorbeeldqueries
   - Verifieer dat AI-antwoorden werken

### **Lab Oefening 2.1: Troubleshooting Oefening**

**Scenario**: Je deployment is geslaagd maar de AI reageert niet.

**Veelvoorkomende problemen om te controleren:**
1. **OpenAI API-sleutels**: Controleer of ze correct zijn ingesteld
2. **Modelbeschikbaarheid**: Controleer of je regio het model ondersteunt
3. **Netwerkconnectiviteit**: Zorg dat services met elkaar kunnen communiceren
4. **RBAC-machtigingen**: Controleer of de app toegang heeft tot OpenAI

**Debugging-commando's:**
```bash
# Controleer omgevingsvariabelen
azd env get-values

# Bekijk implementatielogs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Controleer OpenAI-implementatiestatus
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: AI-toepassingen aanpassen aan jouw behoeften

### Stap 3.1: Wijzig de AI-configuratie

1. **Werk het OpenAI-model bij:**
```bash
# Schakel over naar een ander model (indien beschikbaar in uw regio)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Opnieuw inzetten met de nieuwe configuratie
azd deploy
```

2. **Voeg aanvullende AI-diensten toe:**

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

### Stap 3.2: Omgeving-specifieke Configuraties

**Best Practice**: Verschillende configuraties voor ontwikkeling versus productie.

1. **Maak een productieomgeving aan:**
```bash
azd env new myai-production
```

2. **Stel productie-specifieke parameters in:**
```bash
# Productie gebruikt doorgaans hogere SKU's
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Schakel extra beveiligingsfuncties in
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Oefening 3.1: Kostenoptimalisatie**

**Uitdaging**: Configureer het template voor kosteneffectieve ontwikkeling.

**Taken:**
1. Identificeer welke SKUs ingesteld kunnen worden op gratis/basis tiers
2. Configureer omgevingsvariabelen voor minimale kosten
3. Deploy en vergelijk kosten met de productieconfiguratie

**Oplossingshints:**
- Gebruik F0 (gratis) tier voor Cognitive Services wanneer mogelijk
- Gebruik Basic-tier voor Search Service in ontwikkeling
- Overweeg het gebruik van Consumption-plan voor Functions

## Module 4: Beveiliging en productietips

### Stap 4.1: Veilig credentialbeheer

**Huidige uitdaging**: Veel AI-apps coderen API-sleutels of gebruiken onveilige opslag.

**AZD-oplossing**: Managed Identity + Key Vault-integratie.

1. **Bekijk de beveiligingsconfiguratie in je template:**
```bash
# Zoek naar de Key Vault- en Managed Identity-configuratie
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifieer dat Managed Identity werkt:**
```bash
# Controleer of de webapp de juiste identiteitsconfiguratie heeft
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Stap 4.2: Netwerkbeveiliging

1. **Schakel private endpoints in** (als dit nog niet geconfigureerd is):

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

### Stap 4.3: Monitoring en Observability

1. **Configureer Application Insights:**
```bash
# Application Insights zou automatisch geconfigureerd moeten worden
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

### **Lab Oefening 4.1: Security Audit**

**Taak**: Controleer je deployment op beveiligingsbest practices.

**Checklist:**
- [ ] Geen hardcoded secrets in code of configuratie
- [ ] Managed Identity gebruikt voor service-to-service authenticatie
- [ ] Key Vault slaat gevoelige configuratie op
- [ ] Netwerktoegang is correct beperkt
- [ ] Monitoring en logging zijn ingeschakeld

## Module 5: Je eigen AI-toepassing converteren

### Stap 5.1: Assessment Werkblad

**Voordat je je app converteert**, beantwoord deze vragen:

1. **Applicatie-architectuur:**
   - Welke AI-diensten gebruikt je app?
   - Welke compute-resources heeft het nodig?
   - Heeft het een database nodig?
   - Wat zijn de afhankelijkheden tussen services?

2. **Beveiligingseisen:**
   - Met welke gevoelige gegevens werkt je app?
   - Welke compliance-eisen gelden er?
   - Heb je private networking nodig?

3. **Schaalvereisten:**
   - Wat is je verwachte load?
   - Heb je auto-scaling nodig?
   - Zijn er regionale vereisten?

### Stap 5.2: Maak je AZD-template

**Volg dit patroon om je app te converteren:**

1. **Maak de basisstructuur aan:**
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

3. **Maak infrastructuurtemplates:**

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

### **Lab Oefening 5.1: Template Creatie Uitdaging**

**Uitdaging**: Maak een AZD-template voor een documentverwerkende AI-app.

**Vereisten:**
- Microsoft Foundry Models voor contentanalyse
- Document Intelligence voor OCR
- Storage Account voor documentuploads
- Function App voor verwerkingslogica
- Webapp voor gebruikersinterface

**Bonuspunten:**
- Voeg correcte foutafhandeling toe
- Neem kostenraming op
- Zet monitoringdashboards op

## Module 6: Veelvoorkomende problemen oplossen

### Veelvoorkomende deploymentproblemen

#### Issue 1: OpenAI Service Quota Overschreden
**Symptomen:** Deployment faalt met quota-fout
**Oplossingen:**
```bash
# Controleer de huidige quota
az cognitiveservices usage list --location eastus

# Vraag een verhoging van de quota aan of probeer een andere regio
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Niet Beschikbaar in Regio
**Symptomen:** AI-antwoorden falen of model-deployment fouten
**Oplossingen:**
```bash
# Controleer modelbeschikbaarheid per regio
az cognitiveservices model list --location eastus

# Bijwerken naar een beschikbaar model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Issue 3: Machtigingsproblemen
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

#### Issue 4: Langzame AI-antwoorden
**Onderzoeksstappen:**
1. Controleer Application Insights voor prestatiestatistieken
2. Bekijk OpenAI-servicemetrics in de Azure-portal
3. Verifieer netwerkconnectiviteit en latency

**Oplossingen:**
- Implementeer caching voor veelvoorkomende queries
- Gebruik het juiste OpenAI-model voor jouw use case
- Overweeg read replicas voor scenario's met hoge belasting

### **Lab Oefening 6.1: Debugging Uitdaging**

**Scenario**: Je deployment is geslaagd, maar de applicatie geeft 500-fouten terug.

**Debuggingtaken:**
1. Controleer applicatielogs
2. Verifieer service-connectiviteit
3. Test authenticatie
4. Bekijk de configuratie

**Te gebruiken tools:**
- `azd show` voor deployment-overzicht
- Azure-portal voor gedetailleerde servicelogs
- Application Insights voor applicatietelemetrie

## Module 7: Monitoring en Optimalisatie

### Stap 7.1: Stel uitgebreide monitoring in

1. **Maak aangepaste dashboards:**

Navigeer naar de Azure-portal en maak een dashboard met:
- OpenAI-aanvraagcount en latency
- Applicatiefoutpercentages
- Resourcegebruik
- Kostentracking

2. **Stel waarschuwingen in:**
```bash
# Waarschuwing bij hoog foutpercentage
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
# Gebruik de Azure CLI om kostengegevens op te halen.
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementeer kostenbeheersing:**
- Stel budgetwaarschuwingen in
- Gebruik autoscaling-beleid
- Implementeer requestcaching
- Monitor tokengebruik voor OpenAI

### **Lab Oefening 7.1: Prestatieoptimalisatie**

**Taak**: Optimaliseer je AI-applicatie voor zowel performance als kosten.

**Metrics om te verbeteren:**
- Verminder gemiddelde responstijd met 20%
- Verminder maandelijkse kosten met 15%
- Behoud 99,9% uptime

**Strategieën om te proberen:**
- Implementeer response caching
- Optimaliseer prompts voor token-efficiëntie
- Gebruik geschikte compute-SKUs
- Stel juiste autoscaling in

## Einduitdaging: End-to-End Implementatie

### Uitdaging Scenario

Je krijgt de opdracht om een productieklare AI-gestuurde klantenservice-chatbot te maken met de volgende vereisten:

**Functionele vereisten:**
- Webinterface voor klantinteracties
- Integratie met Microsoft Foundry Models voor antwoorden
- Documentzoekfunctionaliteit met Cognitive Search
- Integratie met bestaande klantendatabase
- Meertalige ondersteuning

**Niet-functionele vereisten:**
- Afhandelen van 1000 gelijktijdige gebruikers
- 99,9% uptime SLA
- SOC 2-compliance
- Kosten onder $500/maand
- Deploy naar meerdere omgevingen (dev, staging, prod)

### Implementatiestappen

1. **Ontwerp de architectuur**
2. **Maak het AZD-template**
3. **Implementeer beveiligingsmaatregelen**
4. **Stel monitoring en alerting in**
5. **Maak deployment-pijplijnen**
6. **Documenteer de oplossing**

### Evaluatiecriteria

- ✅ **Functionaliteit**: Voldoet het aan alle vereisten?
- ✅ **Beveiliging**: Zijn best practices geïmplementeerd?
- ✅ **Schaalbaarheid**: Kan het de load aan?
- ✅ **Onderhoudbaarheid**: Is de code en infrastructuur goed georganiseerd?
- ✅ **Kosten**: Blijft het binnen budget?

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

Gefeliciteerd! Je hebt het AI Workshop-lab afgerond. Je zou nu in staat moeten zijn om:

- ✅ Bestaande AI-toepassingen om te zetten naar AZD-templates
- ✅ Productieklaar AI-toepassingen te implementeren
- ✅ Beveiligingsbest practices voor AI-workloads toe te passen
- ✅ AI-toepassingsprestaties te monitoren en te optimaliseren
- ✅ Veelvoorkomende implementatieproblemen te verhelpen

### Volgende stappen
1. Pas deze patronen toe op je eigen AI-projecten
2. Draag templates terug naar de community
3. Sluit je aan bij de Microsoft Foundry Discord voor voortdurende ondersteuning
4. Verken geavanceerde onderwerpen zoals implementaties over meerdere regio's

---

**Workshopfeedback**: Help ons deze workshop te verbeteren door je ervaring te delen in het [Microsoft Foundry Discord #Azure-kanaal](https://discord.gg/microsoft-azure).

---

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD For Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 2 - AI-first ontwikkeling
- **⬅️ Vorige**: [AI Modelimplementatie](ai-model-deployment.md)
- **➡️ Volgende**: [Best practices voor productie-AI](production-ai-practices.md)
- **🚀 Volgend hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

**Hulp nodig?** Sluit je aan bij onze community voor ondersteuning en discussies over AZD- en AI-implementaties.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in zijn oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
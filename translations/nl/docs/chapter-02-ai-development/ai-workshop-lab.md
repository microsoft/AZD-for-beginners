# AI Workshop Lab: Maak je AI-oplossingen AZD-Deployable

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-First Ontwikkeling
- **⬅️ Vorige**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Volgende**: [Productie AI Beste Praktijken](production-ai-practices.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

## Overzicht van de Workshop

Deze praktische lab begeleidt ontwikkelaars in het proces van het nemen van een bestaande AI-sjabloon en deze te implementeren met behulp van Azure Developer CLI (AZD). Je leert essentiële patronen voor productie AI-implementaties met Microsoft Foundry-services.

> **Validatienotitie (2026-07-13):** Deze workshop is beoordeeld met `azd` `1.27.1`. Als jouw lokale installatie ouder is, update AZD dan voordat je begint zodat de authenticatie-, sjabloon- en implementatieworkflow overeenkomt met de onderstaande stappen.

**Duur:** 2-3 uur  
**Niveau:** Gevorderd  
**Vereisten:** Basiskennis Azure, bekendheid met AI/ML-concepten

## 🎓 Leerdoelen

Aan het einde van deze workshop kun je:
- ✅ Een bestaande AI-applicatie omzetten naar gebruik van AZD-sjablonen
- ✅ Microsoft Foundry-services configureren met AZD
- ✅ Veilige beheersystemen voor referenties implementeren voor AI-services
- ✅ Productiegereed AI-toepassingen implementeren met monitoring
- ✅ Veelvoorkomende AI-implementatieproblemen oplossen

## Vereisten

### Benodigde Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) geïnstalleerd
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) geïnstalleerd
- [Git](https://git-scm.com/) geïnstalleerd
- Code-editor (VS Code aanbevolen)

### Azure Resources
- Azure-abonnement met contributor-toegang
- Toegang tot Microsoft Foundry Models-services (of mogelijkheid om toegang aan te vragen)
- Rechten om resourcegroepen aan te maken

### Kennisvereisten
- Basiskennis van Azure-services
- Bekendheid met command-line interfaces
- Basis AI/ML-concepten (API’s, modellen, prompts)

## Lab Setup

### Stap 1: Voorbereiding van de Omgeving

1. **Verifieer tool-installaties:**
```bash
# Controleer AZD-installatie
azd version

# Controleer Azure CLI
az --version

# Log in op Azure voor AZD-workflows
azd auth login

# Log alleen in op Azure CLI als je van plan bent az-commando's uit te voeren tijdens diagnostiek
az login
```

Als je werkt over meerdere tenants of je abonnement wordt niet automatisch gedetecteerd, probeer dan opnieuw met `azd auth login --tenant-id <tenant-id>`.

2. **Clone de workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: AZD-structuur begrijpen voor AI-toepassingen

### Anatomie van een AI AZD-sjabloon

Verken de belangrijkste bestanden in een AI-klaar AZD-sjabloon:

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

### **Lab Oefening 1.1: Verken de Configuratie**

1. **Bekijk het azure.yaml-bestand:**
```bash
cat azure.yaml
```

**Waar je op moet letten:**
- Service-definities voor AI-componenten
- Toewijzingen van omgevingsvariabelen
- Hostconfiguraties

2. **Bekijk de main.bicep-infrastructuur:**
```bash
cat infra/main.bicep
```

**Belangrijke AI-patronen om te identificeren:**
- Microsoft Foundry Models-service provisioning
- Azure AI Search-integratie
- Beveiligd sleutelbeheer
- Netwerkbeveiligingsconfiguraties

### **Discussiepunt:** Waarom deze patronen belangrijk zijn voor AI

- **Service-afhankelijkheden**: AI-apps vereisen vaak meerdere gecoördineerde diensten
- **Beveiliging**: API-sleutels en eindpunten moeten veilig beheerd worden
- **Schaalbaarheid**: AI-werkbelastingen hebben unieke schaalvereisten
- **Kostenbeheer**: AI-services kunnen duur zijn als ze niet correct geconfigureerd zijn

## Module 2: Implementeer je eerste AI-toepassing

### Stap 2.1: Initialiseer de Omgeving

1. **Maak een nieuwe AZD-omgeving aan:**
```bash
azd env new myai-workshop
```

2. **Stel vereiste parameters in:**
```bash
# Stel uw voorkeursregio in Azure in
azd env set AZURE_LOCATION eastus

# Optioneel: Stel een specifiek OpenAI-model in
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Stap 2.2: Implementeer de infrastructuur en applicatie

1. **Implementeer met AZD:**
```bash
azd up
```

**Wat er gebeurt tijdens `azd up`:**
- ✅ Provisioning van Microsoft Foundry Models-service
- ✅ Creëren van Azure AI Search-service
- ✅ Opzetten van App Service voor de webapplicatie
- ✅ Configureren van netwerken en beveiliging
- ✅ Implementeren van applicatiecode
- ✅ Opzetten van monitoring en logging

2. **Monitor de implementatievoortgang** en noteer de aangemaakte resources.

### Stap 2.3: Verifieer je Implementatie

1. **Controleer de geïmplementeerde resources:**
```bash
azd show
```

2. **Open de geïmplementeerde applicatie:**
```bash
azd show
```

Open de webendpoint die wordt getoond in de `azd show` output.

3. **Test de AI-functionaliteit:**
   - Navigeer naar de webapplicatie
   - Probeer voorbeeldquery’s
   - Controleer of AI-reacties werken

### **Lab Oefening 2.1: Oefening in foutopsporing**

**Scenario**: Je implementatie is gelukt maar de AI reageert niet.

**Veelvoorkomende problemen om te controleren:**
1. **OpenAI API-sleutels**: Controleer of ze correct zijn ingesteld
2. **Modelbeschikbaarheid**: Controleer of jouw regio het model ondersteunt
3. **Netwerkconnectiviteit**: Zorg dat services met elkaar kunnen communiceren
4. **RBAC-machtigingen**: Controleer of de app toegang heeft tot OpenAI

**Debugcommando’s:**
```bash
# Controleer omgevingsvariabelen
azd env get-values

# Bekijk deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Controleer OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Pas AI-toepassingen aan jouw behoeften aan

### Stap 3.1: Wijzig de AI-configuratie

1. **Update het OpenAI-model:**
```bash
# Overschakelen naar een ander model (indien beschikbaar in jouw regio)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Opnieuw uitrollen met de nieuwe configuratie
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

### Stap 3.2: Omgevingsspecifieke Configuraties

**Beste praktijk**: Verschillende configuraties voor ontwikkeling versus productie.

1. **Maak een productieomgeving aan:**
```bash
azd env new myai-production
```

2. **Stel productie-specifieke parameters in:**
```bash
# Productie gebruikt doorgaans hogere SKU's
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Extra beveiligingsfuncties inschakelen
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Oefening 3.1: Kostenoptimalisatie**

**Uitdaging**: Configureer de sjabloon voor kostenefficiënte ontwikkeling.

**Taken:**
1. Identificeer welke SKU’s op gratis/basis niveaus kunnen worden ingesteld
2. Stel omgevingsvariabelen in voor minimale kosten
3. Implementeer en vergelijk kosten met de productieconfiguratie

**Oplossingshints:**
- Gebruik F0 (gratis) niveau voor Azure AI-services waar mogelijk
- Gebruik Basisniveau voor Search Service in ontwikkeling
- Overweeg het gebruik van Consumption-plan voor Functions

## Module 4: Beveiliging en Beste Productiepraktijken

### Stap 4.1: Veilig beheer van referenties

**Huidige uitdaging**: Veel AI-apps coderen API-sleutels hard of gebruiken onveilige opslag.

**AZD Oplossing**: Managed Identity + Key Vault-integratie.

1. **Bekijk de beveiligingsconfiguratie in je sjabloon:**
```bash
# Zoek naar Key Vault en Managed Identity configuratie
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifieer dat Managed Identity werkt:**
```bash
# Controleer of de webapp de juiste identiteitsconfiguratie heeft
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

### Stap 4.3: Monitoring en Observeerbaarheid

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

**Taak**: Beoordeel je implementatie voor beveiligingsbest practices.

**Checklist:**
- [ ] Geen hardgecodeerde geheimen in code of configuratie
- [ ] Managed Identity gebruikt voor service-tot-service authenticatie
- [ ] Key Vault slaat gevoelige configuratie op
- [ ] Netwerktoegang is correct beperkt
- [ ] Monitoring en logging zijn ingeschakeld

## Module 5: Je eigen AI-applicatie omzetten

### Stap 5.1: Beoordelingswerkblad

**Voordat je je app omzet**, beantwoord deze vragen:

1. **Applicatiearchitectuur:**
   - Welke AI-services gebruikt je app?
   - Welke compute-resources heeft het nodig?
   - Heeft het een database nodig?
   - Wat zijn de afhankelijkheden tussen services?

2. **Beveiligingseisen:**
   - Met welke gevoelige gegevens werkt je app?
   - Welke compliance-eisen heb je?
   - Heb je privé-netwerken nodig?

3. **Schaalvereisten:**
   - Wat is je verwachte belasting?
   - Heb je auto-scaling nodig?
   - Zijn er regionale eisen?

### Stap 5.2: Maak je AZD-sjabloon

**Volg dit patroon om je app om te zetten:**

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

3. **Maak infrastructuursjablonen aan:**

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

### **Lab Oefening 5.1: Sjabloon Aanmaak Uitdaging**

**Uitdaging**: Maak een AZD-sjabloon voor een documentverwerking AI-app.

**Vereisten:**
- Microsoft Foundry Models voor inhoudsanalyse
- Document Intelligence voor OCR
- Storage Account voor documentuploads
- Function App voor verwerkingslogica
- Webapp voor gebruikersinterface

**Bonuspunten:**
- Voeg correcte foutafhandeling toe
- Neem kostenraming op
- Zet monitoringdashboards op

## Module 6: Veelvoorkomende problemen oplossen

### Veelvoorkomende Implementatieproblemen

#### Probleem 1: OpenAI-service quota overschreden
**Symptomen:** Implementatie mislukt met quotafout
**Oplossingen:**
```bash
# Controleer huidige quota
az cognitiveservices usage list --location eastus

# Vraag om een verhoging van de quota of probeer een andere regio
azd env set AZURE_LOCATION westus2
azd up
```

#### Probleem 2: Model niet beschikbaar in regio
**Symptomen:** AI-responses falen of fouten bij modelimplementatie
**Oplossingen:**
```bash
# Controleer de beschikbaarheid van het model per regio
az cognitiveservices model list --location eastus

# Bijwerken naar beschikbaar model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Probleem 3: Machtigingsproblemen
**Symptomen:** 403 Forbidden-fouten bij aanroepen AI-services
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

#### Probleem 4: Traag reagerende AI
**Onderzoekstappen:**
1. Controleer Application Insights voor prestatiedata
2. Bekijk OpenAI service-metrics in Azure portal
3. Verifieer netwerkconnectiviteit en latency

**Oplossingen:**
- Implementeer caching voor veelvoorkomende queries
- Gebruik een passend OpenAI-model voor je use case
- Overweeg leesreplica’s voor hoge belastingen

### **Lab Oefening 6.1: Debugging Uitdaging**

**Scenario**: Je implementatie is succesvol, maar de applicatie geeft 500-fouten terug.

**Debugging taken:**
1. Controleer applicatielogs
2. Controleer serviceconnectiviteit
3. Test authenticatie
4. Bekijk configuratie

**Te gebruiken tools:**
- `azd show` voor overzicht implementatie
- Azure portal voor gedetailleerde servicelogs
- Application Insights voor applicatietelemetrie

## Module 7: Monitoring en Optimalisatie

### Stap 7.1: Stel Uitgebreide Monitoring in

1. **Creëer aangepaste dashboards:**

Navigeer naar Azure portal en creëer een dashboard met:
- OpenAI-aanvraagtellingen en latency
- Applicatiefoutpercentages
- Resourcegebruik
- Kostentracking

2. **Stel alerts in:**
```bash
# Waarschuwing voor hoge foutmarge
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
# Gebruik Azure CLI om kostengegevens op te halen
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementeer kostenbeheersing:**
- Stel budgetalerts in
- Gebruik autoscaling-beleid
- Implementeer querycaching
- Monitor tokengebruik voor OpenAI

### **Lab Oefening 7.1: Prestatie-optimalisatie**

**Taak**: Optimaliseer je AI-applicatie voor zowel prestaties als kosten.

**Te verbeteren metrics:**
- Verminder gemiddelde reactietijd met 20%
- Verminder maandelijkse kosten met 15%
- Behoud 99,9% uptime

**Strategieën om te proberen:**
- Implementeer response caching
- Optimaliseer prompts voor token-efficiëntie
- Gebruik passende compute-SKU’s
- Stel correcte autoscaling in

## Einduitdaging: End-to-End Implementatie

### Uitdagingsscenario

Je hebt de opdracht om een productieklare, AI-aangedreven klantenservice chatbot te maken met de volgende eisen:

**Functionele Vereisten:**
- Webinterface voor klantinteracties
- Integratie met Microsoft Foundry Models voor reacties
- Documentzoekfunctie met Azure AI Search
- Integratie met bestaande klantendatabase
- Meertalige ondersteuning

**Niet-functionele Vereisten:**
- Ondersteunt 1000 gelijktijdige gebruikers
- SLA van 99,9% uptime
- SOC 2-compliance
- Kosten onder $500/maand
- Implementeer in meerdere omgevingen (ontwikkeling, staging, productie)

### Implementatiestappen

1. **Ontwerp de architectuur**
2. **Maak de AZD-sjabloon**
3. **Voer beveiligingsmaatregelen uit**
4. **Stel monitoring en waarschuwingen in**
5. **Maak implementatiepijplijnen**
6. **Documenteer de oplossing**

### Evaluatiecriteria

- ✅ **Functionaliteit**: Voldoet het aan alle eisen?
- ✅ **Beveiliging**: Zijn best practices toegepast?
- ✅ **Schaalbaarheid**: Kan het de belasting aan?
- ✅ **Onderhoudbaarheid**: Is code en infrastructuur goed georganiseerd?
- ✅ **Kosten**: Blijft het binnen budget?

## Aanvullende Bronnen

### Microsoft Documentatie
- [Azure Developer CLI Documentatie](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentatie](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentatie](https://learn.microsoft.com/azure/ai-studio/)

### Voorbeeldsjablonen
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Gemeenschapsbronnen
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Voltooingscertificaat

Gefeliciteerd! Je hebt de AI Workshop Lab voltooid. Je zou nu in staat moeten zijn om:

- ✅ Bestaande AI-toepassingen om te zetten naar AZD-sjablonen
- ✅ Productieklaar AI-toepassingen inzetten
- ✅ Beveiligingsbest practices voor AI-workloads implementeren
- ✅ AI-toepassingsprestaties monitoren en optimaliseren
- ✅ Veelvoorkomende problemen bij implementatie oplossen

### Volgende stappen
1. Pas deze patronen toe op je eigen AI-projecten
2. Draag sjablonen bij aan de gemeenschap
3. Word lid van de Microsoft Foundry Discord voor voortdurende ondersteuning
4. Verken geavanceerde onderwerpen zoals multi-region implementaties

---

**Workshop Feedback**: Help ons deze workshop te verbeteren door je ervaring te delen in het [Microsoft Foundry Discord #Azure kanaal](https://discord.gg/microsoft-azure).

---

**Hoofdstuk Navigatie:**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-First Ontwikkeling
- **⬅️ Vorige**: [AI Model Implementatie](ai-model-deployment.md)
- **➡️ Volgende**: [Productie AI Best Practices](production-ai-practices.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

**Hulp nodig?** Word lid van onze gemeenschap voor ondersteuning en discussies over AZD en AI-implementaties.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
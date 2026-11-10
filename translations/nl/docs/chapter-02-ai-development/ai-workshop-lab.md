# AI Workshop Lab: Maak Uw AI-oplossingen AZD-Deployable

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-First Ontwikkeling
- **⬅️ Vorige**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Volgende**: [Productie AI Best Practices](../chapter-08-production/production-ai-practices.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

## Overzicht van de Workshop

Deze praktische lab begeleidt ontwikkelaars bij het proces van het nemen van een bestaande AI-template en het deployen ervan met Azure Developer CLI (AZD). Je leert essentiële patronen voor AI-productiedeployments met Microsoft Foundry-services.

> **Release review (2026-11-04):** De AZD-commando's en voorbeeldconfiguratienamen zijn gecontroleerd tegen de `azd` `1.37.2` release en de gekoppelde voorbeeldconfiguratie. Dit is een documentatiereview, geen validatie van een live deployment. De RAG-lab vereist niet de agent-extensie; voor agent-evaluaties gebruik de aparte `azure.ai.evaluations` extensie en [huidige evaluatieworkflow](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), niet legacy agent-evaluatiecommando's.

**Duur:** 2-3 uur  
**Niveau:** Gemiddeld  
**Vereisten:** Basiskennis Azure, bekendheid met AI/ML-concepten

## 🎓 Leerdoelen

Aan het einde van deze workshop kun je:
- ✅ Een bestaande AI AZD-template verkennen en de conversie van je eigen applicatie plannen
- ✅ Microsoft Foundry-services configureren met AZD
- ✅ Veilige beheer van referenties voor AI-services implementeren
- ✅ Een AI-referentieapplicatie deployen met monitoring
- ✅ Veelvoorkomende AI-deploymetproblemen oplossen

## Vereisten

### Benodigde Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) geïnstalleerd
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) geïnstalleerd
- [Git](https://git-scm.com/) geïnstalleerd
- Code-editor (aanbevolen VS Code)

Deze commando's gebruiken Bash-syntaxis (inclusief lijncontinuaties en `grep`). Gebruik op Windows Git Bash/WSL of vertaal ze naar PowerShell. Installeer ook de taal-, package-manager- en container-tools vermeld in de [local environment setup van het voorbeeld](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Azure Resources
- Azure-abonnement met rechten voor resource provisioning en roltoewijzing (Contributor alleen kan geen RBAC-toewijzingen maken; gebruik een bevoegde rolbeheerder of het in het voorbeeld gedocumenteerde equivalent)
- Toegang tot Microsoft Foundry Models-services (of mogelijkheid om toegang aan te vragen)
- Rechten voor het aanmaken van resourcegroepen

### Kennisvereisten
- Basiskennis van Azure-services
- Bekendheid met commandoregelinterfaces
- Basis AI/ML-concepten (API's, modellen, prompts)

## Lab Setup

### Stap 1: Omgevingsvoorbereiding

1. **Controleer toolinstallaties:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Als je met meerdere tenants werkt of je abonnement niet automatisch wordt gevonden, probeer het dan opnieuw met `azd auth login --tenant-id <tenant-id>`.

2. **Clone de workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Begrijp de AZD-structuur voor AI-toepassingen

### Anatomie van een AI AZD-template

Verken de belangrijkste bestanden in een AI-ready AZD-template:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

De uitgecheckte sample kan veranderen; `.azure/` verschijnt na omgeving-initialisatie, niet noodzakelijkerwijs in een verse clone. Inspecteer de werkelijke checkout in plaats van ontbrekende mappen aan te maken om te voldoen aan dit schema.

### **Lab Oefening 1.1: Verken de Configuratie**

1. **Bekijk het azure.yaml bestand:**
```bash
cat azure.yaml
```

**Waarnaar te kijken:**
- Service-definities voor AI-componenten
- Omgeving variabele mappings
- Host configuraties

2. **Bekijk de main.bicep infrastructuur:**
```bash
cat infra/main.bicep
```

**Belangrijke AI-patronen om te herkennen:**
- Microsoft Foundry Models service provisioning
- Azure AI Search integratie
- Veilig sleutelbeheer
- Netwerkbeveiligingsconfiguraties

### **Discussiepunt:** Waarom Deze Patronen Belangrijk Zijn voor AI

- **Serviceafhankelijkheden**: AI-apps vereisen vaak meerdere gecoördineerde services
- **Beveiliging**: API-sleutels en eindpunten moeten veilig worden beheerd
- **Schaalbaarheid**: AI-workloads hebben unieke schaalvereisten
- **Kostenbeheer**: AI-services kunnen duur zijn als ze niet goed geconfigureerd zijn

## Module 2: Deploy je Eerste AI Applicatie

### Stap 2.1: Initialiseer de Omgeving

1. **Maak een nieuwe AZD-omgeving aan:**
```bash
azd env new myai-workshop
```

2. **Stel de vereiste parameters in:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Stap 2.2: Deploy de Infrastructuur en Applicatie

1. **Deploy met AZD:**
```bash
azd up
```

**Wat gebeurt er tijdens `azd up`:**
- ✅ Provisioning van Microsoft Foundry Models service
- ✅ Creëren van Azure AI Search service
- ✅ Opzetten van Azure Container Apps voor backend en gebundelde frontend (de huidige standaard van het voorbeeld)
- ✅ Configureren van netwerken en beveiliging
- ✅ Deployen van applicatiecode
- ✅ Opzetten van monitoring en logging

2. **Volg de voortgang van de deployment** en let op de aangemaakte resources.

### Stap 2.3: Verifieer je Deployment

1. **Controleer de gedeployede resources:**
```bash
azd show
```

2. **Open de gedeployede applicatie:**
```bash
azd show
```

Open het webendpoint dat in de `azd show` output wordt getoond.

3. **Test de AI-functionaliteit:**
   - Navigeer naar de webapplicatie
   - Probeer voorbeeld queries
   - Verifieer dat AI-responsen werken

### **Lab Oefening 2.1: Oefening in Probleemoplossing**

**Scenario**: Je deployment is gelukt maar de AI reageert niet.

**Veelvoorkomende zaken om te controleren:**
1. **Authenticatie**: Controleer de managed identity en roltoewijzingen; controleer API-sleutels alleen als je bewust key-based authenticatie hebt ingeschakeld
2. **Modelbeschikbaarheid**: Controleer of jouw regio het model ondersteunt
3. **Netwerkconnectiviteit**: Zorg dat services kunnen communiceren
4. **RBAC-rechten**: Verifieer dat de app toegang heeft tot OpenAI

**Debugging commando's:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: AI-toepassingen Aanpassen aan Je Behoeften

### Stap 3.1: Pas de AI-configuratie aan

1. **Werk het OpenAI-model bij:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Voeg extra AI-services toe:**

Bewerk `infra/main.bicep` om Document Intelligence toe te voegen:

Het volgende is een illustratief fragment, geen complete template. De sample kan al document-verwerkende services provisionen: inspecteer de huidige infrastructuur voordat je dubbele resources toevoegt. Aangepaste toevoegingen vereisen het koppelen van outputs, identiteiten en applicatieconfiguratie.

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

**Beste Praktijk**: Verschillende configuraties voor ontwikkeling versus productie.

1. **Maak een productieomgeving aan:**
```bash
azd env new myai-production
```

2. **Stel productie-specifieke parameters in:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Deze namen komen uit de [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) van het voorbeeld. `azd env set` slaat een waarde op maar maakt deze niet automatisch nuttig: de template moet deze consumeren. Bekijk de [network isolation guide](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) van het voorbeeld voordat je publieke toegang uitschakelt, en gebruik `azd up` om infrastructuurwijzigingen toe te passen. De OpenAI SKU `S0` bepaalt niet alleen de modeldoorvoer; type en capaciteit van model deployment zijn ook belangrijk.

### **Lab Oefening 3.1: Kostenoptimalisatie**

**Uitdaging**: Configureer de template voor kosteneffectieve ontwikkeling.

**Taken:**
1. Selecteer de wegwerpworkshopomgeving: `azd env select myai-workshop`.
2. Noteer huidige Search SKU en modelcapaciteit vanuit `infra/main.parameters.json` en de gekozen omgeving.
3. Gebruik de ondersteunde invoer hieronder, na bevestiging van model/regionale quota:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Controleer de Search SKU en deployment capaciteit in het portal en schat het verschil met de prijscalculator. Verwacht niet dat facturatiegegevens onmiddellijk worden bijgewerkt.

**Succescriteria:** Search gebruikt Basic, de chat deployment heeft de gevraagde ondersteunde capaciteit, en de app beantwoordt nog steeds een voorbeeldvraag. Capaciteit `10` is een snelheidslimiettoewijzing, geen tokenprijskorting. Wijzigingen van Search tier kunnen beperkt zijn of recreatie vereisen; experimenteer niet op productiemiddelen. F0 is service-specifiek en is geen Azure OpenAI-model SKU.

## Module 4: Beveiliging en Productie Best Practices

### Stap 4.1: Beheer van Veilige Referenties

**Huidige uitdaging**: Veel AI-apps coderen API-sleutels hard of gebruiken onveilige opslag.

**AZD Oplossing**: Managed Identity + Key Vault integratie.

1. **Bekijk de beveiligingsconfiguratie in je template:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifieer dat Managed Identity werkt:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Stap 4.2: Netwerkbeveiliging

1. **Schakel private endpoints in** met de ondersteunde netwerkconfiguratie van het voorbeeld (indien nog niet geconfigureerd).

Voor je eigen template toont dit illustratief fragment de OpenAI endpoint verbinding. Het heeft ook een VNet, private DNS-configuratie en applicatieconnectiviteit nodig; plak het niet ongewijzigd in het voorbeeld dat al private-endpoint modules heeft:
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
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Schakel de Application Insights-integratie van het voorbeeld in:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

De instrumentatie van het voorbeeld verzendt telemetrie; een willekeurige `OPENAI_MONITOR_ENABLED` instelling activeert geen AI-metrieken. Bekijk traces voor modelaanroepen, latency, fouten en tokengebruik, en vermijd het opnemen van gevoelige prompts of reacties.

### **Lab Oefening 4.1: Beveiligingsaudit**

**Taak**: Evalueer je deployment op beveiligingsbest practices.

**Checklist:**
- [ ] Geen hardcoded geheimen in code of configuratie
- [ ] Managed Identity gebruikt voor service-to-service authenticatie
- [ ] Key Vault slaat gevoelige configuratie op
- [ ] Netwerktoegang is goed beperkt
- [ ] Monitoring en logging zijn ingeschakeld

## Module 5: Je Eigen AI Applicatie Converteren

### Stap 5.1: Evaluatiewerkblad

**Beantwoord voor het converteren van je app deze vragen:**

1. **Applicatie-architectuur:**
   - Welke AI-services gebruikt je app?
   - Welke compute resources heeft het nodig?
   - Heeft het een database nodig?
   - Wat zijn afhankelijkheden tussen services?

2. **Beveiligingseisen:**
   - Welke gevoelige data verwerkt je app?
   - Welke compliance-eisen zijn er?
   - Heb je private networking nodig?

3. **Schaaleisen:**
   - Wat is de verwachte belasting?
   - Heb je autoscaling nodig?
   - Zijn er regionale eisen?

### Stap 5.2: Maak je AZD-template

**Volg dit patroon om je app te converteren:**

**Alleen scaffold:** Deze sectie bevat geen API/webapplicatiebron, host-infrastructuur, modeldeployments, identiteit/RBAC of een afgewerkte `main.parameters.json`. De resourcegroep-gescopeerde Bicep toont modulaire compositie; een typische AZD subscription-gescopeerde entry point moet een resourcegroep maken en deze aanroepen. Verwacht niet dat `azd up` een complete app deployt na alleen het kopiëren van deze fragmenten. Voor een werkbare basislijn blijf je de RAG-template uit Module 1 gebruiken.

1. **Maak de basisstructuur aan:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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

3. **Maak infrastructuur-templates:**

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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Lab Oefening 5.1: Template Creatie Uitdaging**

**Uitdaging**: Maak een AZD-template voor een documentverwerkings-AI-app.

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

## Module 6: Veelvoorkomende Problemen Oplossen

### Veelvoorkomende Deploymentproblemen

#### Probleem 1: OpenAI Service Quota Overschreden
**Symptomen:** Deployment mislukt met quota-fout
**Oplossingen:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Probleem 2: Model Niet Beschikbaar in Regio
**Symptomen:** AI-responsen falen of fout bij model deployment
**Oplossingen:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Probleem 3: Toegangsproblemen
**Symptomen:** 403 Forbidden-fouten bij het aanroepen van AI-services
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

#### Probleem 4: Trage AI-responsen
**Onderzoeksstappen:**
1. Controleer Application Insights op prestatiestatistieken
2. Bekijk OpenAI-service statistieken in Azure Portal
3. Verifieer netwerkconnectiviteit en latency

**Oplossingen:**
- Implementeer caching voor veelvoorkomende queries
- Gebruik het geschikte OpenAI-model voor je use case
- Schaal applicatie-replicas pas na controle van model RPM/TPM limieten; Azure OpenAI deployments bieden geen generieke database-stijl "lees replica" instelling

### **Lab Oefening 6.1: Debugging Uitdaging**

**Scenario**: Je deployment is geslaagd, maar de applicatie geeft 500-fouten terug.

**Debugging taken:**
1. Controleer applicatielogs
2. Verifieer serviceconnectiviteit
3. Authenticatie testen
4. Configuratie beoordelen

**Te gebruiken tools:**
- `azd show` voor een overzicht van de implementatie
- Azure-portal voor gedetailleerde servicelogboeken
- Application Insights voor applicatietelemetrie

## Module 7: Monitoring en Optimalisatie

### Stap 7.1: Geïntegreerde monitoring instellen

1. **Aangepaste dashboards maken:**

Ga naar de Azure-portal en maak een dashboard aan met:
- OpenAI-aanvraagtelling en latentie
- Foutpercentages van de applicatie
- Gebruik van resources
- Kostenbewaking

2. **Waarschuwingen instellen:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Controleer of de component aanvraagtelemetrie uitzendt en voeg een actiegroep toe als meldingen nodig zijn. De metriek is een telling, geen faalpercentage; een snelheidswaarschuwing vereist een geschikte query en noemer.

### Stap 7.2: Kostenoptimalisatie

1. **Analyseer huidige kosten:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Vervang de datumplaatsaanduidingen. Ondersteuning voor de Consumption API varieert per facturatieovereenkomst; gebruik Cost Management in de portal als gebruiksgegevens niet beschikbaar zijn. Kosten zijn vertraagd, geen realtime testinstrument.

2. **Implementeer kostenbeheersing:**
- Stel budgetwaarschuwingen in
- Gebruik autoscaling-beleid
- Implementeer aanvraagcaching
- Monitor tokengebruik voor OpenAI

### **Lab-oefening 7.1: Prestatieoptimalisatie**

**Taak**: Optimaliseer je AI-applicatie voor zowel prestaties als kosten.

**Te verbeteren statistieken:**
- Verminder gemiddelde responstijd met 20%
- Verminder maandelijkse kosten met 15%
- Definieer een 99,9% beschikbaarheid SLO en een meetvenster (een korte lab kan geen maandelijkse uptime demonstreren)

**Strategieën om te proberen:**
- Implementeer responscaching
- Optimaliseer prompts voor token-efficiëntie
- Gebruik geschikte compute SKUs
- Stel juiste autoscaling in

## Einduitdaging: End-to-End Implementatie

### Uitdaging Scenario

Dit is een **optionele architectuur/ontwerpuitdaging**, geen meegeleverde uitvoerbare oefening of productcertificering. Stel een AI-gestuurde klantenservice-chatbot voor en documenteer welke vereisten verdere implementatie en bewijs nodig hebben:

**Functionele vereisten:**
- Webinterface voor klantinteracties
- Integratie met Microsoft Foundry Models voor antwoorden
- Documentzoekfunctionaliteit met Azure AI Search
- Integratie met bestaande klanten database
- Meertalige ondersteuning

**Niet-functionele vereisten:**
- Ondersteunen van 1000 gelijktijdige gebruikers
- 99,9% uptime SLA
- SOC 2 compliance
- Kosten onder $500 per maand
- Implementeren in meerdere omgevingen (dev, staging, prod)

Dit zijn hypothetische beperkingen door belanghebbenden, geen gelijktijdig gegarandeerde uitkomsten. Definieer aanvraagtempo, prompt-/outputgroottes en sessieduur voordat kosten worden geschat; 1000 gelijktijdige gebruikers bepalen geen werklast of bewijzen dat een budget van $500 haalbaar is. SOC 2 is een organisatorisch auditresultaat, geen schakel die wordt ingeschakeld door een AZD-sjabloon. Identificeer afwegingen en verwerp onhaalbare beperkingen met bewijs.

### Implementatiestappen

1. **Ontwerp de architectuur**
2. **Maak de AZD-sjabloon**
3. **Implementeer beveiligingsmaatregelen**
4. **Stel monitoring en waarschuwingen in**
5. **Maak implementatiepijplijnen**
6. **Documenteer de oplossing**

### Evaluatiecriteria

- ✅ **Functionaliteit**: Zijn geïmplementeerde mogelijkheden aangetoond en zijn resterende hiaten expliciet?
- ✅ **Beveiliging**: Zijn best practices geïmplementeerd?
- ✅ **Schaalbaarheid**: Kan het de belasting aan?
- ✅ **Onderhoudbaarheid**: Is de code en infrastructuur goed georganiseerd?
- ✅ **Kosten**: Blijft het binnen budget?

## Aanvullende bronnen

### Microsoft-documentatie
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Voorbeeldsjablonen
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community bronnen
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Afrondingspunt

Gefeliciteerd! Je hebt de AI Workshop Lab voltooid. Je zou nu in staat moeten zijn om:

- ✅ Uitleggen hoe een bestaande AI-toepassing aan een AZD-sjabloon wordt aangepast
- ✅ Een AI-referentieapplicatie implementeren en testen
- ✅ Beveiligingsbest practices implementeren voor AI-workloads
- ✅ AI-applicatieprestaties monitoren en optimaliseren
- ✅ Veelvoorkomende implementatieproblemen oplossen

**Opruimen:** Voer `azd env list` uit, selecteer elke wegwerpomgeving die in deze lab is gemaakt (`myai-workshop`, en als geïmplementeerd `myai-production`/`myai-quota-test`), en voer `azd down` in elk uit. Bekijk het verwijderplan; het verwijderen van alleen de lokale configuratie van een omgeving verwijdert geen Azure-resources. Vermijd `--purge` tenzij je de onomkeerbare verwijdering van soft-deleted resources begrijpt.

### Volgende stappen
1. Pas deze patronen toe op je eigen AI-projecten
2. Draag sjablonen terug aan de community bij
3. Word lid van de Microsoft Foundry Discord voor voortdurende ondersteuning
4. Verken geavanceerde onderwerpen zoals multi-region implementaties

---

**Workshop feedback**: Help ons deze workshop te verbeteren door je ervaring te delen in het [Microsoft Foundry Discord #Azure-kanaal](https://discord.gg/microsoft-azure).

---

**Hoofdstuknavigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 2 - AI-First Development
- **⬅️ Vorige**: [AI Model Implementatie](ai-model-deployment.md)
- **➡️ Volgende**: [Productie AI Best Practices](../chapter-08-production/production-ai-practices.md)
- **🚀 Volgend hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

**Hulp nodig?** Word lid van onze community voor ondersteuning en discussies over AZD en AI-implementaties.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:19:28+00:00",
  "source_file": "examples/README.md",
  "language_code": "nl"
}
-->
# Voorbeelden - Praktische AZD-sjablonen en configuraties

## Introductie

Deze map bevat praktische voorbeelden, sjablonen en realistische scenario's om je te helpen Azure Developer CLI te leren door middel van hands-on oefeningen. Elk voorbeeld biedt volledige werkende code, infrastructuursjablonen en gedetailleerde instructies voor verschillende applicatiearchitecturen en implementatiepatronen.

## Leerdoelen

Door deze voorbeelden te doorlopen, leer je:
- Azure Developer CLI-workflows oefenen met realistische applicatiescenario's
- Verschillende applicatiearchitecturen begrijpen en hun azd-implementaties
- Beheersen van Infrastructure as Code-patronen voor diverse Azure-services
- Configuratiemanagement en omgevingsspecifieke implementatiestrategieën toepassen
- Monitoring-, beveiligings- en schaalpatronen implementeren in praktische contexten
- Ervaring opdoen met het oplossen van problemen en debuggen van echte implementatiescenario's

## Leerresultaten

Na het voltooien van deze voorbeelden kun je:
- Verschillende soorten applicaties met vertrouwen implementeren met Azure Developer CLI
- De meegeleverde sjablonen aanpassen aan je eigen applicatievereisten
- Eigen infrastructuurpatronen ontwerpen en implementeren met Bicep
- Complexe multi-service applicaties configureren met de juiste afhankelijkheden
- Beveiligings-, monitoring- en prestatiebest practices toepassen in echte scenario's
- Implementaties oplossen en optimaliseren op basis van praktische ervaring

## Mapstructuur

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Snelle Start Voorbeelden

### Voor Beginners
1. **[Eenvoudige Webapp](../../../examples/simple-web-app)** - Implementeer een basis Node.js-webapplicatie
2. **[Statische Website](../../../examples/static-website)** - Host een statische website op Azure Storage
3. **[Container App](../../../examples/container-app)** - Implementeer een containerized applicatie

### Voor Gevorderden
4. **[Database App](../../../examples/database-app)** - Webapplicatie met PostgreSQL-database
5. **[Serverloze Functie](../../../examples/serverless-function)** - Azure Functions met HTTP-triggers
6. **[Microservices](../../../examples/microservices)** - Multi-service applicatie met API-gateway

## 📋 Gebruiksinstructies

### Voorbeelden Lokaal Uitvoeren

1. **Clone of Kopieer Voorbeeld**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Initialiseer AZD-omgeving**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Configureer Omgeving**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Implementeer**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Voorbeelden Aanpassen

Elk voorbeeld bevat:
- **README.md** - Gedetailleerde setup- en aanpassingsinstructies
- **azure.yaml** - AZD-configuratie met opmerkingen
- **infra/** - Bicep-sjablonen met parameteruitleg
- **src/** - Voorbeeldapplicatiecode
- **scripts/** - Hulpscripts voor veelvoorkomende taken

## 🎯 Leerdoelen

### Voorbeeldcategorieën

#### **Basisimplementaties**
- Applicaties met één service
- Eenvoudige infrastructuurpatronen
- Basisconfiguratiemanagement
- Kostenbesparende ontwikkelomgevingen

#### **Geavanceerde Scenario's**
- Multi-service architecturen
- Complexe netwerkconfiguraties
- Database-integratiepatronen
- Beveiligings- en compliance-implementaties

#### **Productieklaar**
- Configuraties voor hoge beschikbaarheid
- Monitoring en observatie
- CI/CD-integratie
- Herstelstrategieën bij rampen

## 📖 Voorbeeldbeschrijvingen

### Eenvoudige Webapp
**Technologieën**: Node.js, App Service, Application Insights  
**Complexiteit**: Beginner  
**Concepten**: Basisimplementatie, omgevingsvariabelen, gezondheidscontroles

### Statische Website
**Technologieën**: HTML/CSS/JS, Storage Account, CDN  
**Complexiteit**: Beginner  
**Concepten**: Statische hosting, CDN-integratie, aangepaste domeinen

### Container App
**Technologieën**: Docker, Container Apps, Container Registry  
**Complexiteit**: Gevorderd  
**Concepten**: Containerisatie, schaalbaarheid, ingress-configuratie

### Database App
**Technologieën**: Python Flask, PostgreSQL, App Service  
**Complexiteit**: Gevorderd  
**Concepten**: Databaseverbindingen, geheimenbeheer, migraties

### Serverloze Functie
**Technologieën**: Azure Functions, Cosmos DB, API Management  
**Complexiteit**: Gevorderd  
**Concepten**: Event-driven architectuur, bindings, API-beheer

### Microservices
**Technologieën**: Meerdere services, Service Bus, API Gateway  
**Complexiteit**: Geavanceerd  
**Concepten**: Servicecommunicatie, berichtwachtrijen, load balancing

## 🛠 Configuratievoorbeelden

De map `configurations/` bevat herbruikbare componenten:

### Omgevingsconfiguraties
- Instellingen voor ontwikkelomgevingen
- Configuraties voor staging-omgevingen
- Productieklare configuraties
- Multi-regio implementaties

### Bicep Modules
- Herbruikbare infrastructuurcomponenten
- Veelvoorkomende resourcepatronen
- Beveiligingsgeharde sjablonen
- Kosten geoptimaliseerde configuraties

### Hulpscripts
- Automatisering van omgevingsinstellingen
- Database-migratiescripts
- Validatietools voor implementatie
- Kostenbewakingshulpmiddelen

## 🔧 Aanpassingsgids

### Voorbeelden Aanpassen aan Jouw Gebruikssituatie

1. **Controleer Vereisten**
   - Controleer Azure-servicevereisten
   - Verifieer abonnementslimieten
   - Begrijp kostenimplicaties

2. **Wijzig Configuratie**
   - Werk `azure.yaml`-servicedefinities bij
   - Pas Bicep-sjablonen aan
   - Stel omgevingsvariabelen in

3. **Test Grondig**
   - Implementeer eerst in ontwikkelomgeving
   - Valideer functionaliteit
   - Test schaalbaarheid en prestaties

4. **Beveiligingscontrole**
   - Controleer toegangsbeheer
   - Implementeer geheimenbeheer
   - Schakel monitoring en waarschuwingen in

## 📊 Vergelijkingsmatrix

| Voorbeeld | Services | Database | Auth | Monitoring | Complexiteit |
|-----------|----------|----------|------|------------|--------------|
| Eenvoudige Webapp | 1 | ❌ | Basis | Basis | ⭐ |
| Statische Website | 1 | ❌ | ❌ | Basis | ⭐ |
| Container App | 1 | ❌ | Basis | Volledig | ⭐⭐ |
| Database App | 2 | ✅ | Volledig | Volledig | ⭐⭐⭐ |
| Serverloze Functie | 3 | ✅ | Volledig | Volledig | ⭐⭐⭐ |
| Microservices | 5+ | ✅ | Volledig | Volledig | ⭐⭐⭐⭐ |

## 🎓 Leerpad

### Aanbevolen Volgorde

1. **Begin met Eenvoudige Webapp**
   - Leer basisconcepten van AZD
   - Begrijp implementatieworkflow
   - Oefen omgevingsbeheer

2. **Probeer Statische Website**
   - Verken verschillende hostingopties
   - Leer over CDN-integratie
   - Begrijp DNS-configuratie

3. **Ga verder met Container App**
   - Leer basisprincipes van containerisatie
   - Begrijp schaalconcepten
   - Oefen met Docker

4. **Voeg Database-integratie toe**
   - Leer databasevoorziening
   - Begrijp verbindingsstrings
   - Oefen geheimenbeheer

5. **Verken Serverloze Functies**
   - Begrijp event-driven architectuur
   - Leer over triggers en bindings
   - Oefen met API's

6. **Bouw Microservices**
   - Leer servicecommunicatie
   - Begrijp gedistribueerde systemen
   - Oefen complexe implementaties

## 🔍 Het Juiste Voorbeeld Vinden

### Op Technologie Stack
- **Node.js**: Eenvoudige Webapp, Microservices
- **Python**: Database App, Serverloze Functie
- **Statische Sites**: Statische Website
- **Containers**: Container App, Microservices
- **Databases**: Database App, Serverloze Functie

### Op Architectuurpatroon
- **Monolithisch**: Eenvoudige Webapp, Database App
- **Statisch**: Statische Website
- **Microservices**: Microservices voorbeeld
- **Serverloos**: Serverloze Functie
- **Hybride**: Container App

### Op Complexiteitsniveau
- **Beginner**: Eenvoudige Webapp, Statische Website
- **Gevorderd**: Container App, Database App, Serverloze Functie  
- **Geavanceerd**: Microservices

## 📚 Aanvullende Bronnen

### Documentatielinks
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentatie](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architectuurcentrum](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Voorbeelden
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)

### Best Practices
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Voorbeelden Bijdragen

Heb je een nuttig voorbeeld om te delen? We verwelkomen bijdragen!

### Richtlijnen voor Indienen
1. Volg de vastgestelde mapstructuur
2. Voeg een uitgebreide README.md toe
3. Voeg opmerkingen toe aan configuratiebestanden
4. Test grondig voordat je indient
5. Voeg kostenramingen en vereisten toe

### Voorbeeld Sjabloonstructuur
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Pro Tip**: Begin met het eenvoudigste voorbeeld dat past bij jouw technologie stack en werk geleidelijk naar complexere scenario's toe. Elk voorbeeld bouwt voort op concepten van de vorige!

**Volgende Stappen**: 
- Kies een voorbeeld dat past bij jouw vaardigheidsniveau
- Volg de setup-instructies in de README van het voorbeeld
- Experimenteer met aanpassingen
- Deel je ervaringen met de community

---

**Navigatie**
- **Vorige Les**: [Studiegids](../resources/study-guide.md)
- **Terug naar**: [Hoofd README](../README.md)

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we ons best doen om nauwkeurigheid te garanderen, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in zijn oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9b7074c8a39e77d2f10fb08b3c6ce34f",
  "translation_date": "2025-09-09T22:12:10+00:00",
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
- Verschillende applicatietypen met vertrouwen implementeren met Azure Developer CLI
- De aangeboden sjablonen aanpassen aan je eigen applicatievereisten
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

## Snelstartvoorbeelden

### Voor beginners
1. **[Eenvoudige webapp](../../../examples/simple-web-app)** - Implementeer een basis Node.js-webapplicatie
2. **[Statische website](../../../examples/static-website)** - Host een statische website op Azure Storage
3. **[Container-app](../../../examples/container-app)** - Implementeer een containerized applicatie

### Voor gevorderde gebruikers
4. **[Database-app](../../../examples/database-app)** - Webapplicatie met PostgreSQL-database
5. **[Serverloze functie](../../../examples/serverless-function)** - Azure Functions met HTTP-triggers
6. **[Microservices](../../../examples/microservices)** - Multi-service applicatie met API-gateway

## 📋 Gebruiksaanwijzing

### Voorbeelden lokaal uitvoeren

1. **Clone of kopieer voorbeeld**
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

3. **Configureer omgeving**
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

### Voorbeelden aanpassen

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

#### **Geavanceerde scenario's**
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

### Eenvoudige webapp
**Technologieën**: Node.js, App Service, Application Insights  
**Complexiteit**: Beginner  
**Concepten**: Basisimplementatie, omgevingsvariabelen, gezondheidscontroles

### Statische website
**Technologieën**: HTML/CSS/JS, Storage Account, CDN  
**Complexiteit**: Beginner  
**Concepten**: Statische hosting, CDN-integratie, aangepaste domeinen

### Container-app
**Technologieën**: Docker, Container Apps, Container Registry  
**Complexiteit**: Gemiddeld  
**Concepten**: Containerisatie, schaalbaarheid, ingress-configuratie

### Database-app
**Technologieën**: Python Flask, PostgreSQL, App Service  
**Complexiteit**: Gemiddeld  
**Concepten**: Databaseverbindingen, geheimenbeheer, migraties

### Serverloze functie
**Technologieën**: Azure Functions, Cosmos DB, API Management  
**Complexiteit**: Gemiddeld  
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

### Bicep-modules
- Herbruikbare infrastructuurcomponenten
- Veelvoorkomende resourcepatronen
- Beveiligingsversterkte sjablonen
- Kosten geoptimaliseerde configuraties

### Hulpscripts
- Automatisering van omgevingsinstellingen
- Scripts voor database-migratie
- Tools voor validatie van implementaties
- Hulpmiddelen voor kostenmonitoring

## 🔧 Aanpassingsgids

### Voorbeelden aanpassen aan jouw gebruikssituatie

1. **Controleer vereisten**
   - Controleer Azure-servicevereisten
   - Verifieer abonnementslimieten
   - Begrijp kostenimplicaties

2. **Wijzig configuratie**
   - Werk `azure.yaml`-servicedefinities bij
   - Pas Bicep-sjablonen aan
   - Stel omgevingsvariabelen in

3. **Test grondig**
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
| Eenvoudige webapp | 1 | ❌ | Basis | Basis | ⭐ |
| Statische website | 1 | ❌ | ❌ | Basis | ⭐ |
| Container-app | 1 | ❌ | Basis | Volledig | ⭐⭐ |
| Database-app | 2 | ✅ | Volledig | Volledig | ⭐⭐⭐ |
| Serverloze functie | 3 | ✅ | Volledig | Volledig | ⭐⭐⭐ |
| Microservices | 5+ | ✅ | Volledig | Volledig | ⭐⭐⭐⭐ |

## 🎓 Leerpad

### Aanbevolen volgorde

1. **Begin met Eenvoudige webapp**
   - Leer basisconcepten van AZD
   - Begrijp implementatieworkflow
   - Oefen omgevingsbeheer

2. **Probeer Statische website**
   - Verken verschillende hostingopties
   - Leer over CDN-integratie
   - Begrijp DNS-configuratie

3. **Ga verder met Container-app**
   - Leer basisprincipes van containerisatie
   - Begrijp schaalconcepten
   - Oefen met Docker

4. **Voeg database-integratie toe**
   - Leer databasevoorziening
   - Begrijp verbindingsstrings
   - Oefen geheimenbeheer

5. **Verken Serverloze functies**
   - Begrijp event-driven architectuur
   - Leer over triggers en bindings
   - Oefen met API's

6. **Bouw Microservices**
   - Leer servicecommunicatie
   - Begrijp gedistribueerde systemen
   - Oefen complexe implementaties

## 🔍 Het juiste voorbeeld vinden

### Op technologie-stack
- **Node.js**: Eenvoudige webapp, Microservices
- **Python**: Database-app, Serverloze functie
- **Statische sites**: Statische website
- **Containers**: Container-app, Microservices
- **Databases**: Database-app, Serverloze functie

### Op architectuurpatroon
- **Monolithisch**: Eenvoudige webapp, Database-app
- **Statisch**: Statische website
- **Microservices**: Microservices-voorbeeld
- **Serverloos**: Serverloze functie
- **Hybride**: Container-app

### Op complexiteitsniveau
- **Beginner**: Eenvoudige webapp, Statische website
- **Gemiddeld**: Container-app, Database-app, Serverloze functie  
- **Geavanceerd**: Microservices

## 📚 Aanvullende bronnen

### Documentatielinks
- [AZD-sjabloonspecificatie](https://aka.ms/azd/templates)
- [Bicep-documentatie](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architectuurcentrum](https://learn.microsoft.com/en-us/azure/architecture/)

### Communityvoorbeelden
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)

### Best practices
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Voorbeelden bijdragen

Heb je een nuttig voorbeeld om te delen? We verwelkomen bijdragen!

### Richtlijnen voor inzending
1. Volg de vastgestelde mapstructuur
2. Voeg een uitgebreide README.md toe
3. Voeg opmerkingen toe aan configuratiebestanden
4. Test grondig voordat je indient
5. Voeg kostenramingen en vereisten toe

### Voorbeeldsjabloonstructuur
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

**Pro Tip**: Begin met het eenvoudigste voorbeeld dat past bij jouw technologie-stack en werk geleidelijk door naar complexere scenario's. Elk voorbeeld bouwt voort op concepten van de vorige!

**Volgende stappen**: 
- Kies een voorbeeld dat past bij jouw vaardigheidsniveau
- Volg de setup-instructies in de README van het voorbeeld
- Experimenteer met aanpassingen
- Deel je ervaringen met de community

---

**Navigatie**
- **Vorige les**: [Studiegids](../resources/study-guide.md)
- **Terug naar**: [Hoofd README](../README.md)

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in zijn oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
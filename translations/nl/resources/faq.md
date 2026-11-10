# Veelgestelde Vragen (FAQ)

**Hulp per hoofdstuk**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../README.md)
- **🚆 Installatieproblemen**: [Hoofdstuk 1: Installatie & Setup](../docs/chapter-01-foundation/installation.md)
- **🤖 AI Vragen**: [Hoofdstuk 2: AI-First Ontwikkeling](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Probleemoplossing**: [Hoofdstuk 7: Probleemoplossing & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Introductie

Deze uitgebreide FAQ biedt antwoorden op de meest voorkomende vragen over Azure Developer CLI (azd) en Azure-implementaties. Vind snelle oplossingen voor veelvoorkomende problemen, begrijp best practices en krijg verduidelijking over azd-concepten en workflows.

## Leerdoelen

Door deze FAQ te bekijken, zul je:
- Snelle antwoorden vinden op veelvoorkomende Azure Developer CLI vragen en problemen
- Belangrijke concepten en terminologie begrijpen via praktische Q&A-vorm
- Toegang krijgen tot probleemoplossingsoplossingen voor veelvoorkomende problemen en foutscenario's
- Best practices leren via veelgestelde vragen over optimalisatie
- Geavanceerde functies en mogelijkheden ontdekken via vragen op expertsniveau
- Efficiënt verwijzen naar kosten-, beveiligings- en implementatiestrategieën

## Leerresultaten

Door regelmatig naar deze FAQ te verwijzen, zul je in staat zijn om:
- Veelvoorkomende Azure Developer CLI-problemen zelfstandig op te lossen met behulp van gegeven oplossingen
- Weloverwogen beslissingen te nemen over implementatiestrategieën en configuraties
- De relatie tussen azd en andere Azure-tools en -diensten te begrijpen
- Best practices toe te passen op basis van gemeenschaps-ervaring en expert-aanbevelingen
- Authenticatie-, implementatie- en configuratieproblemen effectief te troubleshooten
- Kosten en prestaties te optimaliseren met behulp van inzichten en aanbevelingen in de FAQ

## Inhoudsopgave

- [Aan de slag](#getting-started)
- [Authenticatie & Toegang](#authentication--access)
- [Sjablonen & Projecten](#templates--projects)
- [Implementatie & Infrastructuur](#deployment--infrastructure)
- [Configuratie & Omgevingen](#configuration--environments)
- [Probleemoplossing](#troubleshooting)
- [Kosten & Facturatie](#cost--billing)
- [Best Practices](#best-practices)
- [Geavanceerde Onderwerpen](#advanced-topics)

---

## Aan de slag

### V: Wat is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) is een ontwikkelaarsgerichte commandoregeltool die de tijd versnelt om je applicatie van de lokale ontwikkelomgeving naar Azure te brengen. Het biedt best practices via sjablonen en helpt met de volledige levenscyclus van implementatie.

### V: Hoe verschilt azd van Azure CLI?
**A**: 
- **Azure CLI**: Algemeen hulpmiddel voor het beheren van Azure-resources
- **azd**: Ontwikkelaarsgerichte tool voor applicatie-implementatieworkflows
- azd heeft zijn eigen authenticatie- en implementatieworkflow; Azure CLI is een aparte, aanvullende tool
- azd bevat sjablonen, omgevingsbeheer en implementatie-automatisering

### V: Moet ik Azure CLI geïnstalleerd hebben om azd te gebruiken?
**A**: Niet voor de kern AZD-workflow. Authenticatie met `azd auth login`. Installeer Azure CLI afzonderlijk wanneer een sjabloon-hook of een oefening expliciet `az` commando’s uitvoert.

### V: Welke programmeertalen ondersteunt azd?
**A**: azd is taalonafhankelijk. Het werkt met:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statische websites
- Containerized applicaties

### V: Kan ik azd gebruiken met bestaande projecten?
**A**: Ja! Je kunt:
1. `azd init` gebruiken om azd-configuratie toe te voegen aan bestaande projecten
2. Bestaande projecten aanpassen om aan te sluiten bij de azd-sjabloonstructuur
3. Aangepaste sjablonen maken op basis van je bestaande architectuur

---

## Authenticatie & Toegang

### V: Hoe authenticiseer ik mij bij Azure met azd?
**A**: Gebruik `azd auth login`, dat een browservenster opent voor Azure-authenticatie. Voor CI/CD-scenario’s, gebruik service principal accounts of beheerde identiteiten.

### V: Kan ik azd gebruiken met meerdere Azure-abonnementen?
**A**: Ja. Gebruik `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` om te specificeren welk abonnement te gebruiken voor elke omgeving.

### V: Welke machtigingen heb ik nodig om te implementeren met azd?
**A**: Gewoonlijk heb je nodig:
- De rol **Contributor** op de resourcegroep of het abonnement
- De rol **User Access Administrator** als je resources implementeert die roltoewijzingen vereisen
- Specifieke machtigingen verschillen per sjabloon en de resources die worden ingezet

### V: Kan ik azd gebruiken in CI/CD-pijplijnen?
**A**: Absoluut! azd is ontworpen voor integratie in CI/CD. Gebruik service principals voor authenticatie en stel omgevingsvariabelen in voor configuratie.

### V: Hoe ga ik om met authenticatie in GitHub Actions?
**A**: Geef de voorkeur aan workload identity federation (OIDC), geconfigureerd met `azd pipeline config`. De gegenereerde workflow installeert AZD en authenticatieert AZD direct met een gefedereerde identiteit. Een `azure/login` stap alleen stelt geen AZD-login in. Een loginstap binnen een bestaande taak is:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Voorzie of implementeer na inloggen, met de bedoelde AZD-omgeving, het abonnement en de locatie geconfigureerd. De gefedereerde referentie van de identiteit moet het repository/ref of GitHub-omgeving van de workflow vertrouwen en zijn Azure-rollen moeten de gevraagde bewerkingen toestaan.

---

## Sjablonen & Projecten

### V: Waar vind ik azd-sjablonen?
**A**: 
- Officiële en communitysjablonen: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Communitysjablonen: GitHub-zoekopdracht voor "azd-template"
- Gebruik `azd template list` om beschikbare sjablonen te bekijken

### V: Hoe maak ik een aangepaste sjabloon?
**A**: 
1. Begin met een bestaande sjabloonstructuur
2. Pas `azure.yaml`, infrastructuurbestanden en applicatiecode aan
3. Test grondig met `azd up`
4. Publiceer op GitHub met geschikte tags

### V: Kan ik azd gebruiken zonder sjabloon?
**A**: Ja, gebruik `azd init` in een bestaand project om de benodigde configuratiebestanden aan te maken. Je moet handmatig `azure.yaml` en infrastructuurbestanden configureren.

### V: Wat is het verschil tussen officiële en communitysjablonen?
**A**: 
- **Officiële sjablonen**: Worden onderhouden door Microsoft, regelmatig bijgewerkt, uitgebreide documentatie
- **Community sjablonen**: Gemaakt door ontwikkelaars, kunnen gespecialiseerde gebruikssituaties hebben, wisselende kwaliteit en onderhoud

### V: Hoe update ik een sjabloon in mijn project?
**A**: Sjablonen worden niet automatisch bijgewerkt. Je kunt:
1. Handmatig wijzigingen vergelijken en samenvoegen van de bron-sjabloon
2. Opnieuw beginnen met `azd init` met behulp van de bijgewerkte sjabloon
3. Specifieke verbeteringen uit bijgewerkte sjablonen selectief toepassen

---

## Implementatie & Infrastructuur

### V: Welke Azure-diensten kan azd implementeren?
**A**: azd kan elke Azure-dienst implementeren via Bicep/ARM-sjablonen, inclusief:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Netwerk-, beveiligings- en monitoringresources

### V: Kan ik naar meerdere regio’s implementeren?
**A**: Ja, configureer meerdere regio’s in je Bicep-sjablonen en stel de locatieparameter voor elke omgeving passend in.

### V: Hoe ga ik om met database-schema-migraties?
**A**: Gebruik implementatiehooks in `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### V: Kan ik alleen infrastructuur implementeren zonder applicaties?
**A**: Ja, gebruik `azd provision` om alleen de infrastructuurcomponenten te implementeren die in je sjablonen zijn gedefinieerd.

### V: Hoe implementeer ik naar bestaande Azure-resources?
**A**: Ja, wanneer het sjabloon dit ondersteund. Verwijs naar bestaande resources met Bicep’s `existing` declaraties of de gedocumenteerde bestaande-resource parameters van het sjabloon, en koppel applicatiediensten aan hun bedoelde doelen. Dit importeert geen eigendom of maakt automatisch ontbrekende machtigingen aan. Review het sjabloon voordat je implementeert.

### V: Kan ik Terraform gebruiken in plaats van Bicep?
**A**: Ja. AZD ondersteunt zowel Terraform als Bicep. Kies een Terraform-gebaseerde sjabloon of configureer `infra.provider: terraform` in `azure.yaml`, met geschikte Terraform-bestanden en state/backend-configuratie. Zie de [Terraform workflow](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Configuratie & Omgevingen

### V: Hoe beheer ik verschillende omgevingen (dev, staging, prod)?
**A**: Maak aparte omgevingen met `azd env new <environment-name>` en configureer verschillende instellingen voor elk:
```bash
azd env new development
azd env new staging  
azd env new production
```

### V: Waar worden omgevingsconfiguraties opgeslagen?
**A**: In de `.azure` map binnen je projectdirectory. Elke omgeving heeft een eigen map met configuratiebestanden.

### V: Hoe stel ik omgevingsspecifieke configuratie in?
**A**: Gebruik `azd env set` om omgevingsvariabelen te configureren:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### V: Kan ik omgevingsconfiguraties delen met teamleden?
**A**: De `.azure` map bevat gevoelige informatie en mag niet worden gecommit aan versiebeheer. In plaats daarvan:
1. Documenteer vereiste omgevingsvariabelen
2. Gebruik implementatiescripts om omgevingen op te zetten
3. Gebruik Azure Key Vault voor gevoelige configuratie

### V: Hoe overschrijf ik sjabloon-standaarden?
**A**: Stel omgevingsvariabelen in die overeenkomen met sjabloonparameters:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Alleen variabelen die door het sjabloon worden gebruikt, beïnvloeden de implementatie. `SKU_NAME` hierboven is een voorbeeld van aangepaste invoer, niet een universele AZD-instelling.

---

## Probleemoplossing

### V: Waarom faalt `azd up`?
**A**: Veelvoorkomende oorzaken:
1. **Authenticatieproblemen**: Voer `azd auth login` uit
2. **Onvoldoende machtigingen**: Controleer je Azure-roltoewijzingen
3. **Resource naamconflicten**: Review de conflicterende resource en de naamgevingsinvoer van het sjabloon; maak een aparte omgeving met `azd env new` bij isolatiebehoefte
4. **Quota/capaciteitsproblemen**: Controleer regionale beschikbaarheid
5. **Sjabloonfouten**: Valideer Bicep-sjablonen

### V: Hoe debug ik implementatiefouten?
**A**: 
1. Gebruik `azd deploy --debug` voor gedetailleerde uitvoer
2. Controleer implementatiegeschiedenis in Azure-portal
3. Bekijk Activiteitenlogboek in Azure-portal
4. Gebruik `azd show` om de huidige omgevingsstatus weer te geven

### V: Waarom werken mijn omgevingsvariabelen niet?
**A**: Controleer:
1. Variabelenamen exact overeenkomen met sjabloonparameters
2. Waarden correct geciteerd zijn als ze spaties bevatten
3. De juiste omgeving geselecteerd is: `azd env select <environment>`
4. Variabelen zijn ingesteld in de correcte omgeving

### V: Hoe ruim ik mislukte implementaties op?
**A**: 
```bash
azd down
```
 Review eerst de geselecteerde omgeving en verwijderingsbevestiging. Dit verwijdert geprovisioneerde Azure-resources, niet de lokale `.azure` omgevingsconfiguratie. `--purge` vraagt bovendien om permanente verwijdering van ondersteunde soft-deleted resources en kan geblokkeerd worden door retentie-/wismeldingen; het is geen routinematige herstelstap.

### V: Waarom is mijn applicatie niet toegankelijk na implementatie?
**A**: Controleer:
1. De implementatie is succesvol voltooid
2. De applicatie draait (check logs in Azure-portal)
3. Netwerkbeveiligingsgroepen staan verkeer toe
4. DNS/aangepaste domeinen zijn correct geconfigureerd

---

## Kosten & Facturatie

### V: Hoeveel kosten azd-implementaties?
**A**: Kosten hangen af van:
- Welke Azure-diensten worden geïmplementeerd
- Geselecteerde service tiers/SKU’s
- Regionale prijsverschillen
- Gebruikspatronen

Gebruik de [Azure Prijscalculator](https://azure.microsoft.com/pricing/calculator/) voor schattingen.

### V: Hoe beheer ik kosten bij azd-implementaties?
**A**: 
1. Gebruik lagere SKUs voor ontwikkelomgevingen
2. Stel Azure-budgetten en waarschuwingen in
3. Gebruik `azd down` om resources te verwijderen wanneer niet nodig
4. Kies geschikte regio’s (kosten verschillen per locatie)
5. Gebruik Azure Cost Management-tools

### V: Zijn er gratis tiers voor azd-sjablonen?
**A**: Sommige diensten hebben gratis SKUs of maandelijkse tegoeden, afhankelijk van geschiktheid, hostingplan, regio en abonnementslimieten. Dit maakt een heel sjabloon niet gratis: databases, zoeken, netwerken, registry, telemetrie en modelinference kunnen afzonderlijk kosten veroorzaken. Controleer de [Azure gratis dienstenlijst](https://azure.microsoft.com/free/) en actuele prijsinformatie voor elke resource vóór implementatie.

### V: Hoe schat ik kosten vooraf in?
**A**: 
1. Bekijk de `main.bicep` van het sjabloon om te zien welke resources worden gemaakt
2. Gebruik Azure Prijscalculator met specifieke SKUs
3. Implementeer eerst in een ontwikkelomgeving om werkelijke kosten te monitoren
4. Gebruik Azure Cost Management voor gedetailleerde kostenanalyse

---

## Best Practices

### V: Wat zijn de best practices voor azd projectstructuur?
**A**: 
1. Houd applicatiecode gescheiden van infrastructuur
2. Gebruik betekenisvolle servicenames in `azure.yaml`
3. Implementeer goede foutafhandeling in build-scripts
4. Gebruik omgevingsspecifieke configuratie
5. Zorg voor uitgebreide documentatie

### V: Hoe organiseer ik meerdere services in azd?
**A**: Gebruik de aanbevolen structuur:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### V: Moet ik de `.azure` map committen aan versiebeheer?
**A**: **Nee!** De `.azure` map bevat gevoelige informatie. Voeg deze toe aan `.gitignore`:
```gitignore
.azure/
```

### V: Hoe ga ik om met geheimen en gevoelige configuraties?
**A**: 
1. Gebruik Azure Key Vault voor geheimen
2. Verwijs naar Key Vault geheimen in applicatieconfiguratie
3. Sla nooit geheimen op in versiebeheer
4. Gebruik beheerde identiteiten voor service-naar-service authenticatie

### V: Wat is de aanbevolen aanpak voor CI/CD met azd?
**A**: 
1. Gebruik aparte omgevingen voor elke fase (dev/staging/prod)
2. Implementeer geautomatiseerde tests vóór uitrol
3. Gebruik serviceprincipals voor authenticatie
4. Sla gevoelige configuratie op in pipeline geheimen/variabelen
5. Implementeer goedkeuringspoorten voor productie-implementaties

---

## Gevorderde Onderwerpen

### V: Kan ik azd uitbreiden met aangepaste functionaliteit?
**A**: Ja, via deploy hooks in `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### V: Hoe integreer ik azd met bestaande DevOps-processen?
**A**: 
1. Gebruik azd-commando's in bestaande pipeline-scripts
2. Standaardiseer op azd-templates binnen teams
3. Integreer met bestaande monitoring en alerting
4. Gebruik azd's JSON-uitvoer voor pipeline-integratie

### V: Kan ik azd gebruiken met Azure DevOps?
**A**: Ja, azd werkt met elk CI/CD-systeem. Maak Azure DevOps-pipelines die azd-commando's gebruiken.

### V: Hoe draag ik bij aan azd of maak ik community-templates?
**A**: 
1. **azd tool**: Draag bij aan [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templates**: Volg de [Awesome AZD gallery bijdrage-instructies](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentatie**: Draag bij aan docs bij [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### V: Wat is de roadmap voor azd?
**A**: Bekijk de [officiële roadmap](https://github.com/Azure/azure-dev/projects) voor geplande functies en verbeteringen.

### V: Hoe migreer ik van andere deploy-tools naar azd?
**A**: 
1. Analyseer de huidige deploy-architectuur
2. Maak equivalente Bicep-templates
3. Configureer `azure.yaml` om overeen te komen met huidige services
4. Test grondig in ontwikkelomgeving
5. Migreer omgevingen geleidelijk

---

## Nog vragen?

### **Eerst zoeken**
- Bekijk de [officiële documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Zoek in [GitHub issues](https://github.com/Azure/azure-dev/issues) naar vergelijkbare problemen

### **Hulp krijgen**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Community-ondersteuning
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technische vragen
- [Azure Discord](https://discord.gg/azure) - Directe community chat

### **Meld problemen**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Bugrapporten en functieverzoeken
- Voeg relevante logs, foutmeldingen en reproduceerstappen toe

### **Leer meer**
- [Azure Developer CLI documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Technische richtlijnen beoordeeld: 4 november 2026. Cloudbeschikbaarheid en prijzen moeten gecontroleerd worden voor uw abonnement en regio.*

---

**Navigatie**
- **Vorige les**: [Glossarium](glossary.md)
- **Volgende les**: [Studiegids](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Veelgestelde vragen (FAQ)

**Get Help by Chapter**
- **📚 Cursus Startpagina**: [AZD voor beginners](../README.md)
- **🚆 Installatieproblemen**: [Hoofdstuk 1: Installatie & Configuratie](../docs/getting-started/installation.md)
- **🤖 AI Questions**: [Hoofdstuk 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Problemen oplossen**: [Hoofdstuk 7: Problemen oplossen & Debuggen](../docs/troubleshooting/common-issues.md)

## Introductie

Deze uitgebreide FAQ biedt antwoorden op de meest gestelde vragen over Azure Developer CLI (azd) en Azure-implementaties. Vind snelle oplossingen voor veelvoorkomende problemen, begrijp best practices en krijg verduidelijking over azd-concepten en workflows.

## Leerdoelen

Door deze FAQ te bekijken, zal je:
- Snelle antwoorden vinden op veelgestelde vragen en problemen met Azure Developer CLI
- Belangrijke concepten en terminologie begrijpen via een praktische vraag-en-antwoordindeling
- Toegang krijgen tot oplossingen voor veelvoorkomende problemen en foutscenario's
- Best practices leren aan de hand van vaak gestelde vragen over optimalisatie
- Geavanceerde functies en mogelijkheden ontdekken via vragen op expertsniveau
- Efficiënt richtlijnen vinden voor kosten, beveiliging en implementatiestrategie

## Leerresultaten

Met regelmatig gebruik van deze FAQ zul je in staat zijn om:
- Veelvoorkomende Azure Developer CLI-problemen zelfstandig op te lossen met de gegeven oplossingen
- Geïnformeerde beslissingen te nemen over implementatiestrategieën en configuraties
- De relatie tussen azd en andere Azure-tools en -services te begrijpen
- Best practices toe te passen op basis van community-ervaring en deskundige aanbevelingen
- Problemen met authenticatie, implementatie en configuratie effectief te troubleshooten
- Kosten en prestaties te optimaliseren met behulp van inzichten en aanbevelingen uit de FAQ

## Inhoudsopgave

- [Aan de slag](../../../resources)
- [Authenticatie & Toegang](../../../resources)
- [Sjablonen & Projecten](../../../resources)
- [Implementatie & Infrastructuur](../../../resources)
- [Configuratie & Omgevingen](../../../resources)
- [Problemen oplossen](../../../resources)
- [Kosten & Facturering](../../../resources)
- [Best Practices](../../../resources)
- [Geavanceerde onderwerpen](../../../resources)

---

## Getting Started

### Q: What is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) is een door ontwikkelaars gerichte commandoregeltool die de tijd versnelt die nodig is om je applicatie van de lokale ontwikkelomgeving naar Azure te krijgen. Het biedt best practices via sjablonen en helpt bij de hele implementatielevenscyclus.

### Q: How is azd different from Azure CLI?
**A**: 
- **Azure CLI**: Algemene tool voor het beheren van Azure-resources
- **azd**: Op ontwikkelaars gerichte tool voor applicatie-implementatieworkflows
- azd gebruikt Azure CLI intern maar biedt abstracties op hoger niveau voor veelvoorkomende ontwikkelscenario's
- azd bevat sjablonen, omgevingsbeheer en implementatieautomatisering

### Q: Do I need Azure CLI installed to use azd?
**A**: Yes, azd vereist Azure CLI voor authenticatie en sommige bewerkingen. Installeer eerst Azure CLI en installeer daarna azd.

### Q: What programming languages does azd support?
**A**: azd is taalagnostisch. Het werkt met:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statische websites
- Containerapplicaties

### Q: Can I use azd with existing projects?
**A**: Yes! Je kunt ofwel:
1. Gebruik `azd init` om azd-configuratie toe te voegen aan bestaande projecten
2. Bestaande projecten aanpassen zodat ze overeenkomen met de azd-sjabloonstructuur
3. Aangepaste sjablonen maken op basis van je bestaande architectuur

---

## Authentication & Access

### Q: How do I authenticate with Azure using azd?
**A**: Gebruik `azd auth login` dat een browservenster opent voor Azure-authenticatie. Voor CI/CD-scenario's gebruik je service principals of managed identities.

### Q: Can I use azd with multiple Azure subscriptions?
**A**: Yes. Gebruik `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` om aan te geven welke subscription voor elke omgeving gebruikt moet worden.

### Q: What permissions do I need to deploy with azd?
**A**: Gewoonlijk heb je nodig:
- **Contributor**-rol op de resourcegroep of subscription
- **User Access Administrator** als je resources implementeert die roltoewijzingen vereisen
- Specifieke machtigingen variëren per sjabloon en te implementeren resources

### Q: Can I use azd in CI/CD pipelines?
**A**: Absoluut! azd is ontworpen voor CI/CD-integratie. Gebruik service principals voor authenticatie en stel omgevingsvariabelen in voor configuratie.

### Q: How do I handle authentication in GitHub Actions?
**A**: Gebruik de Azure Login action met service principal-gegevens:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### Q: Where can I find azd templates?
**A**: 
- Officiële sjablonen: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Community-sjablonen: Zoek op GitHub naar "azd-template"
- Gebruik `azd template list` om beschikbare sjablonen te bekijken

### Q: How do I create a custom template?
**A**: 
1. Begin met een bestaande sjabloonstructuur
2. Wijzig `azure.yaml`, infrastructuurbestanden en applicatiecode
3. Test grondig met `azd up`
4. Publiceer naar GitHub met geschikte tags

### Q: Can I use azd without a template?
**A**: Yes, gebruik `azd init` in een bestaand project om de benodigde configuratiebestanden te maken. Je moet `azure.yaml` en infrastructuurbestanden handmatig configureren.

### Q: What's the difference between official and community templates?
**A**: 
- **Officiële sjablonen**: Onderhouden door Microsoft, regelmatig bijgewerkt, uitgebreide documentatie
- **Community-sjablonen**: Gemaakt door ontwikkelaars, kunnen gespecialiseerde use-cases hebben, variërende kwaliteit en onderhoud

### Q: How do I update a template in my project?
**A**: Sjablonen worden niet automatisch bijgewerkt. Je kunt:
1. Handmatig wijzigingen vergelijken en mergen vanuit het bronsjabloon
2. Opnieuw beginnen met `azd init` met het bijgewerkte sjabloon
3. Specifieke verbeteringen cherry-picken uit bijgewerkte sjablonen

---

## Deployment & Infrastructure

### Q: What Azure services can azd deploy?
**A**: azd kan elke Azure-service implementeren via Bicep/ARM-sjablonen, waaronder:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Netwerk-, beveiligings- en monitorresources

### Q: Can I deploy to multiple regions?
**A**: Yes, configureer meerdere regio's in je Bicep-sjablonen en stel de location-parameter naar behoren in voor elke omgeving.

### Q: How do I handle database schema migrations?
**A**: Gebruik deployment hooks in `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Can I deploy only infrastructure without applications?
**A**: Yes, gebruik `azd provision` om alleen de infrastructuurcomponenten te implementeren die in je sjablonen zijn gedefinieerd.

### Q: How do I deploy to existing Azure resources?
**A**: Dit is complex en niet direct ondersteund. Je kunt:
1. Bestaande resources importeren in je Bicep-sjablonen
2. Referenties naar bestaande resources gebruiken in sjablonen
3. Sjablonen aanpassen om resources voorwaardelijk te maken of te refereren

### Q: Can I use Terraform instead of Bicep?
**A**: Op dit moment ondersteunt azd voornamelijk Bicep/ARM-sjablonen. Terraform-ondersteuning is niet officieel beschikbaar, hoewel er mogelijk communityoplossingen bestaan.

---

## Configuration & Environments

### Q: How do I manage different environments (dev, staging, prod)?
**A**: Maak afzonderlijke omgevingen met `azd env new <environment-name>` en configureer verschillende instellingen voor elk:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where are environment configurations stored?
**A**: In de `.azure` map binnen je projectdirectory. Elke omgeving heeft zijn eigen map met configuratiebestanden.

### Q: How do I set environment-specific configuration?
**A**: Gebruik `azd env set` om omgevingsvariabelen in te stellen:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Can I share environment configurations across team members?
**A**: De `.azure` map bevat gevoelige informatie en moet niet worden gecommit naar versiebeheer. In plaats daarvan:
1. Documenteer vereiste omgevingsvariabelen
2. Gebruik deployment-scripts om omgevingen op te zetten
3. Gebruik Azure Key Vault voor gevoelige configuratie

### Q: How do I override template defaults?
**A**: Stel omgevingsvariabelen in die overeenkomen met sjabloonparameters:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: Why is `azd up` failing?
**A**: Veelvoorkomende oorzaken:
1. **Authenticatieproblemen**: Voer `azd auth login` uit
2. **Onvoldoende machtigingen**: Controleer je Azure-roltoewijzingen
3. **Naamconflicten voor resources**: Wijzig AZURE_ENV_NAME
4. **Quota-/capaciteitsproblemen**: Controleer regionale beschikbaarheid
5. **Sjabloonfouten**: Valideer Bicep-sjablonen

### Q: How do I debug deployment failures?
**A**: 
1. Gebruik `azd deploy --debug` voor uitgebreide uitvoer
2. Controleer de implementatiegeschiedenis in de Azure-portal
3. Bekijk het Activity Log in de Azure-portal
4. Gebruik `azd show` om de huidige omgevingsstatus weer te geven

### Q: Why are my environment variables not working?
**A**: Controleer:
1. Variabelnamen komen exact overeen met sjabloonparameters
2. Waarden zijn correct tussen aanhalingstekens geplaatst als ze spaties bevatten
3. De juiste omgeving is geselecteerd: `azd env select <environment>`
4. Variabelen zijn ingesteld in de correcte omgeving

### Q: How do I clean up failed deployments?
**A**: 
```bash
azd down --force --purge
```
Dit verwijdert alle resources en omgevingsconfiguratie.

### Q: Why is my application not accessible after deployment?
**A**: Controleer:
1. De implementatie is succesvol afgerond
2. De applicatie draait (controleer logs in de Azure-portal)
3. Network security groups staan verkeer toe
4. DNS/custom domains zijn correct geconfigureerd

---

## Cost & Billing

### Q: How much will azd deployments cost?
**A**: Kosten zijn afhankelijk van:
- Ingezette Azure-services
- Geselecteerde service tiers/SKUs
- Regionale prijsverschillen
- Gebruikspatronen

Gebruik de [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) voor schattingen.

### Q: How do I control costs in azd deployments?
**A**: 
1. Gebruik lagere SKUs voor ontwikkelomgevingen
2. Stel Azure-budgetten en waarschuwingen in
3. Gebruik `azd down` om resources te verwijderen wanneer ze niet nodig zijn
4. Kies geschikte regio's (kosten variëren per locatie)
5. Gebruik Azure Cost Management-tools

### Q: Are there free tier options for azd templates?
**A**: Veel Azure-services bieden gratis tiers:
- App Service: Gratis tier beschikbaar
- Azure Functions: 1M gratis executies/maand
- Cosmos DB: Gratis tier met 400 RU/s
- Application Insights: Eerste 5GB/maand gratis

Configureer sjablonen om waar mogelijk gratis tiers te gebruiken.

### Q: How do I estimate costs before deployment?
**A**: 
1. Bekijk de `main.bicep` van het sjabloon om te zien welke resources worden aangemaakt
2. Gebruik de Azure Pricing Calculator met specifieke SKUs
3. Implementeer eerst in een ontwikkelomgeving om werkelijke kosten te monitoren
4. Gebruik Azure Cost Management voor gedetailleerde kostenanalyse

---

## Best Practices

### Q: What are the best practices for azd project structure?
**A**: 
1. Houd applicatiecode gescheiden van infrastructuur
2. Gebruik betekenisvolle servicenames in `azure.yaml`
3. Implementeer juiste foutafhandeling in build-scripts
4. Gebruik omgevingsspecifieke configuratie
5. Voeg uitgebreide documentatie toe

### Q: How should I organize multiple services in azd?
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

### Q: Should I commit the `.azure` folder to version control?
**A**: **No!** De `.azure` map bevat gevoelige informatie. Voeg deze toe aan `.gitignore`:
```gitignore
.azure/
```

### Q: How do I handle secrets and sensitive configuration?
**A**: 
1. Gebruik Azure Key Vault voor secrets
2. Verwijs naar Key Vault-secrets in applicatieconfiguratie
3. Commit nooit secrets naar versiebeheer
4. Gebruik managed identities voor service-to-service authenticatie

### Q: What's the recommended approach for CI/CD with azd?
**A**: 
1. Gebruik aparte omgevingen voor elke fase (dev/staging/prod)
2. Implementeer geautomatiseerde tests vóór implementatie
3. Gebruik service principals voor authenticatie
4. Sla gevoelige configuratie op in pipeline secrets/variabelen
5. Implementeer goedkeuringspoorten voor productie-implementaties

---

## Advanced Topics

### Q: Can I extend azd with custom functionality?
**A**: Yes, via deployment hooks in `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How do I integrate azd with existing DevOps processes?
**A**: 
1. Gebruik azd-commando's in bestaande pipeline-scripts
2. Standaardiseer op azd-sjablonen binnen teams
3. Integreer met bestaande monitoring en alerting
4. Gebruik de JSON-uitvoer van azd voor pipeline-integratie

### Q: Can I use azd with Azure DevOps?
**A**: Yes, azd werkt met elk CI/CD-systeem. Maak Azure DevOps-pipelines die azd-commando's gebruiken.

### Q: How do I contribute to azd or create community templates?
**A**:
1. **azd tool**: Draag bij aan [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Sjablonen**: Maak sjablonen volgens de [sjabloonrichtlijnen](https://github.com/Azure-Samples/awesome-azd)
3. **Documentatie**: Draag bij aan de documentatie bij [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### V: Wat is de roadmap voor azd?
**A**: Bekijk de [officiële roadmap](https://github.com/Azure/azure-dev/projects) voor geplande functies en verbeteringen.

### V: Hoe migreer ik van andere implementatietools naar azd?
**A**: 
1. Analyseer de huidige implementatiearchitectuur
2. Maak gelijkwaardige Bicep-sjablonen
3. Configureer `azure.yaml` zodat het overeenkomt met de huidige diensten
4. Test grondig in de ontwikkelomgeving
5. Migreer omgevingen geleidelijk

---

## Heb je nog vragen?

### **Eerst zoeken**
- Bekijk de [officiële documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Doorzoek [GitHub issues](https://github.com/Azure/azure-dev/issues) naar vergelijkbare problemen

### **Hulp**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Ondersteuning door de community
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technische vragen
- [Azure Discord](https://discord.gg/azure) - Realtime communitychat

### **Meld problemen**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Bugmeldingen en functieverzoeken
- Voeg relevante logs, foutmeldingen en stappen om het probleem te reproduceren bij

### **Meer informatie**
- Documentatie van Azure Developer CLI: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure Architectuurcentrum: https://learn.microsoft.com/en-us/azure/architecture/
- Azure Well-Architected Framework: https://learn.microsoft.com/en-us/azure/well-architected/

---

*Deze FAQ wordt regelmatig bijgewerkt. Laatst bijgewerkt: 9 september 2025*

---

**Navigatie**
- **Vorige les**: [Woordenlijst](glossary.md)
- **Volgende les**: [Studiegids](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel wij streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of onjuiste interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
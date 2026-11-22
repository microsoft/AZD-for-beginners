# Veelgestelde Vragen (FAQ)

**Hulp per Hoofdstuk**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../README.md)
- **🚆 Installatieproblemen**: [Hoofdstuk 1: Installatie & Setup](../docs/chapter-01-foundation/installation.md)
- **🤖 AI Vragen**: [Hoofdstuk 2: AI-First Ontwikkeling](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Problemen Oplossen**: [Hoofdstuk 7: Problemen Oplossen & Debuggen](../docs/chapter-07-troubleshooting/common-issues.md)

## Introductie

Deze uitgebreide FAQ biedt antwoorden op de meest voorkomende vragen over Azure Developer CLI (azd) en Azure-implementaties. Vind snelle oplossingen voor veelvoorkomende problemen, begrijp best practices en krijg duidelijkheid over azd-concepten en workflows.

## Leerdoelen

Door deze FAQ te bekijken, zult u:
- Snelle antwoorden vinden op veelgestelde vragen en problemen met Azure Developer CLI
- Sleutelconcepten en terminologie begrijpen via een praktische vraag-en-antwoordvorm
- Toegang krijgen tot oplossingsrichtingen voor veelvoorkomende problemen en foutscenario's
- Best practices leren via veelgestelde vragen over optimalisatie
- Geavanceerde functies en mogelijkheden ontdekken via vragen op expert-niveau
- Efficiënt raadplegen van begeleiding op het gebied van kosten, beveiliging en implementatiestrategieën

## Leerresultaten

Door regelmatig deze FAQ te raadplegen, zult u in staat zijn om:
- Veelvoorkomende Azure Developer CLI-problemen zelfstandig op te lossen met de geboden oplossingen
- Geïnformeerde beslissingen te nemen over implementatiestrategieën en configuraties
- De relatie tussen azd en andere Azure-tools en -diensten te begrijpen
- Best practices toe te passen op basis van ervaringen uit de gemeenschap en aanbevelingen van experts
- Problemen met authenticatie, implementatie en configuratie effectief op te lossen
- Kosten en prestaties te optimaliseren met inzichten en aanbevelingen uit de FAQ

## Inhoudsopgave

- [Aan de Slag](#getting-started)
- [Authenticatie & Toegang](#authentication--access)
- [Templates & Projecten](#templates--projects)
- [Implementatie & Infrastructuur](#deployment--infrastructure)
- [Configuratie & Omgevingen](#configuration--environments)
- [Problemen Oplossen](#troubleshooting)
- [Kosten & Facturering](#cost--billing)
- [Best Practices](#best-practices)
- [Geavanceerde Onderwerpen](#advanced-topics)

---

## Aan de Slag

### V: Wat is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) is een ontwikkelaargerichte commandoregeltool die de tijd versnelt die het kost om je applicatie van je lokale ontwikkelomgeving naar Azure te krijgen. Het biedt best practices via templates en helpt met de volledige implementatielevenscyclus.

### V: Hoe verschilt azd van Azure CLI?
**A**: 
- **Azure CLI**: Algemeen hulpmiddel voor het beheren van Azure-resources
- **azd**: Tool gericht op ontwikkelaars voor applicatie-implementatieworkflows
- azd heeft zijn eigen authenticatie- en implementatieworkflow; Azure CLI is een apart, complementair hulpmiddel
- azd bevat templates, omgevingsbeheer en automatisering van implementaties

### V: Moet ik Azure CLI geïnstalleerd hebben om azd te gebruiken?
**A**: Niet voor de kern AZD-workflow. Authenticeer met `azd auth login`. Installeer Azure CLI apart wanneer een templatemodule of oefening expliciet `az`-commando's uitvoert.

### V: Welke programmeertalen ondersteunt azd?
**A**: azd is taalonafhankelijk. Het werkt met:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statische websites
- Gecontaineriseerde applicaties

### V: Kan ik azd gebruiken met bestaande projecten?
**A**: Ja! Je kunt:
1. `azd init` gebruiken om azd-configuratie toe te voegen aan bestaande projecten
2. Bestaande projecten aanpassen om te voldoen aan de azd-template-structuur
3. Aangepaste templates maken op basis van je huidige architectuur

### V: Wat is er veranderd met de algemene beschikbaarheid van de Foundry-extensie?
**A**: Het `microsoft.foundry`-pakket bereikte versie 1.0 en GA op 5 november 2026. Met AZD 1.37.0+ gebruik je `azd ext install microsoft.foundry` om zeven kernextensies te installeren voor agents, verbindingen, inspector, projecten, routines, vaardigheden en toolboxes. Dit is geen nieuw commandonamespace en de componenten zijn onafhankelijk geversioneerd. Evaluaties, datasets, fine-tuning en aangepaste modellen worden apart geïnstalleerd; optionele previewfuncties worden niet GA alleen omdat het pakket GA is.

De [hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) gebruikt Python 3.13+ en de huidige uv. `azd ai agent run` opent Agent Inspector lokaal, maar modelaanroepen gebruiken nog steeds Azure en brengen kosten in rekening. Code-modus `azd deploy` uploadt broncode voor een externe build zonder een lokale containerbuild te vereisen.

### V: Verwijdert `azd down` een hosted agent uit een bestaand Foundry-project?
**A**: Niet bij het hergebruikte-projectpad beschreven in de hosted-agent quickstart: het laat het project, hosted agent en andere resources staan. Verwijder ongewenste resources afzonderlijk zonder gedeelde resources te verwijderen. Als de omgeving een nieuw Foundry-project heeft gemaakt, verwijdert `azd down` de resourcegroep en alles daarin. Bekijk de [opschoonrichtlijnen](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) en verwijderingsprompten voordat je bevestigt.

---

## Authenticatie & Toegang

### V: Hoe authenticeer ik met Azure via azd?
**A**: Gebruik `azd auth login` die een browservenster opent voor Azure-authenticatie. Voor CI/CD-scenario's gebruik je serviceprincipals of beheerde identiteiten.

### V: Kan ik azd gebruiken met meerdere Azure-abonnementen?
**A**: Ja. Gebruik `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` om aan te geven welk abonnement voor elke omgeving gebruikt moet worden.

### V: Welke machtigingen heb ik nodig om met azd te implementeren?
**A**: Meestal heb je nodig:
- De rol **Contributor** op de resourcegroep of het abonnement
- **User Access Administrator** bij het implementeren van resources die roltoewijzingen vereisen
- Specifieke machtigingen verschillen per template en te implementeren resources

### V: Kan ik azd gebruiken in CI/CD-pijplijnen?
**A**: Absoluut! azd is ontworpen voor CI/CD-integratie. Gebruik serviceprincipals voor authenticatie en stel omgevingsvariabelen in voor configuratie.

### V: Hoe ga ik om met authenticatie in GitHub Actions?
**A**: Geef de voorkeur aan workload identity federation (OIDC), geconfigureerd met `azd pipeline config`. De gegenereerde workflow installeert AZD en authenticeert AZD rechtstreeks met een gefedereerde identiteit. Een `azure/login`-stap alleen stelt geen AZD-login in. Een loginstap binnen een bestaande job is:
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

Voorzie of implementeer na login, met de bedoelde AZD-omgeving, abonnement en locatie geconfigureerd. De gefedereerde referentie van de identiteit moet het repository/ref of GitHub-omgeving van de workflow vertrouwen, en de Azure-rollen moeten de gevraagde bewerkingen toestaan.

---

## Templates & Projecten

### V: Waar kan ik azd-templates vinden?
**A**: 
- Officiële en community-templates: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Community-templates: zoek op GitHub naar "azd-template"
- Gebruik `azd template list` om beschikbare templates te bekijken

### V: Hoe maak ik een aangepaste template?
**A**: 
1. Begin met een bestaande templatestructuur
2. Pas `azure.yaml`, infrastructuurbestanden en applicatiecode aan
3. Test grondig met `azd up`
4. Publiceer op GitHub met passende tags

### V: Kan ik azd gebruiken zonder template?
**A**: Ja, gebruik `azd init` in een bestaand project om de benodigde configuratiebestanden te creëren. Je moet `azure.yaml` en infrastructuurbestanden handmatig configureren.

### V: Wat is het verschil tussen officiële en community-templates?
**A**: 
- **Officiële templates**: Onderhouden door Microsoft, regelmatig bijgewerkt, uitgebreide documentatie
- **Community-templates**: Gemaakt door ontwikkelaars, kunnen gespecialiseerde gebruiksscenario's hebben, variërende kwaliteit en onderhoud

### V: Hoe werk ik een template bij in mijn project?
**A**: Templates worden niet automatisch bijgewerkt. Je kunt:
1. Handmatig wijzigingen vergelijken en samenvoegen vanuit het brontemplate
2. Vers afstarten met `azd init` via de bijgewerkte template
3. Specifieke verbeteringen uit bijgewerkte templates selectief overnemen

---

## Implementatie & Infrastructuur

### V: Welke Azure-diensten kan azd implementeren?
**A**: azd kan elke Azure-dienst implementeren via Bicep/ARM-templates, waaronder:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Opslag, Key Vault, Application Insights
- Netwerken, beveiliging en monitoringresources

### V: Kan ik naar meerdere regio's implementeren?
**A**: Ja, configureer meerdere regio's in je Bicep-templates en stel de parameter locatie correct in voor elke omgeving.

### V: Hoe ga ik om met migraties van databaseschema's?
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
**A**: Ja, gebruik `azd provision` om alleen de infrastructuurcomponenten te implementeren die in je templates zijn gedefinieerd.

### V: Hoe implementeer ik naar bestaande Azure-resources?
**A**: Ja, als de template dit ondersteunt. Verwijs naar bestaande resources met Biceps `existing`-verklaringen of de gedocumenteerde parameters voor bestaande resources van de template, en koppel applicatiediensten aan hun bedoelde doelen. Dit importeert geen eigendom of creëert automatisch ontbrekende machtigingen. Bekijk de template voor implementatie.

### V: Kan ik Terraform gebruiken in plaats van Bicep?
**A**: Ja. AZD ondersteunt zowel Terraform als Bicep. Kies een Terraform-gebaseerde template of configureer `infra.provider: terraform` in `azure.yaml`, met geschikte Terraform-bestanden en state/backendconfiguratie. Zie de [Terraform-workflow](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Configuratie & Omgevingen

### V: Hoe beheer ik verschillende omgevingen (dev, staging, prod)?
**A**: Maak aparte omgevingen aan met `azd env new <environment-name>` en configureer verschillende instellingen voor elk:
```bash
azd env new development
azd env new staging  
azd env new production
```

### V: Waar worden omgevingsconfiguraties opgeslagen?
**A**: In de `.azure`-map binnen je projectdirectory. Elke omgeving heeft een eigen map met configuratiebestanden.

### V: Hoe stel ik omgevingsspecifieke configuraties in?
**A**: Gebruik `azd env set` om omgevingsvariabelen te configureren:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### V: Kan ik omgevingsconfiguraties delen met teamleden?
**A**: De `.azure`-map bevat gevoelige informatie en mag niet worden gecommit naar versiebeheer. Doe in plaats daarvan het volgende:
1. Documenteer vereiste omgevingsvariabelen
2. Gebruik implementatiescripts om omgevingen op te zetten
3. Gebruik Azure Key Vault voor gevoelige configuraties

### V: Hoe overschrijf ik standaardwaarden van templates?
**A**: Stel omgevingsvariabelen in die overeenkomen met templateparameters:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Alleen variabelen die door de template worden gebruikt, beïnvloeden de implementatie. `SKU_NAME` hierboven is een voorbeeld van een aangepaste invoer, geen universele AZD-instelling.

---

## Problemen Oplossen

### V: Waarom faalt `azd up`?
**A**: Veelvoorkomende oorzaken:
1. **Authenticatieproblemen**: Voer `azd auth login` uit
2. **Onvoldoende machtigingen**: Controleer je Azure-roltoewijzingen
3. **Naamconflicten bij resources**: Bekijk de conflicterende resource en de naamgevingsinvoer van de template; maak een aparte omgeving met `azd env new` als isolatie nodig is
4. **Quota-/capaciteitsproblemen**: Controleer regionale beschikbaarheid
5. **Templatefouten**: Valideer Bicep-templates

### V: Hoe debug ik mislukte implementaties?
**A**: 
1. Gebruik `azd deploy --debug` voor uitgebreide output
2. Controleer de implementatiegeschiedenis in de Azure-portal
3. Bekijk het Activiteitenlogboek in de Azure-portal
4. Gebruik `azd show` om de huidige omgevingsstatus weer te geven

### V: Waarom werken mijn omgevingsvariabelen niet?
**A**: Controleer:
1. Dat variabelenamen exact overeenkomen met templateparameters
2. Dat waarden correct geciteerd zijn als ze spaties bevatten
3. Dat de juiste omgeving geselecteerd is: `azd env select <environment>`
4. Dat variabelen voor de juiste omgeving zijn ingesteld

### V: Hoe ruim ik mislukte implementaties op?
**A**: 
```bash
azd down
```
Bekijk eerst de geselecteerde omgeving en de bevestiging van verwijdering. Dit verwijdert geïmplementeerde Azure-resources, maar niet de lokale `.azure`-omgevingsconfiguratie. `--purge` vraagt daarnaast om permanente verwijdering van ondersteunde soft-verwijderde resources en kan worden geblokkeerd door retentie-/verwijderbescherming; het is geen routinematige herstelstap.

### V: Waarom is mijn applicatie na implementatie niet toegankelijk?
**A**: Controleer:
1. Dat de implementatie succesvol is voltooid
2. Dat de applicatie draait (controleer logboeken in Azure-portal)
3. Dat netwerkbeveiligingsgroepen verkeer toelaten
4. Dat DNS/aangepaste domeinen correct zijn geconfigureerd

---

## Kosten & Facturering

### V: Hoeveel gaan azd-implementaties kosten?
**A**: Kosten zijn afhankelijk van:
- De geïmplementeerde Azure-diensten
- Geselecteerde servicetiers/SKUs
- Regionale prijsverschillen
- Gebruikspatronen

Gebruik de [Azure Prijscalculator](https://azure.microsoft.com/pricing/calculator/) voor schattingen.

### V: Hoe beheers ik kosten bij azd-implementaties?
**A**: 
1. Gebruik goedkopere SKUs voor ontwikkelomgevingen
2. Stel Azure-budgetten en waarschuwingen in
3. Gebruik `azd down` om resources te verwijderen als ze niet nodig zijn
4. Kies geschikte regio's (kosten verschillen per locatie)
5. Gebruik Azure Cost Management-hulpmiddelen

### V: Zijn er gratis opties voor azd-sjablonen?
**A**: Sommige services hebben gratis SKU's of maandelijkse toeslagen, afhankelijk van geschiktheid, hostingplan, regio en abonnementsbeperkingen. Dit maakt een hele sjabloon niet gratis: databases, zoeken, netwerken, register, telemetrie en modelinference kunnen afzonderlijk kosten veroorzaken. Controleer de [Azure gratis servicelijst](https://azure.microsoft.com/free/) en huidige prijzen voor elke resource vóór implementatie.

### V: Hoe kan ik de kosten inschatten vóór implementatie?
**A**: 
1. Bekijk de `main.bicep` van het sjabloon om te zien welke resources worden gemaakt
2. Gebruik de Azure Price Calculator met specifieke SKU's
3. Implementeer eerst in een ontwikkelomgeving om werkelijke kosten te monitoren
4. Gebruik Azure Cost Management voor gedetailleerde kostenanalyse

---

## Best Practices

### V: Wat zijn de best practices voor de azd projectstructuur?
**A**: 
1. Houd applicatiecode gescheiden van infrastructuur
2. Gebruik betekenisvolle servicenamen in `azure.yaml`
3. Implementeer goede foutafhandeling in buildscripts
4. Gebruik omgevingsspecifieke configuraties
5. Voeg uitgebreide documentatie toe

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

### V: Moet ik de `.azure` map in versiebeheer opnemen?
**A**: **Nee!** De `.azure` map bevat gevoelige informatie. Voeg deze toe aan `.gitignore`:
```gitignore
.azure/
```

### V: Hoe ga ik om met geheimen en gevoelige configuraties?
**A**: 
1. Gebruik Azure Key Vault voor geheimen
2. Verwijs naar Key Vault geheimen in applicatieconfiguratie
3. Zet nooit geheimen in versiebeheer
4. Gebruik beheerde identiteiten voor authenticatie tussen services

### V: Wat is de aanbevolen aanpak voor CI/CD met azd?
**A**: 
1. Gebruik aparte omgevingen voor elke fase (dev/staging/prod)
2. Implementeer geautomatiseerde tests vóór implementatie
3. Gebruik serviceprincipals voor authenticatie
4. Sla gevoelige configuraties op in pipeline geheimen/variabelen
5. Implementeer goedkeuringspoorten voor productie-implementaties

---

## Geavanceerde Onderwerpen

### V: Kan ik azd uitbreiden met eigen functionaliteit?
**A**: Ja, via implementatiehooks in `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### V: Hoe integreer ik azd in bestaande DevOps-processen?
**A**: 
1. Gebruik azd-commando's in bestaande pipelinescripts
2. Standaardiseer op azd-sjablonen binnen teams
3. Integreer met bestaande monitoring en alerting
4. Gebruik de JSON-uitvoer van azd voor pipeline-integratie

### V: Kan ik azd gebruiken met Azure DevOps?
**A**: Ja, azd werkt met elk CI/CD-systeem. Maak Azure DevOps pipelines die azd-commando's gebruiken.

### V: Hoe draag ik bij aan azd of maak ik community-sjablonen?
**A**: 
1. **azd tool**: Draag bij aan [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Sjablonen**: Volg de [Awesome AZD gallery contribution instructions](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentatie**: Draag bij aan docs bij [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### V: Wat is de roadmap voor azd?
**A**: Bekijk de [officiële roadmap](https://github.com/Azure/azure-dev/projects) voor geplande functies en verbeteringen.

### V: Hoe migreer ik van andere implementatietools naar azd?
**A**: 
1. Analyseer huidige implementatiearchitectuur
2. Maak gelijkwaardige Bicep-sjablonen
3. Configureer `azure.yaml` om aan te sluiten op huidige services
4. Test grondig in ontwikkelomgeving
5. Migreer omgevingen geleidelijk

---

## Nog vragen?

### **Eerst zoeken**
- Bekijk de [officiële documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Zoek op [GitHub issues](https://github.com/Azure/azure-dev/issues) naar vergelijkbare problemen

### **Hulp krijgen**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Community ondersteuning
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technische vragen
- [Azure Discord](https://discord.gg/azure) - Community chat in realtime

### **Problemen melden**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Bugs en functie-aanvragen
- Voeg relevante logs, foutmeldingen en reproduceerstappen toe

### **Meer leren**
- [Azure Developer CLI documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architectuur Centrum](https://learn.microsoft.com/en-us/azure/architecture/)
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
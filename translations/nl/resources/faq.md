<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a82d27b84022e9b7c7a163f99fa1fd25",
  "translation_date": "2025-09-18T07:01:16+00:00",
  "source_file": "resources/faq.md",
  "language_code": "nl"
}
-->
# Veelgestelde Vragen (FAQ)

**Hulp per hoofdstuk**
- **📚 Cursus Home**: [AZD Voor Beginners](../README.md)
- **🚆 Installatieproblemen**: [Hoofdstuk 1: Installatie & Setup](../docs/getting-started/installation.md)
- **🤖 AI Vragen**: [Hoofdstuk 2: AI-First Ontwikkeling](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 Problemen oplossen**: [Hoofdstuk 7: Problemen oplossen & Debuggen](../docs/troubleshooting/common-issues.md)

## Introductie

Deze uitgebreide FAQ biedt antwoorden op de meest voorkomende vragen over Azure Developer CLI (azd) en Azure-implementaties. Vind snelle oplossingen voor veelvoorkomende problemen, begrijp best practices en krijg verduidelijking over azd-concepten en workflows.

## Leerdoelen

Door deze FAQ te bekijken, leer je:
- Snel antwoorden te vinden op veelvoorkomende vragen en problemen met Azure Developer CLI
- Belangrijke concepten en terminologie te begrijpen via een praktische Q&A-indeling
- Oplossingen voor veelvoorkomende problemen en foutscenario's te vinden
- Best practices te leren via veelgestelde vragen over optimalisatie
- Geavanceerde functies en mogelijkheden te ontdekken via vragen op expertniveau
- Efficiënt advies te raadplegen over kosten, beveiliging en implementatiestrategieën

## Leerresultaten

Door regelmatig naar deze FAQ te verwijzen, kun je:
- Veelvoorkomende problemen met Azure Developer CLI zelfstandig oplossen met de geboden oplossingen
- Geïnformeerde beslissingen nemen over implementatiestrategieën en configuraties
- De relatie tussen azd en andere Azure-tools en -services begrijpen
- Best practices toepassen op basis van ervaringen uit de community en aanbevelingen van experts
- Problemen met authenticatie, implementatie en configuratie effectief oplossen
- Kosten en prestaties optimaliseren met inzichten en aanbevelingen uit de FAQ

## Inhoudsopgave

- [Aan de slag](../../../resources)
- [Authenticatie & Toegang](../../../resources)
- [Templates & Projecten](../../../resources)
- [Implementatie & Infrastructuur](../../../resources)
- [Configuratie & Omgevingen](../../../resources)
- [Problemen oplossen](../../../resources)
- [Kosten & Facturering](../../../resources)
- [Best Practices](../../../resources)
- [Geavanceerde Onderwerpen](../../../resources)

---

## Aan de slag

### V: Wat is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) is een ontwikkelaarsgerichte command-line tool die de tijd verkort om je applicatie van je lokale ontwikkelomgeving naar Azure te krijgen. Het biedt best practices via templates en helpt bij de volledige implementatiecyclus.

### V: Hoe verschilt azd van Azure CLI?
**A**: 
- **Azure CLI**: Algemeen hulpmiddel voor het beheren van Azure-resources
- **azd**: Ontwikkelaarsgericht hulpmiddel voor applicatie-implementatieworkflows
- azd gebruikt Azure CLI intern, maar biedt hogere abstracties voor veelvoorkomende ontwikkelscenario's
- azd bevat templates, omgevingsbeheer en implementatie-automatisering

### V: Moet ik Azure CLI geïnstalleerd hebben om azd te gebruiken?
**A**: Ja, azd vereist Azure CLI voor authenticatie en sommige bewerkingen. Installeer eerst Azure CLI en daarna azd.

### V: Welke programmeertalen ondersteunt azd?
**A**: azd is taalagnostisch. Het werkt met:
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
2. Bestaande projecten aanpassen aan de structuur van azd-templates
3. Aangepaste templates maken op basis van je bestaande architectuur

---

## Authenticatie & Toegang

### V: Hoe authenticeer ik met Azure via azd?
**A**: Gebruik `azd auth login`, wat een browservenster opent voor Azure-authenticatie. Voor CI/CD-scenario's gebruik je serviceprincipals of managed identities.

### V: Kan ik azd gebruiken met meerdere Azure-abonnementen?
**A**: Ja. Gebruik `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` om aan te geven welk abonnement je wilt gebruiken voor elke omgeving.

### V: Welke rechten heb ik nodig om te implementeren met azd?
**A**: Meestal heb je nodig:
- **Contributor**-rol op de resourcegroep of het abonnement
- **User Access Administrator** als je resources implementeert die roltoewijzingen vereisen
- Specifieke rechten variëren per template en de te implementeren resources

### V: Kan ik azd gebruiken in CI/CD-pipelines?
**A**: Absoluut! azd is ontworpen voor CI/CD-integratie. Gebruik serviceprincipals voor authenticatie en stel omgevingsvariabelen in voor configuratie.

### V: Hoe behandel ik authenticatie in GitHub Actions?
**A**: Gebruik de Azure Login-actie met serviceprincipal-credentials:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projecten

### V: Waar kan ik azd-templates vinden?
**A**: 
- Officiële templates: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Community-templates: Zoek op GitHub naar "azd-template"
- Gebruik `azd template list` om beschikbare templates te bekijken

### V: Hoe maak ik een aangepaste template?
**A**: 
1. Begin met een bestaande templatestructuur
2. Pas `azure.yaml`, infrastructuurbestanden en applicatiecode aan
3. Test grondig met `azd up`
4. Publiceer op GitHub met de juiste tags

### V: Kan ik azd gebruiken zonder een template?
**A**: Ja, gebruik `azd init` in een bestaand project om de benodigde configuratiebestanden te maken. Je moet `azure.yaml` en infrastructuurbestanden handmatig configureren.

### V: Wat is het verschil tussen officiële en community-templates?
**A**: 
- **Officiële templates**: Onderhouden door Microsoft, regelmatig bijgewerkt, uitgebreide documentatie
- **Community-templates**: Gemaakt door ontwikkelaars, kunnen gespecialiseerde use cases hebben, variërende kwaliteit en onderhoud

### V: Hoe werk ik een template in mijn project bij?
**A**: Templates worden niet automatisch bijgewerkt. Je kunt:
1. Handmatig wijzigingen vergelijken en samenvoegen van de brontemplate
2. Opnieuw beginnen met `azd init` met de bijgewerkte template
3. Specifieke verbeteringen selecteren uit bijgewerkte templates

---

## Implementatie & Infrastructuur

### V: Welke Azure-services kan azd implementeren?
**A**: azd kan elke Azure-service implementeren via Bicep/ARM-templates, waaronder:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Netwerken, beveiliging en monitoringresources

### V: Kan ik implementeren in meerdere regio's?
**A**: Ja, configureer meerdere regio's in je Bicep-templates en stel de locatieparameter correct in voor elke omgeving.

### V: Hoe behandel ik database-schema-migraties?
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
**A**: Dit is complex en niet direct ondersteund. Je kunt:
1. Bestaande resources importeren in je Bicep-templates
2. Verwijzingen naar bestaande resources gebruiken in templates
3. Templates aanpassen om conditioneel resources te maken of te verwijzen

### V: Kan ik Terraform gebruiken in plaats van Bicep?
**A**: Momenteel ondersteunt azd voornamelijk Bicep/ARM-templates. Terraform-ondersteuning is niet officieel beschikbaar, hoewel er mogelijk community-oplossingen bestaan.

---

## Configuratie & Omgevingen

### V: Hoe beheer ik verschillende omgevingen (dev, staging, prod)?
**A**: Maak aparte omgevingen met `azd env new <environment-name>` en configureer verschillende instellingen voor elke omgeving:
```bash
azd env new development
azd env new staging  
azd env new production
```

### V: Waar worden omgevingsconfiguraties opgeslagen?
**A**: In de `.azure`-map binnen je projectdirectory. Elke omgeving heeft zijn eigen map met configuratiebestanden.

### V: Hoe stel ik omgevingsspecifieke configuratie in?
**A**: Gebruik `azd env set` om omgevingsvariabelen te configureren:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### V: Kan ik omgevingsconfiguraties delen met teamleden?
**A**: De `.azure`-map bevat gevoelige informatie en mag niet worden gecommit naar versiebeheer. In plaats daarvan:
1. Documenteer vereiste omgevingsvariabelen
2. Gebruik implementatiescripts om omgevingen in te stellen
3. Gebruik Azure Key Vault voor gevoelige configuratie

### V: Hoe overschrijf ik standaardwaarden van templates?
**A**: Stel omgevingsvariabelen in die overeenkomen met templateparameters:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Problemen oplossen

### V: Waarom faalt `azd up`?
**A**: Veelvoorkomende oorzaken:
1. **Authenticatieproblemen**: Voer `azd auth login` uit
2. **Onvoldoende rechten**: Controleer je Azure-roltoewijzingen
3. **Conflicten in resourcenamen**: Wijzig AZURE_ENV_NAME
4. **Quota/capaciteitsproblemen**: Controleer regionale beschikbaarheid
5. **Templatefouten**: Valideer Bicep-templates

### V: Hoe debug ik implementatiefouten?
**A**: 
1. Gebruik `azd deploy --debug` voor gedetailleerde uitvoer
2. Controleer implementatiegeschiedenis in Azure Portal
3. Bekijk Activiteitenlogboek in Azure Portal
4. Gebruik `azd show` om de huidige omgevingsstatus weer te geven

### V: Waarom werken mijn omgevingsvariabelen niet?
**A**: Controleer:
1. Variabelenamen komen exact overeen met templateparameters
2. Waarden zijn correct geciteerd als ze spaties bevatten
3. Omgeving is geselecteerd: `azd env select <environment>`
4. Variabelen zijn ingesteld in de juiste omgeving

### V: Hoe ruim ik mislukte implementaties op?
**A**: 
```bash
azd down --force --purge
```
Dit verwijdert alle resources en omgevingsconfiguratie.

### V: Waarom is mijn applicatie niet toegankelijk na implementatie?
**A**: Controleer:
1. Implementatie is succesvol voltooid
2. Applicatie draait (controleer logs in Azure Portal)
3. Netwerkbeveiligingsgroepen staan verkeer toe
4. DNS/aangepaste domeinen zijn correct geconfigureerd

---

## Kosten & Facturering

### V: Hoeveel kosten azd-implementaties?
**A**: Kosten zijn afhankelijk van:
- Azure-services die worden geïmplementeerd
- Service tiers/SKU's die zijn geselecteerd
- Regionale prijsverschillen
- Gebruikerspatronen

Gebruik de [Azure Prijscalculator](https://azure.microsoft.com/pricing/calculator/) voor schattingen.

### V: Hoe beheer ik kosten in azd-implementaties?
**A**: 
1. Gebruik lagere SKU's voor ontwikkelomgevingen
2. Stel Azure-budgetten en waarschuwingen in
3. Gebruik `azd down` om resources te verwijderen wanneer ze niet nodig zijn
4. Kies geschikte regio's (kosten variëren per locatie)
5. Gebruik Azure Cost Management-tools

### V: Zijn er gratis opties voor azd-templates?
**A**: Veel Azure-services bieden gratis opties:
- App Service: Gratis tier beschikbaar
- Azure Functions: 1M gratis uitvoeringen/maand
- Cosmos DB: Gratis tier met 400 RU/s
- Application Insights: Eerste 5GB/maand gratis

Configureer templates om gratis tiers te gebruiken waar beschikbaar.

### V: Hoe schat ik kosten voorafgaand aan implementatie?
**A**: 
1. Bekijk de `main.bicep` van de template om te zien welke resources worden gemaakt
2. Gebruik Azure Prijscalculator met specifieke SKU's
3. Implementeer eerst naar een ontwikkelomgeving om werkelijke kosten te monitoren
4. Gebruik Azure Cost Management voor gedetailleerde kostenanalyse

---

## Best Practices

### V: Wat zijn de best practices voor azd-projectstructuur?
**A**: 
1. Houd applicatiecode gescheiden van infrastructuur
2. Gebruik betekenisvolle servicenamen in `azure.yaml`
3. Implementeer goede foutafhandeling in buildscripts
4. Gebruik omgevingsspecifieke configuratie
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

### V: Moet ik de `.azure`-map committen naar versiebeheer?
**A**: **Nee!** De `.azure`-map bevat gevoelige informatie. Voeg deze toe aan `.gitignore`:
```gitignore
.azure/
```

### V: Hoe behandel ik geheimen en gevoelige configuratie?
**A**: 
1. Gebruik Azure Key Vault voor geheimen
2. Verwijs naar Key Vault-geheimen in applicatieconfiguratie
3. Commit nooit geheimen naar versiebeheer
4. Gebruik managed identities voor service-naar-service-authenticatie

### V: Wat is de aanbevolen aanpak voor CI/CD met azd?
**A**: 
1. Gebruik aparte omgevingen voor elke fase (dev/staging/prod)
2. Implementeer geautomatiseerde tests vóór implementatie
3. Gebruik serviceprincipals voor authenticatie
4. Sla gevoelige configuratie op in pipeline-geheimen/variabelen
5. Implementeer goedkeuringsstappen voor productie-implementaties

---

## Geavanceerde Onderwerpen

### V: Kan ik azd uitbreiden met aangepaste functionaliteit?
**A**: Ja, via implementatiehooks in `azure.yaml`:
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
3. Integreer met bestaande monitoring en waarschuwingen
4. Gebruik de JSON-uitvoer van azd voor pipeline-integratie

### V: Kan ik azd gebruiken met Azure DevOps?
**A**: Ja, azd werkt met elk CI/CD-systeem. Maak Azure DevOps-pipelines die azd-commando's gebruiken.

### V: Hoe draag ik bij aan azd of maak ik community-templates?
**A**: 
1. **azd-tool**: Draag bij aan [Azure/azure-dev](https://github.com/Azure/azure-dev)
## Veelgestelde vragen over Azure Developer CLI (azd)

### Vraag: Wat is azd?
**Antwoord**: Azure Developer CLI (azd) is een tool die ontwikkelaars helpt bij het bouwen, implementeren en beheren van applicaties in Azure. Het biedt een gestroomlijnde ervaring voor het werken met Azure-resources.

---

### Vraag: Hoe kan ik bijdragen aan azd?
**Antwoord**: Er zijn verschillende manieren om bij te dragen:

1. **Code**: Draag bij aan de broncode via [GitHub](https://github.com/Azure/azure-dev).
2. **Templates**: Maak templates volgens de [template richtlijnen](https://github.com/Azure-Samples/awesome-azd).
3. **Documentatie**: Draag bij aan de documentatie via [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs).

---

### Vraag: Wat is de roadmap voor azd?
**Antwoord**: Bekijk de [officiële roadmap](https://github.com/Azure/azure-dev/projects) voor geplande functies en verbeteringen.

---

### Vraag: Hoe migreer ik van andere implementatietools naar azd?
**Antwoord**: 
1. Analyseer de huidige implementatiearchitectuur.
2. Maak equivalente Bicep-templates.
3. Configureer `azure.yaml` om overeen te komen met de huidige services.
4. Test grondig in de ontwikkelomgeving.
5. Migreer omgevingen geleidelijk.

---

## Nog vragen?

### **Eerst zoeken**
- Bekijk de [officiële documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/).
- Zoek naar vergelijkbare problemen in [GitHub issues](https://github.com/Azure/azure-dev/issues).

---

### **Hulp krijgen**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Ondersteuning vanuit de community.
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technische vragen.
- [Azure Discord](https://discord.gg/azure) - Real-time community chat.

---

### **Problemen melden**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Bugrapporten en functieverzoeken.
- Voeg relevante logs, foutmeldingen en stappen om te reproduceren toe.

---

### **Meer leren**
- [Azure Developer CLI documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/).
- [Azure Architectuurcentrum](https://learn.microsoft.com/en-us/azure/architecture/).
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/).

---

*Deze FAQ wordt regelmatig bijgewerkt. Laatst bijgewerkt: 9 september 2025.*

---

**Navigatie**
- **Vorige les**: [Glossary](glossary.md)
- **Volgende les**: [Study Guide](study-guide.md)

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in zijn oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
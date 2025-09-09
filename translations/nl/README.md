<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-09T20:57:26+00:00",
  "source_file": "README.md",
  "language_code": "nl"
}
-->
# AZD Voor Beginners

![AZD-voor-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.nl.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)  

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

Volg deze stappen om aan de slag te gaan met deze bronnen:  
1. **Fork de Repository**: Klik [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **Clone de Repository**:   `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**Word lid van de Azure Discord Communities en ontmoet experts en mede-ontwikkelaars**](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 Meertalige Ondersteuning

#### Ondersteund via GitHub Action (Automatisch & Altijd Actueel)

[Frans](../fr/README.md) | [Spaans](../es/README.md) | [Duits](../de/README.md) | [Russisch](../ru/README.md) | [Arabisch](../ar/README.md) | [Perzisch (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinees (Vereenvoudigd)](../zh/README.md) | [Chinees (Traditioneel, Macau)](../mo/README.md) | [Chinees (Traditioneel, Hong Kong)](../hk/README.md) | [Chinees (Traditioneel, Taiwan)](../tw/README.md) | [Japans](../ja/README.md) | [Koreaans](../ko/README.md) | [Hindi](../hi/README.md) | [Bengaals](../bn/README.md) | [Marathi](../mr/README.md) | [Nepalees](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portugees (Portugal)](../pt/README.md) | [Portugees (Brazilië)](../br/README.md) | [Italiaans](../it/README.md) | [Pools](../pl/README.md) | [Turks](../tr/README.md) | [Grieks](../el/README.md) | [Thais](../th/README.md) | [Zweeds](../sv/README.md) | [Deens](../da/README.md) | [Noors](../no/README.md) | [Fins](../fi/README.md) | [Nederlands](./README.md) | [Hebreeuws](../he/README.md) | [Vietnamees](../vi/README.md) | [Indonesisch](../id/README.md) | [Maleis](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hongaars](../hu/README.md) | [Tsjechisch](../cs/README.md) | [Slowaaks](../sk/README.md) | [Roemeens](../ro/README.md) | [Bulgaars](../bg/README.md) | [Servisch (Cyrillisch)](../sr/README.md) | [Kroatisch](../hr/README.md) | [Sloveens](../sl/README.md) | [Oekraïens](../uk/README.md) | [Birmaans (Myanmar)](../my/README.md)  

**Als je extra vertalingen wilt, kun je de ondersteunde talen vinden [hier](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## Introductie

Welkom bij de uitgebreide gids voor Azure Developer CLI (azd). Deze repository is ontworpen om ontwikkelaars van alle niveaus, van studenten tot professionele ontwikkelaars, te helpen leren en beheersen hoe ze Azure Developer CLI kunnen gebruiken voor efficiënte cloudimplementaties. Deze gestructureerde leerbron biedt praktische ervaring met Azure-cloudimplementaties, het oplossen van veelvoorkomende problemen en het toepassen van best practices voor succesvolle AZD-template-implementaties.

## Leerdoelen

Door deze repository door te werken, leer je:  
- De basisprincipes en kernconcepten van Azure Developer CLI beheersen  
- Azure-resources implementeren en inrichten met Infrastructure as Code  
- Vaardigheden ontwikkelen om veelvoorkomende AZD-implementatieproblemen op te lossen  
- Pre-implementatievalidatie en capaciteitsplanning begrijpen  
- Beveiligingsbest practices en kostenoptimalisatiestrategieën toepassen  
- Vertrouwen opbouwen in het implementeren van productieklare applicaties naar Azure  

## Leerresultaten

Na het voltooien van deze cursus kun je:  
- Azure Developer CLI succesvol installeren, configureren en gebruiken  
- Applicaties maken en implementeren met behulp van AZD-templates  
- Problemen met authenticatie, infrastructuur en implementatie oplossen  
- Pre-implementatiecontroles uitvoeren, inclusief capaciteitsplanning en SKU-selectie  
- Monitoring, beveiliging en kostenbeheer best practices implementeren  
- AZD-workflows integreren in CI/CD-pijplijnen  

## Inhoudsopgave

- [Wat is Azure Developer CLI?](../..)  
- [Snelle Start](../..)  
- [Documentatie](../..)  
- [Voorbeelden & Templates](../..)  
- [Bronnen](../..)  
- [Bijdragen](../..)  

## Wat is Azure Developer CLI?

Azure Developer CLI (azd) is een ontwikkelaarsgerichte command-line interface die het proces van het bouwen en implementeren van applicaties naar Azure versnelt. Het biedt:  

- **Template-gebaseerde implementaties** - Gebruik vooraf gebouwde templates voor veelvoorkomende applicatiepatronen  
- **Infrastructure as Code** - Beheer Azure-resources met Bicep of Terraform  
- **Geïntegreerde workflows** - Naadloos inrichten, implementeren en monitoren van applicaties  
- **Ontwikkelaarsvriendelijk** - Geoptimaliseerd voor productiviteit en ervaring van ontwikkelaars  

## Snelle Start

### Vereisten  
- Azure-abonnement  
- Azure CLI geïnstalleerd  
- Git (voor het clonen van templates)  

### Installatie  
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```  

### Je Eerste Implementatie  
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```  

## Documentatie

### Aan de Slag  
- [**AZD Basisprincipes**](docs/getting-started/azd-basics.md) - Kernconcepten en terminologie  
- [**Installatie & Setup**](docs/getting-started/installation.md) - Platform-specifieke installatiegidsen  
- [**Configuratie**](docs/getting-started/configuration.md) - Omgevingsinstellingen en authenticatie  
- [**Je Eerste Project**](docs/getting-started/first-project.md) - Stapsgewijze tutorial  

### Implementatie & Inrichting  
- [**Implementatiegids**](docs/deployment/deployment-guide.md) - Complete implementatieworkflows  
- [**Resources Inrichten**](docs/deployment/provisioning.md) - Azure resourcebeheer  

### Pre-Implementatiecontroles  
- [**Capaciteitsplanning**](docs/pre-deployment/capacity-planning.md) - Validatie van Azure resourcecapaciteit  
- [**SKU-selectie**](docs/pre-deployment/sku-selection.md) - De juiste Azure SKU's kiezen  
- [**Pre-flight Checks**](docs/pre-deployment/preflight-checks.md) - Geautomatiseerde validatiescripts  

### Probleemoplossing  
- [**Veelvoorkomende Problemen**](docs/troubleshooting/common-issues.md) - Veelvoorkomende problemen en oplossingen  
- [**Debugging Gids**](docs/troubleshooting/debugging.md) - Stapsgewijze debuggingstrategieën  

## Voorbeelden & Templates

### Starter Templates  
- [**Eenvoudige Webapplicatie**](../../examples/simple-web-app) - Basis Node.js webapplicatie-implementatie  
- [**Statische Website**](../../examples/static-website) - Hosting van statische websites op Azure Storage  
- [**Container Applicatie**](../../examples/container-app) - Containerized applicatie-implementatie  
- [**Database Applicatie**](../../examples/database-app) - Webapplicatie met database-integratie  

### Geavanceerde Scenario's  
- [**Microservices**](../../examples/microservices) - Multi-service applicatiearchitectuur  
- [**Serverless Functies**](../../examples/serverless-function) - Azure Functions implementatie  
- [**Configuratie Voorbeelden**](../../examples/configurations) - Herbruikbare configuratiepatronen  

## Bronnen

### Snelle Referenties  
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Essentiële azd-commando's  
- [**Woordenlijst**](resources/glossary.md) - Azure en azd terminologie  
- [**FAQ**](resources/faq.md) - Veelgestelde vragen  
- [**Studiegids**](resources/study-guide.md) - Uitgebreide leerdoelen en oefenopdrachten  

### Externe Bronnen  
- [Azure Developer CLI Documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architectuur Centrum](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Prijscalculator](https://azure.microsoft.com/pricing/calculator/)  
- [Azure Status](https://status.azure.com/)  

## Leerpad

### Voor Studenten & Beginners  
1. Begin met [AZD Basisprincipes](docs/getting-started/azd-basics.md)  
2. Volg de [Installatiegids](docs/getting-started/installation.md)  
3. Voltooi [Je Eerste Project](docs/getting-started/first-project.md)  
4. Oefen met [Eenvoudige Webapp Voorbeeld](../../examples/simple-web-app)  

### Voor Ontwikkelaars  
1. Bekijk de [Configuratiegids](docs/getting-started/configuration.md)  
2. Bestudeer de [Implementatiegids](docs/deployment/deployment-guide.md)  
3. Werk door het [Database App Voorbeeld](../../examples/database-app)  
4. Verken het [Container App Voorbeeld](../../examples/container-app)  

### Voor DevOps Engineers  
1. Beheers [Resources Inrichten](docs/deployment/provisioning.md)  
2. Voer [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) uit  
3. Oefen met [Capaciteitsplanning](docs/pre-deployment/capacity-planning.md)  
4. Geavanceerd [Microservices Voorbeeld](../../examples/microservices)  

## Bijdragen

We verwelkomen bijdragen! Lees onze [Bijdragegids](CONTRIBUTING.md) voor details over:  
- Hoe je problemen en functieverzoeken kunt indienen  
- Richtlijnen voor codebijdragen  
- Verbeteringen aan documentatie  
- Gemeenschapsnormen  

## Ondersteuning

- **Problemen**: [Meld bugs en vraag functies aan](https://github.com/microsoft/azd-for-beginners/issues)  
- **Discussies**: [Microsoft Azure Discord Community Q&A en discussies](https://discord.gg/microsoft-azure)  
- **E-mail**: Voor privévragen  
- **Microsoft Learn**: [Officiële Azure Developer CLI documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

## Licentie

Dit project is gelicentieerd onder de MIT-licentie - zie het [LICENSE](../../LICENSE) bestand voor details.  

## 🎒 Andere Cursussen

Ons team produceert andere cursussen! Bekijk:  

- [**NIEUW** Model Context Protocol (MCP) Voor Beginners](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Agents Voor Beginners](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generatieve AI Voor Beginners met .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generatieve AI Voor Beginners](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generatieve AI Voor Beginners met Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML Voor Beginners](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [Data Science Voor Beginners](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Voor Beginners](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [Cybersecurity Voor Beginners](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [Webontwikkeling voor beginners](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT voor beginners](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR-ontwikkeling voor beginners](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot beheersen voor AI-paired programmeren](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot beheersen voor C#/.NET-ontwikkelaars](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Kies je eigen Copilot-avontuur](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**Navigatie**
- **Volgende les**: [AZD Basisprincipes](docs/getting-started/azd-basics.md)

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in zijn oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-09T20:54:27+00:00",
  "source_file": "README.md",
  "language_code": "sv"
}
-->
# AZD För Nybörjare

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.sv.png) 

Följ dessa steg för att komma igång med dessa resurser:
1. **Forka Repositoriet**: Klicka [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klona Repositoriet**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Gå med i Azure Discord Communities och träffa experter och andra utvecklare**](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Flerspråkigt Stöd

#### Stöds via GitHub Action (Automatiserat & Alltid Uppdaterat)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](./README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**Om du vill ha ytterligare översättningar finns stödda språk listade [här](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Introduktion

Välkommen till den omfattande guiden för Azure Developer CLI (azd). Detta repository är utformat för att hjälpa utvecklare på alla nivåer, från studenter till professionella utvecklare, att lära sig och bemästra Azure Developer CLI för effektiva molndistributioner. Denna strukturerade lärresurs ger praktisk erfarenhet av Azure-molndistributioner, felsökning av vanliga problem och implementering av bästa praxis för framgångsrika AZD-malldistributioner.

## Lärandemål

Genom att arbeta igenom detta repository kommer du att:
- Bemästra grunderna och kärnkoncepten för Azure Developer CLI
- Lära dig att distribuera och tillhandahålla Azure-resurser med Infrastructure as Code
- Utveckla färdigheter för att felsöka vanliga problem med AZD-distributioner
- Förstå validering före distribution och kapacitetsplanering
- Implementera säkerhetsbästa praxis och kostnadsoptimeringsstrategier
- Bygga självförtroende i att distribuera produktionsklara applikationer till Azure

## Läranderesultat

Efter att ha slutfört denna kurs kommer du att kunna:
- Framgångsrikt installera, konfigurera och använda Azure Developer CLI
- Skapa och distribuera applikationer med AZD-mallar
- Felsöka autentisering, infrastruktur och distributionsproblem
- Utföra kontroller före distribution, inklusive kapacitetsplanering och SKU-val
- Implementera övervakning, säkerhet och kostnadshantering bästa praxis
- Integrera AZD-arbetsflöden i CI/CD-pipelines

## Innehållsförteckning

- [Vad är Azure Developer CLI?](../..)
- [Snabbstart](../..)
- [Dokumentation](../..)
- [Exempel & Mallar](../..)
- [Resurser](../..)
- [Bidra](../..)

## Vad är Azure Developer CLI?

Azure Developer CLI (azd) är ett utvecklarfokuserat kommandoradsgränssnitt som påskyndar processen att bygga och distribuera applikationer till Azure. Det erbjuder:

- **Mallbaserade distributioner** - Använd förbyggda mallar för vanliga applikationsmönster
- **Infrastructure as Code** - Hantera Azure-resurser med Bicep eller Terraform
- **Integrerade arbetsflöden** - Smidigt tillhandahålla, distribuera och övervaka applikationer
- **Utvecklarvänligt** - Optimerat för utvecklarproduktivitet och upplevelse

## Snabbstart

### Förutsättningar
- Azure-prenumeration
- Azure CLI installerat
- Git (för att klona mallar)

### Installation
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Din Första Distribution
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

## Dokumentation

### Komma Igång
- [**AZD Grunder**](docs/getting-started/azd-basics.md) - Kärnkoncept och terminologi
- [**Installation & Setup**](docs/getting-started/installation.md) - Plattformsspecifika installationsguider
- [**Konfiguration**](docs/getting-started/configuration.md) - Miljöinställningar och autentisering
- [**Ditt Första Projekt**](docs/getting-started/first-project.md) - Steg-för-steg handledning

### Distribution & Tillhandahållande
- [**Distributionsguide**](docs/deployment/deployment-guide.md) - Kompletta distributionsarbetsflöden
- [**Tillhandahållande av Resurser**](docs/deployment/provisioning.md) - Hantering av Azure-resurser

### Kontroller Före Distribution
- [**Kapacitetsplanering**](docs/pre-deployment/capacity-planning.md) - Validering av Azure-resurskapacitet
- [**SKU-val**](docs/pre-deployment/sku-selection.md) - Välja rätt Azure-SKUs
- [**Kontroller Före Flygning**](docs/pre-deployment/preflight-checks.md) - Automatiserade valideringsskript

### Felsökning
- [**Vanliga Problem**](docs/troubleshooting/common-issues.md) - Vanligt förekommande problem och lösningar
- [**Felsökningsguide**](docs/troubleshooting/debugging.md) - Steg-för-steg felsökningsstrategier

## Exempel & Mallar

### Startmallar
- [**Enkel Webbapplikation**](../../examples/simple-web-app) - Grundläggande Node.js-webbapplikationsdistribution
- [**Statisk Webbplats**](../../examples/static-website) - Hosting av statisk webbplats på Azure Storage
- [**Containerapplikation**](../../examples/container-app) - Distribution av containeriserad applikation
- [**Databasapplikation**](../../examples/database-app) - Webbapplikation med databasintegration

### Avancerade Scenarier
- [**Mikrotjänster**](../../examples/microservices) - Applikationsarkitektur med flera tjänster
- [**Serverlösa Funktioner**](../../examples/serverless-function) - Distribution av Azure Functions
- [**Konfigurationsexempel**](../../examples/configurations) - Återanvändbara konfigurationsmönster

## Resurser

### Snabba Referenser
- [**Kommandosfusklapp**](resources/cheat-sheet.md) - Viktiga azd-kommandon
- [**Ordlista**](resources/glossary.md) - Terminologi för Azure och azd
- [**FAQ**](resources/faq.md) - Vanliga frågor
- [**Studieguide**](resources/study-guide.md) - Omfattande lärandemål och övningar

### Externa Resurser
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Priskalkylator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

## Lärandebana

### För Studenter & Nybörjare
1. Börja med [AZD Grunder](docs/getting-started/azd-basics.md)
2. Följ [Installationsguiden](docs/getting-started/installation.md)
3. Slutför [Ditt Första Projekt](docs/getting-started/first-project.md)
4. Öva med [Exempel på Enkel Webbapplikation](../../examples/simple-web-app)

### För Utvecklare
1. Granska [Konfigurationsguiden](docs/getting-started/configuration.md)
2. Studera [Distributionsguiden](docs/deployment/deployment-guide.md)
3. Arbeta igenom [Exempel på Databasapplikation](../../examples/database-app)
4. Utforska [Exempel på Containerapplikation](../../examples/container-app)

### För DevOps Ingenjörer
1. Bemästra [Tillhandahållande av Resurser](docs/deployment/provisioning.md)
2. Implementera [Kontroller Före Flygning](docs/pre-deployment/preflight-checks.md)
3. Öva på [Kapacitetsplanering](docs/pre-deployment/capacity-planning.md)
4. Avancerat [Exempel på Mikrotjänster](../../examples/microservices)

## Bidra

Vi välkomnar bidrag! Läs vår [Bidragsguide](CONTRIBUTING.md) för detaljer om:
- Hur man skickar in problem och funktionsförfrågningar
- Riktlinjer för kodbidrag
- Förbättringar av dokumentation
- Gemenskapsstandarder

## Support

- **Problem**: [Rapportera buggar och begär funktioner](https://github.com/microsoft/azd-for-beginners/issues)
- **Diskussioner**: [Microsoft Azure Discord Community Q&A och diskussioner](https://discord.gg/microsoft-azure)
- **E-post**: För privata förfrågningar
- **Microsoft Learn**: [Officiell Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

## Licens

Detta projekt är licensierat under MIT-licensen - se [LICENSE](../../LICENSE) för detaljer.

## 🎒 Andra Kurser

Vårt team producerar andra kurser! Kolla in:

- [**NY** Model Context Protocol (MCP) För Nybörjare](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI-agenter för Nybörjare](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generativ AI för Nybörjare med .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generativ AI för Nybörjare](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generativ AI för Nybörjare med Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML för Nybörjare](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science för Nybörjare](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI för Nybörjare](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cybersäkerhet för Nybörjare](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Webbutveckling för nybörjare](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT för nybörjare](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR-utveckling för nybörjare](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Bemästra GitHub Copilot för AI-parprogrammering](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Bemästra GitHub Copilot för C#/.NET-utvecklare](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Välj ditt eget Copilot-äventyr](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**Navigering**
- **Nästa lektion**: [AZD-grunder](docs/getting-started/azd-basics.md)

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som kan uppstå vid användning av denna översättning.
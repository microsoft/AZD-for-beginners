<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c0984265b7a9357388f864c19606c80d",
  "translation_date": "2025-09-11T10:03:43+00:00",
  "source_file": "README.md",
  "language_code": "sv"
}
-->
# AZD För Nybörjare

![AZD-för-nybörjare](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.sv.png) 

Följ dessa steg för att komma igång med dessa resurser:
1. **Forka Repositoriet**: Klicka [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klona Repositoriet**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Gå med i Azure Discord Communities och träffa experter och andra utvecklare**](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Stöd för flera språk

#### Stöds via GitHub Action (Automatiserat & Alltid Uppdaterat)

[Franska](../fr/README.md) | [Spanska](../es/README.md) | [Tyska](../de/README.md) | [Ryska](../ru/README.md) | [Arabiska](../ar/README.md) | [Persiska (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Kinesiska (Förenklad)](../zh/README.md) | [Kinesiska (Traditionell, Macau)](../mo/README.md) | [Kinesiska (Traditionell, Hong Kong)](../hk/README.md) | [Kinesiska (Traditionell, Taiwan)](../tw/README.md) | [Japanska](../ja/README.md) | [Koreanska](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portugisiska (Portugal)](../pt/README.md) | [Portugisiska (Brasilien)](../br/README.md) | [Italienska](../it/README.md) | [Polska](../pl/README.md) | [Turkiska](../tr/README.md) | [Grekiska](../el/README.md) | [Thailändska](../th/README.md) | [Svenska](./README.md) | [Danska](../da/README.md) | [Norska](../no/README.md) | [Finska](../fi/README.md) | [Holländska](../nl/README.md) | [Hebreiska](../he/README.md) | [Vietnamesiska](../vi/README.md) | [Indonesiska](../id/README.md) | [Malajiska](../ms/README.md) | [Tagalog (Filippinska)](../tl/README.md) | [Swahili](../sw/README.md) | [Ungerska](../hu/README.md) | [Tjeckiska](../cs/README.md) | [Slovakiska](../sk/README.md) | [Rumänska](../ro/README.md) | [Bulgariska](../bg/README.md) | [Serbiska (Kyrilliska)](../sr/README.md) | [Kroatiska](../hr/README.md) | [Slovenska](../sl/README.md) | [Ukrainska](../uk/README.md) | [Burmesiska (Myanmar)](../my/README.md)

**Om du vill ha ytterligare översättningar finns stödda språk listade [här](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Introduktion

Välkommen till den omfattande guiden för Azure Developer CLI (azd). Detta repository är utformat för att hjälpa utvecklare på alla nivåer, från studenter till professionella utvecklare, att lära sig och bemästra Azure Developer CLI för effektiva molndistributioner. Denna strukturerade inlärningsresurs ger praktisk erfarenhet av Azure-molndistributioner, felsökning av vanliga problem och implementering av bästa praxis för framgångsrika AZD-malldistributioner.

## Inlärningsmål

Genom att arbeta igenom detta repository kommer du att:
- Bemästra grunderna och kärnkoncepten för Azure Developer CLI
- Lära dig att distribuera och tillhandahålla Azure-resurser med Infrastructure as Code
- Utveckla färdigheter för att felsöka vanliga problem med AZD-distributioner
- Förstå validering före distribution och kapacitetsplanering
- Implementera säkerhetsbästa praxis och kostnadsoptimeringsstrategier
- Bygga självförtroende i att distribuera produktionsklara applikationer till Azure

## Inlärningsresultat

Efter att ha avslutat denna kurs kommer du att kunna:
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

Azure Developer CLI (azd) är ett utvecklarfokuserat kommandoradsverktyg som påskyndar processen att bygga och distribuera applikationer till Azure. Det erbjuder:

- **Mallbaserade distributioner** - Använd förbyggda mallar för vanliga applikationsmönster
- **Infrastructure as Code** - Hantera Azure-resurser med Bicep eller Terraform
- **Integrerade arbetsflöden** - Smidigt tillhandahåll, distribuera och övervaka applikationer
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

### Din första distribution
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

## Dokumentation

### Kom igång
- [**AZD Grunder**](docs/getting-started/azd-basics.md) - Kärnkoncept och terminologi
- [**Installation & Setup**](docs/getting-started/installation.md) - Plattformsspecifika installationsguider
- [**Konfiguration**](docs/getting-started/configuration.md) - Miljöinställningar och autentisering
- [**Ditt första projekt**](docs/getting-started/first-project.md) - Steg-för-steg handledning

### Distribution & Tillhandahållande
- [**Distributionsguide**](docs/deployment/deployment-guide.md) - Kompletta distributionsarbetsflöden
- [**Tillhandahållande av resurser**](docs/deployment/provisioning.md) - Hantering av Azure-resurser

### Kontroller före distribution
- [**Kapacitetsplanering**](docs/pre-deployment/capacity-planning.md) - Validering av Azure-resurskapacitet
- [**SKU-val**](docs/pre-deployment/sku-selection.md) - Välja rätt Azure-SKUs
- [**Kontroller före flygning**](docs/pre-deployment/preflight-checks.md) - Automatiserade valideringsskript

### Felsökning
- [**Vanliga problem**](docs/troubleshooting/common-issues.md) - Vanligt förekommande problem och lösningar
- [**Felsökningsguide**](docs/troubleshooting/debugging.md) - Steg-för-steg felsökningsstrategier

## Exempel & Mallar
- [**Exempel**]([examples/README.md) - Praktiska exempel, mallar och verkliga scenarier för att hjälpa dig att lära dig Azure Developer CLI genom praktisk övning. Varje exempel innehåller komplett fungerande kod, infrastruktursmallar och detaljerade instruktioner för olika applikationsarkitekturer och distributionsmönster.

### Praktisk Lab/Workshop
- [**AZD För Nybörjare**](workshop/README.md) - Denna workshop fokuserar på att komma igång med AI Agents AZD-mallen och ger praktiska bästa praxis för distribution av Azure AI-tjänster med AZD.

## Resurser

### Snabba Referenser
- [**Kommandosnabbguide**](resources/cheat-sheet.md) - Viktiga azd-kommandon
- [**Ordlista**](resources/glossary.md) - Azure och azd-terminologi
- [**FAQ**](resources/faq.md) - Vanliga frågor
- [**Studieguide**](resources/study-guide.md) - Omfattande inlärningsmål och övningar

### Externa Resurser
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Priskalkylator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

## Inlärningsväg

### För Studenter & Nybörjare
1. Börja med [AZD Grunder](docs/getting-started/azd-basics.md)
2. Följ [Installationsguiden](docs/getting-started/installation.md)
3. Slutför [Ditt första projekt](docs/getting-started/first-project.md)
4. Öva med [Enkel Webbapplikation Exempel](../../examples/simple-web-app)

### För Utvecklare
1. Granska [Konfigurationsguiden](docs/getting-started/configuration.md)
2. Studera [Distributionsguiden](docs/deployment/deployment-guide.md)
3. Arbeta igenom [Databasapplikation Exempel](../../examples/database-app)
4. Utforska [Containerapplikation Exempel](../../examples/container-app)

### För DevOps Ingenjörer
1. Bemästra [Tillhandahållande av resurser](docs/deployment/provisioning.md)
2. Implementera [Kontroller före flygning](docs/pre-deployment/preflight-checks.md)
3. Öva [Kapacitetsplanering](docs/pre-deployment/capacity-planning.md)
4. Avancerat [Mikrotjänster Exempel](../../examples/microservices)

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
- **Microsoft Learn**: [Officiell Azure Developer CLI dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

## Licens

Detta projekt är licensierat under MIT-licensen - se [LICENSE](../../LICENSE) för detaljer.

## 🎒 Andra Kurser

Vårt team producerar andra kurser! Kolla in:

- [**NY** Model Context Protocol (MCP) För Nybörjare](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agents För Nybörjare](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generativ AI För Nybörjare med .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generativ AI För Nybörjare](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generativ AI För Nybörjare med Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML För Nybörjare](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science För Nybörjare](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI För Nybörjare](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cybersäkerhet För Nybörjare](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Webbutveckling För Nybörjare](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
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
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör du vara medveten om att automatiska översättningar kan innehålla fel eller inexaktheter. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
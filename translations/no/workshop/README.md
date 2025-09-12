<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T21:59:52+00:00",
  "source_file": "workshop/README.md",
  "language_code": "no"
}
-->
# AZD for AI-utviklere Workshop

**Forrige:** [AI Feilsøkingsguide](../docs/troubleshooting/ai-troubleshooting.md) | **Neste:** [Workshop Lab-moduler](../../../workshop)

Velkommen til en praktisk workshop for å lære Azure Developer CLI (AZD) med fokus på utrulling av AI-applikasjoner. Denne workshopen er designet for å ta deg fra grunnleggende AZD til å implementere produksjonsklare AI-løsninger.

## Workshopoversikt

**Varighet:** 2-3 timer  
**Nivå:** Nybegynner til middels  
**Forutsetninger:** Grunnleggende kunnskap om Azure, kommandolinjeverktøy og AI-konsepter

### Hva du vil lære

- **AZD Grunnleggende**: Forstå Infrastructure as Code med AZD
- 🤖 **AI-tjenesteintegrasjon**: Implementere Azure OpenAI, AI Search og andre AI-tjenester
- **Containerutrulling**: Bruke Azure Container Apps for AI-applikasjoner
- **Sikkerhetspraksis**: Implementere Managed Identity og sikre konfigurasjoner
- **Overvåking og observasjon**: Sette opp Application Insights for AI-arbeidsbelastninger
- **Produksjonsmønstre**: Utrullingsstrategier klare for bedrifter

## Workshopstruktur

### Modul 1: AZD Grunnleggende (30 minutter)
- Installere og konfigurere AZD
- Forstå AZD-prosjektstruktur
- Din første AZD-utrulling
- **Lab**: Implementere en enkel webapplikasjon

### Modul 2: Azure OpenAI-integrasjon (45 minutter)
- Sette opp Azure OpenAI-ressurser
- Strategier for modellutrulling
- Konfigurere API-tilgang og autentisering
- **Lab**: Implementere en chatapplikasjon med GPT-4

### Modul 3: RAG-applikasjoner (45 minutter)
- Integrasjon med Azure AI Search
- Dokumentbehandling med Azure Document Intelligence
- Vektorinnbygging og semantisk søk
- **Lab**: Bygge et dokument Q&A-system

### Modul 4: Produksjonsutrulling (30 minutter)
- Konfigurasjon av Container Apps
- Skalering og ytelsesoptimalisering
- Overvåking og logging
- **Lab**: Utrulling til produksjon med observasjon

### Modul 5: Avanserte mønstre (15 minutter)
- Utrulling i flere miljøer
- CI/CD-integrasjon
- Kostnadsoptimaliseringsstrategier
- **Oppsummering**: Sjekkliste for produksjonsklarhet

## Forutsetninger

### Nødvendige verktøy

Vennligst installer disse verktøyene før workshopen:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Azure-kontooppsett

1. **Azure-abonnement**: [Registrer deg gratis](https://azure.microsoft.com/free/)  
2. **Azure OpenAI-tilgang**: [Be om tilgang](https://aka.ms/oai/access)  
3. **Nødvendige tillatelser**:  
   - Bidragsyterrolle på abonnement eller ressursgruppe  
   - Brukertilgangsadministrator (for RBAC-tildelinger)  

### Verifiser forutsetninger

Kjør dette skriptet for å verifisere oppsettet ditt:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## Workshopmaterialer

### Labøvelser

Hver modul inkluderer praktiske laber med startkode og trinnvise instruksjoner:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Din første AZD-utrulling  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Chatapplikasjon med Azure OpenAI  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - RAG-applikasjon med AI Search  
- **[lab-4-production/](../../../workshop/lab-4-production)** - Produksjonsutrullingsmønstre  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Avanserte utrullingsscenarier  

### Referansematerialer

- **[AI Foundry Integrasjonsguide](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Omfattende integrasjonsmønstre  
- **[AI Modellutrullingsguide](../docs/ai-foundry/ai-model-deployment.md)** - Beste praksis for modellutrulling  
- **[Produksjons-AI-praksis](../docs/ai-foundry/production-ai-practices.md)** - Utrullingsmønstre for bedrifter  
- **[AI Feilsøkingsguide](../docs/troubleshooting/ai-troubleshooting.md)** - Vanlige problemer og løsninger  

### Eksempelmaler

Hurtigstartmaler for vanlige AI-scenarier:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Kom i gang

### Alternativ 1: GitHub Codespaces (Anbefalt)

Den raskeste måten å starte workshopen på:

[![Åpne i GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Alternativ 2: Lokal utvikling

1. **Klon workshop-repositoriet:**  
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Logg inn på Azure:**  
```bash
az login
azd auth login
```

3. **Start med Lab 1:**  
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Alternativ 3: Instruktørledet workshop

Hvis du deltar på en instruktørledet sesjon:

- 🎥 **Workshopopptak**: [Tilgjengelig på forespørsel](https://aka.ms/azd-ai-workshop)  
- 💬 **Discord-fellesskap**: [Bli med for live support](https://aka.ms/foundry/discord)  
- **Workshoptilbakemelding**: [Del din erfaring](https://aka.ms/azd-workshop-feedback)  

## Workshop tidslinje

### Selvstyrt læring (3 timer)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Instruktørledet sesjon (2,5 timer)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## Suksesskriterier

Ved slutten av denne workshopen vil du kunne:

✅ **Implementere AI-applikasjoner** ved hjelp av AZD-maler  
✅ **Konfigurere Azure OpenAI**-tjenester med riktig sikkerhet  
✅ **Bygge RAG-applikasjoner** med Azure AI Search-integrasjon  
✅ **Implementere produksjonsmønstre** for AI-arbeidsbelastninger i bedrifter  
✅ **Overvåke og feilsøke** AI-applikasjonsutrullinger  
✅ **Bruke kostnadsoptimalisering** for AI-arbeidsbelastninger  

## Fellesskap og støtte

### Under workshopen

- 🙋 **Spørsmål**: Bruk workshopchat eller rekke opp hånden  
- 🐛 **Problemer**: Sjekk [feilsøkingsguiden](../docs/troubleshooting/ai-troubleshooting.md)  
- **Tips**: Del oppdagelser med andre deltakere  

### Etter workshopen

- 💬 **Discord**: [Azure AI Foundry-fellesskap](https://aka.ms/foundry/discord)  
- **GitHub Issues**: [Rapporter malproblemer](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **Tilbakemelding**: [Workshop evalueringsskjema](https://aka.ms/azd-workshop-feedback)  

## Neste steg

### Fortsett læringen

1. **Avanserte scenarier**: Utforsk [utrulling i flere regioner](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)  
2. **CI/CD-integrasjon**: Sett opp [GitHub Actions arbeidsflyter](../docs/deployment/github-actions.md)  
3. **Egendefinerte maler**: Lag dine egne [AZD-maler](../docs/getting-started/custom-templates.md)  

### Bruk i dine prosjekter

1. **Vurdering**: Bruk vår [sjekkliste for klarhet](./production-readiness-checklist.md)  
2. **Maler**: Start med våre [AI-spesifikke maler](../../../workshop/templates)  
3. **Støtte**: Bli med i [Azure AI Foundry Discord](https://aka.ms/foundry/discord)  

### Del din suksess

- ⭐ **Gi stjerne til repositoriet** hvis denne workshopen hjalp deg  
- 🐦 **Del på sosiale medier** med #AzureDeveloperCLI #AzureAI  
- 📝 **Skriv et blogginnlegg** om din AI-utrullingsreise  

---

## Workshoptilbakemelding

Din tilbakemelding hjelper oss med å forbedre workshopopplevelsen:

| Aspekt | Vurdering (1-5) | Kommentarer |
|--------|-----------------|-------------|
| Kvalitet på innhold | ⭐⭐⭐⭐⭐ | |
| Praktiske laber | ⭐⭐⭐⭐⭐ | |
| Dokumentasjon | ⭐⭐⭐⭐⭐ | |
| Vanskelighetsnivå | ⭐⭐⭐⭐⭐ | |
| Totalopplevelse | ⭐⭐⭐⭐⭐ | |

**Send inn tilbakemelding**: [Workshop evalueringsskjema](https://aka.ms/azd-workshop-feedback)

---

**Forrige:** [AI Feilsøkingsguide](../docs/troubleshooting/ai-troubleshooting.md) | **Neste:** Start med [Lab 1: AZD Grunnleggende](../../../workshop/lab-1-azd-basics)

**Klar til å begynne å bygge AI-applikasjoner med AZD?**

[Start Lab 1: AZD Grunnleggende →](./lab-1-azd-basics/README.md)

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
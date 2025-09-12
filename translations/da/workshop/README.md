<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T21:59:30+00:00",
  "source_file": "workshop/README.md",
  "language_code": "da"
}
-->
# AZD for AI-udviklere Workshop

**Forrige:** [AI Fejlfindingsguide](../docs/troubleshooting/ai-troubleshooting.md) | **Næste:** [Workshop Lab-moduler](../../../workshop)

Velkommen til den praktiske workshop, hvor du lærer Azure Developer CLI (AZD) med fokus på udrulning af AI-applikationer. Denne workshop er designet til at tage dig fra AZD-grundlæggende til udrulning af produktionsklare AI-løsninger.

## Workshopoversigt

**Varighed:** 2-3 timer  
**Niveau:** Begynder til mellemniveau  
**Forudsætninger:** Grundlæggende kendskab til Azure, kommandolinjeværktøjer og AI-koncepter

### Hvad du vil lære

- **AZD Grundlæggende**: Forståelse af Infrastructure as Code med AZD
- 🤖 **AI Service Integration**: Udrulning af Azure OpenAI, AI Search og andre AI-tjenester
- **Containerudrulning**: Brug af Azure Container Apps til AI-applikationer
- **Sikkerhedsprincipper**: Implementering af Managed Identity og sikre konfigurationer
- **Overvågning & Observabilitet**: Opsætning af Application Insights til AI-arbejdsbelastninger
- **Produktionsmønstre**: Udrulningsstrategier klar til virksomheder

## Workshopstruktur

### Modul 1: AZD Grundlæggende (30 minutter)
- Installation og konfiguration af AZD
- Forståelse af AZD-projektstruktur
- Din første AZD-udrulning
- **Lab**: Udrul en simpel webapplikation

### Modul 2: Azure OpenAI Integration (45 minutter)
- Opsætning af Azure OpenAI-ressourcer
- Strategier for modeludrulning
- Konfiguration af API-adgang og autentifikation
- **Lab**: Udrul en chatapplikation med GPT-4

### Modul 3: RAG-applikationer (45 minutter)
- Integration af Azure AI Search
- Dokumentbehandling med Azure Document Intelligence
- Vektorindlejring og semantisk søgning
- **Lab**: Byg et dokument Q&A-system

### Modul 4: Produktionsudrulning (30 minutter)
- Konfiguration af Container Apps
- Skalering og optimering af ydeevne
- Overvågning og logning
- **Lab**: Udrul til produktion med observabilitet

### Modul 5: Avancerede Mønstre (15 minutter)
- Udrulning i flere miljøer
- CI/CD-integration
- Strategier for omkostningsoptimering
- **Afslutning**: Produktionsklarhedstjekliste

## Forudsætninger

### Nødvendige værktøjer

Installér venligst disse værktøjer før workshoppen:

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

### Azure-kontoopsætning

1. **Azure-abonnement**: [Tilmeld dig gratis](https://azure.microsoft.com/free/)  
2. **Azure OpenAI-adgang**: [Anmod om adgang](https://aka.ms/oai/access)  
3. **Nødvendige tilladelser**:  
   - Contributor-rolle på abonnement eller ressourcegruppe  
   - User Access Administrator (til RBAC-tildelinger)  

### Verificér forudsætninger

Kør dette script for at verificere din opsætning:

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

### Lab-øvelser

Hvert modul inkluderer praktiske labs med startkode og trin-for-trin instruktioner:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Din første AZD-udrulning  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Chatapplikation med Azure OpenAI  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - RAG-applikation med AI Search  
- **[lab-4-production/](../../../workshop/lab-4-production)** - Produktionsudrulningsmønstre  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Avancerede udrulningsscenarier  

### Referencematerialer

- **[AI Foundry Integration Guide](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Omfattende integrationsmønstre  
- **[AI Model Deployment Guide](../docs/ai-foundry/ai-model-deployment.md)** - Bedste praksis for modeludrulning  
- **[Production AI Practices](../docs/ai-foundry/production-ai-practices.md)** - Udrulningsmønstre for virksomheder  
- **[AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md)** - Almindelige problemer og løsninger  

### Eksempeltemplates

Hurtigstarttemplates til almindelige AI-scenarier:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Kom godt i gang

### Mulighed 1: GitHub Codespaces (Anbefalet)

Den hurtigste måde at starte workshoppen på:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Mulighed 2: Lokal udvikling

1. **Klon workshop-repositoriet:**  
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Log ind på Azure:**  
```bash
az login
azd auth login
```

3. **Start med Lab 1:**  
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Mulighed 3: Instruktørledet workshop

Hvis du deltager i en instruktørledet session:

- 🎥 **Workshopoptagelse**: [Tilgængelig on-demand](https://aka.ms/azd-ai-workshop)  
- 💬 **Discord-fællesskab**: [Deltag for live support](https://aka.ms/foundry/discord)  
- **Workshopfeedback**: [Del din oplevelse](https://aka.ms/azd-workshop-feedback)  

## Workshop-tidslinje

### Selvstudie (3 timer)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Instruktørledet session (2,5 timer)

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

## Succeskriterier

Ved afslutningen af denne workshop vil du kunne:

✅ **Udrulle AI-applikationer** ved hjælp af AZD-templates  
✅ **Konfigurere Azure OpenAI**-tjenester med korrekt sikkerhed  
✅ **Bygge RAG-applikationer** med Azure AI Search-integration  
✅ **Implementere produktionsmønstre** for AI-arbejdsbelastninger i virksomheder  
✅ **Overvåge og fejlfinde** AI-applikationsudrulninger  
✅ **Anvende omkostningsoptimering** strategier for AI-arbejdsbelastninger  

## Fællesskab & Support

### Under workshoppen

- 🙋 **Spørgsmål**: Brug workshopchatten eller ræk hånden op  
- 🐛 **Problemer**: Tjek [fejlfindingsguiden](../docs/troubleshooting/ai-troubleshooting.md)  
- **Tips**: Del opdagelser med andre deltagere  

### Efter workshoppen

- 💬 **Discord**: [Azure AI Foundry Community](https://aka.ms/foundry/discord)  
- **GitHub Issues**: [Rapportér templateproblemer](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **Feedback**: [Workshop-evalueringsformular](https://aka.ms/azd-workshop-feedback)  

## Næste skridt

### Fortsæt læringen

1. **Avancerede scenarier**: Udforsk [multi-region udrulninger](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)  
2. **CI/CD Integration**: Opsæt [GitHub Actions workflows](../docs/deployment/github-actions.md)  
3. **Custom Templates**: Opret dine egne [AZD-templates](../docs/getting-started/custom-templates.md)  

### Anvend i dine projekter

1. **Vurdering**: Brug vores [klarhedstjekliste](./production-readiness-checklist.md)  
2. **Templates**: Start med vores [AI-specifikke templates](../../../workshop/templates)  
3. **Support**: Deltag i [Azure AI Foundry Discord](https://aka.ms/foundry/discord)  

### Del din succes

- ⭐ **Stjernemarkér repositoriet**, hvis denne workshop hjalp dig  
- 🐦 **Del på sociale medier** med #AzureDeveloperCLI #AzureAI  
- 📝 **Skriv et blogindlæg** om din AI-udrulningsrejse  

---

## Workshopfeedback

Din feedback hjælper os med at forbedre workshopoplevelsen:

| Aspekt | Bedømmelse (1-5) | Kommentarer |
|--------|------------------|-------------|
| Kvalitet af indhold | ⭐⭐⭐⭐⭐ | |
| Praktiske labs | ⭐⭐⭐⭐⭐ | |
| Dokumentation | ⭐⭐⭐⭐⭐ | |
| Sværhedsgrad | ⭐⭐⭐⭐⭐ | |
| Overordnet oplevelse | ⭐⭐⭐⭐⭐ | |

**Indsend feedback**: [Workshop-evalueringsformular](https://aka.ms/azd-workshop-feedback)

---

**Forrige:** [AI Fejlfindingsguide](../docs/troubleshooting/ai-troubleshooting.md) | **Næste:** Start med [Lab 1: AZD Grundlæggende](../../../workshop/lab-1-azd-basics)

**Klar til at begynde at bygge AI-applikationer med AZD?**

[Start Lab 1: AZD Grundlæggende →](./lab-1-azd-basics/README.md)

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
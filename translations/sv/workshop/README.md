<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be2a85ad63abe28f2eb71ba3f3800272",
  "translation_date": "2025-09-17T23:18:05+00:00",
  "source_file": "workshop/README.md",
  "language_code": "sv"
}
-->
# AZD för AI-utvecklare Workshop

**Workshop Navigering**
- **📚 Kursens startsida**: [AZD För Nybörjare](../README.md)
- **📖 Relaterade kapitel**: Täcker [Kapitel 1](../README.md#-chapter-1-foundation--quick-start), [Kapitel 2](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers), och [Kapitel 5](../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **🛠️ Praktisk Lab**: [AI Workshop Lab](../docs/ai-foundry/ai-workshop-lab.md)
- **🚀 Nästa steg**: [Workshop Lab Moduler](../../../workshop)

Välkommen till den praktiska workshopen för att lära dig Azure Developer CLI (AZD) med fokus på att distribuera AI-applikationer. Denna workshop är utformad för att ta dig från grunderna i AZD till att distribuera produktionsklara AI-lösningar.

## Workshop Översikt

**Varaktighet:** 2-3 timmar  
**Nivå:** Nybörjare till Mellanliggande  
**Förkunskaper:** Grundläggande kunskaper om Azure, kommandoradsverktyg och AI-koncept

### Vad du kommer att lära dig

- **AZD Grunder**: Förstå Infrastruktur som Kod med AZD
- 🤖 **AI-tjänstintegration**: Distribuera Azure OpenAI, AI Search och andra AI-tjänster
- **Containerdistribution**: Använda Azure Container Apps för AI-applikationer
- **Säkerhetsbästa praxis**: Implementera Managed Identity och säkra konfigurationer
- **Övervakning & Observabilitet**: Ställa in Application Insights för AI-arbetsbelastningar
- **Produktionsmönster**: Strategier för företagsklara distributioner

## Workshop Struktur

### Modul 1: AZD Grunder (30 minuter)
- Installera och konfigurera AZD
- Förstå AZD-projektstruktur
- Din första AZD-distribution
- **Lab**: Distribuera en enkel webbapplikation

### Modul 2: Azure OpenAI Integration (45 minuter)
- Ställa in Azure OpenAI-resurser
- Strategier för modelldistribution
- Konfigurera API-åtkomst och autentisering
- **Lab**: Distribuera en chattapplikation med GPT-4

### Modul 3: RAG-applikationer (45 minuter)
- Integration med Azure AI Search
- Dokumentbearbetning med Azure Document Intelligence
- Vektorrepresentationer och semantisk sökning
- **Lab**: Bygg ett dokument Q&A-system

### Modul 4: Produktionsdistribution (30 minuter)
- Konfiguration av Container Apps
- Skalning och prestandaoptimering
- Övervakning och loggning
- **Lab**: Distribuera till produktion med observabilitet

### Modul 5: Avancerade mönster (15 minuter)
- Distributioner för flera miljöer
- CI/CD-integration
- Kostnadsoptimeringsstrategier
- **Sammanfattning**: Checklista för produktionsberedskap

## Förkunskaper

### Nödvändiga Verktyg

Installera dessa verktyg innan workshopen:

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

### Azure Konto Setup

1. **Azure-abonnemang**: [Registrera dig gratis](https://azure.microsoft.com/free/)
2. **Azure OpenAI-åtkomst**: [Begär åtkomst](https://aka.ms/oai/access)
3. **Nödvändiga behörigheter**:
   - Contributor-roll på abonnemang eller resursgrupp
   - User Access Administrator (för RBAC-uppdrag)

### Verifiera Förkunskaper

Kör detta skript för att verifiera din setup:

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

## Workshop Material

### Lab Övningar

Varje modul innehåller praktiska labb med startkod och steg-för-steg-instruktioner:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Din första AZD-distribution
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Chattapplikation med Azure OpenAI
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - RAG-applikation med AI Search
- **[lab-4-production/](../../../workshop/lab-4-production)** - Produktionsdistributionsmönster
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Avancerade distributionsscenarier

### Referensmaterial

- **[AI Foundry Integration Guide](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Omfattande integrationsmönster
- **[AI Model Deployment Guide](../docs/ai-foundry/ai-model-deployment.md)** - Bästa praxis för modelldistribution
- **[Production AI Practices](../docs/ai-foundry/production-ai-practices.md)** - Företagsdistributionsmönster
- **[AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md)** - Vanliga problem och lösningar

### Exempelmallar

Snabbstartsmallar för vanliga AI-scenarier:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Kom igång

### Alternativ 1: GitHub Codespaces (Rekommenderas)

Det snabbaste sättet att starta workshopen:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Alternativ 2: Lokal Utveckling

1. **Klona workshop-repositoryt:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Logga in på Azure:**
```bash
az login
azd auth login
```

3. **Börja med Lab 1:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Alternativ 3: Instruktörsledd Workshop

Om du deltar i en instruktörsledd session:

- 🎥 **Workshop Inspelning**: [Tillgänglig på begäran](https://aka.ms/azd-ai-workshop)
- 💬 **Discord Community**: [Gå med för live support](https://aka.ms/foundry/discord)
- **Workshop Feedback**: [Dela din upplevelse](https://aka.ms/azd-workshop-feedback)

## Workshop Tidslinje

### Självstudier (3 timmar)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Instruktörsledd Session (2,5 timmar)

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

## Framgångskriterier

I slutet av denna workshop kommer du att kunna:

✅ **Distribuera AI-applikationer** med AZD-mallar  
✅ **Konfigurera Azure OpenAI**-tjänster med korrekt säkerhet  
✅ **Bygga RAG-applikationer** med integration av Azure AI Search  
✅ **Implementera produktionsmönster** för företags AI-arbetsbelastningar  
✅ **Övervaka och felsöka** AI-applikationsdistributioner  
✅ **Tillämpa kostnadsoptimeringsstrategier** för AI-arbetsbelastningar  

## Community & Support

### Under Workshopen

- 🙋 **Frågor**: Använd workshop-chatten eller räck upp handen
- 🐛 **Problem**: Kolla [felsökningsguiden](../docs/troubleshooting/ai-troubleshooting.md)
- **Tips**: Dela upptäckter med andra deltagare

### Efter Workshopen

- 💬 **Discord**: [Azure AI Foundry Community](https://aka.ms/foundry/discord)
- **GitHub Issues**: [Rapportera mallproblem](https://github.com/YOUR_ORG/AZD-for-beginners/issues)
- 📧 **Feedback**: [Workshop utvärderingsformulär](https://aka.ms/azd-workshop-feedback)

## Nästa Steg

### Fortsätt Lärandet

1. **Avancerade Scenarier**: Utforska [distributioner för flera regioner](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)
2. **CI/CD Integration**: Ställ in [GitHub Actions arbetsflöden](../docs/deployment/github-actions.md)
3. **Egna Mallar**: Skapa dina egna [AZD-mallar](../docs/getting-started/custom-templates.md)

### Tillämpa i Dina Projekt

1. **Bedömning**: Använd vår [beredskapschecklista](./production-readiness-checklist.md)
2. **Mallar**: Börja med våra [AI-specifika mallar](../../../workshop/templates)
3. **Support**: Gå med i [Azure AI Foundry Discord](https://aka.ms/foundry/discord)

### Dela Din Framgång

- ⭐ **Stjärnmärk repositoryt** om denna workshop hjälpte dig
- 🐦 **Dela på sociala medier** med #AzureDeveloperCLI #AzureAI
- 📝 **Skriv ett blogginlägg** om din AI-distributionsresa

---

## Workshop Feedback

Din feedback hjälper oss att förbättra workshopupplevelsen:

| Aspekt | Betyg (1-5) | Kommentarer |
|--------|--------------|----------|
| Kvalitet på innehåll | ⭐⭐⭐⭐⭐ | |
| Praktiska labb | ⭐⭐⭐⭐⭐ | |
| Dokumentation | ⭐⭐⭐⭐⭐ | |
| Svårighetsnivå | ⭐⭐⭐⭐⭐ | |
| Övergripande upplevelse | ⭐⭐⭐⭐⭐ | |

**Skicka feedback**: [Workshop Utvärderingsformulär](https://aka.ms/azd-workshop-feedback)

---

**Föregående:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **Nästa:** Börja med [Lab 1: AZD Grunder](../../../workshop/lab-1-azd-basics)

**Redo att börja bygga AI-applikationer med AZD?**

[Börja Lab 1: AZD Grunder →](./lab-1-azd-basics/README.md)

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiska översättningar kan innehålla fel eller inexaktheter. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
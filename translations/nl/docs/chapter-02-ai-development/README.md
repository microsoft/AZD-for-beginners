# Hoofdstuk 2: AI-First Ontwikkeling

**📚 Cursus**: [AZD Voor Beginners](../../README.md) | **⏱️ Duur**: 1-2 uur | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk richt zich op het implementeren van AI-gedreven applicaties met behulp van Azure Developer CLI en Microsoft Foundry diensten. Van eenvoudige AI-chatapps tot intelligente agenten met tools.

> **Validatienotitie (2026-07-13):** De commandoflow en extensierichtlijnen in dit hoofdstuk zijn gecontroleerd tegen `azd` `1.27.1` en de huidige preview AI-agent extensie release `azure.ai.agents` `1.0.0-beta.5`. Als je een oudere AZD-versie gebruikt, update dan eerst en ga daarna verder met de oefeningen.

## Leerdoelen

Door dit hoofdstuk te voltooien, zul je:
- AI-toepassingen implementeren met vooraf gebouwde AZD-sjablonen
- Microsoft Foundry integratie met AZD begrijpen
- AI-agenten met tools configureren en aanpassen
- RAG (Retrieval-Augmented Generation) applicaties implementeren

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integratie](microsoft-foundry-integration.md) | Verbind AZD met Foundry-diensten | 30 min |
| 2 | [AI Agenten Gids](agents.md) | Implementeer intelligente agenten met tools | 45 min |
| 3 | [AI Model Implementatie](ai-model-deployment.md) | Implementeer en configureer AI-modellen | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktijk: Maak je AI-oplossing AZD-klaar | 60 min |

---

## 🚀 Snelle Start

```bash
# Optie 1: RAG Chat Applicatie
azd init --template azure-search-openai-demo
azd up

# Optie 2: AI Agenten
azd init --template get-started-with-ai-agents
azd up

# Optie 3: Snelle Chat App
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Uitgelichte AI Sjablonen

| Sjabloon | Beschrijving | Diensten |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-chat met citaties | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agent met tools | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Basis AI-chat | OpenAI + Container Apps |

---

## 💰 Kostenbewustzijn

| Omgeving | Geschatte Maandelijkse Kosten |
|-------------|----------------------|
| Ontwikkeling | $80-150 |
| Acceptatie | $150-300 |
| Productie | $300-3.500+ |

**Tip:** Voer `azd down` uit na het testen om kosten te vermijden.

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 1: Fundament](../chapter-01-foundation/README.md) |
| **Volgende** | [Hoofdstuk 3: Configuratie](../chapter-03-configuration/README.md) |
| **Overslaan naar** | [Hoofdstuk 8: Productiepatronen](../chapter-08-production/README.md) |

---

## 📖 Gerelateerde Bronnen

- [AI Probleemoplossing](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Productie AI Praktijken](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
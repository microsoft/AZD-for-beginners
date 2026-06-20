# Hoofdstuk 2: AI-First-ontwikkeling

**📚 Cursus**: [AZD voor Beginners](../../README.md) | **⏱️ Duur**: 1-2 hours | **⭐ Complexiteit**: Intermediate

---

## Overzicht

This chapter focuses on deploying AI-powered applications using Azure Developer CLI and Microsoft Foundry services. From simple AI chat apps to intelligent agents with tools.

> **Validatienota (2026-06-15):** The command flow and extension guidance in this chapter were reviewed against `azd` `1.25.6` and the current preview AI agent extension release `azure.ai.agents` `0.1.40-preview`. If you are on an older AZD build, update first and then continue with the exercises.

## Leerdoelen

Door dit hoofdstuk te voltooien, zul je:
- Implementeer AI-toepassingen met vooraf gebouwde AZD-sjablonen
- Begrijp de integratie van Microsoft Foundry met AZD
- Configureer en pas AI-agenten aan met tools
- Implementeer RAG (Retrieval-Augmented Generation)-toepassingen

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Verbind AZD met Foundry-diensten | 30 min |
| 2 | [AI Agents Guide](agents.md) | Implementeer slimme agenten met tools | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Implementeer en configureer AI-modellen | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Hands-on: Maak je AI-oplossing AZD-klaar | 60 min |

---

## 🚀 Snelstart

```bash
# Optie 1: RAG-chatapplicatie
azd init --template azure-search-openai-demo
azd up

# Optie 2: AI-agenten
azd init --template get-started-with-ai-agents
azd up

# Optie 3: Snelle chat-app
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Uitgelichte AI-sjablonen

| Sjabloon | Beschrijving | Diensten |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-chat met citaties | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agent met tools | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Basis AI-chat | OpenAI + Container Apps |

---

## 💰 Kostenbewustzijn

| Omgeving | Geschatte Maandelijkse Kosten |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Tip:** Voer `azd down` uit na het testen om kosten te voorkomen.

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 1: Basis](../chapter-01-foundation/README.md) |
| **Volgende** | [Hoofdstuk 3: Configuratie](../chapter-03-configuration/README.md) |
| **Sla over naar** | [Hoofdstuk 8: Productiepatronen](../chapter-08-production/README.md) |

---

## 📖 Gerelateerde bronnen

- [AI-probleemoplossing](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [AI-praktijken voor productie](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
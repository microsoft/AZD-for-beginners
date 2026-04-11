# Hoofdstuk 2: AI-first ontwikkeling

**📚 Cursus**: [AZD For Beginners](../../README.md) | **⏱️ Duur**: 1-2 uur | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk richt zich op het inzetten van AI-aangedreven toepassingen met behulp van Azure Developer CLI en Microsoft Foundry-diensten. Van eenvoudige AI-chatapps tot intelligente agents met tools.

> **Validation note (2026-03-25):** The command flow and extension guidance in this chapter were reviewed against `azd` `1.23.12` and the current preview AI agent extension release `azure.ai.agents` `0.1.18-preview`. If you are on an older AZD build, update first and then continue with the exercises.

## Leerdoelen

Na het voltooien van dit hoofdstuk:
- Implementeer AI-toepassingen met kant-en-klare AZD-sjablonen
- Begrijp de integratie van Microsoft Foundry met AZD
- Configureer en pas AI-agents met tools aan
- Implementeer RAG (Retrieval-Augmented Generation) toepassingen

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Integratie met Microsoft Foundry](microsoft-foundry-integration.md) | Verbind AZD met Foundry-services | 30 min |
| 2 | [Gids voor AI-agents](agents.md) | Implementeer intelligente agents met tools | 45 min |
| 3 | [Implementatie van AI-modellen](ai-model-deployment.md) | Implementeer en configureer AI-modellen | 30 min |
| 4 | [AI Workshop-lab](ai-workshop-lab.md) | Praktijk: Maak uw AI-oplossing AZD-klaar | 60 min |

---

## 🚀 Snel aan de slag

```bash
# Optie 1: RAG-chatapplicatie
azd init --template azure-search-openai-demo
azd up

# Optie 2: AI-agenten
azd init --template get-started-with-ai-agents
azd up

# Optie 3: Snelle chatapplicatie
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Uitgelichte AI-sjablonen

| Sjabloon | Beschrijving | Diensten |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-chat met citaten | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agent met tools | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Basis AI-chat | OpenAI + Container Apps |

---

## 💰 Kostenbewustzijn

| Omgeving | Geschatte maandelijkse kosten |
|-------------|----------------------|
| Ontwikkeling | $80-150 |
| Staging | $150-300 |
| Productie | $300-3,500+ |

**Tip:** Voer `azd down` uit na het testen om kosten te voorkomen.

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 1: Basis](../chapter-01-foundation/README.md) |
| **Volgende** | [Hoofdstuk 3: Configuratie](../chapter-03-configuration/README.md) |
| **Spring naar** | [Hoofdstuk 8: Productiepatronen](../chapter-08-production/README.md) |

---

## 📖 Gerelateerde bronnen

- [AI-probleemoplossing](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [AI-praktijken voor productie](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor enige misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
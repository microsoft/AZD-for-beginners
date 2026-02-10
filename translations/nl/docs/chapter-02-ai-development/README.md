# Hoofdstuk 2: AI-First Ontwikkeling

**📚 Cursus**: [AZD For Beginners](../../README.md) | **⏱️ Duur**: 1-2 uur | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk richt zich op het implementeren van AI-aangedreven applicaties met behulp van Azure Developer CLI en Microsoft Foundry-diensten. Van eenvoudige AI-chatapps tot intelligente agenten met tools.

## Leerdoelen

Na het voltooien van dit hoofdstuk zul je:
- Implementeer AI-toepassingen met vooraf gebouwde AZD-sjablonen
- Begrijp de integratie van Microsoft Foundry met AZD
- Configureer en pas AI-agenten met tools aan
- Implementeer RAG (Retrieval-Augmented Generation)-toepassingen

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry-integratie](microsoft-foundry-integration.md) | Verbind AZD met Foundry-diensten | 30 min |
| 2 | [AI-agentengids](agents.md) | Implementeer intelligente agenten met tools | 45 min |
| 3 | [AI-modelimplementatie](ai-model-deployment.md) | Implementeer en configureer AI-modellen | 30 min |
| 4 | [AI-workshop-lab](ai-workshop-lab.md) | Praktijk: Maak je AI-oplossing AZD-klaar | 60 min |

---

## 🚀 Snel aan de slag

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

| Template | Beschrijving | Diensten |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-chat met citaties | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agent met tools | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Basis AI-chat | OpenAI + Container Apps |

---

## 💰 Kostenbewustzijn

| Omgeving | Geschatte maandelijkse kosten |
|-------------|----------------------|
| Ontwikkeling | $80-150 |
| Staging | $150-300 |
| Productie | $300-3,500+ |

**Tip:** Voer `azd down` uit na het testen om kosten te vermijden.

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 1: Fundament](../chapter-01-foundation/README.md) |
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
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, moet u er rekening mee houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
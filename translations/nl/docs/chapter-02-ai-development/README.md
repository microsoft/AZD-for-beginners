# Hoofdstuk 2: AI-First Ontwikkeling

**📚 Cursus**: [AZD Voor Beginners](../../README.md) | **⏱️ Duur**: 4-5 uur inclusief de workshop | **⭐ Complexiteit**: Middenniveau

---

## Overzicht

Dit hoofdstuk richt zich op het implementeren van AI-aangedreven toepassingen met behulp van Azure Developer CLI en Microsoft Foundry-diensten. Van eenvoudige AI-chatapps tot intelligente agenten met tools.

> **Release review (2026-11-04):** AI CLI-richtlijnen zijn gecontroleerd aan de hand van gepubliceerde `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, en `azure.ai.evaluations` `1.0.0-beta.2` documentatie/bronnen. Gebruik `azd >= 1.37.0` voor de gecombineerde workflow. Evaluaties gebruiken nu de aparte `azd ai eval` namespace; zie [releasewijzigingen en migratierichtlijnen](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Dit is geen live deployment validatie.

## Leerdoelen

Na het voltooien van dit hoofdstuk:
- Implementeer AI-toepassingen met vooraf gebouwde AZD-templates
- Begrijp Microsoft Foundry-integratie met AZD
- Configureer en pas AI-agenten met tools aan
- Implementeer RAG (Retrieval-Augmented Generation) toepassingen

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integratie](microsoft-foundry-integration.md) | Verbind AZD met Foundry-diensten | 30 min |
| 2 | [AI Agenten Gids](agents.md) | Implementeer intelligente agenten met tools | 45 min |
| 3 | [AI Model Implementatie](ai-model-deployment.md) | Implementeer en configureer AI-modellen | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktijk: Verken een template en plan je conversie | 2-3 uur |

---

## 🚀 Snel aan de slag

Kies een optie in een nieuwe lege map. De afsluitende `.` initialiseert de huidige map; anders kan AZD een submap aanmaken zonder de werkdirectory van je shell te veranderen.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 Uitgelichte AI-templates

| Template | Beschrijving | Diensten |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-chat met citaties | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agent met tools | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Basis AI-chat | OpenAI + Container Apps |

---

## 💰 Kostenbewustzijn

Dit zijn illustratieve bereikwaarden, geen offertes of limieten; modelverkeer, Search/compute SKU’s, regio, en optionele functies kunnen deze overschrijden. Bekijk de actuele prijsrichtlijnen van je gekozen voorbeeld voordat je provisioning uitvoert.

| Omgeving | Geschatte Maandelijkse Kosten |
|-------------|----------------------|
| Ontwikkeling | $80-150 |
| Staging | $150-300 |
| Productie | $300-3,500+ |

**Tip:** Voer `azd down` uit na het testen om kosten te voorkomen.

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 1: Fundament](../chapter-01-foundation/README.md) |
| **Volgende** | [Hoofdstuk 3: Configuratie](../chapter-03-configuration/README.md) |
| **Sla over naar** | [Hoofdstuk 8: Productiepatronen](../chapter-08-production/README.md) |

---

## 📖 Gerelateerde bronnen

- [AI Probleemoplossing](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Productierichtlijnen voor AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
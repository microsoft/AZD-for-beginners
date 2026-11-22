# Hoofdstuk 2: AI-First Ontwikkeling

**📚 Cursus**: [AZD Voor Beginners](../../README.md) | **⏱️ Duur**: 4-5 uur inclusief de workshop | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk richt zich op het inzetten van AI-aangedreven applicaties met behulp van Azure Developer CLI en Microsoft Foundry-diensten. Van eenvoudige AI-chatapps tot intelligente agents met tools.

> **Foundry GA update (2026-11-09):** De `microsoft.foundry` 1.0 bundel is [algemeen beschikbaar](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Gebruik `azd >= 1.37.0`; evaluaties blijven een aparte installatie. De [hosted-agent walkthrough](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) behandelt lokale Agent Inspector-tests en remote code deployment. Dit is een documentatiebeoordeling, geen live validatie van de deployment; optionele previewfuncties behouden hun eigen status.

## Leerdoelen

Door dit hoofdstuk te voltooien, zul je:
- AI-toepassingen implementeren met vooraf gebouwde AZD-sjablonen
- Begrijpen hoe Microsoft Foundry integreert met AZD
- De GA-bundel installeren en een hosted agent lokaal testen voordat je de bron naar Foundry deployt
- `azure.yaml`, evaluatie-assets en opschoning van nieuwe versus hergebruikte projecten beoordelen
- AI-agents met tools configureren en aanpassen
- RAG (Retrieval-Augmented Generation) applicaties implementeren

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integratie](microsoft-foundry-integration.md) | GA bundel, hosted-agent local-to-cloud workflow, en evaluaties | 60 min |
| 2 | [AI Agents Gids](agents.md) | Intelligente agents inzetten met tools | 45 min |
| 3 | [AI Model Deploy](ai-model-deployment.md) | AI modellen inzetten en configureren | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktijk: Verken een sjabloon en plan je conversie | 2-3 uur |

---

## 🚀 Snelle Start

Kies een optie in een nieuwe lege map. De afsluitende `.` initialiseert de huidige map; anders kan AZD een submap aanmaken zonder je shell werkmap te wijzigen.

Voor het **GA hosted-agent code-deployment pad**, begin met de [geleid doorloop](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Dit vereist AZD 1.37.0+, huidige uv, Python 3.13+, Foundry rechten en model quota. De onderstaande volledige applicatiesjablonen zijn alternatieven, geen vereisten voor die doorloop.

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

## 🤖 Uitgelichte AI Sjablonen

| Sjabloon | Beschrijving | Diensten |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-chat met citaties | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent met tools | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Basis AI chat | OpenAI + Container Apps |

---

## 💰 Kostenbewustzijn

Dit zijn illustratieve bereiken, geen offertes of max limieten; modelverkeer, Search/compute SKUs, regio en optionele functies kunnen deze overschrijden. Bekijk de huidige prijsrichtlijnen van je gekozen voorbeeld vóór het provisioneren.

| Omgeving | Geschatte Maandelijkse Kosten |
|-------------|----------------------|
| Ontwikkeling | $80-150 |
| Staging | $150-300 |
| Productie | $300-3,500+ |

**Opruimen:** Bekijk `azd down` vóór bevestiging: bij een nieuw aangemaakt Foundry-project verwijdert het de resourcegroep en alles daarin. Voor een hergebruikt Foundry-project laat het de project- en agentresources staan; volg de [doorloop opruiminstructies](microsoft-foundry-integration.md#7-clean-up-deliberately) om ongewenste resources apart te verwijderen.

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 1: Fundament](../chapter-01-foundation/README.md) |
| **Volgende** | [Hoofdstuk 3: Configuratie](../chapter-03-configuration/README.md) |
| **Spring naar** | [Hoofdstuk 8: Productiepatronen](../chapter-08-production/README.md) |

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
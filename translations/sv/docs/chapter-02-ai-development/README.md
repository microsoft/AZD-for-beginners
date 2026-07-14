# Kapitel 2: AI-First Utveckling

**📚 Kurs**: [AZD För Nybörjare](../../README.md) | **⏱️ Varaktighet**: 1-2 timmar | **⭐ Svårighetsgrad**: Medel

---

## Översikt

Detta kapitel fokuserar på att distribuera AI-drivenapplikationer med Azure Developer CLI och Microsoft Foundry-tjänster. Från enkla AI-chattappar till intelligenta agenter med verktyg.

> **Valideringsnotering (2026-07-13):** Kommandoflödet och utökningens vägledning i detta kapitel granskades mot `azd` `1.27.1` och den aktuella förhandsvisningsversionen av AI-agentutökningen `azure.ai.agents` `1.0.0-beta.5`. Om du har en äldre AZD-version, uppdatera först och fortsätt sedan med övningarna.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Distribuera AI-applikationer med förbyggda AZD-mallar
- Förstå Microsoft Foundry-integration med AZD
- Konfigurera och anpassa AI-agenter med verktyg
- Distribuera RAG (Retrieval-Augmented Generation) applikationer

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Anslut AZD med Foundry-tjänster | 30 min |
| 2 | [AI Agents Guide](agents.md) | Distribuera intelligenta agenter med verktyg | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Distribuera och konfigurera AI-modeller | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktiskt: Gör din AI-lösning AZD-redo | 60 min |

---

## 🚀 Kom Igång Snabbt

```bash
# Alternativ 1: RAG Chat-applikation
azd init --template azure-search-openai-demo
azd up

# Alternativ 2: AI-agenter
azd init --template get-started-with-ai-agents
azd up

# Alternativ 3: Snabb chattapp
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Utvalda AI-mallar

| Mall | Beskrivning | Tjänster |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-chatt med citat | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agent med verktyg | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Grundläggande AI-chatt | OpenAI + Container Apps |

---

## 💰 Kostnadsmedvetenhet

| Miljö | Uppskattad Månadskostnad |
|-------------|----------------------|
| Utveckling | $80-150 |
| Test | $150-300 |
| Produktion | $300-3,500+ |

**Tips:** Kör `azd down` efter test för att undvika avgifter.

---

## 🔗 Navigering

| Riktning | Kapitel |
|-----------|---------|
| **Föregående** | [Kapitel 1: Grundläggande](../chapter-01-foundation/README.md) |
| **Nästa** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |
| **Hoppa till** | [Kapitel 8: Produktionsmönster](../chapter-08-production/README.md) |

---

## 📖 Relaterade Resurser

- [AI Felsökning](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Produktions AI-praktiker](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
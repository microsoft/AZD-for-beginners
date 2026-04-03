# Kapitel 2: AI-först utveckling

**📚 Kurs**: [AZD För Nybörjare](../../README.md) | **⏱️ Tid**: 1-2 timmar | **⭐ Komplexitet**: Medel

---

## Översikt

Detta kapitel fokuserar på att distribuera AI-drivna applikationer med Azure Developer CLI och Microsoft Foundry-tjänster. Från enkla AI-chattappar till intelligenta agenter med verktyg.

> **Valideringsanteckning (2026-03-25):** Kommandoflödet och tilläggsvägledningen i detta kapitel granskades mot `azd` `1.23.12` och den aktuella preview AI-agenttilläggsreleasen `azure.ai.agents` `0.1.18-preview`. Om du använder en äldre AZD-build, uppdatera först och fortsätt sedan med övningarna.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Distribuera AI-applikationer med färdiga AZD-mallar
- Förstå Microsoft Foundry-integration med AZD
- Konfigurera och anpassa AI-agenter med verktyg
- Distribuera RAG (Retrieval-Augmented Generation)-applikationer

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Anslut AZD till Foundry-tjänster | 30 min |
| 2 | [AI Agents Guide](agents.md) | Distribuera intelligenta agenter med verktyg | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Distribuera och konfigurera AI-modeller | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktiskt: Gör din AI-lösning redo för AZD | 60 min |

---

## 🚀 Snabbstart

```bash
# Alternativ 1: RAG-chattapplikation
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
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-chatt med källhänvisningar | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agent med verktyg | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Grundläggande AI-chatt | OpenAI + Container Apps |

---

## 💰 Kostnadsmedvetenhet

| Miljö | Uppskattad månadskostnad |
|-------------|----------------------|
| Utveckling | $80-150 |
| Staging | $150-300 |
| Produktion | $300-3,500+ |

**Tips:** Kör `azd down` efter testning för att undvika avgifter.

---

## 🔗 Navigering

| Riktning | Kapitel |
|-----------|---------|
| **Föregående** | [Kapitel 1: Foundation](../chapter-01-foundation/README.md) |
| **Nästa** | [Kapitel 3: Configuration](../chapter-03-configuration/README.md) |
| **Hoppa till** | [Kapitel 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 Relaterade resurser

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Produktionspraxis för AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI‑översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet bör du vara medveten om att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet i dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas en professionell, mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
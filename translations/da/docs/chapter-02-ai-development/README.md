# Kapitel 2: AI-First-udvikling

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Varighed**: 1-2 timer | **⭐ Kompleksitet**: Mellemniveau

---

## Oversigt

Dette kapitel fokuserer på at udrulle AI-drevne applikationer ved hjælp af Azure Developer CLI og Microsoft Foundry-tjenester. Fra simple AI-chatapps til intelligente agenter med værktøjer.

> **Valideringsnote (2026-06-15):** Kommando-flowet og udvidelsesvejledningen i dette kapitel blev gennemgået i forhold til `azd` `1.25.6` og den aktuelle preview AI-agent-udvidelsesudgivelse `azure.ai.agents` `0.1.40-preview`. Hvis du bruger en ældre AZD-build, opdater først og fortsæt derefter med øvelserne.

## Læringsmål

Når du har gennemført dette kapitel, vil du:
- Udrul AI-applikationer ved hjælp af forudbyggede AZD-skabeloner
- Forstå Microsoft Foundry-integration med AZD
- Konfigurer og tilpas AI-agenter med værktøjer
- Udrul RAG (Retrieval-Augmented Generation)-applikationer

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Forbind AZD med Foundry-tjenester | 30 min |
| 2 | [AI Agents Guide](agents.md) | Udrul intelligente agenter med værktøjer | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Udrul og konfigurer AI-modeller | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktisk: Gør din AI-løsning AZD-klar | 60 min |

---

## 🚀 Hurtig start

```bash
# Mulighed 1: RAG-chatapplikation
azd init --template azure-search-openai-demo
azd up

# Mulighed 2: AI-agenter
azd init --template get-started-with-ai-agents
azd up

# Mulighed 3: Hurtig chat-app
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Udvalgte AI-skabeloner

| Skabelon | Beskrivelse | Tjenester |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-chat med kildehenvisninger | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agent med værktøjer | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Grundlæggende AI-chat | OpenAI + Container Apps |

---

## 💰 Omkostningsbevidsthed

| Miljø | Anslået månedlig omkostning |
|-------------|----------------------|
| Udvikling | $80-150 |
| Staging | $150-300 |
| Produktion | $300-3,500+ |

**Tip:** Kør `azd down` efter test for at undgå omkostninger.

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Forrige** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **Næste** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Spring til** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 Relaterede ressourcer

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Produktions-AI-praksis](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Kapitel 2: AI-Første Udvikling

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Varighed**: 1-2 timer | **⭐ Kompleksitet**: Mellem

---

## Oversigt

Dette kapitel fokuserer på at implementere AI-drevne applikationer ved hjælp af Azure Developer CLI og Microsoft Foundry-tjenester. Fra simple AI chat-apps til intelligente agenter med værktøjer.

> **Valideringsnote (2026-07-13):** Kommando-flowet og vejledningen til udvidelser i dette kapitel blev gennemgået mod `azd` `1.27.1` og den aktuelle preview AI agent-udgivelse `azure.ai.agents` `1.0.0-beta.5`. Hvis du bruger en ældre AZD-version, opdater først og fortsæt derefter med øvelserne.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Implementere AI-applikationer ved hjælp af forudbyggede AZD-skabeloner
- Forstå Microsoft Foundry integration med AZD
- Konfigurere og tilpasse AI-agenter med værktøjer
- Implementere RAG (Retrieval-Augmented Generation) applikationer

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Forbind AZD med Foundry-tjenester | 30 min |
| 2 | [AI Agents Guide](agents.md) | Implementer intelligente agenter med værktøjer | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Implementer og konfigurer AI-modeller | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktisk: Gør din AI-løsning AZD-klar | 60 min |

---

## 🚀 Kom Godt i Gang

```bash
# Mulighed 1: RAG Chat Applikation
azd init --template azure-search-openai-demo
azd up

# Mulighed 2: AI Agenter
azd init --template get-started-with-ai-agents
azd up

# Mulighed 3: Hurtig Chat App
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Udvalgte AI Skabeloner

| Skabelon | Beskrivelse | Tjenester |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat med henvisninger | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agent med værktøjer | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Grundlæggende AI chat | OpenAI + Container Apps |

---

## 💰 Omkostningsbevidsthed

| Miljø | Estimeret Månedlig Omkostning |
|-------------|------------------------|
| Udvikling | $80-150 |
| Prøve | $150-300 |
| Produktion | $300-3.500+ |

**Tip:** Kør `azd down` efter test for at undgå omkostninger.

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Forrige** | [Kapitel 1: Fundament](../chapter-01-foundation/README.md) |
| **Næste** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |
| **Spring til** | [Kapitel 8: Produktionsmønstre](../chapter-08-production/README.md) |

---

## 📖 Relaterede Ressourcer

- [AI Fejlfinding](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Produktions AI-Praksis](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
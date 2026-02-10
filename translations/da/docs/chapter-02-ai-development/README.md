# Kapitel 2: AI-først udvikling

**📚 Kursus**: [AZD for begyndere](../../README.md) | **⏱️ Varighed**: 1-2 timer | **⭐ Kompleksitet**: Mellem

---

## Oversigt

Dette kapitel fokuserer på udrulning af AI-drevne applikationer ved hjælp af Azure Developer CLI og Microsoft Foundry-tjenester. Fra enkle AI-chat-apps til intelligente agenter med værktøjer.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Udrul AI-applikationer ved hjælp af forudbyggede AZD-skabeloner
- Forstå Microsoft Foundry-integration med AZD
- Konfigurer og tilpas AI-agenter med værktøjer
- Udrul RAG (Retrieval-Augmented Generation) applikationer

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry-integration](microsoft-foundry-integration.md) | Forbind AZD med Foundry-tjenester | 30 min |
| 2 | [Guide til AI-agenter](agents.md) | Udrul intelligente agenter med værktøjer | 45 min |
| 3 | [Udrulning af AI-modeller](ai-model-deployment.md) | Udrul og konfigurer AI-modeller | 30 min |
| 4 | [AI-workshop-lab](ai-workshop-lab.md) | Praktisk: Gør din AI-løsning AZD-klar | 60 min |

---

## 🚀 Hurtig start

```bash
# Mulighed 1: RAG-chatapplikation
azd init --template azure-search-openai-demo
azd up

# Mulighed 2: AI-agenter
azd init --template get-started-with-ai-agents
azd up

# Mulighed 3: Hurtig chatapplikation
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Udvalgte AI-skabeloner

| Skabelon | Beskrivelse | Tjenester |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-chat med kilder | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agent med værktøjer | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Grundlæggende AI-chat | OpenAI + Container Apps |

---

## 💰 Omkostningsbevidsthed

| Miljø | Anslået månedlig pris |
|-------------|----------------------|
| Udvikling | $80-150 |
| Staging | $150-300 |
| Produktion | $300-3,500+ |

**Tip:** Kør `azd down` efter test for at undgå omkostninger.

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Forrige** | [Kapitel 1: Grundlag](../chapter-01-foundation/README.md) |
| **Næste** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |
| **Spring til** | [Kapitel 8: Produktionsmønstre](../chapter-08-production/README.md) |

---

## 📖 Relaterede ressourcer

- [AI-fejlfinding](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [AI-praksis i produktion](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets originalsprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi kan ikke gøres ansvarlige for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
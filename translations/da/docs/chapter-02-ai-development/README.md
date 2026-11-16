# Kapitel 2: AI-Første Udvikling

**📚 Kursus**: [AZD For Begyndere](../../README.md) | **⏱️ Varighed**: 4-5 timer inklusive workshop | **⭐ Kompleksitet**: Mellem

---

## Oversigt

Dette kapitel fokuserer på implementering af AI-drevne applikationer ved hjælp af Azure Developer CLI og Microsoft Foundry-tjenester. Fra simple AI-chatapps til intelligente agenter med værktøjer.

> **Udgivelsesgennemgang (2026-11-04):** AI CLI vejledning blev kontrolleret i forhold til publiceret `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, og `azure.ai.evaluations` `1.0.0-beta.2` dokumentation/kilde. Brug `azd >= 1.37.0` til den samlede arbejdsgang. Evalueringer bruger nu det separate `azd ai eval` navneområde; se [udgivelsesændringer og migrationsvejledning](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Dette er ikke en live implementeringsvalidering.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Implementere AI-applikationer ved hjælp af forbyggede AZD-skabeloner
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
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktisk: Udforsk en skabelon og planlæg din konvertering | 2-3 timer |

---

## 🚀 Hurtig start

Vælg en mulighed i en ny tom mappe. Den afsluttende `.` initialiserer den aktuelle mappe; ellers kan AZD oprette en undermappe uden at ændre din shells arbejdsmappe.

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

## 🤖 Fremhævede AI-skabeloner

| Skabelon | Beskrivelse | Tjenester |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat med kildehenvisninger | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agent med værktøjer | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Grundlæggende AI-chat | OpenAI + Container Apps |

---

## 💰 Omkostningsbevidsthed

Dette er illustrative intervaller, ikke tilbud eller grænser; modeltrafik, Search/compute SKUs, region og valgfrie funktioner kan overskride dem. Gennemgå den valgte prøves aktuelle prisvejledning før udrulning.

| Miljø | Anslået månedlig omkostning |
|-------------|----------------------|
| Udvikling | $80-150 |
| Test | $150-300 |
| Produktion | $300-3.500+ |

**Tip:** Kør `azd down` efter test for at undgå gebyrer.

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Forrige** | [Kapitel 1: Foundation](../chapter-01-foundation/README.md) |
| **Næste** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |
| **Spring til** | [Kapitel 8: Produktionsmønstre](../chapter-08-production/README.md) |

---

## 📖 Relaterede Ressourcer

- [AI Fejlfinding](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Produktionspraksis for AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
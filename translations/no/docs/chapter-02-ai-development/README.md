# Kapittel 2: AI-først utvikling

**📚 Kurs**: [AZD for nybegynnere](../../README.md) | **⏱️ Varighet**: 1-2 hours | **⭐ Vanskelighetsgrad**: Middels

---

## Oversikt

Dette kapitlet fokuserer på å distribuere AI-drevne applikasjoner ved hjelp av Azure Developer CLI og Microsoft Foundry-tjenester. Fra enkle AI-chatapper til intelligente agenter med verktøy.

## Læringsmål

Ved å fullføre dette kapitlet vil du:
- Distribuere AI-applikasjoner ved hjelp av ferdigbygde AZD-maler
- Forstå Microsoft Foundry-integrasjon med AZD
- Konfigurere og tilpasse AI-agenter med verktøy
- Distribuere RAG (Retrieval-Augmented Generation) applikasjoner

---

## 📚 Leksjoner

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Integrasjon med Microsoft Foundry](microsoft-foundry-integration.md) | Koble AZD til Foundry-tjenester | 30 min |
| 2 | [Veiledning for AI-agenter](agents.md) | Distribuer intelligente agenter med verktøy | 45 min |
| 3 | [Distribusjon av AI-modeller](ai-model-deployment.md) | Distribuer og konfigurer AI-modeller | 30 min |
| 4 | [AI Workshop-lab](ai-workshop-lab.md) | Praktisk: Gjør AI-løsningen din klar for AZD | 60 min |

---

## 🚀 Kom i gang raskt

```bash
# Alternativ 1: RAG-chatapplikasjon
azd init --template azure-search-openai-demo
azd up

# Alternativ 2: AI-agenter
azd init --template get-started-with-ai-agents
azd up

# Alternativ 3: Rask chat-app
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Utvalgte AI-maler

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-chat med referanser | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agent med verktøy | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Grunnleggende AI-chat | OpenAI + Container Apps |

---

## 💰 Kostnadsbevissthet

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Utvikling | $80-150 |
| Staging | $150-300 |
| Produksjon | $300-3,500+ |

**Tips:** Kjør `azd down` etter testing for å unngå kostnader.

---

## 🔗 Navigasjon

| Direction | Chapter |
|-----------|---------|
| **Forrige** | [Kapittel 1: Grunnlag](../chapter-01-foundation/README.md) |
| **Neste** | [Kapittel 3: Konfigurasjon](../chapter-03-configuration/README.md) |
| **Hopp til** | [Kapittel 8: Produksjonsmønstre](../chapter-08-production/README.md) |

---

## 📖 Relaterte ressurser

- [Feilsøking for AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Produksjonspraksis for AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
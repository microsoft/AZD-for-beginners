# Kapittel 2: AI-Først Utvikling

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 1-2 timer | **⭐ Vanskelighetsgrad**: Middels

---

## Oversikt

Dette kapitlet fokuserer på å distribuere AI-drevne applikasjoner ved hjelp av Azure Developer CLI og Microsoft Foundry-tjenester. Fra enkle AI-chatapper til intelligente agenter med verktøy.

> **Valideringsnotat (2026-07-13):** Kommando flyten og utvidelsesveiledningen i dette kapittelet ble gjennomgått mot `azd` `1.27.1` og den nåværende forhåndsvisning AI agent-utgivelsen `azure.ai.agents` `1.0.0-beta.5`. Hvis du bruker en eldre AZD-versjon, oppdater først og fortsett deretter med øvelsene.

## Læringsmål

Ved å fullføre dette kapitlet vil du:
- Distribuere AI-applikasjoner ved hjelp av forhåndsbygde AZD-maler
- Forstå Microsoft Foundry-integrasjon med AZD
- Konfigurere og tilpasse AI-agenter med verktøy
- Distribuere RAG (Retrieval-Augmented Generation) applikasjoner

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|---------|-------------|-----|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Koble AZD med Foundry-tjenester | 30 min |
| 2 | [AI Agents Guide](agents.md) | Distribuere intelligente agenter med verktøy | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Distribuere og konfigurere AI-modeller | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktisk: Gjør din AI-løsning AZD-klar | 60 min |

---

## 🚀 Rask start

```bash
# Alternativ 1: RAG Chat-applikasjon
azd init --template azure-search-openai-demo
azd up

# Alternativ 2: AI-agenter
azd init --template get-started-with-ai-agents
azd up

# Alternativ 3: Rask chatteapp
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Utvalgte AI-maler

| Mal | Beskrivelse | Tjenester |
|-----|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-chat med henvisninger | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agent med verktøy | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Grunnleggende AI-chat | OpenAI + Container Apps |

---

## 💰 Kostnadsbevissthet

| Miljø | Estimert månedskostnad |
|-------|----------------------|
| Utvikling | $80-150 |
| Testing | $150-300 |
| Produksjon | $300-3,500+ |

**Tips:** Kjør `azd down` etter testing for å unngå kostnader.

---

## 🔗 Navigasjon

| Retning | Kapittel |
|---------|----------|
| **Forrige** | [Kapittel 1: Grunnlag](../chapter-01-foundation/README.md) |
| **Neste** | [Kapittel 3: Konfigurasjon](../chapter-03-configuration/README.md) |
| **Hopp til** | [Kapittel 8: Produksjonsmønstre](../chapter-08-production/README.md) |

---

## 📖 Relaterte ressurser

- [AI Feilsøking](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Produksjons AI-praksis](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
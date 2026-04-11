# Kapittel 2: AI-First Utvikling

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 1-2 timer | **⭐ Vanskelighetsgrad**: Middels

---

## Oversikt

Dette kapittelet fokuserer på utrulling av AI-drevne applikasjoner ved bruk av Azure Developer CLI og Microsoft Foundry-tjenester. Fra enkle AI-chatapper til intelligente agenter med verktøy.

> **Valideringsnotat (2026-03-25):** Kommando-prosessen og veiledningen for utvidelser i dette kapittelet ble gjennomgått mot `azd` `1.23.12` og den nåværende forhåndsvisningsutgivelsen av AI-agent-utvidelsen `azure.ai.agents` `0.1.18-preview`. Hvis du har en eldre AZD-versjon, oppdater først og fortsett deretter med øvelsene.

## Læringsmål

Ved å fullføre dette kapittelet vil du:
- Rulle ut AI-applikasjoner ved bruk av forhåndsbygde AZD-maler
- Forstå Microsoft Foundry-integrasjon med AZD
- Konfigurere og tilpasse AI-agenter med verktøy
- Rulle ut RAG (Retrieval-Augmented Generation)-applikasjoner

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|---------|-------------|-----|
| 1 | [Microsoft Foundry Integrasjon](microsoft-foundry-integration.md) | Koble AZD med Foundry-tjenester | 30 min |
| 2 | [AI Agent Guide](agents.md) | Rull ut intelligente agenter med verktøy | 45 min |
| 3 | [AI Modellutplassering](ai-model-deployment.md) | Rull ut og konfigurer AI-modeller | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktisk: Gjør AI-løsningen din AZD-klar | 60 min |

---

## 🚀 Rask Start

```bash
# Alternativ 1: RAG Chat-applikasjon
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

| Mal | Beskrivelse | Tjenester |
|-----|-------------|-----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-chat med kilder | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agent med verktøy | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Enkel AI-chat | OpenAI + Container Apps |

---

## 💰 Kostnadsbevissthet

| Miljø | Estimert Månedskostnad |
|-------|-----------------------|
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
- [Produksjonspraksis for AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved bruk av AI-oversettingstjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi jobber for nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på det opprinnelige språket bør betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
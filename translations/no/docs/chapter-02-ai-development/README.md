# Kapittel 2: AI-First Utvikling

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 4-5 timer inkludert verksted | **⭐ Kompleksitet**: Middels

---

## Oversikt

Dette kapittelet fokuserer på å distribuere AI-drevne applikasjoner ved bruk av Azure Developer CLI og Microsoft Foundry-tjenester. Fra enkle AI-chatapper til intelligente agenter med verktøy.

> **Utgivelsesgjennomgang (2026-11-04):** AI CLI-veiledning ble sjekket opp mot publisert `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, og `azure.ai.evaluations` `1.0.0-beta.2` dokumentasjon/kilde. Bruk `azd >= 1.37.0` for den kombinerte arbeidsflyten. Evalueringer bruker nå det separate `azd ai eval`-navnerommet; se [endringer i utgivelsen og migrasjonsveiledning](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Dette er ikke en validering av levende distribusjon.

## Læringsmål

Ved å fullføre dette kapittelet vil du:
- Distribuere AI-applikasjoner ved bruk av forhåndslagde AZD-maler
- Forstå Microsoft Foundry-integrasjon med AZD
- Konfigurere og tilpasse AI-agenter med verktøy
- Distribuere RAG (Retrieval-Augmented Generation) applikasjoner

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|---------|-------------|-----|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Koble AZD til Foundry-tjenester | 30 min |
| 2 | [AI Agents Guide](agents.md) | Distribuer intelligente agenter med verktøy | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Distribuer og konfigurer AI-modeller | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktisk: Utforsk en mal og planlegg din konvertering | 2-3 timer |

---

## 🚀 Komme i gang raskt

Velg ett alternativ i en ny tom katalog. Den avsluttende `.` initialiserer den nåværende katalogen; ellers kan AZD opprette en undermappe uten å endre skallens arbeidskatalog.

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

## 🤖 Utvalgte AI-maler

| Mal | Beskrivelse | Tjenester |
|-----|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-chat med sitater | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agent med verktøy | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Enkel AI-chat | OpenAI + Container Apps |

---

## 💰 Kostnadsbevissthet

Dette er illustrerende spenn, ikke tilbud eller tak; modelltrafikk, Search/compute SKUer, region og valgfrie funksjoner kan overstige disse. Gjennomgå gjeldende prisveiledning for ditt valgte eksempel før provisjonering.

| Miljø | Anslått månedskostnad |
|-------|-----------------------|
| Utvikling | $80-150 |
| Staging | $150-300 |
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
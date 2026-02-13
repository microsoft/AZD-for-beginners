# Kapittel 5: Multi-Agent AI-løsninger

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 2-3 hours | **⭐ Kompleksitet**: Avansert

---

## Oversikt

Dette kapitlet dekker avanserte fleragent-arkitekturmønstre, agentorkestrering og produksjonsklare AI-distribusjoner for komplekse scenarier.

## Læringsmål

Ved å fullføre dette kapitlet vil du:
- Forstå fleragent-arkitekturmønstre
- Distribuere koordinerte AI-agentssystemer
- Implementere kommunikasjon mellom agenter
- Bygge produksjonsklare fleragentløsninger

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Retail Multi-Agent Solution](../../examples/retail-scenario.md) | Komplett implementasjonsgjennomgang | 90 min |
| 2 | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) | Strategier for agentorkestrering | 30 min |
| 3 | [ARM Template Deployment](../../examples/retail-multiagent-arm-template/README.md) | Ett-klikk-distribusjon | 30 min |

---

## 🚀 Rask start

```bash
# Distribuer multiagent-løsningen for detaljhandel
cd examples/retail-multiagent-arm-template
./deploy.sh

# Eller bruk malen direkte
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Fleragent-arkitektur

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 Utvalgt løsning: Retail Multi-Agent

Løsningen [Retail Multi-Agent Solution](../../examples/retail-scenario.md) demonstrerer:

- **Customer Agent**: Håndterer brukerinteraksjoner og preferanser
- **Inventory Agent**: Administrerer lager og ordrebehandling
- **Orchestrator**: Koordinerer mellom agenter
- **Shared Memory**: Kontekststyring på tvers av agenter

### Brukte tjenester

| Tjeneste | Formål |
|---------|---------|
| Azure OpenAI | Språkforståelse |
| Azure AI Search | Produktkatalog |
| Cosmos DB | Agenttilstand og minne |
| Container Apps | Vert for agenter |
| Application Insights | Overvåking |

---

## 🔗 Navigasjon

| Retning | Kapittel |
|-----------|---------|
| **Forrige** | [Chapter 4: Infrastructure](../chapter-04-infrastructure/README.md) |
| **Neste** | [Chapter 6: Pre-Deployment](../chapter-06-pre-deployment/README.md) |

---

## 📖 Relaterte ressurser

- [AI Agents Guide](../chapter-02-ai-development/agents.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell, menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår som følge av bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
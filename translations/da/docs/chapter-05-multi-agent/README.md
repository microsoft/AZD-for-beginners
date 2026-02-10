# Kapitel 5: Multi-agent AI-løsninger

**📚 Kursus**: [AZD for begyndere](../../README.md) | **⏱️ Varighed**: 2-3 timer | **⭐ Kompleksitet**: Avanceret

---

## Oversigt

Dette kapitel dækker avancerede multi-agent-arkitekturmønstre, agentorkestrering og produktionsklare AI-implementeringer til komplekse scenarier.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Forstå multi-agent-arkitekturmønstre
- Udrulle koordinerede AI-agent-systemer
- Implementere agent-til-agent kommunikation
- Bygge produktionsklare multi-agent-løsninger

---

## 📚 Lektioner

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Retail Multi-Agent Solution](../../examples/retail-scenario.md) | Komplet implementeringsgennemgang | 90 min |
| 2 | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) | Strategier for agentorkestrering | 30 min |
| 3 | [ARM Template Deployment](../../examples/retail-multiagent-arm-template/README.md) | Én-klik-implementering | 30 min |

---

## 🚀 Hurtig start

```bash
# Udrul detailhandelens multi-agent-løsning
cd examples/retail-multiagent-arm-template
./deploy.sh

# Eller brug skabelonen direkte
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Multi-agent-arkitektur

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

## 🎯 Fremhævet løsning: Multi-agent til detailhandel

The [Retail Multi-Agent Solution](../../examples/retail-scenario.md) demonstrates:

- **Customer Agent**: Håndterer brugerinteraktioner og præferencer
- **Inventory Agent**: Håndterer lager og ordrebehandling
- **Orchestrator**: Koordinerer mellem agenter
- **Shared Memory**: Styring af kontekst på tværs af agenter

### Anvendte tjenester

| Service | Purpose |
|---------|---------|
| Azure OpenAI | Sprogforståelse |
| Azure AI Search | Produktkatalog |
| Cosmos DB | Agenttilstand og hukommelse |
| Container Apps | Agenthosting |
| Application Insights | Overvågning |

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 4: Infrastructure](../chapter-04-infrastructure/README.md) |
| **Next** | [Chapter 6: Pre-Deployment](../chapter-06-pre-deployment/README.md) |

---

## 📖 Relaterede ressourcer

- [AI Agents Guide](../chapter-02-ai-development/agents.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi stræber efter nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på sit oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
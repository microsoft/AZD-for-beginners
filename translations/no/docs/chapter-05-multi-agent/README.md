# Kapittel 5: Multi-Agent AI-løsninger

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 2-3 timer | **⭐ Vanskelighetsgrad**: Avansert

---

## Oversikt

Dette kapittelet dekker avanserte multi-agent arkitektur-mønstre, agentorchestrasjon og produksjonsklare AI-distribusjoner for komplekse scenarier.

## Læringsmål

Ved å fullføre dette kapittelet vil du:
- Forstå multi-agent arkitektur-mønstre
- Distribuere koordinerte AI-agent-systemer
- Implementere agent-til-agent kommunikasjon
- Bygge produksjonsklare multi-agent løsninger

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|---------|-------------|-----|
| 1 | [Retail Multi-Agent Solution](../../examples/retail-scenario.md) | Fullstendig implementeringsgjennomgang | 90 min |
| 2 | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) | Agentorchestrasjonsstrategier | 30 min |
| 3 | [ARM Template Deployment](../../examples/retail-multiagent-arm-template/README.md) | Ett-klikk distribusjon | 30 min |

---

## 🚀 Kom i gang raskt

```bash
# Alternativ 1: Distribuer fra en mal
azd init --template agent-openai-python-prompty
azd up

# Alternativ 2: Distribuer fra en agent-manifest (krever azure.ai.agents-utvidelse)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **Hvilken tilnærming?** Bruk `azd init --template` for å starte fra et fungerende eksempel. Bruk `azd ai agent init` når du har din egen agent-manifest. Se [AZD AI CLI referanse](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for fullstendige detaljer.

---

## 🤖 Multi-Agent Arkitektur

```mermaid
graph TD
    Orchestrator[Orkestratoragent<br/>Ruter forespørsler, styrer arbeidsflyt] --> Customer[Kundeagent<br/>Brukerspørsmål, preferanser]
    Orchestrator --> Inventory[Lageragent<br/>Lagerstatus, bestillinger]
```
---

## 🎯 Utvalgt løsning: Retail Multi-Agent

[Retail Multi-Agent Solution](../../examples/retail-scenario.md) demonstrerer:

- **Customer Agent**: Håndterer brukerinteraksjoner og preferanser
- **Inventory Agent**: Administrerer lager og ordrebehandling
- **Orchestrator**: Koordinerer mellom agenter
- **Shared Memory**: Tverragents kontekststyring

### Tjenester som brukes

| Tjeneste | Formål |
|----------|---------|
| Microsoft Foundry Models | Språkforståelse |
| Azure AI Search | Produktkatalog |
| Cosmos DB | Agent-tilstand og minne |
| Container Apps | Agent-hosting |
| Application Insights | Overvåking |

---

## 🔗 Navigasjon

| Retning | Kapittel |
|---------|----------|
| **Forrige** | [Kapittel 4: Infrastruktur](../chapter-04-infrastructure/README.md) |
| **Neste** | [Kapittel 6: For-Distribusjon](../chapter-06-pre-deployment/README.md) |

---

## 📖 Relaterte ressurser

- [AI Agents Guide](../chapter-02-ai-development/agents.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettingstjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på dets originale språk bør betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
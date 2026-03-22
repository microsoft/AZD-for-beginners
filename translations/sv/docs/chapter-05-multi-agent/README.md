# Kapitel 5: Multi-agent AI-lösningar

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varaktighet**: 2-3 timmar | **⭐ Komplexitet**: Avancerad

---

## Översikt

Detta kapitel täcker avancerade mönster för multi-agentarkitektur, agentorkestrering och produktionsklara AI-distributioner för komplexa scenarier.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Förstå mönster för multi-agentarkitektur
- Driftsätta koordinerade AI-agentsystem
- Implementera agent-till-agent-kommunikation
- Bygga produktionsklara multi-agentlösningar

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Retail Multi-Agent-lösning](../../examples/retail-scenario.md) | Fullständig genomgång av implementationen | 90 min |
| 2 | [Koordineringsmönster](../chapter-06-pre-deployment/coordination-patterns.md) | Strategier för agentorkestrering | 30 min |
| 3 | [Distribution med ARM-mall](../../examples/retail-multiagent-arm-template/README.md) | Distribution med ett klick | 30 min |

---

## 🚀 Snabbstart

```bash
# Alternativ 1: Distribuera från en mall
azd init --template agent-openai-python-prompty
azd up

# Alternativ 2: Distribuera från ett agentmanifest (kräver azure.ai.agents-tillägget)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **Vilket tillvägagångssätt?** Använd `azd init --template` för att starta från ett fungerande exempel. Använd `azd ai agent init` när du har din egen agentmanifest. Se [Referens för AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) för fullständiga detaljer.

---

## 🤖 Multi-agentarkitektur

```mermaid
graph TD
    Orchestrator[Orkestreringsagent<br/>Dirigerar förfrågningar, hanterar arbetsflöde] --> Customer[Kundagent<br/>Användarfrågor, preferenser]
    Orchestrator --> Inventory[Lageragent<br/>Lagernivåer, beställningar]
```
---

## 🎯 Utvald lösning: Retail Multi-Agent

The [Retail Multi-Agent-lösning](../../examples/retail-scenario.md) demonstrerar:

- **Kundagent**: Hanterar användarinteraktioner och preferenser
- **Lageragent**: Hanterar lager och orderhantering
- **Orkestrator**: Koordinerar mellan agenter
- **Delat minne**: Hantering av kontext över agenter

### Använda tjänster

| Tjänst | Syfte |
|---------|---------|
| Microsoft Foundry Models | Språkförståelse |
| Azure AI Search | Produktkatalog |
| Cosmos DB | Agenttillstånd och minne |
| Container Apps | Värd för agenter |
| Application Insights | Övervakning |

---

## 🔗 Navigering

| Riktning | Kapitel |
|-----------|---------|
| **Previous** | [Kapitel 4: Infrastruktur](../chapter-04-infrastructure/README.md) |
| **Next** | [Kapitel 6: Fördistribution](../chapter-06-pre-deployment/README.md) |

---

## 📖 Relaterade resurser

- [Guide för AI-agenter](../chapter-02-ai-development/agents.md)
- [Produktionspraxis för AI](../chapter-08-production/production-ai-practices.md)
- [AI-felsökning](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI‑översättningstjänsten Co‑op Translator (https://github.com/Azure/co-op-translator). Vi strävar efter noggrannhet, men var medveten om att automatiska översättningar kan innehålla fel eller brister. Originaldokumentet på dess ursprungliga språk ska betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår till följd av användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
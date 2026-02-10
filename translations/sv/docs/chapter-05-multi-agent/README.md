# Kapitel 5: Multi-agent-AI-lösningar

**📚 Kurs**: [AZD för nybörjare](../../README.md) | **⏱️ Varaktighet**: 2-3 timmar | **⭐ Svårighetsgrad**: Avancerad

---

## Översikt

Detta kapitel täcker avancerade multi-agentarkitekturmönster, agentorkestrering och produktionsfärdiga AI-distributioner för komplexa scenarier.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Förstå multi-agentarkitekturmönster
- Driftsätta koordinerade AI-agentssystem
- Implementera agent-till-agent-kommunikation
- Bygga produktionsfärdiga multi-agentlösningar

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Multi-agentlösning för detaljhandel](../../examples/retail-scenario.md) | Fullständig genomgång av implementationen | 90 min |
| 2 | [Koordinationsmönster](../chapter-06-pre-deployment/coordination-patterns.md) | Strategier för agentorkestrering | 30 min |
| 3 | [Distribution av ARM-mall](../../examples/retail-multiagent-arm-template/README.md) | Distribution med ett klick | 30 min |

---

## 🚀 Kom igång snabbt

```bash
# Distribuera detaljhandelslösningen med flera agenter
cd examples/retail-multiagent-arm-template
./deploy.sh

# Eller använd mallen direkt
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Multi-agentarkitektur

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

## 🎯 Utvald lösning: Multi-agentlösning för detaljhandel

Lösningen [Multi-agentlösning för detaljhandel](../../examples/retail-scenario.md) visar:

- **Kundagent**: Hanterar användarinteraktioner och preferenser
- **Lageragent**: Hanterar lager och orderhantering
- **Orkestrator**: Koordinerar mellan agenterna
- **Delat minne**: Kontexthantering mellan agenter

### Tjänster som används

| Tjänst | Syfte |
|---------|---------|
| Azure OpenAI | Språkförståelse |
| Azure AI Search | Produktkatalog |
| Cosmos DB | Agenttillstånd och minne |
| Container Apps | Värd för agenter |
| Application Insights | Övervakning |

---

## 🔗 Navigering

| Riktning | Kapitel |
|-----------|---------|
| **Föregående** | [Kapitel 4: Infrastruktur](../chapter-04-infrastructure/README.md) |
| **Nästa** | [Kapitel 6: Fördistribution](../chapter-06-pre-deployment/README.md) |

---

## 📖 Relaterade resurser

- [Guide för AI-agenter](../chapter-02-ai-development/agents.md)
- [Produktionspraxis för AI](../chapter-08-production/production-ai-practices.md)
- [Felsökning för AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten Co-op Translator (https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, vänligen observera att automatiska översättningar kan innehålla misstag eller felaktigheter. Det ursprungliga dokumentet på dess ursprungsspråk bör betraktas som den auktoritativa källan. För viktig information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
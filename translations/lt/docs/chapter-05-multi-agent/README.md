# 5 skyrius: Daugiaagentės DI sprendimai

**📚 Kursas**: [AZD pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 2-3 val. | **⭐ Sudėtingumas**: Išplėstinis

---

## Apžvalga

Šiame skyriuje aptariami pažangūs daugiaagentės architektūros modeliai, agentų orkestracija ir gamybai paruošti DI diegimai sudėtingiems scenarijams.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Suprasite daugiaagentės architektūros modelius
- Išdėstysite koordinuotą DI agentų sistemą
- Įgyvendinsite agentų tarpusavio komunikaciją
- Kuriate gamybai paruoštus daugiaagentės sprendimus

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-------------|------|
| 1 | [Daugiaagentis mažmeninės prekybos sprendimas](../../examples/retail-scenario.md) | Išsamus įgyvendinimo vadovas | 90 min |
| 2 | [Koordinavimo modeliai](../chapter-06-pre-deployment/coordination-patterns.md) | Agentų orkestravimo strategijos | 30 min |
| 3 | [ARM šablono diegimas](../../examples/retail-multiagent-arm-template/README.md) | Vieno paspaudimo diegimas | 30 min |

---

## 🚀 Greita pradžia

```bash
# Diegti mažmeninės prekybos daugiagentinį sprendimą
cd examples/retail-multiagent-arm-template
./deploy.sh

# Arba naudokite šabloną tiesiogiai
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Daugiaagentė architektūra

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

## 🎯 Išryškintas sprendimas: Daugiaagentis mažmeninės prekybos sprendimas

The [Daugiaagentis mažmeninės prekybos sprendimas](../../examples/retail-scenario.md) demonstrates:

- **Kliento agentas**: Tvarko vartotojo sąveikas ir preferencijas
- **Inventoriaus agentas**: Valdo atsargas ir užsakymų apdorojimą
- **Orkestratorius**: Koordinuoja agentus tarpusavyje
- **Bendra atmintis**: Tarpagentinis konteksto valdymas

### Naudojamos paslaugos

| Service | Purpose |
|---------|---------|
| Azure OpenAI | Kalbos supratimas |
| Azure AI Search | Produktų katalogas |
| Cosmos DB | Agento būsena ir atmintis |
| Container Apps | Agentų talpinimas |
| Application Insights | Monitoravimas |

---

## 🔗 Navigacija

| Direction | Chapter |
|-----------|---------|
| **Ankstesnis** | [4 skyrius: Infrastruktūra](../chapter-04-infrastructure/README.md) |
| **Kitas** | [6 skyrius: Prieš diegimą](../chapter-06-pre-deployment/README.md) |

---

## 📖 Susiję ištekliai

- [DI agentų gidas](../chapter-02-ai-development/agents.md)
- [Gamybinio DI praktikos](../chapter-08-production/production-ai-practices.md)
- [DI trikčių šalinimas](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas pasitelkus dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus žmogaus vertimas. Mes neprisiimame atsakomybės už bet kokius nesusipratimus ar neteisingas interpretacijas, kylančias dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
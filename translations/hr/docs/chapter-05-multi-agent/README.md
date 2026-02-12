# Poglavlje 5: Višenagentska AI rješenja

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 2-3 hours | **⭐ Složenost**: Advanced

---

## Pregled

Ovo poglavlje pokriva napredne obrasce arhitekture za višenagentske sustave, orkestraciju agenata i produkcijsko spremna AI rješenja za složene scenarije.

## Ciljevi učenja

Po dovršetku ovog poglavlja, vi ćete:
- Razumjeti obrasce arhitekture višenagentnih sustava
- Rasporediti koordinirane AI agentske sustave
- Implementirati komunikaciju između agenata
- Izgraditi proizvodno spremna višenagentska rješenja

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Maloprodajno višenagentsko rješenje](../../examples/retail-scenario.md) | Detaljan prikaz implementacije | 90 min |
| 2 | [Obrasci koordinacije](../chapter-06-pre-deployment/coordination-patterns.md) | Strategije orkestracije agenata | 30 min |
| 3 | [Implementacija ARM predloška](../../examples/retail-multiagent-arm-template/README.md) | Raspoređivanje jednim klikom | 30 min |

---

## 🚀 Brzi početak

```bash
# Postavite rješenje za maloprodaju s više agenata
cd examples/retail-multiagent-arm-template
./deploy.sh

# Ili upotrijebite predložak izravno
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Višenagentska arhitektura

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

## 🎯 Istaknuto rješenje: Maloprodajno višenagentsko rješenje

The [Maloprodajno višenagentsko rješenje](../../examples/retail-scenario.md) demonstrates:

- **Agent za korisnike**: Upravlja korisničkim interakcijama i preferencijama
- **Agent zaliha**: Upravlja zalihama i obradom narudžbi
- **Orkestrator**: Koordinira između agenata
- **Zajednička memorija**: Upravljanje kontekstom među agentima

### Korištene usluge

| Usluga | Svrha |
|---------|---------|
| Azure OpenAI | Razumijevanje jezika |
| Azure AI Search | Katalog proizvoda |
| Cosmos DB | Stanje i memorija agenata |
| Container Apps | Hosting agenata |
| Application Insights | Praćenje |

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 4: Infrastructure](../chapter-04-infrastructure/README.md) |
| **Sljedeće** | [Poglavlje 6: Pred-Deployment](../chapter-06-pre-deployment/README.md) |

---

## 📖 Povezani resursi

- [Vodič za AI agente](../chapter-02-ai-development/agents.md)
- [Prakse za proizvodni AI](../chapter-08-production/production-ai-practices.md)
- [Rješavanje problema s AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Odricanje odgovornosti:
Ovaj dokument je preveden pomoću usluge za prijevod uz umjetnu inteligenciju Co-op Translator (https://github.com/Azure/co-op-translator). Iako se trudimo biti točni, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na njegovu izvornu jezičnu inačicu treba smatrati mjerodavnim izvorom. Za kritične informacije preporučujemo profesionalan ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
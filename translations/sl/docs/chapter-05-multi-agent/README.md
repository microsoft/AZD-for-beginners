# Poglavje 5: Rešitve večagentne umetne inteligence

**📚 Tečaj**: [AZD For Beginners](../../README.md) | **⏱️ Trajanje**: 2-3 ure | **⭐ Zahtevnost**: Napredno

---

## Pregled

To poglavje pokriva napredne vzorce arhitekture večagentnih sistemov, orkestracijo agentov in produkcijsko pripravljene AI namestitve za kompleksne scenarije.

## Cilji učenja

Z dokončanjem tega poglavja boste:
- Razumeli vzorce arhitekture večagentnih sistemov
- Namestili usklajene sisteme AI agentov
- Implementirali komunikacijo med agenti
- Zgradili produkcijsko pripravljene večagentne rešitve

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Večagentna maloprodajna rešitev](../../examples/retail-scenario.md) | Celovit pregled implementacije | 90 min |
| 2 | [Vzorce koordinacije](../chapter-06-pre-deployment/coordination-patterns.md) | Strategije orkestracije agentov | 30 min |
| 3 | [Namestitev z ARM-predlogo](../../examples/retail-multiagent-arm-template/README.md) | Namestitev z enim klikom | 30 min |

---

## 🚀 Hiter začetek

```bash
# Razporedi večagentno rešitev za maloprodajo
cd examples/retail-multiagent-arm-template
./deploy.sh

# Ali pa neposredno uporabi predlogo
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Arhitektura večagentnih sistemov

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

## 🎯 Predstavljena rešitev: Maloprodajna večagentna rešitev

The [Retail Multi-Agent Solution](../../examples/retail-scenario.md) demonstrates:

- **Agent stranke**: Upravlja uporabniške interakcije in preference
- **Agent za zalogo**: Upravlja zalogo in obdelavo naročil
- **Orkestrator**: Koordinira med agenti
- **Deljeni pomnilnik**: Upravljanje konteksta med agenti

### Uporabljene storitve

| Storitev | Namen |
|---------|---------|
| Azure OpenAI | Razumevanje jezika |
| Azure AI Search | Katalog izdelkov |
| Cosmos DB | Stanje in pomnilnik agenta |
| Container Apps | Gostovanje agentov |
| Application Insights | Spremljanje |

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 4: Infrastructure](../chapter-04-infrastructure/README.md) |
| **Naslednje** | [Poglavje 6: Prednamestitev](../chapter-06-pre-deployment/README.md) |

---

## 📖 Sorodni viri

- [Vodnik po AI agentih](../chapter-02-ai-development/agents.md)
- [Prakse AI v produkciji](../chapter-08-production/production-ai-practices.md)
- [Odpravljanje težav z AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v izvor­nem jeziku velja za avtoritativni vir. Za ključne informacije priporočamo strokovni človeški prevod. Nismo odgovorni za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
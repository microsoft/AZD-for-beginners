# Capitolul 5: Soluții AI Multi-Agent

**📚 Curs**: [AZD pentru Începători](../../README.md) | **⏱️ Durată**: 2-3 ore | **⭐ Complexitate**: Avansat

---

## Prezentare generală

Acest capitol acoperă modele avansate de arhitectură multi-agent, orchestrarea agenților și implementări AI gata de producție pentru scenarii complexe.

## Obiective de învățare

Parcurgând acest capitol, vei:
- Înțelege modele de arhitectură multi-agent
- Implementa sisteme de agenți AI coordonați
- Implementa comunicarea agent-la-agent
- Construi soluții multi-agent gata pentru producție

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Soluție Retail Multi-Agent](../../examples/retail-scenario.md) | Parcurgere completă a implementării | 90 min |
| 2 | [Modele de coordonare](../chapter-06-pre-deployment/coordination-patterns.md) | Strategii de orchestrare a agenților | 30 min |
| 3 | [Implementare Template ARM](../../examples/retail-multiagent-arm-template/README.md) | Implementare cu un singur clic | 30 min |

---

## 🚀 Pornire rapidă

```bash
# Implementați soluția multi-agent pentru vânzare cu amănuntul
cd examples/retail-multiagent-arm-template
./deploy.sh

# Sau folosiți direct șablonul
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Arhitectură Multi-Agent

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

## 🎯 Soluție prezentată: Retail Multi-Agent

Exemplul [Soluție Retail Multi-Agent](../../examples/retail-scenario.md) demonstrează:

- **Agent Client**: Gestionează interacțiunile utilizatorilor și preferințele
- **Agent Inventar**: Administrează stocul și procesarea comenzilor
- **Orchestrator**: Coordonează interacțiunile dintre agenți
- **Memorie partajată**: Gestionarea contextului între agenți

### Servicii utilizate

| Service | Purpose |
|---------|---------|
| Azure OpenAI | Înțelegere a limbajului |
| Azure AI Search | Catalog de produse |
| Cosmos DB | Starea și memoria agenților |
| Container Apps | Găzduire agenți |
| Application Insights | Monitorizare |

---

## 🔗 Navigare

| Direction | Chapter |
|-----------|---------|
| **Anterior** | [Capitolul 4: Infrastructură](../chapter-04-infrastructure/README.md) |
| **Următor** | [Capitolul 6: Pre-implementare](../chapter-06-pre-deployment/README.md) |

---

## 📖 Resurse conexe

- [Ghid agenți AI](../chapter-02-ai-development/agents.md)
- [Practici AI pentru producție](../chapter-08-production/production-ai-practices.md)
- [Depanare AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Declinare de responsabilitate:
Acest document a fost tradus cu ajutorul serviciului de traducere prin inteligență artificială [Co-op Translator] (https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Chapter 2: AI-First Development

**📚 Tečaj**: [AZD For Beginners](../../README.md) | **⏱️ Trajanje**: 1-2 hours | **⭐ Složenost**: Srednje

---

## Pregled

Ovo poglavlje usredotočeno je na razmještanje aplikacija potpomognutih umjetnom inteligencijom koristeći Azure Developer CLI i Microsoft Foundry usluge. Od jednostavnih AI chat aplikacija do inteligentnih agenata s alatima.

## Ciljevi učenja

Po dovršetku ovog poglavlja, moći ćete:
- Razmjestiti AI aplikacije koristeći unaprijed izrađene AZD predloške
- Razumjeti integraciju Microsoft Foundry s AZD
- Konfigurirati i prilagoditi AI agente s alatima
- Razmjestiti RAG (Retrieval-Augmented Generation) aplikacije

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Integracija Microsoft Foundry](microsoft-foundry-integration.md) | Povežite AZD s Foundry uslugama | 30 min |
| 2 | [Vodič za AI agente](agents.md) | Razmjestite inteligentne agente s alatima | 45 min |
| 3 | [Razmještanje AI modela](ai-model-deployment.md) | Razmjestite i konfigurirajte AI modele | 30 min |
| 4 | [AI radionica - laboratorij](ai-workshop-lab.md) | Praktično: Pripremite svoje AI rješenje za AZD | 60 min |

---

## 🚀 Brzi početak

```bash
# Opcija 1: RAG chat aplikacija
azd init --template azure-search-openai-demo
azd up

# Opcija 2: AI agenti
azd init --template get-started-with-ai-agents
azd up

# Opcija 3: Brza chat aplikacija
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Istaknuti AI predlošci

| Predložak | Opis | Usluge |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat s citatima | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent s alatima | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Osnovni AI chat | OpenAI + Container Apps |

---

## 💰 Svijest o troškovima

| Okruženje | Procijenjeni mjesečni trošak |
|-------------|----------------------|
| Razvoj | $80-150 |
| Predprodukcija | $150-300 |
| Produkcija | $300-3,500+ |

**Savjet:** Pokrenite `azd down` nakon testiranja kako biste izbjegli troškove.

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 1: Osnove](../chapter-01-foundation/README.md) |
| **Sljedeće** | [Poglavlje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Preskoči na** | [Poglavlje 8: Obrasci za produkciju](../chapter-08-production/README.md) |

---

## 📖 Povezani resursi

- [Rješavanje problema s AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Prakse AI u produkciji](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Odricanje odgovornosti:
Ovaj je dokument preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni prijevod. Ne snosimo odgovornost za bilo kakva nerazumijevanja ili pogrešna tumačenja koja proizlaze iz upotrebe ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
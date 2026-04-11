# Chapter 2: AI-First Development

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Trajanje**: 1-2 sati | **⭐ Složenost**: Srednja

---

## Pregled

Ovo poglavlje fokusira se na implementaciju aplikacija s AI podrškom koristeći Azure Developer CLI i Microsoft Foundry usluge. Od jednostavnih AI chat aplikacija do inteligentnih agenata s alatima.

> **Napomena o potvrdi (2026-03-25):** Tijek naredbi i smjernice za proširenja u ovom poglavlju pregledani su u odnosu na `azd` `1.23.12` i trenutačno izdanje pregleda proširenja AI agenta `azure.ai.agents` `0.1.18-preview`. Ako koristite stariju verziju AZD-a, prvo ažurirajte, a zatim nastavite s vježbama.

## Ciljevi učenja

Nakon dovršetka ovog poglavlja, moći ćete:
- Implementirati AI aplikacije koristeći unaprijed izrađene AZD predloške
- Razumjeti integraciju Microsoft Foundry s AZD-om
- Konfigurirati i prilagoditi AI agente s alatima
- Implementirati RAG (Retrieval-Augmented Generation) aplikacije

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|---------|-------|---------|
| 1 | [Microsoft Foundry integracija](microsoft-foundry-integration.md) | Povezivanje AZD-a s Foundry uslugama | 30 min |
| 2 | [Vodič za AI agente](agents.md) | Implementacija inteligentnih agenata s alatima | 45 min |
| 3 | [Implementacija AI modela](ai-model-deployment.md) | Implementacija i konfiguracija AI modela | 30 min |
| 4 | [AI radionica laboratorij](ai-workshop-lab.md) | Praktično: Pripremite svoje AI rješenje za AZD | 60 min |

---

## 🚀 Brzi početak

```bash
# Opcija 1: RAG Chat aplikacija
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
|-----------|-------|---------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat s citatima | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent s alatima | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Osnovni AI chat | OpenAI + Container Apps |

---

## 💰 Svijest o troškovima

| Okruženje | Procijenjeni mjesečni trošak |
|-----------|-----------------------------|
| Razvoj | $80-150 |
| Staging | $150-300 |
| Produkcija | $300-3,500+ |

**Savjet:** Pokrenite `azd down` nakon testiranja kako biste izbjegli troškove.

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|--------|------------|
| **Prethodno** | [Poglavlje 1: Osnove](../chapter-01-foundation/README.md) |
| **Sljedeće** | [Poglavlje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Preskoči na** | [Poglavlje 8: Produkcijski obrasci](../chapter-08-production/README.md) |

---

## 📖 Povezani resursi

- [Rješavanje problema s AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Prakse proizvodnje AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument je preveden pomoću AI prevodilačke usluge [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, molimo imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazuma ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Poglavlje 2: Razvoj s fokusom na umjetnu inteligenciju (AI-First)

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 1-2 sata | **⭐ Složenost**: Srednja razina

---

## Pregled

Ovo poglavlje fokusira se na implementaciju aplikacija potpomognutih umjetnom inteligencijom korištenjem Azure Developer CLI i Microsoft Foundry usluga. Od jednostavnih AI chat aplikacija do inteligentnih agenata s alatima.

> **Napomena validacije (2026-06-15):** Tijek naredbi i upute za proširenja u ovom poglavlju pregledani su nasuprot `azd` verziji `1.25.6` i trenutnom preview izdanju AI agent proširenja `azure.ai.agents` `0.1.40-preview`. Ako koristite stariju AZD verziju, prvo ažurirajte, zatim nastavite s vježbama.

## Ciljevi učenja

Nakon završetka ovog poglavlja moći ćete:
- Implementirati AI aplikacije koristeći prethodno izrađene AZD predloške
- Razumjeti integraciju Microsoft Foundry sa AZD-om
- Konfigurirati i prilagoditi AI agente s alatima
- Implementirati RAG (Retrieval-Augmented Generation) aplikacije

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|---------|-------|---------|
| 1 | [Integracija Microsoft Foundry](microsoft-foundry-integration.md) | Povezivanje AZD-a s Foundry uslugama | 30 min |
| 2 | [Vodič za AI agente](agents.md) | Implementacija inteligentnih agenata s alatima | 45 min |
| 3 | [Implementacija AI modela](ai-model-deployment.md) | Implementacija i konfiguracija AI modela | 30 min |
| 4 | [AI radionica](ai-workshop-lab.md) | Praktično: Pripremite svoje AI rješenje za AZD | 60 min |

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

## 🤖 Izdvojeni AI predlošci

| Predložak | Opis | Usluge |
|-----------|-------|--------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat s citatima | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent s alatima | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Osnovni AI chat | OpenAI + Container Apps |

---

## 💰 Svijest o troškovima

| Okruženje | Procijenjeni mjesečni trošak |
|-----------|-------------------------------|
| Razvoj | $80-150 |
| Predprodukcija | $150-300 |
| Proizvodnja | $300-3,500+ |

**Savjet:** Pokrenite `azd down` nakon testiranja kako biste izbjegli troškove.

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|--------|------------|
| **Prethodno** | [Poglavlje 1: Temelji](../chapter-01-foundation/README.md) |
| **Sljedeće** | [Poglavlje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Preskoči na** | [Poglavlje 8: Obradbeni obrasci](../chapter-08-production/README.md) |

---

## 📖 Povezani resursi

- [Rješavanje problema s AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Prakse za proizvodni AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
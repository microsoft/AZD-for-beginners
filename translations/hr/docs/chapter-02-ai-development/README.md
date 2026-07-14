# Poglavlje 2: AI-First razvoj

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 1-2 sata | **⭐ Kompleksnost**: Srednja

---

## Pregled

Ovo poglavlje se fokusira na implementaciju aplikacija s umjetnom inteligencijom koristeći Azure Developer CLI i Microsoft Foundry usluge. Od jednostavnih AI chat aplikacija do inteligentnih agenata s alatima.

> **Napomena o provjeri (2026-07-13):** Tok naredbi i upute za proširenja u ovom poglavlju pregledani su u odnosu na `azd` `1.27.1` i aktualno pregledno izdanje AI agent proširenja `azure.ai.agents` `1.0.0-beta.5`. Ako koristite stariju AZD verziju, prvo je ažurirajte, a zatim nastavite s vježbama.

## Ciljevi učenja

Završetkom ovog poglavlja ćete:
- Implementirati AI aplikacije koristeći unaprijed izrađene AZD predloške
- Razumjeti integraciju Microsoft Foundry sa AZD
- Konfigurirati i prilagoditi AI agente s alatima
- Implementirati RAG (Pretraživanje-rafinirana generacija) aplikacije

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry integracija](microsoft-foundry-integration.md) | Povežite AZD s Foundry uslugama | 30 min |
| 2 | [Vodič za AI agente](agents.md) | Implementirajte inteligentne agente s alatima | 45 min |
| 3 | [Implementacija AI modela](ai-model-deployment.md) | Implementirajte i konfigurirajte AI modele | 30 min |
| 4 | [AI radionica laboratorij](ai-workshop-lab.md) | Praktični rad: Pripremite svoje AI rješenje za AZD | 60 min |

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
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat s citatima | OpenAI + AI pretraživanje |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent s alatima | AI Agent usluga |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Osnovni AI chat | OpenAI + Container Apps |

---

## 💰 Svijest o troškovima

| Okruženje | Procijenjeni mjesečni trošak |
|-------------|----------------------|
| Razvoj | $80-150 |
| Testiranje | $150-300 |
| Produkcija | $300-3,500+ |

**Savjet:** Pokrenite `azd down` nakon testiranja kako biste izbjegli troškove.

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 1: Osnove](../chapter-01-foundation/README.md) |
| **Sljedeće** | [Poglavlje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Preskoči na** | [Poglavlje 8: Produkcijski obrasci](../chapter-08-production/README.md) |

---

## 📖 Povezani resursi

- [Rješavanje AI problema](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Prakse produkcijske AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
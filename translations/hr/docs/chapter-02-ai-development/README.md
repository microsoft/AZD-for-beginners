# Poglavlje 2: AI-First razvoj

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 4-5 sati uključujući radionicu | **⭐ Kompleksnost**: Srednja

---

## Pregled

Ovo poglavlje usredotočuje se na implementaciju AI-pokretanih aplikacija koristeći Azure Developer CLI i Microsoft Foundry usluge. Od jednostavnih AI chat aplikacija do inteligentnih agenata s alatima.

> **Pregled izdanja (2026-11-04):** AI CLI smjernice su provjerene prema objavljenim `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23` i `azure.ai.evaluations` `1.0.0-beta.2` dokumentaciji/izvoru. Koristite `azd >= 1.37.0` za kombinirani tijek rada. Evaluacije sada koriste zasebni `azd ai eval` namespace; vidi [promjene izdanja i smjernice za migraciju](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Ovo nije validacija u stvarnom vremenu.

## Ciljevi učenja

Završetkom ovog poglavlja ćete:
- Implementirati AI aplikacije koristeći unaprijed izrađene AZD predloške
- Razumjeti integraciju Microsoft Foundry s AZD
- Konfigurirati i prilagoditi AI agente s alatima
- Implementirati RAG (Retrieval-Augmented Generation) aplikacije

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Integracija Microsoft Foundry](microsoft-foundry-integration.md) | Povezivanje AZD s Foundry uslugama | 30 min |
| 2 | [Vodič za AI agente](agents.md) | Implementacija inteligentnih agenata s alatima | 45 min |
| 3 | [Implementacija AI modela](ai-model-deployment.md) | Implementacija i konfiguracija AI modela | 30 min |
| 4 | [AI radionica laboratorij](ai-workshop-lab.md) | Praktično: Istražite predložak i isplanirajte svoju konverziju | 2-3 sata |

---

## 🚀 Brz početak

Odaberite jednu opciju u novom praznom direktoriju. Završni `.` inicijalizira trenutni direktorij; inače AZD može napraviti poddirektorij bez mijenjanja radnog direktorija vašeg terminala.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
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

Ovo su ilustrativni rasponi, a ne ponude ili ograničenja; promet modela, Search/compute SKU-ovi, regija i dodatne opcije mogu ih premašiti. Pregledajte trenutne cijene izabranog primjera prije provisioniranja.

| Okruženje | Procijenjeni mjesečni trošak |
|-------------|----------------------|
| Razvoj | $80-150 |
| Testno okruženje | $150-300 |
| Produkcija | $300-3,500+ |

**Savjet:** Pokrenite `azd down` nakon testiranja kako biste izbjegli naplatu.

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 1: Osnove](../chapter-01-foundation/README.md) |
| **Sljedeće** | [Poglavlje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Preskoči na** | [Poglavlje 8: Produkcijski obrasci](../chapter-08-production/README.md) |

---

## 📖 Povezani resursi

- [Rješavanje problema AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Produkcijske AI prakse](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
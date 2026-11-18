# Poglavlje 2: Razvoj s fokusom na umjetnu inteligenciju

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 4-5 sati uključujući radionicu | **⭐ Kompleksnost**: Srednja

---

## Pregled

Ovo poglavlje se fokusira na implementaciju aplikacija pokretanih umjetnom inteligencijom koristeći Azure Developer CLI i Microsoft Foundry usluge. Od jednostavnih AI chat aplikacija do inteligentnih agenata s alatima.

> **Foundry GA ažuriranje (2026-11-09):** Paket `microsoft.foundry` 1.0 je [općenito dostupan](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Koristite `azd >= 1.37.0`; evaluacije ostaju zasebna instalacija. [Vodič za hostiranog agenta](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) obuhvaća lokalno testiranje Agent Inspectora i udaljeno postavljanje koda. Ovo je pregled dokumentacije, a ne provjera stvarnog postavljanja; opcionalne pregledne značajke zadržavaju svoj status.

## Ciljevi učenja

Završetkom ovog poglavlja, moći ćete:
- Postavljati AI aplikacije koristeći unaprijed izrađene AZD predloške
- Razumjeti Microsoft Foundry integraciju s AZD-om
- Instalirati GA paket i testirati hostiranog agenta lokalno prije postavljanja izvornog koda u Foundry
- Pregledati `azure.yaml`, evaluacijske resurse i čišćenje novih u odnosu na ponovno korištene projekte
- Konfigurirati i prilagoditi AI agente pomoću alata
- Postavljati RAG (Retrieval-Augmented Generation) aplikacije

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integracija](microsoft-foundry-integration.md) | GA paket, lokalni do cloud tijek rada hostiranog agenta i evaluacije | 60 min |
| 2 | [Vodič za AI Agente](agents.md) | Postavljanje inteligentnih agenata pomoću alata | 45 min |
| 3 | [Postavljanje AI Modela](ai-model-deployment.md) | Postavljanje i konfiguracija AI modela | 30 min |
| 4 | [Laboratorij AI Radionice](ai-workshop-lab.md) | Praktično: Istražite predložak i planirajte svoj prijelaz | 2-3 sata |

---

## 🚀 Brzi početak

Odaberite opciju u novom praznom direktoriju. Završni `.` inicijalizira trenutni direktorij; inače AZD može stvoriti poddirektorij bez promjene radnog direktorija u vašem terminalu.

Za **GA put postavljanja koda hostiranog agenta**, započnite s [vođenim vodičem](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Potrebni su AZD 1.37.0+, trenutni uv, Python 3.13+, Foundry dopuštenja i kvota modela. Cjeloviti aplikacijski predlošci ispod su alternative, a ne preduvjeti za taj vodič.

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

| Predložak | Opis | Servisi |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat s citatima | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent s alatima | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Osnovni AI chat | OpenAI + Container Apps |

---

## 💰 Svijest o troškovima

Ovo su ilustrativni rasponi, a ne ponude ili ograničenja; promet modela, Search/compute SKU-ovi, regija i opcionalne značajke mogu ih premašiti. Pregledajte trenutačne upute o cijenama odabranog uzorka prije nabave.

| Okoliš | Procijenjeni mjesečni trošak |
|-------------|----------------------|
| Razvoj | $80-150 |
| Testiranje | $150-300 |
| Proizvodnja | $300-3,500+ |

**Čišćenje:** Pregledajte `azd down` prije potvrde: za novokreirani Foundry projekt briše grupu resursa i sve u njoj. Za ponovno upotrijebljeni Foundry projekt ostavlja projekt i resurse agenata na mjestu; slijedite [upute za čišćenje iz vodiča](microsoft-foundry-integration.md#7-clean-up-deliberately) da zasebno uklonite neželjene resurse.

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 1: Osnove](../chapter-01-foundation/README.md) |
| **Sljedeće** | [Poglavlje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Preskoči na** | [Poglavlje 8: Obrasci u proizvodnji](../chapter-08-production/README.md) |

---

## 📖 Povezani resursi

- [Otklanjanje poteškoća s AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Prakse proizvodnog AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
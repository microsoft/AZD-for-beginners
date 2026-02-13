# Skyrius 2: AI pirmumo kūrimas

**📚 Kursas**: [AZD pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 1-2 val. | **⭐ Sudėtingumas**: Vidutinio lygio

---

## Apžvalga

Šis skyrius orientuotas į AI varomų programų diegimą naudojant Azure Developer CLI ir Microsoft Foundry paslaugas. Nuo paprastų AI pokalbių programėlių iki intelektualių agentų su įrankiais.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Diegsite AI programas naudodami iš anksto paruoštus AZD šablonus
- Suprasite Microsoft Foundry integraciją su AZD
- Konfigūruosite ir pritaikysite AI agentus su įrankiais
- Diegsite RAG (Retrieval-Augmented Generation) programas

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry integracija](microsoft-foundry-integration.md) | Sujungti AZD su Foundry paslaugomis | 30 min |
| 2 | [AI agentų vadovas](agents.md) | Diegti intelektualius agentus su įrankiais | 45 min |
| 3 | [AI modelių diegimas](ai-model-deployment.md) | Diegti ir konfigūruoti AI modelius | 30 min |
| 4 | [AI praktinės dirbtuvės](ai-workshop-lab.md) | Praktika: paruoškite savo AI sprendimą AZD | 60 min |

---

## 🚀 Greitas startas

```bash
# Parinktis 1: RAG pokalbių programėlė
azd init --template azure-search-openai-demo
azd up

# Parinktis 2: DI agentai
azd init --template get-started-with-ai-agents
azd up

# Parinktis 3: Greita pokalbių programėlė
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Rekomenduojami AI šablonai

| Šablonas | Aprašymas | Paslaugos |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG pokalbis su citatomis | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agentas su įrankiais | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Paprastas AI pokalbis | OpenAI + Container Apps |

---

## 💰 Sąnaudų suvokimas

| Aplinka | Apskaičiuotos mėnesinės išlaidos |
|-------------|----------------------|
| Vystymas | $80-150 |
| Parengimo | $150-300 |
| Produkcija | $300-3,500+ |

**Patarimas:** Vykdykite `azd down` po testavimo, kad išvengtumėte mokesčių.

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|-----------|---------|
| **Ankstesnis** | [Skyrius 1: Pagrindai](../chapter-01-foundation/README.md) |
| **Kitas** | [Skyrius 3: Konfigūracija](../chapter-03-configuration/README.md) |
| **Pereiti į** | [Skyrius 8: Produkcijos modeliai](../chapter-08-production/README.md) |

---

## 📖 Susiję ištekliai

- [AI trikčių šalinimas](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [AI praktikos gamyboje](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turi būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingas interpretacijas, kylančias dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
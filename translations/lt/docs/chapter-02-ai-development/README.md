# 2 skyrius: AI-Pirmasis kūrimas

**📚 Kursas**: [AZD Pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 4-5 valandos su praktiniu užsiėmimu | **⭐ Sudėtingumas**: Tarpinis

---

## Apžvalga

Šiame skyriuje daugiausia dėmesio skiriama AI pagrįstų programų diegimui naudojant Azure Developer CLI ir Microsoft Foundry paslaugas. Nuo paprastų AI pokalbių programėlių iki protingų agentų su įrankiais.

> **Išleidimo apžvalga (2026-11-04):** AI CLI gairės buvo patikrintos pagal paskelbtą `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23` ir `azure.ai.evaluations` `1.0.0-beta.2` dokumentaciją/šaltinius. Naudokite `azd >= 1.37.0` sujungtam darbo eigai. Vertinimams dabar naudojama atskira `azd ai eval` vardų sritis; žr. [išleidimo pakeitimus ir migracijos gaires](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Tai nėra tiesioginis diegimo patvirtinimas.

## Mokymosi tikslai

Vykdydami šį skyrių jūs:
- Optimizuosite AI programas naudodami iš anksto sukurtus AZD šablonus
- Suprasite Microsoft Foundry integraciją su AZD
- Konfigūruosite ir pritaikysite AI agentus su įrankiais
- Diegsite RAG (Retrieval-Augmented Generation) programas

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry integracija](microsoft-foundry-integration.md) | Susiekite AZD su Foundry paslaugomis | 30 min |
| 2 | [AI agentų vadovas](agents.md) | Diegkite intelektualius agentus su įrankiais | 45 min |
| 3 | [AI modelių diegimas](ai-model-deployment.md) | Diegkite ir konfigūruokite AI modelius | 30 min |
| 4 | [AI praktinis užsiėmimas](ai-workshop-lab.md) | Praktika: Išnagrinėkite šabloną ir suplanuokite konvertavimą | 2-3 valandos |

---

## 🚀 Greitas pradžia

Pasirinkite vieną parinktį naujame tuščiame kataloge. Gale esantis `.` inicijuoja esamą katalogą; kitu atveju AZD gali sukurti poskyrį nekeisdamas jūsų apvalkalo darbo katalogo.

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

## 🤖 Pasižymintys AI šablonai

| Šablonas | Aprašymas | Paslaugos |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG pokalbis su citatomis | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agentas su įrankiais | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Pagrindinis AI pokalbis | OpenAI + Container Apps |

---

## 💰 Sąnaudų supratimas

Tai yra iliustraciniai intervalai, o ne kainos ar limityrai; modelių srautas, Search/skaičiavimo SKU, regionas ir pasirenkamos funkcijos gali viršyti juos. Prieš teikdami paslaugas, peržiūrėkite pasirinkto pavyzdžio esamas kainų gaires.

| Aplinka | Numatomos mėnesinės išlaidos |
|-------------|----------------------------|
| Kūrimas | $80-150 |
| Parengimas | $150-300 |
| Gamyba | $300-3,500+ |

**Patariama:** Paleiskite `azd down` po testavimo, kad išvengtumėte mokesčių.

---

## 🔗 Navigacija

| Krytis | Skyrius |
|-----------|---------|
| **Ankstesnis** | [1 skyrius: Pagrindai](../chapter-01-foundation/README.md) |
| **Kitas** | [3 skyrius: Konfigūracija](../chapter-03-configuration/README.md) |
| **Praleisti iki** | [8 skyrius: Gamybos modeliai](../chapter-08-production/README.md) |

---

## 📖 Susiję ištekliai

- [AI trikčių šalinimas](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Gamybos AI praktikos](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
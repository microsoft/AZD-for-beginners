# 2 skyrius: AI pirmumo kūrimas

**📚 Kursas**: [AZD For Beginners](../../README.md) | **⏱️ Trukmė**: 1-2 val. | **⭐ Sudėtingumas**: Tarpinis

---

## Apžvalga

Šis skyrius skirtas diegti AI palaikančias programas naudojant Azure Developer CLI ir Microsoft Foundry paslaugas. Nuo paprastų AI pokalbių programų iki išmaniųjų agentų su įrankiais.

> **Tikrinimo pastaba (2026-06-15):** Komandų srautas ir išplėtimo gairės šiame skyriuje buvo peržiūrėti palyginus su `azd` `1.25.6` ir dabartiniu peržiūros AI agentų išplėtimo leidimu `azure.ai.agents` `0.1.40-preview`. Jei naudojate senesnę AZD versiją, pirmiausia atnaujinkite ir tik tada tęskite pratimus.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Diegti AI programas naudodami iš anksto paruoštus AZD šablonus
- Suprasti Microsoft Foundry integraciją su AZD
- Konfigūruoti ir pritaikyti AI agentus su įrankiais
- Diegti RAG (Retrieval-Augmented Generation) programas

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Trukmė |
|---|--------|-----------|--------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Sujungti AZD su Foundry paslaugomis | 30 min |
| 2 | [AI Agents Guide](agents.md) | Diegti išmaniuosius agentus su įrankiais | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Diegti ir konfigūruoti AI modelius | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktika: Paruoškite savo AI sprendimą darbui su AZD | 60 min |

---

## 🚀 Greitas startas

```bash
# Parinktis 1: RAG pokalbių programa
azd init --template azure-search-openai-demo
azd up

# Parinktis 2: dirbtinio intelekto agentai
azd init --template get-started-with-ai-agents
azd up

# Parinktis 3: greita pokalbių programa
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Atrinkti AI šablonai

| Šablonas | Aprašymas | Paslaugos |
|----------|-----------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG pokalbis su citavimais | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agentas su įrankiais | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Paprastas AI pokalbis | OpenAI + Container Apps |

---

## 💰 Kainų informacija

| Aplinka | Apskaičiuotos mėnesinės išlaidos |
|---------|-------------------------------|
| Vystymas | $80-150 |
| Parengimas | $150-300 |
| Gamyba | $300-3,500+ |

**Patarimas:** Paleiskite `azd down` po testavimo, kad išvengtumėte mokesčių.

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|---------|---------|
| **Ankstesnis** | [1 skyrius: Pagrindai](../chapter-01-foundation/README.md) |
| **Kitas** | [3 skyrius: Konfigūracija](../chapter-03-configuration/README.md) |
| **Praleisti į** | [8 skyrius: Gamybos modeliai](../chapter-08-production/README.md) |

---

## 📖 Susiję ištekliai

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [AI praktikos gamyboje](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 2 skyrius: Dirbtiniu intelektu grįstas vystymas

**📚 Kursas**: [AZD Pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 1-2 valandos | **⭐ Sudėtingumas**: Vidutinis

---

## Apžvalga

Šis skyrius skirtas AI pagrindu sukurtų programų diegimui naudojant Azure Developer CLI ir Microsoft Foundry paslaugas. Nuo paprastų AI pokalbių programų iki protingų agentų su įrankiais.

> **Patvirtinimo pastaba (2026-03-25):** Šio skyriaus komandų eiga ir plėtinių gairės buvo patikrintos su `azd` `1.23.12` ir dabartiniu AI agentų peržiūros plėtiniu `azure.ai.agents` `0.1.18-preview`. Jei naudojate senesnę AZD versiją, pirmiausia atnaujinkite ir tik tada tęskite pratimus.

## Mokymosi tikslai

Įvykdę šį skyrių, jūs:
- Diegsite AI programas naudodami paruoštas AZD šablonus
- Suprasite Microsoft Foundry integraciją su AZD
- Konfigūruosite ir pritaikysite AI agentus su įrankiais
- Diegsite RAG (retrieval-augmented generation) programas

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-----------|--------|
| 1 | [Microsoft Foundry integracija](microsoft-foundry-integration.md) | Prijungti AZD prie Foundry paslaugų | 30 min |
| 2 | [AI agentų vadovas](agents.md) | Diegti protingus agentus su įrankiais | 45 min |
| 3 | [AI modelio diegimas](ai-model-deployment.md) | Diegti ir konfigūruoti AI modelius | 30 min |
| 4 | [AI dirbtuvės laboratorija](ai-workshop-lab.md) | Praktika: Paruoškite savo AI sprendimą AZD | 60 min |

---

## 🚀 Greitas pradėjimas

```bash
# Parinktis 1: RAG pokalbių programa
azd init --template azure-search-openai-demo
azd up

# Parinktis 2: DI agentai
azd init --template get-started-with-ai-agents
azd up

# Parinktis 3: Greita pokalbių programa
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Rekomenduojami AI šablonai

| Šablonas | Aprašymas | Paslaugos |
|----------|-----------|-----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG pokalbis su citatomis | OpenAI + AI paieška |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agentas su įrankiais | AI agentų paslauga |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Pagrindinis AI pokalbis | OpenAI + Container Apps |

---

## 💰 Sąnaudų suvokimas

| Aplinka | Numatomos mėnesinės sąnaudos |
|---------|-------------------------------|
| Vystymas | 80-150 USD |
| Stendavimas | 150-300 USD |
| Gamyba | 300-3 500+ USD |

**Patarimas:** Paleiskite `azd down` po testavimo, kad išvengtumėte mokesčių.

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|---------|---------|
| **Ankstesnis** | [1 skyrius: Pagrindai](../chapter-01-foundation/README.md) |
| **Kitas** | [3 skyrius: Konfigūracija](../chapter-03-configuration/README.md) |
| **Praleisti iki** | [8 skyrius: Gamybiniai modeliai](../chapter-08-production/README.md) |

---

## 📖 Susiję ištekliai

- [AI trikčių šalinimas](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Gamybinės AI praktikos](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes nesame atsakingi už bet kokius nesusipratimus ar klaidingas interpretacijas, kilusias naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
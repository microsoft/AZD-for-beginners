# 2 skyrius: AI-Pirmas vystymas

**📚 Kursas**: [AZD pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 1-2 valandos | **⭐ Sudėtingumas**: Tarpinis

---

## Apžvalga

Šis skyrius skirtas AI pagrįstų programų diegimui naudojant Azure Developer CLI ir Microsoft Foundry paslaugas. Nuo paprastų AI pokalbių programų iki intelektualių agentų su įrankiais.

> **Patvirtinimo pastaba (2026-07-13):** Šio skyriaus komandinės eilutės vykdymas ir plėtinio gidas buvo peržiūrėti lyginant su `azd` `1.27.1` ir dabartine AI agento plėtinio peržiūros versija `azure.ai.agents` `1.0.0-beta.5`. Jei naudojate senesnę AZD versiją, pirmiausia atnaujinkite, tada tęskite pratimus.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Išdiegs AI programas naudodami iš anksto paruoštas AZD šablonus
- Suprasite Microsoft Foundry integraciją su AZD
- Konfigūruosite ir pritaikysite AI agentus su įrankiais
- Įdiegsite RAG (Retrieval-Augmented Generation) programas

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry integracija](microsoft-foundry-integration.md) | Prisijungimas prie Foundry paslaugų per AZD | 30 min |
| 2 | [AI agentų vadovas](agents.md) | Diegti intelektualius agentus su įrankiais | 45 min |
| 3 | [AI modelio diegimas](ai-model-deployment.md) | Įdiegti ir konfigūruoti AI modelius | 30 min |
| 4 | [AI dirbtuvės laboratorija](ai-workshop-lab.md) | Praktika: Paruoškite savo AI sprendimą AZD | 60 min |

---

## 🚀 Greitas startas

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

## 🤖 Pažymėti AI šablonai

| Šablonas | Aprašymas | Paslaugos |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG pokalbis su citatomis | OpenAI + AI paieška |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agentas su įrankiais | AI agentų paslauga |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Pagrindinis AI pokalbis | OpenAI + konteinerių programos |

---

## 💰 Kainų suvokimas

| Aplinka | Numatomos mėnesinės sąnaudos |
|-------------|----------------------|
| Kūrimas | 80–150 USD |
| Paruošimas | 150–300 USD |
| Gamyba | 300–3 500+ USD |

**Patarimas:** Po testo vykdykite `azd down`, kad išvengtumėte mokesčių.

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|-----------|---------|
| **Ankstesnis** | [1 skyrius: Pagrindai](../chapter-01-foundation/README.md) |
| **Kitas** | [3 skyrius: Konfigūracija](../chapter-03-configuration/README.md) |
| **Praleisti į** | [8 skyrius: Gamybos modeliai](../chapter-08-production/README.md) |

---

## 📖 Susiję šaltiniai

- [AI trikčių šalinimas](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Gamybos AI praktikos](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
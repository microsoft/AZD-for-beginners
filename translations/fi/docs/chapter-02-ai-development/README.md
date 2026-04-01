# Luku 2: AI-ensijainen kehitys

**📚 Kurssi**: [AZD aloittelijoille](../../README.md) | **⏱️ Kesto**: 1-2 hours | **⭐ Vaativuus**: Keskitaso

---

## Yleiskatsaus

Tämä luku keskittyy AI-kykyisten sovellusten käyttöönottoon Azure Developer CLI:n ja Microsoft Foundry -palvelujen avulla. Yksinkertaisista AI-chat-sovelluksista työkaluihin integroituihin älykkäisiin agenteihin.

> **Tarkistushuomautus (2026-03-25):** The command flow and extension guidance in this chapter were reviewed against `azd` `1.23.12` and the current preview AI agent extension release `azure.ai.agents` `0.1.18-preview`. If you are on an older AZD build, update first and then continue with the exercises.

## Oppimistavoitteet

Suorittamalla tämän luvun:
- Ota käyttöön AI-sovelluksia valmiiden AZD-mallien avulla
- Ymmärtää Microsoft Foundryn integrointi AZD:hen
- Konfiguroida ja mukauttaa AI-agentteja työkaluilla
- Ota käyttöön RAG (Retrieval-Augmented Generation) -sovelluksia

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Microsoft Foundryn integrointi](microsoft-foundry-integration.md) | Yhdistä AZD Foundry-palveluihin | 30 min |
| 2 | [AI-agenttien opas](agents.md) | Ota käyttöön älykkäitä agentteja työkaluilla | 45 min |
| 3 | [AI-mallien käyttöönotto](ai-model-deployment.md) | Ota käyttöön ja määritä AI-malleja | 30 min |
| 4 | [AI-työpaja](ai-workshop-lab.md) | Käytännön harjoitus: tee AI-ratkaisustasi AZD-valmis | 60 min |

---

## 🚀 Nopea aloitus

```bash
# Vaihtoehto 1: RAG-keskustelusovellus
azd init --template azure-search-openai-demo
azd up

# Vaihtoehto 2: Tekoälyagentit
azd init --template get-started-with-ai-agents
azd up

# Vaihtoehto 3: Nopea keskustelusovellus
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Esitellyt AI-mallipohjat

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-keskustelu lähdeviitteillä | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agentti työkaluilla | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Perus AI-chat | OpenAI + Container Apps |

---

## 💰 Kustannustietoisuus

| Ympäristö | Arvioidut kuukausikustannukset |
|-------------|----------------------|
| Kehitys | $80-150 |
| Esituotanto | $150-300 |
| Tuotanto | $300-3,500+ |

**Vinkki:** Suorita `azd down` testauksen jälkeen välttääksesi kuluja.

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Luku 1: Perusta](../chapter-01-foundation/README.md) |
| **Seuraava** | [Luku 3: Konfigurointi](../chapter-03-configuration/README.md) |
| **Siirry kohtaan** | [Luku 8: Tuotantomallit](../chapter-08-production/README.md) |

---

## 📖 Aiheeseen liittyvät resurssit

- [AI-vianmääritys](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [AI:n tuotantokäytännöt](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattisissa käännöksissä voi esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää virallisena lähteenä. Keskeisten tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa mahdollisista väärinymmärryksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
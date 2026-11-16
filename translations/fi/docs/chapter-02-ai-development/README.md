# Luku 2: AI-Ensisijainen Kehitys

**📚 Kurssi**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 4-5 tuntia sisältäen työpajan | **⭐ Vaativuus**: Keskitaso

---

## Yleiskatsaus

Tässä luvussa keskitytään AI-tehoisten sovellusten käyttöönottoon Azure Developer CLI:n ja Microsoft Foundry -palvelujen avulla. Yksinkertaisista AI-chat-sovelluksista älykkäisiin agenteihin työkalujen kanssa.

> **Julkaisun tarkistus (2026-11-04):** AI CLI -ohjeistus tarkistettiin julkaistua `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23` sekä `azure.ai.evaluations` `1.0.0-beta.2` dokumentaatiolähdettä vasten. Käytä `azd >= 1.37.0` yhdistettyyn työnkulkuun. Arvioinnit käyttävät nyt erillistä `azd ai eval` nimiavaruutta; katso [julkaisumuutokset ja siirtymäohjeet](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Tämä ei ole reaaliaikainen käyttöönoton validointi.

## Oppimistavoitteet

Tässä luvussa opit:
- Ottamaan AI-sovelluksia käyttöön valmiiden AZD-mallien avulla
- Ymmärtämään Microsoft Foundryn integroinnin AZD:hen
- Konfiguroimaan ja räätälöimään AI-agentteja työkaluineen
- Ottamaan käyttöön RAG (Retrieval-Augmented Generation) -sovelluksia

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Microsoft Foundryn integrointi](microsoft-foundry-integration.md) | Yhdistä AZD Foundry-palveluihin | 30 min |
| 2 | [AI-Agenttien opas](agents.md) | Ota käyttöön älykkäitä agentteja työkaluilla | 45 min |
| 3 | [AI-mallin käyttöönotto](ai-model-deployment.md) | Ota käyttöön ja konfiguroi AI-malleja | 30 min |
| 4 | [AI-työpajatyö](ai-workshop-lab.md) | Käytännössä: Tutustu mallipohjaan ja suunnittele muunnos | 2-3 tuntia |

---

## 🚀 Pika-aloitus

Valitse yksi vaihtoehto uudesta tyhjästä hakemistosta. Perässä oleva `.` alustaa nykyisen hakemiston; muuten AZD voi luoda alihakemiston muuttamatta komentotulkki-ikkunan työhakemistoa.

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

## 🤖 Esitellyt AI-mallit

| Malli | Kuvaus | Palvelut |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-chat viitteillä | OpenAI + AI-haku |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agentti työkaluilla | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Perus AI-chat | OpenAI + Container Apps |

---

## 💰 Kustannustietoisuus

Nämä ovat havainnollistavia vaihteluvälejä, eivät sitovia hintoja tai kattoja; malliliikenne, haku/laskenta-SKU:t, alue ja valinnaiset ominaisuudet voivat ylittää nämä. Tarkista valitsemasi mallin tämänhetkiset hinnoitteluohjeet ennen käyttöönottoa.

| Ympäristö | Arvioitu kuukausikustannus |
|-------------|----------------------|
| Kehitys | 80-150 $ |
| Esituotanto | 150-300 $ |
| Tuotanto | 300-3 500+ $ |

**Vinkki:** Suorita `azd down` testauksen jälkeen välttääksesi ylimääräiset kulut.

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Luku 1: Perusteet](../chapter-01-foundation/README.md) |
| **Seuraava** | [Luku 3: Konfigurointi](../chapter-03-configuration/README.md) |
| **Siirry** | [Luku 8: Tuotantomallit](../chapter-08-production/README.md) |

---

## 📖 Aiheeseen liittyvät resurssit

- [AI Vianetsintä](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Tuotannon AI-käytännöt](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
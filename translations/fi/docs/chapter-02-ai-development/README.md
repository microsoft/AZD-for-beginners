# Luku 2: AI-Ensimmäinen Kehitys

**📚 Kurssi**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 1-2 tuntia | **⭐ Vaativuus**: Keskitaso

---

## Yleiskatsaus

Tässä luvussa keskitytään AI-teknologialla toimivien sovellusten käyttöönottoon Azure Developer CLI:n ja Microsoft Foundryn palveluiden avulla. Yksinkertaisista AI-chat-sovelluksista älykkäisiin agenteihin työkalujen kanssa.

> **Vahvistushuomautus (2026-07-13):** Tämän luvun komentovirrat ja laajennusohjeet on tarkistettu `azd` version `1.27.1` ja nykyisen esikatselu AI-agenttilaajennuksen `azure.ai.agents` version `1.0.0-beta.5` mukaan. Jos käytät vanhempaa AZD-versiota, päivitä ensin ja jatka sitten harjoituksiin.

## Oppimistavoitteet

Tämän luvun suorittamalla osaat:
- Ottaa AI-sovelluksia käyttöön valmiilla AZD-malleilla
- Ymmärtää Microsoft Foundryn integraation AZD:n kanssa
- Määritellä ja mukauttaa AI-agentteja työkaluineen
- Ottaa käyttöön RAG (Retrieval-Augmented Generation) sovelluksia

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Microsoft Foundryn integraatio](microsoft-foundry-integration.md) | Yhdistä AZD Foundryn palveluihin | 30 min |
| 2 | [AI-agenttien opas](agents.md) | Ota käyttöön älykkäitä agentteja työkaluilla | 45 min |
| 3 | [AI-mallin käyttöönotto](ai-model-deployment.md) | Käyttöönotto ja AI-mallien määrittely | 30 min |
| 4 | [AI-työpajan laboratorio](ai-workshop-lab.md) | Käytännön harjoitus: Tee AI-ratkaisustasi AZD-valmis | 60 min |

---

## 🚀 Pika-aloitus

```bash
# Vaihtoehto 1: RAG-chat-sovellus
azd init --template azure-search-openai-demo
azd up

# Vaihtoehto 2: AI-agentit
azd init --template get-started-with-ai-agents
azd up

# Vaihtoehto 3: Nopea chat-sovellus
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Suositut AI-mallit

| Malli | Kuvaus | Palvelut |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-chat viitteillä | OpenAI + AI-haku |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agentti työkaluilla | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Perus AI-chat | OpenAI + Container Apps |

---

## 💰 Kustannustietoisuus

| Ympäristö | Arvioitu kuukausikustannus |
|-------------|----------------------|
| Kehitys | $80-150 |
| Testaus | $150-300 |
| Tuotanto | $300-3,500+ |

**Vinkki:** Suorita `azd down` testauksen jälkeen kulujen välttämiseksi.

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Luku 1: Perusta](../chapter-01-foundation/README.md) |
| **Seuraava** | [Luku 3: Konfigurointi](../chapter-03-configuration/README.md) |
| **Siirry kohtaan** | [Luku 8: Tuotantokuvioita](../chapter-08-production/README.md) |

---

## 📖 Liittyvät resurssit

- [AI-ongelmien ratkaisu](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Tuotannon AI-käytännöt](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Luku 2: AI-lähtöinen kehitys

**📚 Kurssi**: [AZD For Beginners](../../README.md) | **⏱️ Kesto**: 1-2 tuntia | **⭐ Vaikeustaso**: Keskitaso

---

## Yleiskatsaus

Tässä luvussa keskitytään AI-kykyisten sovellusten käyttöönottoon Azure Developer CLI:n ja Microsoft Foundry -palvelujen avulla. Sisältää yksinkertaisista AI-keskustelusovelluksista työkalujen avulla varustettuihin älykkäisiin agenteihin.

## Oppimistavoitteet

Tämän luvun suorittamalla opit:
- Ota käyttöön AI-sovelluksia valmiilla AZD-mallipohjilla
- Ymmärtää Microsoft Foundryn integrointi AZD:hen
- Määritä ja mukauta tekoälyagentteja työkaluilla
- Ota käyttöön RAG (Retrieval-Augmented Generation) -sovelluksia

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Yhdistä AZD Foundry-palveluihin | 30 min |
| 2 | [AI Agents Guide](agents.md) | Ota käyttöön älykkäitä agentteja työkaluilla | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Ota käyttöön ja määritä AI-malleja | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Käytännön harjoitus: Tee AI-ratkaisustasi AZD-valmis | 60 min |

---

## 🚀 Nopea aloitus

```bash
# Vaihtoehto 1: RAG-chat-sovellus
azd init --template azure-search-openai-demo
azd up

# Vaihtoehto 2: tekoälyagentit
azd init --template get-started-with-ai-agents
azd up

# Vaihtoehto 3: nopea chat-sovellus
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Esitellyt AI-mallit

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-keskustelu lähdeviitteillä | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agentti työkaluineen | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Perus AI-keskustelu | OpenAI + Container Apps |

---

## 💰 Kustannustietoisuus

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Vinkki:** Suorita `azd down` testauksen jälkeen välttääksesi maksut.

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Luku 1: Perusta](../chapter-01-foundation/README.md) |
| **Seuraava** | [Luku 3: Konfigurointi](../chapter-03-configuration/README.md) |
| **Siirry kohtaan** | [Luku 8: Tuotantomallit](../chapter-08-production/README.md) |

---

## 📖 Liittyvät resurssit

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty käyttäen tekoälypohjaista käännöspalvelua Co-op Translator (https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattisissa käännöksissä voi olla virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulee pitää auktoritatiivisena lähteenä. Kriittisten tietojen osalta suositellaan ammattikääntäjän tekemää käännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinkäsityksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
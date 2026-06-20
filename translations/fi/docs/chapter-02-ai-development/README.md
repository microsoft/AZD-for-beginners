# Luku 2: AI-Ensisijainen kehitys

**📚 Kurssi**: [AZD For Beginners](../../README.md) | **⏱️ Kesto**: 1–2 tuntia | **⭐ Vaativuus**: Keskitaso

---

## Yleiskatsaus

Tämä luku keskittyy AI-ominaisuuksia hyödyntävien sovellusten käyttöönottoon Azure Developer CLI:n ja Microsoft Foundry -palvelujen avulla. Yksinkertaisista AI-chat-sovelluksista työkalujen kanssa toimiviin älykkäisiin agenteihin.

> **Vahvistusmerkintä (2026-06-15):** The command flow and extension guidance in this chapter were reviewed against `azd` `1.25.6` and the current preview AI agent extension release `azure.ai.agents` `0.1.40-preview`. If you are on an older AZD build, update first and then continue with the exercises.

## Oppimistavoitteet

By completing this chapter, you will:
- Ota käyttöön AI-sovelluksia valmiiden AZD-mallien avulla
- Ymmärtää Microsoft Foundryn integrointi AZD:hen
- Määritä ja räätälöi AI-agentteja työkaluilla
- Ota käyttöön RAG (Retrieval-Augmented Generation) -sovelluksia

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Yhdistä AZD Foundry-palveluihin | 30 minuuttia |
| 2 | [AI Agents Guide](agents.md) | Ota käyttöön älykkäitä agentteja työkaluineen | 45 minuuttia |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Ota käyttöön ja konfiguroi AI-malleja | 30 minuuttia |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Käytännön harjoitus: Tee AI-ratkaisustasi AZD-valmis | 60 minuuttia |

---

## 🚀 Pika-aloitus

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

## 🤖 Suositellut AI-mallit

| Mallipohja | Kuvaus | Palvelut |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-keskustelu lähdeviitteillä | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agentti työkaluineen | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Perus AI-chat | OpenAI + Container Apps |

---

## 💰 Kustannustietoisuus

| Ympäristö | Arvioidut kuukausikustannukset |
|-------------|----------------------|
| Kehitys | $80-150 |
| Testaus | $150-300 |
| Tuotanto | $300-3,500+ |

**Vinkki:** Suorita `azd down` testauksen jälkeen välttääksesi kuluja.

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **Seuraava** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Siirry kohtaan** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 Aiheeseen liittyvät materiaalit

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Luku 5: Moniagenttiset tekoälyratkaisut

**📚 Kurssi**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 2-3 tuntia | **⭐ Vaativuus**: Edistynyt

---

## Yleiskatsaus

Tämä luku käsittelee edistyneitä moniagenttiarkkitehtuurimalleja, agenttien orkestrointia ja tuotantokelpoisia tekoälyn käyttöönottoja monimutkaisiin tilanteisiin.

## Oppimistavoitteet

Tämän luvun suorittamisen jälkeen osaat:
- Ymmärtää moniagenttiarkkitehtuurimalleja
- Ottaa käyttöön koordinoituja tekoälyagenttijärjestelmiä
- Toteuttaa agenttien välistä viestintää
- Rakentaa tuotantokelpoisia moniagenttisia ratkaisuja

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Vähittäiskaupan moniagenttiratkaisu](../../examples/retail-scenario.md) | Täydellinen toteutuksen läpikäynti | 90 min |
| 2 | [Koordinointimallit](../chapter-06-pre-deployment/coordination-patterns.md) | Agenttien orkestrointistrategiat | 30 min |
| 3 | [ARM-mallin käyttöönotto](../../examples/retail-multiagent-arm-template/README.md) | Yhden klikkauksen käyttöönotto | 30 min |

---

## 🚀 Nopea aloitus

```bash
# Ota käyttöön vähittäiskaupan moniagenttiratkaisu
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tai käytä mallipohjaa suoraan
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Moni-agenttinen arkkitehtuuri

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 Esitelty ratkaisu: Vähittäiskaupan moniagenttiratkaisu

Vähittäiskaupan moniagenttiratkaisu ([Retail Multi-Agent Solution](../../examples/retail-scenario.md)) havainnollistaa:

- **Asiakasagentti**: Käsittelee käyttäjän vuorovaikutusta ja mieltymyksiä
- **Varastoagentti**: Hallinnoi varastoa ja tilauskäsittelyä
- **Orkestroija**: Koordinoi agenttien välistä toimintaa
- **Jaettu muisti**: Agenttien välinen kontekstinhallinta

### Käytetyt palvelut

| Palvelu | Tarkoitus |
|---------|---------|
| Azure OpenAI | Kielen ymmärtäminen |
| Azure AI Search | Tuotekatalogi |
| Cosmos DB | Agentin tila ja muisti |
| Container Apps | Agenttien isännöinti |
| Application Insights | Valvonta |

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Luku 4: Infrastruktuuri](../chapter-04-infrastructure/README.md) |
| **Seuraava** | [Luku 6: Esivalmistelu](../chapter-06-pre-deployment/README.md) |

---

## 📖 Aiheeseen liittyvät resurssit

- [Tekoälyagenttien opas](../chapter-02-ai-development/agents.md)
- [Tuotantotekoälyn käytännöt](../chapter-08-production/production-ai-practices.md)
- [Tekoälyn vianmääritys](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automatisoiduissa käännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää määräävänä lähteenä. Kriittisten tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinkäsityksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
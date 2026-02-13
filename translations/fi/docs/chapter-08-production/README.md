# Luku 8: Tuotanto- ja yritysmallit

**📚 Course**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 2-3 tuntia | **⭐ Vaikeustaso**: Edistynyt

---

## Yleiskatsaus

Tämä luku käsittelee yritysvalmiita käyttöönotto-malleja, turvallisuuden koventamista, valvontaa ja kustannusten optimointia tuotannon tekoälykuormituksille.

## Oppimistavoitteet

Suorittamalla tämän luvun osaat:
- Ota käyttöön monialueisia kestäviä sovelluksia
- Toteuttaa yritystason turvallisuusmalleja
- Konfiguroida kattavan valvonnan
- Optimoida kustannuksia laajassa mittakaavassa
- Määrittää CI/CD-putket AZD:llä

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Tuotannon tekoälykäytännöt](production-ai-practices.md) | Yritystason käyttöönotto-mallit | 90 min |

---

## 🚀 Tuotantotarkistuslista

- [ ] Monialueinen käyttöönotto kestävyyden takaamiseksi
- [ ] Hallinnoitu identiteetti todennukseen (ei avaimia)
- [ ] Application Insights valvontaan
- [ ] Kustannusbudjetit ja hälytykset määritetty
- [ ] Turvallisuusskannaus käytössä
- [ ] CI/CD-putken integrointi
- [ ] Häiriönsieto- ja toipumissuunnitelma

---

## 🏗️ Arkkitehtuurimallit

### Malli 1: Mikropalveluiden tekoäly

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   API Gateway   │───▶│   AI Service    │───▶│   Azure OpenAI  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                      │
         ▼                      ▼
┌─────────────────┐    ┌─────────────────┐
│   Auth Service  │    │   Data Store    │
└─────────────────┘    └─────────────────┘
```

### Malli 2: Tapahtumapohjainen tekoäly

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Turvallisuuden parhaat käytännöt

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 Kustannusten optimointi

| Strategia | Säästöt |
|----------|---------|
| Skaalaa nollaan (Container Apps) | 60-80% |
| Käytä kulutuspohjaisia tasoja kehityksessä | 50-70% |
| Aikataulutettu skaalaus | 30-50% |
| Varattu kapasiteetti | 20-40% |

```bash
# Aseta budjetti-ilmoitukset
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Valvonnan asetukset

```bash
# Suoratoista lokeja
azd monitor --logs

# Tarkista Application Insights
azd monitor

# Näytä mittarit
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Luku 7: Vianmääritys](../chapter-07-troubleshooting/README.md) |
| **Kurssi valmis** | [Kurssin etusivu](../../README.md) |

---

## 📖 Aiheeseen liittyvät resurssit

- [AI-agenttien opas](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Moni-agenttiset ratkaisut](../chapter-05-multi-agent/README.md)
- [Mikropalvelu-esimerkki](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua Co-op Translator (https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, ota huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä on pidettävä määräävänä lähteenä. Tärkeiden tietojen osalta suosittelemme ammattimaisen kääntäjän tekemää käännöstä. Emme ole vastuussa mistään tämän käännöksen käytöstä johtuvista väärinymmärryksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
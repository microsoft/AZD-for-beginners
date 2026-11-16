# Luku 6: Ennakkoasennuksen suunnittelu ja varmennus

**📚 Kurssi**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 2-4 tuntia lukemista; lisäaikaa mukautetuille harjoituksille | **⭐ Vaativuus**: Keskitaso–Edistynyt

---

## Yleiskatsaus

Tässä luvussa käsitellään olennaisia suunnittelu- ja varmennusvaiheita sovelluksesi käyttöönottoa varten. Opit välttämään kalliita virheitä oikean kapasiteettisuunnittelun, SKU-valinnan ja ennakkotarkistusten avulla.

> Komentojen ohjeistus tarkistettu julkaistua `azd 1.37.2`-viitetta vasten. Pilvikäyttöönottoja ei suoritettu. Pitkissä oppitunneissa on havainnollistavia katkelmia, ei täydellisiä paikallisia asennusprojekteja.

## Oppimistavoitteet

Tämän luvun suorittamalla osaat:
- Suorittaa ennakkotarkistukset ennen käyttöönottoa
- Suunnitella kapasiteettia ja arvioida resurssitarpeita
- Valita sopivat SKU:t kustannusten optimointiin
- Määrittää Application Insights -valvonnan
- Ymmärtää moniedustajakoordinaatiomallit ja niiden käyttöönoton vaatimukset

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Ennakkotarkistukset](preflight-checks.md) | Määrittelyn varmistaminen ennen käyttöönottoa | 15 min |
| 2 | [Kapasiteettisuunnittelu](capacity-planning.md) | Resurssitarpeiden arviointi | 20 min |
| 3 | [SKU-valinta](sku-selection.md) | Sopivien hinnoittelutasojen valinta | 15 min |
| 4 | [Application Insights](application-insights.md) | Valvonnan määrittäminen | 20 min |
| 5 | [Koordinaatiomallit](coordination-patterns.md) | Kehittynyt moniedustajaorkestroinnin suunnittelu | 60-75 min |

---

## 🚀 Nopeasti alkuun

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ Ennakkoasennuksen tarkistuslista

### Ennen `azd provision`

- [ ] Alueen kiintiö tarkistettu
- [ ] SKU:t valittu asianmukaisesti
- [ ] Kustannusarvio käyty läpi
- [ ] Nimikonventio yhdenmukainen
- [ ] Turvallisuus/RBAC määritetty

### Ennen `azd deploy`

- [ ] Ympäristömuuttujat asetettu
- [ ] Salaisuudet Key Vaultissa
- [ ] Yhteysmerkkijonot tarkistettu
- [ ] Terveystarkastukset määritetty

---

## 💰 SKU-valintaopas

| Kuorma | Kehitys | Tuotanto |
|----------|-------------|------------|
| Container Apps | Consumption | Consumption tai omistettu kuormaprofili mitatun kuorman perusteella |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI -mallit | Tuettu pay-as-you-go -asennustyyppi | Pay-as-you-go tai varattu läpimenonopeus; malli/aluekohtainen |
| AI Search | Vapaa/Basic rajoissa | Basic tai Standard taso haun indeksin, replikoiden ja kyselykuorman mukaan |

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Luku 5: Moniedustaja](../chapter-05-multi-agent/README.md) |
| **Seuraava** | [Luku 7: Vianetsintä](../chapter-07-troubleshooting/README.md) |

---

## 📖 Liittyvät resurssit

- [Määritysohjeet](../chapter-03-configuration/configuration.md)
- [Käyttöönotto-opas](../chapter-04-infrastructure/deployment-guide.md)
- [Yleiset ongelmat](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Luku 6: Ennen käyttöönottoa suunnittelu ja validointi

**📚 Kurssi**: [AZD aloittelijoille](../../README.md) | **⏱️ Kesto**: 1 tunti | **⭐ Vaativuus**: Keskitaso

---

## Yleiskatsaus

Tässä luvussa käsitellään keskeiset suunnittelu- ja validointivaiheet ennen sovelluksen käyttöönottoa. Opi välttämään kalliita virheitä asianmukaisen kapasiteettisuunnittelun, SKU-valinnan ja lähtötarkastusten avulla.

> Vahvistettu `azd 1.27.1` -versiolla heinäkuussa 2026.

## Oppimistavoitteet

Tämän luvun suorittamisen jälkeen osaat:
- Suorittaa lähtötarkastukset ennen käyttöönottoa
- Suunnitella kapasiteetti ja arvioida resurssitarpeet
- Valita sopivat SKU:t kustannusten optimointiin
- Määrittää Application Insights -valvonnan
- Ymmärtää tiimiyhteistyön mallit

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Kesto |
|---|--------|-------------|------|
| 1 | [Lähtötarkastukset](preflight-checks.md) | Varmista kokoonpano ennen käyttöönottoa | 15 min |
| 2 | [Kapasiteettisuunnittelu](capacity-planning.md) | Arvioi resurssitarpeet | 20 min |
| 3 | [SKU-valinta](sku-selection.md) | Valitse sopivat hinnoittelutasot | 15 min |
| 4 | [Application Insights](application-insights.md) | Määritä valvonta | 20 min |
| 5 | [Yhteistyön mallit](coordination-patterns.md) | Tiimin käyttöönoton työnkulut | 15 min |

---

## 🚀 Pika-aloitus

```bash
# Tarkista tilauskuormat
az vm list-usage --location eastus --output table

# Esikatsele käyttöönotto (ei luoda resursseja)
azd provision --preview

# Vahvista Bicep-syntaksi
az bicep build --file infra/main.bicep

# Tarkista ympäristön kokoonpano
azd env get-values
```

---

## ☑️ Ennen käyttöönottoa tarkistuslista

### Ennen `azd provision`

- [ ] Alueen kiintiö tarkistettu
- [ ] SKU:t valittu asianmukaisesti
- [ ] Kustannusarvio käyty läpi
- [ ] Nimeämiskäytäntö yhdenmukainen
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
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Luku 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Seuraava** | [Luku 7: Vianmääritys](../chapter-07-troubleshooting/README.md) |

---

## 📖 Aiheeseen liittyvät resurssit

- [Konfigurointiohje](../chapter-03-configuration/configuration.md)
- [Käyttöönotto-opas](../chapter-04-infrastructure/deployment-guide.md)
- [Yleiset ongelmat](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
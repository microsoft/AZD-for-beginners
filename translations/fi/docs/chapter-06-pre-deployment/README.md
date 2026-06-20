# Luku 6: Käyttöönottoa edeltävä suunnittelu ja validointi

**📚 Kurssi**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 1 tunti | **⭐ Vaikeustaso**: Keskitaso

---

## Yleiskatsaus

Tässä luvussa käsitellään olennaiset suunnittelu- ja validointivaiheet ennen sovelluksen käyttöönottoa. Opit välttämään kalliita virheitä oikealla kapasiteettisuunnittelulla, SKU-valinnoilla ja esitarkistuksilla.

> Vahvistettu `azd 1.25.6`:lla kesäkuussa 2026.

## Oppimistavoitteet

Suoritettuasi tämän luvun osaat:
- Suorittaa esitarkistuksia ennen käyttöönottoa
- Suunnitella kapasiteetin ja arvioida resurssitarpeet
- Valita sopivat SKU:t kustannusten optimoimiseksi
- Konfiguroida Application Insightsin seuranta varten
- Ymmärtää tiimikoordinaation käytänteitä

---

## 📚 Oppitunnit

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Validate configuration before deployment | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Estimate resource requirements | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Choose appropriate pricing tiers | 15 min |
| 4 | [Application Insights](application-insights.md) | Configure monitoring | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Team deployment workflows | 15 min |

---

## 🚀 Pika-aloitus

```bash
# Tarkista tilauksen kiintiöt
az vm list-usage --location eastus --output table

# Esikatsele käyttöönottoa (ei luoda resursseja)
azd provision --preview

# Tarkista Bicep-syntaksi
az bicep build --file infra/main.bicep

# Tarkista ympäristöasetukset
azd env get-values
```

---

## ☑️ Ennen käyttöönottoa - tarkistuslista

### Ennen `azd provision`

- [ ] Kiintiö vahvistettu alueella
- [ ] SKU:t valittu asianmukaisesti
- [ ] Kustannusarvio tarkistettu
- [ ] Nimeämiskäytäntö yhdenmukainen
- [ ] Suojaus/RBAC konfiguroitu

### Ennen `azd deploy`

- [ ] Ympäristömuuttujat asetettu
- [ ] Salaisuudet Key Vaultissa
- [ ] Yhteysmerkkijonot tarkistettu
- [ ] Terveystarkastukset konfiguroitu

---

## 💰 SKU-valintaopas

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Luku 5: Moniagentti](../chapter-05-multi-agent/README.md) |
| **Seuraava** | [Luku 7: Vianmääritys](../chapter-07-troubleshooting/README.md) |

---

## 📖 Aiheeseen liittyvät resurssit

- [Konfigurointiopas](../chapter-03-configuration/configuration.md)
- [Käyttöönotto-opas](../chapter-04-infrastructure/deployment-guide.md)
- [Yleiset ongelmat](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
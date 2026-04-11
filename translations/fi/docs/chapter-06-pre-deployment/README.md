# Luku 6: Käyttöönottoa edeltävä suunnittelu & validointi

**📚 Kurssi**: [AZD For Beginners](../../README.md) | **⏱️ Kesto**: 1 tunti | **⭐ Vaikeustaso**: Keskitaso

---

## Yleiskatsaus

Tässä luvussa käsitellään olennaisia suunnittelu- ja validointivaiheita ennen sovelluksesi käyttöönottoa. Opi välttämään kalliita virheitä oikealla kapasiteettisuunnittelulla, SKU-valinnoilla ja esitarkastuksilla.

> Vahvistettu `azd 1.23.12` maaliskuussa 2026.

## Oppimistavoitteet

Kun olet suorittanut tämän luvun, osaat:
- Suorittaa esitarkastukset ennen käyttöönottoa
- Suunnitella kapasiteetin ja arvioida resurssivaatimuksia
- Valita sopivat SKU:t kustannusten optimointiin
- Konfiguroida Application Insightsin valvontaa varten
- Ymmärtää tiimin koordinointimalleja

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Esitarkistukset](preflight-checks.md) | Varmista kokoonpano ennen käyttöönottoa | 15 min |
| 2 | [Kapasiteetin suunnittelu](capacity-planning.md) | Arvioi resurssivaatimukset | 20 min |
| 3 | [SKU-valinta](sku-selection.md) | Valitse sopivat hintatasot | 15 min |
| 4 | [Application Insights](application-insights.md) | Määritä valvonta | 20 min |
| 5 | [Koordinointimallit](coordination-patterns.md) | Tiimin käyttöönotto‑työnkulut | 15 min |

---

## 🚀 Pika-aloitus

```bash
# Tarkista tilauksen kiintiöt
az vm list-usage --location eastus --output table

# Esikatsele käyttöönottoa (ei luoda resursseja)
azd provision --preview

# Tarkista Bicep-syntaksi
az bicep build --file infra/main.bicep

# Tarkista ympäristön konfiguraatio
azd env get-values
```

---

## ☑️ Ennen käyttöönottoa - tarkistuslista

### Ennen `azd provision`

- [ ] Kiintiö vahvistettu alueella
- [ ] SKU:t valittu asianmukaisesti
- [ ] Kustannusarvio tarkistettu
- [ ] Nimeämiskäytäntö yhdenmukainen
- [ ] Suojaus/RBAC määritetty

### Ennen `azd deploy`

- [ ] Ympäristömuuttujat asetettu
- [ ] Salaisuudet Key Vaultissa
- [ ] Yhteysmerkkijonot varmennettu
- [ ] Terveystarkastukset määritetty

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
| **Edellinen** | [Luku 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Seuraava** | [Luku 7: Vianmääritys](../chapter-07-troubleshooting/README.md) |

---

## 📖 Aiheeseen liittyvät resurssit

- [Konfiguraatio-opas](../chapter-03-configuration/configuration.md)
- [Käyttöönotto-opas](../chapter-04-infrastructure/deployment-guide.md)
- [Yleisiä ongelmia](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälypohjaisella käännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, ota huomioon, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tästä käännöksestä aiheutuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
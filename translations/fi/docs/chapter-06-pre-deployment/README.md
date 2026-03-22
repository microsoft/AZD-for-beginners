# Luku 6: Ennen käyttöönottoa suunnittelu ja validointi

**📚 Kurssi**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 1 tunti | **⭐ Vaikeusaste**: Keskitaso

---

## Yleiskatsaus

Tässä luvussa käsitellään olennaiset suunnittelu- ja validointivaiheet ennen sovelluksesi käyttöönottoa. Opit välttämään kalliita virheitä oikealla kapasiteettisuunnittelulla, SKU-valinnoilla ja ennakkotarkastuksilla.

## Oppimistavoitteet

By completing this chapter, you will:
- Suorittaa ennakkotarkastukset ennen käyttöönottoa
- Suunnitella kapasiteetin ja arvioida resurssivaatimukset
- Valita sopivat SKU:t kustannusten optimointia varten
- Määrittää Application Insights valvontaa varten
- Ymmärtää tiimin koordinointimallit

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Ennakkotarkastukset](preflight-checks.md) | Varmista kokoonpano ennen käyttöönottoa | 15 min |
| 2 | [Kapasiteettisuunnittelu](capacity-planning.md) | Arvioi resurssivaatimukset | 20 min |
| 3 | [SKU-valinta](sku-selection.md) | Valitse sopivat hinnoittelutasot | 15 min |
| 4 | [Application Insights](application-insights.md) | Määritä valvonta | 20 min |
| 5 | [Koordinointimallit](coordination-patterns.md) | Tiimin käyttöönoton työnkulut | 15 min |

---

## 🚀 Pika-aloitus

```bash
# Tarkista tilauksen kiintiöt
az vm list-usage --location eastus --output table

# Esikatsele käyttöönottoa (resursseja ei luoda)
azd provision --preview

# Tarkista Bicep-syntaksin oikeellisuus
az bicep build --file infra/main.bicep

# Tarkista ympäristöasetukset
azd env get-values
```

---

## ☑️ Ennen käyttöönottoa - tarkistuslista

### Ennen `azd provision`

- [ ] Alueen kiintiöt tarkistettu
- [ ] SKU:t valittu asianmukaisesti
- [ ] Kustannusarvio tarkistettu
- [ ] Nimeämiskäytäntö yhdenmukainen
- [ ] Tietoturva/RBAC konfiguroitu

### Ennen `azd deploy`

- [ ] Ympäristömuuttujat asetettu
- [ ] Salaisuudet Key Vaultissa
- [ ] Yhteysmerkkijonot varmennettu
- [ ] Terveystarkastukset konfiguroitu

---

## 💰 SKU-valintaopas

| Työkuorma | Kehitys | Tuotanto |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Luku 5: Moni-agentti](../chapter-05-multi-agent/README.md) |
| **Seuraava** | [Luku 7: Vianmääritys](../chapter-07-troubleshooting/README.md) |

---

## 📖 Aiheeseen liittyvät resurssit

- [Konfigurointiohje](../chapter-03-configuration/configuration.md)
- [Käyttöönotto-opas](../chapter-04-infrastructure/deployment-guide.md)
- [Yleiset ongelmat](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälykäännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, ota huomioon, että automatisoiduissa käännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulisi pitää määräävänä lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaista ihmiskääntäjän tekemää käännöstä. Emme ole vastuussa tästä käännöksestä aiheutuvista väärinymmärryksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
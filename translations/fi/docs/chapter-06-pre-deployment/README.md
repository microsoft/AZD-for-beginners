# Luku 6: Ennakkosuunnittelu ja varmennus

**📚 Kurssi**: [AZD For Beginners](../../README.md) | **⏱️ Kesto**: 1 tunti | **⭐ Vaativuustaso**: Keskitasoinen

---

## Yleiskatsaus

Tässä luvussa käsitellään olennaisia suunnittelu- ja varmennusvaiheita ennen sovelluksesi käyttöönottoa. Opit välttämään kalliita virheitä asianmukaisella kapasiteettisuunnittelulla, SKU-valinnalla ja esitarkistuksilla.

## Oppimistavoitteet

Tämän luvun suorittamisen jälkeen osaat:
- Suunnitella kapasiteetin ja arvioida resurssitarpeet
- Suorittaa esitarkistukset ennen käyttöönottoa
- Valita sopivat SKU:t kustannusoptimointia varten
- Määrittää Application Insightsin valvontaa varten
- Ymmärtää tiimin koordinointimallit

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|----------|-------------|------|
| 1 | [Esitarkistukset](preflight-checks.md) | Varmista konfiguraatio ennen käyttöönottoa | 15 min |
| 2 | [Kapasiteetin suunnittelu](capacity-planning.md) | Arvioi resurssitarpeet | 20 min |
| 3 | [SKU-valinta](sku-selection.md) | Valitse sopivat hintatasot | 15 min |
| 4 | [Application Insights](application-insights.md) | Määritä valvonta | 20 min |
| 5 | [Koordinointimallit](coordination-patterns.md) | Tiimin käyttöönoton työnkulut | 15 min |

---

## 🚀 Pika-aloitus

```bash
# Tarkista tilauksen kiintiöt
az vm list-usage --location eastus --output table

# Esikatsele käyttöönottoa (ei luoda resursseja)
azd provision --preview

# Tarkista Bicep-syntaksi
az bicep build --file infra/main.bicep

# Tarkista ympäristön määritys
azd env get-values
```

---

## ☑️ Tarkistuslista ennen käyttöönottoa

### Ennen `azd provision`

- [ ] Kiintiöt tarkistettu alueella
- [ ] SKU:t valittu asianmukaisesti
- [ ] Kustannusarvio tarkistettu
- [ ] Nimeämiskäytäntö yhdenmukainen
- [ ] Tietoturva/RBAC määritetty

### Ennen `azd deploy`

- [ ] Ympäristömuuttujat asetettu
- [ ] Salaisuudet tallennettu Key Vaultiin
- [ ] Yhteysmerkkijonot tarkistettu
- [ ] Terveystarkastukset määritetty

---

## 💰 SKU-valintaopas

| Työkuorma | Kehitys | Tuotanto |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Luku 5: Moni-agentti](../chapter-05-multi-agent/README.md) |
| **Seuraava** | [Luku 7: Vianmääritys](../chapter-07-troubleshooting/README.md) |

---

## 📖 Liittyvät resurssit

- [Konfiguraatio-opas](../chapter-03-configuration/configuration.md)
- [Käyttöönotto-opas](../chapter-04-infrastructure/deployment-guide.md)
- [Yleiset ongelmat](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme täsmällisyyteen, huomioithan, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa alkuperäiskielellä on pidettävä ensisijaisena/virallisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme vastaa tämän käännöksen käytöstä johtuvista väärinymmärryksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
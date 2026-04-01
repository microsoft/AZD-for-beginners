# Luku 4: Infrastruktuuri koodina ja käyttöönotto

**📚 Kurssi**: [AZD For Beginners](../../README.md) | **⏱️ Kesto**: 1–1,5 tuntia | **⭐ Vaativuus**: Keskitaso

---

## Yleiskatsaus

Tässä luvussa käsitellään Infrastructure as Code (IaC) -malleja Bicep-mallien avulla, resurssien provisiointia sekä käyttöönotto-strategioita Azure Developer CLI:n avulla.

> Vahvistettu `azd 1.23.12`:lla maaliskuussa 2026.

## Oppimistavoitteet

Tämän luvun suorittamisen jälkeen osaat:
- Ymmärtää Bicep-mallien rakenteen ja syntaksin
- Provisionoida Azure-resursseja komennolla `azd provision`
- Ota sovellukset käyttöön komennolla `azd deploy`
- Toteuttaa blue-green- ja rolling-käyttöönotto-strategioita

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Resurssien provisiointi](provisioning.md) | Azure-resurssien hallinta AZD:llä | 45 min |
| 2 | [Käyttöönotto-opas](deployment-guide.md) | Sovelluksen käyttöönotto-strategiat | 45 min |

---

## 🚀 Pika-aloitus

```bash
# Alusta mallipohjasta
azd init --template azure-functions-python-v2-http

# Esikatsele, mitä luodaan
azd provision --preview

# Ota käyttöön vain infrastruktuuri
azd provision

# Ota käyttöön vain koodi
azd deploy

# Tai molemmat yhdessä
azd up
```

---

## 📁 AZD-projektin rakenne

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Tärkeät komennot

| Komento | Kuvaus |
|---------|-------------|
| `azd init` | Alusta projekti |
| `azd provision` | Luo Azure-resursseja |
| `azd deploy` | Ota sovelluskoodi käyttöön |
| `azd up` | provisiointi + käyttöönotto |
| `azd down` | Poista kaikki resurssit |

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Luku 3: Konfigurointi](../chapter-03-configuration/README.md) |
| **Seuraava** | [Luku 5: Moni-agenttiratkaisut](../chapter-05-multi-agent/README.md) |

---

## 📖 Aiheeseen liittyvät resurssit

- [Ennen käyttöönottoa tehtävät tarkastukset](../chapter-06-pre-deployment/README.md)
- [Container-sovellus-esimerkit](../../examples/container-app/README.md)
- [Tietokantasovellus-esimerkki](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälypohjaisella käännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisessä kielessä tulee pitää auktoriteettina. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä johtuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
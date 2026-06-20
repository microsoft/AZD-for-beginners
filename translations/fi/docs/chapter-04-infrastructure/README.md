# Luku 4: Infrastruktuuri koodina & Käyttöönotto

**📚 Kurssi**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 1–1,5 tuntia | **⭐ Vaativuus**: Keskitaso

---

## Yleiskatsaus

Tässä luvussa käsitellään Infrastructure as Code (IaC) -malleja Bicep-templaatteilla, resurssien provisiointia sekä käyttöönotto­strategioita Azure Developer CLI:n avulla.

> Varmennettu `azd 1.25.6`:lla kesäkuussa 2026.

## Oppimistavoitteet

Kun olet suorittanut tämän luvun, osaat:
- Ymmärtää Bicep-templaatin rakenteen ja syntaksin
- Provisioida Azure-resursseja `azd provision` -komennolla
- Ota käyttöön sovelluksia `azd deploy` -komennolla
- Toteuttaa blue-green- ja rolling-käyttöönotto­strategiat

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Resurssien provisiointi](provisioning.md) | Azure-resurssien hallinta AZD:llä | 45 min |
| 2 | [Käyttöönotto-opas](deployment-guide.md) | Sovellusten käyttöönotto-strategiat | 45 min |
| 3 | [Oman mallin laatiminen](custom-templates.md) | Rakenna ja julkaise uudelleenkäytettäviä azd-malleja | 30 min |

---

## 🚀 Pikaopas

```bash
# Alusta mallipohjasta
azd init --template azure-functions-python-v2-http

# Esikatsele, mitä luodaan
azd provision --preview

# Perusta vain infrastruktuuri
azd provision

# Ota vain koodi käyttöön
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

## 🔧 Keskeiset komennot

| Komento | Kuvaus |
|---------|-------------|
| `azd init` | Alusta projekti |
| `azd provision` | Luo Azure-resursseja |
| `azd deploy` | Ota käyttöön sovelluskoodi |
| `azd up` | provisioi + ota käyttöön |
| `azd down` | Poistaa kaikki resurssit |

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Seuraava** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

---

## 📖 Lisäresurssit

- [Ennakkotarkistukset](../chapter-06-pre-deployment/README.md)
- [Container-sovellus-esimerkit](../../examples/container-app/README.md)
- [Tietokantasovellus-esimerkki](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
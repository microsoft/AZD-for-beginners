# Luku 4: Infrastructure as Code & Julkaisu

**📚 Kurssi**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 1-1,5 tuntia | **⭐ Vaativuus**: Keskitaso

---

## Yleiskatsaus

Tässä luvussa käsitellään Infrastructure as Code (IaC) -malleja Bicep-mallipohjien avulla, resurssien provisiointia sekä julkaisuja Azure Developer CLI:n avulla.

> Vahvistettu versiossa `azd 1.27.1` heinäkuussa 2026.

## Oppimistavoitteet

Tämän luvun suorittamisen jälkeen osaat:
- Ymmärtää Bicep-mallipohjan rakenteen ja syntaksin
- Provisioida Azure-resursseja komennolla `azd provision`
- Julkaista sovelluksia komennolla `azd deploy`
- Toteuttaa sinivihreä- ja rullautuva julkaisutavat

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|----------|--------|------|
| 1 | [Resurssien provisiointi](provisioning.md) | Azure-resurssien hallinta AZD:llä | 45 min |
| 2 | [Julkaisun opas](deployment-guide.md) | Sovelluksen julkaisustrategiat | 45 min |
| 3 | [Oman mallin laatiminen](custom-templates.md) | Rakentaminen ja julkaisukoettavien azd-mallien teko | 30 min |

---

## 🚀 Pika-aloitus

```bash
# Alusta mallista
azd init --template azure-functions-python-v2-http

# Esikatsele, mitä luodaan
azd provision --preview

# Tarjoa vain infrastruktuuri
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

## 🔧 Keskeiset komennot

| Komento | Kuvaus |
|---------|--------|
| `azd init` | Alusta projekti |
| `azd provision` | Luo Azure-resurssit |
| `azd deploy` | Julkaise sovelluskoodi |
| `azd up` | provisioi + julkaise |
| `azd down` | Poista kaikki resurssit |

---

## 🔗 Navigointi

| Suunta | Luku |
|---------|------|
| **Edellinen** | [Luku 3: Konfigurointi](../chapter-03-configuration/README.md) |
| **Seuraava** | [Luku 5: Multi-Agent -ratkaisut](../chapter-05-multi-agent/README.md) |

---

## 📖 Aiheeseen liittyvät resurssit

- [Ennakkotarkastukset ennen julkaisua](../chapter-06-pre-deployment/README.md)
- [Container-sovellus-esimerkit](../../examples/container-app/README.md)
- [Tietokantasovellus-esimerkki](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
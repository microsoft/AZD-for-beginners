# Luku 4: Infrastruktuuri koodina & käyttöönotto

**📚 Kurssi**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 2-3 tuntia lukemista; varaa lisäaikaa käyttöönottoharjoituksiin | **⭐ Vaativuus**: Keskitaso

---

## Yleiskatsaus

Tämä luku käsittelee Infrastructure as Code (IaC) -malleja Bicep-mallipohjien, resurssien provisioinnin ja käyttöönottojen strategioiden avulla Azure Developer CLI:llä.

> Komento- ja konfiguraatiotarkistus kohdistuu: `azd 1.37.2` (marraskuu 2026). Elävää Azuren provisiointia ei suoritettu tarkistuksen aikana.

## Oppimistavoitteet

Tämän luvun suorittamalla sinä:
- Ymmärrät Bicep-mallipohjan rakenteen ja syntaksin
- Provisionoit Azure-resursseja `azd provision` avulla
- Otat sovellukset käyttöön `azd deploy` avulla
- Toteutat blue-green- ja rolling-käyttöönottostrategiat

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Resurssien provisiointi](provisioning.md) | Azuren resurssien hallinta AZD:llä | 45 min |
| 2 | [Käyttöönottoguide](deployment-guide.md) | Sovellusten käyttöönoton strategiat | 45 min |
| 3 | [Oman mallipohjan kirjoittaminen](custom-templates.md) | Rakenna ja julkaise uudelleenkäytettäviä azd-malleja | 30 min |

---

## 🚀 Pikakäynnistys

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
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

## 🔧 Tärkeimmät komennot

| Komento | Kuvaus |
|---------|-------------|
| `azd init` | Alusta projekti |
| `azd provision` | Luo Azure-resursseja |
| `azd deploy` | Ota sovelluskoodi käyttöön |
| `azd up` | provisioi + ota käyttöön |
| `azd down` | Poista kaikki resurssit |

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Luku 3: Konfiguraatio](../chapter-03-configuration/README.md) |
| **Seuraava** | [Luku 5: Moni-agenttiset ratkaisut](../chapter-05-multi-agent/README.md) |

---

## 📖 Liittyvät resurssit

- [Ennen käyttöönottoa tehtävät tarkistukset](../chapter-06-pre-deployment/README.md)
- [Container App -esimerkit](../../examples/container-app/README.md)
- [Tietokantasovelluksen esimerkki](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
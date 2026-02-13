# Luku 4: Infrastruktuuri koodina (IaC) & Käyttöönotto

**📚 Kurssi**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 1-1.5 tuntia | **⭐ Vaikeustaso**: Keskitaso

---

## Yhteenveto

Tässä luvussa käsitellään Infrastructure as Code (IaC) -malleja Bicep-malleilla, resurssien provisiointia ja käyttöönotto-strategioita Azure Developer CLI:n avulla.

## Oppimistavoitteet

Suoritettuasi tämän luvun, osaat:
- Ymmärtää Bicep-mallin rakenteen ja syntaksin
- Provisionoida Azure-resursseja komennolla `azd provision`
- Ota sovellus käyttöön komennolla `azd deploy`
- Toteuttaa blue-green- ja rolling-käyttöönotto-strategioita

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Resurssien provisiointi](provisioning.md) | Azure-resurssien hallinta AZD:llä | 45 min |
| 2 | [Käyttöönotto-opas](deployment-guide.md) | Sovelluksen käyttöönoton strategiat | 45 min |

---

## 🚀 Nopea aloitus

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

## 🔧 Olennaiset komennot

| Komento | Kuvaus |
|---------|-------------|
| `azd init` | Alusta projekti |
| `azd provision` | Luo Azure-resursseja |
| `azd deploy` | Ota sovellus käyttöön |
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

- [Tarkistukset ennen käyttöönottoa](../chapter-06-pre-deployment/README.md)
- [Container App -esimerkit](../../examples/container-app/README.md)
- [Tietokantasovellus-esimerkki](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla Co-op Translator (https://github.com/Azure/co-op-translator). Pyrimme tarkkuuteen, mutta automaattisissa käännöksissä voi esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää määräävänä lähteenä. Tärkeiden tietojen osalta suosittelemme ammattimaisen ihmiskääntäjän tekemää käännöstä. Emme vastaa tämän käännöksen käytöstä aiheutuvista väärinkäsityksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
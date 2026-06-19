# Luku 3: Konfigurointi ja todennus

**📚 Kurssi**: [AZD aloittelijoille](../../README.md) | **⏱️ Kesto**: 45–60 minuuttia | **⭐ Vaikeustaso**: Keskitaso

---

## Yleiskatsaus

Tämä luku käsittelee ympäristön konfiguraatiota, todennusmalleja ja tietoturvan parhaita käytäntöjä Azure Developer CLI -käyttöönottoihin.

> Varmennettu versiolla `azd 1.25.6` kesäkuussa 2026.

## Oppimistavoitteet

Tämän luvun suorittamisen jälkeen osaat:
- Hallita AZD:n konfiguraatiohierarkiaa
- Hallita useita ympäristöjä (dev, staging, prod)
- Toteuttaa turvallisen todennuksen hallittujen identiteettien avulla
- Määrittää ympäristökohtaiset asetukset

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Konfiguraatio-opas](configuration.md) | Ympäristön määritys ja hallinta | 30 min |
| 2 | [Todennus ja tietoturva](authsecurity.md) | Hallittujen identiteettien ja RBAC-mallien käytännöt | 30 min |

---

## 🚀 Pika-aloitus

```bash
# Luo useita ympäristöjä
azd env new dev
azd env new staging
azd env new prod

# Vaihda ympäristöä
azd env select prod

# Aseta ympäristömuuttujat
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Näytä kokoonpano
azd env get-values
```

---

## 🔧 Konfiguraation hierarkia

AZD käyttää asetuksia tässä järjestyksessä (myöhemmät korvaavat aiemmat):

1. **Oletusarvot** (sisältyvät malleihin)
2. **azure.yaml** (projektin konfiguraatio)
3. **Ympäristömuuttujat** (`azd env set`)
4. **Komentoriviliput** (`--location eastus`)

---

## 🔐 Tietoturvan parhaat käytännöt

```bash
# Käytä hallittua identiteettiä (suositeltu)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Tarkista AZD-todennuksen tila
azd auth status

# Valinnainen: varmista Azure CLI -konteksti, jos aiot suorittaa az-komentoja
az account show

# Kirjaudu uudelleen tarvittaessa
azd auth login

# Valinnainen: päivitä Azure CLI -todennus az-komentoja varten
az login
```

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Luku 2: AI-kehitys](../chapter-02-ai-development/README.md) |
| **Seuraava** | [Luku 4: Infrastruktuuri](../chapter-04-infrastructure/README.md) |

---

## 📖 Aiheeseen liittyvät resurssit

- [Tarkistukset ennen käyttöönottoa](../chapter-06-pre-deployment/README.md)
- [Vianetsintä](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
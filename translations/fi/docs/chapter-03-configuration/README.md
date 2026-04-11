# Luku 3: Konfigurointi ja todennus

**📚 Kurssi**: [AZD For Beginners](../../README.md) | **⏱️ Kesto**: 45-60 minuuttia | **⭐ Vaikeusaste**: Keskitaso

---

## Yleiskatsaus

Tässä luvussa käsitellään ympäristön konfigurointia, todennusmalleja ja tietoturvan parhaita käytäntöjä Azure Developer CLI -käyttöönottoja varten.

> Vahvistettu versiolla `azd 1.23.12` maaliskuussa 2026.

## Oppimistavoitteet

Tämän luvun suorittamisen jälkeen osaat:
- Hallita AZD:n konfigurointihierarkia
- Hallita useita ympäristöjä (dev, staging, prod)
- Toteuttaa turvallisen todennuksen hallittujen identiteettien avulla
- Konfiguroida ympäristökohtaisia asetuksia

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Konfigurointiohje](configuration.md) | Ympäristön määritys ja hallinta | 30 min |
| 2 | [Todennus & Tietoturva](authsecurity.md) | Hallittujen identiteettien ja RBAC-mallien käytännöt | 30 min |

---

## 🚀 Pikakäynnistys

```bash
# Luo useita ympäristöjä
azd env new dev
azd env new staging
azd env new prod

# Vaihda ympäristöjen välillä
azd env select prod

# Aseta ympäristömuuttujat
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Näytä määritykset
azd env get-values
```

---

## 🔧 Konfigurointihierarkia

AZD soveltaa asetuksia tässä järjestyksessä (myöhemmät korvaavat aiemmat):

1. **Oletusarvot** (sisäänrakennettuna malleihin)
2. **azure.yaml** (projektin konfiguraatio)
3. **Ympäristömuuttujat** (`azd env set`)
4. **Komentorivivalitsimet** (`--location eastus`)

---

## 🔐 Tietoturvan parhaat käytännöt

```bash
# Käytä hallittua identiteettiä (suositeltavaa)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Tarkista AZD:n todennuksen tila
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
| **Previous** | [Luku 2: AI-kehitys](../chapter-02-ai-development/README.md) |
| **Next** | [Luku 4: Infrastruktuuri](../chapter-04-infrastructure/README.md) |

---

## 📖 Aiheeseen liittyvät resurssit

- [Ennen käyttöönottoa tehtävät tarkistukset](../chapter-06-pre-deployment/README.md)
- [Vianetsintä](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää auktoriteettina. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä johtuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
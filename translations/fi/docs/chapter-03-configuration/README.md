# Luku 3: Konfigurointi & Todennus

**📚 Kurssi**: [AZD For Beginners](../../README.md) | **⏱️ Kesto**: 45-60 minuuttia | **⭐ Vaikeustaso**: Keskitaso

---

## Yleiskatsaus

Tässä luvussa käsitellään ympäristökonfiguraatiota, todennusmalleja ja turvallisuuden parhaita käytäntöjä Azure Developer CLI -käyttöönottoja varten.

## Oppimistavoitteet

Tämän luvun suorittamisen jälkeen osaat:
- Ymmärtää AZD:n konfiguraatiohierarkian
- Hallita useita ympäristöjä (dev, staging, prod)
- Ota käyttöön turvallinen todentaminen hallinnoiduilla identiteeteillä
- Määrittää ympäristökohtaiset asetukset

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Configuration Guide](configuration.md) | Ympäristön asennus ja hallinta | 30 min |
| 2 | [Authentication & Security](authsecurity.md) | Hallinnoitu identiteetti ja RBAC-mallit | 30 min |

---

## 🚀 Nopea aloitus

```bash
# Luo useita ympäristöjä
azd env new dev
azd env new staging
azd env new prod

# Vaihda ympäristöjä
azd env select prod

# Aseta ympäristömuuttujat
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Näytä määritykset
azd env get-values
```

---

## 🔧 Konfiguraatiohierarkia

AZD ottaa asetukset käyttöön tässä järjestyksessä (myöhemmät korvaavat aiemmat):

1. **Oletusarvot** (sisäänrakennettu malleihin)
2. **azure.yaml** (projektin konfiguraatio)
3. **Ympäristömuuttujat** (`azd env set`)
4. **Komentorivivaihtoehdot** (`--location eastus`)

---

## 🔐 Turvallisuuden parhaat käytännöt

```bash
# Käytä hallinnoitua identiteettiä (suositeltu)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Tarkista todennuksen tila
azd auth whoami
az account show

# Todenna uudelleen tarvittaessa
azd auth login
az login
```

---

## 🔗 Navigointi

| Direction | Chapter |
|-----------|---------|
| **Edellinen** | [Chapter 2: AI Development](../chapter-02-ai-development/README.md) |
| **Seuraava** | [Chapter 4: Infrastructure](../chapter-04-infrastructure/README.md) |

---

## 📖 Aiheeseen liittyvät materiaalit

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty käyttäen tekoälypohjaista käännöspalvelua Co-op Translator (https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää auktoritatiivisena lähteenä. Kriittisten tietojen osalta suositellaan ammattimaisen ihmiskääntäjän tekemää käännöstä. Emme ole vastuussa tästä käännöksestä johtuvista väärinymmärryksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
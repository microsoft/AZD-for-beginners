# Luku 3: Konfigurointi & Todennus

**📚 Kurssi**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 45-60 minuuttia | **⭐ Vaativuus**: Keskitaso

---

## Yleiskatsaus

Tämä luku käsittelee ympäristön konfigurointia, todennusmalleja ja turvallisuuden parhaita käytäntöjä Azure Developer CLI -käyttöönotoissa.

> Varmistettu `azd 1.27.1` -versiolla heinäkuussa 2026.

## Oppimistavoitteet

Tässä luvussa opit:
- Hallitsemaan AZD:n konfigurointihierarkiaa
- Hallitsemaan useita ympäristöjä (kehitys, testaus, tuotanto)
- Toteuttamaan turvallisen todennuksen hallittujen identiteettien avulla
- Konfiguroimaan ympäristökohtaiset asetukset

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Konfigurointiohje](configuration.md) | Ympäristön asennus ja hallinta | 30 min |
| 2 | [Todennus & Turvallisuus](authsecurity.md) | Hallitut identiteetit ja RBAC-mallit | 30 min |

---

## 🚀 Nopea Aloitus

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

# Näytä konfiguraatio
azd env get-values
```

---

## 🔧 Konfigurointihierarkia

AZD käyttää asetuksia tässä järjestyksessä (myöhemmät korvaavat aikaisemmat):

1. **Oletusarvot** (mallipohjissa)
2. **azure.yaml** (projektin konfigurointi)
3. **Ympäristömuuttujat** (`azd env set`)
4. **Komentorivivaihtoehdot** (`--location eastus`)

---

## 🔐 Turvallisuuden parhaat käytännöt

```bash
# Käytä hallittua identiteettiä (suositellaan)
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

## 📖 Liittyvät Resurssit

- [Esiasennustarkistukset](../chapter-06-pre-deployment/README.md)
- [Vianmääritys](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
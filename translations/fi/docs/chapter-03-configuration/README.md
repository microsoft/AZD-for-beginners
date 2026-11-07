# Luku 3: Konfigurointi ja todennus

**📚 Kurssi**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 90-150 minuuttia sisältäen integraatioharjoituksen | **⭐ Vaativuus**: Keskitaso

---

## Yleiskatsaus

Tässä luvussa käsitellään ympäristön konfigurointia, todennusmalleja ja turvallisuuden parhaita käytäntöjä Azure Developer CLI:n käyttöönotossa.

> Komento- ja konfiguraatiotarkastelun kohde: `azd 1.37.2` (marraskuu 2026). Tarkastelun aikana ei suoritettu live-Azure-järjestelmän käyttöönottoa.

## Oppimistavoitteet

Kun olet suorittanut tämän luvun, osaat:
- Hallita AZD-konfiguraation hierarkiaa
- Hallita useita ympäristöjä (kehitys, testi, tuotanto)
- Toteuttaa turvallinen todennus hallituilla identiteeteillä
- Konfiguroida ympäristökohtaiset asetukset

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Kesto |
|---|--------|-------------|------|
| 1 | [Konfigurointiohje](configuration.md) | Ympäristön asetus ja hallinta | 30 min |
| 2 | [Todennus ja turvallisuus](authsecurity.md) | Hallitun identiteetin ja RBAC-mallit | 30 min |

---

## 🚀 Nopeasti alkuun

Suorita komennot **jo alustetun azd-sovelluksen** juurihakemistosta, ei kurssin repositoriosta. Käytä vapaana olevia ympäristönimiä, jos ne ovat jo käytössä.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` on havainnollistava: se vaikuttaa infrastruktuuriin vain, jos mallipohjasi käyttää sitä nimenomaisesti. Tavalliset `azd env set` arvot tallennetaan paikallisesti selväkielisinä; ne eivät ole turvallista salasanavarastoa.

---

## 🔧 Konfiguraation hierarkia

Pidä kolme eri konfiguraatiotasoa erillään: globaalit asetukset (`azd config`), projektirakenne (`azure.yaml`) ja ympäristökohtaiset arvot (`azd env`). Liput ohittavat vain ne asetukset, joita ne tukevat; ei ole olemassa yleistä päällekkäistä kerrosta, joka asettaisi mielivaltaisia ympäristömuuttujia `azure.yaml`:n tai Bicepin päälle.

---

## 🔐 Turvallisuuden parhaat käytännöt

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Luku 2: tekoälyn kehitys](../chapter-02-ai-development/README.md) |
| **Seuraava** | [Luku 4: Infrastruktuuri](../chapter-04-infrastructure/README.md) |

---

## 📖 Aiheeseen liittyvät materiaalit

- [Esijakelutarkastukset](../chapter-06-pre-deployment/README.md)
- [Vianmääritys](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
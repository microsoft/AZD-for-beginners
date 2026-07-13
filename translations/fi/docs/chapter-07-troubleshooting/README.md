# Luku 7: Vianmääritys ja Debuggaus

**📚 Kurssi**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 1-1,5 tuntia | **⭐ Vaativuus**: Keskitaso

---

## Yleiskatsaus

Tämä luku auttaa sinua diagnosoimaan ja ratkaisemaan yleisiä ongelmia työskennellessäsi Azure Developer CLI:n kanssa. Julkaisun epäonnistumisista AI-spesifisiin ongelmiin.

> Varmistettu `azd 1.27.1` -versiolla heinäkuussa 2026.

## Oppimistavoitteet

Suoritettuasi tämän luvun:
- Osaat diagnosoida yleiset AZD-julkaisun epäonnistumiset
- Osaat debugata tunnistautumis- ja käyttöoikeusongelmat
- Osaat ratkaista AI-palvelujen yhteysongelmat
- Osaat käyttää Azure-portaalia ja CLI-työkaluja vianmääritykseen

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Kesto |
|---|----------|---------|-------|
| 1 | [Yleiset Ongelmät](common-issues.md) | Usein vastaan tulevat ongelmat | 30 min |
| 2 | [Debuggausohjeet](debugging.md) | Askeltavat debuggausstrategiat | 45 min |
| 3 | [AI Vianmääritys](ai-troubleshooting.md) | AI-spesifiset ongelmat | 30 min |

---

## 🚨 Nopeat Ratkaisut

### Tunnistautumisongelmat
```bash
# Vaaditaan AZD-työnkuluille
azd auth login

# Valinnainen, jos käytät myös suoraan Azure CLI -komentoja
az login

azd auth status
```

### Julkaisun epäonnistumiset
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Resurssikonfliktit
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Käytön ylitys
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Virhekoodiviite

| Virhe | Syy | Ratkaisu |
|-------|------|----------|
| `AuthenticationError` | Ei kirjautunut sisään | `azd auth login` |
| `ResourceNotFound` | Puuttuva resurssi | Tarkista resurssin nimet |
| `QuotaExceeded` | Tilausrajat ylitetty | Pyydä käyttöoikeuden lisäystä |
| `InvalidTemplate` | Bicep-syntaksivirhe | `az bicep build` |
| `Conflict` | Resurssi on jo olemassa | Käytä uutta nimeä tai poista |
| `Forbidden` | Puuttuvat oikeudet | Tarkista RBAC-roolit |

---

## 🔄 Nollaus ja Palautus

```bash
# Pehmeä nollaus (säilytä resurssit, ota koodi uudelleen käyttöön)
azd deploy --force

# Kova nollaus (poista kaikki, aloita alusta)
azd down --force --purge
azd up
```

---

## 🔗 Navigaatio

| Suunta | Luku |
|--------|------|
| **Edellinen** | [Luku 6: Esijulkaisu](../chapter-06-pre-deployment/README.md) |
| **Seuraava** | [Luku 8: Tuotanto](../chapter-08-production/README.md) |

---

## 📖 Liittyvät resurssit

- [Esijulkaisun Tarkistukset](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurointiopas](../chapter-03-configuration/configuration.md)
- [AZD GitHub-ongelmat](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
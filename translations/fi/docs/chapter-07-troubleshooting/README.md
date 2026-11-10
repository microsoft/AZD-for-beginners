# Luku 7: Vianmääritys ja debuggaus

**📚 Kurssi**: [AZD aloittelijoille](../../README.md) | **⏱️ Kesto**: 1-1,5 tuntia | **⭐ Vaativuus**: Keskitaso

---

## Yleiskatsaus

Tämä luku auttaa sinua diagnosoimaan ja ratkaisemaan yleisiä ongelmia Azure Developer CLI:n kanssa työskennellessä. Julkaisujen epäonnistumisista AI-spesifisiin ongelmiin.

> Komentojen ohjeistus tarkistettu julkaistuun `azd 1.37.2` viitteeseen. Pilvijulkaisuja ei suoritettu. Vaihda esimerkkiresurssien nimet ja tunnukset ennen komentojen käyttöä.

## Oppimistavoitteet

Tämän luvun suorittamalla sinä:
- Diagnosoit yleisimmät AZD-julkaisuvirheet
- Debuggaat todennus- ja käyttöoikeusongelmia
- Ratkaiset AI-palveluiden yhteysongelmat
- Käytät Azure Portalia ja CLI:tä vianmääritykseen

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Yleiset ongelmat](common-issues.md) | Usein esiintyvät ongelmat | 30 min |
| 2 | [Debuggausopas](debugging.md) | Vianmäärityksen vaiheittaiset strategiat | 45 min |
| 3 | [AI-vianmääritys](ai-troubleshooting.md) | AI-spesifiset ongelmat | 30 min |

---

## 🚨 Nopeita korjauksia

### Toimintatunnistusongelmat
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Julkaisun epäonnistumiset
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Resurssien ristiriidat
Tarkastele ensin olemassa olevaa resurssia ja julkaisuvirheitä. Älä poista jaettua tai tuotantoympäristöä nimen ristiriidan ratkaisemiseksi. Uudessa **kertakäyttöisessä ympäristössä** käytä ainutlaatuista nimeä:

```bash
azd env new different-name
azd up
```

### Kiintiön ylittyminen
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Muutokset `AZURE_LOCATION` eivät siirrä olemassa olevia resursseja ja voivat aiheuttaa sijaintiristiriitoja uudelleenjulkaisun yhteydessä.

---

## 📋 Virhekoodiviite

| Virhe | Syy | Ratkaisu |
|-------|-------|----------|
| `AuthenticationError` | Ei kirjautunut sisään | `azd auth login` |
| `ResourceNotFound` | Resurssi puuttuu | Tarkista resurssin nimet |
| `QuotaExceeded` | Tilauksen rajoitukset | Pyydä kiintiön korotusta |
| `InvalidTemplate` | Bicep-syntaksivirhe | `az bicep build` |
| `Conflict` | Resurssi on olemassa | Käytä uutta nimeä tai poista |
| `Forbidden` | Puutteelliset käyttöoikeudet | Tarkista RBAC-roolit |

---

## 🔄 Nollaus ja palautus

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Kovalla nollauksella poistetaan data ja voi muuttaa päätepisteitä. Tee varmuuskopio ensin ja tarkista vuorovaikutteiset poiston vahvistukset. `--force --purge` sopii ainoastaan kertakäyttöisiin ympäristöihin silloin, kun peruuttamaton poisto on tarkoitus.

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Luku 6: Ennen julkaisua](../chapter-06-pre-deployment/README.md) |
| **Seuraava** | [Luku 8: Tuotanto](../chapter-08-production/README.md) |

---

## 📖 Aiheeseen liittyviä resursseja

- [Julkaisun ennakkotarkistukset](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurointiohje](../chapter-03-configuration/configuration.md)
- [AZD GitHub-ongelmat](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
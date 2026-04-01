# Luku 7: Vianmääritys ja virheenkorjaus

**📚 Kurssi**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 1-1,5 tuntia | **⭐ Vaikeustaso**: Keskitaso

---

## Yleiskatsaus

Tämä luku auttaa sinua diagnosoimaan ja ratkaisemaan yleisiä ongelmia, kun työskentelet Azure Developer CLI:n kanssa. Julkaisun epäonnistumisista tekoälykohtaisiin ongelmiin.

> Vahvistettu versiolla `azd 1.23.12` maaliskuussa 2026.

## Oppimistavoitteet

By completing this chapter, you will:
- Diagnoida yleisiä AZD-julkaisuvirheitä
- Virheenkorjata todennus- ja käyttöoikeusongelmia
- Ratkaista tekoälypalveluihin liittyviä yhteysongelmia
- Käyttää Azure-portaalia ja CLI:tä vianmääritykseen

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Yleisimmät ongelmat](common-issues.md) | Usein esiintyvät ongelmat | 30 min |
| 2 | [Vianmääritysohje](debugging.md) | Vaiheittaiset vianmääritysstrategiat | 45 min |
| 3 | [Tekoälyn vianmääritys](ai-troubleshooting.md) | Tekoälykohtaiset ongelmat | 30 min |

---

## 🚨 Nopeat korjaukset

### Todennusongelmat
```bash
# Vaaditaan AZD-työnkuluille
azd auth login

# Valinnainen, jos käytät myös Azure CLI -komentoja suoraan
az login

azd auth status
```

### Provisioinnin epäonnistumiset
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

### Kiintiö ylitetty
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Virhekoodiviite

| Virhe | Syy | Ratkaisu |
|-------|-------|----------|
| `AuthenticationError` | Ei ole kirjautunut sisään | `azd auth login` |
| `ResourceNotFound` | Puuttuva resurssi | Tarkista resurssien nimet |
| `QuotaExceeded` | Tilauksen rajoitukset | Pyydä kiintiön korotusta |
| `InvalidTemplate` | Bicep-syntaksivirhe | `az bicep build` |
| `Conflict` | Resurssi on olemassa | Käytä uutta nimeä tai poista se |
| `Forbidden` | Riittämättömät käyttöoikeudet | Tarkista RBAC-roolit |

---

## 🔄 Nollaus ja palautuminen

```bash
# Pehmeä nollaus (säilytä resurssit, ota koodi uudelleen käyttöön)
azd deploy --force

# Kova nollaus (poista kaikki, aloita alusta)
azd down --force --purge
azd up
```

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Edellinen** | [Luku 6: Esivalmistelut](../chapter-06-pre-deployment/README.md) |
| **Seuraava** | [Luku 8: Tuotanto](../chapter-08-production/README.md) |

---

## 📖 Liittyvät resurssit

- [Esijulkaisun tarkistukset](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurointiopas](../chapter-03-configuration/configuration.md)
- [AZD:n GitHub-ongelmat](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tämä asiakirja on käännetty käyttäen tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme täsmällisyyteen, huomioithan, että automatisoiduissa käännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää määräävänä lähteenä. Tärkeää tietoa varten suositellaan ammattimaista, ihmisen tekemää käännöstä. Emme ole vastuussa tästä käännöksestä aiheutuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
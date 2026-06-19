# Luku 7: Vianmääritys ja virheenkorjaus

**📚 Kurssi**: [AZD aloittelijoille](../../README.md) | **⏱️ Kesto**: 1-1.5 tuntia | **⭐ Vaikeustaso**: Keskitaso

---

## Yleiskatsaus

Tämä luku auttaa diagnosoimaan ja ratkaisemaan yleisiä ongelmia Azure Developer CLI:n kanssa työskenneltäessä. Käyttöönoton epäonnistumisista tekoälykohtaisiin ongelmiin.

> Varmennettu `azd 1.25.6`:lla kesäkuussa 2026.

## Oppimistavoitteet

By completing this chapter, you will:
- Tunnistaa yleiset AZD-käyttöönoton epäonnistumiset
- Etsiä ja korjata todennukseen ja käyttöoikeuksiin liittyviä ongelmia
- Ratkaista tekoälypalveluiden yhteysongelmat
- Käyttää Azure-portaalia ja CLI:tä vianmääritykseen

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Yleiset ongelmat](common-issues.md) | Usein esiintyvät ongelmat | 30 min |
| 2 | [Vianmääritysopas](debugging.md) | Vaiheittaiset vianmääritysstrategiat | 45 min |
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
| `AuthenticationError` | Ei kirjautunut sisään | `azd auth login` |
| `ResourceNotFound` | Puuttuva resurssi | Tarkista resurssien nimet |
| `QuotaExceeded` | Tilausrajoitukset | Pyydä kiintiön korotusta |
| `InvalidTemplate` | Bicep-syntaksivirhe | `az bicep build` |
| `Conflict` | Resurssi on olemassa | Käytä uutta nimeä tai poista se |
| `Forbidden` | Riittämättömät käyttöoikeudet | Tarkista RBAC-roolit |

---

## 🔄 Nollaus ja palautus

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
| **Edellinen** | [Luku 6: Ennen käyttöönottoa](../chapter-06-pre-deployment/README.md) |
| **Seuraava** | [Luku 8: Tuotanto](../chapter-08-production/README.md) |

---

## 📖 Aiheeseen liittyvät resurssit

- [Ennen käyttöönottoa tarkistukset](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurointiopas](../chapter-03-configuration/configuration.md)
- [AZD GitHub -ongelmat](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
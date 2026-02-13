# Luku 7: Vianmääritys & Virheenkorjaus

**📚 Kurssi**: [AZD aloittelijoille](../../README.md) | **⏱️ Kesto**: 1-1.5 hours | **⭐ Vaikeustaso**: Keskitaso

---

## Yleiskatsaus

Tämä luku auttaa sinua diagnosoimaan ja ratkaisemaan yleisiä ongelmia, joita esiintyy työskenneltäessä Azure Developer CLI:n kanssa. Mukana on kaikkea käyttöönoton epäonnistumisista AI-spesifisiin ongelmiin.

## Oppimistavoitteet

Suorittamalla tämän luvun osaat:
- Diagnoisoida yleisiä AZD:n käyttöönoton epäonnistumisia
- Vianmääritystä todennuksen ja käyttöoikeuksien ongelmissa
- Ratkaista AI-palveluiden yhteysongelmia
- Käyttää Azure-portaalia ja CLI:tä vianmääritykseen

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [Yleiset ongelmat](common-issues.md) | Usein kohtaavat ongelmat | 30 min |
| 2 | [Vianmääritysohje](debugging.md) | Askel askeleelta vianmääritysstrategiat | 45 min |
| 3 | [AI-vianmääritys](ai-troubleshooting.md) | AI-spesifiset ongelmat | 30 min |

---

## 🚨 Pikakorjaukset

### Todennusongelmat
```bash
azd auth login
az login
azd auth whoami
```

### Provisiointivirheet
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
| `QuotaExceeded` | Tilausrajoitukset | Pyydä käyttökiintiön korotusta |
| `InvalidTemplate` | Bicep-syntaksivirhe | `az bicep build` |
| `Conflict` | Resurssi on olemassa | Käytä uutta nimeä tai poista |
| `Forbidden` | Riittämättömät käyttöoikeudet | Tarkista RBAC-roolit |

---

## 🔄 Nollaus ja palautus

```bash
# Pehmeä nollaus (säilytä resurssit, ota koodi uudelleen käyttöön)
azd deploy --force

# Täydellinen nollaus (poista kaikki, aloita alusta)
azd down --force --purge
azd up
```

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Previous** | [Luku 6: Ennen käyttöönottoa](../chapter-06-pre-deployment/README.md) |
| **Next** | [Luku 8: Tuotanto](../chapter-08-production/README.md) |

---

## 📖 Aiheeseen liittyvät resurssit

- [Ennen käyttöönottoa -tarkastukset](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurointiohje](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla Co-op Translator (https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automatisoiduissa käännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää auktoriteettisena lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä johtuvista väärinymmärryksistä tai virhetulkintojen seurauksista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
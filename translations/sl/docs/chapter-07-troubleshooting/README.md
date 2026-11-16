# Poglavje 7: Odpravljanje težav in razhroščevanje

**📚 Tečaj**: [AZD Za začetnike](../../README.md) | **⏱️ Trajanje**: 1-1,5 ure | **⭐ Kompleksnost**: Vmesno

---

## Pregled

To poglavje vam pomaga diagnosticirati in rešiti pogoste težave pri delu z Azure Developer CLI. Od napak pri nameščanju do specifičnih težav z umetno inteligenco.

> Navodila za ukaze so preverjena glede na izdano referenco `azd 1.37.2`. Cloud nameščanja niso bila izvedena. Pred uporabo ukazov zamenjajte primere imen virov in ID-jev.

## Cilji učenja

Z dokončanjem tega poglavja boste:
- Diagnosticirali pogoste napake pri nameščanju AZD
- Odpravljali težave z avtentikacijo in dovoljenji
- Reševali težave s povezljivostjo AI storitev
- Uporabljali Azure Portal in CLI za odpravljanje težav

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|---------|-------|-----|
| 1 | [Pogoste težave](common-issues.md) | Pogosto srečane težave | 30 min |
| 2 | [Vodnik za razhroščevanje](debugging.md) | Strategije razhroščevanja korak za korakom | 45 min |
| 3 | [Odpravljanje težav z AI](ai-troubleshooting.md) | Težave specifične za AI | 30 min |

---

## 🚨 Hitre rešitve

### Težave z avtentikacijo
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Napake pri nameščanju
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Konflikti virov
Najprej preglejte obstoječe vire in napake nameščanja. Za rešitev konflikta imen ne brišite skupnega ali produkcijskega okolja. Za **novo začasno okolje** uporabite edinstveno ime:

```bash
azd env new different-name
azd up
```

### Presežena kvota
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Spreminjanje `AZURE_LOCATION` ne premakne obstoječih virov in lahko povzroči konflikte lokacije pri ponovni namestitvi.

---

## 📋 Referenca kod napak

| Napaka | Vzrok | Rešitev |
|--------|--------|---------|
| `AuthenticationError` | Niste prijavljeni | `azd auth login` |
| `ResourceNotFound` | Manjka vir | Preverite imena virov |
| `QuotaExceeded` | Omejitve naročnine | Zahtevajte povečanje kvote |
| `InvalidTemplate` | Napaka v sintaksi Bicep | `az bicep build` |
| `Conflict` | Vir že obstaja | Uporabite novo ime ali izbrišite |
| `Forbidden` | Nezadostne pravice | Preverite vloge RBAC |

---

## 🔄 Ponastavitev in Obnova

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Trdi ponastavitev izbriše podatke in lahko spremeni končne točke. Najprej naredite varnostno kopijo in preglejte interaktivne pozive za brisanje. `--force --purge` je primeren samo za začasna okolja, ko je namenjena nepovratna izbris.

---

## 🔗 Navigacija

| Smer | Poglavje |
|-------|---------|
| **Prejšnje** | [Poglavje 6: Pred nameščanjem](../chapter-06-pre-deployment/README.md) |
| **Naslednje** | [Poglavje 8: Produkcija](../chapter-08-production/README.md) |

---

## 📖 Sorodni viri

- [Preverjanje pred nameščanjem](../chapter-06-pre-deployment/preflight-checks.md)
- [Vodnik za konfiguracijo](../chapter-03-configuration/configuration.md)
- [AZD GitHub težave](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
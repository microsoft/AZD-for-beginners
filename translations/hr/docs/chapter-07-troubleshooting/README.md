# Poglavlje 7: Rješavanje problema i ispravljanje pogrešaka

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 1-1,5 sati | **⭐ Kompleksnost**: Srednja razina

---

## Pregled

Ovo poglavlje pomaže vam dijagnosticirati i riješiti uobičajene probleme prilikom rada s Azure Developer CLI. Od neuspjeha implementacije do problema specifičnih za AI.

> Upute za naredbe pregleda su u skladu s objavljenim `azd 1.37.2` referentnim materijalom. Implementacije u oblaku nisu izvršene. Zamijenite primjere naziva resursa i ID-ove prije korištenja naredbi.

## Ciljevi učenja

Završetkom ovog poglavlja ćete:
- Dijagnosticirati uobičajene neuspjehe AZD implementacije
- Ispravljati probleme s autentifikacijom i dopuštenjima
- Riješiti probleme s povezivanjem AI usluga
- Koristiti Azure Portal i CLI za rješavanje problema

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Uobičajeni problemi](common-issues.md) | Često se javljajući problemi | 30 min |
| 2 | [Vodič za ispravljanje pogrešaka](debugging.md) | Strategije korak-po-korak | 45 min |
| 3 | [Rješavanje problema AI](ai-troubleshooting.md) | Problemi specifični za AI | 30 min |

---

## 🚨 Brza rješenja

### Problemi s autentifikacijom
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Neuspjesi u provisioningu
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Sukobi resursa
Prvo pregledajte postojeće pogreške resursa i implementacije. Nemojte brisati zajedničko ili produkcijsko okruženje da biste riješili sukob u nazivima. Za **novo privremeno okruženje**, koristite jedinstveni naziv:

```bash
azd env new different-name
azd up
```

### Prekoračenje kvote
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Promjena `AZURE_LOCATION` ne premješta postojeće resurse i može uzrokovati sukobe lokacija prilikom ponovne implementacije.

---

## 📋 Referenca kodova pogrešaka

| Pogreška | Uzrok | Rješenje |
|-------|-------|----------|
| `AuthenticationError` | Niste prijavljeni | `azd auth login` |
| `ResourceNotFound` | Nedostaje resurs | Provjerite nazive resursa |
| `QuotaExceeded` | Ograničenja pretplate | Zatražite povećanje kvote |
| `InvalidTemplate` | Sintaksna pogreška u Bicep-u | `az bicep build` |
| `Conflict` | Resurs već postoji | Koristite novi naziv ili izbrišite |
| `Forbidden` | Nedovoljna dopuštenja | Provjerite RBAC uloge |

---

## 🔄 Resetiranje i oporavak

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Hard reset briše podatke i može promijeniti krajnje točke. Prvo napravite sigurnosnu kopiju i pregledajte interaktivne upite za brisanje. `--force --purge` je prikladan samo za privremena okruženja kada je namjera nepovratnog brisanja.

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 6: Prije implementacije](../chapter-06-pre-deployment/README.md) |
| **Sljedeće** | [Poglavlje 8: Produkcija](../chapter-08-production/README.md) |

---

## 📖 Povezani izvori

- [Provjere prije implementacije](../chapter-06-pre-deployment/preflight-checks.md)
- [Vodič za konfiguraciju](../chapter-03-configuration/configuration.md)
- [AZD GitHub problemi](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
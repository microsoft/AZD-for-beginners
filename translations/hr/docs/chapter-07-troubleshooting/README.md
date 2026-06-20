# Poglavlje 7: Rješavanje problema i ispravljanje pogrešaka

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 1-1.5 sati | **⭐ Težina**: Srednja

---

## Pregled

Ovo poglavlje pomaže vam dijagnosticirati i riješiti uobičajene probleme pri radu s Azure Developer CLI-jem. Od neuspjeha u implementaciji do problema specifičnih za AI.

> Validirano s verzijom `azd 1.25.6` u lipnju 2026.

## Ciljevi učenja

Nakon završetka ovog poglavlja, moći ćete:
- Dijagnosticirati uobičajene neuspjehe implementacije AZD-a
- Ispravljati probleme s autentifikacijom i dopuštenjima
- Riješiti probleme povezivanja AI usluga
- Koristiti Azure Portal i CLI za otklanjanje problema

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|---------|-------|---------|
| 1 | [Uobičajeni problemi](common-issues.md) | Često susretani problemi | 30 min |
| 2 | [Vodič za ispravljanje pogrešaka](debugging.md) | Korak-po-korak strategije ispravljanja | 45 min |
| 3 | [Rješavanje AI problema](ai-troubleshooting.md) | Problemi specifični za AI | 30 min |

---

## 🚨 Brza rješenja

### Problemi s autentifikacijom
```bash
# Potrebno za AZD tokove rada
azd auth login

# Opcionalno ako također izravno koristite Azure CLI naredbe
az login

azd auth status
```

### Neuspjesi prilikom provisioniranja
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Sukobi resursa
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Prekoračenje kvote
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Referenca kodova pogrešaka

| Pogreška | Uzrok | Rješenje |
|----------|-------|----------|
| `AuthenticationError` | Niste prijavljeni | `azd auth login` |
| `ResourceNotFound` | Nedostaje resurs | Provjerite nazive resursa |
| `QuotaExceeded` | Ograničenja pretplate | Zatražite povećanje kvote |
| `InvalidTemplate` | Pogreška u sintaksi Bicep | `az bicep build` |
| `Conflict` | Resurs već postoji | Koristite novo ime ili izbrišite |
| `Forbidden` | Nedovoljna dopuštenja | Provjerite RBAC uloge |

---

## 🔄 Resetiranje i oporavak

```bash
# Meki reset (zadržavanje resursa, ponovno postavljanje koda)
azd deploy --force

# Tvrdi reset (brisanje svega, početak iznova)
azd down --force --purge
azd up
```

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-------|-----------|
| **Prethodno** | [Poglavlje 6: Pred implementacijom](../chapter-06-pre-deployment/README.md) |
| **Sljedeće** | [Poglavlje 8: Produkcija](../chapter-08-production/README.md) |

---

## 📖 Povezani resursi

- [Provjere prije implementacije](../chapter-06-pre-deployment/preflight-checks.md)
- [Vodič za konfiguraciju](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
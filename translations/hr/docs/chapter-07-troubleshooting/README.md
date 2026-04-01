# Poglavlje 7: Rješavanje problema i ispravljanje pogrešaka

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 1-1.5 sati | **⭐ Kompleksnost**: Srednja

---

## Pregled

Ovo poglavlje pomaže vam dijagnosticirati i riješiti uobičajene probleme pri radu s Azure Developer CLI. Od neuspjeha u implementaciji do problema specifičnih za umjetnu inteligenciju.

> Validirano na `azd 1.23.12` u ožujku 2026.

## Ciljevi učenja

Nakon završetka ovog poglavlja, moći ćete:
- Dijagnosticirati uobičajene neuspjehe implementacije AZD-a
- Ispravljati probleme s autentifikacijom i dozvolama
- Riješiti probleme s povezivanjem AI usluga
- Koristiti Azure Portal i CLI za rješavanje problema

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Uobičajeni problemi](common-issues.md) | Često susretani problemi | 30 min |
| 2 | [Vodič za ispravljanje pogrešaka](debugging.md) | Strategije korak-po-korak | 45 min |
| 3 | [Rješavanje problema s AI](ai-troubleshooting.md) | Problemi specifični za AI | 30 min |

---

## 🚨 Brza rješenja

### Problemi s autentifikacijom
```bash
# Potrebno za AZD radne tokove
azd auth login

# Opcionalno ako također izravno koristite Azure CLI naredbe
az login

azd auth status
```

### Neuspjesi u provisioningu
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
|-------|-------|----------|
| `AuthenticationError` | Niste prijavljeni | `azd auth login` |
| `ResourceNotFound` | Nedostaje resurs | Provjerite nazive resursa |
| `QuotaExceeded` | Ograničenja pretplate | Zatražite povećanje kvote |
| `InvalidTemplate` | Pogreška u Bicep sintaksi | `az bicep build` |
| `Conflict` | Resurs već postoji | Koristite novi naziv ili izbrisati postojeći |
| `Forbidden` | Nedostatak dozvola | Provjerite RBAC uloge |

---

## 🔄 Resetiranje i oporavak

```bash
# Soft reset (zadrži resurse, ponovno postavi kod)
azd deploy --force

# Hard reset (izbriši sve, počni ispočetka)
azd down --force --purge
azd up
```

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 6: Prije implementacije](../chapter-06-pre-deployment/README.md) |
| **Sljedeće** | [Poglavlje 8: Produkcija](../chapter-08-production/README.md) |

---

## 📖 Povezani resursi

- [Provjere prije implementacije](../chapter-06-pre-deployment/preflight-checks.md)
- [Vodič za konfiguraciju](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatizirani prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na njegovom izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakva kriva tumačenja ili nesporazume koji proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
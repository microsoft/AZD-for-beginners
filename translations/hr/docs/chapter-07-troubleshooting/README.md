# Poglavlje 7: Otklanjanje poteškoća i ispravljanje pogrešaka

**📚 Tečaj**: [AZD For Beginners](../../README.md) | **⏱️ Trajanje**: 1-1.5 hours | **⭐ Složenost**: Intermediate

---

## Pregled

Ovo poglavlje pomaže vam dijagnosticirati i riješiti uobičajene probleme pri radu s Azure Developer CLI. Od neuspjeha implementacije do problema specifičnih za AI.

## Ciljevi učenja

Nakon dovršetka ovog poglavlja, moći ćete:
- Dijagnosticirati uobičajene AZD neuspjehe implementacije
- Otkloniti probleme s autentikacijom i dopuštenjima
- Riješiti probleme s povezivošću AI servisa
- Koristiti Azure Portal i CLI za otklanjanje poteškoća

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Česti problemi](common-issues.md) | Učestalo susretani problemi | 30 min |
| 2 | [Vodič za ispravljanje pogrešaka](debugging.md) | Korak-po-korak strategije za ispravljanje pogrešaka | 45 min |
| 3 | [Rješavanje AI problema](ai-troubleshooting.md) | Problemi specifični za AI | 30 min |

---

## 🚨 Brze popravke

### Problemi s autentikacijom
```bash
azd auth login
az login
azd auth whoami
```

### Pogreške pri provisioniranju
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

### Kvota premašena
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Referenca kodova pogrešaka

| Pogreška | Uzrok | Rješenje |
|-------|-------|----------|
| `AuthenticationError` | Nije prijavljen | `azd auth login` |
| `ResourceNotFound` | Nedostaje resurs | Provjerite nazive resursa |
| `QuotaExceeded` | Ograničenja pretplate | Zatražite povećanje kvote |
| `InvalidTemplate` | Sintaksna pogreška u Bicep | `az bicep build` |
| `Conflict` | Resurs postoji | Koristite novo ime ili obrišite |
| `Forbidden` | Nedovoljna dopuštenja | Provjerite RBAC uloge |

---

## 🔄 Resetiranje i oporavak

```bash
# Meki reset (zadržati resurse, ponovno rasporediti kod)
azd deploy --force

# Tvrdi reset (izbrisati sve, početi ispočetka)
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
- [Problemi na GitHubu za AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Odricanje odgovornosti:

Ovaj dokument preveden je pomoću AI usluge za prevođenje Co-op Translator (https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja koja proizađu iz upotrebe ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
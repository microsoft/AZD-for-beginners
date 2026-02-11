# Capitolul 7: Diagnosticare și depanare

**📚 Curs**: [AZD For Beginners](../../README.md) | **⏱️ Durată**: 1-1.5 ore | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol vă ajută să diagnosticați și să rezolvați problemele comune atunci când lucrați cu Azure Developer CLI. De la eșecuri de implementare până la probleme specifice AI.

## Obiective de învățare

După parcurgerea acestui capitol, veți:
- Diagnostica eșecurile comune de implementare AZD
- Depana problemele de autentificare și permisiuni
- Rezolva problemele de conectivitate ale serviciilor AI
- Utiliza Azure Portal și CLI pentru depanare

---

## 📚 Lecții

| # | Lecție | Descriere | Durată |
|---|--------|-------------|------|
| 1 | [Common Issues](common-issues.md) | Probleme întâlnite frecvent | 30 min |
| 2 | [Debugging Guide](debugging.md) | Strategii de depanare pas cu pas | 45 min |
| 3 | [AI Troubleshooting](ai-troubleshooting.md) | Probleme specifice AI | 30 min |

---

## 🚨 Soluții rapide

### Probleme de autentificare
```bash
azd auth login
az login
azd auth whoami
```

### Eșecuri la provisionare
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Conflicte de resurse
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Cotă depășită
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Referință coduri de eroare

| Eroare | Cauză | Soluție |
|-------|-------|----------|
| `AuthenticationError` | Neautentificat | `azd auth login` |
| `ResourceNotFound` | Resursă lipsă | Verificați numele resurselor |
| `QuotaExceeded` | Limitări ale abonamentului | Solicitați creșterea cotei |
| `InvalidTemplate` | Eroare de sintaxă Bicep | `az bicep build` |
| `Conflict` | Resursă existentă | Folosiți un nume nou sau ștergeți |
| `Forbidden` | Permisiuni insuficiente | Verificați rolurile RBAC |

---

## 🔄 Resetare și recuperare

```bash
# Resetare soft (păstrează resursele, re-deployează codul)
azd deploy --force

# Resetare hard (șterge totul, pornește de la zero)
azd down --force --purge
azd up
```

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Previous** | [Capitolul 6: Pre-implementare](../chapter-06-pre-deployment/README.md) |
| **Next** | [Capitolul 8: Producție](../chapter-08-production/README.md) |

---

## 📖 Resurse conexe

- [Pre-Deployment Checks](../chapter-06-pre-deployment/preflight-checks.md)
- [Configuration Guide](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Declinare de responsabilitate:
Acest document a fost tradus folosind serviciul de traducere AI Co-op Translator (https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat sursa autorizată. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm responsabilitatea pentru eventuale neînțelegeri sau interpretări greșite care pot rezulta din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
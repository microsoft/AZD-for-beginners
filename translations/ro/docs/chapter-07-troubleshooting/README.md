# Capitolul 7: Depanare & Debugging

**📚 Curs**: [AZD pentru începători](../../README.md) | **⏱️ Durată**: 1-1.5 ore | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol te ajută să diagnostichezi și să rezolvi probleme comune atunci când lucrezi cu Azure Developer CLI. De la eșecuri de implementare la probleme specifice AI.

> Validat cu `azd 1.23.12` în martie 2026.

## Obiective de învățare

După parcurgerea acestui capitol, vei:
- Diagnostica eșecurile comune de implementare AZD
- Depana problemele de autentificare și permisiuni
- Rezolva problemele de conectivitate ale serviciilor AI
- Folosi Azure Portal și CLI pentru depanare

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-----------|------|
| 1 | [Common Issues](common-issues.md) | Probleme întâlnite frecvent | 30 min |
| 2 | [Debugging Guide](debugging.md) | Strategii de depanare pas cu pas | 45 min |
| 3 | [AI Troubleshooting](ai-troubleshooting.md) | Probleme specifice AI | 30 min |

---

## 🚨 Remedieri rapide

### Probleme de autentificare
```bash
# Necesar pentru fluxurile de lucru AZD
azd auth login

# Opțional dacă utilizați și comenzile Azure CLI direct
az login

azd auth status
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
|-------|-------|---------|
| `AuthenticationError` | Neautentificat | `azd auth login` |
| `ResourceNotFound` | Resursă lipsă | Verifică numele resurselor |
| `QuotaExceeded` | Limite ale abonamentului | Solicită creșterea cotei |
| `InvalidTemplate` | Eroare de sintaxă Bicep | `az bicep build` |
| `Conflict` | Resursa există | Folosește un nume nou sau șterge |
| `Forbidden` | Permisiuni insuficiente | Verifică rolurile RBAC |

---

## 🔄 Resetare și recuperare

```bash
# Resetare soft (păstrează resursele, redeploiază codul)
azd deploy --force

# Resetare completă (șterge tot, pornește de la zero)
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

- [Verificări pre-implementare](../chapter-06-pre-deployment/preflight-checks.md)
- [Ghid de configurare](../chapter-03-configuration/configuration.md)
- [Issue-urile AZD pe GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autoritativă. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu suntem răspunzători pentru orice neînțelegeri sau interpretări eronate care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
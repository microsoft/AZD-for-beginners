# Capitolul 7: Depanare și Debugging

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 1-1.5 ore | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol te ajută să diagnostichezi și să rezolvi probleme comune când lucrezi cu Azure Developer CLI. De la eșecuri de implementare la probleme specifice AI.

> Validat cu `azd 1.27.1` în iulie 2026.

## Obiective de învățare

Parcurgând acest capitol, vei:
- Diagnostica eșecurile comune de implementare AZD
- Depana problemele de autentificare și permisiuni
- Rezolva probleme de conectivitate la serviciile AI
- Folosi Azure Portal și CLI pentru depanare

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Probleme Comune](common-issues.md) | Probleme întâlnite frecvent | 30 min |
| 2 | [Ghid de Debugging](debugging.md) | Strategii pas cu pas pentru depanare | 45 min |
| 3 | [Depanare AI](ai-troubleshooting.md) | Probleme specifice AI | 30 min |

---

## 🚨 Remedieri Rapide

### Probleme de Autentificare
```bash
# Necesare pentru fluxurile de lucru AZD
azd auth login

# Opțional dacă utilizați și comenzile Azure CLI direct
az login

azd auth status
```

### Eșecuri de Provisionare
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Conflicte de Resurse
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Cota Depășită
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Referință Coduri de Eroare

| Eroare | Cauză | Soluție |
|-------|-------|----------|
| `AuthenticationError` | Nu s-a autentificat | `azd auth login` |
| `ResourceNotFound` | Resursă lipsă | Verifică numele resurselor |
| `QuotaExceeded` | Limite ale abonamentului | Solicită majorarea cotei |
| `InvalidTemplate` | Eroare de sintaxă Bicep | `az bicep build` |
| `Conflict` | Resursă existenta | Folosește un nume nou sau șterge |
| `Forbidden` | Permisiuni insuficiente | Verifică rolurile RBAC |

---

## 🔄 Resetare și Recuperare

```bash
# Resetare soft (păstrează resursele, redeplasează codul)
azd deploy --force

# Resetare hard (șterge totul, începe de la zero)
azd down --force --purge
azd up
```

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 6: Pre-Implementare](../chapter-06-pre-deployment/README.md) |
| **Următor** | [Capitolul 8: Producție](../chapter-08-production/README.md) |

---

## 📖 Resurse Aflate în Legătură

- [Verificări Pre-Implementare](../chapter-06-pre-deployment/preflight-checks.md)
- [Ghid de Configurare](../chapter-03-configuration/configuration.md)
- [Probleme AZD pe GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Capitolul 7: Depanare și Debugging

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 1-1.5 ore | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol te ajută să diagnostichezi și să rezolvi probleme comune atunci când lucrezi cu Azure Developer CLI. De la eșecuri de implementare până la probleme specifice AI.

> Ghidul comenzilor revizuit în conformitate cu referința lansată `azd 1.37.2`. Implementările în cloud nu au fost executate. Înlocuiește numele și ID-urile de resurse de exemplu înainte de a folosi comenzile.

## Obiective de învățare

Prin parcurgerea acestui capitol, vei:
- Diagnostica eșecuri comune de implementare AZD
- Depana probleme de autentificare și permisiuni
- Rezolva probleme de conectivitate ale serviciilor AI
- Folosi Portalul Azure și CLI pentru depanare

---

## 📚 Lecții

| # | Lecție | Descriere | Durată |
|---|--------|-------------|------|
| 1 | [Probleme Comune](common-issues.md) | Probleme întâlnite frecvent | 30 min |
| 2 | [Ghid de Debugging](debugging.md) | Strategii pas cu pas de debugging | 45 min |
| 3 | [Depanare AI](ai-troubleshooting.md) | Probleme specifice AI | 30 min |

---

## 🚨 Remedii rapide

### Probleme de autentificare
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Eșecuri la provisioning
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Conflicte între resurse
Verifică mai întâi resursa existentă și erorile de implementare. Nu șterge un mediu partajat sau de producție pentru a rezolva un conflict de denumire. Pentru un **mediu nou și dispensabil**, folosește un nume unic:

```bash
azd env new different-name
azd up
```

### Depășirea cotei
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Modificarea `AZURE_LOCATION` nu mută resursele existente și poate cauza conflicte de locație la redeployment.

---

## 📋 Referință coduri de eroare

| Eroare | Cauză | Soluție |
|-------|-------|----------|
| `AuthenticationError` | Nu ești autentificat | `azd auth login` |
| `ResourceNotFound` | Lipsă resursă | Verifică numele resurselor |
| `QuotaExceeded` | Limite abonament | Solicita creșterea cotei |
| `InvalidTemplate` | Eroare de sintaxă Bicep | `az bicep build` |
| `Conflict` | Resursă existentă | Folosește nume nou sau șterge |
| `Forbidden` | Permisiuni insuficiente | Verifică rolurile RBAC |

---

## 🔄 Resetare și recuperare

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Resetarea dură șterge date și poate schimba punctele finale. Fă backup înainte și analizează prompturile interactive de ștergere. `--force --purge` este potrivit doar pentru medii dispensabile când se intenționează ștergerea ireversibilă.

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 6: Pre-Implementare](../chapter-06-pre-deployment/README.md) |
| **Următor** | [Capitolul 8: Producție](../chapter-08-production/README.md) |

---

## 📖 Resurse conexe

- [Verificări Pre-Implementare](../chapter-06-pre-deployment/preflight-checks.md)
- [Ghid de Configurare](../chapter-03-configuration/configuration.md)
- [Probleme AZD pe GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
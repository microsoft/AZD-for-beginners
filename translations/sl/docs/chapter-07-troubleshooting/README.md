# Poglavje 7: Odpravljanje težav in razhroščevanje

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 1-1.5 ure | **⭐ Zahtevnost**: Srednje

---

## Pregled

To poglavje vam pomaga diagnosticirati in rešiti pogoste težave pri delu z Azure Developer CLI. Od napak pri uvajanju do težav, specifičnih za AI.

> Preverjeno z `azd 1.23.12` marca 2026.

## Cilji učenja

Po zaključku tega poglavja boste:
- Diagnosticirali pogoste napake pri uvajanju z AZD
- Odpravili težave z overjanjem in dovoljenji
- Rešili težave s povezljivostjo AI storitev
- Uporabljali Azure Portal in CLI za odpravljanje težav

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Pogoste težave](common-issues.md) | Pogoste težave | 30 min |
| 2 | [Vodnik za razhroščevanje](debugging.md) | Korak-po-koraku strategije za razhroščevanje | 45 min |
| 3 | [Odpravljanje težav AI](ai-troubleshooting.md) | Težave, specifične za AI | 30 min |

---

## 🚨 Hitre rešitve

### Težave z avtentikacijo
```bash
# Zahtevano za AZD delovne tokove
azd auth login

# Neobvezno, če tudi neposredno uporabljate ukaze Azure CLI
az login

azd auth status
```

### Napake pri zagotavljanju virov
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Konflikti virov
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Presežena kvota
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Referenca kod napak

| Napaka | Vzrok | Rešitev |
|-------|-------|----------|
| `AuthenticationError` | Niste prijavljeni | `azd auth login` |
| `ResourceNotFound` | Manjkajoči vir | Preverite imena virov |
| `QuotaExceeded` | Omejitve naročnine | Zahtevajte povečanje kvote |
| `InvalidTemplate` | Napaka v sintaksi Bicep | `az bicep build` |
| `Conflict` | Vir že obstaja | Uporabite novo ime ali izbrišite |
| `Forbidden` | Nezadostna dovoljenja | Preverite vloge RBAC |

---

## 🔄 Ponastavitev in obnova

```bash
# Mehka ponastavitev (ohraniti vire, ponovno razmestiti kodo)
azd deploy --force

# Trda ponastavitev (izbrisati vse, začeti znova)
azd down --force --purge
azd up
```

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 6: Pred uvajanjem](../chapter-06-pre-deployment/README.md) |
| **Naslednje** | [Poglavje 8: Produkcija](../chapter-08-production/README.md) |

---

## 📖 Povezani viri

- [Preverjanja pred uvajanjem](../chapter-06-pre-deployment/preflight-checks.md)
- [Vodnik za konfiguracijo](../chapter-03-configuration/configuration.md)
- [Zadeve AZD na GitHubu](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v svojem izvirnem jeziku velja za avtoritativni vir. Za kritične informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za kakršnekoli nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
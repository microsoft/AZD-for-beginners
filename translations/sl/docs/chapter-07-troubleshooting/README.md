# Poglavje 7: Odpravljanje težav in razhroščevanje

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 1-1,5 ure | **⭐ Kompleksnost**: Srednje

---

## Pregled

To poglavje vam pomaga diagnosticirati in rešiti pogoste težave pri delu z Azure Developer CLI. Od neuspehov pri uvajanju do težav, specifičnih za AI.

> Preverjeno z `azd 1.27.1` v juliju 2026.

## Cilji učenja

Z dokončanjem tega poglavja boste:
- Diagnosticirali pogoste neuspehe UVODANJA AZD
- Razhroščevali težave z avtorizacijo in dovoljenji
- Rešili težave s povezljivostjo AI storitev
- Uporabili Azure Portal in CLI za odpravljanje težav

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Pogoste težave](common-issues.md) | Pogosto srečane težave | 30 min |
| 2 | [Vodič za razhroščevanje](debugging.md) | Strategije razhroščevanja po korakih | 45 min |
| 3 | [Odpravljanje težav AI](ai-troubleshooting.md) | Težave specifične za AI | 30 min |

---

## 🚨 Hitre rešitve

### Težave z avtorizacijo
```bash
# Zahtevano za delovne tokove AZD
azd auth login

# Neobvezno, če neposredno uporabljate tudi ukaze Azure CLI
az login

azd auth status
```

### Neuspehi pri uvajanju
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
| `ResourceNotFound` | Manjka vir | Preverite imena virov |
| `QuotaExceeded` | Omejitve naročnine | Zahtevajte povečanje kvote |
| `InvalidTemplate` | Napaka v sintaksi Bicep | `az bicep build` |
| `Conflict` | Vir že obstaja | Uporabite novo ime ali izbrišite |
| `Forbidden` | Premalo dovoljenj | Preverite RBAC vloge |

---

## 🔄 Ponastavitev in okrevanje

```bash
# Mehka ponastavitev (ohrani vire, ponovno namesti kodo)
azd deploy --force

# Trda ponastavitev (izbriši vse, začni znova)
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

## 📖 Sorodni viri

- [Preverjanja pred uvajanjem](../chapter-06-pre-deployment/preflight-checks.md)
- [Vodič za konfiguracijo](../chapter-03-configuration/configuration.md)
- [AZD GitHub težave](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
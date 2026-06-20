# Poglavje 7: Odpravljanje težav in razhroščevanje

**📚 Tečaj**: [AZD For Beginners](../../README.md) | **⏱️ Trajanje**: 1–1,5 ure | **⭐ Kompleksnost**: Srednje zahtevno

---

## Pregled

To poglavje vam pomaga diagnosticirati in odpraviti pogoste težave pri delu z Azure Developer CLI. Od napak pri nameščanju do težav, specifičnih za AI.

> Preverjeno z `azd 1.25.6` junija 2026.

## Cilji učenja

Z dokončanjem tega poglavja boste:
- Diagnosticirali pogoste napake pri nameščanju z AZD
- Razhroščili težave z overjanjem in dovoljenji
- Rešili težave s povezljivostjo AI-storitev
- Uporabljali Azure Portal in CLI za odpravljanje težav

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Pogoste težave](common-issues.md) | Pogoste težave | 30 min |
| 2 | [Vodnik za razhroščevanje](debugging.md) | Strategije razhroščevanja korak za korakom | 45 min |
| 3 | [Odpravljanje težav AI](ai-troubleshooting.md) | Težave, specifične za AI | 30 min |

---

## 🚨 Hitre rešitve

### Težave z overjanjem
```bash
# Zahtevano za AZD poteke dela
azd auth login

# Izbirno, če neposredno uporabljate tudi ukaze Azure CLI
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

### Prekoračena kvota
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
| `Forbidden` | Nedovoljna dovoljenja | Preverite RBAC vloge |

---

## 🔄 Ponastavitev in obnovitev

```bash
# Mehka ponastavitev (ohrani vire, ponovno razporedi kodo)
azd deploy --force

# Trda ponastavitev (izbriši vse, začni znova)
azd down --force --purge
azd up
```

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 6: Prednamestitev](../chapter-06-pre-deployment/README.md) |
| **Naslednje** | [Poglavje 8: Produkcija](../chapter-08-production/README.md) |

---

## 📖 Sorodni viri

- [Preverjanje pred nameščanjem](../chapter-06-pre-deployment/preflight-checks.md)
- [Vodnik za konfiguracijo](../chapter-03-configuration/configuration.md)
- [Problemi AZD na GitHubu](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
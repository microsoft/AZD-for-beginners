# Poglavje 7: Odpravljanje težav in razhroščevanje

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 1-1.5 hours | **⭐ Zahtevnost**: Srednja

---

## Pregled

To poglavje vam pomaga diagnosticirati in rešiti pogoste težave pri delu z Azure Developer CLI. Od neuspehov uvajanja do težav, specifičnih za AI.

## Cilji učenja

S končanjem tega poglavja boste:
- Diagnozirati pogoste napake pri uvajanju z AZD
- Odpravljati težave z overjanjem in dovoljenji
- Reševati težave s povezljivostjo AI storitev
- Uporabljati Azure Portal in CLI za odpravljanje težav

---

## 📚 Lekcije

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Pogoste težave](common-issues.md) | Pogoste težave | 30 min |
| 2 | [Vodnik za odpravljanje napak](debugging.md) | Strategije odpravljanja napak korak za korakom | 45 min |
| 3 | [Odpravljanje težav z AI](ai-troubleshooting.md) | AI-specifične težave | 30 min |

---

## 🚨 Hitre rešitve

### Težave z overjanjem
```bash
azd auth login
az login
azd auth whoami
```

### Neuspehi pri zagotavljanju virov
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

### Kvota prekoračena
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
| `ResourceNotFound` | Manjkajoč vir | Preverite imena virov |
| `QuotaExceeded` | Omejitve naročnine | Zahtevajte povečanje kvote |
| `InvalidTemplate` | Napaka v sintaksi Bicep | `az bicep build` |
| `Conflict` | Vir že obstaja | Uporabite novo ime ali izbrišite |
| `Forbidden` | Nezadostna dovoljenja | Preverite RBAC vloge |

---

## 🔄 Ponastavitev in obnovitev

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
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za avtomatski prevod AI [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku velja za avtoritativni vir. Za kritične informacije priporočamo strokovni prevod, opravljen s strani človeškega prevajalca. Za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda, ne prevzemamo odgovornosti.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
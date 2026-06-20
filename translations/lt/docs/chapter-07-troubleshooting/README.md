# Skyrius 7: Gedimų šalinimas ir derinimas

**📚 Kursas**: [AZD For Beginners](../../README.md) | **⏱️ Trukmė**: 1-1.5 val. | **⭐ Sudėtingumas**: Vidutinis

---

## Apžvalga

Šis skyrius padės diagnozuoti ir išspręsti įprastas problemas dirbant su Azure Developer CLI. Nuo diegimo klaidų iki AI specifinių problemų.

> Patikrinta su `azd 1.25.6` 2026 m. birželį.

## Mokymosi tikslai

Baigę šį skyrių, sugebėsite:
- Diagnozuoti dažnas AZD diegimo klaidas
- Taisyti autentifikavimo ir leidimų problemas
- Išspręsti AI paslaugų ryšio problemas
- Naudoti Azure Portal ir CLI gedimų šalinimui

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-----------|--------|
| 1 | [Dažnos problemos](common-issues.md) | Dažnai pasitaikančios problemos | 30 min |
| 2 | [Derinimo vadovas](debugging.md) | Žingsnis po žingsnio derinimo strategijos | 45 min |
| 3 | [AI gedimų šalinimas](ai-troubleshooting.md) | AI specifinės problemos | 30 min |

---

## 🚨 Greiti sprendimai

### Autentifikavimo problemos
```bash
# Reikalinga AZD darbo eigos vykdymui
azd auth login

# Nebūtina, jei taip pat tiesiogiai naudojate Azure CLI komandas
az login

azd auth status
```

### Teikimo (provisioning) klaidos
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Išteklių konfliktai
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Kvotos viršijimas
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Klaidų kodų nuoroda

| Klaida | Priežastis | Sprendimas |
|--------|-----------|-----------|
| `AuthenticationError` | Nesate prisijungę | `azd auth login` |
| `ResourceNotFound` | Resursas nerastas | Patikrinkite resursų pavadinimus |
| `QuotaExceeded` | Prenumeratos limitai | Prašyti kvotos padidinimo |
| `InvalidTemplate` | Bicep sintaksės klaida | `az bicep build` |
| `Conflict` | Resursas egzistuoja | Naudokite kitą pavadinimą arba ištrinkite |
| `Forbidden` | Nepakankamos teisės | Patikrinkite RBAC vaidmenis |

---

## 🔄 Atstatymas ir atkūrimas

```bash
# Minkštas atstatymas (išsaugomi ištekliai, pakartotinai diegiamas kodas)
azd deploy --force

# Pilnas atstatymas (ištrinti viską, pradėti iš naujo)
azd down --force --purge
azd up
```

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|---------|---------|
| **Ankstesnis** | [Skyrius 6: Prieš diegimą](../chapter-06-pre-deployment/README.md) |
| **Kitas** | [Skyrius 8: Produkcija](../chapter-08-production/README.md) |

---

## 📖 Susiję ištekliai

- [Patikrinimai prieš diegimą](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigūracijos vadovas](../chapter-03-configuration/configuration.md)
- [AZD GitHub problemos](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
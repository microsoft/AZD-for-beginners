# 7 skyrius: Trikčių šalinimas ir derinimas

**📚 Kursas**: [AZD Pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 1-1,5 valandos | **⭐ Sudėtingumas**: Vidutinis

---

## Apžvalga

Šiame skyriuje padėsime diagnozuoti ir išspręsti dažnas problemas dirbant su Azure Developer CLI. Nuo diegimo klaidų iki AI specifinių problemų.

> Patvirtinta su `azd 1.27.1` 2026 m. liepos mėn.

## Mokymosi tikslai

Baigę šį skyrių, galėsite:
- Diagnozuoti dažnas AZD diegimo klaidas
- Derinti autentifikacijos ir leidimų problemas
- Spręsti AI paslaugų ryšio problemas
- Naudoti Azure Portal ir CLI trikčių šalinimui

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-------------|------|
| 1 | [Dažnos problemos](common-issues.md) | Dažnai sutinkamos problemos | 30 min |
| 2 | [Derinimo vadovas](debugging.md) | Žingsnis po žingsnio derinimo strategijos | 45 min |
| 3 | [AI trikčių šalinimas](ai-troubleshooting.md) | AI specifinės problemos | 30 min |

---

## 🚨 Greitieji pataisymai

### Autentifikacijos problemos
```bash
# Reikalinga AZD darbo eigos vykdymui
azd auth login

# Nebūtina, jei taip pat naudojate Azure CLI komandas tiesiogiai
az login

azd auth status
```

### Diegimo klaidos
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Išteklų konfliktai
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

## 📋 Klaidos kodų atmintinė

| Klaidа | Priežastis | Sprendimas |
|-------|-------|----------|
| `AuthenticationError` | Nepasirinkta prisijungti | `azd auth login` |
| `ResourceNotFound` | Trūksta ištekliaus | Patikrinkite išteklių pavadinimus |
| `QuotaExceeded` | Prenumeratos limitai | Prašykite kvotos padidinimo |
| `InvalidTemplate` | Bicep sintaksės klaida | `az bicep build` |
| `Conflict` | Išteklis jau egzistuoja | Naudokite naują pavadinimą arba ištrinkite |
| `Forbidden` | Nepakankamos teisės | Patikrinkite RBAC vaidmenis |

---

## 🔄 Atstatymas ir atsigavimas

```bash
# Minkštas perkrovimas (išlaikyti išteklius, perdiegi kodą)
azd deploy --force

# Sunkus perkrovimas (ištrinti viską, pradėti iš naujo)
azd down --force --purge
azd up
```

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|-----------|---------|
| **Ankstesnis** | [6 skyrius: Prieš diegimą](../chapter-06-pre-deployment/README.md) |
| **Kitas** | [8 skyrius: Gamyba](../chapter-08-production/README.md) |

---

## 📖 Susiję ištekliai

- [Prieš diegimą tikrinimai](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigūracijos vadovas](../chapter-03-configuration/configuration.md)
- [AZD GitHub problemos](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
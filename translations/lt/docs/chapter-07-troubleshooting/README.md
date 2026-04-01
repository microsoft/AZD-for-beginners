# 7 skyrius: Trikčių šalinimas ir derinimas

**📚 Kursas**: [AZD Pradžiamokslis](../../README.md) | **⏱️ Trukmė**: 1-1.5 valandos | **⭐ Sudėtingumas**: Vidutinis

---

## Apžvalga

Šis skyrius padeda diagnozuoti ir spręsti dažniausiai pasitaikančias problemas dirbant su Azure Developer CLI. Nuo diegimo klaidų iki dirbtinio intelekto specifinių problemų.

> Patikrinta su `azd 1.23.12` 2026 m. kovą.

## Mokymosi tikslai

Baigę šį skyrių, sugebėsite:
- Diagnozuoti dažnas AZD diegimo klaidas
- Derinti autentifikacijos ir leidimų problemas
- Spręsti dirbtinio intelekto paslaugų ryšio problemas
- Naudoti Azure portalą ir CLI trikčių šalinimui

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-----------|--------|
| 1 | [Dažnos problemos](common-issues.md) | Dažnai susiduriamos problemos | 30 min |
| 2 | [Derinimo vadovas](debugging.md) | Žingsnis po žingsnio derinimo strategijos | 45 min |
| 3 | [Dirbtinio intelekto trikčių šalinimas](ai-troubleshooting.md) | DI specifinės problemos | 30 min |

---

## 🚨 Greitos pataisos

### Autentifikacijos problemos
```bash
# Reikalinga AZD darbo eigoms
azd auth login

# Pasirenkama, jei taip pat tiesiogiai naudojate Azure CLI komandas
az login

azd auth status
```

### Diegimo klaidos
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

## 📋 Klaidos kodų žinynas

| Klaida | Priežastis | Sprendimas |
|--------|------------|------------|
| `AuthenticationError` | Nepavyko prisijungti | `azd auth login` |
| `ResourceNotFound` | Ištekliai nerasti | Patikrinkite išteklių pavadinimus |
| `QuotaExceeded` | Prenumeratos limitai viršyti | Prašykite kvotos padidinimo |
| `InvalidTemplate` | Bicep sintaksės klaida | `az bicep build` |
| `Conflict` | Išteklius jau egzistuoja | Naudokite kitą pavadinimą arba ištrinkite |
| `Forbidden` | Nepakankami leidimai | Patikrinkite RBAC roles |

---

## 🔄 Atstatymas ir atkūrimas

```bash
# Minkštas perkrovimas (išlaikyti resursus, iš naujo paskelbti kodą)
azd deploy --force

# Kietas perkrovimas (ištrinti viską, pradėti nuo pradžių)
azd down --force --purge
azd up
```

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|---------|---------|
| **Ankstesnis** | [6 skyrius: Prieš diegiant](../chapter-06-pre-deployment/README.md) |
| **Kitas** | [8 skyrius: Gamyba](../chapter-08-production/README.md) |

---

## 📖 Susiję ištekliai

- [Priešdiegimo patikros](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigūracijos vadovas](../chapter-03-configuration/configuration.md)
- [AZD GitHub problemos](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Pradinė dokumento versija gimtąja kalba turėtų būti laikoma autoritetingu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už jokius nesusipratimus ar klaidingus interpretavimus, kylančius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
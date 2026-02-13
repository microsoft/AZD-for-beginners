# 7 skyrius: Trikčių šalinimas ir derinimas

**📚 Kursas**: [AZD For Beginners](../../README.md) | **⏱️ Trukmė**: 1–1,5 val. | **⭐ Sudėtingumas**: Vidutinio sudėtingumo

---

## Apžvalga

Šis skyrius padeda diagnozuoti ir išspręsti dažniausiai pasitaikančias problemas dirbant su Azure Developer CLI. Nuo diegimo klaidų iki DI specifinių problemų.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Diagnostiksite dažniausiai pasitaikančias AZD diegimo klaidas
- Derinsite autentifikacijos ir leidimų problemas
- Išspręsite DI paslaugų prijungimo problemas
- Naudosite Azure portalą ir CLI trikčių šalinimui

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Trukmė |
|---|--------|-------------|------|
| 1 | [Dažnos problemos](common-issues.md) | Dažnai sutinkamos problemos | 30 min |
| 2 | [Derinimo vadovas](debugging.md) | Žingsnis po žingsnio derinimo strategijos | 45 min |
| 3 | [DI trikčių šalinimas](ai-troubleshooting.md) | DI specifinės problemos | 30 min |

---

## 🚨 Greiti sprendimai

### Autentifikacijos problemos
```bash
azd auth login
az login
azd auth whoami
```

### Teikimo klaidos
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
|-------|-------|----------|
| `AuthenticationError` | Neprisijungta | `azd auth login` |
| `ResourceNotFound` | Resursas nerastas | Patikrinkite resursų pavadinimus |
| `QuotaExceeded` | Prenumeratos limitai | Prašyti kvotos padidinimo |
| `InvalidTemplate` | Bicep sintaksės klaida | `az bicep build` |
| `Conflict` | Resursas jau egzistuoja | Naudokite naują pavadinimą arba ištrinkite |
| `Forbidden` | Nepakankamos teisės | Patikrinkite RBAC vaidmenis |

---

## 🔄 Atstatymas ir atkūrimas

```bash
# Minkštas atstatymas (išlaikyti išteklius, iš naujo diegti kodą)
azd deploy --force

# Pilnas atstatymas (ištrinti viską, pradėti nuo nulio)
azd down --force --purge
azd up
```

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|-----------|---------|
| **Ankstesnis** | [6 skyrius: Prieš diegimą](../chapter-06-pre-deployment/README.md) |
| **Kitas** | [8 skyrius: Produkcinė aplinka](../chapter-08-production/README.md) |

---

## 📖 Susiję ištekliai

- [Patikros prieš diegimą](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigūracijos vadovas](../chapter-03-configuration/configuration.md)
- [AZD GitHub problemos](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl kritinės informacijos rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kylančius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
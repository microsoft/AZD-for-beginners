# 7 skyrius: Trikčių šalinimas ir derinimas

**📚 Kursas**: [AZD Pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 1–1,5 valandos | **⭐ Sudėtingumas**: Vidutinis

---

## Apžvalga

Šis skyrius padeda diagnozuoti ir spręsti dažnas problemas, dirbant su Azure Developer CLI. Nuo diegimo klaidų iki dirbtinio intelekto specifinių problemų.

> Komandų gairės patikrintos pagal išleistą `azd 1.37.2` referenciją. Debesų diegimo nepaleisti. Prieš naudojant komandas, pakeiskite pavyzdinius išteklių pavadinimus ir ID.

## Mokymosi tikslai

Užbaigus šį skyrių, Jūs:
- Diagnozuosite dažnas AZD diegimo klaidas
- Derinsite autentifikacijos ir leidimų problemas
- Išspręsite AI paslaugų ryšio problemas
- Naudosite Azure Portal ir CLI trikčių šalinimui

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-------------|------|
| 1 | [Dažnos problemos](common-issues.md) | Dažnai pasitaikančios problemos | 30 min |
| 2 | [Derinimo vadovas](debugging.md) | Žingsnis po žingsnio derinimo strategijos | 45 min |
| 3 | [AI trikčių šalinimas](ai-troubleshooting.md) | AI specifinės problemos | 30 min |

---

## 🚨 Greiti sprendimai

### Autentifikacijos problemos
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Diegimo klaidos
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Išteklių konfliktai
Pirmiausia patikrinkite esamą išteklių ir diegimo klaidų būseną. Nešalinkite dalijamo ar gamybos aplinkos, kad išspręstumėte pavadinimų konfliktą. Naujam **vienkartiniam aplinkui** naudokite unikalų pavadinimą:

```bash
azd env new different-name
azd up
```

### Kvotos viršijimas
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Keisti `AZURE_LOCATION` nerekomenduojama, nes tai nepersiūlo esamų išteklių ir gali sukelti vietos konfliktų diegiant iš naujo.

---

## 📋 Klaidos kodų žinynas

| Klaida | Priežastis | Sprendimas |
|-------|-----------|-----------|
| `AuthenticationError` | Nepasirinktas prisijungimas | `azd auth login` |
| `ResourceNotFound` | Išteklis nerastas | Patikrinkite išteklių pavadinimus |
| `QuotaExceeded` | Prenumeratos ribos | Prašykite kvotos padidinimo |
| `InvalidTemplate` | Bicep sintaksės klaida | `az bicep build` |
| `Conflict` | Išteklis jau yra | Naudokite naują pavadinimą arba pašalinkite |
| `Forbidden` | Nepakankamos teisės | Patikrinkite RBAC vaidmenis |

---

## 🔄 Atstatymas ir atkūrimas

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Griežtas atstatymas ištrina duomenis ir gali pakeisti galinius taškus. Pirmiausia kurkite atsarginę kopiją ir peržiūrėkite interaktyvius ištrynimo pranešimus. `--force --purge` tinka tik vienkartinėms aplinkoms, kai numatytas negrįžtamas ištrynimas.

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|---------|---------|
| **Ankstesnis** | [6 skyrius: Prieš diegiant](../chapter-06-pre-deployment/README.md) |
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
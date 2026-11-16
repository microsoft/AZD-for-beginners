# 3 skyrius: Konfigūracija ir autentifikacija

**📚 Kursas**: [AZD pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 90-150 minučių įskaitant integracijos praktiką | **⭐ Sudėtingumas**: Vidutinis

---

## Apžvalga

Šiame skyriuje aptariama aplinkos konfigūracija, autentifikacijos modeliai ir geriausios saugumo praktikos Azure Developer CLI diegimams.

> Komandų ir konfigūracijos peržiūros tikslas: `azd 1.37.2` (2026 m. lapkritis). Veikianti Azure tiekimo sistema peržiūros metu nebuvo paleista.

## Mokymosi tikslai

Užbaigę šį skyrių jūs:
- Įvaldysite AZD konfigūracijos hierarchiją
- Valdysite kelias aplinkas (dev, staging, prod)
- Įgyvendinsite saugią autentifikaciją su valdomais identitetais
- Sukonfigūruosite aplinkai specifinius nustatymus

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Trukmė |
|---|--------|-------------|------|
| 1 | [Konfigūracijos vadovas](configuration.md) | Aplinkos nustatymas ir valdymas | 30 min |
| 2 | [Autentifikacija ir saugumas](authsecurity.md) | Valdomo identiteto ir RBAC modeliai | 30 min |

---

## 🚀 Greitas pradžia

Vykdykite iš **jau inicializuotos azd programos** šaknies, o ne iš kurso saugyklos. Jei tokios aplinkos jau egzistuoja, naudokite nenaudojamus aplinkų pavadinimus.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` yra iliustracinis: jis daro įtaką infrastruktūrai tik tuomet, kai jūsų šablonas jį tiesiogiai naudoja. Paprasti `azd env set` reikšmės saugomos lokaliai paprastu tekstu; jos nėra saugi slapta saugykla.

---

## 🔧 Konfigūracijos hierarchija

Palaikykite tris skirtingas konfigūracijos sritis atskirtas: globalius nustatymus (`azd config`), projekto struktūrą (`azure.yaml`) ir aplinkos reikšmes (`azd env`). Flagai perrašo tik tuos nustatymus, kuriuos jie palaiko; nėra universalaus atsitiktinių aplinkos kintamųjų persidengimo `azure.yaml` ar Bicep.

---

## 🔐 Geriausios saugumo praktikos

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|-----------|---------|
| **Ankstesnis** | [2 skyrius: DI vystymas](../chapter-02-ai-development/README.md) |
| **Kitas** | [4 skyrius: Infrastruktūra](../chapter-04-infrastructure/README.md) |

---

## 📖 Susiję ištekliai

- [Patikrinimai prieš diegimą](../chapter-06-pre-deployment/README.md)
- [Klaidų šalinimas](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
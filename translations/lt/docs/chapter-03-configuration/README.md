# 3 skyrius: Konfigūracija ir autentifikavimas

**📚 Kursas**: [AZD Pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 45-60 minučių | **⭐ Sudėtingumas**: Vidutinis

---

## Apžvalga

Šiame skyriuje aptariama aplinkos konfigūracija, autentifikavimo modeliai ir saugumo gerosios praktikos Azure Developer CLI diegimams.

> Patikrinta su `azd 1.25.6` 2026 m. birželį.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Įvaldysite AZD konfigūracijos hierarchiją
- Valdysite kelias aplinkas (dev, staging, prod)
- Įgyvendinsite saugų autentifikavimą naudojant valdomas tapatybes
- Konfigūruosite aplinkai būdingus parametrus

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-------------|------|
| 1 | [Konfigūracijos vadovas](configuration.md) | Aplinkos nustatymas ir valdymas | 30 min |
| 2 | [Autentifikavimas ir saugumas](authsecurity.md) | Valdomos tapatybės ir RBAC modeliai | 30 min |

---

## 🚀 Greitas startas

```bash
# Sukurti kelias aplinkas
azd env new dev
azd env new staging
azd env new prod

# Perjungti aplinkas
azd env select prod

# Nustatyti aplinkos kintamuosius
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Peržiūrėti konfigūraciją
azd env get-values
```

---

## 🔧 Konfigūracijos hierarchija

AZD taiko nustatymus šia tvarka (vėlesni perrašo ankstesnius):

1. **Numatytosios reikšmės** (įtrauktos į šablonus)
2. **azure.yaml** (projekto konfigūracija)
3. **Aplinkos kintamieji** (`azd env set`)
4. **Komandinės eilutės parametrai** (`--location eastus`)

---

## 🔐 Saugumo gerosios praktikos

```bash
# Naudokite valdomąją tapatybę (rekomenduojama)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Patikrinkite AZD autentifikacijos būseną
azd auth status

# Pasirinktinai: patikrinkite Azure CLI kontekstą, jei planuojate vykdyti az komandas
az account show

# Iš naujo autentifikuokitės prireikus
azd auth login

# Pasirinktinai: atnaujinkite Azure CLI autentifikaciją az komandoms
az login
```

---

## 🔗 Naršymas

| Kryptis | Skyrius |
|-----------|---------|
| **Ankstesnis** | [Chapter 2: AI Development](../chapter-02-ai-development/README.md) |
| **Kitas** | [4 skyrius: Infrastruktūra](../chapter-04-infrastructure/README.md) |

---

## 📖 Susiję ištekliai

- [Patikrinimai prieš diegimą](../chapter-06-pre-deployment/README.md)
- [Trikčių šalinimas](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
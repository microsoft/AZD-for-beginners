# 3 skyrius: Konfigūracija ir autentifikacija

**📚 Kursas**: [AZD pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 45–60 minučių | **⭐ Sudėtingumas**: Vidutinis

---

## Apžvalga

Šiame skyriuje aptariama aplinkos konfigūracija, autentifikacijos modeliai ir saugumo geriausios praktikos Azure Developer CLI diegimams.

> Patikrinta naudojant `azd 1.23.12` 2026 m. kovo mėn.

## Mokymosi tikslai

Įveikę šį skyrių, jūs:
- Išmanysite AZD konfigūracijos hierarchiją
- Tvarkysite kelias aplinkas (dev, staging, prod)
- Įgyvendinsite saugią autentifikaciją naudojant valdomąsias tapatybes
- Konfigūruosite aplinkai būdingus nustatymus

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-----------|--------|
| 1 | [Konfigūracijos vadovas](configuration.md) | Aplinkos nustatymas ir valdymas | 30 min |
| 2 | [Autentifikacija ir saugumas](authsecurity.md) | Valdomosios tapatybės ir RBAC modeliai | 30 min |

---

## 🚀 Greitas pradėjimas

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

AZD taiko nustatymus šia tvarka (vėlesni užrašo ankstesnius):

1. **Numatytosios reikšmės** (įmontuotos šablonuose)
2. **azure.yaml** (projekto konfigūracija)
3. **Aplinkos kintamieji** (`azd env set`)
4. **Komandinės eilutės parametrai** (`--location eastus`)

---

## 🔐 Saugumo geriausios praktikos

```bash
# Naudokite valdytą identitetą (rekomenduojama)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Patikrinkite AZD autentifikavimo būseną
azd auth status

# Pasirinktinai: patikrinkite Azure CLI kontekstą, jei planuojate vykdyti az komandas
az account show

# Jei reikia, vykdykite pakartotinį autentifikavimą
azd auth login

# Pasirinktinai: atnaujinkite Azure CLI autentifikavimą az komandoms
az login
```

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|---------|---------|
| **Ankstesnis** | [2 skyrius: DI vystymas](../chapter-02-ai-development/README.md) |
| **Kitas** | [4 skyrius: Infrastruktūra](../chapter-04-infrastructure/README.md) |

---

## 📖 Susiję ištekliai

- [Prieš diegimą patikrinimai](../chapter-06-pre-deployment/README.md)
- [Trikčių šalinimas](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritiniais atvejais rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už galimus nesusipratimus ar klaidingą interpretaciją, kylančią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
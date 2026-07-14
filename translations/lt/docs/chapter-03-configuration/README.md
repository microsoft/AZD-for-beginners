# 3 skyrius: Konfigūravimas ir autentifikacija

**📚 Kursas**: [AZD Pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 45-60 minučių | **⭐ Sudėtingumas**: Vidutinis

---

## Apžvalga

Šiame skyriuje aptariamas aplinkos konfigūravimas, autentifikacijos modeliai ir saugumo geriausios praktikos Azure Developer CLI diegimams.

> Patikrinta su `azd 1.27.1` 2026 m. liepos mėn.

## Mokymosi tikslai

Baigę šį skyrių jūs:
- Gebėsite valdyti AZD konfigūracijos hierarchiją
- Valdyti kelias aplinkas (dev, staging, prod)
- Įgyvendinti saugią autentifikaciją naudojant valdomas tapatybes
- Konfigūruoti aplinkai specifinius nustatymus

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Trukmė |
|---|--------|-------------|------|
| 1 | [Konfigūravimo vadovas](configuration.md) | Aplinkos nustatymas ir valdymas | 30 min |
| 2 | [Autentifikacija ir saugumas](authsecurity.md) | Valdomos tapatybės ir RBAC modeliai | 30 min |

---

## 🚀 Greitas paleidimas

```bash
# Kurti kelias aplinkas
azd env new dev
azd env new staging
azd env new prod

# Pereiti tarp aplinkų
azd env select prod

# Nustatyti aplinkos kintamuosius
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Peržiūrėti konfigūraciją
azd env get-values
```

---

## 🔧 Konfigūracijos hierarchija

AZD taiko nustatymus šia tvarka (vėlesni pakeitimai nustato ankstesnius):

1. **Numatytosios reikšmės** (įmontuotos šablonuose)
2. **azure.yaml** (projekto konfigūracija)
3. **Aplinkos kintamieji** (`azd env set`)
4. **Komandų eilutės parametrai** (`--location eastus`)

---

## 🔐 Saugumo geriausios praktikos

```bash
# Naudokite valdomą tapatybę (rekomenduojama)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Patikrinkite AZD autentifikacijos būseną
azd auth status

# Pasirinktinai: patikrinkite Azure CLI kontekstą, jei planuojate vykdyti az komandas
az account show

# Autentifikuokitės iš naujo, jei reikia
azd auth login

# Pasirinktinai: atnaujinkite Azure CLI autentifikaciją az komandoms
az login
```

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|-----------|---------|
| **Ankstesnis** | [2 skyrius: DI kūrimas](../chapter-02-ai-development/README.md) |
| **Kitas** | [4 skyrius: Infrastruktūra](../chapter-04-infrastructure/README.md) |

---

## 📖 Susiję ištekliai

- [Patikros prieš diegimą](../chapter-06-pre-deployment/README.md)
- [Gedimų šalinimas](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Skyrius 3: Konfigūracija ir autentifikavimas

**📚 Kursas**: [AZD Pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 45-60 minutes | **⭐ Sudėtingumas**: Vidutinio lygio

---

## Apžvalga

This chapter covers environment configuration, authentication patterns, and security best practices for Azure Developer CLI deployments.

## Mokymosi tikslai

By completing this chapter, you will:
- Master the AZD configuration hierarchy
- Manage multiple environments (dev, staging, prod)
- Implement secure authentication with managed identities
- Configure environment-specific settings

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Trukmė |
|---|--------|-----------|--------|
| 1 | [Konfigūracijos vadovas](configuration.md) | Aplinkos nustatymas ir valdymas | 30 min |
| 2 | [Autentifikavimas ir saugumas](authsecurity.md) | Valdomosios tapatybės ir RBAC šablonai | 30 min |

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

1. **Numatytosios reikšmės** (built into templates)
2. **azure.yaml** (projekto konfigūracija)
3. **Aplinkos kintamieji** (`azd env set`)
4. **Komandinės eilutės parametrai** (`--location eastus`)

---

## 🔐 Geriausios saugumo praktikos

```bash
# Naudokite valdomąją tapatybę (rekomenduojama)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Patikrinkite autentifikacijos būseną
azd auth whoami
az account show

# Prireikus, autentifikuokitės iš naujo
azd auth login
az login
```

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|---------|---------|
| **Ankstesnis** | [Skyrius 2: Dirbtinio intelekto kūrimas](../chapter-02-ai-development/README.md) |
| **Kitas** | [Skyrius 4: Infrastruktūra](../chapter-04-infrastructure/README.md) |

---

## 📖 Susiję ištekliai

- [Patikrinimai prieš diegimą](../chapter-06-pre-deployment/README.md)
- [Trikčių šalinimas](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas originalioje kalboje turėtų būti laikomas autoritetingu šaltiniu. Svarbios informacijos atveju rekomenduojamas profesionalus, žmogaus atliktas vertimas. Mes neatsakome už jokius dėl šio vertimo naudojimo kilusius nesusipratimus ar neteisingas interpretacijas.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
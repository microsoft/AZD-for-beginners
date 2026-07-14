# 1 skyrius: Pagrindai ir Greitas pradėjimas

**📚 Kursas**: [AZD pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 30-45 minutės | **⭐ Sudėtingumas**: Pradedantysis

---

## Apžvalga

Šiame skyriuje pristatomi Azure Developer CLI (azd) pagrindai. Išmoksite pagrindines sąvokas, įdiegsite įrankius ir paskelbsite savo pirmąją programą Azure.

> Patikrinta su `azd 1.27.1` 2026 metų liepos mėn.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Suprasite, kas yra Azure Developer CLI ir kuo jis skiriasi nuo Azure CLI
- Įdiegs ir sukonfigūruos AZD savo platformoje
- Paskelbs savo pirmąją programą Azure naudodami `azd up`
- Išvalys resursus naudodami `azd down`

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-------------|------|
| 1 | [AZD pagrindai](azd-basics.md) | Pagrindinės sąvokos, terminologija ir projekto struktūra | 15 min |
| 2 | [Diegimas ir sąranka](installation.md) | Platformos specifinės diegimo instrukcijos | 10 min |
| 3 | [Jūsų pirmasis projektas](first-project.md) | Praktinė dalis: internetinės programos paskelbimas Azure | 20 min |
| 4 | [Pridėkite savo programą](bring-your-own-app.md) | Pridėti azd prie jau turimo projekto | 15 min |
| 5 | [Kūrimo konteineriai ir Codespaces](dev-containers.md) | Reprodukcinės azd aplinkos su kūrimo konteineriais | 15 min |

---

## ✅ Pradėkite čia: patikrinkite savo sąranką

Prieš pradėdami, įsitikinkite, kad jūsų vietinis kompiuteris paruoštas 1 skyriaus šablonui:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jei scenarijus praneša apie trūkstamus įrankius, pirmiausia juos įdiekite, tada tęskite skyrių.

---

## 🚀 Greitas pradėjimas

```bash
# Patikrinti diegimą
azd version

# Autentifikuotis AZD
# Pasirinktinai: az login, jei ketinate tiesiogiai vykdyti Azure CLI komandas
azd auth login

# Diegti pirmą programėlę
azd init --template todo-nodejs-mongo
azd up

# Sutvarkyti po darbo
azd down --force --purge
```

---

## ✅ Sėkmės kriterijai

Baigę šį skyrių, turėtumėte sugebėti:

```bash
azd version              # Rodo įdiegtą versiją
azd init --template todo-nodejs-mongo  # Inicializuoja projektą
azd up                   # Diegia į Azure
azd show                 # Rodo veikiančios programos URL
azd down --force --purge # Išvalo resursus
```

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|-----------|---------|
| **Toliau** | [2 skyrius: DI pirmasis vystymas](../chapter-02-ai-development/README.md) |
| **Praleisti į** | [3 skyrius: Konfigūracija](../chapter-03-configuration/README.md) |

---

## 📖 Susiję ištekliai

- [Komandų atmintinė](../../resources/cheat-sheet.md)
- [DUK](../../resources/faq.md)
- [Žodynėlis](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
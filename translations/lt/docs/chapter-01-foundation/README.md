# 1 skyrius: Pagrindai & Greita pradžia

**📚 Kursas**: [AZD pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 30-45 minučių | **⭐ Sunkumo lygis**: Pradedantiesiems

---

## Apžvalga

Šiame skyriuje pristatomi Azure Developer CLI (azd) pagrindai. Išmoksite pagrindinių sąvokų, kaip įdiegti įrankius ir paskelbti savo pirmąją programą į Azure.

> Patikrinta su `azd 1.25.6` 2026 m. birželį.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Suprasite, kas yra Azure Developer CLI ir kuo jis skiriasi nuo Azure CLI
- Įdiegsite ir sukonfigūruosite AZD savo platformoje
- Diegsite savo pirmąją programą į Azure su `azd up`
- Išvalysite išteklius su `azd down`

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Trukmė |
|---|--------|-------------|------|
| 1 | [AZD pagrindai](azd-basics.md) | Pagrindinės sąvokos, terminologija ir projekto struktūra | 15 min |
| 2 | [Įdiegimas ir sąranka](installation.md) | Platformai specifinės diegimo instrukcijos | 10 min |
| 3 | [Jūsų pirmasis projektas](first-project.md) | Praktika: Diegti žiniatinklio programą į Azure | 20 min |
| 4 | [Pridėkite savo programą](bring-your-own-app.md) | Pridėti azd prie jau turimo projekto | 15 min |
| 5 | [Plėtros konteineriai & Codespaces](dev-containers.md) | Atkartojamos azd aplinkos su plėtros konteineriais | 15 min |

---

## ✅ Pradėkite čia: Patikrinkite savo aplinką

Prieš pradėdami, įsitikinkite, kad jūsų vietinis kompiuteris paruoštas 1 skyriaus šablonui:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jei skriptas praneša apie trūkstamas priemones, pirmiausia jas įdiekite, o tada tęskite skyrių.

---

## 🚀 Greita pradžia

```bash
# Patikrinkite diegimą
azd version

# Prisijunkite prie AZD
# Pasirinktinai: az login, jei planuojate tiesiogiai vykdyti Azure CLI komandas
azd auth login

# Įdiekite savo pirmąją programą
azd init --template todo-nodejs-mongo
azd up

# Išvalykite, kai baigsite
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
azd down --force --purge # Išvalo išteklius
```

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|-----------|---------|
| **Toliau** | [2 skyrius: DI orientuotas kūrimas](../chapter-02-ai-development/README.md) |
| **Pereiti į** | [3 skyrius: Konfigūracija](../chapter-03-configuration/README.md) |

---

## 📖 Susiję ištekliai

- [Komandų atmintinė](../../resources/cheat-sheet.md)
- [DUK](../../resources/faq.md)
- [Terminų žodynas](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
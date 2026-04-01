# 1 skyrius: Pagrindai ir Greitas pradžios vadovas

**📚 Kursas**: [AZD Pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 30-45 minutės | **⭐ Sudėtingumas**: Pradedantysis

---

## Apžvalga

Šiame skyriuje supažindinsime su Azure Developer CLI (azd) pagrindais. Išmoksite esminius konceptus, įdiegsite įrankius ir paleisite pirmąją programą Azure.

> Patikrinta su `azd 1.23.12` 2026 m. kovą.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Suprasite, kas yra Azure Developer CLI ir kuo jis skiriasi nuo Azure CLI
- Įdiegsite ir sukonfigūruosite AZD savo platformoje
- Paleisite pirmąją programą Azure naudodami `azd up`
- Išvalysite resursus su `azd down`

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-----------|--------|
| 1 | [AZD pagrindai](azd-basics.md) | Esminiai konceptai, terminologija ir projekto struktūra | 15 min |
| 2 | [Įdiegimas ir Konfigūracija](installation.md) | Platformai pritaikyti įdiegimo vadovai | 10 min |
| 3 | [Jūsų pirmasis projektas](first-project.md) | Praktinė dalis: internetinės programos diegimas Azure | 20 min |

---

## ✅ Pradėkite čia: Patvirtinkite savo aplinką

Prieš pradedant, įsitikinkite, kad jūsų vietinė mašina paruošta 1 skyriaus šablonui:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jei scenarijus nurodo trūkstamus įrankius, pirmiausia juos įdiekite ir tik tada tęskite skyrių.

---

## 🚀 Greitas pradžios vadovas

```bash
# Patikrinkite diegimą
azd version

# Autentifikuokite AZD
# Pasirinktinai: az login, jei planuojate tiesiogiai vykdyti Azure CLI komandas
azd auth login

# Diegti savo pirmąją programą
azd init --template todo-nodejs-mongo
azd up

# Išvalykite po atlikimo
azd down --force --purge
```

---

## ✅ Sėkmės kriterijai

Baigę šį skyrių, turėsite gebėti:

```bash
azd version              # Rodo įdiegtą versiją
azd init --template todo-nodejs-mongo  # Inicializuoja projektą
azd up                   # Įdiegia į Azure
azd show                 # Rodo veikiančios programos URL
azd down --force --purge # Išvalo resursus
```

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|---------|---------|
| **Toliau** | [2 skyrius: AI-pirmoji plėtra](../chapter-02-ai-development/README.md) |
| **Praleisti į** | [3 skyrius: Konfigūracija](../chapter-03-configuration/README.md) |

---

## 📖 Susiję ištekliai

- [Komandų atmintinė](../../resources/cheat-sheet.md)
- [DUK](../../resources/faq.md)
- [Žodynas](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas gimtąja kalba turi būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus žmonių vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingus interpretavimus, kylancius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
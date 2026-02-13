# 1 skyrius: Pagrindai ir greitas pradėjimas

**📚 Kursas**: [AZD For Beginners](../../README.md) | **⏱️ Trukmė**: 30-45 minutes | **⭐ Sudėtingumas**: Pradedantysis

---

## Apžvalga

Šis skyrius supažindina su Azure Developer CLI (azd) pagrindais. Išmoksite pagrindines sąvokas, įdiegti įrankius ir diegti pirmąją savo programą į Azure.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Suprasite, kas yra Azure Developer CLI ir kuo jis skiriasi nuo Azure CLI
- Įdiegsite ir sukonfigūruosite AZD savo platformoje
- Paskelbsite savo pirmąją programą į Azure naudodami `azd up`
- Išvalysite išteklius naudodami `azd down`

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-------------|------|
| 1 | [AZD pagrindai](azd-basics.md) | Pagrindinės sąvokos, terminologija ir projekto struktūra | 15 min |
| 2 | [Įdiegimas ir sąranka](installation.md) | Platformos specifiniai diegimo vadovai | 10 min |
| 3 | [Jūsų pirmasis projektas](first-project.md) | Praktinė užduotis: Diegti žiniatinklio programą į Azure | 20 min |

---

## 🚀 Greitas pradėjimas

```bash
# Patikrinkite diegimą
azd version

# Prisijunkite prie Azure
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
| **Next** | [2 skyrius: DI orientuotas vystymas](../chapter-02-ai-development/README.md) |
| **Skip to** | [3 skyrius: Konfigūracija](../chapter-03-configuration/README.md) |

---

## 📖 Susiję ištekliai

- [Komandų atmintinė](../../resources/cheat-sheet.md)
- [DUK](../../resources/faq.md)
- [Terminų žodynėlis](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Svarbios informacijos atveju rekomenduojama kreiptis į profesionalų vertėją. Mes neatsakome už jokius nesusipratimus ar klaidingus aiškinimus, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
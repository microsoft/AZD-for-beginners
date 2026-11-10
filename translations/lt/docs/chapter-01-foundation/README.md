# 1 skyrius: Pagrindai ir Greitas Pradžia

**📚 Kursas**: [AZD Pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 75–120 minučių, įskaitant pirmąjį diegimą; papildomos užduotys gali užtrukti ilgiau | **⭐ Sudėtingumas**: Pradedančiųjų

---

## Apžvalga

Šiame skyriuje bus pristatyti Azure Developer CLI (azd) pagrindai. Išmoksite pagrindines sąvokas, įdiegsite įrankius ir diegsite pirmąją programą Azure platformoje.

> Komandų ir konfigūracijos peržiūros tikslas: `azd 1.37.2` (2026 m. lapkritis). Gyvas Azure teikimas peržiūros metu nebuvo vykdomas.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Suprasite, kas yra Azure Developer CLI ir kuo jis skiriasi nuo Azure CLI
- Įdiegs ir sukonfigūruos AZD jūsų platformoje
- Išleisite pirmąją programą į Azure su `azd up`
- Pašalinsite resursus su `azd down`

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Trukmė |
|---|--------|-------------|------|
| 1 | [AZD Pagrindai](azd-basics.md) | Pagrindinės sąvokos, terminologija ir projekto struktūra | 15 min |
| 2 | [Įdiegimas ir Paruošimas](installation.md) | Platformos specifinės įdiegimo instrukcijos | 10 min |
| 3 | [Jūsų Pirmasis Projektas](first-project.md) | Praktinė užduotis: išleiskite interneto programą į Azure | 20 min |
| 4 | [Pridėkite Savo Programą](bring-your-own-app.md) | Pridėkite azd prie jau turimo projekto | 15 min |
| 5 | [Kūrimo Konteineriai ir Codespaces](dev-containers.md) | Atkuriamos azd aplinkos su kūrimo konteineriais | 15 min |

---

## ✅ Pradėkite čia: Patikrinkite savo aplinką

Prieš pradėdami, įsitikinkite, kad jūsų vietinis kompiuteris yra paruoštas 1 skyriui:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jei scenarijus nurodo trūkstamus įrankius, pirmiausia juos įdiekite, tada tęskite skyrių.

---

## 🚀 Greitas Pradžia

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Sėkmės kriterijai

Baigę šį skyrių, turėsite gebėti:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|-----------|---------|
| **Kitas** | [2 skyrius: AI pirmoji plėtra](../chapter-02-ai-development/README.md) |
| **Praleisti iki** | [3 skyrius: Konfigūracija](../chapter-03-configuration/README.md) |

---

## 📖 Susiję ištekliai

- [Komandų kortelė](../../resources/cheat-sheet.md)
- [DUK](../../resources/faq.md)
- [Terminų žodynas](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
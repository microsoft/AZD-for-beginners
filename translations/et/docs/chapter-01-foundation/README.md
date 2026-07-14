# 1. peatükk: Alused ja kiire algus

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 30–45 minutit | **⭐ Tase**: Algaja

---

## Ülevaade

Selles peatükis tutvustatakse Azure Developer CLI (azd) põhialuseid. Õpid põhimõisted, installeerid tööriistad ja juurutad oma esimese rakenduse Azure'i.

> Kinnitatud `azd 1.27.1` vastu juulis 2026.

## Õpieesmärgid

Selle peatüki lõpuks:
- Mõistad, mis on Azure Developer CLI ja kuidas see erineb Azure CLI-st
- Installeerid ja seadistad AZD oma platvormil
- Juurutad oma esimese rakenduse Azure'i käsuga `azd up`
- Puhastad ressursid käsuga `azd down`

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [AZD põhitõed](azd-basics.md) | Põhimõisted, terminoloogia ja projekti struktuur | 15 min |
| 2 | [Installeerimine ja seadistamine](installation.md) | Platvormispetsiifilised juhised | 10 min |
| 3 | [Sinu esimene projekt](first-project.md) | Praktiline juhend: juuruta veebirakendus Azure'i | 20 min |
| 4 | [Lisa oma rakendus](bring-your-own-app.md) | Lisa azd juba olemasolevale projektile | 15 min |
| 5 | [Arenduskonteinerid ja Codespaces](dev-containers.md) | Taastoodavad azd keskkonnad arenduskonteineritega | 15 min |

---

## ✅ Alusta siit: Kontrolli oma seadistust

Enne alustamist veendu, et sinu kohalik masin oleks valmis 1. peatüki malliga töötamiseks:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Kui skript teatab puuduvatest tööriistadest, lahenda need esmalt ja seejärel jätka peatükiga.

---

## 🚀 Kiire algus

```bash
# Kontrolli paigaldust
azd version

# Autendi AZD jaoks
# Valikuline: kasuta az login, kui plaanid otse Azure CLI käske käivitada
azd auth login

# Kasuta oma esimest rakendust
azd init --template todo-nodejs-mongo
azd up

# Puhasta pärast lõpetamist
azd down --force --purge
```

---

## ✅ Edu kriteeriumid

Pärast selle peatüki lõpetamist peaksid olema suuteline:

```bash
azd version              # Kuvab paigaldatud versiooni
azd init --template todo-nodejs-mongo  # Algatab projekti
azd up                   # Paigaldab Azure'i
azd show                 # Kuvab jooksva rakenduse URL-i
azd down --force --purge # Puhastab ressursid
```

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-------|---------|
| **Järgmine** | [2. peatükk: AI-esimene arendus](../chapter-02-ai-development/README.md) |
| **Mine edasi** | [3. peatükk: Konfiguratsioon](../chapter-03-configuration/README.md) |

---

## 📖 Seotud ressursid

- [Käskude abileht](../../resources/cheat-sheet.md)
- [KKK](../../resources/faq.md)
- [Terminite sõnastik](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
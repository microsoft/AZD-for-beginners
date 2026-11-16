# 1. peatükk: Alus ja kiire algus

**📚 Kursus**: [AZD Algajatele](../../README.md) | **⏱️ Kestus**: 75-120 minutit, esimese juurutamisega; lisaülesanded võtavad kauem aega | **⭐ keerukus**: Algaja

---

## Ülevaade

See peatükk tutvustab Azure Developer CLI (azd) põhialuseid. Õpid põhimõisteid, installeerid tööriistad ja juurutad oma esimese rakenduse Azure'i.

> Käskude ja konfiguratsiooni ülevaate siht: `azd 1.37.2` (november 2026). Ülevaate ajal otse Azure'i juurutamist ei tehtud.

## Õpieesmärgid

Selle peatüki läbimisel sa:
- Mõistad, mis on Azure Developer CLI ja kuidas see erineb Azure CLI-st
- Installeerid ja seadistad AZD oma platvormil
- Juurutad oma esimese rakenduse Azure'i kasutades `azd up`
- Puhastad ressursid kasutades `azd down`

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [AZD Põhitõed](azd-basics.md) | Põhimõisted, terminoloogia ja projekti struktuur | 15 min |
| 2 | [Installatsioon & Seadistus](installation.md) | Platvormi spetsiifilised installijuhised | 10 min |
| 3 | [Sinu Esimene Projekt](first-project.md) | Praktiline: Veebirakenduse juurutamine Azure'i | 20 min |
| 4 | [Too Oma Oma Rakendus](bring-your-own-app.md) | Lisa azd olemasolevale projektile | 15 min |
| 5 | [Dev Kontainerid ja Codespaces](dev-containers.md) | Reproducible azd keskkonnad dev konteineritega | 15 min |

---

## ✅ Alusta siit: Kontrolli oma seadistust

Enne alustamist veendu, et sinu kohalik arvuti on valmis 1. peatüki malliks:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Kui skript teatab puuduvaid tööriistu, paranda need esmalt ja jätka seejärel peatükiga.

---

## 🚀 Kiire algus

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

## ✅ Edu kriteeriumid

Pärast selle peatüki läbimist peaksid suutma:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigatsioon

| Suund | Peatükk |
|-----------|---------|
| **Järgmine** | [2. peatükk: AI-esimene arendus](../chapter-02-ai-development/README.md) |
| **Jäta vahele** | [3. peatükk: Konfiguratsioon](../chapter-03-configuration/README.md) |

---

## 📖 Seotud ressursid

- [Käsu kiire ülevaade](../../resources/cheat-sheet.md)
- [KKK](../../resources/faq.md)
- [Sõnastik](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
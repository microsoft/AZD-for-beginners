# Chapter 1: Alus ja Kiire Algus

**📚 Kursus**: [AZD Algajatele](../../README.md) | **⏱️ Kestus**: 30-45 minutit | **⭐ Keerukus**: Algaja

---

## Ülevaade

See peatükk tutvustab Azure Developer CLI (azd) põhialuseid. Õpid põhimõisted, tööriistade installi ja esimese rakenduse juurutamist Azure’i.

> Kontrollitud versiooniga `azd 1.25.6` juunis 2026.

## Õpieesmärgid

Selle peatüki läbimisel:
- Sa mõistad, mis on Azure Developer CLI ja kuidas see erineb Azure CLI-st
- Installeerid ja seadistad AZD oma platvormil
- Juurutad oma esimese rakenduse Azure’i käsuga `azd up`
- Kustutad ressursid käsuga `azd down`

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|----------|-----------|-----|
| 1 | [AZD Põhitõed](azd-basics.md) | Põhimõisted, terminoloogia ja projekti struktuur | 15 min |
| 2 | [Paigaldus ja Seadistamine](installation.md) | Platvormipõhised paigaldusjuhised | 10 min |
| 3 | [Sinu Esimene Projekt](first-project.md) | Praktiline: veebiäpi juurutamine Azure’i | 20 min |
| 4 | [Kasuta Oma Rakendust](bring-your-own-app.md) | Lisa azd olemasolevale projektile | 15 min |
| 5 | [Arenduskonteinerid ja Codespaces](dev-containers.md) | Korduvkasutatavad azd keskkonnad arenduskonteineritega | 15 min |

---

## ✅ Alusta siit: Kontrolli Oma Seadistust

Enne alustamist veendu, et sinu kohalik masin on valmis 1. peatüki malliks:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Kui skript teatab puuduvatest tööriistadest, paigalda need esmalt ja jätka siis peatükiga.

---

## 🚀 Kiire Algus

```bash
# Kontrolli paigaldust
azd version

# Autendi AZD jaoks
# Valikuline: az login, kui plaanid käivitada Azure CLI käske otse
azd auth login

# Paigalda oma esimene rakendus
azd init --template todo-nodejs-mongo
azd up

# Puhasta pärast lõpetamist
azd down --force --purge
```

---

## ✅ Edu Kriteeriumid

Pärast selle peatüki lõpetamist peaksid saama:

```bash
azd version              # Kuvab paigaldatud versiooni
azd init --template todo-nodejs-mongo  # Initsialiseerib projekti
azd up                   # Paigaldab Azure'i
azd show                 # Kuvab töötava rakenduse URL-i
azd down --force --purge # Puhastab ressursid
```

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|--------|---------|
| **Järgmine** | [Peatükk 2: AI-esmane arendus](../chapter-02-ai-development/README.md) |
| **Jäta vahele** | [Peatükk 3: Seadistamine](../chapter-03-configuration/README.md) |

---

## 📖 Seotud Ressursid

- [Käsu Kiirjuhend](../../resources/cheat-sheet.md)
- [KKK](../../resources/faq.md)
- [Terminid](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
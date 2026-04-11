# 1. peatükk: Alused ja kiire algus

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 30–45 minutit | **⭐ Tase**: Algaja

---

## Ülevaade

See peatükk tutvustab Azure Developer CLI (azd) põhialuseid. Õpid põhimõisteid, tööriistu installima ja oma esimese rakenduse Azure’i juurutama.

> Kinnitatud `azd 1.23.12` vastu, märts 2026.

## Õpieesmärgid

Selle peatüki lõpetamisel:
- Saad aru, mis on Azure Developer CLI ja kuidas see erineb Azure CLI-st
- Installid ja seadistad AZD oma platvormil
- Juurutad oma esimese rakenduse Azure’i käsuga `azd up`
- Koristad ressursid käsuga `azd down`

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|----------|-----------|-----|
| 1 | [AZD põhialused](azd-basics.md) | Põhimõisted, terminoloogia ja projekti struktuur | 15 min |
| 2 | [Installeerimine ja seadistamine](installation.md) | Platvormispetsiifilised paigaldusjuhised | 10 min |
| 3 | [Sinu esimene projekt](first-project.md) | Praktiline: juuruta veebirakendus Azure’i | 20 min |

---

## ✅ Alusta siit: Kontrolli oma keskkond

Enne alustamist veendu, et sinu arvuti oleks valmis 1. peatüki malliks:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Kui skript teatab puuduvatest tööriistadest, korda need esmalt korda ja jätka seejärel peatükiga.

---

## 🚀 Kiire algus

```bash
# Kontrolli paigaldust
azd version

# Autentimine AZD jaoks
# Valikuline: az login, kui plaanite käivitada Azure CLI käske otse
azd auth login

# Paigalda oma esimene rakendus
azd init --template todo-nodejs-mongo
azd up

# Puhasta peale lõpetamist
azd down --force --purge
```

---

## ✅ Õnnestumise kriteeriumid

Peatüki lõpetamise järel peaksid olema võimeline:

```bash
azd version              # Kuvab installitud versiooni
azd init --template todo-nodejs-mongo  # Algatab projekti
azd up                   # Paigaldab Azure'i
azd show                 # Kuvab töötava rakenduse URL-i
azd down --force --purge # Puhastab ressursid
```

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-------|---------|
| **Järgmine** | [2. peatükk: Esimene AI-põhine arendus](../chapter-02-ai-development/README.md) |
| **Hüppa** | [3. peatükk: Seadistamine](../chapter-03-configuration/README.md) |

---

## 📖 Seotud ressursid

- [Käsurea abileht](../../resources/cheat-sheet.md)
- [KKK](../../resources/faq.md)
- [Terminoloogia](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud tehisintellekti tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame täpsust, tuleb arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tingitud arusaamatuste või valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
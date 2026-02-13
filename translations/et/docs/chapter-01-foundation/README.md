# Peatükk 1: Alused ja kiire algus

**📚 Kursus**: [AZD Algajatele](../../README.md) | **⏱️ Kestus**: 30-45 minutit | **⭐ Raskusaste**: Algaja

---

## Ülevaade

See peatükk tutvustab Azure Developer CLI (azd) aluseid. Sa õpid põhimõisted, installid tööriistad ja juurutad oma esimese rakenduse Azure'i.

## Õpieesmärgid

Selle peatüki läbimise järel sa:
- Mõistad, mis on Azure Developer CLI ja kuidas see erineb Azure CLI-st
- Paigaldad ja seadistad AZD oma platvormil
- Juurutad oma esimese rakenduse Azure'i käsuga `azd up`
- Eemaldad ressursid käsuga `azd down`

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | Põhikonceptsioonid, terminoloogia ja projekti struktuur | 15 min |
| 2 | [Installation & Setup](installation.md) | Platvormispetsiifilised paigaldusjuhised | 10 min |
| 3 | [Your First Project](first-project.md) | Praktiline: Veebirakenduse juurutamine Azure'i | 20 min |

---

## 🚀 Kiire algus

```bash
# Kontrolli installatsiooni
azd version

# Logi sisse Azure'i
azd auth login

# Juuruta oma esimene rakendus
azd init --template todo-nodejs-mongo
azd up

# Puhasta pärast lõpetamist
azd down --force --purge
```

---

## ✅ Õnnestumise kriteeriumid

Pärast selle peatüki läbimist peaksid sa suutma:

```bash
azd version              # Kuvab installitud versiooni
azd init --template todo-nodejs-mongo  # Initsialiseerib projekti
azd up                   # Juurutab Azuresse
azd show                 # Kuvab töötava rakenduse URL-i
azd down --force --purge # Puhastab ressursse
```

---

## 🔗 Navigatsioon

| Direction | Chapter |
|-----------|---------|
| **Next** | [Peatükk 2: AI-põhine arendus](../chapter-02-ai-development/README.md) |
| **Skip to** | [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/README.md) |

---

## 📖 Seotud ressursid

- [Käskude kiirjuhend](../../resources/cheat-sheet.md)
- [KKK](../../resources/faq.md)
- [Sõnastik](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastutusest loobumine:
See dokument on tõlgitud tehisintellekti tõlke­teenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi me püüame täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument oma emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste ega väär­tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
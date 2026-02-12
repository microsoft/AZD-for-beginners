# Poglavlje 1: Osnove & Brzi početak

**📚 Tečaj**: [AZD For Beginners](../../README.md) | **⏱️ Trajanje**: 30-45 minuta | **⭐ Složenost**: Početni

---

## Pregled

Ovo poglavlje uvodi osnove Azure Developer CLI (azd). Naučit ćete osnovne koncepte, instalirati alate i postaviti svoju prvu aplikaciju na Azure.

## Ciljevi učenja

Po završetku ovog poglavlja, moći ćete:
- Razumjeti što je Azure Developer CLI i kako se razlikuje od Azure CLI
- Instalirati i konfigurirati AZD na svojoj platformi
- Postaviti svoju prvu aplikaciju u Azure pomoću `azd up`
- Očistiti resurse pomoću `azd down`

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Osnove AZD](azd-basics.md) | Osnovni koncepti, terminologija i struktura projekta | 15 min |
| 2 | [Instalacija & Postavljanje](installation.md) | Vodiči za instalaciju specifični za platformu | 10 min |
| 3 | [Vaš prvi projekt](first-project.md) | Praktično: Postavite web-aplikaciju na Azure | 20 min |

---

## 🚀 Brzi početak

```bash
# Provjerite instalaciju
azd version

# Prijavite se u Azure
azd auth login

# Postavite svoju prvu aplikaciju
azd init --template todo-nodejs-mongo
azd up

# Očistite kada završite
azd down --force --purge
```

---

## ✅ Kriteriji uspjeha

Nakon završetka ovog poglavlja trebali biste moći:

```bash
azd version              # Prikazuje instaliranu verziju
azd init --template todo-nodejs-mongo  # Inicijalizira projekt
azd up                   # Raspoređuje na Azure
azd show                 # Prikazuje URL pokrenute aplikacije
azd down --force --purge # Čisti resurse
```

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Sljedeće** | [Poglavlje 2: Razvoj usmjeren na AI](../chapter-02-ai-development/README.md) |
| **Preskoči na** | [Poglavlje 3: Konfiguracija](../chapter-03-configuration/README.md) |

---

## 📖 Povezani resursi

- [Sažetak naredbi](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Rječnik](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Odricanje odgovornosti:
Ovaj je dokument preveden pomoću AI usluge prevođenja Co-op Translator (https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati mjerodavnim izvorom. Za kritične informacije preporučuje se profesionalni prijevod od strane ovlaštenog prevoditelja. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
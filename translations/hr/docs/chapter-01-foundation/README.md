# Poglavlje 1: Osnove i Brzi Početak

**📚 Tečaj**: [AZD za Početnike](../../README.md) | **⏱️ Trajanje**: 30-45 minuta | **⭐ Kompleksnost**: Početnik

---

## Pregled

Ovo poglavlje uvodi osnove Azure Developer CLI (azd). Naučit ćete osnovne pojmove, instalirati alate i implementirati svoju prvu aplikaciju na Azure.

> Validirano s `azd 1.25.6` u lipnju 2026.

## Ciljevi učenja

Nakon završetka ovog poglavlja, moći ćete:
- Razumjeti što je Azure Developer CLI i kako se razlikuje od Azure CLI
- Instalirati i konfigurirati AZD na vašoj platformi
- Implementirati svoju prvu aplikaciju na Azure koristeći `azd up`
- Očistiti resurse korištenjem `azd down`

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|---------|------|---------|
| 1 | [Osnove AZD](azd-basics.md) | Osnovni pojmovi, terminologija i struktura projekta | 15 min |
| 2 | [Instalacija i Postavljanje](installation.md) | Vodiči za instalaciju specifični za platformu | 10 min |
| 3 | [Vaš Prvi Projekt](first-project.md) | Praktično: Implementacija web aplikacije na Azure | 20 min |
| 4 | [Dodajte Svoju Aplikaciju](bring-your-own-app.md) | Dodajte azd u postojeći projekt koji već imate | 15 min |
| 5 | [Razvojni Kontejneri i Codespaces](dev-containers.md) | Reproducibilna azd okruženja s razvojnim kontejnerima | 15 min |

---

## ✅ Počnite Ovdje: Potvrdite Vašu Postavku

Prije nego počnete, provjerite je li vaš lokalni stroj spreman za predložak iz Poglavlja 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ako skripta prijavi nedostatak alata, prvo ih popravite, a zatim nastavite s poglavljem.

---

## 🚀 Brzi Početak

```bash
# Provjerite instalaciju
azd version

# Autentificirajte se za AZD
# Opcionalno: az login ako planirate izravno koristiti Azure CLI naredbe
azd auth login

# Objavite svoju prvu aplikaciju
azd init --template todo-nodejs-mongo
azd up

# Očistite kada završite
azd down --force --purge
```

---

## ✅ Kriteriji Uspjeha

Nakon završetka ovog poglavlja, trebali biste biti u mogućnosti:

```bash
azd version              # Prikazuje instaliranu verziju
azd init --template todo-nodejs-mongo  # Inicijalizira projekt
azd up                   # Implementira na Azure
azd show                 # Prikazuje URL pokrenute aplikacije
azd down --force --purge # Čisti resurse
```

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|--------|-----------|
| **Sljedeće** | [Poglavlje 2: Razvoj s AI u Prvom Planu](../chapter-02-ai-development/README.md) |
| **Preskoči na** | [Poglavlje 3: Konfiguracija](../chapter-03-configuration/README.md) |

---

## 📖 Povezani Resursi

- [Kratka Lista Komandi](../../resources/cheat-sheet.md)
- [Često Postavljana Pitanja (FAQ)](../../resources/faq.md)
- [Rječnik](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Poglavlje 1: Osnove i Brzi Početak

**📚 Tečaj**: [AZD za Početnike](../../README.md) | **⏱️ Trajanje**: 30-45 minuta | **⭐ Kompleksnost**: Početnik

---

## Pregled

Ovo poglavlje uvodi temelje Azure Developer CLI (azd). Naučit ćete ključne pojmove, instalirati alate i implementirati svoju prvu aplikaciju na Azure.

> Provjereno na `azd 1.27.1` u srpnju 2026.

## Ciljevi učenja

Dovršetkom ovog poglavlja, moći ćete:
- Razumjeti što je Azure Developer CLI i kako se razlikuje od Azure CLI
- Instalirati i konfigurirati AZD na vašoj platformi
- Implementirati svoju prvu aplikaciju na Azure pomoću `azd up`
- Očistiti resurse pomoću `azd down`

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Osnove AZD](azd-basics.md) | Ključni pojmovi, terminologija i struktura projekta | 15 min |
| 2 | [Instalacija i Postavljanje](installation.md) | Vodiči za instalaciju specifične za platformu | 10 min |
| 3 | [Vaš Prvi Projekt](first-project.md) | Praktično: Implementacija web aplikacije na Azure | 20 min |
| 4 | [Dodajte Svoju Aplikaciju](bring-your-own-app.md) | Dodajte azd u postojeći projekt koji već imate | 15 min |
| 5 | [Razvojni Kontejneri i Codespaces](dev-containers.md) | Reproducibilna azd okruženja s razvojnim kontejnerima | 15 min |

---

## ✅ Početak Ovdje: Validirajte Vašu Konfiguraciju

Prije početka, potvrdite da je vaše lokalno računalo spremno za predložak iz Poglavlja 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ako skripta prijavi nedostajuće alate, prvo ih popravite, a zatim nastavite s poglavljem.

---

## 🚀 Brzi Početak

```bash
# Provjerite instalaciju
azd version

# Autentificirajte se za AZD
# Opcionalno: az login ako planirate izravno koristiti Azure CLI naredbe
azd auth login

# Postavite svoju prvu aplikaciju
azd init --template todo-nodejs-mongo
azd up

# Očistite nakon završetka
azd down --force --purge
```

---

## ✅ Kriteriji uspjeha

Nakon završetka ovog poglavlja, trebali biste moći:

```bash
azd version              # Prikazuje instaliranu verziju
azd init --template todo-nodejs-mongo  # Inicijalizira projekt
azd up                   # Postavlja na Azure
azd show                 # Prikazuje URL pokrenute aplikacije
azd down --force --purge # Čisti resurse
```

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Sljedeće** | [Poglavlje 2: AI-prvi razvoj](../chapter-02-ai-development/README.md) |
| **Preskoči na** | [Poglavlje 3: Konfiguracija](../chapter-03-configuration/README.md) |

---

## 📖 Povezani resursi

- [Prečac za naredbe](../../resources/cheat-sheet.md)
- [Često postavljana pitanja](../../resources/faq.md)
- [Rječnik](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
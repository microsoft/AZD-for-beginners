# Poglavlje 1: Osnove i Brzi početak

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 30-45 minuta | **⭐ Složenost**: Početnik

---

## Pregled

Ovo poglavlje uvodi osnove Azure Developer CLI-ja (azd). Naučit ćete ključne pojmove, instalirati alate i postaviti svoju prvu aplikaciju na Azure.

> Validirano za `azd 1.23.12` u ožujku 2026.

## Ciljevi učenja

Nakon dovršetka ovog poglavlja moći ćete:
- Razumjeti što je Azure Developer CLI i kako se razlikuje od Azure CLI-ja
- Instalirati i konfigurirati AZD na svojoj platformi
- Postaviti svoju prvu aplikaciju na Azure pomoću `azd up`
- Očistiti resurse pomoću `azd down`

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|---------|-------|---------|
| 1 | [AZD Osnove](azd-basics.md) | Ključni pojmovi, terminologija i struktura projekta | 15 min |
| 2 | [Instalacija i postavljanje](installation.md) | Upute za instalaciju za različite platforme | 10 min |
| 3 | [Vaš prvi projekt](first-project.md) | Praktično: Postavite web aplikaciju na Azure | 20 min |

---

## ✅ Počnite ovdje: Provjerite svoju konfiguraciju

Prije nego počnete, provjerite je li vaša lokalna mašina spremna za predložak Poglavlja 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ako skripta prijavi nedostajuće alate, prvo ih instalirajte, a zatim nastavite s poglavljem.

---

## 🚀 Brzi početak

```bash
# Provjerite instalaciju
azd version

# Autentificirajte se za AZD
# Opcionalno: az prijava ako planirate izravno pokretati Azure CLI naredbe
azd auth login

# Postavite svoju prvu aplikaciju
azd init --template todo-nodejs-mongo
azd up

# Očistite nakon završetka
azd down --force --purge
```

---

## ✅ Kriteriji uspjeha

Nakon dovršetka ovog poglavlja trebali biste moći:

```bash
azd version              # Prikazuje instaliranu verziju
azd init --template todo-nodejs-mongo  # Inicijalizira projekt
azd up                   # Deploya na Azure
azd show                 # Prikazuje URL pokrenute aplikacije
azd down --force --purge # Čisti resurse
```

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|--------|------------|
| **Sljedeće** | [Poglavlje 2: Razvoj vođen umjetnom inteligencijom](../chapter-02-ai-development/README.md) |
| **Preskoči na** | [Poglavlje 3: Konfiguracija](../chapter-03-configuration/README.md) |

---

## 📖 Povezani resursi

- [Kratki pregled naredbi](../../resources/cheat-sheet.md)
- [Često postavljana pitanja](../../resources/faq.md)
- [Rječnik](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument je preveden pomoću AI servisa za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo biti točni, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Originalni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakva nesporazuma ili kriva tumačenja nastala korištenjem ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
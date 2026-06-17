# Poglavje 1: Osnove in hiter začetek

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 30-45 minut | **⭐ Kompleksnost**: Začetnik

---

## Pregled

To poglavje predstavlja osnove Azure Developer CLI (azd). Naučili se boste temeljnih konceptov, namestili orodja in razmestili svojo prvo aplikacijo v Azure.

> Preverjeno z `azd 1.25.6` v juniju 2026.

## Cilji učenja

Z dokončanjem tega poglavja boste:
- Razumeti, kaj je Azure Developer CLI in kako se razlikuje od Azure CLI
- Namestiti in konfigurirati AZD na vaši platformi
- Razmestiti svojo prvo aplikacijo v Azure z `azd up`
- Počistiti vire z `azd down`

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Osnove AZD](azd-basics.md) | Osnovni koncepti, terminologija in struktura projekta | 15 min |
| 2 | [Namestitev in nastavitev](installation.md) | Vodniki za namestitev, specifični za platformo | 10 min |
| 3 | [Vaš prvi projekt](first-project.md) | Praktično: Razmestitev spletne aplikacije v Azure | 20 min |
| 4 | [Dodajte svojo aplikacijo](bring-your-own-app.md) | Dodajte azd obstoječemu projektu, ki ga že imate | 15 min |
| 5 | [Razvojni kontejnerji in Codespaces](dev-containers.md) | Ponovljivi azd-okolji z razvojnimi kontejnerji | 15 min |

---

## ✅ Začni tukaj: Preverite svojo namestitev

Preden začnete, potrdite, da je vaš lokalni računalnik pripravljen za predlogo Poglavja 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If the script reports missing tools, fix those first and then continue with the chapter.

---

## 🚀 Hiter začetek

```bash
# Preverite namestitev
azd version

# Prijavite se za AZD
# Neobvezno: az login, če nameravate neposredno zagnati ukaze Azure CLI
azd auth login

# Razmestite svojo prvo aplikacijo
azd init --template todo-nodejs-mongo
azd up

# Po koncu počistite
azd down --force --purge
```

---

## ✅ Merila uspeha

Po končanem poglavju boste lahko:

```bash
azd version              # Prikaže nameščeno različico
azd init --template todo-nodejs-mongo  # Inicializira projekt
azd up                   # Razporedi v Azure
azd show                 # Prikaže URL delujoče aplikacije
azd down --force --purge # Počisti vire
```

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Naprej** | [Poglavje 2: Razvoj, osredotočen na AI](../chapter-02-ai-development/README.md) |
| **Preskoči na** | [Poglavje 3: Konfiguracija](../chapter-03-configuration/README.md) |

---

## 📖 Sorodni viri

- [Povzetek ukazov](../../resources/cheat-sheet.md)
- [Pogosta vprašanja](../../resources/faq.md)
- [Pojmovnik](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
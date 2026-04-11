# Poglavje 1: Temelji in hiter začetek

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 30-45 minutes | **⭐ Težavnost**: Beginner

---

## Pregled

To poglavje uvaja temelje Azure Developer CLI (azd). Naučili se boste osnovnih konceptov, namestili orodja in razmestili svojo prvo aplikacijo v Azure.

> Preverjeno z `azd 1.23.12` v marcu 2026.

## Cilji učenja

Z zaključkom tega poglavja boste:
- Razumeli, kaj je Azure Developer CLI in kako se razlikuje od Azure CLI
- Namestili in konfigurirali AZD na svoji platformi
- Razmestili svojo prvo aplikacijo v Azure z ukazom `azd up`
- Počistili vire z `azd down`

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Osnove AZD](azd-basics.md) | Osnovni koncepti, terminologija in struktura projekta | 15 min |
| 2 | [Namestitev in nastavitev](installation.md) | Navodila za namestitev, specifična za platformo | 10 min |
| 3 | [Vaš prvi projekt](first-project.md) | Praktično: Razmestitev spletne aplikacije v Azure | 20 min |

---

## ✅ Začnite tukaj: Preverite svojo namestitev

Pred začetkom potrdite, da je vaš lokalni računalnik pripravljen za predlogo poglavja 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Če skripta poroča o manjkajočih orodjih, jih najprej namestite in nato nadaljujte s poglavjem.

---

## 🚀 Hiter začetek

```bash
# Preverite namestitev
azd version

# Avtenticirajte se za AZD
# Neobvezno: az login, če nameravate neposredno izvajati ukaze Azure CLI
azd auth login

# Razmestite svojo prvo aplikacijo
azd init --template todo-nodejs-mongo
azd up

# Po končanem počistite
azd down --force --purge
```

---

## ✅ Merila uspeha

Po zaključku tega poglavja boste lahko:

```bash
azd version              # Prikaže nameščeno različico
azd init --template todo-nodejs-mongo  # Inicializira projekt
azd up                   # Razporedi v Azure
azd show                 # Prikaže URL zagnane aplikacije
azd down --force --purge # Počisti vire
```

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Naprej** | [Poglavje 2: Razvoj z AI v ospredju](../chapter-02-ai-development/README.md) |
| **Preskoči na** | [Poglavje 3: Konfiguracija](../chapter-03-configuration/README.md) |

---

## 📖 Povezani viri

- [Kratka referenca ukazov](../../resources/cheat-sheet.md)
- [Pogosta vprašanja](../../resources/faq.md)
- [Slovar pojmov](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v matičnem jeziku naj velja za avtoritativni vir. Za ključne informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
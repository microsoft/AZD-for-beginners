# Poglavje 1: Osnove in hiter začetek

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 30-45 minut | **⭐ Kompleksnost**: Začetnik

---

## Pregled

To poglavje uvaja temelje Azure Developer CLI (azd). Spoznali boste osnovne pojme, namestili orodja in razporedili svojo prvo aplikacijo v Azure.

> Preizkušeno z `azd 1.27.1` julija 2026.

## Cilji učenja

Z dokončanjem tega poglavja boste:
- Razumeli, kaj je Azure Developer CLI in kako se razlikuje od Azure CLI
- Namestili in konfigurirali AZD na svoji platformi
- Razporedili svojo prvo aplikacijo v Azure z `azd up`
- Počistili vire z `azd down`

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Osnove AZD](azd-basics.md) | Osnovni pojmi, terminologija in struktura projekta | 15 min |
| 2 | [Namestitev in nastavitev](installation.md) | Vodniki po namestitvi za specificirane platforme | 10 min |
| 3 | [Vaš prvi projekt](first-project.md) | Praktično: Razporeditev spletne aplikacije v Azure | 20 min |
| 4 | [Uporabite svojo aplikacijo](bring-your-own-app.md) | Dodajte azd v obstoječi projekt, ki ga že imate | 15 min |
| 5 | [Razvojni zabojniki in Codespaces](dev-containers.md) | Reproducibilna okolja azd z razvojnimi zabojniki | 15 min |

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

Če skripta poroča o manjkajočih orodjih, jih najprej odpravite in nato nadaljujte s poglavjem.

---

## 🚀 Hiter začetek

```bash
# Preveri namestitev
azd version

# Avtentikacija za AZD
# Neobvezno: az login, če nameravate neposredno zagnati ukaze Azure CLI
azd auth login

# Namestite svojo prvo aplikacijo
azd init --template todo-nodejs-mongo
azd up

# Po končanem čiščenje
azd down --force --purge
```

---

## ✅ Merila uspeha

Po zaključku tega poglavja bi morali biti sposobni:

```bash
azd version              # Prikaže nameščeno različico
azd init --template todo-nodejs-mongo  # Inicializira projekt
azd up                   # Razporedi na Azure
azd show                 # Prikaže URL zagnane aplikacije
azd down --force --purge # Počisti vire
```

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Naslednje** | [Poglavje 2: Razvoj z umetno inteligenco](../chapter-02-ai-development/README.md) |
| **Preskoči na** | [Poglavje 3: Konfiguracija](../chapter-03-configuration/README.md) |

---

## 📖 Povezani viri

- [Povzetek ukazov](../../resources/cheat-sheet.md)
- [Pogosta vprašanja](../../resources/faq.md)
- [Slovarček](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
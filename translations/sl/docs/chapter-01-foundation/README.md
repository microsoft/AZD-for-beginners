# Poglavje 1: Osnove in hiter začetek

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 30-45 minut | **⭐ Zahtevnost**: Začetna

---

## Pregled

To poglavje uvaja osnove Azure Developer CLI (azd). Naučili se boste osnovnih konceptov, namestili orodja in razmestili svojo prvo aplikacijo v Azure.

## Cilji učenja

Po zaključku tega poglavja boste:
- Razumeti, kaj je Azure Developer CLI in kako se razlikuje od Azure CLI
- Namestiti in konfigurirati AZD na vaši platformi
- Razmestiti svojo prvo aplikacijo v Azure z `azd up`
- Počistiti vire z `azd down`

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Osnove AZD](azd-basics.md) | Osnovni koncepti, terminologija in struktura projekta | 15 min |
| 2 | [Namestitev & Nastavitev](installation.md) | Navodila za namestitev po platformah | 10 min |
| 3 | [Vaš prvi projekt](first-project.md) | Praktično: razmestitev spletne aplikacije v Azure | 20 min |

---

## 🚀 Hiter začetek

```bash
# Preverite namestitev
azd version

# Prijavite se v Azure
azd auth login

# Razmestite svojo prvo aplikacijo
azd init --template todo-nodejs-mongo
azd up

# Ko končate, pospravite
azd down --force --purge
```

---

## ✅ Kriteriji uspeha

Po zaključku tega poglavja boste sposobni:

```bash
azd version              # Prikaže nameščeno različico
azd init --template todo-nodejs-mongo  # Inicializira projekt
azd up                   # Razmestí v Azure
azd show                 # Prikaže URL delujoče aplikacije
azd down --force --purge # Očisti vire
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
Zavrnitev odgovornosti:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, prosimo, upoštevajte, da avtomatski prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvor­nem jeziku velja za avtoritativni vir. Za kritične informacije priporočamo strokovni prevod, opravljen s strani profesionalnega prevajalca. Ne prevzemamo odgovornosti za kakršnekoli nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
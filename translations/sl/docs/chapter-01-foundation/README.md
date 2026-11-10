# Poglavje 1: Temelji in hitri začetek

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 75-120 minut vključno s prvo namestitvijo; dodatne vaje trajajo dlje | **⭐ Kompleksnost**: Začetnik

---

## Pregled

To poglavje uvaja osnove Azure Developer CLI (azd). Naučili se boste osnovnih pojmov, namestili orodja in namestili svojo prvo aplikacijo v Azure.

> Cilj pregleda ukazov in konfiguracije: `azd 1.37.2` (November 2026). Med pregledom ni bila izvedena živa namestitev Azure.

## Cilji učenja

S tem, ko boste dokončali to poglavje, boste:
- Razumeli, kaj je Azure Developer CLI in kako se razlikuje od Azure CLI
- Namestili in konfigurirali AZD na svoji platformi
- Namestili svojo prvo aplikacijo v Azure z `azd up`
- Počistili vire z `azd down`

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Osnove AZD](azd-basics.md) | Osnovni koncepti, terminologija in struktura projekta | 15 min |
| 2 | [Namestitev in nastavitev](installation.md) | Navodila za namestitev na specifičnih platformah | 10 min |
| 3 | [Tvoj prvi projekt](first-project.md) | Praktično: Namestitev spletne aplikacije v Azure | 20 min |
| 4 | [Uporabi svojo aplikacijo](bring-your-own-app.md) | Dodaj azd v obstoječi projekt, ki ga že imaš | 15 min |
| 5 | [Razvojni kontejnerji in Codespaces](dev-containers.md) | Reproducibilna azd okolja z razvojnimi kontejnerji | 15 min |

---

## ✅ Začni tukaj: Preveri svojo nastavitev

Pred začetkom preveri, da je tvoj lokalni računalnik pripravljen za predlogo Poglavja 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Če skripta javi manjkajoča orodja, jih najprej odpravi in nato nadaljuj s poglavjem.

---

## 🚀 Hiter začetek

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Merila uspeha

Po končanem tem poglavju boš lahko:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Naslednje** | [Poglavje 2: AI-prvi razvoj](../chapter-02-ai-development/README.md) |
| **Preskoči na** | [Poglavje 3: Konfiguracija](../chapter-03-configuration/README.md) |

---

## 📖 Povezani viri

- [Previdnica ukazov](../../resources/cheat-sheet.md)
- [Pogosta vprašanja](../../resources/faq.md)
- [Slovar](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
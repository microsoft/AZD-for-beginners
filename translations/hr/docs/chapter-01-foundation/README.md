# Poglavlje 1: Osnove i Brzi početak

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 75-120 minuta uključujući prvo postavljanje; dodatne vježbe traju dulje | **⭐ Složenost**: Početnik

---

## Pregled

Ovo poglavlje uvodi osnove Azure Developer CLI (azd). Naučit ćete osnovne koncepte, instalirati alate i postaviti svoju prvu aplikaciju na Azure.

> Pregled naredbi i konfiguracije cilj: `azd 1.37.2` (studeni 2026). Tijekom pregleda nije izvršeno aktivno postavljanje na Azure.

## Ciljevi učenja

Završetkom ovog poglavlja, moći ćete:
- Razumjeti što je Azure Developer CLI i kako se razlikuje od Azure CLI
- Instalirati i konfigurirati AZD na svojoj platformi
- Postaviti svoju prvu aplikaciju na Azure koristeći `azd up`
- Očistiti resurse pomoću `azd down`

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Osnove AZD-a](azd-basics.md) | Osnovni koncepti, terminologija i struktura projekta | 15 min |
| 2 | [Instalacija i postavljanje](installation.md) | Vodiči za instalaciju specifične za platformu | 10 min |
| 3 | [Vaš prvi projekt](first-project.md) | Praktično: Postavite web aplikaciju na Azure | 20 min |
| 4 | [Dodajte svoju aplikaciju](bring-your-own-app.md) | Dodajte azd u postojeći projekt koji već imate | 15 min |
| 5 | [Razvojni kontejneri i Codespaces](dev-containers.md) | Reproducibilna azd okruženja s razvojnim kontejnerima | 15 min |

---

## ✅ Počnite ovdje: Provjerite svoj setup

Prije početka, potvrdite da je vaše lokalno računalo spremno za predložak Poglavlja 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ako skripta prijavi nedostatak alata, najprije ih instalirajte, pa nastavite s poglavljem.

---

## 🚀 Brzi početak

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

## ✅ Kriteriji za uspjeh

Nakon što ste završili ovo poglavlje, trebali biste moći:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Sljedeće** | [Poglavlje 2: AI-First Development](../chapter-02-ai-development/README.md) |
| **Preskoči na** | [Poglavlje 3: Konfiguracija](../chapter-03-configuration/README.md) |

---

## 📖 Povezani resursi

- [Prečaci naredbi](../../resources/cheat-sheet.md)
- [Često postavljana pitanja](../../resources/faq.md)
- [Rječnik](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
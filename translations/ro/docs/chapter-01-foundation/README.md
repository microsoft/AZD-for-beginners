# Capitolul 1: Bază & Pornire Rapidă

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 75-120 minute inclusiv prima implementare; exercițiile suplimentare durează mai mult | **⭐ Complexitate**: Începător

---

## Prezentare generală

Acest capitol introduce elementele de bază ale Azure Developer CLI (azd). Veți învăța conceptele esențiale, veți instala instrumentele și veți implementa prima aplicație în Azure.

> Țintă de revizuire a comenzilor și configurațiilor: `azd 1.37.2` (noiembrie 2026). Producția live Azure nu a fost rulată în timpul revizuirii.

## Obiective de învățare

După ce parcurgeți acest capitol, veți:
- Înțelege ce este Azure Developer CLI și cum se diferențiază de Azure CLI
- Instala și configura AZD pe platforma dumneavoastră
- Implementa prima aplicație în Azure cu `azd up`
- Curăța resursele cu `azd down`

---

## 📚 Lecții

| # | Lecția | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Noțiuni de bază AZD](azd-basics.md) | Concepte principale, terminologie și structură de proiect | 15 min |
| 2 | [Instalare & Configurare](installation.md) | Ghiduri de instalare specifice platformei | 10 min |
| 3 | [Primul tău proiect](first-project.md) | Practic: Implementarea unei aplicații web în Azure | 20 min |
| 4 | [Adu-ți propria aplicație](bring-your-own-app.md) | Adăugarea azd într-un proiect existent pe care îl aveți deja | 15 min |
| 5 | [Containere de dezvoltare & Codespaces](dev-containers.md) | Medii azd reproducibile cu containere de dezvoltare | 15 min |

---

## ✅ Începe aici: Verifică-ți configurarea

Înainte să începi, confirmă că mașina ta locală este pregătită pentru șablonul Capitolului 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Dacă scriptul raportează instrumente lipsă, rezolvă acele probleme mai întâi, apoi continuă cu capitolul.

---

## 🚀 Pornire rapidă

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

## ✅ Criterii de succes

După ce termini acest capitol, ar trebui să poți:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Următor** | [Capitolul 2: Dezvoltare AI-First](../chapter-02-ai-development/README.md) |
| **Sari la** | [Capitolul 3: Configurare](../chapter-03-configuration/README.md) |

---

## 📖 Resurse conexe

- [Fișă de comenzi](../../resources/cheat-sheet.md)
- [Întrebări frecvente](../../resources/faq.md)
- [Glosar](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
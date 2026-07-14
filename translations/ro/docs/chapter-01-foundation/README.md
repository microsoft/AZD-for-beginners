# Capitolul 1: Bază & Pornire Rapidă

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 30-45 minute | **⭐ Complexitate**: Începător

---

## Prezentare generală

Acest capitol introduce elementele fundamentale ale Azure Developer CLI (azd). Vei învăța conceptele de bază, vei instala uneltele și vei implementa prima ta aplicație în Azure.

> Validat cu `azd 1.27.1` în iulie 2026.

## Obiective de învățare

Finalizând acest capitol, vei:
- Înțelege ce este Azure Developer CLI și cum diferă de Azure CLI
- Instala și configura AZD pe platforma ta
- Implementa prima ta aplicație în Azure cu `azd up`
- Curăța resursele cu `azd down`

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Bazele AZD](azd-basics.md) | Concepte principale, terminologie și structură de proiect | 15 min |
| 2 | [Instalare & Configurare](installation.md) | Ghiduri de instalare specifice platformei | 10 min |
| 3 | [Primul Tău Proiect](first-project.md) | Practic: Implementarea unei aplicații web în Azure | 20 min |
| 4 | [Adaugă-ți Propria Aplicație](bring-your-own-app.md) | Adaugă azd într-un proiect existent pe care îl ai deja | 15 min |
| 5 | [Containere Dev & Codespaces](dev-containers.md) | Medii azd reproductibile cu containere dezvoltare | 15 min |

---

## ✅ Începe aici: Validează-ți configurarea

Înainte de a începe, confirmă că mașina ta locală este pregătită pentru șablonul Capitolului 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Dacă scriptul raportează unelte lipsă, rezolvă acele probleme mai întâi, apoi continuă cu capitolul.

---

## 🚀 Pornire Rapidă

```bash
# Verificați instalarea
azd version

# Autentificați-vă pentru AZD
# Opțional: az login dacă intenționați să rulați comenzi Azure CLI direct
azd auth login

# Implementați prima aplicație
azd init --template todo-nodejs-mongo
azd up

# Curățați după ce terminați
azd down --force --purge
```

---

## ✅ Criterii de succes

După finalizarea acestui capitol, ar trebui să poți:

```bash
azd version              # Afișează versiunea instalată
azd init --template todo-nodejs-mongo  # Initializează proiectul
azd up                   # Realizează implementarea în Azure
azd show                 # Afișează URL-ul aplicației în execuție
azd down --force --purge # Curăță resursele
```

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Următorul** | [Capitolul 2: Dezvoltare AI-First](../chapter-02-ai-development/README.md) |
| **Sari la** | [Capitolul 3: Configurare](../chapter-03-configuration/README.md) |

---

## 📖 Resurse conexe

- [Fișa de comenzi rapide](../../resources/cheat-sheet.md)
- [Întrebări frecvente](../../resources/faq.md)
- [Glosar](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
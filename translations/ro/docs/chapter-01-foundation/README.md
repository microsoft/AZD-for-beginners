# Capitolul 1: Fundamente & Pornire Rapidă

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 30-45 minute | **⭐ Complexitate**: Începător

---

## Prezentare generală

Acest capitol introduce elementele de bază ale Azure Developer CLI (azd). Vei învăța conceptele principale, vei instala uneltele și vei implementa prima ta aplicație în Azure.

> Validat cu `azd 1.25.6` în iunie 2026.

## Obiective de învățare

Parcurgând acest capitol, vei putea:
- Înțelege ce este Azure Developer CLI și cum diferă de Azure CLI
- Instala și configura AZD pe platforma ta
- Implementa prima ta aplicație în Azure cu `azd up`
- Curăța resursele cu `azd down`

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-----------|------|
| 1 | [Bazele AZD](azd-basics.md) | Concepte de bază, terminologie și structură a proiectului | 15 min |
| 2 | [Instalare & Configurare](installation.md) | Ghiduri de instalare specifice platformei | 10 min |
| 3 | [Primul Tău Proiect](first-project.md) | Practic: Implementare aplicație web în Azure | 20 min |
| 4 | [Adaugă-ți Propria Aplicație](bring-your-own-app.md) | Adaugă azd unui proiect existent pe care îl ai deja | 15 min |
| 5 | [Containere pentru Dezvoltare & Codespaces](dev-containers.md) | Medii azd reproducibile cu containere pentru dezvoltare | 15 min |

---

## ✅ Începe Aici: Verifică-ți Configurația

Înainte de a începe, confirmă că mașina locală este pregătită pentru șablonul Capitolului 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Dacă scriptul indică lipsa unor unelte, remediază acele probleme mai întâi, apoi continuă cu acest capitol.

---

## 🚀 Pornire Rapidă

```bash
# Verifică instalarea
azd version

# Autentifică-te pentru AZD
# Opțional: az login dacă intenționezi să rulezi comenzi Azure CLI direct
azd auth login

# Publică prima ta aplicație
azd init --template todo-nodejs-mongo
azd up

# Curăță după ce ai terminat
azd down --force --purge
```

---

## ✅ Criterii de Succes

După finalizarea acestui capitol, ar trebui să poți:

```bash
azd version              # Afișează versiunea instalată
azd init --template todo-nodejs-mongo  # Inițializează proiectul
azd up                   # Realizează implementarea în Azure
azd show                 # Afișează URL-ul aplicației în funcțiune
azd down --force --purge # Curăță resursele
```

---

## 🔗 Navigare

| Direcție | Capitol |
|----------|---------|
| **Următor** | [Capitolul 2: Dezvoltare cu AI în Prim-Plan](../chapter-02-ai-development/README.md) |
| **Salt la** | [Capitolul 3: Configurare](../chapter-03-configuration/README.md) |

---

## 📖 Resurse Aflate în Legătură

- [Fișă de Comenzi](../../resources/cheat-sheet.md)
- [Întrebări frecvente](../../resources/faq.md)
- [Glosar](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
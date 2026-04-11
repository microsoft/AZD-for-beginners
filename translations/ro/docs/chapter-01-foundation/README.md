# Capitolul 1: Fundamente & Pornire Rapidă

**📚 Curs**: [AZD pentru începători](../../README.md) | **⏱️ Durata**: 30-45 de minute | **⭐ Complexitate**: Începător

---

## Prezentare generală

Acest capitol prezintă fundamentele Azure Developer CLI (azd). Veți învăța conceptele de bază, veți instala instrumentele și veți implementa prima aplicație în Azure.

> Validat cu `azd 1.23.12` în martie 2026.

## Obiective de învățare

Prin parcurgerea acestui capitol, veți:
- Înțelegeți ce este Azure Developer CLI și cum se diferențiază de Azure CLI
- Instalați și configurați AZD pe platforma dvs.
- Implementați prima aplicație în Azure cu `azd up`
- Eliminați resursele cu `azd down`

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Bazele AZD](azd-basics.md) | Concepte de bază, terminologie și structura proiectului | 15 min |
| 2 | [Instalare & Configurare](installation.md) | Ghiduri de instalare specifice platformei | 10 min |
| 3 | [Primul tău proiect](first-project.md) | Exercițiu practic: Implementați o aplicație web în Azure | 20 min |

---

## ✅ Începeți aici: Verificați configurația

Înainte de a începe, confirmați că mașina dvs. locală este pregătită pentru șablonul Capitolului 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Dacă scriptul raportează instrumente lipsă, remediați acele lipsuri mai întâi, apoi continuați cu capitolul.

---

## 🚀 Pornire rapidă

```bash
# Verificați instalarea
azd version

# Autentificați-vă pentru AZD
# Opțional: folosiți az login dacă intenționați să rulați direct comenzi Azure CLI
azd auth login

# Implementați prima aplicație
azd init --template todo-nodejs-mongo
azd up

# Curățați când ați terminat
azd down --force --purge
```

---

## ✅ Criterii de succes

După finalizarea acestui capitol, ar trebui să puteți:

```bash
azd version              # Afișează versiunea instalată
azd init --template todo-nodejs-mongo  # Inițializează proiectul
azd up                   # Desfășoară în Azure
azd show                 # Afișează URL-ul aplicației care rulează
azd down --force --purge # Curăță resursele
```

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Următor** | [Capitolul 2: Dezvoltare orientată pe AI](../chapter-02-ai-development/README.md) |
| **Sări la** | [Capitolul 3: Configurare](../chapter-03-configuration/README.md) |

---

## 📖 Resurse conexe

- [Fișă de comenzi](../../resources/cheat-sheet.md)
- [Întrebări frecvente](../../resources/faq.md)
- [Glosar](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autoritară. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru orice neînțelegeri sau interpretări eronate rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
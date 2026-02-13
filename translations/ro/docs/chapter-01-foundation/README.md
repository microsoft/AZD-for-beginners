# Capitolul 1: Fundamente & Pornire rapidă

**📚 Curs**: [AZD For Beginners](../../README.md) | **⏱️ Durată**: 30-45 minute | **⭐ Complexitate**: Începător

---

## Prezentare generală

Acest capitol introduce elementele fundamentale ale Azure Developer CLI (azd). Vei învăța conceptele de bază, cum să instalezi instrumentele și să implementezi prima ta aplicație în Azure.

## Obiective de învățare

După finalizarea acestui capitol, vei:
- Să înțelegi ce este Azure Developer CLI și în ce se diferențiază de Azure CLI
- Să instalezi și să configurezi AZD pe platforma ta
- Să implementezi prima aplicație în Azure cu `azd up`
- Să elimini resursele cu `azd down`

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Bazele AZD](azd-basics.md) | Concepte de bază, terminologie și structura proiectului | 15 min |
| 2 | [Instalare & Configurare](installation.md) | Ghiduri de instalare specifice platformei | 10 min |
| 3 | [Primul tău proiect](first-project.md) | Practic: Implementați o aplicație web în Azure | 20 min |

---

## 🚀 Pornire rapidă

```bash
# Verificați instalarea
azd version

# Conectați-vă la Azure
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
| **Următorul** | [Capitolul 2: Dezvoltare orientată pe AI](../chapter-02-ai-development/README.md) |
| **Sari la** | [Capitolul 3: Configurare](../chapter-03-configuration/README.md) |

---

## 📖 Resurse conexe

- [Fișă de comenzi](../../resources/cheat-sheet.md)
- [Întrebări frecvente](../../resources/faq.md)
- [Glosar](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă ar trebui considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un traducător uman. Nu ne asumăm responsabilitatea pentru orice neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
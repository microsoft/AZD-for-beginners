# Poglavlje 4: Infrastruktura kao kod i raspoređivanje

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 1-1.5 hours | **⭐ Složenost**: Intermediate

---

## Pregled

Ovo poglavlje pokriva obrasce Infrastrukture kao koda (IaC) s Bicep predlošcima, provisioniranje resursa i strategije raspoređivanja koristeći Azure Developer CLI.

## Ciljevi učenja

Po završetku ovog poglavlja, naučit ćete:
- Razumjeti strukturu i sintaksu Bicep predložaka
- Provisionirati Azure resurse pomoću `azd provision`
- Rasporediti aplikacije pomoću `azd deploy`
- Implementirati blue-green i rolling strategije raspoređivanja

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Provisioniranje resursa](provisioning.md) | Upravljanje Azure resursima pomoću AZD | 45 min |
| 2 | [Vodič za raspoređivanje](deployment-guide.md) | Strategije raspoređivanja aplikacija | 45 min |

---

## 🚀 Brzi početak

```bash
# Inicijaliziraj iz predloška
azd init --template azure-functions-python-v2-http

# Pregledaj što će biti stvoreno
azd provision --preview

# Samo postavi infrastrukturu
azd provision

# Samo rasporedi kod
azd deploy

# Ili oboje zajedno
azd up
```

---

## 📁 Struktura projekta AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Osnovne naredbe

| Naredba | Opis |
|---------|-------------|
| `azd init` | Inicijaliziraj projekt |
| `azd provision` | Kreiraj Azure resurse |
| `azd deploy` | Rasporedi kod aplikacije |
| `azd up` | provision + deploy |
| `azd down` | Izbriši sve resurse |

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Sljedeće** | [Poglavlje 5: Rješenja s više agenata](../chapter-05-multi-agent/README.md) |

---

## 📖 Povezani resursi

- [Provjere prije raspoređivanja](../chapter-06-pre-deployment/README.md)
- [Primjeri kontejnerskih aplikacija](../../examples/container-app/README.md)
- [Primjer aplikacije s bazom podataka](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje odgovornosti**:
Ovaj dokument je preveden korištenjem AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na njegovom izvornom jeziku treba smatrati mjerodavnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
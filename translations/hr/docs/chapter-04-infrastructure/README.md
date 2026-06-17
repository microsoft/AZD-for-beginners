# Poglavlje 4: Infrastruktura kao kod i implementacija

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 1-1,5 sati | **⭐ Složenost**: Srednja

---

## Pregled

Ovo poglavlje pokriva obrasce Infrastrukture kao koda (IaC) pomoću Bicep predložaka, pripremu resursa i strategije implementacije koristeći Azure Developer CLI.

> Potvrđeno s `azd 1.25.6` u lipnju 2026.

## Ciljevi učenja

Nakon dovršetka ovog poglavlja, moći ćete:
- Razumjeti strukturu i sintaksu Bicep predložaka
- Pripremiti Azure resurse pomoću `azd provision`
- Implementirati aplikacije pomoću `azd deploy`
- Primijeniti strategije plavo-zelene i rekonfigurirajuće implementacije

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Priprema resursa](provisioning.md) | Upravljanje Azure resursima s AZD-om | 45 min |
| 2 | [Vodič za implementaciju](deployment-guide.md) | Strategije implementacije aplikacija | 45 min |
| 3 | [Izrada vlastitog predloška](custom-templates.md) | Izgradnja i objava ponovo upotrebljivih azd predložaka | 30 min |

---

## 🚀 Brzi početak

```bash
# Inicijaliziraj iz predloška
azd init --template azure-functions-python-v2-http

# Pregledaj što će biti kreirano
azd provision --preview

# Samo postavi infrastrukturu
azd provision

# Samo implementiraj kod
azd deploy

# Ili oboje zajedno
azd up
```

---

## 📁 Struktura AZD projekta

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
| `azd deploy` | Implementiraj kod aplikacije |
| `azd up` | pripremi + implementiraj |
| `azd down` | Izbriši sve resurse |

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Sljedeće** | [Poglavlje 5: Rješenja s više agenata](../chapter-05-multi-agent/README.md) |

---

## 📖 Povezani resursi

- [Provjere prije implementacije](../chapter-06-pre-deployment/README.md)
- [Primjeri aplikacija u spremnicima](../../examples/container-app/README.md)
- [Primjer aplikacije baze podataka](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
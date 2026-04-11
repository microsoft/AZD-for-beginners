# Poglavlje 4: Infrastruktura kao kod i implementacija

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 1-1.5 sati | **⭐ Složenost**: Srednja

---

## Pregled

Ovo poglavlje pokriva obrasce Infrastrukture kao koda (IaC) s Bicep predlošcima, upravljanje resursima i strategije implementacije korištenjem Azure Developer CLI.

> Validirano na `azd 1.23.12` u ožujku 2026.

## Ciljevi učenja

Nakon završetka ovog poglavlja, moći ćete:
- Razumjeti strukturu i sintaksu Bicep predložaka
- Upravljati Azure resursima s `azd provision`
- Implementirati aplikacije s `azd deploy`
- Primijeniti blue-green i rolling strategije implementacije

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Provisioniranje resursa](provisioning.md) | Upravljanje Azure resursima s AZD | 45 min |
| 2 | [Vodič za implementaciju](deployment-guide.md) | Strategije implementacije aplikacija | 45 min |

---

## 🚀 Brzi početak

```bash
# Inicijaliziraj iz predloška
azd init --template azure-functions-python-v2-http

# Pregledaj što će biti stvoreno
azd provision --preview

# Samo pripremi infrastrukturu
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
| `azd provision` | Stvori Azure resurse |
| `azd deploy` | Implementiraj kod aplikacije |
| `azd up` | provision + deploy |
| `azd down` | Izbriši sve resurse |

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Sljedeće** | [Poglavlje 5: Multi-agent rješenja](../chapter-05-multi-agent/README.md) |

---

## 📖 Povezani resursi

- [Provjere prije implementacije](../chapter-06-pre-deployment/README.md)
- [Primjeri Container App](../../examples/container-app/README.md)
- [Primjer Database App](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden koristeći AI servis za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakva nesporazume ili krive interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
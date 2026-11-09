# Poglavlje 4: Infrastruktura kao kod i implementacija

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 2-3 sata čitanja; dopustite dodatno vrijeme za vježbe implementacije | **⭐ Složenost**: Srednja razina

---

## Pregled

Ovo poglavlje pokriva obrasce Infrastrukture kao koda (IaC) s Bicep predlošcima, upravljanje resursima i strategije implementacije koristeći Azure Developer CLI.

> Cilj pregleda naredbi i konfiguracija: `azd 1.37.2` (studeni 2026). Tijekom pregleda nije pokretano stvarno Azure provisioniranje.

## Ciljevi učenja

Završetkom ovog poglavlja naučit ćete:
- Razumjeti strukturu i sintaksu Bicep predložaka
- Provisionirati Azure resurse s `azd provision`
- Implementirati aplikacije s `azd deploy`
- Primijeniti blue-green i rolling strategije implementacije

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Provisioniranje resursa](provisioning.md) | Upravljanje Azure resursima s AZD | 45 min |
| 2 | [Vodič za implementaciju](deployment-guide.md) | Strategije implementacije aplikacija | 45 min |
| 3 | [Izrada vlastitog predloška](custom-templates.md) | Izrada i objavljivanje ponovo upotrebljivih azd predložaka | 30 min |

---

## 🚀 Brzi početak

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
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
| `azd init` | Inicijalizacija projekta |
| `azd provision` | Kreiranje Azure resursa |
| `azd deploy` | Implementacija koda aplikacije |
| `azd up` | provisioniranje + implementacija |
| `azd down` | Brisanje svih resursa |

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Sljedeće** | [Poglavlje 5: Više-agentna rješenja](../chapter-05-multi-agent/README.md) |

---

## 📖 Povezani resursi

- [Provjere prije implementacije](../chapter-06-pre-deployment/README.md)
- [Primjeri Container App](../../examples/container-app/README.md)
- [Primjer baze podataka aplikacije](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
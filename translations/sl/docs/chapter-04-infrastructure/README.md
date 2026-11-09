# Poglavje 4: Infrastruktura kot koda in namestitev

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 2-3 ure branja; omogočite dodatni čas za vaje namestitve | **⭐ Kompleksnost**: Srednja

---

## Pregled

To poglavje pokriva vzorce Infrastructure as Code (IaC) z Bicep predlogami, zagotavljanje virov ter strategije namestitve z uporabo Azure Developer CLI.

> Cilj pregleda ukazov in konfiguracije: `azd 1.37.2` (november 2026). Med pregledom ni bilo izvedeno živo zagotavljanje Azure.

## Cilji učenja

Z opravljenim poglavljem boste:
- Razumeli strukturo in sintakso Bicep predloge
- Zagotovili Azure vire z `azd provision`
- Namestili aplikacije z `azd deploy`
- Izvajali modro-zeleno in postopno strategijo namestitve

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Zagotovitev virov](provisioning.md) | Upravljanje Azure virov z AZD | 45 min |
| 2 | [Vodnik po namestitvi](deployment-guide.md) | Strategije namestitve aplikacij | 45 min |
| 3 | [Ustvarjanje lastne predloge](custom-templates.md) | Gradnja in objava večkrat uporabnih predlog azd | 30 min |

---

## 🚀 Hitri začetek

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

## 🔧 Osnovni ukazi

| Ukaz | Opis |
|---------|-------------|
| `azd init` | Inicializirajte projekt |
| `azd provision` | Ustvarite Azure vire |
| `azd deploy` | Namestite kodo aplikacije |
| `azd up` | zagotavljanje + namestitev |
| `azd down` | Izbrišite vse vire |

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Naslednje** | [Poglavje 5: Večagentne rešitve](../chapter-05-multi-agent/README.md) |

---

## 📖 Povezani viri

- [Preverjanja pred namestitvijo](../chapter-06-pre-deployment/README.md)
- [Primeri aplikacij v vsebniku](../../examples/container-app/README.md)
- [Primer aplikacije s podatkovno bazo](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
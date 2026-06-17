# Poglavje 4: Infrastruktura kot koda & Razmestitev

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-1.5 hours | **⭐ Complexity**: Intermediate

---

## Pregled

To poglavje obravnava vzorce Infrastrukture kot Kode (IaC) z Bicep predlogami, zagotavljanje virov in strategije razmestitve z uporabo Azure Developer CLI.

> Preverjeno z `azd 1.25.6` junija 2026.

## Cilji učenja

Z dokončanjem tega poglavja boste:
- Razumeli strukturo in sintakso Bicep predlog
- Ustvarili Azure vire z `azd provision`
- Razmestili aplikacije z `azd deploy`
- Uvedli strategiji razmestitve blue-green in rolling

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | Upravljanje Azure virov z AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | Strategije razmestitve aplikacij | 45 min |
| 3 | [Authoring Your Own Template](custom-templates.md) | Gradnja in objava ponovno uporabnih azd predlog | 30 min |

---

## 🚀 Hiter začetek

```bash
# Inicializiraj iz predloge
azd init --template azure-functions-python-v2-http

# Predogled tega, kar bo ustvarjeno
azd provision --preview

# Vzpostavi le infrastrukturo
azd provision

# Razporedi le kodo
azd deploy

# Ali oboje skupaj
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
| `azd deploy` | Razmestite kodo aplikacije |
| `azd up` | ustvarjanje + razmestitev |
| `azd down` | Izbrišite vse vire |

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Naslednje** | [Poglavje 5: Večagentne rešitve](../chapter-05-multi-agent/README.md) |

---

## 📖 Sorodni viri

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Container App Examples](../../examples/container-app/README.md)
- [Database App Example](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
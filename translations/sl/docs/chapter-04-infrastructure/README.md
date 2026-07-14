# Poglavje 4: Infrastruktura kot koda & Razmestitev

**📚 Tečaj**: [AZD Za začetnike](../../README.md) | **⏱️ Trajanje**: 1-1,5 ure | **⭐ Kompleksnost**: Srednja

---

## Pregled

To poglavje obravnava vzorce infrastrukture kot kode (IaC) z Bicep predlogami, zagotavljanje virov in strategije razmestitve z uporabo Azure Developer CLI.

> Preverjeno z `azd 1.27.1` julija 2026.

## Cilji učenja

Z dokončanjem tega poglavja boste:
- Razumeli strukturo in sintakso Bicep predlog
- Zagotavljali Azure vire z `azd provision`
- Razmestili aplikacije z `azd deploy`
- Implementirali blue-green in rolling strategije razmestitve

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Zagotavljanje virov](provisioning.md) | Upravljanje Azure virov z AZD | 45 min |
| 2 | [Vodnik za razmestitev](deployment-guide.md) | Strategije razmestitve aplikacij | 45 min |
| 3 | [Ustvarjanje lastne predloge](custom-templates.md) | Gradnja in objava ponovno uporabnih azd predlog | 30 min |

---

## 🚀 Hiter začetek

```bash
# Inicializiraj iz predloge
azd init --template azure-functions-python-v2-http

# Predogled, kaj bo ustvarjeno
azd provision --preview

# Samo zagotovitev infrastrukture
azd provision

# Samo namestitev kode
azd deploy

# Ali oboje skupaj
azd up
```

---

## 📁 Struktura projektov AZD

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
| `azd init` | Inicializiraj projekt |
| `azd provision` | Ustvari Azure vire |
| `azd deploy` | Razmestitev kode aplikacije |
| `azd up` | zagotavljanje + razmestitev |
| `azd down` | Izbriši vse vire |

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Naslednje** | [Poglavje 5: Večagentne rešitve](../chapter-05-multi-agent/README.md) |

---

## 📖 Povezani viri

- [Preverjanja pred razmestitvijo](../chapter-06-pre-deployment/README.md)
- [Primeri aplikacij z vsebniki](../../examples/container-app/README.md)
- [Primer aplikacije z bazo podatkov](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
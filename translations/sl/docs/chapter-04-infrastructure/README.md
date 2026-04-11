# Poglavje 4: Infrastruktura kot koda in nameščanje

**📚 Tečaj**: [AZD For Beginners](../../README.md) | **⏱️ Trajanje**: 1-1.5 ure | **⭐ Kompleksnost**: Srednje

---

## Pregled

To poglavje obravnava vzorce Infrastrukture kot kode (IaC) z Bicep predlogami, zagotavljanje virov in strategije nameščanja z uporabo Azure Developer CLI.

> Preverjeno z `azd 1.23.12` marca 2026.

## Cilji učenja

Po zaključku tega poglavja boste:
- Razumeti strukturo in sintakso Bicep predlog
- Ustvariti Azure vire z ukazom `azd provision`
- Namestiti aplikacije z ukazom `azd deploy`
- Izvesti blue-green in rolling strategije nameščanja

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | Upravljanje Azure virov z AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | Strategije nameščanja aplikacij | 45 min |

---

## 🚀 Hiter začetek

```bash
# Inicializiraj iz predloge
azd init --template azure-functions-python-v2-http

# Predogled tega, kar bo ustvarjeno
azd provision --preview

# Samo vzpostavi infrastrukturo
azd provision

# Samo razporedi kodo
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
| `azd init` | Inicializiraj projekt |
| `azd provision` | Ustvari Azure vire |
| `azd deploy` | Namesti kodo aplikacije |
| `azd up` | zagotovi + namesti |
| `azd down` | Izbriši vse vire |

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Naslednje** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

---

## 📖 Povezani viri

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Container App Examples](../../examples/container-app/README.md)
- [Database App Example](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas opozarjamo, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba šteti za avtoritativni vir. Za kritične informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
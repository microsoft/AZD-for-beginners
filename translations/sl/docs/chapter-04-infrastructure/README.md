# Poglavje 4: Infrastruktura kot koda in razmestitev

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 1–1,5 ure | **⭐ Zahtevnost**: Srednja

---

## Pregled

To poglavje zajema vzorce Infrastrukture kot kode (IaC) z Bicep predlogami, vzpostavljanje virov in strategije razmestitve z uporabo Azure Developer CLI.

## Cilji učenja

Z dokončanjem tega poglavja boste:
- Razumeli strukturo in sintakso Bicep predlog
- Ustvarili Azure vire z `azd provision`
- Razmestili aplikacije z `azd deploy`
- Izvedli blue-green in rolling strategije razmestitve

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Vzpostavljanje virov](provisioning.md) | Upravljanje Azure virov z AZD | 45 min |
| 2 | [Vodnik za razmestitev](deployment-guide.md) | Strategije razmestitve aplikacij | 45 min |

---

## 🚀 Hiter začetek

```bash
# Inicializiraj iz predloge
azd init --template azure-functions-python-v2-http

# Predogled, kaj bo ustvarjeno
azd provision --preview

# Samo zagotovi infrastrukturo
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
| `azd deploy` | Razmestiti kodo aplikacije |
| `azd up` | vzpostavitev + razmestitev |
| `azd down` | Izbriši vse vire |

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Naslednje** | [Poglavje 5: Rešitve z več agenti](../chapter-05-multi-agent/README.md) |

---

## 📖 Povezani viri

- [Preverjanja pred razmestitvijo](../chapter-06-pre-deployment/README.md)
- [Primeri Container App](../../examples/container-app/README.md)
- [Primer aplikacije z bazo podatkov](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden s storitvijo za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas opozarjamo, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku velja za avtoritativni vir. Za kritične informacije priporočamo strokovni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazuma ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
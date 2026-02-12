# Chapta 4: Infrastructure as Code & Deployment

**📚 Kɔɔs**: [AZD For Beginners](../../README.md) | **⏱️ Taim**: 1-1.5 hours | **⭐ Kompleksiti**: Medium

---

## Wetin Dis Chapta Dey Cover

Dis chapta go cover Infrastructure as Code (IaC) patern dem wit Bicep templates, resource provisioning, an deployment strategies wey dey use Azure Developer CLI.

## Wetin You Go Learn

If you finish dis chapta, you go:
- Sabi Bicep template structure and syntax
- Provision Azure resource dem with `azd provision`
- Deploy application dem with `azd deploy`
- Implement blue-green and rolling deployment strategies

---

## 📚 Lesons

| # | Leson | Tok | Taim |
|---|--------|-------------|------|
| 1 | [Provision Resource dem](provisioning.md) | Azure resource management wit AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | Application deployment strategies | 45 min |

---

## 🚀 Quick Start

```bash
# Set up from di template
azd init --template azure-functions-python-v2-http

# Preview wetin dem go create
azd provision --preview

# Just set up di infrastructure
azd provision

# Just deploy di code
azd deploy

# Or do both togeda
azd up
```

---

## 📁 AZD Project Struktur

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

## 🔧 Essential Commands

| Command | Description |
|---------|-------------|
| `azd init` | Set up project |
| `azd provision` | Create Azure resource dem |
| `azd deploy` | Deploy application code |
| `azd up` | provision + deploy |
| `azd down` | Delete all resource dem |

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapta 3: Configuration](../chapter-03-configuration/README.md) |
| **Next** | [Chapta 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

---

## 📖 Related Resources

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Container App Examples](../../examples/container-app/README.md)
- [Database App Example](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dis dokument don translate by AI translation service Co-op Translator (https://github.com/Azure/co-op-translator). Even though we dey try make am correct, abeg make you sabi sey automated translations fit get mistakes or no correct finish. Di original dokument for im original language suppose be di main authority. For important matter, e better make professional human translator check am. We no dey liable for any misunderstanding or wrong interpretation wey fit come from using dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
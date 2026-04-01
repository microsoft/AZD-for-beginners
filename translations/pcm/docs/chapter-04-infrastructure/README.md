# Chapter 4: Infrastructure as Code & Deployment

**📚 Kọs**: [AZD For Beginners](../../README.md) | **⏱️ Taim**: 1-1.5 hours | **⭐ Komplesiti**: Medium

---

## Wetin dis chapter dey cover

Dis chapter go show Infrastructure as Code (IaC) patterns wit Bicep templates, how to provision resources, an deployment strategies wey you fit use wit Azure Developer CLI.

> Dem validate am wit `azd 1.23.12` for March 2026.

## Wetin You Go Learn

By finish dis chapter, you go:
- Understand how Bicep templates take arrangement and how the syntax dey work
- Provision Azure resources with `azd provision`
- Deploy application dem with `azd deploy`
- Implement blue-green and rolling deployment strategies

---

## 📚 Lekshon dem

| # | Lekshon | Tok | Taim |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | How to manage Azure resources wit AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | Strategy wey you go take deploy apps | 45 min |

---

## 🚀 Quick Start

```bash
# Start from di template
azd init --template azure-functions-python-v2-http

# See wetin dem go create
azd provision --preview

# Just set up di infrastructure
azd provision

# Just deploy di code
azd deploy

# Or do both together
azd up
```

---

## 📁 AZD Project Structure

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

## 🔧 Commands Wey You Need

| Command | Description |
|---------|-------------|
| `azd init` | Initialize di project |
| `azd provision` | Create Azure resources |
| `azd deploy` | Deploy di app code |
| `azd up` | provision + deploy |
| `azd down` | Delete all resources |

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Next** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

---

## 📖 Related Resources

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Container App Examples](../../examples/container-app/README.md)
- [Database App Example](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis dokument don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am accurate, abeg sabi say automated translations fit get errors or inaccuracies. Di original dokument for im native language suppose be di authoritative source. If na critical information, we recommend make professional human translator do am. We no dey liable for any misunderstanding or misinterpretation wey fit arise from di use of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
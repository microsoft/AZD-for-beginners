# Chapter 4: Infrastructure as Code & Deployment

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-1.5 hours | **⭐ Complexity**: Intermediate

---

## Overview

Dis chapter go cover Infrastructure as Code (IaC) patterns wit Bicep templates, how to provision resources, and deployment strategies usin the Azure Developer CLI.

> Dem don validate am wit `azd 1.25.6` for June 2026.

## Learning Objectives

If you finish dis chapter, you go:
- Understand how Bicep templates dey structured and how di syntax be
- Provision Azure resources wit `azd provision`
- Deploy application dem wit `azd deploy`
- Use blue-green and rolling deployment strategies

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | Manage Azure resources wit AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | Strategies for deployin application dem | 45 min |
| 3 | [Authoring Your Own Template](custom-templates.md) | Build and publish reusable azd templates | 30 min |

---

## 🚀 Quick Start

```bash
# Start from di template
azd init --template azure-functions-python-v2-http

# Preview wetin dem go create
azd provision --preview

# Set up di infrastructure only
azd provision

# Deploy di code only
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

## 🔧 Essential Commands

| Command | Description |
|---------|-------------|
| `azd init` | Set up di project |
| `azd provision` | Create Azure resources |
| `azd deploy` | Deploy di application code |
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
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
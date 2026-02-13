# Chapter 3: Konfigureshon & Autentikeshon

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 45-60 minutes | **⭐ Complexity**: Medium

---

## Wetin Dis Chapter Dey Cover

Dis chapter go cover environment konfigureshon, autentikeshon patterns, and security best practices for Azure Developer CLI deployments.

## Wetin You Go Learn

If you complete dis chapter, you go:
- Master the AZD konfigureshon hierarchy
- Manage plenty environments (dev, staging, prod)
- Implement secure autentikeshon with managed identities
- Konfigure environment-specific settings

---

## 📚 Lekshon dem

| # | Lekshon | Description | Taim |
|---|--------|-------------|------|
| 1 | [Konfigureshon Guide](configuration.md) | How to set up and manage environment | 30 min |
| 2 | [Autentikeshon & Sekyuriti](authsecurity.md) | Managed identity and RBAC patterns | 30 min |

---

## 🚀 Quick Start

```bash
# Make plenty environment dem
azd env new dev
azd env new staging
azd env new prod

# Switch between environment dem
azd env select prod

# Set environment variables dem
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# See di configuration
azd env get-values
```

---

## 🔧 Konfigureshon Hierarchy

AZD go apply settings for dis order (wey later go override earlier):

1. **Default values** (wey dey inside templates)
2. **azure.yaml** (project konfigureshon)
3. **Environment variables** (`azd env set`)
4. **Command-line flags** (`--location eastus`)

---

## 🔐 Best Practices for Security

```bash
# Use managed identity (na di recommended)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Check di authentication status
azd auth whoami
az account show

# Authenticate again if e need am
azd auth login
az login
```

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 2: AI Development](../chapter-02-ai-development/README.md) |
| **Next** | [Chapter 4: Infrastructure](../chapter-04-infrastructure/README.md) |

---

## 📖 Related Resources

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:

Dis dokument don translate by AI translation service (Co-op Translator: https://github.com/Azure/co-op-translator). We dey try make am correct, but abeg sabi say automatic translations fit get mistakes or no too accurate. The original dokument wey dey the original language na the official source wey you suppose rely on. For critical or important information, we recommend say person wey sabi human translator do am. We no dey liable for any misunderstandings or misinterpretations wey fit arise from dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
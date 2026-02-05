# Chapter 4: Infrastructure as Code & Deployment

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-1.5 hours | **⭐ Complexity**: Intermediate

---

## Overview

This chapter covers Infrastructure as Code (IaC) patterns with Bicep templates, resource provisioning, and deployment strategies using Azure Developer CLI.

## Learning Objectives

By completing this chapter, you will:
- Understand Bicep template structure and syntax
- Provision Azure resources with `azd provision`
- Deploy applications with `azd deploy`
- Implement blue-green and rolling deployment strategies

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | Azure resource management with AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | Application deployment strategies | 45 min |

---

## 🚀 Quick Start

```bash
# Initialize from template
azd init --template azure-functions-python-v2-http

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
| `azd init` | Initialize project |
| `azd provision` | Create Azure resources |
| `azd deploy` | Deploy application code |
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

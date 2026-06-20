# 第7章：故障排除与调试

**📚 课程**: [AZD 入门](../../README.md) | **⏱️ 时长**: 1-1.5 小时 | **⭐ 难度**: 中级

---

## 概述

本章帮助您诊断并解决使用 Azure Developer CLI 时常见的问题，涵盖从部署失败到 AI 特定的问题。

> 已在 2026 年 6 月使用 `azd 1.25.6` 验证。

## 学习目标

完成本章后，您将：
- 诊断常见的 AZD 部署失败
- 调试身份验证和权限问题
- 解决 AI 服务连接问题
- 使用 Azure 门户和 CLI 进行故障排查

---

## 📚 课程

| # | 课程 | 描述 | 时长 |
|---|--------|-------------|------|
| 1 | [常见问题](common-issues.md) | 经常遇到的问题 | 30 分钟 |
| 2 | [调试指南](debugging.md) | 逐步调试策略 | 45 分钟 |
| 3 | [AI 故障排除](ai-troubleshooting.md) | AI 特定问题 | 30 分钟 |

---

## 🚨 快速修复

### 身份验证问题
```bash
# AZD 工作流所必需
azd auth login

# 如果您也直接使用 Azure CLI 命令，则可选
az login

azd auth status
```

### 预配失败
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### 资源冲突
```bash
azd down --force --purge
azd env new different-name
azd up
```

### 配额超限
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 错误代码参考

| 错误 | 原因 | 解决方案 |
|-------|-------|----------|
| `AuthenticationError` | 未登录 | `azd auth login` |
| `ResourceNotFound` | 找不到资源 | 检查资源名称 |
| `QuotaExceeded` | 订阅限制 | 申请增加配额 |
| `InvalidTemplate` | Bicep 语法错误 | `az bicep build` |
| `Conflict` | 资源已存在 | 使用新名称或删除 |
| `Forbidden` | 权限不足 | 检查 RBAC 角色 |

---

## 🔄 重置与恢复

```bash
# 软重置（保留资源，重新部署代码）
azd deploy --force

# 硬重置（删除所有内容，重新开始）
azd down --force --purge
azd up
```

---

## 🔗 导航

| 方向 | 章节 |
|-----------|---------|
| <strong>上一章</strong> | [第6章：部署前](../chapter-06-pre-deployment/README.md) |
| <strong>下一章</strong> | [第8章：生产环境](../chapter-08-production/README.md) |

---

## 📖 相关资源

- [部署前检查](../chapter-06-pre-deployment/preflight-checks.md)
- [配置指南](../chapter-03-configuration/configuration.md)
- [AZD GitHub 问题](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
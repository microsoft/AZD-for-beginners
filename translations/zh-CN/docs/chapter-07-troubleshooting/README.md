# 第7章：故障排除与调试

**📚 课程**: [入门AZD](../../README.md) | **⏱️ 时长**: 1-1.5小时 | **⭐ 复杂度**: 中级

---

## 概述

本章帮助您诊断并解决使用Azure Developer CLI时常见的问题。从部署失败到AI特定问题。

> 命令指导根据发布的`azd 1.37.2`参考进行复核。未执行云部署。使用命令前请替换示例资源名称和ID。

## 学习目标

完成本章后，您将能够：
- 诊断常见的AZD部署失败
- 调试身份验证与权限问题
- 解决AI服务连接问题
- 使用Azure门户和CLI进行故障排除

---

## 📚 课程

| # | 课程 | 描述 | 时间 |
|---|--------|-------------|------|
| 1 | [常见问题](common-issues.md) | 常见问题 | 30分钟 |
| 2 | [调试指南](debugging.md) | 逐步调试策略 | 45分钟 |
| 3 | [AI故障排除](ai-troubleshooting.md) | AI特定问题 | 30分钟 |

---

## 🚨 快速解决方法

### 身份验证问题
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### 资源配置失败
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### 资源冲突
请先检查现有资源和部署错误。不要删除共享或生产环境以解决命名冲突。对于<strong>新的一次性环境</strong>，请使用唯一名称：

```bash
azd env new different-name
azd up
```

### 配额超限
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

更改`AZURE_LOCATION`不会移动现有资源，且可能导致重新部署时的位置冲突。

---

## 📋 错误代码参考

| 错误 | 原因 | 解决方案 |
|-------|-------|----------|
| `AuthenticationError` | 未登录 | `azd auth login` |
| `ResourceNotFound` | 资源缺失 | 检查资源名称 |
| `QuotaExceeded` | 订阅限制 | 申请配额增加 |
| `InvalidTemplate` | Bicep语法错误 | `az bicep build` |
| `Conflict` | 资源已存在 | 使用新名称或删除 |
| `Forbidden` | 权限不足 | 检查RBAC角色 |

---

## 🔄 重置与恢复

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

硬重置会删除数据并可能更改端点。请先备份并仔细查看交互式删除提示。`--force --purge`只适用于打算进行不可逆删除的一次性环境。

---

## 🔗 导航

| 方向 | 章节 |
|-----------|---------|
| <strong>上一章</strong> | [第6章：部署前准备](../chapter-06-pre-deployment/README.md) |
| <strong>下一章</strong> | [第8章：生产环境](../chapter-08-production/README.md) |

---

## 📖 相关资源

- [部署前检查](../chapter-06-pre-deployment/preflight-checks.md)
- [配置指南](../chapter-03-configuration/configuration.md)
- [AZD GitHub问题](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
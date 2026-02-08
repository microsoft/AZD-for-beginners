# 第3章: 配置与身份验证

**📚 课程**: [AZD 入门](../../README.md) | **⏱️ 时长**: 45-60 分钟 | **⭐ 难度**: 中等

---

## 概述

本章涵盖 Azure Developer CLI 部署的环境配置、身份验证模式和安全最佳实践。

## 学习目标

完成本章后，您将：
- 掌握 AZD 的配置层级
- 管理多个环境 (dev, staging, prod)
- 使用托管身份实现安全认证
- 配置特定环境的设置

---

## 📚 课程

| # | 课程 | 描述 | 时间 |
|---|--------|-------------|------|
| 1 | [配置指南](configuration.md) | 环境设置与管理 | 30 分钟 |
| 2 | [身份验证与安全](authsecurity.md) | 托管身份和 RBAC 模式 | 30 分钟 |

---

## 🚀 快速开始

```bash
# 创建多个环境
azd env new dev
azd env new staging
azd env new prod

# 切换环境
azd env select prod

# 设置环境变量
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# 查看配置
azd env get-values
```

---

## 🔧 配置层级

AZD 按照以下顺序应用设置（后者覆盖前者）：

1. **默认值** (内置于模板中)
2. **azure.yaml** (项目配置)
3. **环境变量** (`azd env set`)
4. **命令行标志** (`--location eastus`)

---

## 🔐 安全最佳实践

```bash
# 使用托管身份（推荐）
azd env set AZURE_USE_MANAGED_IDENTITY true

# 检查身份验证状态
azd auth whoami
az account show

# 如有需要请重新进行身份验证
azd auth login
az login
```

---

## 🔗 导航

| 方向 | 章节 |
|-----------|---------|
| **上一章** | [第2章: AI 开发](../chapter-02-ai-development/README.md) |
| **下一章** | [第4章: 基础设施](../chapter-04-infrastructure/README.md) |

---

## 📖 相关资源

- [部署前检查](../chapter-06-pre-deployment/README.md)
- [故障排除](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件已通过 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们尽力确保准确性，但请注意自动翻译可能包含错误或不准确之处。源语言的原始文档应被视为权威版本。对于重要信息，建议采用专业人工翻译。我们不对因使用本翻译而产生的任何误解或曲解承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
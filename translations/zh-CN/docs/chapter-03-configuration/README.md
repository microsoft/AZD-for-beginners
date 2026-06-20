# 第 3 章：配置与身份验证

**📚 课程**: [AZD 入门](../../README.md) | **⏱️ Duration**: 45-60 分钟 | **⭐ Complexity**: 中级

---

## 概览

本章涵盖 Azure Developer CLI 部署的环境配置、身份验证模式和安全最佳实践。

> 已在 2026 年 6 月使用 `azd 1.25.6` 验证。

## 学习目标

完成本章后，您将：
- 掌握 AZD 配置层次结构
- 管理多个环境（dev、staging、prod）
- 使用托管标识实现安全身份验证
- 配置特定于环境的设置

---

## 📚 课程

| # | 课程 | 描述 | 时间 |
|---|--------|-------------|------|
| 1 | [配置指南](configuration.md) | 环境设置与管理 | 30 分钟 |
| 2 | [身份验证与安全](authsecurity.md) | 托管标识和 RBAC 模式 | 30 分钟 |

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

## 🔧 配置层次结构

AZD 按以下顺序应用设置（后者覆盖前者）：

1. <strong>默认值</strong> (内置于模板中)
2. **azure.yaml** (项目配置)
3. <strong>环境变量</strong> (`azd env set`)
4. <strong>命令行标志</strong> (`--location eastus`)

---

## 🔐 安全最佳实践

```bash
# 使用托管标识（推荐）
azd env set AZURE_USE_MANAGED_IDENTITY true

# 检查 AZD 身份验证状态
azd auth status

# 可选：如果计划运行 az 命令，请验证 Azure CLI 上下文
az account show

# 如有必要，重新进行身份验证
azd auth login

# 可选：为 az 命令刷新 Azure CLI 身份验证
az login
```

---

## 🔗 导航

| 方向 | 章节 |
|-----------|---------|
| <strong>上一章</strong> | [第 2 章：AI 开发](../chapter-02-ai-development/README.md) |
| <strong>下一章</strong> | [第 4 章：基础设施](../chapter-04-infrastructure/README.md) |

---

## 📖 相关资源

- [部署前检查](../chapter-06-pre-deployment/README.md)
- [故障排除](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
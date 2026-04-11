# 第4章：基础设施即代码与部署

**📚 课程**: [AZD 入门](../../README.md) | **⏱️ 时长**: 1-1.5 小时 | **⭐ 复杂度**: 中级

---

## 概览

本章涵盖使用 Bicep 模板的基础设施即代码 (IaC) 模式、资源预配以及使用 Azure Developer CLI 的部署策略。

> 于 2026 年 3 月针对 `azd 1.23.12` 进行了验证。

## 学习目标

完成本章后，您将能够：
- 了解 Bicep 模板的结构和语法
- 使用 `azd provision` 预配 Azure 资源
- 使用 `azd deploy` 部署应用程序
- 实施蓝绿和滚动部署策略

---

## 📚 课程

| # | 课程 | 描述 | 时间 |
|---|--------|-------------|------|
| 1 | [资源预配](provisioning.md) | 使用 AZD 管理 Azure 资源 | 45 分钟 |
| 2 | [部署指南](deployment-guide.md) | 应用部署策略 | 45 分钟 |

---

## 🚀 快速开始

```bash
# 从模板初始化
azd init --template azure-functions-python-v2-http

# 预览将要创建的内容
azd provision --preview

# 仅配置基础设施
azd provision

# 仅部署代码
azd deploy

# 或两者一起
azd up
```

---

## 📁 AZD 项目结构

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

## 🔧 常用命令

| Command | Description |
|---------|-------------|
| `azd init` | 初始化项目 |
| `azd provision` | 创建 Azure 资源 |
| `azd deploy` | 部署应用代码 |
| `azd up` | 预配 + 部署 |
| `azd down` | 删除所有资源 |

---

## 🔗 导航

| Direction | Chapter |
|-----------|---------|
| <strong>上一章</strong> | [第3章：配置](../chapter-03-configuration/README.md) |
| <strong>下一章</strong> | [第5章：多代理解决方案](../chapter-05-multi-agent/README.md) |

---

## 📖 相关资源

- [部署前检查](../chapter-06-pre-deployment/README.md)
- [容器应用示例](../../examples/container-app/README.md)
- [数据库应用示例](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们力求准确，但请注意自动翻译可能包含错误或不准确之处。原始语言的原文应被视为权威来源。对于重要信息，建议采用专业人工翻译。我们不对因使用本翻译而产生的任何误解或误释承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
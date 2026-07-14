# 第4章：基础设施即代码与部署

**📚 课程**：[初学者的AZD](../../README.md) | **⏱️ 时长**：1-1.5小时 | **⭐ 复杂度**：中级

---

## 概述

本章涵盖使用Bicep模板的基础设施即代码（IaC）模式，资源配置和使用Azure Developer CLI的部署策略。

> 已使用 `azd 1.27.1` 于2026年7月验证。

## 学习目标

完成本章后，您将能够：
- 理解Bicep模板结构和语法
- 使用 `azd provision` 配置Azure资源
- 使用 `azd deploy` 部署应用
- 实现蓝绿部署和滚动部署策略

---

## 📚 课程列表

| # | 课程 | 描述 | 时长 |
|---|--------|-------------|------|
| 1 | [资源配置](provisioning.md) | 使用AZD管理Azure资源 | 45分钟 |
| 2 | [部署指南](deployment-guide.md) | 应用部署策略 | 45分钟 |
| 3 | [编写自定义模板](custom-templates.md) | 构建并发布可重用的azd模板 | 30分钟 |

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

# 或两者一起进行
azd up
```

---

## 📁 AZD项目结构

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

## 🔧 基本命令

| 命令 | 描述 |
|---------|-------------|
| `azd init` | 初始化项目 |
| `azd provision` | 创建Azure资源 |
| `azd deploy` | 部署应用代码 |
| `azd up` | 配置 + 部署 |
| `azd down` | 删除所有资源 |

---

## 🔗 导航

| 方向 | 章节 |
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
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
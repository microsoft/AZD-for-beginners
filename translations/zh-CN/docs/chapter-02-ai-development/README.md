# 第二章：AI优先开发

**📚 课程**：[AZD 入门](../../README.md) | **⏱️ 时长**：包括研讨会在内约4-5小时 | **⭐ 复杂度**：中级

---

## 概述

本章聚焦于使用 Azure Developer CLI 和 Microsoft Foundry 服务部署 AI 驱动的应用程序。从简单的 AI 聊天应用到带有工具的智能代理。

> **版本审查 (2026-11-04)：** AI CLI 指南已经与发布的 `azd` `1.37.2`、`azure.ai.agents` `1.0.0-beta.23` 和 `azure.ai.evaluations` `1.0.0-beta.2` 文档/源码进行了核对。组合工作流使用 `azd >= 1.37.0`。评估现在使用独立的 `azd ai eval` 命名空间；详见[版本变更和迁移指南](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes)。这不是实时部署验证。

## 学习目标

完成本章后，您将能够：
- 使用预构建的 AZD 模板部署 AI 应用
- 理解 Microsoft Foundry 与 AZD 的集成
- 配置并自定义带工具的 AI 代理
- 部署 RAG（检索增强生成）应用

---

## 📚 课程

| # | 课程 | 描述 | 时间 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry 集成](microsoft-foundry-integration.md) | 连接 AZD 与 Foundry 服务 | 30 分钟 |
| 2 | [AI 代理指南](agents.md) | 使用工具部署智能代理 | 45 分钟 |
| 3 | [AI 模型部署](ai-model-deployment.md) | 部署并配置 AI 模型 | 30 分钟 |
| 4 | [AI 实验室](ai-workshop-lab.md) | 实操：探索模板并规划您的转换 | 2-3 小时 |

---

## 🚀 快速开始

选择一个选项在一个新的空目录中。尾随的`.`会初始化当前目录；否则，AZD可以创建一个子目录而不更改shell的工作目录。

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 精选 AI 模板

| 模板 | 描述 | 服务 |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 带引用的RAG聊天 | OpenAI + AI搜索 |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | 具备工具的AI代理 | AI代理服务 |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 基础AI聊天 | OpenAI + 容器应用 |

---

## 💰 成本意识

这些是示意范围，不是报价或上限；模型流量、搜索/计算SKU、区域和可选功能可能超出这些范围。请在配置前查看您选择的示例的当前定价指南。

| 环境 | 预计月成本 |
|-------------|----------------------|
| 开发 | $80-150 |
| 预发布 | $150-300 |
| 生产 | $300-3,500+ |

**提示：** 测试后运行`azd down`以避免收费。

---

## 🔗 导航

| 方向 | 章节 |
|-----------|---------|
| <strong>上一步</strong> | [第1章：基础](../chapter-01-foundation/README.md) |
| <strong>下一步</strong> | [第3章：配置](../chapter-03-configuration/README.md) |
| <strong>跳转到</strong> | [第8章：生产模式](../chapter-08-production/README.md) |

---

## 📖 相关资源

- [AI故障排除](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [生产环境 AI 实践](../chapter-08-production/production-ai-practices.md)
- [应用程序洞察](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 第2章：以 AI 为先的开发

**📚 课程**: [AZD 入门](../../README.md) | **⏱️ 时长**: 1-2 小时 | **⭐ 难度**: 中级

---

## 概述

本章重点介绍如何使用 Azure Developer CLI 和 Microsoft Foundry 服务来部署 AI 驱动的应用程序。从简单的 AI 聊天应用到带工具的智能代理。

> **验证说明（2026-03-25）：** 本章中的命令流程和扩展指引已根据 `azd` `1.23.12` 及当前预览 AI agent 扩展发布 `azure.ai.agents` `0.1.18-preview` 进行审核。如果你使用的是较旧的 AZD 构建，请先更新然后继续练习。

## 学习目标

完成本章后，你将能够：
- 使用预构建的 AZD 模板部署 AI 应用
- 理解 Microsoft Foundry 与 AZD 的集成
- 配置并自定义带工具的 AI 代理
- 部署 RAG（检索增强生成）应用

---

## 📚 课程

| # | 课程 | 描述 | 时长 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry 集成](microsoft-foundry-integration.md) | 将 AZD 连接到 Foundry 服务 | 30 分钟 |
| 2 | [AI 代理 指南](agents.md) | 使用工具部署智能代理 | 45 分钟 |
| 3 | [AI 模型部署](ai-model-deployment.md) | 部署和配置 AI 模型 | 30 分钟 |
| 4 | [AI 研讨会实验室](ai-workshop-lab.md) | 动手实践：让你的 AI 解决方案适配 AZD | 60 分钟 |

---

## 🚀 快速开始

```bash
# 选项 1：RAG（检索增强生成）聊天应用
azd init --template azure-search-openai-demo
azd up

# 选项 2：AI 代理
azd init --template get-started-with-ai-agents
azd up

# 选项 3：快速聊天应用
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 精选 AI 模板

| 模板 | 描述 | 服务 |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 带引用的 RAG 聊天 | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | 带工具的 AI 代理 | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 基础 AI 聊天 | OpenAI + Container Apps |

---

## 💰 成本意识

| 环境 | 估计月成本 |
|-------------|----------------------|
| 开发 | $80-150 |
| 预发布 | $150-300 |
| 生产 | $300-3,500+ |

**提示：** 测试后运行 `azd down` 以避免产生费用。

---

## 🔗 导航

| 方向 | 章节 |
|-----------|---------|
| <strong>上一章</strong> | [第1章：基础](../chapter-01-foundation/README.md) |
| <strong>下一章</strong> | [第3章：配置](../chapter-03-configuration/README.md) |
| <strong>跳转到</strong> | [第8章：生产模式](../chapter-08-production/README.md) |

---

## 📖 相关资源

- [AI 故障排除](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [生产环境 AI 实践](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**:
此文档使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们力求准确，但请注意自动翻译可能包含错误或不准确之处。原始文档的母语版本应被视为权威来源。对于关键信息，建议采用专业人工翻译。因使用本翻译而导致的任何误解或曲解，我们概不负责。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
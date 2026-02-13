# 第2章：以 AI 为先的开发

**📚 课程**: [AZD 初学者](../../README.md) | **⏱️ 时长**: 1-2 小时 | **⭐ 复杂度**: 中等

---

## 概述

本章重点介绍使用 Azure Developer CLI 和 Microsoft Foundry 服务部署 AI 驱动的应用。从简单的 AI 聊天应用到带工具的智能代理。

## 学习目标

通过完成本章，您将能够：
- 使用预构建的 AZD 模板部署 AI 应用
- 了解 Microsoft Foundry 与 AZD 的集成
- 配置并定制带有工具的 AI 代理
- 部署 RAG（检索增强生成）应用

---

## 📚 课程

| # | 课程 | 描述 | 时间 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry 集成](microsoft-foundry-integration.md) | 将 AZD 与 Foundry 服务连接 | 30 分钟 |
| 2 | [AI 代理 指南](agents.md) | 部署带工具的智能代理 | 45 分钟 |
| 3 | [AI 模型 部署](ai-model-deployment.md) | 部署并配置 AI 模型 | 30 分钟 |
| 4 | [AI 实操实验室](ai-workshop-lab.md) | 动手实践：使你的 AI 解决方案适配 AZD | 60 分钟 |

---

## 🚀 快速开始

```bash
# 选项 1：RAG 聊天应用
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

| 环境 | 预计月成本 |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**提示：** 测试后运行 `azd down` 以避免费用。

---

## 🔗 导航

| 方向 | 章节 |
|-----------|---------|
| **上一章** | [第1章：基础](../chapter-01-foundation/README.md) |
| **下一章** | [第3章：配置](../chapter-03-configuration/README.md) |
| **跳转到** | [第8章：生产模式](../chapter-08-production/README.md) |

---

## 📖 相关资源

- [AI 故障排除](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [生产 AI 实践](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件使用 AI 翻译服务 Co-op Translator (https://github.com/Azure/co-op-translator) 进行翻译。尽管我们力求准确，但请注意自动翻译可能包含错误或不准确之处。原文应被视为权威来源。对于关键信息，建议采用专业人工翻译。因使用本翻译而产生的任何误解或错误解释，我们不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
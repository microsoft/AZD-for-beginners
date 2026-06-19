# 第 2 章：AI 优先开发

**📚 课程**: [AZD 入门](../../README.md) | **⏱️ 时长**: 1-2 小时 | **⭐ 复杂度**: 中级

---

## 概述

本章侧重于使用 Azure Developer CLI 和 Microsoft Foundry 服务部署 AI 驱动的应用程序。从简单的 AI 聊天应用到具备工具的智能代理。

> **验证说明 (2026-06-15):** 本章中的命令流程和扩展指导已针对 `azd` `1.25.6` 以及当前预览版 AI 代理扩展发行版 `azure.ai.agents` `0.1.40-preview` 进行了审查。如果您使用的是较旧的 AZD 构建，请先更新然后继续进行练习。

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
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | 将 AZD 连接到 Foundry 服务 | 30 分钟 |
| 2 | [AI Agents Guide](agents.md) | 部署带工具的智能代理 | 45 分钟 |
| 3 | [AI Model Deployment](ai-model-deployment.md) | 部署和配置 AI 模型 | 30 分钟 |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | 实操：使您的 AI 解决方案符合 AZD 要求 | 60 分钟 |

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

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 带引用的 RAG 聊天 | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | 带工具的 AI 代理 | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 基础 AI 聊天 | OpenAI + Container Apps |

---

## 💰 成本意识

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| 开发环境 | $80-150 |
| 预发布 | $150-300 |
| 生产环境 | $300-3,500+ |

**提示：** 测试后运行 `azd down` 以避免费用。

---

## 🔗 导航

| 方向 | 章节 |
|-----------|---------|
| <strong>上一章</strong> | [第 1 章：基础](../chapter-01-foundation/README.md) |
| <strong>下一章</strong> | [第 3 章：配置](../chapter-03-configuration/README.md) |
| <strong>跳转到</strong> | [第 8 章：生产模式](../chapter-08-production/README.md) |

---

## 📖 相关资源

- [AI 故障排除](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [生产 AI 实践](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
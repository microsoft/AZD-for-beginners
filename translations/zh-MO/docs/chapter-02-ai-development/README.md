# Chapter 2: AI-First Development

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-2 hours | **⭐ Complexity**: Intermediate

---

## Overview

本章集中於使用 Azure Developer CLI 及 Microsoft Foundry 服務部署 AI 驅動的應用程式。從簡單的 AI 聊天應用到具備工具的智慧代理。

> **Validation note (2026-03-25):** 本章中的命令流程及擴充套件指引已根據 `azd` 版本 `1.23.12` 與目前預覽的 AI 代理擴充套件版本 `azure.ai.agents` `0.1.18-preview` 進行審視。若您使用的是舊版 AZD，請先更新再繼續練習。

## Learning Objectives

完成本章後，您將能夠：
- 使用預建的 AZD 範本部署 AI 應用程式
- 理解 Microsoft Foundry 與 AZD 的整合
- 配置及自訂具有工具的 AI 代理
- 部署 RAG（檢索擴增生成）應用程式

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | 連接 AZD 與 Foundry 服務 | 30 min |
| 2 | [AI Agents Guide](agents.md) | 部署具工具的智慧代理 | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | 部署及配置 AI 模型 | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | 實作：讓您的 AI 解決方案適用 AZD | 60 min |

---

## 🚀 Quick Start

```bash
# 選項 1：RAG 聊天應用程式
azd init --template azure-search-openai-demo
azd up

# 選項 2：人工智能代理
azd init --template get-started-with-ai-agents
azd up

# 選項 3：快速聊天應用程式
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Featured AI Templates

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 帶引用的 RAG 聊天 | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | 搭配工具的 AI 代理 | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 基本 AI 聊天 | OpenAI + Container Apps |

---

## 💰 Cost Awareness

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Tip:** 測試後請執行 `azd down` 以避免產生費用。

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **Next** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Skip to** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 Related Resources

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於確保準確性，但請注意自動翻譯可能含有錯誤或不準確之處。原始的母語文件應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。對於因使用此翻譯而導致的任何誤解或誤釋，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
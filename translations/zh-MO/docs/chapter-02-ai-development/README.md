# 第 2 章：AI 優先開發

**📚 課程**: [AZD 新手入門](../../README.md) | **⏱️ 時長**: 1-2 小時 | **⭐ 難度**: 中等

---

## 概覽

本章著重於使用 Azure Developer CLI 與 Microsoft Foundry 服務來部署具 AI 功能的應用程式。從簡單的 AI 聊天應用到具工具的智慧代理人。

## 學習目標

完成本章後，您將會：
- 使用預建的 AZD 範本部署 AI 應用程式
- 理解 Microsoft Foundry 與 AZD 的整合
- 設定並自訂具工具的 AI 代理人
- 部署 RAG（檢索增強生成）應用程式

---

## 📚 課程

| # | 課程 | 描述 | 時間 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry 整合](microsoft-foundry-integration.md) | 將 AZD 連接至 Foundry 服務 | 30 分鐘 |
| 2 | [AI 代理指南](agents.md) | 部署具工具的智慧代理人 | 45 分鐘 |
| 3 | [AI 模型部署](ai-model-deployment.md) | 部署並設定 AI 模型 | 30 分鐘 |
| 4 | [AI 實作工作坊](ai-workshop-lab.md) | 實作：讓您的 AI 解決方案能使用 AZD | 60 分鐘 |

---

## 🚀 快速開始

```bash
# 選項 1：RAG 聊天應用程式
azd init --template azure-search-openai-demo
azd up

# 選項 2：AI 代理
azd init --template get-started-with-ai-agents
azd up

# 選項 3：快速聊天應用程式
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 精選 AI 範本

| 範本 | 描述 | 服務 |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 具引用來源的 RAG 聊天 | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | 具工具的 AI 代理 | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 基本 AI 聊天 | OpenAI + Container Apps |

---

## 💰 成本概覽

| 環境 | 估計每月成本 |
|-------------|----------------------|
| 開發 | $80-150 |
| 預備 | $150-300 |
| 生產 | $300-3,500+ |

**提示：** 完成測試後執行 `azd down` 以避免產生費用。

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| **上一章** | [第 1 章：基礎](../chapter-01-foundation/README.md) |
| **下一章** | [第 3 章：設定](../chapter-03-configuration/README.md) |
| **跳至** | [第 8 章：生產模式](../chapter-08-production/README.md) |

---

## 📖 相關資源

- [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [生產 AI 實務](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co-op Translator (https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，請注意自動翻譯可能包含錯誤或不準確之處。原文（其母語版本）應被視為具權威性的版本。對於重要資訊，建議採用專業人工翻譯。我們對因使用此翻譯而引致的任何誤解或錯誤詮釋概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
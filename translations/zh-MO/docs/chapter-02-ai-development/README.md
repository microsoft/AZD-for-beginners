# 第2章：AI優先開發

**📚 課程**：[AZD 初學者指南](../../README.md) | **⏱️ 時間**：1-2 小時 | **⭐ 複雜度**：中階

---

## 概述

本章重點介紹使用 Azure Developer CLI 與 Microsoft Foundry 服務部署 AI 驅動應用程式。從簡單的 AI 聊天應用到具備工具的智慧代理。

> **驗證說明（2026-07-13）：** 本章中的指令流程及擴充套件指導，已根據 `azd` `1.27.1` 及目前預覽版 AI 代理擴展發布 `azure.ai.agents` `1.0.0-beta.5` 進行審核。若您使用較舊版本 AZD，請先更新再進行練習。

## 學習目標

完成本章後，您將能：
- 使用預建 AZD 範本部署 AI 應用程式
- 了解 Microsoft Foundry 與 AZD 的整合
- 配置並自訂具工具的 AI 代理
- 部署 RAG（檢索強化生成）應用程式

---

## 📚 課程列表

| 編號 | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry 整合](microsoft-foundry-integration.md) | 連接 AZD 與 Foundry 服務 | 30 分鐘 |
| 2 | [AI 代理指南](agents.md) | 部署具工具的智能代理 | 45 分鐘 |
| 3 | [AI 模型部署](ai-model-deployment.md) | 部署及配置 AI 模型 | 30 分鐘 |
| 4 | [AI 工作坊實作](ai-workshop-lab.md) | 實作練習：讓您的 AI 解決方案符合 AZD | 60 分鐘 |

---

## 🚀 快速開始

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

## 🤖 精選 AI 範本

| 範本 | 說明 | 服務 |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 帶引文的 RAG 聊天 | OpenAI + AI 搜尋 |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | 具工具的 AI 代理 | AI 代理服務 |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 基礎 AI 聊天 | OpenAI + Container Apps |

---

## 💰 成本意識

| 環境 | 預估月費 |
|-------------|----------------------|
| 開發 | $80-150 |
| 預備 | $150-300 |
| 產品 | $300-3,500+ |

**提示：** 測試後請執行 `azd down` 以避免產生費用。

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第1章：基礎](../chapter-01-foundation/README.md) |
| <strong>下一章</strong> | [第3章：配置](../chapter-03-configuration/README.md) |
| <strong>跳至</strong> | [第8章：生產模式](../chapter-08-production/README.md) |

---

## 📖 相關資源

- [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [生產 AI 實務](../chapter-08-production/production-ai-practices.md)
- [應用程式洞察](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
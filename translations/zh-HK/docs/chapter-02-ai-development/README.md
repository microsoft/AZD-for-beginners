# 第 2 章：以 AI 為先的開發

**📚 課程**：[AZD 初學者](../../README.md) | **⏱️ 時長**：包括工作坊共 4-5 小時 | **⭐ 難度**：中級

---

## 概覽

本章節著重於使用 Azure Developer CLI 與 Microsoft Foundry 服務部署 AI 驅動的應用程式。從簡單的 AI 聊天應用到帶工具的智能代理。

> **發行回顧 (2026-11-04)：** AI CLI 指引已根據已發布的 `azd` `1.37.2`、`azure.ai.agents` `1.0.0-beta.23` 及 `azure.ai.evaluations` `1.0.0-beta.2` 文檔/來源進行核對。請使用 `azd >= 1.37.0` 進行組合工作流程。評估現在使用獨立的 `azd ai eval` 命名空間；詳見 [發行變更及遷移指引](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes)。這並非即時部署驗證。

## 學習目標

完成本章後，你將會：
- 使用預建 AZD 範本部署 AI 應用程式
- 了解 Microsoft Foundry 與 AZD 的整合
- 配置及自訂帶工具的 AI 代理
- 部署 RAG（檢索增強產生）應用程式

---

## 📚 課程內容

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry 整合](microsoft-foundry-integration.md) | 連接 AZD 與 Foundry 服務 | 30 分鐘 |
| 2 | [AI 代理指南](agents.md) | 部署帶工具的智能代理 | 45 分鐘 |
| 3 | [AI 模型部署](ai-model-deployment.md) | 部署及配置 AI 模型 | 30 分鐘 |
| 4 | [AI 實作工作坊](ai-workshop-lab.md) | 實作操作：探索範本及規劃轉換 | 2-3 小時 |

---

## 🚀 快速開始

在新的空目錄中選擇一個選項。尾端的 `.` 用於初始化當前目錄；否則 AZD 可能建立子目錄而不改變 shell 的工作目錄。

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

## 🤖 精選 AI 範本

| 範本 | 說明 | 服務 |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 帶引用的 RAG 聊天 | OpenAI + AI 搜尋 |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | 帶工具的 AI 代理 | AI 代理服務 |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 基本 AI 聊天 | OpenAI + Container Apps |

---

## 💰 成本意識

這些為說明範圍，非報價或上限；模型流量、搜尋/計算 SKU、區域及選用功能可能超出範圍。請於配置前審閱所選範例的最新價格指南。

| 環境 | 預估每月成本 |
|-------------|----------------------|
| 開發 | $80-150 |
| 測試 | $150-300 |
| 生產 | $300-3,500+ |

**提示：** 測試後請執行 `azd down` 以避免產生費用。

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第 1 章：基礎](../chapter-01-foundation/README.md) |
| <strong>下一章</strong> | [第 3 章：配置](../chapter-03-configuration/README.md) |
| <strong>跳轉至</strong> | [第 8 章：生產模式](../chapter-08-production/README.md) |

---

## 📖 相關資源

- [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [生產 AI 實踐](../chapter-08-production/production-ai-practices.md)
- [應用程式洞察](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
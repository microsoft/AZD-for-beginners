# 第二章：以 AI 為先的開發

**📚 Course**: [AZD 初學者指南](../../README.md) | **⏱️ Duration**: 1-2 小時 | **⭐ Complexity**: 中等

---

## 概覽

本章重點在使用 Azure Developer CLI 與 Microsoft Foundry 服務部署具 AI 能力的應用程式。範圍從簡單的 AI 聊天應用到具備工具的智慧代理人。

> **驗證備註 (2026-06-15):** 本章中的指令流程與擴充套件指引已針對 `azd` `1.25.6` 與目前預覽版 AI 代理擴充套件 `azure.ai.agents` `0.1.40-preview` 進行審查。若你使用的是較舊的 AZD 版本，請先更新然後再繼續練習。

## 學習目標

完成本章後，你將能：
- 使用預建的 AZD 範本部署 AI 應用程式
- 了解 Microsoft Foundry 與 AZD 的整合
- 為 AI 代理人配置並客製化工具
- 部署 RAG（檢索增強生成）應用程式

---

## 📚 課程

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry 整合](microsoft-foundry-integration.md) | 將 AZD 與 Foundry 服務連接 | 30 分鐘 |
| 2 | [AI 代理人指南](agents.md) | 部署具備工具的智慧代理人 | 45 分鐘 |
| 3 | [AI 模型部署](ai-model-deployment.md) | 部署並設定 AI 模型 | 30 分鐘 |
| 4 | [AI 實作工作坊](ai-workshop-lab.md) | 實作：讓你的 AI 解決方案可在 AZD 上部署 | 60 分鐘 |

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

| 範本 | 說明 | 服務 |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 帶引用的 RAG 對話 | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | 具備工具的 AI 代理人 | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 基本 AI 聊天 | OpenAI + Container Apps |

---

## 💰 成本注意事項

| 環境 | 預估每月費用 |
|-------------|----------------------|
| 開發 | $80-150 |
| 測試 | $150-300 |
| 生產 | $300-3,500+ |

**提示：** 測試後執行 `azd down` 以避免產生費用。

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第 1 章：基礎](../chapter-01-foundation/README.md) |
| <strong>下一章</strong> | [第 3 章：設定](../chapter-03-configuration/README.md) |
| <strong>跳至</strong> | [第 8 章：生產模式](../chapter-08-production/README.md) |

---

## 📖 相關資源

- [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [生產環境 AI 實務](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
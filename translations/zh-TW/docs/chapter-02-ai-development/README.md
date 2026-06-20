# 第2章：以 AI 為先的開發

**📚 課程**: [AZD 初學者](../../README.md) | **⏱️ 時間**: 1-2 小時 | **⭐ 難度**: 中階

---

## 概覽

本章重點在使用 Azure Developer CLI 與 Microsoft Foundry 服務來部署具 AI 能力的應用程式。範圍從簡單的 AI 聊天應用到具備工具的智慧型代理。

> **驗證說明 (2026-06-15):** 本章中的指令流程與擴充功能指引已針對 `azd` `1.25.6` 與目前的預覽 AI 代理擴充版本 `azure.ai.agents` `0.1.40-preview` 進行檢視。若你的 AZD 版本較舊，請先更新，然後再繼續練習。

## 學習目標

完成本章後，你將能夠：
- 使用預建的 AZD 範本部署 AI 應用程式
- 了解 Microsoft Foundry 與 AZD 的整合
- 設定並自訂具工具的 AI 代理
- 部署 RAG（Retrieval-Augmented Generation）應用程式

---

## 📚 課程單元

| # | 單元 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | 將 AZD 與 Foundry 服務連接 | 30 分鐘 |
| 2 | [AI Agents Guide](agents.md) | 使用工具部署智慧型代理 | 45 分鐘 |
| 3 | [AI Model Deployment](ai-model-deployment.md) | 部署並設定 AI 模型 | 30 分鐘 |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | 動手實作：讓你的 AI 解決方案做好 AZD 上線準備 | 60 分鐘 |

---

## 🚀 快速入門

```bash
# 選項 1：RAG 聊天應用程式
azd init --template azure-search-openai-demo
azd up

# 選項 2：AI 代理人
azd init --template get-started-with-ai-agents
azd up

# 選項 3：快速聊天應用程式
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 精選 AI 範本

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 具引用的 RAG 聊天 | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | 具備工具的 AI 代理 | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 基礎 AI 聊天 | OpenAI + Container Apps |

---

## 💰 成本注意事項

| 環境 | 預估每月費用 |
|-------------|----------------------|
| 開發環境 | $80-150 |
| 測試環境 | $150-300 |
| 生產環境 | $300-3,500+ |

**提示：** 測試後執行 `azd down` 以避免產生費用。

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>上一節</strong> | [第1章：基礎](../chapter-01-foundation/README.md) |
| <strong>下一節</strong> | [第3章：設定](../chapter-03-configuration/README.md) |
| <strong>跳至</strong> | [第8章：生產模式](../chapter-08-production/README.md) |

---

## 📖 相關資源

- [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [生產 AI 實務](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
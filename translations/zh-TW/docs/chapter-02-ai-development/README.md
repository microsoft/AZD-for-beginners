# Chapter 2: AI-First Development

**📚 課程**: [AZD For Beginners](../../README.md) | **⏱️ 時長**: 1-2 小時 | **⭐ 複雜度**: 中階

---

## 概覽

本章聚焦使用 Azure Developer CLI 與 Microsoft Foundry 服務部署 AI 驅動的應用程式。涵蓋從簡單的 AI 聊天應用到具備工具的智慧代理人。

> **驗證說明 (2026-03-25):** 本章中的指令流程與擴充指引已依據 `azd` `1.23.12` 版本及目前預覽的 AI 代理擴充套件 `azure.ai.agents` `0.1.18-preview` 進行檢視。若您使用舊版 AZD，請先更新再繼續練習。

## 學習目標

完成本章後，您將能：
- 使用預先建置的 AZD 範本部署 AI 應用
- 了解 Microsoft Foundry 與 AZD 的整合
- 配置並自訂具工具的 AI 代理人
- 部署 RAG（檢索強化生成）應用程式

---

## 📚 課程列表

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry 整合](microsoft-foundry-integration.md) | 將 AZD 連接至 Foundry 服務 | 30 分鐘 |
| 2 | [AI 代理人指南](agents.md) | 部署具工具的智慧代理人 | 45 分鐘 |
| 3 | [AI 模型部署](ai-model-deployment.md) | 部署與配置 AI 模型 | 30 分鐘 |
| 4 | [AI 工作坊實作](ai-workshop-lab.md) | 實作：使您的 AI 解決方案符合 AZD | 60 分鐘 |

---

## 🚀 快速開始

```bash
# 選項 1：RAG 聊天應用程式
azd init --template azure-search-openai-demo
azd up

# 選項 2：人工智慧代理人
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
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | 具工具的 AI 代理人 | AI 代理人服務 |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 基本 AI 聊天 | OpenAI + Container Apps |

---

## 💰 成本意識

| 環境 | 預估每月成本 |
|-------------|----------------------|
| 開發環境 | $80-150 |
| 測試環境 | $150-300 |
| 生產環境 | $300-3,500+ |

**提示：** 測試完成後請執行 `azd down` 以避免產生費用。

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第 1 章：基礎](../chapter-01-foundation/README.md) |
| <strong>下一章</strong> | [第 3 章：配置](../chapter-03-configuration/README.md) |
| <strong>跳至</strong> | [第 8 章：生產模式](../chapter-08-production/README.md) |

---

## 📖 相關資源

- [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [生產 AI 實務](../chapter-08-production/production-ai-practices.md)
- [應用程式洞察](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於重要資訊，建議使用專業人工翻譯。我們對因使用此翻譯所產生的任何誤解或誤譯不負任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
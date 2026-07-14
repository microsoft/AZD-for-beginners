# 第二章：AI 優先開發

**📚 課程**: [AZD 初學者指南](../../README.md) | **⏱️ 時長**: 1-2 小時 | **⭐ 難度**: 中階

---

## 概述

本章將聚焦於使用 Azure Developer CLI 和 Microsoft Foundry 服務部署 AI 應用程式。從簡單的 AI 聊天應用到具備工具的智能代理。

> **驗證備註 (2026-07-13)：** 本章的命令流程及擴展指引已依 `azd` `1.27.1` 與目前預覽版本 AI 代理擴展 `azure.ai.agents` `1.0.0-beta.5` 進行檢視。若您使用較舊的 AZD 版本，請先更新再繼續練習。

## 學習目標

完成本章後，您將能：
- 使用預建的 AZD 範本部署 AI 應用程式
- 了解 Microsoft Foundry 與 AZD 的整合
- 配置並自訂具工具的 AI 代理
- 部署 RAG（檢索增強生成）應用

---

## 📚 課程列表

| 編號 | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry 整合](microsoft-foundry-integration.md) | 將 AZD 連接到 Foundry 服務 | 30 分鐘 |
| 2 | [AI 代理指南](agents.md) | 部署具工具的智能代理 | 45 分鐘 |
| 3 | [AI 模型部署](ai-model-deployment.md) | 部署及配置 AI 模型 | 30 分鐘 |
| 4 | [AI 實作工作坊](ai-workshop-lab.md) | 實作：打造適合 AZD 的 AI 解決方案 | 60 分鐘 |

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
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 帶出處的 RAG 聊天 | OpenAI + AI 搜尋 |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | 具工具的 AI 代理 | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 基本 AI 聊天 | OpenAI + Container Apps |

---

## 💰 成本意識

| 環境 | 預估月花費 |
|-------------|----------------------|
| 開發 | $80-150 |
| 測試 | $150-300 |
| 生產 | $300-3,500+ |

**提示：** 測試後執行 `azd down` 避免費用產生。

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第一章：基礎](../chapter-01-foundation/README.md) |
| <strong>下一章</strong> | [第三章：配置](../chapter-03-configuration/README.md) |
| <strong>跳到</strong> | [第八章：生產模式](../chapter-08-production/README.md) |

---

## 📖 相關資源

- [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [生產環境 AI 實務](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
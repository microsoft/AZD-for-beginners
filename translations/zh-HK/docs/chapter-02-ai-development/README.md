# 第2章：AI優先開發

**📚 課程**: [AZD初學者指南](../../README.md) | **⏱️ 時長**: 1-2小時 | **⭐ 難度**: 中階

---

## 概覽

本章節聚焦使用 Azure Developer CLI 與 Microsoft Foundry 服務部署AI驅動的應用程式。內容涵蓋從簡單的AI聊天應用到配備工具的智能代理人。

> **驗證說明 (2026-07-13)：** 本章節中的指令流程與擴充套件指導已依據 `azd` `1.27.1` 版本及目前預覽版AI代理人擴充套件 `azure.ai.agents` `1.0.0-beta.5` 進行審核。若您使用較舊的AZD版本，請先更新後再繼續練習。

## 學習目標

完成本章後，您將能夠：
- 使用預建AZD範本部署AI應用程式
- 了解Microsoft Foundry與AZD的整合
- 配置與自訂具備工具的AI代理人
- 部署RAG（檢索增強生成）應用程式

---

## 📚 課程內容

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry整合](microsoft-foundry-integration.md) | 連接AZD與Foundry服務 | 30 分鐘 |
| 2 | [AI代理人指南](agents.md) | 部署具備工具的智能代理人 | 45 分鐘 |
| 3 | [AI模型部署](ai-model-deployment.md) | 部署及配置AI模型 | 30 分鐘 |
| 4 | [AI工作坊實驗室](ai-workshop-lab.md) | 實作：讓您的AI解決方案相容AZD | 60 分鐘 |

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

## 🤖 精選AI範本

| 範本 | 說明 | 服務 |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 帶引用的RAG聊天 | OpenAI + AI搜尋 |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | 具工具的AI代理人 | AI代理人服務 |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 基本AI聊天 | OpenAI + 容器應用 |

---

## 💰 成本意識

| 環境 | 預估每月成本 |
|-------------|----------------------|
| 開發 | $80-150 |
| 測試 | $150-300 |
| 生產 | $300-3,500+ |

**提示：** 測試完成後請執行 `azd down` 以避免產生額外費用。

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第1章：基礎](../chapter-01-foundation/README.md) |
| <strong>下一章</strong> | [第3章：設定](../chapter-03-configuration/README.md) |
| <strong>跳至</strong> | [第8章：生產模式](../chapter-08-production/README.md) |

---

## 📖 相關資源

- [AI故障排除](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [生產AI實務](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
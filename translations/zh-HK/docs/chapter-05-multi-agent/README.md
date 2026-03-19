# 第5章：多智能體 AI 解決方案

**📚 課程**：[初學者 AZD](../../README.md) | **⏱️ 時間**：2-3 小時 | **⭐ 難度**：進階

---

## 概覽

本章涵蓋進階多智能體架構模式、智能體協調以及適用於複雜場景的生產級 AI 部署。

## 學習目標

完成本章後，您將能夠：
- 理解多智能體架構模式
- 部署協調的 AI 智能體系統
- 實現智能體間通訊
- 建立生產級多智能體解決方案

---

## 📚 課程

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [零售多智能體解決方案](../../examples/retail-scenario.md) | 完整實作演練 | 90 分鐘 |
| 2 | [協調模式](../chapter-06-pre-deployment/coordination-patterns.md) | 智能體協調策略 | 30 分鐘 |
| 3 | [ARM 範本部署](../../examples/retail-multiagent-arm-template/README.md) | 一鍵部署 | 30 分鐘 |

---

## 🚀 快速開始

```bash
# 選項 1：從範本部署
azd init --template agent-openai-python-prompty
azd up

# 選項 2：從代理清單部署（需要 azure.ai.agents 擴充功能）
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **選擇哪種方式？** 使用 `azd init --template` 從現成範例開始。當您已有智能體清單時，請使用 `azd ai agent init`。完整細節請參閱 [AZD AI CLI 參考](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

---

## 🤖 多智能體架構

```mermaid
graph TD
    Orchestrator[協調器代理<br/>路由請求，管理工作流程] --> Customer[客戶代理<br/>用戶查詢，偏好]
    Orchestrator --> Inventory[庫存代理<br/>庫存水平，訂單]
```
---

## 🎯 精選解決方案：零售多智能體

[零售多智能體解決方案](../../examples/retail-scenario.md) 展示：

- <strong>客戶智能體</strong>：處理用戶互動與偏好
- <strong>庫存智能體</strong>：管理存貨與訂單處理
- <strong>協調者</strong>：智能體間的協調
- <strong>共享記憶體</strong>：跨智能體的上下文管理

### 使用服務

| 服務 | 用途 |
|---------|---------|
| Microsoft Foundry Models | 語言理解 |
| Azure AI Search | 產品目錄 |
| Cosmos DB | 智能體狀態與記憶 |
| Container Apps | 智能體託管 |
| Application Insights | 監控 |

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第4章：基礎架構](../chapter-04-infrastructure/README.md) |
| <strong>下一章</strong> | [第6章：部署前準備](../chapter-06-pre-deployment/README.md) |

---

## 📖 相關資源

- [AI 智能體指南](../chapter-02-ai-development/agents.md)
- [生產級 AI 實務](../chapter-08-production/production-ai-practices.md)
- [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件是使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的原文版本應視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而引起的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
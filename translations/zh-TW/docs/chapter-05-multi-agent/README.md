# 第 5 章：多代理 AI 解決方案

**📚 課程**: [AZD 初學者](../../README.md) | **⏱️ 時間**: 2-3 小時 | **⭐ 複雜度**: 進階

---

## 概覽

本章涵蓋進階的多代理架構模式、代理編排，以及針對複雜情境的可投入生產的 AI 部署。

> 已於 2026 年 6 月使用 `azd 1.25.6` 驗證。

## 學習目標

完成本章後，您將：
- 了解多代理架構模式
- 部署協同的 AI 代理系統
- 實作代理間通訊
- 建立可投入生產的多代理解決方案

---

## 📚 課程單元

| # | 單元 | 描述 | 時間 |
|---|--------|-------------|------|
| 1 | [多代理基礎](multi-agent-basics.md) | 實作：使用 `azd up` 部署可運作的多代理應用程式 | 45 分鐘 |
| 2 | [協調模式](../chapter-06-pre-deployment/coordination-patterns.md) | 代理編排策略（於第 6 章繼續） | 30 分鐘 |
| 3 | [ARM 範本部署](../../examples/retail-multiagent-arm-template/README.md) | 一鍵部署範例 | 30 分鐘 |

> **從第 1 課開始。** 這是本章唯一完全實作並可部署的課程單元。第 2 課位於第 6 章（與部署前規劃共用），而 [零售多代理解決方案](../../examples/retail-scenario.md) 是一個架構藍圖——設計參考，而非一鍵範本。

---

## 🚀 快速開始

```bash
# 選項 1：從範本部署
azd init --template agent-openai-python-prompty
azd up

# 選項 2：從代理程式清單部署（需要 azure.ai.agents 擴充套件）
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **採用哪種方式？** 使用 `azd init --template` 從可運作的範例開始。當您已有自己的代理 manifest 時，使用 `azd ai agent init`。完整細節請參閱 [AZD AI CLI 參考](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

---

## 🤖 多代理架構

```mermaid
graph TD
    Orchestrator[Orchestrator 代理<br/>路由請求，管理工作流程] --> Customer[Customer 代理<br/>使用者查詢、偏好]
    Orchestrator --> Inventory[Inventory 代理<br/>庫存數量、訂單]
```

---

## 🎯 精選解決方案：零售多代理

[零售多代理解決方案](../../examples/retail-scenario.md) 示範：

- <strong>客戶代理</strong>：處理使用者互動與偏好
- <strong>庫存代理</strong>：管理庫存與訂單處理
- <strong>編排器</strong>：協調代理之間的運作
- <strong>共享記憶體</strong>：跨代理的上下文管理

### 使用服務

| 服務 | 用途 |
|---------|---------|
| Microsoft Foundry Models | 語言理解 |
| Azure AI Search | 產品目錄 |
| Cosmos DB | 代理狀態與記憶 |
| Container Apps | 代理託管 |
| Application Insights | 監控 |

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第 4 章：基礎架構](../chapter-04-infrastructure/README.md) |
| <strong>下一章</strong> | [第 6 章：部署前](../chapter-06-pre-deployment/README.md) |

---

## 📖 相關資源

- [AI 代理指南](../chapter-02-ai-development/agents.md)
- [生產環境 AI 實務](../chapter-08-production/production-ai-practices.md)
- [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
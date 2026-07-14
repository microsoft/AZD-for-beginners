# 第五章：多代理人工智慧解決方案

**📚 課程**：[AZD 初學者入門](../../README.md) | **⏱️ 時長**：2-3 小時 | **⭐ 難度**：進階

---

## 概覽

本章涵蓋進階多代理架構模式、代理協調，以及針對複雜場景的生產級人工智慧部署。

> 已於 2026 年 7 月使用 `azd 1.27.1` 驗證。

## 學習目標

完成本章後，您將能：
- 了解多代理架構模式
- 部署協同運作的人工智慧代理系統
- 實作代理間通訊
- 建立生產級多代理解決方案

---

## 📚 課程列表

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [多代理基礎](multi-agent-basics.md) | 實作操作：用 `azd up` 部署可運作多代理應用 | 45 分鐘 |
| 2 | [協調模式](../chapter-06-pre-deployment/coordination-patterns.md) | 代理協調策略（第六章繼續） | 30 分鐘 |
| 3 | [ARM 模板部署](../../examples/retail-multiagent-arm-template/README.md) | 一鍵部署範例 | 30 分鐘 |

> **從第一課程開始。** 這是本章唯一全程實作且可部署的課程。第二課程位於第六章（與預部署規劃共用），而[零售多代理解決方案](../../examples/retail-scenario.md)是架構藍圖──設計參考，而非一鍵模板。

---

## 🚀 快速開始

```bash
# 選項 1：從範本部署
azd init --template agent-openai-python-prompty
azd up

# 選項 2：從代理程式清單部署（需要 azure.ai.agents 擴充功能）
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **使用哪種方式？** 使用 `azd init --template` 從運作範例開始。擁有代理清單時，使用 `azd ai agent init`。參見 [AZD AI CLI 參考](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) 以了解完整細節。

---

## 🤖 多代理架構

```mermaid
graph TD
    Orchestrator[協調者代理人<br/>路由請求，管理工作流程] --> Customer[客戶代理人<br/>用戶查詢，偏好設定]
    Orchestrator --> Inventory[庫存代理人<br/>庫存水平，訂單訊息]
```

---

## 🎯 精選解決方案：零售多代理

[零售多代理解決方案](../../examples/retail-scenario.md) 示範：

- <strong>客戶代理</strong>：處理使用者互動與喜好
- <strong>庫存代理</strong>：管理庫存與訂單處理
- <strong>協調者</strong>：代理間協調
- <strong>共享記憶體</strong>：跨代理上下文管理

### 使用服務

| 服務 | 目的 |
|---------|---------|
| Microsoft Foundry Models | 語言理解 |
| Azure AI Search | 產品目錄 |
| Cosmos DB | 代理狀態與記憶 |
| Container Apps | 代理主機 |
| Application Insights | 監控 |

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第四章：基礎設施](../chapter-04-infrastructure/README.md) |
| <strong>下一章</strong> | [第六章：預部署](../chapter-06-pre-deployment/README.md) |

---

## 📖 相關資源

- [AI 代理指南](../chapter-02-ai-development/agents.md)
- [生產級 AI 實務](../chapter-08-production/production-ai-practices.md)
- [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
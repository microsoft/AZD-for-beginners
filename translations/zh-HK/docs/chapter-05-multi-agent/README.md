# 第 5 章：多代理 AI 解決方案

**📚 課程**: [AZD For Beginners](../../README.md) | **⏱️ 時長**: 2-3 小時 | **⭐ 難度**: 進階

---

## 概覽

本章涵蓋進階的多代理架構模式、代理編排，以及適用於複雜情境的生產就緒 AI 部署。

> 已於 `azd 1.23.12` 在 2026 年 3 月進行驗證。

## 學習目標

完成本章後，您將：
- 了解多代理架構模式
- 部署協調式 AI 代理系統
- 實作代理間通訊
- 建立可投入生產的多代理解決方案

---

## 📚 課程

| # | 課程 | 描述 | 時間 |
|---|--------|-------------|------|
| 1 | [零售多代理解決方案](../../examples/retail-scenario.md) | 完整實作逐步解析 | 90 min |
| 2 | [協調模式](../chapter-06-pre-deployment/coordination-patterns.md) | 代理編排策略 | 30 min |
| 3 | [ARM 範本部署](../../examples/retail-multiagent-arm-template/README.md) | 一鍵部署 | 30 min |

---

## 🚀 快速入門

```bash
# 選項 1：從範本部署
azd init --template agent-openai-python-prompty
azd up

# 選項 2：從代理程式清單部署（需要 azure.ai.agents 擴充功能）
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **採用哪種方法？** 使用 `azd init --template` 從可運作的範例開始。當您已有自己的代理清單時，使用 `azd ai agent init`。完整細節請參閱 [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

---

## 🤖 多代理架構

```mermaid
graph TD
    Orchestrator[編排代理<br/>路由請求，管理工作流程] --> Customer[客戶代理<br/>用戶查詢，偏好]
    Orchestrator --> Inventory[庫存代理<br/>庫存水平，訂單]
```
---

## 🎯 精選解決方案：零售多代理

[零售多代理解決方案](../../examples/retail-scenario.md) 示範：

- <strong>客戶代理</strong>：處理用戶互動與偏好
- <strong>庫存代理</strong>：管理庫存與訂單處理
- <strong>協調器</strong>：在代理之間協調
- <strong>共享記憶體</strong>：跨代理的上下文管理

### 使用的服務

| 服務 | 用途 |
|---------|---------|
| Microsoft Foundry Models | 語言理解 |
| Azure AI Search | 產品目錄 |
| Cosmos DB | 代理狀態與記憶 |
| Container Apps | 代理託管 |
| Application Insights | 監控 |

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第 4 章：基礎架構](../chapter-04-infrastructure/README.md) |
| <strong>下一章</strong> | [第 6 章：預部署](../chapter-06-pre-deployment/README.md) |

---

## 📖 相關資源

- [AI 代理指南](../chapter-02-ai-development/agents.md)
- [生產 AI 實務](../chapter-08-production/production-ai-practices.md)
- [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為具權威性的來源。對於關鍵資訊，建議採用專業人工翻譯。我們不會對因使用此翻譯而產生的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 第 5 章：多代理 AI 解決方案

**📚 課程**: [AZD 初學者指南](../../README.md) | **⏱️ 時長**: 2-3 小時 | **⭐ 難度**: 進階

---

## 概述

本章涵蓋進階的多代理架構模式、代理協調，以及適用於複雜情境的生產級 AI 部署。

## 學習目標

完成本章後，您將：
- 了解多代理架構模式
- 部署協調的 AI 代理系統
- 實作代理之間的通訊
- 建立可投入生產的多代理解決方案

---

## 📚 課程

| # | 課程 | 說明 | 時長 |
|---|--------|-------------|------|
| 1 | [零售多代理解決方案](../../examples/retail-scenario.md) | 完整實作導覽 | 90 分鐘 |
| 2 | [協調模式](../chapter-06-pre-deployment/coordination-patterns.md) | 代理協調策略 | 30 分鐘 |
| 3 | [ARM 範本部署](../../examples/retail-multiagent-arm-template/README.md) | 一鍵部署 | 30 分鐘 |

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

> **採用哪種方式？** Use `azd init --template` to start from a working sample. Use `azd ai agent init` when you have your own agent manifest. See the [AZD AI CLI 參考](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for full details.

---

## 🤖 多代理架構

```mermaid
graph TD
    Orchestrator[協調器代理<br/>路由請求，管理工作流程] --> Customer[客戶代理<br/>使用者查詢、偏好設定]
    Orchestrator --> Inventory[庫存代理<br/>庫存量、訂單]
```
---

## 🎯 精選解決方案：零售多代理

The [零售多代理解決方案](../../examples/retail-scenario.md) demonstrates:

- <strong>客戶代理</strong>: 處理使用者互動與偏好
- <strong>庫存代理</strong>: 管理庫存與訂單處理
- <strong>協調器</strong>: 協調代理之間的協作
- <strong>共享記憶體</strong>: 跨代理的上下文管理

### 使用的服務

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
| <strong>下一章</strong> | [第 6 章：預部署](../chapter-06-pre-deployment/README.md) |

---

## 📖 相關資源

- [AI 代理指南](../chapter-02-ai-development/agents.md)
- [生產 AI 實務](../chapter-08-production/production-ai-practices.md)
- [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們力求準確，請注意自動翻譯可能包含錯誤或不準確之處。原始文件的原文應被視為權威來源。對於關鍵資訊，建議使用專業人工翻譯。我們不對因使用本翻譯而引致的任何誤解或錯誤詮釋概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 第五章：多代理 AI 解決方案

**📚 課程**: [AZD 入門](../../README.md) | **⏱️ 時長**: 2-3 小時 | **⭐ 難度**: 進階

---

## 概覽

本章涵蓋進階的多代理架構模式、代理編排，以及適用於複雜場景的生產就緒 AI 部署。

## 學習目標

完成本章後，您將會：
- 了解多代理架構模式
- 部署協調的 AI 代理系統
- 實作代理間通訊
- 建立可投入生產的多代理解決方案

---

## 📚 課程

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [零售多代理解決方案](../../examples/retail-scenario.md) | 完整實作導覽 | 90 分鐘 |
| 2 | [協調模式](../chapter-06-pre-deployment/coordination-patterns.md) | 代理編排策略 | 30 分鐘 |
| 3 | [ARM 範本部署](../../examples/retail-multiagent-arm-template/README.md) | 一鍵部署 | 30 分鐘 |

---

## 🚀 快速開始

```bash
# 部署零售多代理人解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 或者直接使用範本
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 多代理架構

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 精選解決方案：零售多代理

The [零售多代理解決方案](../../examples/retail-scenario.md) demonstrates:

- **客戶代理**: 處理使用者互動與偏好
- **庫存代理**: 管理庫存與訂單處理
- **協調者**: 在代理之間協調
- **共享記憶體**: 跨代理的情境管理

### 使用的服務

| 服務 | 用途 |
|---------|---------|
| Azure OpenAI | 語言理解 |
| Azure AI Search | 產品目錄 |
| Cosmos DB | 代理狀態與記憶 |
| Container Apps | 代理託管 |
| Application Insights | 監控 |

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| **上一章** | [第四章：基礎設施](../chapter-04-infrastructure/README.md) |
| **下一章** | [第六章：部署前準備](../chapter-06-pre-deployment/README.md) |

---

## 📖 相關資源

- [AI 代理指南](../chapter-02-ai-development/agents.md)
- [生產 AI 實務](../chapter-08-production/production-ai-practices.md)
- [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co‑op Translator（https://github.com/Azure/co-op-translator）進行翻譯。儘管我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言版本之文件應被視為具權威性的版本。對於重要或關鍵資訊，建議採用專業人工翻譯。我們不會對因使用本翻譯而產生的任何誤解或錯誤詮釋承擔任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
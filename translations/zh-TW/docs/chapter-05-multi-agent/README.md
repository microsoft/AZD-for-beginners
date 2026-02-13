# 第5章：多代理 AI 解決方案

**📚 課程**: [AZD 初學者指南](../../README.md) | **⏱️ 時長**: 2-3 小時 | **⭐ 複雜度**: 進階

---

## 概述

本章涵蓋進階的多代理架構模式、代理協調，以及用於複雜情境的生產就緒 AI 部署。

## 學習目標

完成本章後，您將會：
- 了解多代理架構模式
- 部署協調式的 AI 代理系統
- 實作代理間通訊
- 建置生產就緒的多代理解決方案

---

## 📚 課程

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [零售多代理解決方案](../../examples/retail-scenario.md) | 完整實作導覽 | 90 分鐘 |
| 2 | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) | 代理協調策略 | 30 分鐘 |
| 3 | [ARM Template Deployment](../../examples/retail-multiagent-arm-template/README.md) | 一鍵部署 | 30 分鐘 |

---

## 🚀 快速開始

```bash
# 部署零售多代理解決方案
cd examples/retail-multiagent-arm-template
./deploy.sh

# 或直接使用範本
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

The [零售多代理解決方案](../../examples/retail-scenario.md) 示範：

- **Customer Agent**: 處理使用者互動與偏好
- **Inventory Agent**: 管理庫存與訂單處理
- **Orchestrator**: 協調各代理之間的工作
- **Shared Memory**: 跨代理的上下文管理

### 使用的服務

| Service | Purpose |
|---------|---------|
| Azure OpenAI | 語言理解 |
| Azure AI Search | 產品目錄 |
| Cosmos DB | 代理狀態與記憶 |
| Container Apps | 代理部署 |
| Application Insights | 監控 |

---

## 🔗 導航

| Direction | Chapter |
|-----------|---------|
| **Previous** | [第4章：基礎設施](../chapter-04-infrastructure/README.md) |
| **Next** | [第6章：部署前](../chapter-06-pre-deployment/README.md) |

---

## 📖 相關資源

- [AI 代理指南](../chapter-02-ai-development/agents.md)
- [生產 AI 實務](../chapter-08-production/production-ai-practices.md)
- [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co-op Translator (https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意，自動翻譯結果可能包含錯誤或不準確之處。原始語言版本應視為具有權威性的來源。若為重要資訊，建議採用專業人工翻譯。對於因使用本翻譯而產生的任何誤解或誤譯，我們不負任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
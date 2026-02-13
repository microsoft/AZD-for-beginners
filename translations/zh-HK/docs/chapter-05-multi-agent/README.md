# 第5章：多代理 AI 解決方案

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 2-3 小時 | **⭐ Complexity**: 進階

---

## 概覽

本章涵蓋進階的多代理架構範式、代理協調，以及用於複雜情境的可投入生產的 AI 部署。

## 學習目標

完成本章後，您將能：
- 了解多代理架構模式
- 部署協調的 AI 代理系統
- 實作代理間通訊
- 建立可投入生產的多代理解決方案

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Retail Multi-Agent Solution](../../examples/retail-scenario.md) | 完整實作逐步導覽 | 90 min |
| 2 | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) | 代理協調策略 | 30 min |
| 3 | [ARM Template Deployment](../../examples/retail-multiagent-arm-template/README.md) | 一鍵部署 | 30 min |

---

## 🚀 Quick Start

```bash
# 部署零售多智能體解決方案
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

## 🎯 精選方案：零售多代理

The [Retail Multi-Agent Solution](../../examples/retail-scenario.md) demonstrates:

- **Customer Agent**: 處理使用者互動與偏好
- **Inventory Agent**: 管理庫存與訂單處理
- **Orchestrator**: 協調各代理之間的運作
- **Shared Memory**: 跨代理的上下文管理

### 使用的服務

| Service | Purpose |
|---------|---------|
| Azure OpenAI | 語言理解 |
| Azure AI Search | 產品目錄 |
| Cosmos DB | 代理狀態與記憶 |
| Container Apps | 代理託管 |
| Application Insights | 監控 |

---

## 🔗 導覽

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 4: Infrastructure](../chapter-04-infrastructure/README.md) |
| **Next** | [Chapter 6: Pre-Deployment](../chapter-06-pre-deployment/README.md) |

---

## 📖 相關資源

- [AI Agents Guide](../chapter-02-ai-development/agents.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原文應被視為具權威性的版本。對於重要資料，建議採用專業人工翻譯。我們不會就因使用本翻譯而引致的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
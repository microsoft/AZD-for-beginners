# 第8章：生產與企業模式

**📚 課程**: [AZD For Beginners](../../README.md) | **⏱️ 時長**: 2-3 小時 | **⭐ 難度**: 進階

---

## 概覽

本章涵蓋企業級佈署模式、資安強化、監控與生產 AI 工作負載的成本優化。

## 學習目標

By completing this chapter, you will:
- 部署多區域具彈性的應用程式
- 實作企業級安全模式
- 設定完整的監控
- 在大規模下優化成本
- 使用 AZD 建立 CI/CD 管線

---

## 📚 課程單元

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [Production AI Practices](production-ai-practices.md) | 企業部署模式 | 90 分鐘 |

---

## 🚀 生產檢查清單

- [ ] 多區域部署以提高韌性
- [ ] 使用受管理的身分識別進行驗證（無金鑰）
- [ ] 使用 Application Insights 做監控
- [ ] 設定成本預算與警示
- [ ] 啟用安全掃描
- [ ] 整合 CI/CD 管線
- [ ] 災難復原計畫

---

## 🏗️ 架構模式

### 模式 1：微服務 AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   API Gateway   │───▶│   AI Service    │───▶│   Azure OpenAI  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                      │
         ▼                      ▼
┌─────────────────┐    ┌─────────────────┐
│   Auth Service  │    │   Data Store    │
└─────────────────┘    └─────────────────┘
```

### 模式 2：事件驅動 AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 安全最佳實務

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 成本優化

| 策略 | 節省 |
|----------|---------|
| 縮減至零（Container Apps） | 60-80% |
| 開發環境使用消耗型層級 | 50-70% |
| 排程擴縮 | 30-50% |
| 預留容量 | 20-40% |

```bash
# 設定預算警示
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 監控設定

```bash
# 串流日誌
azd monitor --logs

# 檢查 Application Insights
azd monitor

# 檢視指標
az monitor metrics list --resource <resource-id>
```

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| **上一章** | [第7章：疑難排解](../chapter-07-troubleshooting/README.md) |
| **課程完成** | [課程首頁](../../README.md) |

---

## 📖 相關資源

- [AI 代理人指南](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [多代理方案](../chapter-05-multi-agent/README.md)
- [微服務範例](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能存在錯誤或不準確之處。原文應被視為具有權威性的版本。若涉及重要資訊，建議採用專業人工翻譯。我們對因使用本翻譯而引致的任何誤解或曲解概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
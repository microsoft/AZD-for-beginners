# 第 8 章：生產與企業範式

**📚 課程**: [AZD 初學者](../../README.md) | **⏱️ 時間**: 2-3 小時 | **⭐ 複雜度**: 進階

---

## 概覽

本章涵蓋企業就緒的部署範式、安全強化、監控，以及針對生產 AI 工作負載的成本優化。

## 學習目標

完成本章後，您將能：
- 部署多區域具彈性的應用程式
- 實作企業級安全範式
- 設定完整的監控
- 在大規模情境下優化成本
- 使用 AZD 設定 CI/CD 管線

---

## 📚 課程

| # | 課程 | 描述 | 時間 |
|---|--------|-------------|------|
| 1 | [Production AI Practices](production-ai-practices.md) | 企業部署範式 | 90 分鐘 |

---

## 🚀 生產檢查清單

- [ ] 多區域部署以提高彈性
- [ ] 使用受管理身分識別進行驗證（不使用金鑰）
- [ ] 使用 Application Insights 進行監控
- [ ] 設定成本預算與警示
- [ ] 啟用安全掃描
- [ ] 整合 CI/CD 管線
- [ ] 災難復原計畫

---

## 🏗️ 架構模式

### 範式 1：微服務 AI

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

### 範式 2：事件驅動 AI

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
| 在開發環境使用消耗階層 | 50-70% |
| 排程縮放 | 30-50% |
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
| **Previous** | [第 7 章：故障排除](../chapter-07-troubleshooting/README.md) |
| **Course Complete** | [課程首頁](../../README.md) |

---

## 📖 相關資源

- [AI 代理指南](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [多代理解決方案](../chapter-05-multi-agent/README.md)
- [微服務範例](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co‑op Translator（https://github.com/Azure/co-op-translator）進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不精確之處。原始語言版本應被視為具權威性的來源。對於重要資訊，建議採用專業人工翻譯。我們不就因使用本翻譯而導致的任何誤解或誤釋承擔任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
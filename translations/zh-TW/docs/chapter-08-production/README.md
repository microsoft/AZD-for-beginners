# 第 8 章：生產與企業模式

**📚 課程**: [AZD 初學者](../../README.md) | **⏱️ 時長**: 2-3 小時 | **⭐ 複雜度**: 進階

---

## 概覽

本章涵蓋企業級部署模式、強化安全、監控以及針對生產 AI 工作負載的成本優化。

> 已於 2026 年 6 月使用 `azd 1.25.6` 驗證。

## 學習目標

完成本章後，您將：
- 部署多區域具韌性的應用程式
- 實作企業安全模式
- 設定完整監控
- 在大規模下優化成本
- 使用 AZD 設定 CI/CD 管線

---

## 📚 課程

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [生產 AI 實務](production-ai-practices.md) | 企業部署模式 | 90 分鐘 |

---

## 🚀 生產檢查清單

- [ ] 多區域部署以提高韌性
- [ ] 使用受管身分進行驗證（無密鑰）
- [ ] 使用 Application Insights 進行監控
- [ ] 設定成本預算與警示
- [ ] 啟用安全掃描
- [ ] 整合 CI/CD 管線
- [ ] 災難復原計畫

---

## 🏗️ 架構模式

### 模式 1：微服務 AI

```mermaid
graph LR
    Gateway[API 閘道] --> AI[AI 服務] --> Models[微軟 Foundry 模型]
    Gateway --> Auth[驗證服務]
    AI --> Data[資料儲存庫]
```

### 模式 2：事件驅動 AI

```mermaid
graph LR
    EventGrid[事件網格] --> Functions[函式] --> Pipeline[AI 管線]
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
| 在開發環境使用消耗型層級 | 50-70% |
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
azd monitor --overview

# 檢視指標
az monitor metrics list --resource <resource-id>
```

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第 7 章：除錯](../chapter-07-troubleshooting/README.md) |
| <strong>課程完成</strong> | [課程首頁](../../README.md) |

---

## 📖 相關資源

- [AI 代理人指南](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [多代理解決方案](../chapter-05-multi-agent/README.md)
- [微服務範例](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
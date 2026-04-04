# 第8章：生產與企業模式

**📚 課程**： [AZD 初學者指南](../../README.md) | **⏱️ 時長**：2-3 小時 | **⭐ 複雜度**：進階

---

## 概述

本章涵蓋適合企業的部署模式、安全強化、監控以及生產環境 AI 工作負載的成本優化。

> 經過 `azd 1.23.12` 於 2026 年 3 月驗證。

## 學習目標

完成本章後，您將能夠：
- 部署多區域高韌性應用程式
- 實作企業安全模式
- 配置全面監控
- 進行規模化成本優化
- 使用 AZD 設置 CI/CD 流程

---

## 📚 課程單元

| # | 課程單元 | 說明 | 時間 |
|---|--------|-------|------|
| 1 | [生產 AI 實務](production-ai-practices.md) | 企業部署模式 | 90 分鐘 |

---

## 🚀 生產清單

- [ ] 多區域部署以提升韌性
- [ ] 使用受管身份驗證（無憑證）
- [ ] 使用 Application Insights 監控
- [ ] 設定成本預算與警示
- [ ] 啟用安全掃描
- [ ] 整合 CI/CD 流程
- [ ] 制定災難復原計劃

---

## 🏗️ 架構模式

### 模式 1：微服務 AI

```mermaid
graph LR
    Gateway[API 閘道] --> AI[人工智能服務] --> Models[微軟製模模型]
    Gateway --> Auth[認證服務]
    AI --> Data[數據存儲]
```
### 模式 2：事件驅動 AI

```mermaid
graph LR
    EventGrid[事件網格] --> Functions[函數] --> Pipeline[AI 流水線]
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

| 策略 | 節省比例 |
|----------|---------|
| 縮減至零（容器應用） | 60-80% |
| 開發環境使用消耗層級 | 50-70% |
| 定時調整規模 | 30-50% |
| 預留容量 | 20-40% |

```bash
# 設定預算警報
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

# 檢查應用程式洞察
azd monitor --overview

# 查看指標
az monitor metrics list --resource <resource-id>
```

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第7章：疑難排解](../chapter-07-troubleshooting/README.md) |
| <strong>完成課程</strong> | [課程首頁](../../README.md) |

---

## 📖 相關資源

- [AI 代理指南](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [多代理解決方案](../chapter-05-multi-agent/README.md)
- [微服務範例](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文檔的母語版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 第8章：生產與企業模式

**📚 課程**：[初學者的AZD](../../README.md) | **⏱️ 時長**：2-3 小時 | **⭐ 複雜度**：進階

---

## 概覽

本章涵蓋企業級部署模式、安全強化、監控及生產AI工作負載的成本優化。

> 於2026年6月，經`azd 1.25.6`驗證。

## 學習目標

完成本章後，您將能：
- 部署多區域具韌性的應用程式
- 實作企業安全模式
- 配置完整監控
- 大規模成本優化
- 使用 AZD 設定 CI/CD 管線

---

## 📚 課程單元

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [生產AI實務](production-ai-practices.md) | 企業部署模式 | 90 分鐘 |

---

## 🚀 生產檢查清單

- [ ] 多區域部署以提升韌性
- [ ] 使用管理身份進行驗證（無需金鑰）
- [ ] 使用 Application Insights 進行監控
- [ ] 設定成本預算和警示
- [ ] 啟用安全掃描
- [ ] 整合CI/CD管線
- [ ] 災難復原計畫

---

## 🏗️ 架構模式

### 模式1：微服務AI

```mermaid
graph LR
    Gateway[API 閘道] --> AI[人工智能服務] --> Models[Microsoft Foundry 模型]
    Gateway --> Auth[認證服務]
    AI --> Data[資料庫]
```

### 模式2：事件驅動AI

```mermaid
graph LR
    EventGrid[事件網格] --> Functions[函數] --> Pipeline[人工智能管道]
```

---

## 🔐 安全最佳實踐

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
| 零規模伸縮 (Container Apps) | 60-80% |
| 開發使用消耗層級 | 50-70% |
| 定時伸縮 | 30-50% |
| 預留容量 | 20-40% |

```bash
# 設定預算提示
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

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第7章：疑難排解](../chapter-07-troubleshooting/README.md) |
| <strong>課程結束</strong> | [課程首頁](../../README.md) |

---

## 📖 相關資源

- [AI代理指南](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [多代理解決方案](../chapter-05-multi-agent/README.md)
- [微服務範例](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
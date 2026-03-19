# 第8章：生產與企業模式

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ 時長**: 2-3 小時 | **⭐ 難度**: 進階

---

## 概覽

本章涵蓋企業就緒的部署模式、安全強化、監控，以及針對生產 AI 工作負載的成本優化。

## 學習目標

完成本章後，您將能夠：
- 部署多區域具韌性的應用程式
- 實作企業安全模式
- 設定完整的監控
- 在大規模環境中優化成本
- 使用 AZD 建置 CI/CD 管線

---

## 📚 課程

| # | 課程 | 描述 | 時間 |
|---|--------|-------------|------|
| 1 | [Production AI Practices](production-ai-practices.md) | 企業部署模式 | 90 分鐘 |

---

## 🚀 生產檢查清單

- [ ] 多區域部署以確保韌性
- [ ] 使用託管識別進行驗證（不使用金鑰）
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
    Gateway[API 閘道] --> AI[AI 服務] --> Models[Microsoft Foundry 模型]
    Gateway --> Auth[驗證服務]
    AI --> Data[資料儲存庫]
```
### 模式 2：事件驅動的 AI

```mermaid
graph LR
    EventGrid[事件網格] --> Functions[函數] --> Pipeline[AI 管線]
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
| 按需縮減至零（Container Apps） | 60-80% |
| 在開發環境使用消耗型方案 | 50-70% |
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
# 串流記錄
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
| <strong>上一章</strong> | [第7章：疑難排解](../chapter-07-troubleshooting/README.md) |
| <strong>課程完成</strong> | [課程首頁](../../README.md) |

---

## 📖 相關資源

- [AI Agents Guide](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Multi-Agent Solutions](../chapter-05-multi-agent/README.md)
- [Microservices Example](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為具權威性的來源。對於重要資訊，建議採用專業人工翻譯。對於因使用本翻譯而產生的任何誤解或誤釋，我們不承擔任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
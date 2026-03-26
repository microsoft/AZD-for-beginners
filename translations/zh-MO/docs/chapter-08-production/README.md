# 第8章：生產與企業模式

**📚 課程**: [AZD 初學者](../../README.md) | **⏱️ 時間**: 2-3 小時 | **⭐ 複雜度**: 進階

---

## 概覽

本章涵蓋企業等級的部署模式、安全強化、監控與針對生產 AI 工作負載的成本優化。

## 學習目標

完成本章後，您將能：
- 部署多區域具韌性的應用程式
- 實作企業級安全模式
- 設定完整的監控
- 在大規模下優化成本
- 使用 AZD 設定 CI/CD 管線

---

## 📚 課程

| # | 單元 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [生產環境 AI 實務](production-ai-practices.md) | 企業部署模式 | 90 分鐘 |

---

## 🚀 生產檢查清單

- [ ] 多區域部署以提高韌性
- [ ] 使用託管身分進行驗證（無金鑰）
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
    Gateway[API 閘道] --> AI[人工智能服務] --> Models[Microsoft Foundry 模型]
    Gateway --> Auth[認證服務]
    AI --> Data[資料儲存]
```
### 模式 2：事件驅動 AI

```mermaid
graph LR
    EventGrid[事件網格] --> Functions[函數] --> Pipeline[人工智能流程]
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
| 開發環境使用消耗層級 | 50-70% |
| 排程縮放 | 30-50% |
| 保留容量 | 20-40% |

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
| <strong>上一章</strong> | [第7章：故障排除](../chapter-07-troubleshooting/README.md) |
| <strong>課程完成</strong> | [課程首頁](../../README.md) |

---

## 📖 相關資源

- [AI 代理人指南](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [多代理方案](../chapter-05-multi-agent/README.md)
- [微服務 範例](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能含有錯誤或不準確之處。原始文件的原文應被視為具權威性的版本。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而引致的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
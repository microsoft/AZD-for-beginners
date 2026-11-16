# 第6章：部署前規劃與驗證

**📚 課程**: [AZD 初學者](../../README.md) | **⏱️ 時長**: 閱讀 2-4 小時；另需額外時間完成調整後實驗室 | **⭐ 複雜度**: 中階–高階

---

## 概覽

本章涵蓋部署應用程式前必要的規劃與驗證步驟。學習如何透過適當的容量規劃、SKU 選擇與預先檢查，避免昂貴錯誤。

> 指令指導已參考發佈的 `azd 1.37.2` 參考資料。未進行雲端部署。較長的課程包含說明性片段，而非完整本地部署專案。

## 學習目標

完成本章後，您將能：
- 在部署前執行預檢查
- 規劃容量並估算資源需求
- 選擇合適的 SKU 以優化成本
- 設定 Application Insights 以進行監控
- 了解多代理協調模式及其部署需求

---

## 📚 課程內容

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [預檢查](preflight-checks.md) | 部署前驗證設定 | 15 分鐘 |
| 2 | [容量規劃](capacity-planning.md) | 估算資源需求 | 20 分鐘 |
| 3 | [SKU 選擇](sku-selection.md) | 選擇合適的價格階層 | 15 分鐘 |
| 4 | [Application Insights](application-insights.md) | 設定監控 | 20 分鐘 |
| 5 | [協調模式](coordination-patterns.md) | 進階多代理協調設計 | 60-75 分鐘 |

---

## 🚀 快速開始

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ 部署前檢查清單

### `azd provision` 前

- [ ] 已核實區域配額
- [ ] 已適當選擇 SKU
- [ ] 已檢視成本估算
- [ ] 命名規則一致
- [ ] 已配置安全性/RBAC

### `azd deploy` 前

- [ ] 已設定環境變數
- [ ] 秘密存在 Key Vault
- [ ] 已核實連接字串
- [ ] 已配置健康檢查

---

## 💰 SKU 選擇指南

| 工作量 | 開發 | 生產 |
|----------|-------------|------------|
| Container Apps | 按用量付費 | 按用量付費或基於測量負載的專用工作負載配置 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI 模型 | 支援付費即用部署類型 | 付費即用或預配置吞吐量；依模型/區域而定 |
| AI 搜尋 | 限量內免費/基本版 | 根據索引、複製和查詢負載的大小選擇基本或標準等級 |

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第5章：多代理](../chapter-05-multi-agent/README.md) |
| <strong>下一章</strong> | [第7章：疑難排解](../chapter-07-troubleshooting/README.md) |

---

## 📖 相關資源

- [設定指南](../chapter-03-configuration/configuration.md)
- [部署指南](../chapter-04-infrastructure/deployment-guide.md)
- [常見問題](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
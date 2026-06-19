# 第 6 章：預部署規劃與驗證

**📚 課程**: [AZD 初學者](../../README.md) | **⏱️ 時長**: 1 小時 | **⭐ 複雜度**: 中階

---

## 概覽

本章涵蓋在部署應用程式之前的關鍵規劃與驗證步驟。學習如何透過適當的容量規劃、SKU 選擇與預檢查來避免昂貴的錯誤。

> 已於 2026 年 6 月針對 `azd 1.25.6` 驗證。

## 學習目標

完成本章後，您將：
- 在部署前執行預檢查
- 規劃容量並估算資源需求
- 為成本最佳化選擇適當的 SKU
- 設定 Application Insights 以便監控
- 了解團隊協調模式

---

## 📚 課程列表

| # | 課程 | 描述 | 時間 |
|---|--------|-------------|------|
| 1 | [部署前檢查](preflight-checks.md) | 在部署之前驗證組態 | 15 分鐘 |
| 2 | [容量規劃](capacity-planning.md) | 估算資源需求 | 20 分鐘 |
| 3 | [SKU 選擇](sku-selection.md) | 選擇適當的定價等級 | 15 分鐘 |
| 4 | [Application Insights](application-insights.md) | 設定監控 | 20 分鐘 |
| 5 | [協調模式](coordination-patterns.md) | 團隊部署工作流程 | 15 分鐘 |

---

## 🚀 快速開始

```bash
# 檢查訂閱配額
az vm list-usage --location eastus --output table

# 預覽部署（不會建立任何資源）
azd provision --preview

# 驗證 Bicep 語法
az bicep build --file infra/main.bicep

# 檢查環境設定
azd env get-values
```

---

## ☑️ 預部署檢查清單

### 在 `azd provision` 之前

- [ ] 已驗證該區域的配額
- [ ] 已適當選擇 SKUs
- [ ] 已檢閱成本估算
- [ ] 命名規則一致
- [ ] 已設定安全性/RBAC

### 在 `azd deploy` 之前

- [ ] 已設定環境變數
- [ ] 機密已放在 Key Vault 中
- [ ] 已驗證連線字串
- [ ] 已設定健康檢查

---

## 💰 SKU 選擇指南

| 工作負載 | 開發 | 生產 |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| **Previous** | [Chapter 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Next** | [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |

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
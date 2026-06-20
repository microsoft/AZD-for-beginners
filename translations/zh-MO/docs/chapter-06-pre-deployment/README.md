# 第 6 章：部署前規劃與驗證

**📚 課程**: [AZD For Beginners](../../README.md) | **⏱️ 時間**: 1 小時 | **⭐ 難度**: 中等

---

## 概覽

本章涵蓋在部署應用程式之前的必要規劃與驗證步驟。學習如何透過適當的容量規劃、SKU 選擇與預檢查來避免代價高昂的錯誤。

> 已於 2026 年 6 月使用 `azd 1.25.6` 驗證。

## 學習目標

完成本章後，您將能夠：
- 在部署前執行預檢查
- 規劃容量並估算資源需求
- 選擇適當 SKU 以優化成本
- 設定 Application Insights 以便監控
- 了解團隊協調模式

---

## 📚 課程

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [預檢查](preflight-checks.md) | 在部署前驗證設定 | 15 分鐘 |
| 2 | [容量規劃](capacity-planning.md) | 估算資源需求 | 20 分鐘 |
| 3 | [SKU 選擇](sku-selection.md) | 選擇適當的定價層 | 15 分鐘 |
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

## ☑️ 部署前檢查清單

### 在執行 `azd provision` 之前

- [ ] 已確認區域配額
- [ ] 已適當選擇 SKUs
- [ ] 已檢視成本估算
- [ ] 命名慣例一致
- [ ] 已設定安全性/RBAC

### 在執行 `azd deploy` 之前

- [ ] 已設定環境變數
- [ ] 機密已放入 Key Vault
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
| <strong>上一章</strong> | [第 5 章：多代理](../chapter-05-multi-agent/README.md) |
| <strong>下一章</strong> | [第 7 章：故障排除](../chapter-07-troubleshooting/README.md) |

---

## 📖 相關資源

- [設定指南](../chapter-03-configuration/configuration.md)
- [部署指南](../chapter-04-infrastructure/deployment-guide.md)
- [常見問題](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
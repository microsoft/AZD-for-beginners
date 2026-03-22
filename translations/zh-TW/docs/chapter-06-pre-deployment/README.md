# 第6章：部署前規劃與驗證

**📚 課程**: [AZD 初學者](../../README.md) | **⏱️ 時間**: 1 小時 | **⭐ 複雜度**: 中階

---

## 概覽

本章涵蓋在部署應用程式之前的必要規劃與驗證步驟。透過適當的容量規劃、SKU 選擇與預檢查，可避免代價高昂的錯誤。

## 學習目標

完成本章後，您將能：
- 於部署前執行預檢查
- 規劃容量並估算資源需求
- 為成本最佳化選擇適當的 SKU
- 設定 Application Insights 以便監控
- 理解團隊協調模式

---

## 📚 課程

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [預檢查](preflight-checks.md) | 在部署前驗證設定 | 15 分鐘 |
| 2 | [容量規劃](capacity-planning.md) | 估算資源需求 | 20 分鐘 |
| 3 | [SKU 選擇](sku-selection.md) | 選擇適當的定價階層 | 15 分鐘 |
| 4 | [Application Insights](application-insights.md) | 設定監控 | 20 分鐘 |
| 5 | [協調模式](coordination-patterns.md) | 團隊部署工作流程 | 15 分鐘 |

---

## 🚀 快速上手

```bash
# 檢查訂閱配額
az vm list-usage --location eastus --output table

# 預覽部署（不會建立資源）
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
- [ ] 已適當選擇 SKU
- [ ] 已檢閱成本估算
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
| <strong>上一章</strong> | [第5章：多代理](../chapter-05-multi-agent/README.md) |
| <strong>下一章</strong> | [第7章：疑難排解](../chapter-07-troubleshooting/README.md) |

---

## 📖 相關資源

- [設定指南](../chapter-03-configuration/configuration.md)
- [部署指南](../chapter-04-infrastructure/deployment-guide.md)
- [常見問題](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們力求精確，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的原文應視為具權威性的版本。對於重要資訊，建議採用專業人工翻譯。我們對於因使用本翻譯而產生的任何誤解或曲解概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
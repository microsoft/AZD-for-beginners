# Chapter 6: 預部署規劃與驗證

**📚 課程**: [AZD 入門](../../README.md) | **⏱️ 時長**: 1 小時 | **⭐ 複雜度**: 中階

---

## 概覽

本章涵蓋部署應用程式前的重要規劃與驗證步驟。學習透過適當的容量規劃、SKU 選擇及預檢查，避免代價高昂的錯誤。

> 依據 `azd 1.25.6` 於 2026 年 6 月驗證。

## 學習目標

完成本章後，您將能：
- 在部署前執行預檢查
- 規劃容量並估算資源需求
- 選擇合適 SKU 以進行成本優化
- 配置 Application Insights 以進行監控
- 理解團隊協作模式

---

## 📚 課程內容

| # | 課程 | 說明 | 時長 |
|---|--------|-------------|------|
| 1 | [預檢查](preflight-checks.md) | 在部署前驗證配置 | 15 分鐘 |
| 2 | [容量規劃](capacity-planning.md) | 估算資源需求 | 20 分鐘 |
| 3 | [SKU 選擇](sku-selection.md) | 選擇合適的價格層級 | 15 分鐘 |
| 4 | [Application Insights](application-insights.md) | 配置監控 | 20 分鐘 |
| 5 | [協作模式](coordination-patterns.md) | 團隊部署工作流程 | 15 分鐘 |

---

## 🚀 快速開始

```bash
# 檢查訂閱配額
az vm list-usage --location eastus --output table

# 預覽部署（無資源建立）
azd provision --preview

# 驗證 Bicep 語法
az bicep build --file infra/main.bicep

# 檢查環境配置
azd env get-values
```

---

## ☑️ 部署前檢查清單

### `azd provision` 前

- [ ] 核實區域配額
- [ ] 適當選擇 SKU
- [ ] 審核成本估算
- [ ] 命名規範一致
- [ ] 配置安全性/RBAC

### `azd deploy` 前

- [ ] 設定環境變數
- [ ] 秘密存於 Key Vault
- [ ] 確認連接字串
- [ ] 配置健康檢查

---

## 💰 SKU 選擇指南

| 工作負載 | 開發 | 生產 |
|----------|-------------|------------|
| Container Apps | 消耗計費 | 專用 D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | 標準 | 標準 + PTU |
| AI Search | 基礎 | 標準 S2+ |

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第 5 章：多代理](../chapter-05-multi-agent/README.md) |
| <strong>下一章</strong> | [第 7 章：故障排除](../chapter-07-troubleshooting/README.md) |

---

## 📖 相關資源

- [配置指南](../chapter-03-configuration/configuration.md)
- [部署指南](../chapter-04-infrastructure/deployment-guide.md)
- [常見問題](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
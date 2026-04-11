# Chapter 6: 部署前規劃及驗證

**📚 課程**: [AZD 初學者指南](../../README.md) | **⏱️ 時長**: 1 小時 | **⭐ 複雜度**: 中階

---

## 概述

本章涵蓋部署應用程式前的基本規劃與驗證步驟。學習如何透過適當的容量規劃、SKU 選擇和預先檢查，避免代價高昂的錯誤。

> 於 2026 年 3 月驗證通過 `azd 1.23.12`。

## 學習目標

完成本章後，您將能夠：
- 在部署前執行預檢查
- 進行容量規劃並估算資源需求
- 選擇適合的 SKU 優化成本
- 配置 Application Insights 監控
- 了解團隊協作模式

---

## 📚 課程內容

| # | 課程 | 課程說明 | 時間 |
|---|--------|-------------|------|
| 1 | [預檢查](preflight-checks.md) | 部署前驗證設定 | 15 分鐘 |
| 2 | [容量規劃](capacity-planning.md) | 估算資源需求 | 20 分鐘 |
| 3 | [SKU 選擇](sku-selection.md) | 選擇適合的價格層級 | 15 分鐘 |
| 4 | [Application Insights](application-insights.md) | 配置監控 | 20 分鐘 |
| 5 | [協作模式](coordination-patterns.md) | 團隊部署工作流程 | 15 分鐘 |

---

## 🚀 快速開始

```bash
# 檢查訂閱配額
az vm list-usage --location eastus --output table

# 預覽部署（不會建立資源）
azd provision --preview

# 驗證 Bicep 語法
az bicep build --file infra/main.bicep

# 檢查環境配置
azd env get-values
```

---

## ☑️ 部署前檢查表

### `azd provision` 前

- [ ] 核實區域配額
- [ ] 適當選擇 SKU
- [ ] 審核成本估算
- [ ] 命名規則一致
- [ ] 配置安全性/RBAC

### `azd deploy` 前

- [ ] 設定環境變數
- [ ] 秘密儲存在 Key Vault
- [ ] 驗證連接字串
- [ ] 配置健康檢查

---

## 💰 SKU 選擇指南

| 工作負載 | 開發環境 | 生產環境 |
|----------|-------------|------------|
| Container Apps | Consumption | 專用 D4 |
| App Service | B1/B2 | P1v3 以上 |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2 以上 |

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第 5 章：多代理](../chapter-05-multi-agent/README.md) |
| <strong>下一章</strong> | [第 7 章：疑難排解](../chapter-07-troubleshooting/README.md) |

---

## 📖 相關資源

- [設定指南](../chapter-03-configuration/configuration.md)
- [部署指南](../chapter-04-infrastructure/deployment-guide.md)
- [常見問題](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件乃使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 所翻譯。雖我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原文語言版本應視為權威資料來源。對於重要資訊，建議採用專業人工翻譯。本公司不對因使用此翻譯而引致任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
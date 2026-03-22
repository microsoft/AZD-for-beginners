# Chapter 6: 預部署規劃與驗證

**📚 課程**: [AZD 初學者](../../README.md) | **⏱️ 時長**: 1 小時 | **⭐ 複雜度**: 中階

---

## 概覽

本章涵蓋部署應用程式前的重要規劃與驗證步驟。學習如何透過適當的容量規劃、SKU 選擇與預檢查避免昂貴的錯誤。

## 學習目標

完成本章後，你將能夠：
- 在部署前執行預檢查
- 規劃容量並估算資源需求
- 選擇合適的 SKU 以優化成本
- 配置 Application Insights 進行監控
- 理解團隊協作模式

---

## 📚 課程內容

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [預檢查](preflight-checks.md) | 部署前驗證配置 | 15 分鐘 |
| 2 | [容量規劃](capacity-planning.md) | 估算資源需求 | 20 分鐘 |
| 3 | [SKU 選擇](sku-selection.md) | 選擇適當的定價等級 | 15 分鐘 |
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

## ☑️ 預部署檢查表

### 在 `azd provision` 之前

- [ ] 驗證區域配額
- [ ] 適當選擇 SKU
- [ ] 審閱成本預估
- [ ] 命名規則一致
- [ ] 配置安全性/RBAC

### 在 `azd deploy` 之前

- [ ] 設定環境變數
- [ ] 機密存於 Key Vault
- [ ] 驗證連接字串
- [ ] 配置健康檢查

---

## 💰 SKU 選擇指南

| 工作負載 | 開發 | 生產 |
|----------|-------------|------------|
| 容器應用程式 | 按需付費 | 專用 D4 |
| 應用服務 | B1/B2 | P1v3+ |
| Microsoft Foundry 模型 | 標準 | 標準 + PTU |
| AI 搜尋 | 基本 | 標準 S2+ |

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第 5 章：多代理](../chapter-05-multi-agent/README.md) |
| <strong>下一章</strong> | [第 7 章：疑難排解](../chapter-07-troubleshooting/README.md) |

---

## 📖 相關資源

- [配置指南](../chapter-03-configuration/configuration.md)
- [部署指南](../chapter-04-infrastructure/deployment-guide.md)
- [常見問題](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯所得。雖然我們致力於準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於重要資訊，建議採用專業人工翻譯。對於因使用本翻譯而引起的任何誤解或誤釋，本公司概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
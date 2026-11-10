# 第6章：部署前規劃與驗證

**📚 課程**：[初學者的AZD](../../README.md) | **⏱️ 時間**：閱讀2-4小時；另需適應性實驗時間 | **⭐ 複雜度**：中級–進階

---

## 概覽

本章涵蓋部署應用程式前的重要規劃與驗證步驟。透過適當的容量規劃、SKU 選擇與預檢查，學會避免昂貴的錯誤。

> 指令指南已依照發布的 `azd 1.37.2` 參考文件審查。未執行雲端部署。較長的課程包含示範片段，非完整本地部署專案。

## 學習目標

完成本章後，您將能：
- 部署前執行預檢查
- 規劃容量並估算資源需求
- 選擇適當SKU以優化成本
- 配置 Application Insights 進行監控
- 了解多代理協調模式及其部署需求

---

## 📚 課程列表

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [預檢查](preflight-checks.md) | 驗證部署前配置 | 15 分鐘 |
| 2 | [容量規劃](capacity-planning.md) | 估算資源需求 | 20 分鐘 |
| 3 | [SKU 選擇](sku-selection.md) | 選擇合適的價格層 | 15 分鐘 |
| 4 | [Application Insights](application-insights.md) | 配置監控 | 20 分鐘 |
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

- [ ] 驗證區域配額
- [ ] 適當選擇SKU
- [ ] 成本估算審閱
- [ ] 命名慣例一致
- [ ] 配置安全性/RBAC

### `azd deploy` 前

- [ ] 設定環境變數
- [ ] 機密存於 Key Vault
- [ ] 驗證連線字串
- [ ] 配置健康檢查

---

## 💰 SKU 選擇指南

| 工作負載 | 開發 | 生產 |
|----------|-------------|------------|
| Container Apps | 消耗 | 消耗或專用工作負載配置，依據實測負載 |
| App Service | B1/B2 | P1v3以上 |
| Azure OpenAI 模型 | 支援隨用隨付部署類型 | 隨用隨付或預配吞吐量；依模型/區域而定 |
| AI 搜尋 | 免費/基礎內限額 | 依索引、複本及查詢負載大小的基礎或標準層 |

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第5章：多代理](../chapter-05-multi-agent/README.md) |
| <strong>下一章</strong> | [第7章：疑難排解](../chapter-07-troubleshooting/README.md) |

---

## 📖 相關資源

- [配置指南](../chapter-03-configuration/configuration.md)
- [部署指南](../chapter-04-infrastructure/deployment-guide.md)
- [常見問題](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
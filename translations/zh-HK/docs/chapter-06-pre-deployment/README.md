# 第 6 章：部署前規劃與驗證

**📚 課程**: [AZD 初學者](../../README.md) | **⏱️ 時長**: 2-4 小時閱讀；額外時間用於調整化實驗室 | **⭐ 難度**: 中階–進階

---

## 概覽

本章涵蓋部署應用程式前的重要規劃與驗證步驟。學習如何透過適當的容量規劃、SKU 選擇及預檢查，避免昂貴錯誤。

> 命令指引已依據發行的 `azd 1.37.2` 參考檔核對。未進行雲端部署。較長課程包含示範片段，非完整本地部署專案。

## 學習目標

完成本章後，您將能：
- 部署前執行預檢查
- 規劃容量並評估資源需求
- 選擇適當 SKU 以達成成本優化
- 設定 Application Insights 進行監控
- 了解多代理協調模式及其部署需求

---

## 📚 課程內容

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [預檢查](preflight-checks.md) | 部署前驗證設定 | 15 分鐘 |
| 2 | [容量規劃](capacity-planning.md) | 估算資源需求 | 20 分鐘 |
| 3 | [SKU 選擇](sku-selection.md) | 選擇適當價格層級 | 15 分鐘 |
| 4 | [Application Insights](application-insights.md) | 設定監控 | 20 分鐘 |
| 5 | [協調模式](coordination-patterns.md) | 進階多代理編排設計 | 60-75 分鐘 |

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

## ☑️ 部署前清單

### 在 `azd provision` 之前

- [ ] 已驗證區域配額
- [ ] SKU 已適當選擇
- [ ] 已檢視成本估算
- [ ] 命名規則一致
- [ ] 安全性/RBAC 已設定

### 在 `azd deploy` 之前

- [ ] 環境變數已設定
- [ ] 機密儲存在 Key Vault
- [ ] 連線字串已驗證
- [ ] 健康檢查已配置

---

## 💰 SKU 選擇指南

| 工作負載 | 開發 | 生產 |
|----------|-------------|------------|
| Container Apps | 消耗制 | 根據量測負載選擇消耗制或專用工作負載配置 |
| App Service | B1/B2 | P1v3 以上 |
| Azure OpenAI 模型 | 支援隨用隨付部署類型 | 隨用隨付或預配吞吐量；依模型及區域而定 |
| AI 搜尋 | 免費/基礎版限額內 | 根據索引、複本及查詢負載大小調整基礎或標準層 |

---

## 🔗 導航

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
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
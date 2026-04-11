# 第6章：部署前的規劃與驗證

**📚 課程**：[Azure 開發者入門](../../README.md) | **⏱️ 時長**：1 小時 | **⭐ 複雜度**：中階

---

## 概述

本章涵蓋在部署應用程式前的關鍵規劃與驗證步驟。學習如何透過適當的容量規劃、SKU 選擇與預檢查來避免昂貴錯誤。

> 已於 2026 年 3 月使用 `azd 1.23.12` 進行驗證。

## 學習目標

完成本章後，您將能夠：
- 在部署前執行預檢查
- 規劃容量並估算資源需求
- 選擇適合的 SKU 以完成本成本優化
- 配置 Application Insights 進行監控
- 理解團隊協作模式

---

## 📚 課程單元

| # | 課程單元 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [預檢查](preflight-checks.md) | 部署前驗證設定 | 15 分鐘 |
| 2 | [容量規劃](capacity-planning.md) | 估算資源需求 | 20 分鐘 |
| 3 | [SKU 選擇](sku-selection.md) | 選擇合適的價格層級 | 15 分鐘 |
| 4 | [Application Insights](application-insights.md) | 配置監控 | 20 分鐘 |
| 5 | [協作模式](coordination-patterns.md) | 團隊部署工作流程 | 15 分鐘 |

---

## 🚀 快速開始

```bash
# 檢查訂閱配額
az vm list-usage --location eastus --output table

# 預覽部署（不建立資源）
azd provision --preview

# 驗證 Bicep 語法
az bicep build --file infra/main.bicep

# 檢查環境配置
azd env get-values
```

---

## ☑️ 部署前檢查清單

### 在 `azd provision` 前

- [ ] 驗證區域配額
- [ ] 適當選擇 SKU
- [ ] 審核成本估算
- [ ] 命名規則一致
- [ ] 設定安全性/RBAC

### 在 `azd deploy` 前

- [ ] 設定環境變數
- [ ] 秘密存放於 Key Vault
- [ ] 驗證連接字串
- [ ] 設定健康檢查

---

## 💰 SKU 選擇指南

| 工作負載 | 開發 | 生產 |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第5章：多代理](../chapter-05-multi-agent/README.md) |
| <strong>下一章</strong> | [第7章：故障排除](../chapter-07-troubleshooting/README.md) |

---

## 📖 相關資源

- [設定指南](../chapter-03-configuration/configuration.md)
- [部署指南](../chapter-04-infrastructure/deployment-guide.md)
- [常見問題](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件之母語版本應視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用此翻譯而產生之任何誤解或誤譯負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
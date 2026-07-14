# 第6章：部署前規劃與驗證

**📚 課程**: [AZD 初學者指南](../../README.md) | **⏱️ 時長**: 1 小時 | **⭐ 難度**: 中階

---

## 概述

本章涵蓋在部署應用程式前的重要規劃和驗證步驟。學習如何透過適當的容量規劃、SKU 選擇及預檢查，避免昂貴錯誤。

> 已於2026年7月使用 `azd 1.27.1` 驗證。

## 學習目標

完成本章後，您將能：
- 執行部署前的預檢查
- 進行容量規劃及資源需求預估
- 為成本優化選擇合適的SKU
- 配置 Application Insights 進行監控
- 了解團隊協作模式

---

## 📚 課程列表

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [預檢查](preflight-checks.md) | 部署前驗證設定 | 15 分鐘 |
| 2 | [容量規劃](capacity-planning.md) | 預估資源需求 | 20 分鐘 |
| 3 | [SKU 選擇](sku-selection.md) | 選擇適合的定價級別 | 15 分鐘 |
| 4 | [Application Insights](application-insights.md) | 配置監控 | 20 分鐘 |
| 5 | [協作模式](coordination-patterns.md) | 團隊部署流程 | 15 分鐘 |

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

## ☑️ 部署前檢查清單

### 在 `azd provision` 之前

- [ ] 已核實區域配額
- [ ] SKU 已適當選擇
- [ ] 成本預估已審查
- [ ] 命名規則一致
- [ ] 已配置安全性/RBAC

### 在 `azd deploy` 之前

- [ ] 環境變數已設定
- [ ] 秘密存於 Key Vault
- [ ] 連接字串已核實
- [ ] 已配置健康檢查

---

## 💰 SKU 選擇指南

| 工作負載 | 開發環境 | 生產環境 |
|----------|-------------|------------|
| 容器應用程式 | 消耗型 | 專用 D4 |
| 應用服務 | B1/B2 | P1v3 以上 |
| Microsoft Foundry 模型 | 標準 | 標準 + PTU |
| AI 搜尋 | 基本 | 標準 S2 以上 |

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
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 第 6 章：部署前規劃與驗證

**📚 課程**: [AZD 初學者](../../README.md) | **⏱️ 時長**: 1 小時 | **⭐ 難度**: 中等

---

## 概覽

本章涵蓋在部署應用程式之前的重要規劃與驗證步驟。學習如何透過適當的容量規劃、SKU 選擇與預檢查來避免昂貴的錯誤。

> 已於 2026 年 3 月依據 `azd 1.23.12` 進行驗證。

## 學習目標

完成本章後，您將能：
- 在部署前執行預檢檢查
- 規劃容量並估算資源需求
- 選擇適當的 SKU 以優化成本
- 為監控設定 Application Insights
- 了解團隊協調模式

---

## 📚 課程

| # | 單元 | 描述 | 時間 |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | 在部署前驗證配置 | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | 估算資源需求 | 20 min |
| 3 | [SKU Selection](sku-selection.md) | 選擇合適的定價等級 | 15 min |
| 4 | [Application Insights](application-insights.md) | 設定監控 | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | 團隊部署工作流程 | 15 min |

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

### 在 `azd provision` 之前

- [ ] 已確認該區域的配額
- [ ] 已妥善選擇 SKU
- [ ] 已檢視成本估算
- [ ] 命名慣例一致
- [ ] 已設定安全性/RBAC

### 在 `azd deploy` 之前

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
| <strong>上一章</strong> | [Chapter 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| <strong>下一章</strong> | [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |

---

## 📖 相關資源

- [Configuration Guide](../chapter-03-configuration/configuration.md)
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- [Common Issues](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為具權威性的來源。對於重要資訊，建議採用專業人工翻譯。我們對因使用此翻譯而導致的任何誤解或誤譯概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
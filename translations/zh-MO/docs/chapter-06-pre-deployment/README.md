# 第6章：部署前規劃與驗證

**📚 課程**: [AZD 初學者指南](../../README.md) | **⏱️ 時間**: 1 小時 | **⭐ 複雜度**: 中等

---

## 概覽

本章涵蓋在部署應用程式之前的必要規劃與驗證步驟。透過適當的容量規劃、SKU 選擇與預檢查，學習避免代價高昂的錯誤。

## 學習目標

完成本章後，您將能：
- 在部署前執行預檢查
- 規劃容量並估算資源需求
- 選擇適當的 SKU 以優化成本
- 設定 Application Insights 以進行監控
- 了解團隊協作模式

---

## 📚 課程單元

| # | 課程 | 描述 | 時間 |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | 在部署前驗證設定 | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | 估算資源需求 | 20 min |
| 3 | [SKU Selection](sku-selection.md) | 選擇適當的價格層 | 15 min |
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

## ☑️ 部署前清單

### 在 `azd provision` 之前

- [ ] 已核實區域配額
- [ ] 已適當選擇 SKUs
- [ ] 已審查成本估算
- [ ] 命名規則一致
- [ ] 已配置安全性/RBAC

### 在 `azd deploy` 之前

- [ ] 已設定環境變數
- [ ] 機密已存於 Key Vault
- [ ] 已驗證連接字串
- [ ] 已配置健康檢查

---

## 💰 SKU 選擇指南

| 工作負載 | 開發 | 生產 |
|----------|-------------|------------|
| 容器應用 | 按使用量 | 專用 D4 |
| 應用服務 | B1/B2 | P1v3+ |
| Microsoft Foundry 模型 | 標準 | 標準 + PTU |
| AI 搜尋 | 基礎 | 標準 S2+ |

---

## 🔗 導航

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
**Disclaimer**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但自動翻譯可能包含錯誤或不準確之處。原始文件之原文版本應被視為具權威性的來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而引致的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
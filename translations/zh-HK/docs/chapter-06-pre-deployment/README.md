# Chapter 6: Pre-Deployment Planning & Validation

**📚 課程**: [AZD For Beginners](../../README.md) | **⏱️ 時間**: 1 小時 | **⭐ 複雜度**: 中階

---

## 概覽

本章涵蓋在部署應用程式之前的必要規劃與驗證步驟。透過適當的容量規劃、SKU 選擇與預檢查，學習如何避免代價高昂的錯誤。

## 學習目標

完成本章後，您將能：
- 在部署前執行預檢查
- 規劃容量並估算資源需求
- 選擇合適的 SKU 以最佳化成本
- 設定 Application Insights 以進行監控
- 了解團隊協調模式

---

## 📚 課程

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | 在部署前驗證設定 | 15 分鐘 |
| 2 | [Capacity Planning](capacity-planning.md) | 估算資源需求 | 20 分鐘 |
| 3 | [SKU Selection](sku-selection.md) | 選擇適當的定價等級 | 15 分鐘 |
| 4 | [Application Insights](application-insights.md) | 設定監控 | 20 分鐘 |
| 5 | [Coordination Patterns](coordination-patterns.md) | 團隊部署工作流程 | 15 分鐘 |

---

## 🚀 快速開始

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

### 在 `azd provision` 之前

- [ ] 已核實該地區配額
- [ ] 已適當選擇 SKU
- [ ] 已審閱成本估算
- [ ] 命名慣例一致
- [ ] 已配置安全性/RBAC

### 在 `azd deploy` 之前

- [ ] 已設定環境變數
- [ ] 機密已放入 Key Vault
- [ ] 已核實連接字串
- [ ] 已配置健康檢查

---

## 💰 SKU 選擇指南

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 導覽

| Direction | Chapter |
|-----------|---------|
| **Previous** | [第 5 章：多代理](../chapter-05-multi-agent/README.md) |
| **Next** | [第 7 章：疑難排解](../chapter-07-troubleshooting/README.md) |

---

## 📖 相關資源

- [設定指南](../chapter-03-configuration/configuration.md)
- [部署指南](../chapter-04-infrastructure/deployment-guide.md)
- [常見問題](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：

本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能仍含有錯誤或不準確之處。原文（以原始語言撰寫）應視為具權威性的版本。若內容涉及重要資訊，建議委託專業人工翻譯。對於因使用本翻譯所引致的任何誤解或錯誤詮釋，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 第7章：疑難排解與除錯

**📚 課程**: [AZD 初學者](../../README.md) | **⏱️ 時間**: 1-1.5 小時 | **⭐ 複雜程度**: 中等

---

## 概覽

本章協助你診斷並解決使用 Azure Developer CLI 時常見的問題，從部署失敗到 AI 特定的問題。

## 學習目標

By completing this chapter, you will:
- 診斷常見的 AZD 部署失敗問題
- 除錯身份驗證與權限問題
- 解決 AI 服務連線問題
- 使用 Azure 入口網站與 CLI 進行故障排查

---

## 📚 課程單元

| # | 單元 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [Common Issues](common-issues.md) | 常見遇到的問題 | 30 分鐘 |
| 2 | [Debugging Guide](debugging.md) | 逐步除錯策略 | 45 分鐘 |
| 3 | [AI Troubleshooting](ai-troubleshooting.md) | AI 特定問題 | 30 分鐘 |

---

## 🚨 快速修復

### 身份驗證問題
```bash
azd auth login
az login
azd auth whoami
```

### 佈建失敗
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### 資源衝突
```bash
azd down --force --purge
azd env new different-name
azd up
```

### 超出配額
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 錯誤代碼參考

| 錯誤 | 原因 | 解決方案 |
|-------|-------|----------|
| `AuthenticationError` | 未登入 | `azd auth login` |
| `ResourceNotFound` | 找不到資源 | 檢查資源名稱 |
| `QuotaExceeded` | 訂閱配額限制 | 申請提高配額 |
| `InvalidTemplate` | Bicep 語法錯誤 | `az bicep build` |
| `Conflict` | 資源已存在 | 使用新名稱或刪除 |
| `Forbidden` | 權限不足 | 檢查 RBAC 角色 |

---

## 🔄 重置與復原

```bash
# 軟重置（保留資源，重新部署程式碼）
azd deploy --force

# 硬重置（刪除所有，從頭開始）
azd down --force --purge
azd up
```

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| **上一章** | [第6章：部署前準備](../chapter-06-pre-deployment/README.md) |
| **下一章** | [第8章：生產環境](../chapter-08-production/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/preflight-checks.md)
- [設定指南](../chapter-03-configuration/configuration.md)
- [AZD GitHub 問題](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co‑op Translator（https://github.com/Azure/co-op-translator）進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原文（以原始語言撰寫之文件）應被視為權威版本。對於重要資訊，建議採用專業人工翻譯。我們不會對因使用本翻譯而引致的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
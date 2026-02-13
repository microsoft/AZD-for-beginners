# 第7章：疑難排解與除錯

**📚 課程**: [AZD For Beginners](../../README.md) | **⏱️ 時間長度**: 1-1.5 小時 | **⭐ 複雜度**: 中階

---

## 概覽

本章幫助你診斷並解決使用 Azure Developer CLI 時常見的問題。從部署失敗到 AI 特定問題。

## 學習目標

完成本章後，你將能：
- 診斷常見的 AZD 部署失敗
- 除錯驗證與權限問題
- 解決 AI 服務連線問題
- 使用 Azure 入口網站與 CLI 進行故障排除

---

## 📚 課程

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [Common Issues](common-issues.md) | 常見問題 | 30 min |
| 2 | [Debugging Guide](debugging.md) | 逐步除錯策略 | 45 min |
| 3 | [AI Troubleshooting](ai-troubleshooting.md) | AI 特定問題疑難排解 | 30 min |

---

## 🚨 快速修復

### 驗證問題
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

### 配額超過
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
| `ResourceNotFound` | 資源不存在 | 檢查資源名稱 |
| `QuotaExceeded` | 訂閱限制 | 申請提高配額 |
| `InvalidTemplate` | Bicep 語法錯誤 | `az bicep build` |
| `Conflict` | 資源已存在 | 使用新名稱或刪除 |
| `Forbidden` | 權限不足 | 檢查 RBAC 角色 |

---

## 🔄 重設與復原

```bash
# 軟重置（保留資源，重新部署程式碼）
azd deploy --force

# 硬重置（刪除所有內容，從頭開始）
azd down --force --purge
azd up
```

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| **上一章** | [第6章：預部署](../chapter-06-pre-deployment/README.md) |
| **下一章** | [第8章：生產環境](../chapter-08-production/README.md) |

---

## 📖 相關資源

- [預部署檢查](../chapter-06-pre-deployment/preflight-checks.md)
- [設定指南](../chapter-03-configuration/configuration.md)
- [AZD GitHub 問題](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件是使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不精確之處。原始文件的母語版本應視為具權威性的版本。對於關鍵資訊，建議採用專業人工翻譯。我們對因使用此翻譯而導致的任何誤解或曲解不負任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
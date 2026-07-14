# 第7章：故障排除與除錯

**📚 課程**: [AZD 初學者指南](../../README.md) | **⏱️ 時長**: 1-1.5 小時 | **⭐ 複雜度**: 中級

---

## 概覽

本章幫助你診斷及解決使用 Azure Developer CLI 時的常見問題。從部署失敗到 AI 特有問題皆涵蓋。

> 以 `azd 1.27.1` 於2026年7月驗證。

## 學習目標

完成本章後，你將能：
- 診斷常見 AZD 部署失敗
- 除錯驗證與權限問題
- 解決 AI 服務連線問題
- 使用 Azure 入口網站與 CLI 進行故障排除

---

## 📚 課程列表

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [常見問題](common-issues.md) | 頻繁遇到的問題 | 30 分鐘 |
| 2 | [除錯指南](debugging.md) | 逐步除錯策略 | 45 分鐘 |
| 3 | [AI 故障排除](ai-troubleshooting.md) | AI 特有問題 | 30 分鐘 |

---

## 🚨 快速修復

### 驗證問題
```bash
# AZD 工作流程所需
azd auth login

# 如果你同時直接使用 Azure CLI 命令，則可選擇性使用
az login

azd auth status
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

### 超過配額
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
| `ResourceNotFound` | 資源缺失 | 檢查資源名稱 |
| `QuotaExceeded` | 訂閱限制 | 申請配額提升 |
| `InvalidTemplate` | Bicep 語法錯誤 | `az bicep build` |
| `Conflict` | 資源已存在 | 使用新名稱或刪除 |
| `Forbidden` | 權限不足 | 檢查 RBAC 角色 |

---

## 🔄 重置與回復

```bash
# 軟重設（保留資源，重新部署代碼）
azd deploy --force

# 硬重設（刪除所有內容，重新開始）
azd down --force --purge
azd up
```

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第6章：部署前準備](../chapter-06-pre-deployment/README.md) |
| <strong>下一章</strong> | [第8章：生產環境](../chapter-08-production/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/preflight-checks.md)
- [設定指南](../chapter-03-configuration/configuration.md)
- [AZD GitHub 問題頁](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
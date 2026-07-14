# 第7章：疑難排解與除錯

**📚 課程**: [AZD 初學者指南](../../README.md) | **⏱️ 時長**: 1-1.5 小時 | **⭐ 複雜度**: 中階

---

## 概覽

本章節協助您診斷及解決在使用 Azure Developer CLI 時常見的問題。從部署失敗到 AI 專屬問題。

> 已於 2026 年 7 月透過 `azd 1.27.1` 驗證。

## 學習目標

完成本章節後，您將能夠：
- 診斷常見的 AZD 部署失敗問題
- 除錯驗證與權限相關問題
- 解決 AI 服務連線問題
- 使用 Azure 入口網站與 CLI 進行疑難排解

---

## 📚 課程單元

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [常見問題](common-issues.md) | 經常遇到的問題 | 30 分鐘 |
| 2 | [除錯指南](debugging.md) | 逐步除錯策略 | 45 分鐘 |
| 3 | [AI 疑難排解](ai-troubleshooting.md) | AI 專屬問題 | 30 分鐘 |

---

## 🚨 速效解決方案

### 驗證問題
```bash
# AZD 工作流程所需
azd auth login

# 如果您也直接使用 Azure CLI 命令，則為可選
az login

azd auth status
```

### 部署失敗
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

### 配額超限
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 錯誤代碼參考

| 錯誤 | 原因 | 解決方法 |
|-------|-------|----------|
| `AuthenticationError` | 尚未登入 | `azd auth login` |
| `ResourceNotFound` | 資源缺失 | 檢查資源名稱 |
| `QuotaExceeded` | 訂閱配額限制 | 申請增加配額 |
| `InvalidTemplate` | Bicep 語法錯誤 | `az bicep build` |
| `Conflict` | 資源已存在 | 使用新名稱或刪除現有資源 |
| `Forbidden` | 權限不足 | 檢查 RBAC 角色 |

---

## 🔄 重置與復原

```bash
# 軟重設（保留資源，重新部署代碼）
azd deploy --force

# 硬重設（刪除所有內容，重新開始）
azd down --force --purge
azd up
```

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第6章：部署前準備](../chapter-06-pre-deployment/README.md) |
| <strong>下一章</strong> | [第8章：生產環境](../chapter-08-production/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/preflight-checks.md)
- [設定指南](../chapter-03-configuration/configuration.md)
- [AZD GitHub 問題回報](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 第7章：疑難排解與除錯

**📚 課程**: [AZD For Beginners](../../README.md) | **⏱️ 時長**: 1-1.5 小時 | **⭐ 複雜度**: 中階

---

## 概覽

本章協助你在使用 Azure Developer CLI 時診斷和解決常見問題。範圍從部署失敗到 AI 專屬問題。

> 已於 2026 年 3 月 使用 `azd 1.23.12` 驗證。

## 學習目標

完成本章後，你將能：
- 診斷常見的 AZD 部署失敗
- 偵錯驗證與權限問題
- 解決 AI 服務連線問題
- 使用 Azure 入口網站與 CLI 進行疑難排解

---

## 📚 課程

| # | 單元 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [常見問題](common-issues.md) | 常見問題 | 30 分鐘 |
| 2 | [除錯指南](debugging.md) | 逐步除錯策略 | 45 分鐘 |
| 3 | [AI 疑難排解](ai-troubleshooting.md) | AI 專屬問題 | 30 分鐘 |

---

## 🚨 快速修復

### 驗證問題
```bash
# 為 AZD 工作流程所需
azd auth login

# 如果你亦直接使用 Azure CLI 命令，則為可選
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

### 配額超出
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
| `QuotaExceeded` | 訂閱配額限制 | 請求提高配額 |
| `InvalidTemplate` | Bicep 語法錯誤 | `az bicep build` |
| `Conflict` | 資源已存在 | 使用新名稱或刪除現有資源 |
| `Forbidden` | 權限不足 | 檢查 RBAC 角色 |

---

## 🔄 重置與復原

```bash
# 軟性重置（保留資源，重新部署程式碼）
azd deploy --force

# 硬性重置（刪除所有資料，從頭開始）
azd down --force --purge
azd up
```

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第6章：部署前檢查](../chapter-06-pre-deployment/README.md) |
| <strong>下一章</strong> | [第8章：生產環境](../chapter-08-production/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/preflight-checks.md)
- [設定指南](../chapter-03-configuration/configuration.md)
- [AZD GitHub 問題](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不精確之處。原始語言的文件應被視為具權威性的來源。對於關鍵資訊，建議採用專業人工翻譯。我們對因使用此翻譯而導致的任何誤解或誤譯不承擔任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
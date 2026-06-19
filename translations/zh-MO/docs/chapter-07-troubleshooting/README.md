# 第7章：疑難排解與除錯

**📚 課程**: [AZD 初學者](../../README.md) | **⏱️ 時間**: 1-1.5 小時 | **⭐ 難度**: 中階

---

## 概覽

本章協助您在使用 Azure Developer CLI 時診斷及解決常見問題，從部署失敗到 AI 特有的問題。

> 已於 2026年6月使用 `azd 1.25.6` 驗證。

## 學習目標

完成本章後，您將能：
- 診斷常見的 AZD 部署失敗
- 除錯驗證與權限問題
- 解決 AI 服務連線問題
- 使用 Azure 入口網站與 CLI 進行疑難排解

---

## 📚 課程

| # | 課程 | 描述 | 時間 |
|---|--------|-------------|------|
| 1 | [常見問題](common-issues.md) | 常見遭遇的問題 | 30 分鐘 |
| 2 | [除錯指南](debugging.md) | 逐步除錯策略 | 45 分鐘 |
| 3 | [AI 疑難排解](ai-troubleshooting.md) | AI 特有問題 | 30 分鐘 |

---

## 🚨 快速修復

### 驗證問題
```bash
# 使用 AZD 工作流程時必需
azd auth login

# 如果你也直接使用 Azure CLI 命令，則為可選
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

| 錯誤 | 原因 | 解決方法 |
|-------|-------|----------|
| `AuthenticationError` | 未登入 | `azd auth login` |
| `ResourceNotFound` | 找不到資源 | 檢查資源名稱 |
| `QuotaExceeded` | 訂閱限制 | 申請提高配額 |
| `InvalidTemplate` | Bicep 語法錯誤 | `az bicep build` |
| `Conflict` | 資源已存在 | 使用新名稱或刪除現有資源 |
| `Forbidden` | 權限不足 | 檢查 RBAC 角色 |

---

## 🔄 重設與復原

```bash
# 軟重設 (保留資源，重新部署程式碼)
azd deploy --force

# 硬重設 (刪除所有內容，從頭開始)
azd down --force --purge
azd up
```

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第6章：預部署](../chapter-06-pre-deployment/README.md) |
| <strong>下一章</strong> | [第8章：生產](../chapter-08-production/README.md) |

---

## 📖 相關資源

- [預部署檢查](../chapter-06-pre-deployment/preflight-checks.md)
- [設定指南](../chapter-03-configuration/configuration.md)
- [AZD GitHub 問題](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 第7章：疑難排解與偵錯

**📚 課程**：[AZD 初學者指南](../../README.md) | **⏱️ 時間**：1-1.5 小時 | **⭐ 複雜度**：中階

---

## 概述

本章節協助您診斷並解決使用 Azure Developer CLI 時常見的問題，從部署失敗到 AI 特有的問題。

> 指令指導依據已發布的 `azd 1.37.2` 參考資料審核。未執行雲端部署。使用命令前請替換範例資源名稱與 ID。

## 學習目標

完成本章節後，您將能：
- 診斷常見的 AZD 部署失敗問題
- 偵錯驗證與權限問題
- 解決 AI 服務連線問題
- 使用 Azure 入口網站與 CLI 進行疑難排解

---

## 📚 課程內容

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [常見問題](common-issues.md) | 經常遇到的問題 | 30 分鐘 |
| 2 | [偵錯指南](debugging.md) | 逐步偵錯策略 | 45 分鐘 |
| 3 | [AI 疑難排解](ai-troubleshooting.md) | AI 特有問題 | 30 分鐘 |

---

## 🚨 快速解決方案

### 驗證問題
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### 配置失敗
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### 資源衝突
先檢查現有的資源與部署錯誤。不要刪除共用或生產環境來解決命名衝突。對於 <strong>新的可拋棄環境</strong>，請使用唯一名稱：

```bash
azd env new different-name
azd up
```

### 使用額度超過限制
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

更改 `AZURE_LOCATION` 不會移動現有資源，且在重新部署時可能產生位置衝突。

---

## 📋 錯誤代碼參考

| 錯誤 | 原因 | 解決方案 |
|-------|-------|----------|
| `AuthenticationError` | 未登入 | `azd auth login` |
| `ResourceNotFound` | 資源缺失 | 檢查資源名稱 |
| `QuotaExceeded` | 訂閱限制 | 申請額度增加 |
| `InvalidTemplate` | Bicep 語法錯誤 | `az bicep build` |
| `Conflict` | 資源已存在 | 使用新名稱或刪除 |
| `Forbidden` | 權限不足 | 檢查 RBAC 角色 |

---

## 🔄 重設與還原

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

執行硬重設會刪除資料並可能更改端點。請先備份並注意互動刪除提示。`--force --purge` 僅適用於可拋棄環境，且確實要執行不可逆刪除時。

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
- [AZD GitHub 問題集](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
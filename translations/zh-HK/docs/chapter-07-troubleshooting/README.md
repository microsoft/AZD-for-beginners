# 第7章：故障排除與除錯

**📚 課程**: [初學者的AZD](../../README.md) | **⏱️ 時長**: 1-1.5 小時 | **⭐ 複雜度**: 中階

---

## 概覽

本章協助您診斷及解決使用 Azure Developer CLI 時常見的問題，涵蓋部署失敗到 AI 特有問題。

> 命令指導依據發布的 `azd 1.37.2` 參考資料進行審核。未執行雲端部署。使用命令前請替換範例資源名稱與 ID。

## 學習目標

完成本章後，您將能：
- 診斷常見的 AZD 部署失敗
- 除錯身份驗證與權限問題
- 解決 AI 服務連線問題
- 使用 Azure 入口網站及 CLI 進行故障排除

---

## 📚 課程單元

| # | 單元 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [常見問題](common-issues.md) | 常見的問題 | 30 分鐘 |
| 2 | [除錯指南](debugging.md) | 逐步除錯策略 | 45 分鐘 |
| 3 | [AI 故障排除](ai-troubleshooting.md) | AI 特有問題 | 30 分鐘 |

---

## 🚨 快速修復

### 身份驗證問題
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### 提供失敗
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### 資源沖突
請先檢查現有資源與部署錯誤。切勿刪除共用或生產環境以解決命名衝突。對於<strong>新的可拋棄環境</strong>，請使用唯一名稱：

```bash
azd env new different-name
azd up
```

### 配額超出
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

更改 `AZURE_LOCATION` 不會移動已存在的資源，可能導致重新部署時地點衝突。

---

## 📋 錯誤代碼參考

| 錯誤 | 原因 | 解決方案 |
|-------|-------|----------|
| `AuthenticationError` | 未登入 | `azd auth login` |
| `ResourceNotFound` | 找不到資源 | 檢查資源名稱 |
| `QuotaExceeded` | 訂閱限制 | 申請配額增加 |
| `InvalidTemplate` | Bicep 語法錯誤 | `az bicep build` |
| `Conflict` | 資源已存在 | 使用新名稱或刪除 |
| `Forbidden` | 權限不足 | 檢查 RBAC 角色 |

---

## 🔄 重置與恢復

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

硬重置會刪除資料且可能改變端點，請先備份並留意互動式刪除提示。`--force --purge` 僅適用於不可逆刪除的可拋棄環境。

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
- [AZD GitHub 問題追蹤](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
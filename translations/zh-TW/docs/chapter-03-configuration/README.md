# 第3章：設定與驗證

**📚 課程**：[AZD 初學者指南](../../README.md) | **⏱️ 時長**：90-150分鐘，包含整合實作 | **⭐ 複雜度**：中階

---

## 概覽

本章涵蓋 Azure Developer CLI 部署的環境設定、驗證模式與安全最佳實踐。

> 命令與配置審查目標: `azd 1.37.2` (2026年11月)。審查期間未執行實時 Azure 配置。

## 學習目標

完成本章後，您將能夠：
- 精通 AZD 配置層級結構
- 管理多個環境（開發、測試、正式）
- 使用受管身份實現安全身份驗證
- 配置特定環境的設定

---

## 📚 課程

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [設定指南](configuration.md) | 環境設定與管理 | 30 分鐘 |
| 2 | [身份驗證與安全](authsecurity.md) | 管理身份與 RBAC 模式 | 30 分鐘 |

---

## 🚀 快速開始

從 **已初始化的 azd 應用程式** 根目錄執行，而不是課程儲存庫。如果這些環境名稱已存在，請使用未使用的環境名稱。

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` 只是說明：僅當您的範本明確使用它時，才會影響基礎結構。一般的 `azd env set` 值會以純文字形式保存在本機；它們並不是安全的秘密儲存。

---

## 🔧 設定階層結構

將三種不同的配置層分開：全域偏好設定 (`azd config`)、專案結構 (`azure.yaml`)，以及每個環境的值 (`azd env`)。標誌只會覆寫它們實際支援的設定；不會有任意環境變數對 `azure.yaml` 或 Bicep 的通用覆寫。

---

## 🔐 安全最佳實踐

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第 2 章：AI 開發](../chapter-02-ai-development/README.md) |
| <strong>下一章</strong> | [第 4 章：基礎架構](../chapter-04-infrastructure/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/README.md)
- [疑難排解](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
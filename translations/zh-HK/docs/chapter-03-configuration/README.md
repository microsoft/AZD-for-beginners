# 第三章：配置與身份驗證

**📚 課程**： [AZD 初學者](../../README.md) | **⏱️ 時長**：90-150 分鐘，包括整合練習 | **⭐ 複雜度**：中階

---

## 概覽

本章涵蓋 Azure Developer CLI 部署的環境配置、身份驗證模式與安全最佳實踐。

> 指令與配置檢視目標：`azd 1.37.2` (2026 年 11 月)。檢視期間未執行 Azure 實時配置。

## 學習目標

完成本章後，你將能：
- 精通 AZD 的配置階層
- 管理多個環境（開發、測試、正式）
- 實作使用管理識別的安全身份驗證
- 配置特定環境的設定

---

## 📚 課程內容

| # | 課程 | 描述 | 時長 |
|---|------|------|------|
| 1 | [配置指南](configuration.md) | 環境設置及管理 | 30 分鐘 |
| 2 | [身份驗證與安全](authsecurity.md) | 管理識別與 RBAC 模式 | 30 分鐘 |

---

## 🚀 快速開始

請從 **已初始化 azd 應用** 的根目錄執行，不是在課程資源庫。若環境名稱已被使用，請使用未使用的名稱。

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

`SKU_NAME` 僅為示例：僅當你的範本明確使用它時才會影響基礎設施。普通的 `azd env set` 值會以純文字形式本地保存；它們並非安全的祕密存儲。

---

## 🔧 配置階層

保持三種不同的配置面向分開：全域偏好設定 (`azd config`)、專案結構 (`azure.yaml`) 以及每個環境的值 (`azd env`)。旗標僅會覆蓋其實際支援的設定；沒有任意環境變數能通用地覆蓋 `azure.yaml` 或 Bicep。

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

## 🔗 導航

| 方向 | 章節 |
|------|------|
| <strong>上一章</strong> | [第二章：AI 開發](../chapter-02-ai-development/README.md) |
| <strong>下一章</strong> | [第四章：基礎架構](../chapter-04-infrastructure/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/README.md)
- [疑難排解](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
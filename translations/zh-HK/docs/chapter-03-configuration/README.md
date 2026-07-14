# 第3章：配置與認證

**📚 課程**: [AZD 初學者指南](../../README.md) | **⏱️ 時長**: 45-60 分鐘 | **⭐ 複雜度**: 中階

---

## 概述

本章涵蓋環境配置、認證範式及 Azure Developer CLI 部署的安全最佳實務。

> 已於 2026 年 7 月使用 `azd 1.27.1` 版本驗證。

## 學習目標

完成本章後，您將能：
- 精通 AZD 配置層級結構
- 管理多個環境（開發、測試、正式）
- 實作使用管理身份的安全驗證
- 配置特定環境的設定

---

## 📚 課程列表

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [配置指南](configuration.md) | 環境設定與管理 | 30 分鐘 |
| 2 | [認證與安全](authsecurity.md) | 管理身份與 RBAC 模式 | 30 分鐘 |

---

## 🚀 快速開始

```bash
# 建立多個環境
azd env new dev
azd env new staging
azd env new prod

# 切換環境
azd env select prod

# 設定環境變數
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# 檢視設定
azd env get-values
```

---

## 🔧 配置層級結構

AZD 按此順序套用設定（後者覆蓋前者）：

1. <strong>預設值</strong>（內建於模板中）
2. **azure.yaml**（專案配置）
3. <strong>環境變數</strong>（`azd env set`）
4. <strong>命令列標誌</strong>（`--location eastus`）

---

## 🔐 安全最佳實務

```bash
# 使用托管身份（建議）
azd env set AZURE_USE_MANAGED_IDENTITY true

# 檢查 AZD 認證狀態
azd auth status

# 可選：如果您打算執行 az 命令，請驗證 Azure CLI 內容
az account show

# 如有需要，請重新認證
azd auth login

# 可選：刷新 Azure CLI 認證以執行 az 命令
az login
```

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第2章：AI 開發](../chapter-02-ai-development/README.md) |
| <strong>下一章</strong> | [第4章：基礎架構](../chapter-04-infrastructure/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/README.md)
- [故障排除](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 第 3 章：組態與認證

**📚 課程**: [AZD 初學者指南](../../README.md) | **⏱️ 時間**: 45-60 分鐘 | **⭐ 複雜度**: 中等

---

## 概述

本章涵蓋 Azure Developer CLI 部署的環境組態、認證模式與安全最佳實務。

> 已於 2026 年 6 月使用 `azd 1.25.6` 驗證。

## 學習目標

完成本章後，您將能夠：
- 精通 AZD 組態階層
- 管理多個環境（dev、staging、prod）
- 使用受管理識別實作安全認證
- 設定環境專屬的設定值

---

## 📚 課程內容

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [Configuration Guide](configuration.md) | 環境設定與管理 | 30 分鐘 |
| 2 | [Authentication & Security](authsecurity.md) | 受管理識別（Managed Identity）與 RBAC 範式 | 30 分鐘 |

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

## 🔧 組態階層

AZD 以此順序套用設定（後者會覆蓋前者）：

1. <strong>預設值</strong>（內建於範本）
2. **azure.yaml**（專案組態）
3. <strong>環境變數</strong>（`azd env set`）
4. <strong>命令列旗標</strong>（`--location eastus`）

---

## 🔐 安全最佳實務

```bash
# 使用受管理身分識別（建議）
azd env set AZURE_USE_MANAGED_IDENTITY true

# 檢查 AZD 驗證狀態
azd auth status

# 可選：若您打算執行 az 命令，請驗證 Azure CLI 的上下文
az account show

# 如有需要，請重新驗證
azd auth login

# 可選：為 az 命令重新整理 Azure CLI 的驗證
az login
```

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>上章</strong> | [Chapter 2: AI Development](../chapter-02-ai-development/README.md) |
| <strong>下章</strong> | [Chapter 4: Infrastructure](../chapter-04-infrastructure/README.md) |

---

## 📖 相關資源

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
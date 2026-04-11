# 第 3 章：設定與驗證

**📚 課程**: [AZD For Beginners](../../README.md) | **⏱️ 時長**: 45-60 分鐘 | **⭐ 難度**: 中等

---

## 概述

本章涵蓋適用於 Azure Developer CLI 部署的環境設定、認證模式與安全最佳做法。

> 已於 2026 年 3 月針對 `azd 1.23.12` 驗證。

## 學習目標

完成本章後，您將能：
- 精通 AZD 的設定層級
- 管理多個環境（dev、staging、prod）
- 使用受控識別（managed identities）實作安全認證
- 設定環境特定的設定

---

## 📚 課程單元

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [設定指南](configuration.md) | 環境設定與管理 | 30 分鐘 |
| 2 | [認證與安全](authsecurity.md) | 受控識別與 RBAC 模式 | 30 分鐘 |

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

## 🔧 設定層級

AZD 以此順序套用設定（後者會覆蓋前者）：

1. <strong>預設值</strong>（內建於範本）
2. **azure.yaml**（專案設定）
3. <strong>環境變數</strong>（`azd env set`）
4. <strong>命令列旗標</strong>（`--location eastus`）

---

## 🔐 安全最佳做法

```bash
# 使用受管理的身分識別（建議）
azd env set AZURE_USE_MANAGED_IDENTITY true

# 檢查 AZD 的驗證狀態
azd auth status

# 可選：如果你打算執行 az 命令，驗證 Azure CLI 的上下文
az account show

# 如有需要，重新驗證
azd auth login

# 可選：為 az 命令重新整理 Azure CLI 的驗證
az login
```

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>上一章</strong> | [第 2 章：AI 開發](../chapter-02-ai-development/README.md) |
| <strong>下一章</strong> | [第 4 章：基礎建設](../chapter-04-infrastructure/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/README.md)
- [故障排除](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件乃使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力追求準確性，惟請注意自動化翻譯仍可能包含錯誤或不準確之處。原始語言版本的文件應被視為具權威性的版本。如屬重要資訊，建議採用專業人工翻譯。對於因使用本翻譯而導致的任何誤解或錯誤詮釋，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
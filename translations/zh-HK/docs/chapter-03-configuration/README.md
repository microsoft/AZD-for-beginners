# 第 3 章：設定與驗證

**📚 課程**: [AZD For Beginners](../../README.md) | **⏱️ 時長**: 45-60 分鐘 | **⭐ 難度**: 中等

---

## 概覽

本章涵蓋 Azure Developer CLI 部署的環境設定、身份驗證模式以及安全最佳實踐。

## 學習目標

完成本章後，您將會：
- 掌握 AZD 設定層級結構
- 管理多個環境（dev、staging、prod）
- 使用託管識別實作安全身份驗證
- 為各環境配置專屬設定

---

## 📚 課程

| # | 課堂 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [設定指南](configuration.md) | 環境設定與管理 | 30 分鐘 |
| 2 | [身份驗證與安全](authsecurity.md) | 託管識別與 RBAC 模式 | 30 分鐘 |

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

1. **預設值** (內建於範本)
2. **azure.yaml** (專案設定)
3. **環境變數** (`azd env set`)
4. **命令列旗標** (`--location eastus`)

---

## 🔐 安全最佳實踐

```bash
# 使用受管理的身份（建議）
azd env set AZURE_USE_MANAGED_IDENTITY true

# 檢查驗證狀態
azd auth whoami
az account show

# 如有需要，重新驗證
azd auth login
az login
```

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| **上一章** | [第 2 章：AI 開發](../chapter-02-ai-development/README.md) |
| **下一章** | [第 4 章：基礎設施](../chapter-04-infrastructure/README.md) |

---

## 📖 相關資源

- [部署前檢查](../chapter-06-pre-deployment/README.md)
- [疑難排解](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 [Co‑op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原文應被視為具權威性的版本。對於重要資訊，建議採用專業人工翻譯。因使用本翻譯而導致的任何誤解或錯誤詮釋，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
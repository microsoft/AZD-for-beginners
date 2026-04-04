# 第1章：基礎與快速入門

**📚 課程**: [AZD 初學者](../../README.md) | **⏱️ 時長**: 30-45 分鐘 | **⭐ 難度**: 初學者

---

## 概覽

本章節介紹 Azure Developer CLI (azd) 的基本概念。您將學習核心概念、安裝工具，並部署您的第一個 Azure 應用程式。

> 已於 2026 年 3 月使用 `azd 1.23.12` 驗證。

## 學習目標

完成本章節後，您將能夠：
- 了解什麼是 Azure Developer CLI 及其與 Azure CLI 的差異
- 在您的平台上安裝並配置 AZD
- 使用 `azd up` 部署您的第一個 Azure 應用程式
- 使用 `azd down` 清理資源

---

## 📚 課程內容

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [AZD 基礎](azd-basics.md) | 核心概念、術語與專案結構 | 15 分鐘 |
| 2 | [安裝與設定](installation.md) | 依平台提供安裝指南 | 10 分鐘 |
| 3 | [您的第一個專案](first-project.md) | 實作：部署網頁應用至 Azure | 20 分鐘 |

---

## ✅ 從這裡開始：驗證您的環境

開始之前，請確認您的本機已準備好使用第1章的範本：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

若腳本顯示缺少工具，請先安裝缺少的工具，再繼續本章節內容。

---

## 🚀 快速開始

```bash
# 檢查安裝
azd version

# 驗證 AZD
# 選擇性：如果您打算直接執行 Azure CLI 命令，請先使用 az login
azd auth login

# 部署您的第一個應用程式
azd init --template todo-nodejs-mongo
azd up

# 完成後清理
azd down --force --purge
```

---

## ✅ 成功標準

完成本章節後，您應該能夠：

```bash
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                   # 部署到 Azure
azd show                 # 顯示正在運行的應用程式網址
azd down --force --purge # 清理資源
```

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>下一章</strong> | [第2章：以 AI 為先的開發](../chapter-02-ai-development/README.md) |
| <strong>跳至</strong> | [第3章：設定](../chapter-03-configuration/README.md) |

---

## 📖 相關資源

- [指令速查表](../../resources/cheat-sheet.md)
- [常見問題](../../resources/faq.md)
- [術語表](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的本地語言版本應視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而產生的任何誤解或誤釋負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
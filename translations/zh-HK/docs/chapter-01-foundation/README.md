# Chapter 1: Foundation & Quick Start

**📚 課程**: [AZD For Beginners](../../README.md) | **⏱️ 時長**: 30-45 分鐘 | **⭐ 複雜度**: 初學者

---

## 總覽

本章介紹 Azure Developer CLI (azd) 的基礎知識。您將學習核心概念、安裝工具，並將您的第一個應用程式部署到 Azure。

> 已於 2026 年 6 月針對 `azd 1.25.6` 驗證。

## 學習目標

完成本章後，您將能夠：
- 理解 Azure Developer CLI 是什麼以及它與 Azure CLI 的區別
- 在您的平台上安裝和配置 AZD
- 使用 `azd up` 將您的第一個應用程式部署到 Azure
- 使用 `azd down` 清理資源

---

## 📚 課程內容

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [AZD 基礎](azd-basics.md) | 核心概念、術語和專案結構 | 15 分鐘 |
| 2 | [安裝與設定](installation.md) | 平台特定安裝指南 | 10 分鐘 |
| 3 | [您的第一個專案](first-project.md) | 實作：將網頁應用程式部署到 Azure | 20 分鐘 |
| 4 | [帶入您自己的應用程式](bring-your-own-app.md) | 將 azd 加入您已有的專案 | 15 分鐘 |
| 5 | [開發容器與 Codespaces](dev-containers.md) | 使用開發容器打造可重複的 azd 環境 | 15 分鐘 |

---

## ✅ 從這裡開始：驗證您的環境

開始之前，請確認您的本機已準備好 Chapter 1 範本：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

如果腳本報告缺少工具，請先修正這些問題，然後再繼續本章內容。

---

## 🚀 快速開始

```bash
# 檢查安裝
azd version

# 為 AZD 進行身份驗證
# 選擇性：如果你計劃直接執行 Azure CLI 命令，請使用 az login
azd auth login

# 部署你的第一個應用程式
azd init --template todo-nodejs-mongo
azd up

# 完成後清理
azd down --force --purge
```

---

## ✅ 成功標準

完成本章後，您應該能：

```bash
azd version              # 顯示已安裝版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                   # 部署至 Azure
azd show                 # 顯示運行中應用程式的網址
azd down --force --purge # 清理資源
```

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>下一頁</strong> | [Chapter 2: AI-First Development](../chapter-02-ai-development/README.md) |
| <strong>跳至</strong> | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |

---

## 📖 相關資源

- [命令速查表](../../resources/cheat-sheet.md)
- [常見問題](../../resources/faq.md)
- [術語表](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
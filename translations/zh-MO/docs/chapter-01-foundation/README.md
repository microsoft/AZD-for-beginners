# 第 1 章：基礎與快速開始

**📚 Course**: [AZD 入門](../../README.md) | **⏱️ Duration**: 30-45 分鐘 | **⭐ Complexity**: 入門

---

## 概覽

> 已於 2026 年 6 月使用 `azd 1.25.6` 驗證。

本章介紹 Azure Developer CLI (azd) 的基礎。你將學習核心概念、安裝工具，並將你的第一個應用程式部署到 Azure。

## 學習目標

完成本章後，你將能夠：
- 了解什麼是 Azure Developer CLI，以及它與 Azure CLI 的不同之處
- 在你的平台上安裝和設定 AZD
- 使用 `azd up` 將你的第一個應用程式部署到 Azure
- 使用 `azd down` 清除資源

---

## 📚 課程

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [AZD 基礎](azd-basics.md) | 核心概念、術語與專案結構 | 15 分鐘 |
| 2 | [安裝與設定](installation.md) | 平台特定的安裝指南 | 10 分鐘 |
| 3 | [你的第一個專案](first-project.md) | 實作：將 Web 應用程式部署到 Azure | 20 分鐘 |
| 4 | [加入你已有的應用程式](bring-your-own-app.md) | 將 azd 新增到你現有的專案 | 15 分鐘 |
| 5 | [開發容器與 Codespaces](dev-containers.md) | 使用開發容器建立可重現的 azd 環境 | 15 分鐘 |

---

## ✅ 從這裡開始：驗證你的設定

在開始之前，確認你的本機已準備好用於第 1 章的範本：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

如果腳本回報缺少工具，請先修復這些問題，然後再繼續本章節。

---

## 🚀 快速開始

```bash
# 檢查安裝
azd version

# 為 AZD 進行驗證
# 可選：如果你計劃直接執行 Azure CLI 指令，請執行 az login
azd auth login

# 部署你的第一個應用程式
azd init --template todo-nodejs-mongo
azd up

# 完成後清理
azd down --force --purge
```

---

## ✅ 成功準則

完成本章後，你應該能夠：

```bash
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                   # 部署到 Azure
azd show                 # 顯示執行中應用程式的網址
azd down --force --purge # 清理資源
```

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>下一章</strong> | [第 2 章：AI 優先開發](../chapter-02-ai-development/README.md) |
| <strong>跳到</strong> | [第 3 章：設定](../chapter-03-configuration/README.md) |

---

## 📖 相關資源

- [指令速查表](../../resources/cheat-sheet.md)
- [常見問題](../../resources/faq.md)
- [詞彙表](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
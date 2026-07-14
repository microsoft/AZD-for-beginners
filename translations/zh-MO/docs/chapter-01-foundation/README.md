# 第一章：基礎與快速入門

**📚 課程**：[AZD 初學者](../../README.md) | **⏱️ 時長**：30-45 分鐘 | **⭐ 難度**：初學者

---

## 概述

本章介紹 Azure Developer CLI（azd）的基礎知識。你將學習核心概念、安裝工具，並將你的第一個應用程式部署到 Azure。

> 於 2026 年 7 月使用 `azd 1.27.1` 版本進行驗證。

## 學習目標

完成本章後，你將能：
- 了解什麼是 Azure Developer CLI 以及它與 Azure CLI 的差異
- 在你的平台上安裝與設定 AZD
- 使用 `azd up` 部署你的第一個 Azure 應用程式
- 使用 `azd down` 清理資源

---

## 📚 課程內容

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [AZD 基礎](azd-basics.md) | 核心概念、術語與專案架構 | 15 分鐘 |
| 2 | [安裝與設定](installation.md) | 各平台安裝指南 | 10 分鐘 |
| 3 | [你的第一個專案](first-project.md) | 實作：部署 Web 應用到 Azure | 20 分鐘 |
| 4 | [帶入你自己的應用](bring-your-own-app.md) | 為你既有的專案加入 azd | 15 分鐘 |
| 5 | [開發容器與 Codespaces](dev-containers.md) | 透過開發容器實現可複製的 azd 環境 | 15 分鐘 |

---

## ✅ 起點：驗證你的環境

在開始前，請確認你的本機已準備好第一章範本：

**Windows：**
```powershell
.\validate-setup.ps1
```

**macOS / Linux：**
```bash
bash ./validate-setup.sh
```

若腳本回報缺少工具，請先補齊再繼續本章內容。

---

## 🚀 快速開始

```bash
# 檢查安裝
azd version

# 為 AZD 認證
# 可選：如果你打算直接運行 Azure CLI 指令，請使用 az 登入
azd auth login

# 部署你的第一個應用程式
azd init --template todo-nodejs-mongo
azd up

# 完成後清理
azd down --force --purge
```

---

## ✅ 成功標準

完成本章後，你應該能夠：

```bash
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                   # 部署至 Azure
azd show                 # 顯示運行中應用程式的網址
azd down --force --purge # 清理資源
```

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>下一步</strong> | [第二章：AI 優先開發](../chapter-02-ai-development/README.md) |
| <strong>跳到</strong> | [第三章：設定](../chapter-03-configuration/README.md) |

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
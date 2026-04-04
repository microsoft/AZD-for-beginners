# 第1章：基礎與快速開始

**📚 課程**: [AZD 入門](../../README.md) | **⏱️ 時間**: 30-45 分鐘 | **⭐ 複雜度**: 初學者

---

## 概覽

本章介紹 Azure Developer CLI (azd) 的基礎。你將學習核心概念、安裝工具，並將第一個應用部署到 Azure。

> 已於 2026 年 3 月使用 `azd 1.23.12` 驗證。

## 學習目標

完成本章後，你將能夠：
- 了解 Azure Developer CLI 是什麼，以及它與 Azure CLI 的差別
- 在你的平台上安裝並設定 AZD
- 使用 `azd up` 將你的第一個應用部署到 Azure
- 使用 `azd down` 清理資源

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [AZD 基礎](azd-basics.md) | 核心概念、術語與專案結構 | 15 分鐘 |
| 2 | [安裝與設定](installation.md) | 針對不同平台的安裝指南 | 10 分鐘 |
| 3 | [你的第一個專案](first-project.md) | 實作：將 Web 應用部署到 Azure | 20 分鐘 |

---

## ✅ 從這裡開始：驗證你的設定

在開始之前，確認你的本機已準備好用於第1章範本：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If the script reports missing tools, fix those first and then continue with the chapter.

---

## 🚀 快速開始

```bash
# 檢查安裝
azd version

# 為 AZD 進行驗證
# 可選：如果你打算直接執行 Azure CLI 指令，請執行 az login
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
azd show                 # 顯示正在執行的應用程式的 URL
azd down --force --purge # 清理資源
```

---

## 🔗 導航

| Direction | Chapter |
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
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為具權威性的版本。對於重要資訊，建議採用專業人工翻譯。對於因使用本翻譯而引致的任何誤解或曲解，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 第 1 章：基礎與快速上手

**📚 課程**: [AZD For Beginners](../../README.md) | **⏱️ 時間**: 30-45 分鐘 | **⭐ 複雜度**: 初學者

---

## 概覽

本章介紹 Azure Developer CLI (azd) 的基礎。你會學習核心概念、安裝工具，並將你的第一個應用程式部署到 Azure。

## 學習目標

完成本章後，你將能夠：
- 了解 Azure Developer CLI 是什麼，以及它與 Azure CLI 的差異
- 在你的平台上安裝並設定 AZD
- 使用 `azd up` 將你的第一個應用部署到 Azure
- 使用 `azd down` 清除資源

---

## 📚 課程

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [AZD 基礎](azd-basics.md) | 核心概念、術語與專案結構 | 15 分鐘 |
| 2 | [安裝與設定](installation.md) | 平台特定的安裝指南 | 10 分鐘 |
| 3 | [你的第一個專案](first-project.md) | 實作：將 Web 應用部署到 Azure | 20 分鐘 |

---

## 🚀 快速上手

```bash
# 檢查安裝
azd version

# 登入 Azure
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
azd up                   # 部署到 Azure
azd show                 # 顯示正在執行的應用程式網址
azd down --force --purge # 清理資源
```

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| **下一章** | [第 2 章：以 AI 為先的開發](../chapter-02-ai-development/README.md) |
| **跳至** | [第 3 章：設定](../chapter-03-configuration/README.md) |

---

## 📖 相關資源

- [指令速查表](../../resources/cheat-sheet.md)
- [常見問題](../../resources/faq.md)
- [術語表](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。我們會盡力確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。應以原始語言版本為準。如涉及重要資訊，建議採用專業人工翻譯。對於因使用本翻譯而引致的任何誤解或曲解，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
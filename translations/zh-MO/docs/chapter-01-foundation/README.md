# 第 1 章：基礎與快速入門

**📚 課程**: [AZD For Beginners](../../README.md) | **⏱️ 時間**: 30-45 分鐘 | **⭐ 複雜度**: 初學者

---

## 概覽

本章介紹 Azure Developer CLI (azd) 的基本概念。您將學習核心概念、安裝工具，並將第一個應用部署到 Azure。

## 學習目標

完成本章後，您將會：
- 了解 Azure Developer CLI 是什麼，以及它與 Azure CLI 的差異
- 在您的平台上安裝並設定 AZD
- 使用 `azd up` 將您的第一個應用部署到 Azure
- 使用 `azd down` 清理資源

---

## 📚 課程

| # | 單元 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [AZD 基礎](azd-basics.md) | 核心概念、術語與專案結構 | 15 分鐘 |
| 2 | [安裝與設定](installation.md) | 針對各平台的安裝指南 | 10 分鐘 |
| 3 | [您的第一個專案](first-project.md) | 實作：將網頁應用部署到 Azure | 20 分鐘 |

---

## 🚀 快速入門

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

完成本章後，您應該能夠：

```bash
azd version              # 顯示已安裝的版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                   # 部署到 Azure
azd show                 # 顯示執行中應用程式的 URL
azd down --force --purge # 清理資源
```

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| **Next** | [第 2 章：以 AI 為先的開發](../chapter-02-ai-development/README.md) |
| **Skip to** | [第 3 章：設定](../chapter-03-configuration/README.md) |

---

## 📖 相關資源

- [指令速查表](../../resources/cheat-sheet.md)
- [常見問題](../../resources/faq.md)
- [術語表](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件由 AI 翻譯服務 Co-op Translator（https://github.com/Azure/co-op-translator）進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言的文件應視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不就因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
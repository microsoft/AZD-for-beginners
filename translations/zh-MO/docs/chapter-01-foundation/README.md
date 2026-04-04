# Chapter 1: Foundation & Quick Start

**📚 課程**: [AZD For Beginners](../../README.md) | **⏱️ 時長**: 30-45 分鐘 | **⭐ 複雜度**: 初學者

---

## 概覽

本章介紹 Azure Developer CLI（azd）基礎。你將學習核心概念、安裝工具，並將你的第一個應用程式部署到 Azure。

> 已於 2026 年 3 月以 `azd 1.23.12` 驗證。

## 學習目標

完成本章後，你將能夠：
- 理解 Azure Developer CLI 是什麼以及它與 Azure CLI 的不同之處
- 在你的平台上安裝和配置 AZD
- 使用 `azd up` 將你的第一個應用程式部署到 Azure
- 使用 `azd down` 清理資源

---

## 📚 課程單元

| # | 單元 | 描述 | 時長 |
|---|--------|-------------|------|
| 1 | [AZD 基礎](azd-basics.md) | 核心概念、術語與專案結構 | 15 分鐘 |
| 2 | [安裝與設定](installation.md) | 特定平台的安裝指南 | 10 分鐘 |
| 3 | [你的第一個專案](first-project.md) | 實作操作：將網頁應用程式部署到 Azure | 20 分鐘 |

---

## ✅ 從這裡開始：驗證你的環境設定

開始之前，請確認你的本地機器已準備好 Chapter 1 範本：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

如果腳本報告缺少工具，請先修復這些問題，然後再繼續本章內容。

---

## 🚀 快速開始

```bash
# 檢查安裝
azd version

# 驗證 AZD
# 選擇性：如果你計劃直接運行 Azure CLI 命令，請執行 az login
azd auth login

# 部署你的第一個應用程式
azd init --template todo-nodejs-mongo
azd up

# 完成後清理
azd down --force --purge
```

---

## ✅ 成功標準

完成本章後，你應能：

```bash
azd version              # 顯示已安裝版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                   # 部署到 Azure
azd show                 # 顯示運行中應用程式的網址
azd down --force --purge # 清理資源
```

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>下一章</strong> | [Chapter 2: AI-First Development](../chapter-02-ai-development/README.md) |
| <strong>跳到</strong> | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |

---

## 📖 相關資源

- [指令速查表](../../resources/cheat-sheet.md)
- [常見問題](../../resources/faq.md)
- [詞彙表](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 所翻譯。雖然我們致力於準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件以其母語版本為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
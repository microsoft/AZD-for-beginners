# 第 1 章：基礎與快速入門

**📚 課程**: [AZD 入門](../../README.md) | **⏱️ 時長**: 75-120 分鐘含首次部署；額外練習時間更長 | **⭐ 難度**: 初學者

---

## 概覽

本章介紹 Azure Developer CLI (azd) 的基本概念。你將學習核心觀念、安裝工具，並部署第一個應用程式到 Azure。

> 指令和設定回顧目標: `azd 1.37.2` (2026 年 11 月)。回顧時未執行實際 Azure 佈建。

## 學習目標

完成本章後，你將能：
- 了解 Azure Developer CLI 是什麼，以及它與 Azure CLI 的差異
- 在你的平台上安裝並設定 AZD
- 使用 `azd up` 部署你的第一個 Azure 應用程式
- 使用 `azd down` 清理資源

---

## 📚 課程內容

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [AZD 基礎](azd-basics.md) | 核心概念、術語及專案結構 | 15 分鐘 |
| 2 | [安裝與設定](installation.md) | 針對平台的安裝指引 | 10 分鐘 |
| 3 | [你的第一個專案](first-project.md) | 實作：將 web 應用部署到 Azure | 20 分鐘 |
| 4 | [導入現有應用](bring-your-own-app.md) | 將 azd 加入你已有的專案 | 15 分鐘 |
| 5 | [開發容器與 Codespaces](dev-containers.md) | 使用開發容器建立可重現的 azd 環境 | 15 分鐘 |

---

## ✅ 從這裡開始：驗證你的環境

開始前，請確認你本機已準備好第 1 章的範本：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

如果腳本顯示缺少工具，請先安裝缺少的工具，然後再繼續本章內容。

---

## 🚀 快速開始

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ 成功標準

完成本章後，你應該能夠：

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>下一步</strong> | [第 2 章：AI 為先的開發](../chapter-02-ai-development/README.md) |
| <strong>跳至</strong> | [第 3 章：設定](../chapter-03-configuration/README.md) |

---

## 📖 相關資源

- [指令速查表](../../resources/cheat-sheet.md)
- [常見問題](../../resources/faq.md)
- [詞彙表](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
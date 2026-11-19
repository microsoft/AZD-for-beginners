# 第 1 章：基礎與快速入門

**📚 課程**: [AZD 入門](../../README.md) | **⏱️ 時長**: 75-120 分鐘（包括首次部署）；額外練習需更長時間 | **⭐ 難度**: 初學者

---

## 概覽

本章介紹 Azure Developer CLI (azd) 的基本知識。您將學習核心概念、安裝工具，並將您的第一個應用程式部署到 Azure。

> 指令和設定回顧目標：`azd 1.37.2` (2026年11月)。回顧期間未執行實際 Azure 配置。

## 學習目標

完成本章後，您將能夠：
- 了解什麼是 Azure Developer CLI 以及它與 Azure CLI 的不同
- 在您的平台上安裝與配置 AZD
- 使用 `azd up` 部署您的第一個 Azure 應用程式
- 使用 `azd down` 清理資源

---

## 📚 課程列表

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [AZD 基礎知識](azd-basics.md) | 核心概念、術語與專案結構 | 15 分鐘 |
| 2 | [安裝與設定](installation.md) | 針對不同平台的安裝指南 | 10 分鐘 |
| 3 | [您的第一個專案](first-project.md) | 實操：將網頁應用部署到 Azure | 20 分鐘 |
| 4 | [帶入您的應用程式](bring-your-own-app.md) | 將 azd 新增到現有專案 | 15 分鐘 |
| 5 | [開發容器與 Codespaces](dev-containers.md) | 使用開發容器實現可重現的 azd 環境 | 15 分鐘 |

---

## ✅ 從這裡開始：驗證您的環境

開始之前，請確認您的本機已準備好使用第 1 章範本：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

如果腳本報告缺少工具，請先修正這些問題，然後繼續本章內容。

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

完成本章後，您應能：

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>下一章</strong> | [第 2 章：AI 優先開發](../chapter-02-ai-development/README.md) |
| <strong>跳至</strong> | [第 3 章：設定](../chapter-03-configuration/README.md) |

---

## 📖 相關資源

- [指令速查表](../../resources/cheat-sheet.md)
- [常見問題](../../resources/faq.md)
- [術語表](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
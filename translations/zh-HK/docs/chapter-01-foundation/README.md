# 第 1 章：基礎與快速入門

**📚 課程**: [新手入門 AZD](../../README.md) | **⏱️ 時長**: 75-120 分鐘（包括首次部署）；額外練習需時更長 | **⭐ 難度**: 初級

---

## 概覽

本章介紹 Azure Developer CLI (azd) 的基礎知識。您將學習核心概念、安裝工具，並將您的第一個應用程式部署到 Azure。

> 指令與設定檢視目標：`azd 1.37.2` (2026年11月)。檢視期間未執行即時 Azure 佈建。

## 學習目標

完成本章後，您將能：
- 了解什麼是 Azure Developer CLI 及其與 Azure CLI 的差異
- 在您的平台上安裝並設定 AZD
- 使用 `azd up` 將您的第一個應用程式部署到 Azure
- 使用 `azd down` 清理資源

---

## 📚 課程內容

| # | 課程 | 描述 | 時間 |
|---|--------|-------------|------|
| 1 | [AZD 基礎](azd-basics.md) | 核心概念、術語及專案結構 | 15 分鐘 |
| 2 | [安裝與設定](installation.md) | 平台專用的安裝指南 | 10 分鐘 |
| 3 | [你的第一個專案](first-project.md) | 實作：將網頁應用程式部署到 Azure | 20 分鐘 |
| 4 | [帶入你自己的應用程式](bring-your-own-app.md) | 對你已有的專案新增 azd | 15 分鐘 |
| 5 | [開發容器與 Codespaces](dev-containers.md) | 使用開發容器建構可重現的 azd 環境 | 15 分鐘 |

---

## ✅ 從這裡開始：驗證你的設定

在開始之前，請確認你的本機已準備好用於第 1 章範本：

**Windows：**
```powershell
.\validate-setup.ps1
```

**macOS / Linux：**
```bash
bash ./validate-setup.sh
```

如果腳本報告缺少工具，請先修復這些問題，然後再繼續本章節。

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

完成本章節後，您應該能夠：

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
| <strong>下一頁</strong> | [第 2 章：AI優先開發](../chapter-02-ai-development/README.md) |
| <strong>跳至</strong> | [第 3 章：配置](../chapter-03-configuration/README.md) |

---

## 📖 相關資源

- [指令速查表](../../resources/cheat-sheet.md)
- [常見問題](../../resources/faq.md)
- [術語表](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
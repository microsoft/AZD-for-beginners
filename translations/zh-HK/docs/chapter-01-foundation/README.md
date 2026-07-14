# 第一章：基礎與快速入門

**📚 課程**: [AZD 新手指南](../../README.md) | **⏱️ 時長**: 30-45 分鐘 | **⭐ 難度**: 初學者

---

## 概覽

本章介紹 Azure Developer CLI (azd) 的基礎知識，您將學習核心概念、安裝工具，並將您的第一個應用部署到 Azure。

> 已於 2026 年 7 月，使用 `azd 1.27.1` 版本驗證。

## 學習目標

完成本章後，您將能夠：
- 了解 Azure Developer CLI 是什麼，以及它與 Azure CLI 的不同之處
- 在您的平台上安裝與設定 AZD
- 使用 `azd up` 將第一個應用部署到 Azure
- 使用 `azd down` 清理資源

---

## 📚 課程內容

| 編號 | 課程 | 描述 | 時間 |
|---|--------|-------------|------|
| 1 | [AZD 基礎](azd-basics.md) | 核心概念、術語與專案結構 | 15 分鐘 |
| 2 | [安裝與設定](installation.md) | 各平台安裝指南 | 10 分鐘 |
| 3 | [您的第一個專案](first-project.md) | 實作：部署一個 Web 應用至 Azure | 20 分鐘 |
| 4 | [帶入您自己的應用](bring-your-own-app.md) | 將 azd 加入您已有的專案中 | 15 分鐘 |
| 5 | [開發容器與 Codespaces](dev-containers.md) | 使用開發容器打造可復現的 azd 環境 | 15 分鐘 |

---

## ✅ 從這裡開始：驗證您的環境

開始前，請確認您的本機已準備好用於第一章範本：

**Windows：**
```powershell
.\validate-setup.ps1
```

**macOS / Linux：**
```bash
bash ./validate-setup.sh
```

如果腳本報告缺少工具，請先補足那些工具，再繼續本章內容。

---

## 🚀 快速入門

```bash
# 檢查安裝
azd version

# 為 AZD 進行身份驗證
# 可選：如果你打算直接執行 Azure CLI 命令，請使用 az login
azd auth login

# 部署你的第一個應用程式
azd init --template todo-nodejs-mongo
azd up

# 完成後清理
azd down --force --purge
```

---

## ✅ 成功標準

完成本章後，您應能：

```bash
azd version              # 顯示已安裝版本
azd init --template todo-nodejs-mongo  # 初始化項目
azd up                   # 部署到 Azure
azd show                 # 顯示運行中應用程式網址
azd down --force --purge # 清理資源
```

---

## 🔗 導覽

| 方向 | 章節 |
|-----------|---------|
| <strong>下一章</strong> | [第二章：以 AI 為先的開發](../chapter-02-ai-development/README.md) |
| <strong>跳至</strong> | [第三章：設定](../chapter-03-configuration/README.md) |

---

## 📖 相關資源

- [指令速查表](../../resources/cheat-sheet.md)
- [常見問題集](../../resources/faq.md)
- [術語表](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
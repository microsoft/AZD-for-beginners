# 第1章：基礎與快速入門

**📚 課程**：[AZD 初學者指南](../../README.md) | **⏱️ 時長**：30-45分鐘 | **⭐ 複雜度**：初學者

---

## 概覽

本章介紹 Azure Developer CLI（azd）基礎知識。您將學習核心概念、安裝工具，並將您的第一個應用程式部署到 Azure。

> 已於2026年7月使用 `azd 1.27.1` 驗證。

## 學習目標

完成本章後，您將能：
- 了解 Azure Developer CLI 是什麼及與 Azure CLI 的不同之處
- 在您的平台上安裝及設定 AZD
- 使用 `azd up` 將您的第一個應用程式部署到 Azure
- 使用 `azd down` 清理資源

---

## 📚 課程清單

| # | 課程 | 說明 | 時間 |
|---|--------|-------------|------|
| 1 | [AZD 基礎](azd-basics.md) | 核心概念、術語及專案結構 | 15 分鐘 |
| 2 | [安裝與設定](installation.md) | 平台特定的安裝指南 | 10 分鐘 |
| 3 | [您的第一個專案](first-project.md) | 實作：部署網站應用到 Azure | 20 分鐘 |
| 4 | [用您自己的應用程式](bring-your-own-app.md) | 將 azd 新增至您已有的專案 | 15 分鐘 |
| 5 | [Dev Containers 與 Codespaces](dev-containers.md) | 使用 dev containers 創建可重現的 azd 環境 | 15 分鐘 |

---

## ✅ 從這裡開始：驗證您的設定

開始之前，請確認您的本地機器已準備好使用第1章範本：

**Windows：**
```powershell
.\validate-setup.ps1
```

**macOS / Linux：**
```bash
bash ./validate-setup.sh
```

如果腳本回報缺少工具，請先修復後再繼續本章內容。

---

## 🚀 快速開始

```bash
# 檢查安裝
azd version

# 進行AZD認證
# 選擇性：如果您計劃直接執行Azure CLI命令，請使用az login
azd auth login

# 部署您的第一個應用程式
azd init --template todo-nodejs-mongo
azd up

# 完成後進行清理
azd down --force --purge
```

---

## ✅ 成功標準

完成本章後，您應該能：

```bash
azd version              # 顯示已安裝版本
azd init --template todo-nodejs-mongo  # 初始化專案
azd up                   # 部署到 Azure
azd show                 # 顯示運行中應用程式的 URL
azd down --force --purge # 清理資源
```

---

## 🔗 導航

| 方向 | 章節 |
|-----------|---------|
| <strong>下一章</strong> | [第2章：AI 優先開發](../chapter-02-ai-development/README.md) |
| <strong>跳至</strong> | [第3章：設定](../chapter-03-configuration/README.md) |

---

## 📖 相關資源

- [指令速查表](../../resources/cheat-sheet.md)
- [常見問題](../../resources/faq.md)
- [術語表](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
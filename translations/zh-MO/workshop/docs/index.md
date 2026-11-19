# AI 開發者的 AZD 工作坊

> 來源指引經過 2026 年 11 月 4 日 AZD 1.37.2 版本檢視。截圖僅供參考；服務可用性、入口網站標籤及範本預設可能會有所更動。

> [!IMPORTANT]  
> **本工作坊配有工作坊指引，您可在本機瀏覽器中預覽。要開始，請在 GitHub Codespaces、開發容器或安裝了 MkDocs 的本機複本中打開儲存庫，然後等待看到活躍的 VS Code 終端，接着輸入：**  
> 從課程儲存庫根目錄安裝 `requirements-dev.txt`，接着前景執行 `python -m mkdocs serve --config-file workshop/mkdocs.yml`。
> **您應該會看到彈出對話框，詢問是否在瀏覽器中打開預覽頁面。**

歡迎參加專注於 AI 應用部署的 Azure Developer CLI (AZD) 實作工作坊。此工作坊協助您通過三個步驟深入了解 AZD 範本：

1. <strong>探索</strong> - 找出適合您的範本。
1. <strong>部署</strong> - 部署並驗證其運作。
1. <strong>自訂</strong> - 修改並反覆調整，使之成為您的專屬！

在整個工作坊期間，您還將接觸到核心開發工具和流程，助您順暢完成端到端的開發旅程。

| | | 
|:---|:---|
| **📚 課程首頁**| [AZD 初學者](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md)|
| **📖 文件** | [開始使用 AI 範本](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI 範本** | [Microsoft Foundry 範本](https://ai.azure.com/templates) |
|**🚀 下一步** | [接受挑戰](instructions/7-Wrap-up.md#4-workshop-challenge) |
| | |

## 工作坊概覽

**時長：** 3-4 小時  
**程度：** 初學者至中階  
**先備知識：** 熟悉 Azure、AI 概念、VS Code 及命令列工具。

這是一個實作工作坊，讓您通過實踐學習。完成練習後，我們建議您參考 AZD 初學者課程，繼續學習安全和生產力最佳實務。

| 時間| 模組  | 目標 |
|:---|:---|:---|
| 15 分鐘 | 導入 | 說明背景，了解目標 |
| 30 分鐘 | 選擇 AI 範本 | 探索選項並挑選起步範本 | 
| 30 分鐘 | 驗證 AI 範本 | 部署預設方案至 Azure |
| 30 分鐘 | 解構 AI 範本 | 探索結構與設定 |
| 30 分鐘 | 配置 AI 範本 | 啟用並嘗試可用功能 |
| 30 分鐘 | 自訂 AI 範本 | 根據需求調整範本 |
| 30 分鐘 | 拆除基礎設施 | 清理並釋放資源 |
| 15 分鐘 | 結束與下一步 | 學習資源，工作坊挑戰 |
| | |

## 您將學到的內容

將 AZD 範本視為一個學習沙盒，探索 Microsoft Foundry 端到端開發的各種功能與工具。工作坊結束時，您應對此情境中的各種工具與概念有直覺性理解。

| 概念  | 目標 |
|:---|:---|
| **Azure Developer CLI** | 了解工具指令與工作流程|
| **AZD 範本**| 了解專案結構與設定|
| **Azure AI Agent**| 佈建及部署 Microsoft Foundry 專案  |
| **Azure AI Search**| 使用代理促進上下文工程 |
| <strong>可觀察性</strong>| 探索追蹤、監控與評估 |
| <strong>紅隊測試</strong>| 探索對抗測試及緩解措施 |
| | |

## 工作坊模組

準備好開始了嗎？從以下工作坊模組導航：

- [模組 1：選擇 AI 範本](instructions/1-Select-AI-Template.md)
- [模組 2：驗證 AI 範本](instructions/2-Validate-AI-Template.md) 
- [模組 3：解構 AI 範本](instructions/3-Deconstruct-AI-Template.md)
- [模組 4：配置 AI 範本](instructions/4-Configure-AI-Template.md)
- [模組 5：自訂 AI 範本](instructions/5-Customize-AI-Template.md)
- [模組 6：拆除基礎設施](instructions/6-Teardown-Infrastructure.md)
- [模組 7：結束與下一步](instructions/7-Wrap-up.md)

## 有意見回饋嗎？

在此儲存庫發送問題 (標記 `Workshop`) 或加入我們的 [Discord](https://aka.ms/foundry/discord) 頻道，並在 `#get-help` 頻道發佈訊息

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
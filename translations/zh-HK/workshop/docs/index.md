# 適用於 AI 開發者的 AZD 工作坊

> 已使用 `azd 1.27.1` 於 2026 年 7 月進行驗證。

> [!IMPORTANT]  
> **本工作坊配置了一個工作坊指南，可在您的本地瀏覽器中預覽。開始前，請在 GitHub Codespaces、開發容器或安裝了 MkDocs 的本地複製庫中打開該存儲庫，然後等到看到有效的 VS Code 終端機後，輸入：**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **您應該會看到一個彈出對話框，允許您在瀏覽器中打開預覽頁面。**

歡迎參加這個針對 Azure Developer CLI (AZD)，專注於 AI 應用部署的實作工作坊。本工作坊將協助您透過三個步驟，獲得 AZD 範本的應用理解：

1. <strong>探索</strong> - 尋找適合您的範本。
1. <strong>部署</strong> - 部署並驗證其運作。
1. <strong>自訂</strong> - 修改並反覆迭代，使之成為您的專案！

在此工作坊過程中，您亦將接觸到核心開發者工具與工作流程，幫助您優化整個開發旅程。

| | | 
|:---|:---|
| **📚 課程首頁**| [AZD 入門](../README.md)|
| **📖 文件** | [使用 AI 範本入門](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI 範本** | [Microsoft Foundry 範本](https://ai.azure.com/templates) |
|**🚀 後續步驟** | [接受挑戰](#workshop-challenge) |
| | |

## 工作坊概覽

**時間：** 3-4 小時  
**程度：** 初級至中級  
**先備知識：** 熟悉 Azure、AI 概念、VS Code 及命令列工具。

這是一個實作型工作坊，您將透過動手操作學習。完成練習後，我們建議您繼續閱讀 AZD 入門課程，以進一步學習安全與生產力最佳實踐。

| 時間| 模組 | 目標 |
|:---|:---|:---|
| 15 分鐘 | 介紹 | 設定場景，理解目標 |
| 30 分鐘 | 選擇 AI 範本 | 探索選項並選定起步範本 | 
| 30 分鐘 | 驗證 AI 範本 | 將預設解決方案部署至 Azure |
| 30 分鐘 | 拆解 AI 範本 | 探索結構及設定 |
| 30 分鐘 | 配置 AI 範本 | 啟用並嘗試可用功能 |
| 30 分鐘 | 自訂 AI 範本 | 根據您的需求調整範本 |
| 30 分鐘 | 清理基礎架構 | 清理並釋放資源 |
| 15 分鐘 | 總結與後續步驟 | 學習資源，挑戰工作坊 |
| | |

## 你將學到什麼

請將 AZD 範本視為一個學習沙盒，用以探索 Microsoft Foundry 上端到端開發的各種能力與工具。完成此工作坊後，您應該對相關工具與概念有直觀的認識。

| 概念 | 目標 |
|:---|:---|
| **Azure Developer CLI** | 理解工具命令與工作流程|
| **AZD 範本**| 理解專案結構與設定|
| **Azure AI 代理**| 配置並部署 Microsoft Foundry 專案  |
| **Azure AI 搜索**| 啟用代理的上下文工程 |
| <strong>可觀測性</strong>| 探索追蹤、監控及評估 |
| <strong>紅隊測試</strong>| 探索對抗測試與緩解措施 |
| | |

## 工作坊模組

準備好了嗎？請瀏覽以下工作坊模組：

- [模組 1：選擇 AI 範本](instructions/1-Select-AI-Template.md)
- [模組 2：驗證 AI 範本](instructions/2-Validate-AI-Template.md) 
- [模組 3：拆解 AI 範本](instructions/3-Deconstruct-AI-Template.md)
- [模組 4：配置 AI 範本](instructions/4-Configure-AI-Template.md)
- [模組 5：自訂 AI 範本](instructions/5-Customize-AI-Template.md)
- [模組 6：清理基礎架構](instructions/6-Teardown-Infrastructure.md)
- [模組 7：總結與後續步驟](instructions/7-Wrap-up.md)

## 有意見回饋？

在此存儲庫發佈問題（標註為 `Workshop`），或加入我們的 [Discord](https://aka.ms/foundry/discord)，並在 `#get-help` 頻道發帖。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# AZD 給 AI 開發人員的工作坊

> 已於 2026 年 6 月以 `azd 1.25.6` 驗證。
> 
> [!IMPORTANT]  
> **此工作坊內建有一個可在本機瀏覽器中預覽的工作坊指南。要開始，請在 GitHub Codespaces、開發容器，或已安裝 MkDocs 的本機複本中開啟此倉庫—然後等到您看到一個啟動中的 VS Code 終端機並輸入：**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **您應該會看到一個跳出對話方塊，提示在瀏覽器中開啟預覽頁面。**

歡迎參加以 Azure 開發者命令列工具 (AZD) 為主題、聚焦 AI 應用部署的實作工作坊。此工作坊幫助您透過三個步驟實作理解 AZD 範本：

1. <strong>探索</strong> - 找到適合您的範本。
1. <strong>部署</strong> - 部署並驗證其運作
1. <strong>自訂</strong> - 修改並反覆調整以使其符合您的需求！

在本工作坊過程中，您還會被介紹到核心開發人員工具與工作流程，以協助簡化整個端到端開發旅程。

| | | 
|:---|:---|
| **📚 課程主頁**| [AZD 初學者](../README.md)|
| **📖 文件** | [開始使用 AI 範本](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI 範本** | [Microsoft Foundry 範本](https://ai.azure.com/templates) |
|**🚀 下一步** | [接受挑戰](#workshop-challenge) |
| | |

## 工作坊概覽

**時長：** 3-4 小時  
**程度：** 初學到中階  
**先決條件：** 熟悉 Azure、AI 概念、VS Code 與命令列工具。

這是一個實作型工作坊，透過實作學習。完成練習後，我們建議您檢視 AZD 初學者課程，以繼續在安全性與生產力最佳實務方面的學習旅程。

| 時間| 模組  | 目標 |
|:---|:---|:---|
| 15 分鐘 | 介紹 | 設定基調，了解目標 |
| 30 分鐘 | 選擇 AI 範本 | 探索選項並挑選起始範本 | 
| 30 分鐘 | 驗證 AI 範本 | 將預設解決方案部署到 Azure |
| 30 分鐘 | 解析 AI 範本 | 探索結構與設定 |
| 30 分鐘 | 配置 AI 範本 | 啟用並嘗試可用功能 |
| 30 分鐘 | 自訂 AI 範本 | 根據需求調整範本 |
| 30 分鐘 | 拆除基礎設施 | 清理並釋放資源 |
| 15 分鐘 | 總結與後續步驟 | 學習資源，工作坊挑戰 |
| | |

## 您將學到的內容

把 AZD 範本視為一個學習沙盒，用以探索在 Microsoft Foundry 上進行端到端開發的各種能力與工具。到本工作坊結束時，您應該能對相關工具與概念有直覺性的理解。

| 概念  | 目標 |
|:---|:---|
| **Azure 開發者 CLI** | 了解工具指令與工作流程|
| **AZD 範本**| 了解專案結構與設定|
| **Azure AI 代理**| 佈建與部署 Microsoft Foundry 專案  |
| **Azure AI 搜尋**| 使用代理啟用情境工程 |
| <strong>可觀察性</strong>| 探索追蹤、監控與評估 |
| <strong>紅隊測試</strong>| 探索對抗性測試與緩解措施 |
| | |

## 工作坊模組

準備開始了嗎？瀏覽以下工作坊模組：

- [模組 1: 選擇 AI 範本](instructions/1-Select-AI-Template.md)
- [模組 2: 驗證 AI 範本](instructions/2-Validate-AI-Template.md) 
- [模組 3: 解析 AI 範本](instructions/3-Deconstruct-AI-Template.md)
- [模組 4: 配置 AI 範本](instructions/4-Configure-AI-Template.md)
- [模組 5: 自訂 AI 範本](instructions/5-Customize-AI-Template.md)
- [模組 6: 拆除基礎設施](instructions/6-Teardown-Infrastructure.md)
- [模組 7: 總結與後續步驟](instructions/7-Wrap-up.md)

## 有意見回饋嗎？

在此倉庫提出 issue（標記為 `Workshop`），或加入我們的 [Discord](https://aka.ms/foundry/discord) 並於 `#get-help` 頻道發文。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 給 AI 開發者的 AZD 工作坊

> 已針對 2026 年 7 月的 `azd 1.27.1` 版本驗證。

> [!IMPORTANT]  
> **本工作坊配備了工作坊指南，您可以在本地瀏覽器中預覽。開始前，請在 GitHub Codespaces、開發容器，或已安裝 MkDocs 的本地 clone 中打開此倉庫——然後等待看到活動的 VS Code 終端機並輸入：**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **您應該會看到一個彈出對話框，提示在瀏覽器中打開預覽頁面。**

歡迎參加專注於 AI 應用部署的 Azure Developer CLI (AZD) 實作工作坊。這個工作坊透過 3 個步驟，幫助您實際學習 AZD 範本：

1. <strong>探索</strong> - 找到適合您的範本。
1. <strong>部署</strong> - 部署並驗證範本是否有效。
1. <strong>自訂</strong> - 修改並迭代，使其成為您的專案！

在工作坊過程中，您還將接觸到核心開發工具和工作流程，幫助您優化端到端開發流程。

| | | 
|:---|:---|
| **📚 課程首頁**| [AZD 初學者](../README.md)|
| **📖 文件** | [從 AI 範本開始](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI 範本** | [Microsoft Foundry 範本](https://ai.azure.com/templates) |
|**🚀 下一步** | [接受挑戰](#workshop-challenge) |
| | |

## 工作坊概覽

**時長:** 3-4 小時  
**等級:** 初學者至中階  
**先備知識:** 了解 Azure、AI 概念、VS Code 及命令列工具。

這是個實作工作坊，透過實際練習學習。完成練習後，我們建議您回顧 AZD 初學者課程，繼續深入學習安全和生產力最佳實踐。

| 時間| 模組  | 目標 |
|:---|:---|:---|
| 15 分鐘 | 介紹 | 設定階段，理解目標 |
| 30 分鐘 | 選擇 AI 範本 | 探索選項並選定起點 | 
| 30 分鐘 | 驗證 AI 範本 | 部署預設方案至 Azure |
| 30 分鐘 | 拆解 AI 範本 | 探索結構與設定 |
| 30 分鐘 | 配置 AI 範本 | 啟用並嘗試現有功能 |
| 30 分鐘 | 客制化 AI 範本 | 根據需求調整範本 |
| 30 分鐘 | 拆除基礎架構 | 清理並釋放資源 |
| 15 分鐘 | 總結與下一步 | 學習資源，工作坊挑戰 |
| | |

## 您將學到什麼

將 AZD 範本視為學習沙盒，探索 Microsoft Foundry 端到端開發的各種能力與工具。完成本工作坊後，您應對此背景中的多種工具與概念有直觀的了解。

| 概念  | 目標 |
|:---|:---|
| **Azure Developer CLI** | 了解命令及工作流程 |
| **AZD 範本**| 了解專案結構與設定 |
| **Azure AI Agent**| 配置並部署 Microsoft Foundry 專案  |
| **Azure AI 搜尋**| 透過代理實現情境工程 |
| <strong>可觀察性</strong>| 探索追蹤、監控與評估 |
| <strong>紅隊測試</strong>| 探索對抗測試與緩解措施 |
| | |

## 工作坊模組

準備開始了嗎？請瀏覽以下工作坊模組：

- [模組 1：選擇 AI 範本](instructions/1-Select-AI-Template.md)
- [模組 2：驗證 AI 範本](instructions/2-Validate-AI-Template.md) 
- [模組 3：拆解 AI 範本](instructions/3-Deconstruct-AI-Template.md)
- [模組 4：配置 AI 範本](instructions/4-Configure-AI-Template.md)
- [模組 5：自訂 AI 範本](instructions/5-Customize-AI-Template.md)
- [模組 6：拆除基礎設施](instructions/6-Teardown-Infrastructure.md)
- [模組 7：總結與下一步](instructions/7-Wrap-up.md)

## 有意見回饋嗎？

請在此 repo 發布 issue（標籤為 `Workshop`）或加入我們的 [Discord](https://aka.ms/foundry/discord)，並發佈至 `#get-help` 頻道

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# AI 開發者的 AZD 工作坊

> 已於 2026 年 7 月使用 `azd 1.27.1` 驗證。

> [!IMPORTANT]  
> **本工作坊附有可在本地瀏覽器預覽的工作坊指南。開始之前，請在 GitHub Codespaces、開發容器或安裝 MkDocs 的本地複製庫中打開此倉庫，然後等待看到活動的 VS Code 終端機後輸入：**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **系統應會跳出對話框，提示你在瀏覽器中打開預覽頁面。**

歡迎加入這個學習 Azure Developer CLI (AZD) 並專注於 AI 應用部署的實作工作坊。本工作坊將透過三個步驟幫助你應用並了解 AZD 模板：

1. <strong>探索</strong> - 找出適合你的模板。
1. <strong>部署</strong> - 部署並驗證其功能
1. <strong>客製化</strong> - 修改並反覆調整，使其成為你的專屬！

在此過程中，你還將熟悉核心開發工具與工作流程，幫助你優化從頭到尾的開發旅程。

| | | 
|:---|:---|
| **📚 課程首頁**| [AZD 初學者指南](../README.md)|
| **📖 文件** | [AI 模板快速入門](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI 模板** | [Microsoft Foundry 範本](https://ai.azure.com/templates) |
|**🚀 下一步** | [挑戰任務](#workshop-challenge) |
| | |

## 工作坊概覽

**時長：** 3-4 小時  
**程度：** 初學至中階  
**先備知識：** 熟悉 Azure、AI 概念、VS Code 與指令列工具。

這是一個透過實作學習的工作坊。完成練習後，我們建議你回顧 AZD 初學者課程，持續學習安全與生產力的最佳實踐。

| 時間| 模組  | 目標 |
|:---|:---|:---|
| 15 分鐘 | 介紹 | 了解目標與背景 |
| 30 分鐘 | 選擇 AI 模板 | 探索選項並選擇入門模板 | 
| 30 分鐘 | 驗證 AI 模板 | 將預設方案部署到 Azure |
| 30 分鐘 | 拆解 AI 模板 | 探索結構與設定 |
| 30 分鐘 | 設定 AI 模板 | 啟用並嘗試可用功能 |
| 30 分鐘 | 客製化 AI 模板 | 根據需求調整模板 |
| 30 分鐘 | 拆除基礎設施 | 清理並釋放資源 |
| 15 分鐘 | 結束與後續 | 學習資源，工作坊挑戰 |
| | |

## 你將學到什麼

將 AZD 模板視為學習沙盒，探索 Microsoft Foundry 上端到端開發的各種能力與工具。完成本工作坊後，你應能對相關工具與概念有直覺理解。

| 概念  | 目標 |
|:---|:---|
| **Azure Developer CLI** | 了解工具指令與工作流程 |
| **AZD 模板** | 理解專案結構與配置 |
| **Azure AI Agent** | 佈署 Microsoft Foundry 專案  |
| **Azure AI Search** | 啟用代理進行上下文工程 |
| <strong>可觀察性</strong> | 探索追蹤、監控與評估 |
| <strong>紅隊測試</strong> | 探討對抗性測試與緩解措施 |
| | |

## 工作坊模組

準備好了嗎？開始瀏覽工作坊模組：

- [模組 1：選擇 AI 模板](instructions/1-Select-AI-Template.md)
- [模組 2：驗證 AI 模板](instructions/2-Validate-AI-Template.md) 
- [模組 3：拆解 AI 模板](instructions/3-Deconstruct-AI-Template.md)
- [模組 4：設定 AI 模板](instructions/4-Configure-AI-Template.md)
- [模組 5：客製化 AI 模板](instructions/5-Customize-AI-Template.md)
- [模組 6：拆除基礎設施](instructions/6-Teardown-Infrastructure.md)
- [模組 7：結束與後續](instructions/7-Wrap-up.md)

## 有意見嗎？

在此倉庫發起 issue（標籤為 `Workshop`）或加入我們的 [Discord](https://aka.ms/foundry/discord)，在 `#get-help` 頻道發問。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
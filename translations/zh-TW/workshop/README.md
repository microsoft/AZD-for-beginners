<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 AI 開發者的 AZD 工作坊
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>使用 Azure Developer CLI 建置 AI 應用程式的實作工作坊。</strong><br>
      完成 7 個模組，掌握 AZD 範本與 AI 部署工作流程。
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 最後更新：2026 年 3 月
      </span>
    </div>
  </div>
</div>

# AI 開發者的 AZD 工作坊

歡迎參加專注於 AI 應用部署的 Azure Developer CLI (AZD) 實作工作坊。此工作坊幫助你透過三個步驟獲得 AZD 範本的實務理解：

1. <strong>探索</strong> - 找出適合你的範本。
1. <strong>部署</strong> - 部署並驗證其運作。
1. <strong>自訂</strong> - 修改並反覆調整，讓它成為你的！

在此工作坊過程中，你也將學習核心開發工具與工作流程，協助你簡化整體開發旅程。

<br/>

## 瀏覽器導覽指南

工作坊課程以 Markdown 編寫。你可以直接在 GitHub 中瀏覽，或如截圖所示啟動瀏覽器預覽。

![Workshop](../../../translated_images/zh-TW/workshop.75906f133e6f8ba0.webp)

使用此選項的方法是：將此儲存庫分支（fork）到你的個人帳號，並啟動 GitHub Codespaces。當 VS Code 終端機啟動後，輸入此指令：

此瀏覽器預覽適用於 GitHub Codespaces、開發容器，或安裝了 Python 與 MkDocs 的本地端複製。

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

幾秒鐘後你會看到跳出對話視窗。選擇 `Open in browser` 選項，網頁版導覽將於新分頁中開啟。此預覽的優點包括：

1. <strong>內建搜尋</strong> - 快速尋找關鍵字或課程。
1. <strong>複製圖示</strong> - 滑鼠懸停在程式碼區塊上時顯示。
1. <strong>主題切換</strong> - 在深色與淺色主題間切換。
1. <strong>尋求協助</strong> - 點擊頁尾的 Discord 圖示加入社群！

<br/>

## 工作坊概覽

**時長:** 3-4 小時  
**程度:** 初學到中階  
**先備知識:** 熟悉 Azure、AI 概念、VS Code 及命令列工具。

這是一堂動手做的工作坊，透過實作學習。完成練習後，建議瀏覽 AZD 入門課程，繼續學習安全性與生產力最佳實務。

| 時間| 模組  | 目標 |
|:---|:---|:---|
| 15 分鐘 | [介紹](docs/instructions/0-Introduction.md) | 了解整體架構與目標 |
| 30 分鐘 | [選擇 AI 範本](docs/instructions/1-Select-AI-Template.md) | 探索選項並挑選起點 | 
| 30 分鐘 | [驗證 AI 範本](docs/instructions/2-Validate-AI-Template.md) | 部署預設解決方案到 Azure |
| 30 分鐘 | [拆解 AI 範本](docs/instructions/3-Deconstruct-AI-Template.md) | 探索結構與設定 |
| 30 分鐘 | [配置 AI 範本](docs/instructions/4-Configure-AI-Template.md) | 啟用並嘗試可用功能 |
| 30 分鐘 | [自訂 AI 範本](docs/instructions/5-Customize-AI-Template.md) | 根據需求調整範本 |
| 30 分鐘 | [拆除基礎架構](docs/instructions/6-Teardown-Infrastructure.md) | 清理與釋放資源 |
| 15 分鐘 | [總結與後續](docs/instructions/7-Wrap-up.md) | 學習資源與工作坊挑戰 |

<br/>

## 你將學到什麼

將 AZD 範本視為學習沙盒，以探索 Microsoft Foundry 端對端開發的各種功能與工具。完成此工作坊後，你將對相關工具與概念有直覺式認識。

| 概念  | 目標 |
|:---|:---|
| **Azure Developer CLI** | 理解指令工具與工作流程|
| **AZD 範本**| 了解專案結構與配置|
| **Azure AI Agent**| 配置與部署 Microsoft Foundry 專案  |
| **Azure AI Search**| 使用 Agent 實現情境工程 |
| <strong>可觀察性</strong>| 探索追蹤、監控與評估 |
| <strong>紅隊測試</strong>| 探索對抗測試與緩解措施 |

<br/>

## 工作坊架構

本工作坊引導你從範本探索到部署、拆解，再到自訂，藉由官方的 [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) 入門範本為基礎。

### [模組 1：選擇 AI 範本](docs/instructions/1-Select-AI-Template.md) (30 分鐘)

- 什麼是 AI 範本？
- 在哪裡可以找到 AI 範本？
- 如何開始建置 AI Agents？
- <strong>實作</strong>：在 Codespaces 或開發容器快速啟動

### [模組 2：驗證 AI 範本](docs/instructions/2-Validate-AI-Template.md) (30 分鐘)

- AI 範本架構說明
- AZD 開發工作流程介紹
- 如何取得 AZD 開發協助？
- <strong>實作</strong>：部署與驗證 AI Agents 範本

### [模組 3：拆解 AI 範本](docs/instructions/3-Deconstruct-AI-Template.md) (30 分鐘)

- 探索 `.azure/` 環境設定
- 探索 `infra/` 資源配置
- 探索 `azure.yaml` AZD 配置檔
- <strong>實作</strong>：修改環境變數並重新部署

### [模組 4：配置 AI 範本](docs/instructions/4-Configure-AI-Template.md) (30 分鐘)
- 探索：檢索增強生成 (Retrieval Augmented Generation)
- 探索：Agent 評估與紅隊測試
- 探索：追蹤與監控
- <strong>實作</strong>：探索 AI Agent 與可觀察性

### [模組 5：自訂 AI 範本](docs/instructions/5-Customize-AI-Template.md) (30 分鐘)
- 定義：scenario 需求的產品需求文件 (PRD)
- 配置：AZD 的環境變數
- 實作：生命週期掛勾以加增任務
- <strong>實作</strong>：為我的情境自訂範本

### [模組 6：拆除基礎架構](docs/instructions/6-Teardown-Infrastructure.md) (30 分鐘)
- 複習：什麼是 AZD 範本？
- 複習：為什麼使用 Azure Developer CLI？
- 後續步驟：試試其他範本！
- <strong>實作</strong>：卸載基礎架構並清理

<br/>

## 工作坊挑戰

想挑戰更多嗎？以下是一些專案建議，也歡迎分享你的點子給我們！

| 專案 | 說明 |
|:---|:---|
|1. **拆解複雜 AI 範本** | 使用我們介紹的工作流程與工具，看看你是否能部署、驗證並自訂其他 AI 解決方案範本。_學到了什麼？_|
|2. <strong>以你的情境自訂</strong>  | 嘗試為不同情境撰寫產品需求文件（PRD），然後在範本儲存庫中使用 GitHub Copilot 的 Agent 模型，請它產生自訂工作流程。_學到了什麼？你如何改進這些建議？_|
| | |

## 有回饋嗎？

1. 在此儲存庫提出議題 (issue) — 標註 `Workshop` 方便管理。
1. 加入 Microsoft Foundry Discord — 與其他學員交流！


| | | 
|:---|:---|
| **📚 課程首頁**| [AZD 新手入門](../README.md)|
| **📖 文件資源** | [開始使用 AI 範本](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI 範本** | [Microsoft Foundry 範本](https://ai.azure.com/templates) |
|**🚀 接下來** | [開始工作坊](#工作坊概覽) |
| | |

<br/>

---

**導覽：** [主課程](../README.md) | [介紹](docs/instructions/0-Introduction.md) | [模組 1：選擇範本](docs/instructions/1-Select-AI-Template.md)

**準備好使用 AZD 建置 AI 應用程式了嗎？**

[開始工作坊：介紹 →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
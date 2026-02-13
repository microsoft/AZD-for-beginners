<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 給 AI 開發者的 AZD 工作坊
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>使用 Azure 開發者 CLI 建構 AI 應用的實作工作坊。</strong><br>
      完成 7 個模組，精通 AZD 範本與 AI 部署工作流程。
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 最後更新：2026年2月
      </span>
    </div>
  </div>
</div>

# 給 AI 開發者的 AZD 工作坊

歡迎參加以 AI 應用部署為重點的 Azure 開發者 CLI (AZD) 實作工作坊。本工作坊透過 3 個步驟幫助你對 AZD 範本取得實務理解：

1. **探索** - 找到適合你的範本。
1. **部署** - 部署並驗證其運作
1. **自訂** - 修改與迭代，使其成為你的專屬！

在本工作坊過程中，你也會接觸到核心開發工具與工作流程，幫助你簡化端到端的開發旅程。

<br/>

## 瀏覽器版指南

工作坊課程以 Markdown 撰寫。你可以直接在 GitHub 上瀏覽它們，或如下方截圖所示啟動瀏覽器預覽。

![工作坊](../../../translated_images/zh-MO/workshop.75906f133e6f8ba0.webp)

要使用此選項 - 將 repository fork 到你的個人帳戶，並啟動 GitHub Codespaces。當 VS Code 終端機啟動後，輸入此指令：

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

幾秒鐘後，你會看到彈出對話方塊。選擇 `在瀏覽器中開啟` 選項。網頁版指南將會在新的瀏覽器分頁中開啟。此預覽的一些好處：

1. **內建搜尋** - 快速找到關鍵字或課程。
1. **複製圖示** - 將游標移到程式碼區塊上可看到此選項
1. **主題切換** - 在深色與淺色主題間切換
1. **取得協助** - 點擊頁尾的 Discord 圖示以加入！

<br/>

## 工作坊概覽

**時長:** 3-4 小時  
**程度:** 初階到中階  
**先決條件:** 熟悉 Azure、AI 概念、VS Code 與命令列工具。

這是一個以實作為主的工作坊，透過做中學習。一旦完成練習，我們建議你檢視「AZD 初學者」課程，以持續學習安全性與生產力的最佳實務。

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | [介紹](docs/instructions/0-Introduction.md) | 設定場景，了解目標 |
| 30 mins | [選擇 AI 範本](docs/instructions/1-Select-AI-Template.md) | 探索選項並挑選入門範本 | 
| 30 mins | [驗證 AI 範本](docs/instructions/2-Validate-AI-Template.md) | 將預設解決方案部署到 Azure |
| 30 mins | [拆解 AI 範本](docs/instructions/3-Deconstruct-AI-Template.md) | 探索結構與設定 |
| 30 mins | [設定 AI 範本](docs/instructions/4-Configure-AI-Template.md) | 啟用並嘗試可用功能 |
| 30 mins | [自訂 AI 範本](docs/instructions/5-Customize-AI-Template.md) | 自訂範本以符合你的需求 |
| 30 mins | [拆除基礎設施](docs/instructions/6-Teardown-Infrastructure.md) | 清理並釋放資源 |
| 15 mins | [總結與後續步驟](docs/instructions/7-Wrap-up.md) | 學習資源，工作坊挑戰 |

<br/>

## 你將學到的內容

把 AZD 範本當作一個學習沙盒，探索在 Microsoft Foundry 上端到端開發所需的各種能力與工具。到本工作坊結束時，你應該對這個情境下的各種工具與概念有直觀的認識。

| Concept  | Objective |
|:---|:---|
| **Azure 開發者 CLI** | 了解工具指令與工作流程|
| **AZD 範本**| 了解專案結構與設定|
| **Azure AI Agent**| 佈建並部署 Microsoft Foundry 專案  |
| **Azure AI Search**| 與 Agent 一同啟用情境工程 |
| **可觀察性**| 探索追蹤、監控與評估 |
| **紅隊測試**| 探討對抗性測試與緩解措施 |

<br/>

## 工作坊架構

工作坊的結構會帶你從範本探索，走到部署、拆解與自訂 — 以官方的 [開始使用 AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) 入門範本為基礎。

### [模組 1：選擇 AI 範本](docs/instructions/1-Select-AI-Template.md) (30 分鐘)

- AI 範本是什麼？
- 在哪裡可以找到 AI 範本？
- 如何開始建立 AI Agents？
- **實作**: 使用 GitHub Codespaces 快速上手

### [模組 2：驗證 AI 範本](docs/instructions/2-Validate-AI-Template.md) (30 分鐘)

- AI 範本架構是什麼？
- AZD 開發工作流程是什麼？
- 如何在 AZD 開發時取得協助？
- **實作**: 部署並驗證 AI Agents 範本

### [模組 3：拆解 AI 範本](docs/instructions/3-Deconstruct-AI-Template.md) (30 分鐘)

- 檢視你的環境於 `.azure/` 
- 檢視你的資源設定於 `infra/` 
- 探索你在 `azure.yaml`s 中的 AZD 設定
- **實作**: 修改環境變數並重新部署

### [模組 4：設定 AI 範本](docs/instructions/4-Configure-AI-Template.md) (30 分鐘)
- 探索：檢索增強生成
- 探索：Agent 評估與紅隊測試
- 探索：追蹤與監控
- **實作**: 探索 AI Agent 與可觀察性 

### [模組 5：自訂 AI 範本](docs/instructions/5-Customize-AI-Template.md) (30 分鐘)
- 定義：具情境需求的 PRD（產品需求文件）
- 設定：AZD 的環境變數
- 實作：生命週期 Hook 以支援額外任務
- **實作**: 為我的情境自訂範本

### [模組 6：拆除基礎設施](docs/instructions/6-Teardown-Infrastructure.md) (30 分鐘)
- 複習：什麼是 AZD 範本？
- 複習：為何使用 Azure 開發者 CLI？
- 後續步驟：嘗試不同的範本！
- **實作**: 解除佈建基礎設施並清理

<br/>

## 工作坊挑戰

想挑戰自我做更多事嗎？以下是一些專案建議 — 或與我們分享你的想法！！

| 專案 | 說明 |
|:---|:---|
|1. **拆解複雜的 AI 範本** | 使用我們概述的工作流程與工具，看看能否部署、驗證，並自訂另一個 AI 解決方案範本。 _你學到了什麼?_|
|2. **以你的情境進行自訂**  | 試著為另一個情境撰寫 PRD（產品需求文件）。接著在你的範本倉庫中以 Agent Model 使用 GitHub Copilot，並請它為你產生自訂工作流程。 _你學到了什麼？你如何改進這些建議？_|
| | |

## 有意見回饋嗎？

1. 在此 repo 發表 issue - 為方便請標註 `Workshop`。
1. 加入 Microsoft Foundry 的 Discord - 與同儕連線！


| | | 
|:---|:---|
| **📚 課程首頁**| [AZD 初學者](../README.md)|
| **📖 文件** | [開始使用 AI 範本](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI 範本** | [Microsoft Foundry 範本](https://ai.azure.com/templates) |
|**🚀 後續步驟** | [開始工作坊](../../../workshop) |
| | |

<br/>

---

**導覽：** [主課程](../README.md) | [介紹](docs/instructions/0-Introduction.md) | [模組 1：選擇範本](docs/instructions/1-Select-AI-Template.md)

**準備好使用 AZD 開始建構 AI 應用了嗎？**

[開始工作坊：介紹 →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們盡力確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言版本應被視為具權威性的來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
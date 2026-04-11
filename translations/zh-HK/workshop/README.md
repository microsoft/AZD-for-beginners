<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 AZD AI 開發者工作坊
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>一個使用 Azure Developer CLI 的實作型工作坊，專注於建立 AI 應用程式。</strong><br>
      完成 7 個模組，掌握 AZD 範本與 AI 部署工作流程。
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 最後更新：2026年3月
      </span>
    </div>
  </div>
</div>

# AZD AI 開發者工作坊

歡迎參加以 Azure Developer CLI (AZD) 為主題、聚焦於 AI 應用部署的實作工作坊。本工作坊透過 3 個步驟幫助你實作並理解 AZD 範本：

1. <strong>探索</strong> - 找到最適合你的範本。
1. <strong>部署</strong> - 部署並驗證其運作
1. <strong>自訂</strong> - 修改並反覆調整，讓它成為你的！

在本工作坊過程中，你也會接觸到核心的開發工具與工作流程，協助你精簡端到端的開發歷程。

<br/>

## 瀏覽器預覽指南

工作坊課程以 Markdown 撰寫。你可以直接在 GitHub 中瀏覽它們，或如下圖示啟動瀏覽器預覽。

![工作坊](../../../translated_images/zh-HK/workshop.75906f133e6f8ba0.webp)

要使用此選項 - 將此儲存庫 fork 到你的帳戶，然後啟動 GitHub Codespaces。當 VS Code 的終端機啟動後，輸入下列指令：

This browser preview works in GitHub Codespaces, dev containers, or a local clone with Python and MkDocs installed.

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

In a few seconds, you will see a pop-up dialog. Select the option to `在瀏覽器中開啟`. The web-based guide will now open in a new browser tab. Some benefits of this preview:

1. <strong>內建搜尋</strong> - 快速找到關鍵字或課程
1. <strong>複製圖示</strong> - 將滑鼠移到程式碼區塊以顯示此選項
1. <strong>主題切換</strong> - 在深色與淺色主題間切換
1. <strong>取得協助</strong> - 點選頁尾的 Discord 圖示加入！

<br/>

## 工作坊總覽

**Duration:** 3-4 小時  
**Level:** 初學者至中階  
**Prerequisites:** 具備 Azure、AI 概念、VS Code 與命令列工具的基本認識。

這是一個透過實作學習的工作坊。完成練習後，我們建議你回顧 AZD For Beginners 課程，以延伸你的學習，涵蓋安全性與生產力的最佳實務。

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | [簡介](docs/instructions/0-Introduction.md) | 設定情境，理解目標 |
| 30 mins | [選擇 AI 範本](docs/instructions/1-Select-AI-Template.md) | 探索選項並選擇起始範本 | 
| 30 mins | [驗證 AI 範本](docs/instructions/2-Validate-AI-Template.md) | 將預設解決方案部署到 Azure |
| 30 mins | [解析 AI 範本](docs/instructions/3-Deconstruct-AI-Template.md) | 探索結構與設定檔 |
| 30 mins | [設定 AI 範本](docs/instructions/4-Configure-AI-Template.md) | 啟用並嘗試可用功能 |
| 30 mins | [自訂 AI 範本](docs/instructions/5-Customize-AI-Template.md) | 將範本調整以符合你的需求 |
| 30 mins | [拆除基礎設施](docs/instructions/6-Teardown-Infrastructure.md) | 清理並釋放資源 |
| 15 mins | [結業與下一步](docs/instructions/7-Wrap-up.md) | 學習資源、工作坊挑戰 |

<br/>

## 你將學到的內容

將 AZD 範本視為一個學習沙盒，用來探索在 Microsoft Foundry 上進行端到端開發的各種能力與工具。完成本工作坊後，你應該能對此情境中的各項工具與概念有直覺性的理解。

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | 了解工具指令與工作流程|
| **AZD Templates**| 了解專案結構與設定|
| **Azure AI Agent**| 建立與部署 Microsoft Foundry 專案  |
| **Azure AI Search**| 使用代理實現上下文工程 |
| **Observability**| 探索追蹤、監控與評估 |
| **Red Teaming**| 探索對抗性測試與緩解策略 |

<br/>

## 工作坊結構

本工作坊安排會帶你從範本探索、到部署、解析，最後到自訂 — 以官方的 [開始使用 AI 代理範本](https://github.com/Azure-Samples/get-started-with-ai-agents) 作為基礎。

### [模組 1：選擇 AI 範本](docs/instructions/1-Select-AI-Template.md) (30 mins)

- 什麼是 AI 範本？
- 我可以在哪裡找到 AI 範本？
- 怎麼開始建立 AI 代理？
- <strong>實驗室</strong>：在 Codespaces 或開發容器中快速上手

### [模組 2：驗證 AI 範本](docs/instructions/2-Validate-AI-Template.md) (30 mins)

- AI 範本的架構為何？
- AZD 的開發工作流程是什麼？
- 如何取得 AZD 開發的協助？
- <strong>實驗室</strong>：部署並驗證 AI 代理範本

### [模組 3：解析 AI 範本](docs/instructions/3-Deconstruct-AI-Template.md) (30 mins)

- 探索你的環境於 `.azure/` 
- 探索你的資源設定於 `infra/` 
- 探索你的 AZD 設定於 `azure.yaml`s
- <strong>實驗室</strong>：修改環境變數並重新部署

### [模組 4：設定 AI 範本](docs/instructions/4-Configure-AI-Template.md) (30 mins)
- 探索：檢索增強生成 (Retrieval Augmented Generation)
- 探索：代理評估與 Red Teaming
- 探索：追蹤與監控
- <strong>實驗室</strong>：探索 AI 代理 + 可觀察性 

### [模組 5：自訂 AI 範本](docs/instructions/5-Customize-AI-Template.md) (30 mins)
- 定義：以情境需求撰寫 PRD（產品需求文件）
- 設定：AZD 的環境變數
- 實作：為額外任務加入生命週期鉤子
- <strong>實驗室</strong>：為我的情境自訂範本

### [模組 6：拆除基礎設施](docs/instructions/6-Teardown-Infrastructure.md) (30 mins)
- 回顧：什麼是 AZD 範本？
- 回顧：為何使用 Azure Developer CLI？
- 下一步：嘗試不同的範本！
- <strong>實驗室</strong>：解除佈署基礎設施並清理

<br/>

## 工作坊挑戰

想挑戰自己做更多嗎？以下是一些專案建議—或與我們分享你的想法!!

| Project | Description |
|:---|:---|
|1. **解析一個複雜的 AI 範本** | 使用我們概述的工作流程與工具，看看你是否能部署、驗證並自訂不同的 AI 解決方案範本。 _你學到什麼？_|
|2. <strong>以你的情境進行自訂</strong>  | 嘗試為不同情境撰寫 PRD（產品需求文件）。然後在你的範本 repo 中使用 GitHub Copilot 的 Agent Model，並請它為你產生自訂化的工作流程。 _你學到什麼？你可以如何改進這些建議？_|
| | |

## 有意見回饋嗎？

1. 在此儲存庫發佈 issue - 方便起見標註 `Workshop`。
1. 加入 Microsoft Foundry 的 Discord - 與你的同儕連結！


| | | 
|:---|:---|
| **📚 課程首頁**| [AZD 初學者](../README.md)|
| **📖 文件** | [開始使用 AI 範本](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI 範本** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 下一步** | [開始工作坊](#工作坊總覽) |
| | |

<br/>

---

**導航：** [主課程](../README.md) | [簡介](docs/instructions/0-Introduction.md) | [模組 1：選擇 AI 範本](docs/instructions/1-Select-AI-Template.md)

**準備好用 AZD 開發 AI 應用程式了嗎？**

[開始工作坊：簡介 →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力提供準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言的原文應被視為具有權威性的版本。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而引致的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
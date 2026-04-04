# 1. 選擇範本

!!! tip "本單元完成後您將能夠"

    - [ ] 描述 AZD 範本是什麼
    - [ ] 探索並使用適用於 AI 的 AZD 範本
    - [ ] 開始使用 AI 代理人的範本
    - [ ] **實作 1：** 在 Codespaces 或開發容器中進行 AZD 快速入門

---

## 1. 建築師比喻

從頭開始建造一個現代企業級 AI 應用程式可能讓人望而卻步。這有點像自己一磚一瓦地建造新家。是的，這是可以做到的！但並非達成理想結果的最佳方法！

相反地，我們通常會從現有的 _設計藍圖_ 開始，並與建築師合作根據個人需求進行定制。這正是建構智慧應用程式時應採取的方法。首先，找到適合您問題領域的良好設計架構。然後與解決方案架構師合作，為您的具體場景自訂和開發解決方案。

不過，我們在哪裡能找到這些設計藍圖？又怎麼找到願意教我們如何定制並自行部署這些藍圖的建築師？在本工作坊中，我們會介紹三種技術來回答這些問題：

1. [Azure Developer CLI](https://aka.ms/azd) - 一款開源工具，加速開發者從本地開發（建置）到雲端部署（發佈）的流程。
1. [Microsoft Foundry 範本](https://ai.azure.com/templates) - 標準化的開源儲存庫，包含用於部署 AI 解決方案架構的程式碼範例、基礎架構及配置文件。
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - 基於 Azure 知識的程式碼代理人，能以自然語言幫助瀏覽程式碼庫與修改程式。

有了這些工具，我們就能 _發現_ 合適的範本，_部署_ 以驗證其運作，並 _客製化_ 以符合具體場景。讓我們開始深入了解這些如何運作。

---

## 2. Azure Developer CLI

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)（簡稱 `azd`）是一款開源命令列工具，提供一組適合開發者使用的指令，在您的 IDE（開發）與 CI/CD（開發運維）環境中保持一致，能加快您的程式碼到雲端的旅程。

使用 `azd`，您的部署流程可以簡單如下：

- `azd init` - 從現有的 AZD 範本初始化新的 AI 專案。
- `azd up` - 一鍵佈建基礎架構並部署您的應用程式。
- `azd monitor` - 取得已部署應用程式的即時監控與診斷。
- `azd pipeline config` - 設定 CI/CD 流水線，自動化部署到 Azure。

**🎯 | 練習**：<br/> 
現在就在您當前的工作坊環境中探索 `azd` 命令列工具。這可能是 GitHub Codespaces、開發容器，或已安裝先決條件的本地複本。先輸入這條指令看看工具能做什麼：

```bash title="" linenums="0"
azd help
```

![流程](../../../../../translated_images/zh-MO/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD 範本

為了讓 `azd` 能完成這些工作，它需要知道要佈建的基礎架構、要強制執行的配置設定，以及要部署的應用程式。這就是 [AZD 範本](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) 的用武之地。

AZD 範本是結合了範例程式碼與基礎架構和配置文件的開源儲存庫，用於部署解決方案架構。
採用基礎架構即程式碼（Infrastructure-as-Code，IaC）方式，讓範本中的資源定義與設定都可像應用程式原始碼一樣進行版本控制，為該專案使用者創建可重用且一致的工作流程。

當為 _您的_ 場景建立或使用 AZD 範本時，可考慮以下問題：

1. 您在建造什麼？→ 是否有包含該場景啟動程式碼的範本？
1. 您的解決方案如何架構？→ 是否有包含必要資源的範本？
1. 您的解決方案如何部署？→ 想想含有前後處理掛鉤（hook）的 `azd deploy`！
1. 如何進一步優化？→ 想想內建的監控與自動化流水線！

**🎯 | 練習**：<br/> 
造訪 [Awesome AZD](https://azure.github.io/awesome-azd/) 展示平台，使用篩選器探索目前超過 250 個的範本。看看是否能找到與 _您的_ 場景需求匹配的範本。

![程式碼](../../../../../translated_images/zh-MO/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI 應用範本

針對 AI 驅動的應用程式，微軟提供了特色鮮明的範本，包含 **Microsoft Foundry** 和 **Foundry Agents**。這些範本能加速您建構智慧且生產準備就緒應用程式的步伐。

### Microsoft Foundry 及 Foundry Agents 範本

請從下方選擇範本並部署。每個範本皆可在 [Awesome AZD](https://azure.github.io/awesome-azd/) 獲得，並可透過單一指令初始化。

| 範本 | 說明 | 部署指令 |
|----------|-------------|----------------|
| **[帶有 RAG 的 AI 聊天](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | 使用 Microsoft Foundry 的檢索強化生成聊天應用程式 | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry 代理服務入門](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | 使用 Foundry 代理構建自動任務執行的 AI 代理人 | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[多代理人協調](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | 協調多個 Foundry 代理人以處理複雜工作流程 | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI 文件智能](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | 使用 Microsoft Foundry 模型提取和分析文件 | `azd init -t azure-samples/ai-document-processing` |
| **[會話式 AI 機器人](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | 構建整合 Microsoft Foundry 的智能聊天機器人 | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI 影像生成](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | 使用 Microsoft Foundry 透過 DALL-E 生成影像 | `azd init -t azure-samples/ai-image-generation` |
| **[語意核心代理](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | 使用 Foundry 代理與語意核心建構 AI 代理人 | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen 多代理人](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | 使用 AutoGen 框架的多代理人系統 | `azd init -t azure-samples/autogen-multi-agent` |

### 快速開始

1. <strong>瀏覽範本</strong>：造訪 [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) 並以 `AI`、`Agents` 或 `Microsoft Foundry` 篩選
2. <strong>選擇您的範本</strong>：挑選符合您的使用案例的範本
3. <strong>初始化</strong>：針對選定範本執行 `azd init`
4. <strong>部署</strong>：執行 `azd up` 佈建並部署

**🎯 | 練習**：<br/>
根據您的場景選擇上述其中一個範本：

- **想建立聊天機器人？** → 從 **帶有 RAG 的 AI 聊天** 或 **會話式 AI 機器人** 開始
- **需要自動代理人？** → 試試 **Foundry 代理服務入門** 或 <strong>多代理人協調</strong>
- **處理文件？** → 使用 **AI 文件智能**
- **想要 AI 編程輔助？** → 探索 <strong>語意核心代理</strong> 或 **AutoGen 多代理人**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "探索更多範本"
    [Awesome AZD 展示平台](https://azure.github.io/awesome-azd/) 包含超過 250 個範本。使用篩選器尋找符合語言、框架及 Azure 服務的特定需求之範本。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於確保準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯內容而產生的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
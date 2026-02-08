# 1. 選擇範本

!!! tip "在本單元結束時您將能夠"

    - [ ] 描述什麼是 AZD 範本
    - [ ] 探索並使用用於 AI 的 AZD 範本
    - [ ] 開始使用 AI Agents 範本
    - [ ] **實驗 1：** 使用 GitHub Codespaces 的 AZD 快速入門

---

## 1. 建造者類比

從頭開始建構現代企業級 AI 應用程式可能令人望而生畏。這有點像親手一磚一瓦地蓋自己的新家。是的，這是可以做到的！但這並非達成預期結果的最有效方式！

相反地，我們通常會從現有的 _設計藍圖_ 開始，並與建築師合作，按個人需求進行客製化。這就是建構智慧應用時應採取的方法。首先，找到適合您問題領域的良好設計架構。然後與解決方案架構師合作，為您的特定情境客製化並開發該解決方案。

但我們可以在哪裡找到這些設計藍圖？又如何找到願意教導我們如何自行客製化並部署這些藍圖的架構師？在這個工作坊中，我們透過介紹三種技術來回答這些問題：

1. [Azure Developer CLI](https://aka.ms/azd) - 一個開源工具，加速開發者從本地開發（build）到雲端部署（ship）的流程。
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - 標準化的開源程式庫，包含用於部署 AI 解決方案架構的範例程式碼、基礎結構與組態檔案。
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - 一個以 Azure 知識為基礎的編碼代理，能以自然語言引導我們瀏覽程式碼庫並進行變更。

有了這些工具，我們現在可以 _發現_ 適合的範本、將它 _部署_ 以驗證其可行性，並 _客製化_ 它以符合我們的特定情境。讓我們深入了解這些運作方式。

---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)（或 `azd`）是一個開源命令列工具，透過一組開發者友好的指令，能加速您從程式碼到雲端的旅程，並在您的 IDE（開發）與 CI/CD（DevOps）環境中一致地運作。

With `azd`, your deployment journey can be as simple as:

- `azd init` - 從現有的 AZD 範本初始化一個新的 AI 專案。
- `azd up` - 佈建基礎結構並一步部署您的應用程式。
- `azd monitor` - 取得已部署應用程式的即時監控與診斷。
- `azd pipeline config` - 設定 CI/CD 管線以自動化部署到 Azure。

**🎯 | 練習**: <br/> 現在在您的 GitHub Codespaces 環境中探索 `azd` 命令列工具。先輸入下列指令來看看該工具能做什麼：

```bash title="" linenums="0"
azd help
```

![流程](../../../../../translated_images/zh-TW/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD 範本

為了讓 `azd` 達成上述目標，它需要知道要佈建的基礎結構、要強制執行的組態設定，以及要部署的應用程式。這就是 [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) 派上用場的地方。

AZD 範本是將範例程式碼與部署解決方案架構所需的基礎結構與組態檔案結合在一起的開源儲存庫。透過採用 _Infrastructure-as-Code_（IaC）方法，它們允許範本資源定義與組態設定像應用程式原始碼一樣受版本控制——在專案的使用者之間建立可重複且一致的工作流程。

在為 _您的_ 情境建立或重用 AZD 範本時，請考慮以下問題：

1. 您要建立什麼？ → 是否有提供該情境入門程式碼的範本？
1. 您的解決方案如何架構化？ → 是否有包含所需資源的範本？
1. 您的解決方案如何部署？ → 想想 `azd deploy` 與前/後處理勾點！
1. 您如何進一步優化？ → 想想內建監控與自動化管線！

**🎯 | 練習**: <br/> 
造訪 [Awesome AZD](https://azure.github.io/awesome-azd/) 展示頁，並使用篩選器探索目前可用的 250+ 範本。看看是否能找到符合 _您_ 情境需求的範本。

![程式碼](../../../../../translated_images/zh-TW/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI 應用程式範本

對於具 AI 能力的應用程式，Microsoft 提供以 **Microsoft Foundry** 與 **Foundry Agents** 為特色的專用範本。這些範本能加速您建置智慧且可進入生產的應用程式之路。

### Microsoft Foundry 與 Foundry Agents 範本

在下方選擇一個範本進行部署。每個範本都可以在 [Awesome AZD](https://azure.github.io/awesome-azd/) 找到，並能以單一指令初始化。

| 範本 | 說明 | 部署指令 |
|----------|-------------|----------------|
| **[RAG 的 AI 聊天](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | 使用 Microsoft Foundry 的擷取增強生成（Retrieval Augmented Generation）聊天應用程式 | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent 服務入門](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | 使用 Foundry Agents 建置 AI 代理以進行自主任務執行 | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[多代理編排](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | 協調多個 Foundry Agents 以處理複雜工作流程 | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI 文件智能](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | 使用 Microsoft Foundry 模型擷取與分析文件 | `azd init -t azure-samples/ai-document-processing` |
| **[會話式 AI 機器人](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | 整合 Microsoft Foundry 建置智慧聊天機器人 | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI 影像生成](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | 透過 Microsoft Foundry 使用 DALL-E 生成影像 | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel 代理](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | 結合 Semantic Kernel 與 Foundry Agents 的 AI 代理 | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen 多代理](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | 使用 AutoGen 框架的多代理系統 | `azd init -t azure-samples/autogen-multi-agent` |

### 快速開始

1. **瀏覽範本**：訪問 [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) 並篩選 `AI`、`Agents` 或 `Microsoft Foundry`
2. **選擇範本**：選擇一個符合您用例的範本
3. **初始化**：對所選範本執行 `azd init` 指令
4. **部署**：執行 `azd up` 以佈建並部署

**🎯 | 練習**: <br/>
根據您的情境，從上方範本中選擇一個：

- **要建立聊天機器人嗎？** → 從 **RAG 的 AI 聊天** 或 **會話式 AI 機器人** 開始
- **需要自主代理嗎？** → 試試 **Foundry Agent 服務入門** 或 **多代理編排**
- **要處理文件嗎？** → 使用 **AI 文件智能**
- **想要 AI 程式協助嗎？** → 探索 **Semantic Kernel 代理** 或 **AutoGen 多代理**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "探索更多範本"
    The [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) contains 250+ templates. Use the filters to find templates matching your specific requirements for language, framework, and Azure services.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：

本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為具權威性的來源。對於重要資訊，建議使用專業人工翻譯。對於因使用本翻譯而產生的任何誤解或錯誤詮釋，我們不承擔任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
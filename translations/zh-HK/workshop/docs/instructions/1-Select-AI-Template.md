# 1. 選擇範本

!!! tip "於本模組結束時，您將能夠"

    - [ ] 描述什麼是 AZD 範本
    - [ ] 探索並使用 AI 的 AZD 範本
    - [ ] 開始使用 AI Agents 範本
    - [ ] **實驗 1 ：** 使用 GitHub Codespaces 執行 AZD 快速入門

---

## 1. 建築師類比

從零開始打造現代企業級 AI 應用程式相當具挑戰性。這有點像自己一磚一瓦地建造新家。是的，確實可以做到！但這並不是達到理想結果的最高效方法！

相反地，我們通常會從現有的 _設計藍圖_ 開始，並與建築師合作，依個人需求來客製化設計。這正是建構智能應用程式時應採取的方法。首先，尋找符合您問題領域的良好設計架構。接著與解決方案架構師合作，為您的特定情境客製化及開發解決方案。

但我們在哪裡可以找到這些設計藍圖呢？又要如何找到願意教我們如何自己客製化與部署這些藍圖的架構師呢？在這個工作坊中，我們將藉由介紹三項技術來回答這些問題：

1. [Azure Developer CLI](https://aka.ms/azd) — 一個開源工具，加速開發者從本地開發（建置）到雲端部署的流程。
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) — 標準化開源資源庫，包含範例程式碼、基礎建設和配置檔，以部署 AI 解決方案架構。
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) — 以 Azure 知識為基礎的程式碼代理，能夠以自然語言引導我們瀏覽程式碼庫並作出修改。

手持這些工具後，我們現在可以 _發現_ 合適的範本，_部署_ 以驗證其運作，並 _客製化_ 以符合特定場景需求。讓我們深入了解它們的用法。

---

## 2. Azure Developer CLI

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)（簡稱 `azd`）是一個開源的命令列工具，具備開發者友善的命令集合，可於您的 IDE（開發）和 CI/CD（DevOps）環境中一致運作，加速您從程式碼到雲端的開發旅程。

使用 `azd`，您的部署旅程可以變得非常簡單：

- `azd init` — 從現有 AZD 範本初始化新的 AI 專案。
- `azd up` — 一步建置基礎建設並部署您的應用程式。
- `azd monitor` — 獲取即時監控與診斷資訊。
- `azd pipeline config` — 設定 CI/CD 管線，自動化部署至 Azure。

**🎯 | 練習**：<br/> 立即在您的 GitHub Codespaces 環境中探索 `azd` 命令列工具。從輸入這個指令開始，看看這個工具可以做什麼：

```bash title="" linenums="0"
azd help
```

![流程](../../../../../translated_images/zh-HK/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD 範本

為讓 `azd` 能完成以上功能，需要知道要佈建的基礎建設、要強制執行的配置設定，以及要部署的應用程式。這些正是 [AZD 範本](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) 的用途。

AZD 範本是開源的資源庫，結合了範例程式碼以及部署解決方案架構所需的基礎建設與配置檔。
透過採用 _基礎建設即程式碼_（IaC）方法，允許範本的資源定義與配置設定像應用程式原始碼一樣進行版本控管，為所有專案使用者創造可重複且一致的工作流程。

當為 _您的_ 情境建立或重用 AZD 範本時，請考慮以下問題：

1. 您要構建什麼？→ 是否有提供該場景啟動程式碼的範本？
1. 您的解決方案架構如何？→ 是否有包含必要資源的範本？
1. 您的解決方案如何部署？→ 想想帶有前/後處理掛鉤的 `azd deploy`！
1. 您怎樣進一步優化？→ 想想內建監控和自動化管線！

**🎯 | 練習**：<br/> 
造訪 [Awesome AZD](https://azure.github.io/awesome-azd/) 畫廊，並使用篩選器探索目前提供的 250+ 範本。看看您是否能找到符合 _您_ 場景需求的範本。

![程式碼](../../../../../translated_images/zh-HK/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI 應用程式範本

針對 AI 驅動的應用程式，微軟提供了專門的範本，包含 **Microsoft Foundry** 與 **Foundry Agents**。這些範本加快了您打造智能、可投入生產應用程式的過程。

### Microsoft Foundry & Foundry Agents 範本

請從下方選擇範本進行部署。每個範本皆可在 [Awesome AZD](https://azure.github.io/awesome-azd/) 取得，並能以單一指令初始化。

| 範本 | 描述 | 部署指令 |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | 使用 Microsoft Foundry 的檢索增強產生聊天應用程式 | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | 使用 Foundry Agents 建立自主任務執行的 AI 代理 | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | 協調多個 Foundry Agents 執行複雜工作流程 | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | 使用 Microsoft Foundry 模型擷取及分析文件 | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | 建立整合 Microsoft Foundry 的智能聊天機器人 | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | 使用 Microsoft Foundry 透過 DALL-E 生成影像 | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | 使用 Semantic Kernel 及 Foundry Agents 的 AI 代理 | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | 使用 AutoGen 框架的多代理系統 | `azd init -t azure-samples/autogen-multi-agent` |

### 快速開始

1. **瀏覽範本**：前往 [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/)，並以 `AI`、`Agents` 或 `Microsoft Foundry` 篩選
2. **選擇範本**：挑選符合您使用案例的範本
3. **初始化**：執行所選範本的 `azd init` 指令
4. **部署**：執行 `azd up` 進行佈建及部署

**🎯 | 練習**：<br/>
根據您的情境從上述範本中選擇一個：

- **要建立聊天機器人？** → 從 **AI Chat with RAG** 或 **Conversational AI Bot** 開始
- **需要自主代理？** → 試試 **Foundry Agent Service Starter** 或 **Multi-Agent Orchestration**
- **要處理文件？** → 使用 **AI Document Intelligence**
- **想要 AI 程式碼協助？** → 探索 **Semantic Kernel Agent** 或 **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "探索更多範本"
    [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) 包含超過 250 個範本。利用篩選器尋找符合您語言、框架及 Azure 服務特定需求的範本。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用此翻譯而引起的任何誤解或曲解負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
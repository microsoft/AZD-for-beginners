<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "06d6207eff634aefcaa41739490a5324",
  "translation_date": "2025-09-24T09:09:19+00:00",
  "source_file": "workshop/docs/instructions/1-Select-AI-Template.md",
  "language_code": "tw"
}
-->
# 1. 選擇範本

!!! tip "完成本模組後，您將能夠："

    - [ ] 描述什麼是 AZD 範本
    - [ ] 探索並使用 AZD 的 AI 範本
    - [ ] 開始使用 AI Agents 範本
    - [ ] **實驗室 1：** 使用 GitHub Codespaces 快速入門 AZD

---

## 1. 建造者的比喻

從零開始建造一個現代化、企業級的 AI 應用程式可能會讓人望而卻步。這有點像自己一磚一瓦地建造新家。是的，這是可以做到的！但這並不是達成理想結果的最有效方式！

相反，我們通常會從現有的 _設計藍圖_ 開始，並與建築師合作，根據個人需求進行定制。這正是建造智能應用程式時應採取的方法。首先，找到適合您問題領域的良好設計架構。然後與解決方案架構師合作，根據您的特定場景進行定制和開發。

但我們在哪裡可以找到這些設計藍圖？又如何找到願意教我們如何定制和部署這些藍圖的架構師？在這次工作坊中，我們將通過介紹三項技術來回答這些問題：

1. [Azure Developer CLI](https://aka.ms/azd) - 一個開源工具，能加速開發者從本地開發（建構）到雲端部署（交付）的過程。
1. [Azure AI Foundry Templates](https://ai.azure.com/templates) - 標準化的開源存儲庫，包含用於部署 AI 解決方案架構的範例代碼、基礎架構和配置文件。
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - 一個基於 Azure 知識的編碼代理，能使用自然語言指導我們瀏覽代碼庫並進行修改。

有了這些工具，我們現在可以 _探索_ 合適的範本，_部署_ 以驗證其可行性，並 _定制_ 以適應我們的特定場景。讓我們深入了解這些工具的運作方式。

---

## 2. Azure Developer CLI

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)（或 `azd`）是一個開源命令行工具，能通過一組開發者友好的命令加速您的代碼到雲端的旅程，並在您的 IDE（開發）和 CI/CD（開發運維）環境中保持一致性。

使用 `azd`，您的部署過程可以簡化為以下步驟：

- `azd init` - 從現有的 AZD 範本初始化一個新的 AI 專案。
- `azd up` - 一步完成基礎架構的配置和應用程式的部署。
- `azd monitor` - 為已部署的應用程式提供即時監控和診斷。
- `azd pipeline config` - 設置 CI/CD 管道以自動部署到 Azure。

**🎯 | 練習**：<br/> 在您的 GitHub Codespaces 環境中探索 `azd` 命令行工具。首先輸入以下命令，查看該工具的功能：

```bash title="" linenums="0"
azd help
```

![流程](../../../../../translated_images/tw/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD 範本

為了讓 `azd` 實現上述功能，它需要知道要配置的基礎架構、要強制執行的配置設定以及要部署的應用程式。這就是 [AZD 範本](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) 的作用。

AZD 範本是開源存儲庫，結合了範例代碼與部署解決方案架構所需的基礎架構和配置文件。
通過採用 _基礎架構即代碼_（IaC）的方法，它們允許範本資源定義和配置設定像應用程式源代碼一樣進行版本控制——在該專案的使用者之間創建可重用且一致的工作流程。

在為 _您的_ 場景創建或重用 AZD 範本時，請考慮以下問題：

1. 您正在建造什麼？→ 是否有範本提供該場景的起始代碼？
1. 您的解決方案架構如何？→ 是否有範本包含所需的資源？
1. 您的解決方案如何部署？→ 想想 `azd deploy`，並帶有前/後處理掛鉤！
1. 您如何進一步優化？→ 想想內建的監控和自動化管道！

**🎯 | 練習**：<br/> 
造訪 [Awesome AZD](https://azure.github.io/awesome-azd/) 畫廊，使用篩選器探索目前可用的 250+ 範本。看看是否能找到符合 _您的_ 場景需求的範本。

![代碼](../../../../../translated_images/tw/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI 應用程式範本

---


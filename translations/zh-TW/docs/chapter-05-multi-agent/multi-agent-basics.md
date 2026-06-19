# 多代理基礎 - 部署您的第一個協調 AI 系統

**章節導覽:**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 目前章節**: 第 5 章 - 多代理 AI 解決方案
- **⬅️ 上一章**: [Chapter 4: Infrastructure](../chapter-04-infrastructure/README.md)
- **➡️ 下一章**: [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

> 已於 2026 年 6 月針對 `azd 1.25.6` 進行驗證。

## 介紹

在前面的章節中，您已部署過單一應用程式——在第 2 章您也部署過單一 AI 代理。本課程將邁出下一步：部署一個<strong>多代理系統</strong>，讓多個專門化的代理共同合作，解決單一代理難以良好處理的問題。

對初學者的好消息是：**您不需要新的命令。** 多代理解決方案仍然是 azd 專案。您會照常執行 `azd init`、`azd up`、測試，然後 `azd down`——工作流程與您已熟悉的完全相同。改變的只是應用程式內部的「形狀」。

## 學習目標

完成本課程後，您將能：
- 了解「多代理」的意義以及何時值得承擔額外的複雜性
- 識別多代理系統中的常見角色（協調者 + 專家代理）
- 使用 `azd up` 部署一個真實可運作的多代理範本
- 了解支援多代理應用程式的 Azure 資源
- 知道如何驗證、客製化並安全地拆除解決方案

## 學習成果

完成本課程後，您將能夠：
- 解釋單一代理與多代理系統之間的差異
- 在單一代理搭配工具與真正的多代理設計之間做出選擇
- 使用 azd 完整部署並測試一個多代理範本
- 確認每個代理的執行位置以及它們如何通訊
- 清理所有資源以避免持續費用

---

## 什麼是多代理系統？

單一 AI 代理是一個模型搭配一組指令與（可選的）一些工具。這對聚焦任務很有幫助。但當任務擴大——研究、寫作、編輯、事實查核——將所有東西塞進單一 prompt 會讓代理變慢、可靠性下降，且更難除錯。

一個<strong>多代理系統</strong>會把工作拆分成各個專職、各自做好一件事，並由一個協調者來協調：

```mermaid
graph TD
    User([使用者請求]) --> Orchestrator[協調者代理人<br/>規劃並分配工作]
    Orchestrator --> Researcher[研究者代理人<br/>蒐集事實]
    Orchestrator --> Writer[撰稿者代理人<br/>草擬內容]
    Orchestrator --> Editor[編輯者代理人<br/>審閱並精修]
    Researcher --> Orchestrator
    Writer --> Orchestrator
    Editor --> Orchestrator
    Orchestrator --> Result([最終答案])
```

### 您會常見的兩種角色

| 角色 | 任務 | 範例 |
|------|------|------|
| <strong>協調者</strong> | 決定<em>接下來發生什麼</em>並在代理之間路由工作 |「先研究、再寫作、再編輯」 |
| <strong>專家代理</strong> | 執行一個聚焦的工作並回傳結果 | 只負責蒐集事實的「研究者」 |

### 您真的需要多個代理嗎？

從簡單開始。只有在以下情況之一成立時，才考慮使用多代理：

- ✅ 任務有<strong>明顯不同階段</strong>而且各階段需要不同指示（研究 vs. 撰寫 vs. 審閱）
- ✅ 您想讓專家可以<strong>並行執行</strong>以節省時間
- ✅ 不同步驟需要<strong>不同的工具或資料來源</strong>
- ✅ 您需要每個步驟<strong>可獨立測試與除錯</strong>

如果您的任務只是單一問答或簡單的工具呼叫，使用<strong>單一代理搭配工具</strong>（第 2 章）會更簡單、更便宜且更容易操作。

> **給初學者的提示：**「更多代理」不等於「更好」。每個代理都會增加延遲、成本，以及需要監控的項目。只有在問題明確可拆分成多個部分時，才增加代理。

---

## 在 Azure 上構建多代理的兩種方式

| 方法 | 是什麼 | 最適合 |
|------|--------|--------|
| **單一代理 + 工具** | 一個 Foundry 代理呼叫函式/工具 | 簡單工作流程、快速入門 |
| <strong>多個協調代理</strong> | 多個代理由協調者協同運作 | 明確分階段、需要並行或專業化的情境 |

本課程聚焦第二種方法，使用一個<strong>現成範本</strong>，讓您在自行建立之前能看到一個真實的多代理系統在運作。

---

## 實作：部署一個可運作的多代理應用

我們將部署 **Contoso Creative Writer**，一個官方 Azure 範例，使用多個代理（研究者、作者、編輯者）協同生成文章。這是一個很好的第一個多代理應用，因為角色容易理解。

### Step 1: 初始化範本

```bash
# 建立工作資料夾
mkdir creative-writer && cd creative-writer

# 從官方多智能體範本初始化
azd init --template contoso-creative-writer
```

> 隨時在 [Awesome AZD AI gallery](https://azure.github.io/awesome-azd/?tags=ai) 瀏覽更多多代理範本。其他對初學者友善的選項包括 `get-started-with-ai-agents` 和 `azure-ai-travel-agents`。

### Step 2: 驗證身分

```bash
# azd 工作流程所需
azd auth login
```

### Step 3: 建立環境

```bash
azd env new dev
```

### Step 4: 預覽，然後部署

```bash
# 在花任何費用之前先查看將會建立的內容（建議）
azd provision --preview

# 一步完成佈建基礎設施並部署所有代理程式
azd up
```

`azd up` 會提示選擇訂閱與區域，然後佈建 Azure 資源並部署應用。AI 部署通常會比單純的 Web 應用花更久時間——如果您部署較大的模型，您可以延長部署逾時：

```bash
azd deploy --timeout 1800
```

> **關於費用與容量的提醒：** 多代理應用會部署會消耗配額並產生費用的 AI 模型。如果 `azd up` 因模型配額失敗，請參閱 [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) 以取得區域與配額的修正方式，並參閱第 6 章 [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)。

---

## 了解您所部署的內容

像這樣的典型多代理應用會佈建一組 Azure 資源，這些資源直接對應到上圖中的職責：

| 資源 | 為何存在 |
|------|---------|
| **Microsoft Foundry / Models** | 託管每個代理使用的語言模型 |
| **Azure AI Search** | 提供研究者代理可搜尋的具體資料 |
| **Container Apps** (或 App Service) | 託管協調者與代理程式碼 |
| **Cosmos DB** (在某些範例中) | 儲存代理之間共享的狀態/記憶 |
| **Application Insights** | 跟蹤跨代理的請求，協助除錯流程 |

### 代理之間如何通訊

在大多數 azd 的多代理範例中，<strong>協調者會在您的應用程式程式碼中執行</strong>（例如使用像 Semantic Kernel 或 Microsoft Agent Framework 這類框架）。協調者會依序呼叫每個專家代理，傳遞結果，並組裝最終答案。代理共享上下文的方式包括：

- **函式/工具呼叫** — 協調者調用專家並取得回傳結果
- <strong>共享記憶</strong> — 一個資料庫（通常是 Cosmos DB）保存雙方可讀取的狀態
- **訊息/事件** — 為了更鬆散的耦合，代理可透過佇列或 Service Bus 進行通訊

> **為何這對除錯很重要：** 因為每個步驟是分離的，Application Insights 可以顯示是哪一個代理變慢或失敗。這正是將工作拆分到多個代理的一個主要理由。

---

## 驗證部署

在繼續之前，先確認系統真的可以運作：

```bash
# 顯示已部署的端點
azd show

# 開啟應用程式的監控儀表板
azd monitor

# 如果有異常，追蹤日誌
azd monitor --logs
```

然後從 `azd show` 開啟應用 URL，並嘗試一個能觸發所有代理的請求（對 Creative Writer，請求它就某個主題撰寫一篇短文）。在 Application Insights 的 **transaction search** 中，您應該會看到請求分散到研究者、作者和編輯者步驟。

**成功準則:**
- ✅ `azd show` 列出一個可到達的端點
- ✅ 一個請求產生的結果明顯經過多個階段
- ✅ Application Insights 顯示超過一個代理步驟的追蹤

---

## 客製化：新增或調整代理

因為每個代理只是指令加上工具，客製化相對可行：

1. <strong>在範本中找到代理定義</strong>（通常是一組 `prompts/`、`agents/`，或 `*.prompty` 檔案）。
2. <strong>調整代理的指示</strong> — 例如，告訴編輯代理要強制某種語氣或字數限制。
3. <strong>只重新部署程式碼</strong>（基礎結構不變）：

   ```bash
   azd deploy
   ```

若要更進一步並從您自己的清單建立代理，請使用代理擴充以及其完整生命週期：

```bash
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
azd ai agent invoke      # 測試，包含回應時序
```

請參閱 [Chapter 2: Agents](../chapter-02-ai-development/agents.md) 與 [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) 以取得完整的代理生命週期（`invoke`、`eval generate`、`optimize`、`delete`）。

---

## 清理

多代理應用會執行多個可計費服務。完成後請全部拆除：

```bash
azd down --force --purge
```

`--purge` 參數也會移除軟刪除的 AI 資源（例如 Foundry/Azure AI Services 帳戶），以免它們阻礙未來的重新部署或持續產生費用。

---

## 關於生產環境的多代理系統的一點說明

本儲存庫中的 [Retail Multi-Agent Solution](../../examples/retail-scenario.md) 是一個<strong>架構藍圖</strong>，不是一個一鍵部署的範本——它記錄了生產零售系統<em>會如何</em>建置（並明確指出完整建置是一項龐大工作）。在您在這裡部署並運行一個範例後，可將其作為設計參考。關於生產面的考量（韌性、成本、監控、治理），請繼續參閱第 8 章：[Production AI Practices](../chapter-08-production/production-ai-practices.md)。

---

## 摘要

- 多代理系統將工作拆分給由協調者協調的專家代理。
- 只有當任務具有明顯分階段、可並行或每一步需要不同工具時才使用；否則優先考慮單一代理。
- azd 工作流程不變：`azd init` → `azd up` → 測試 → `azd down`。
- 像 `contoso-creative-writer` 這樣的真實範本讓您今天就能看到並客製化一個可運作的多代理應用。
- 跨代理的 Application Insights 追蹤是多代理設計在實務上的一大優勢。

---

## 🔗 導覽

| 方向 | 課程 |
|------|------|
| <strong>上一章</strong> | [Chapter 4: Infrastructure](../chapter-04-infrastructure/README.md) |
| <strong>下一章</strong> | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |

## 📖 相關資源

- [AI Agents Guide](../chapter-02-ai-development/agents.md)
- [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
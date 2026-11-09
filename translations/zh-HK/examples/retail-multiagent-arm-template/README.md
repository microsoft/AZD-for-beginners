# 零售多代理基建腳手架

**進階架構範例 — 並非一個運作中的多代理應用程式。**

[課程首頁](../../README.md) ·
[第五章](../../docs/chapter-05-multi-agent/README.md) ·
[架構藍圖](../retail-scenario.md)

## 部署內容

此目錄包含 ARM 範本、參數與 Bash 部署腳本。
不包含 **`azure.yaml` 或零售應用程式原始碼**。

| 資源 | 部署後實際狀態 |
|---|---|
| 主要 Azure OpenAI 帳戶 | `gpt-4.1-chat` 部署使用 `gpt-4.1` 版本 `2025-04-14`，`GlobalStandard` |
| 次要 OpenAI 帳戶 (可選) | `gpt-4.1-mini-inventory`，模型 `gpt-4.1-mini` 版本 `2025-04-14`，`GlobalStandard` |
| 嵌入帳戶 (可選) | `text-embedding-ada-002` 版本 `2`，`Standard`；無索引管道 |
| 評分者 OpenAI 帳戶 | `gpt-4.1-grader`，模型 `gpt-4.1` 版本 `2025-04-14`，`GlobalStandard`；無評估者 |
| 人工智能搜尋 | 空服務；無索引或文件 |
| 儲存 | 空 `documents` 及 `uploads` Blob 容器 |
| Cosmos DB | 無伺服器帳戶、`chathistory` 資料庫、`conversations` 容器以 `/userId` 分區，30 天項目 TTL |
| Container Apps | 路由器及前端均運行 `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest`，埠號 80 |
| Key Vault (optional) | 空的啟用 RBAC 的保管庫；<strong>無機密或角色指派</strong> |
| Application Insights / Log Analytics (optional) | 資源及環境日誌收集；無自訂應用程式儀器、警示或儀表板 |
| Document Intelligence | S0 帳戶；無文件處理工作流程 |

傳統 Bing 搜尋 v7 已於 2025 年 8 月 11 日退役，且 <strong>未啟用</strong>。
未實施替代的網絡依據整合。

**不包括：** 客戶/庫存代理、路由器 `/chat` API、前端聊天介面、
搜尋架構或擷取腳本、Azure Container Registry、私有端點、
託管身份、RBAC 指派、自動故障轉移、Front Door、紅隊
掃描器、評估 CLI、身份驗證，或 CI/CD。

ARM 成功訊息僅確認資源佈建成功。它不保證
應用程式功能、安全性、可用性，或生產準備狀態。

## 先決條件與費用

- Bash（Windows 上的 Git Bash / WSL）以及
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)。
- 擁有可建立所有列出資源權限的訂閱。
- 檢查 **所選地區中每個模型/版本/SKU** 的可用性，
  以及您訂閱的配額。預設值為範例，非保證值。
  請參閱 [模型可用性](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)。
- 選擇一個專用資源群組，測試後可刪除。

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

預設位置：主区域 `eastus2`、次区域 `westus2`、嵌入 `francecentral`；
除非提供 `graderLocation`，否則分級器以主區域為預設。
`--no-multi-region` 可跳過次區域與嵌入帳戶；不會跳過
分級器帳戶。

搜尋在佈建時即開始收費，即使空置。容器最小副本數、
儲存冗餘、Cosmos DB 請求／儲存、模型代幣、文件智慧
呼叫和日誌接收／儲存都可能產生費用。**無固定或驗證的
每月總額**。請在
[Azure 定價計算器](https://azure.microsoft.com/pricing/calculator/) 精確估算 SKU，
並在部署前設定預算。

### 部署模式

這些設定為資源大小，**非生產或 SLA 認證**：

| 模式 | 聊天 / 迷你 / 嵌入 / 分級器 容量單位 | 路由器副本數 | 前端副本數 | 搜尋層級 | 儲存 |
|---|---|---|---|---|---|
| minimal | 10 / 10 / 20 / 5 | 0–3 | 1–2 | basic, 1 副本 | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 副本 | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 副本 | Standard_GRS |

模型容量單位是模型/SKU 專用；不要將它們加總作為通用的 TPM
保證。Premium 不支援區域冗餘 Container Apps：這需要
額外的網絡設計。Basic 搜索支援向量搜索，但受
服務限制；它本身並不與向量不相容。

## 🚀 快速部署

請先閱讀 `azuredeploy.json` 和 `azuredeploy.parameters.json`。以下命令
**會建立可計費的 Azure 資源**；它們不是離線檢查。

從存儲庫根目錄：

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

腳本使用相對於自身目錄的路徑，檢查登入/工具/參數，
若資源組不存在則建立，驗證部署，佈建，並
顯示非機密輸出。不需要或不會執行 `jq`、資料填充、
機密檢索或部署後應用程式設定。

腳本的預設命令列值會覆寫參數檔中相對應的值。修改參數檔以設定次要/第三區域；
如果需要任意參數覆寫，請使用直接 CLI 部署：


```bash
az group create --name retail-learning-rg --location eastus2
az deployment group create \
  --resource-group retail-learning-rg \
  --name retail-learning \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --parameters projectName=retail environmentName=dev \
    deploymentMode=minimal enableMultiRegion=false
```

配置可能需要 15 至 45 分鐘甚至更長時間，並可能因區域配額或
模型生命週期限制而失敗。請勿盲目重試：請先閱讀失敗的操作。

## 配置選項

| 參數 | 模板中的預設值 | 意義 |
|---|---|---|
| `projectName` | 必填 (`retail` 在參數文件) | 3–10 個小寫字母/數字 |
| `location` | 資源群組地區 | 主要區域 (`eastus2` 在參數文件) |
| `secondaryLocation` | `westus2` | Mini 模型帳戶地區 |
| `tertiaryLocation` | `francecentral` | Embeddings 帳戶地區 |
| `graderLocation` | 主要區域 | 獨立評分者帳戶地區 |
| `environmentName` | `dev` | `dev`、`staging` 或 `prod`；僅名稱，非強化切換 |
| `deploymentMode` | `standard` | SKU/容量選擇 |
| `enableMultiRegion` | `true` | 新增次要及 embeddings 帳戶 |
| `enableMonitoring` | `true` | 新增 Insights/workspace 及環境日誌收集 |
| `enableSecurity` | `true` | 僅建立空的啟用 RBAC 的密鑰保管庫 |

被誤導的 `openAiApiVersion` 參數已移除：資料平面 API 版本
不會控制 ARM 資源版本或模型版本。模型名稱/版本組合
位於 `variables.modelDeployments`；請與部署的 SKU 一併檢查。

## 驗證部署

使用腳本輸出或 `az deployment group list` 中的部署名稱。
針對上述直接部署：

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

預期：部署狀態為 `Succeeded`。若失敗，請檢查操作錯誤
詳細資訊。僅依資源清單輸出並非可靠的部署狀態檢查。

測試佔位符 **root**，而非不存在的代理端點：

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

預期：HTTP 200 hello-world 頁面，<strong>非聊天回應</strong>。HTTP 錯誤
不算成功驗證。

要測試實際的主要模型推論（計費項目）：

```bash
OPENAI_ENDPOINT=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.openAiEndpointPrimary.value -o tsv)
OPENAI_NAME=$(az cognitiveservices account list -g "$RG" \
  --query "[?kind=='OpenAI' && contains(name, '-openai-primary-')].name | [0]" -o tsv)
OPENAI_KEY=$(az cognitiveservices account keys list -g "$RG" -n "$OPENAI_NAME" \
  --query key1 -o tsv)
curl --fail-with-body \
  "${OPENAI_ENDPOINT%/}/openai/deployments/gpt-4.1-chat/chat/completions?api-version=2024-10-21" \
  -H "Content-Type: application/json" -H "api-key: $OPENAI_KEY" \
  -d '{"messages":[{"role":"user","content":"Say hello"}],"max_tokens":20}'
unset OPENAI_KEY
```

預期：包含 `choices` 及 `usage` 的 JSON。部署名稱為
`gpt-4.1-chat`，而非底層模型名稱 `gpt-4.1`。

## 🔧 部署後：後續步驟

這是 <strong>開發待辦事項</strong>，而非完成的練習：

1. 實作已認證的客戶/庫存代理及路由合約。
2. 實作前端並驗證其配置。
3. 建立並填充與您的
   嵌入模型維度/輪廓相符的搜索索引，並處理文件失敗及更新。
4. 建立註冊中心並配置映像拉取身份/權限。
5. 建構並推送實際映像。在測試前，變更容器應用入口端口及探針以
   配合這些映像；此處的 80 端口屬於佔位符。
6. 配置密鑰或受管身份以及範圍限定的資料平面角色。切勿
   參考虛構的密鑰名稱：此範本未產生應用密鑰。
7. 設置應用監控、配置警報、測試故障/恢復，並以代表性實際資料與人工審核
   評估結果。

請參閱 [架構藍圖](../retail-scenario.md) 了解設計範圍。

## 疑難排解與安全範圍

- **模型不可用:** 請確認模型／版本／SKU、區域及訂閱配額；
  此腳本不會預先檢查模型目錄。
- **監控停用:** 環境日誌目標是 `none`，而非
  無效的空 Log Analytics 設定。
- **僅佔位符:** `/chat`、代理評估及檔案匯入皆不存在。
- **網路／身份認證:** 啟用了公開端點及本地驗證。
  僅啟用 Key Vault RBAC 不會建立角色指派或身份。
- **生產環境:** 請適當新增驗證、限定範圍的身份、機密管理、
  私有網路、可用性設計及運營測試。
  單純多區域模型帳戶並不能提供故障轉移功能。

## 清理

這裡沒有 AZD 專案；`azd down` 不是清理指令。
確認該群組只包含您的學習資源後：

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

刪除完成後預期看到：`false`。Key Vault 和認知服務
軟刪除的資源可能保留名稱；清除需要適當權限。
檢查成本管理以因應延遲的使用費用。

[回報問題](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[容器應用程式](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
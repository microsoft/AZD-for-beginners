# 7. 總結與後續步驟

!!! tip "主要重點如下"

    - [ ] AZD 範本將 AI 應用程式開發從數天加速到數小時
    - [ ] 探索 → 部署 → 客製化 方法論提供有結構的學習路徑
    - [ ] 結合 MCP 伺服器的 GitHub Copilot 能夠以自然語言探索複雜程式碼庫
    - [ ] Microsoft Foundry 提供內建的可觀察性、評估與安全測試

---

## 1. 你完成了什麼

恭喜！在這個工作坊中，你已成功：

| Module | Accomplishment |
|:---|:---|
| **模組 1** | 了解 Azure Developer CLI 並選擇了一個 AI 範本 |
| **模組 2** | 部署並驗證了一個完整的 AI 代理解決方案 |
| **模組 3** | 拆解範本以理解其架構 |
| **模組 4** | 探索 `azure.yaml` 設定與生命週期掛鉤 |
| **模組 5** | 為你自己的情境客製化範本 |
| **模組 6** | 安全地拆除基礎架構並管理資源 |

---

## 2. 掌握的關鍵概念

### Azure Developer CLI (azd)
- `azd init` - 從範本初始化專案
- `azd up` - 以單一指令佈建與部署
- `azd env` - 管理環境變數
- `azd down` - 安全地清理資源

### AZD 範本結構
- `azure.yaml` - 設定與部署掛鉤
- `infra/` - Bicep 的基礎架構即程式碼
- `src/` - 應用程式原始碼
- `scripts/` - 自動化與設定腳本

### Microsoft Foundry 功能
- 用於智慧助理的 AI 代理服務
- File Search 與 Azure AI Search 用於知識檢索
- 內建的追蹤、監控與評估
- 用於 AI 安全驗證的紅隊測試

---

## 3. 持續你的學習旅程

### 建議的下一步

| 路徑 | 資源 | 時間 |
|:---|:---|:---|
| **Complete Course** | [AZD 初學者課程](../../README.md) | 8-12 小時 |
| **Try Another Template** | [Microsoft Foundry 範本](https://ai.azure.com/templates) | 1-2 小時 |
| **Deep Dive** | [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | 持續進行中 |
| **Community** | [Azure Discord](https://aka.ms/foundry/discord) | 立即加入！ |

### 建議接下來嘗試的範本

1. **[開始使用 AI 聊天](https://github.com/Azure-Samples/get-started-with-ai-chat)** - 與你的資料進行基本聊天
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - 進階 RAG 模式
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - 企業零售情境

---

## 4. 工作坊挑戰

準備好測試你的技能了嗎？試試以下挑戰：

| Challenge | Description | Difficulty |
|:---|:---|:---|
| **1. 多代理人情境** | 為不同產業部署並客製化（例如：醫療、金融） | ⭐⭐ |
| **2. 自訂知識庫** | 新增自己的資料檔案並建立自訂搜尋索引 | ⭐⭐⭐ |
| **3. 生產環境部署** | 使用 `azd pipeline config` 設定 GitHub Actions 的 CI/CD | ⭐⭐⭐⭐ |

---

## 5. 分享你的回饋

你的回饋有助於我們改善這個工作坊！

- **GitHub Issues**: [發表回饋](https://github.com/microsoft/azd-for-beginners/issues) - 標註 `Workshop`
- **Discord**: 加入 [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - 在 `#get-help` 發文
- **Contributions**: 透過提交 pull requests 協助改善此工作坊！

---

## 感謝你！ 🎉

感謝你完成 AZD for AI Developers 工作坊。我們希望這次的經驗已經讓你具備在 Azure 上建置與部署 AI 應用程式的技能與信心。

**繼續建置、持續學習，歡迎加入 Azure AI 開發者社群！**

---

| | |
|:---|:---|
| **📚 課程首頁** | [AZD 初學者](../../README.md) |
| **📖 文件** | [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI 範本** | [Microsoft Foundry 範本](https://ai.azure.com/templates) |
| **💬 社群** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co-op Translator（https://github.com/Azure/co-op-translator）進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始語言版本應視為具權威性的來源。對於重要資訊，建議採用專業人工翻譯。因使用本翻譯而產生的任何誤解或錯誤詮釋，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
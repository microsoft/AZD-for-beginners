# 7. 總結與下一步

!!! tip "主要帶走的訊息是"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. 你完成了什麼

恭喜！在這個工作坊中，你成功地：

| 模組 | 成就 |
|:---|:---|
| **模組 1** | 探索了 Azure Developer CLI 並選擇了 AI 範本 |
| **模組 2** | 部署並驗證了一個完整的 AI 代理解決方案 |
| **模組 3** | 拆解範本以了解其架構 |
| **模組 4** | 探索 `azure.yaml` 配置與生命週期掛鉤 |
| **模組 5** | 為你的場景客製化範本 |
| **模組 6** | 安全地拆除基礎設施並管理資源 |

---

## 2. 掌握的關鍵概念

### Azure Developer CLI (azd)
- `azd init` - 從範本初始化專案
- `azd up` - 以一個指令佈署和配置
- `azd env` - 管理環境變數
- `azd down` - 安全地清理資源

### AZD 範本結構
- `azure.yaml` - 配置與部署掛鉤
- `infra/` - Bicep 基礎設施即程式碼
- `src/` - 應用程式原始碼
- `scripts/` - 自動化與設定腳本

### Microsoft Foundry 功能
- 智能助理的 AI 代理服務
- 文件搜尋與 Azure AI 搜尋進行知識檢索
- 內建追蹤、監控與評估
- AI 安全驗證的紅隊演練

---

## 3. 繼續你的學習之旅

### 推薦的下一步

| 路徑 | 資源 | 時間 |
|:---|:---|:---|
| <strong>完成課程</strong> | [AZD 入門課程](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | 自主學習 |
| <strong>嘗試其他範本</strong> | [Microsoft Foundry 範本](https://ai.azure.com/templates) | 1-2 小時 |
| <strong>深入鑽研</strong> | [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | 持續進行 |
| <strong>社群</strong> | [Azure Discord](https://aka.ms/foundry/discord) | 今天就加入！ |

### 建議接下來嘗試的範本

1. **[開始化 AI 聊天](https://github.com/Azure-Samples/get-started-with-ai-chat)** - 使用你的數據進行基礎聊天
2. **[Azure Search OpenAI 示範](https://github.com/Azure-Samples/azure-search-openai-demo)** - 進階 RAG 範例
3. **[Contoso 聊天](https://github.com/Azure-Samples/contoso-chat)** - 企業零售場景

---

## 4. 工作坊挑戰

準備好測試你的技能了嗎？試試這些挑戰：

| 挑戰 | 描述 | 難度 |
|:---|:---|:---|
| **1. 多代理場景** | 部署並為不同產業（例如醫療、金融）客製化 | ⭐⭐ |
| **2. 自訂知識庫** | 新增你自己的資料檔案並建立自訂搜尋索引 | ⭐⭐⭐ |
| **3. 產品部署** | 使用 `azd pipeline config` 設定 GitHub Actions 的持續整合/持續部署 | ⭐⭐⭐⭐ |

---

## 5. 分享你的反饋

你的反饋有助於我們改進這個工作坊！

- **GitHub Issues**: [發佈反饋](https://github.com/microsoft/azd-for-beginners/issues) - 標記 `Workshop`
- **Discord**：加入 [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - 發佈於 `#get-help`
- <strong>貢獻</strong>：透過提交 pull requests 幫助改進工作坊！

---

## 感謝您！ 🎉

感謝您完成 AZD for AI Developers 工作坊。我們希望此經驗能讓您具備在 Azure 上構建及部署 AI 應用的技能與信心。

**持續構建，持續學習，歡迎加入 Azure AI 開發者社群！**

---

| | |
|:---|:---|
| **📚 課程首頁** | [AZD For Beginners](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 文件** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI 範本** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 社群** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
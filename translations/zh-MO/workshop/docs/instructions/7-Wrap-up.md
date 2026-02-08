# 7. 總結與下一步

!!! tip "主要重點如下"

    - [ ] AZD 範本將 AI 應用程式開發從數天加速到數小時
    - [ ] Discovery → Deployment → Customization 方法論提供一個有結構的學習路徑
    - [ ] 結合 MCP 伺服器的 GitHub Copilot 可用自然語言探索複雜程式碼庫
    - [ ] Microsoft Foundry 提供內建的可觀察性、評估與安全測試

---

## 1. 你完成了什麼

恭喜！在本次工作坊中，你已成功完成：

| Module | Accomplishment |
|:---|:---|
| **模組 1** | 發現 Azure Developer CLI 並選擇了一個 AI 範本 |
| **模組 2** | 已部署並驗證完整的 AI 代理解決方案 |
| **模組 3** | 拆解範本以理解其架構 |
| **模組 4** | 探索 `azure.yaml` 設定與生命週期掛鉤 |
| **模組 5** | 已自訂範本以符合你的情境 |
| **模組 6** | 已安全地拆除基礎設施並管理資源 |

---

## 2. 掌握的主要概念

### Azure Developer CLI (azd)
- `azd init` - 從範本初始化專案
- `azd up` - 以一個指令佈建並部署
- `azd env` - 管理環境變數
- `azd down` - 安全清理資源

### AZD 範本結構
- `azure.yaml` - 設定與部署掛鉤
- `infra/` - Bicep 的基礎設施即程式碼
- `src/` - 應用程式原始碼
- `scripts/` - 自動化與設定腳本

### Microsoft Foundry 功能
- AI Agent Service：用於智能助理
- 檔案搜尋與 Azure AI Search 用於知識擷取
- 內建的追蹤、監控與評估
- 針對 AI 安全驗證的紅隊測試

---

## 3. 繼續你的學習之旅

### 建議的後續步驟

| Path | Resource | Time |
|:---|:---|:---|
| **完成課程** | [AZD 初學者課程](../../README.md) | 8-12 小時 |
| **嘗試其他範本** | [Microsoft Foundry 範本](https://ai.azure.com/templates) | 1-2 小時 |
| **深入研究** | [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | 持續進行 |
| **社群** | [Azure Discord 社群](https://aka.ms/foundry/discord) | 立即加入！ |

### 建議接下來嘗試的範本

1. **[Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - 與你的資料進行基本聊天
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - 進階的 RAG 模式
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - 企業零售情境

---

## 4. 工作坊挑戰

準備好測試你的技能了嗎？挑戰如下：

| Challenge | Description | Difficulty |
|:---|:---|:---|
| **1. 多代理情境** | 為不同產業（例如醫療、金融）部署並自訂 | ⭐⭐ |
| **2. 自訂知識庫** | 新增自己的資料檔案並建立自訂搜尋索引 | ⭐⭐⭐ |
| **3. 生產環境部署** | 使用 `azd pipeline config` 與 GitHub Actions 設定 CI/CD | ⭐⭐⭐⭐ |

---

## 5. 分享你的回饋

你的回饋有助於我們改進本工作坊！

- **GitHub Issues**： [發表回饋](https://github.com/microsoft/azd-for-beginners/issues) - 標註 `Workshop`
- **Discord**：加入 [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - 在 `#get-help` 發文
- **貢獻**：透過提交 Pull Request 協助改進工作坊！

---

## 謝謝！ 🎉

感謝你完成 AZD for AI Developers 工作坊。我們希望這次經驗已經讓你具備在 Azure 上建置與部署 AI 應用程式的技能與信心。

**持續建置、持續學習，歡迎加入 Azure AI 開發者社群！**

---

| | |
|:---|:---|
| **📚 課程首頁** | [AZD 初學者](../../README.md) |
| **📖 文件** | [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI 範本** | [Microsoft Foundry 範本](https://ai.azure.com/templates) |
| **💬 社群** | [Azure Discord 社群](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言版本的文件應被視為具權威性的參考。若為關鍵資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而引致的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 7. 總結與後續步驟

!!! tip "主要重點如下"

    - [ ] AZD 範本將 AI 應用程式開發時間從數天縮短到數小時
    - [ ] 發現 → 部署 → 客製化方法提供了有架構的學習路徑
    - [ ] GitHub Copilot 搭配 MCP 伺服器可用自然語言探索複雜程式碼庫
    - [ ] Microsoft Foundry 提供內建的可觀察性、評估和安全測試

---

## 1. 你所完成的內容

恭喜！在本次工作坊，你已成功：

| 模組 | 完成事項 |
|:---|:---|
| **模組 1** | 探索 Azure Developer CLI 並選擇 AI 範本 |
| **模組 2** | 部署並驗證完整的 AI 代理方案 |
| **模組 3** | 拆解範本以了解其架構 |
| **模組 4** | 探索 `azure.yaml` 配置及生命週期鉤子 |
| **模組 5** | 依照自身場景客製化範本 |
| **模組 6** | 安全地拆除基礎設施並管理資源 |

---

## 2. 掌握的關鍵概念

### Azure Developer CLI (azd)
- `azd init` - 從範本初始化專案
- `azd up` - 一鍵佈建與部署
- `azd env` - 管理環境變數
- `azd down` - 安全清理資源

### AZD 範本結構
- `azure.yaml` - 配置與部署鉤子
- `infra/` - Bicep 基礎設施即程式碼
- `src/` - 應用程式原始碼
- `scripts/` - 自動化及設定腳本

### Microsoft Foundry 功能
- AI 代理服務用於智能助理
- 檔案搜尋與 Azure AI 搜尋進行知識檢索
- 內建追蹤、監控及評估
- Red teaming 以驗證 AI 安全性

---

## 3. 持續你的學習旅程

### 推薦的後續步驟

| 路徑 | 資源 | 時間 |
|:---|:---|:---|
| **完成課程** | [AZD 初學者課程](../../README.md) | 8-12 小時 |
| **嘗試其他範本** | [Microsoft Foundry 範本](https://ai.azure.com/templates) | 1-2 小時 |
| **深入學習** | [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | 持續進行 |
| **社群** | [Azure Discord](https://aka.ms/foundry/discord) | 立即加入！ |

### 建議下次嘗試的範本

1. **[AI 聊天入門](https://github.com/Azure-Samples/get-started-with-ai-chat)** - 使用你的資料進行基本聊天
2. **[Azure Search OpenAI 示範](https://github.com/Azure-Samples/azure-search-openai-demo)** - 進階 RAG 模式
3. **[Contoso 聊天](https://github.com/Azure-Samples/contoso-chat)** - 企業零售場景

---

## 4. 工作坊挑戰

準備好測試你的技能了嗎？試試看這些挑戰：

| 挑戰 | 描述 | 難度 |
|:---|:---|:---|
| **1. 多代理場景** | 部署並客製化到不同產業（例如：醫療、金融） | ⭐⭐ |
| **2. 自訂知識庫** | 新增個人資料檔案並建立自訂搜尋索引 | ⭐⭐⭐ |
| **3. 生產環境部署** | 使用 `azd pipeline config` 建立 GitHub Actions CI/CD | ⭐⭐⭐⭐ |

---

## 5. 分享你的反饋

你的反饋幫助我們改進這個工作坊！

- **GitHub 問題**: [發表反饋](https://github.com/microsoft/azd-for-beginners/issues) - 標籤為 `Workshop`
- **Discord**: 加入 [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - 在 `#get-help` 頻道發文
- **貢獻**: 透過提交 pull request 改善工作坊內容！

---

## 謝謝您！🎉

感謝您完成 AZD for AI Developers 工作坊。希望這次體驗能讓您具備在 Azure 上建置與部署 AI 應用程式的技能與信心。

**持續構建，持續學習，歡迎加入 Azure AI 開發者社群！**

---

| | |
|:---|:---|
| **📚 課程首頁** | [AZD For Beginners](../../README.md) |
| **📖 文件說明** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI 範本** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 社群** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而引起的任何誤解或誤釋負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
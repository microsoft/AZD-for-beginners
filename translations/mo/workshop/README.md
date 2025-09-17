<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be2a85ad63abe28f2eb71ba3f3800272",
  "translation_date": "2025-09-17T19:01:06+00:00",
  "source_file": "workshop/README.md",
  "language_code": "mo"
}
-->
# AZD for AI Developers Workshop

**工作坊導航**
- **📚 課程首頁**: [AZD 初學者指南](../README.md)
- **📖 相關章節**: 涵蓋 [第一章](../README.md#-chapter-1-foundation--quick-start)、[第二章](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers) 和 [第五章](../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **🛠️ 實作實驗室**: [AI 工作坊實驗室](../docs/ai-foundry/ai-workshop-lab.md)
- **🚀 下一步**: [工作坊模組](../../../workshop)

歡迎參加專注於 AI 應用部署的 Azure Developer CLI (AZD) 實作工作坊。本工作坊旨在帶領您從 AZD 基礎知識到部署生產級 AI 解決方案。

## 工作坊概述

**時長:** 2-3 小時  
**等級:** 初學者至中級  
**先決條件:** 基本的 Azure、命令列工具和 AI 概念知識

### 您將學到的內容

- **AZD 基礎知識**: 了解基於基礎架構的程式碼 (Infrastructure as Code) 的 AZD
- 🤖 **AI 服務整合**: 部署 Azure OpenAI、AI 搜索及其他 AI 服務
- **容器部署**: 使用 Azure Container Apps 部署 AI 應用
- **安全性最佳實踐**: 實施受管理的身份和安全配置
- **監控與可觀察性**: 為 AI 工作負載設置 Application Insights
- **生產模式**: 企業級部署策略

## 工作坊結構

### 模組 1: AZD 基礎 (30 分鐘)
- 安裝和配置 AZD
- 了解 AZD 專案結構
- 您的第一次 AZD 部署
- **實驗室**: 部署一個簡單的網頁應用

### 模組 2: Azure OpenAI 整合 (45 分鐘)
- 設置 Azure OpenAI 資源
- 模型部署策略
- 配置 API 存取和身份驗證
- **實驗室**: 使用 GPT-4 部署聊天應用

### 模組 3: RAG 應用 (45 分鐘)
- Azure AI 搜索整合
- 使用 Azure Document Intelligence 處理文件
- 向量嵌入和語義搜索
- **實驗室**: 建立文件問答系統

### 模組 4: 生產部署 (30 分鐘)
- 容器應用配置
- 擴展和性能優化
- 監控和日誌記錄
- **實驗室**: 部署到生產環境並設置可觀察性

### 模組 5: 高級模式 (15 分鐘)
- 多環境部署
- CI/CD 整合
- 成本優化策略
- **總結**: 生產準備檢查清單

## 先決條件

### 必需工具

請在工作坊開始前安裝以下工具：

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Azure 帳戶設置

1. **Azure 訂閱**: [免費註冊](https://azure.microsoft.com/free/)  
2. **Azure OpenAI 存取**: [申請存取](https://aka.ms/oai/access)  
3. **所需權限**:
   - 訂閱或資源群組的 Contributor 角色
   - User Access Administrator (用於 RBAC 分配)

### 驗證先決條件

執行以下腳本以驗證您的設置：

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## 工作坊材料

### 實驗室練習

每個模組都包含實作實驗室，提供起始程式碼和逐步指導：

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - 您的第一次 AZD 部署
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - 使用 Azure OpenAI 的聊天應用
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - 使用 AI 搜索的 RAG 應用
- **[lab-4-production/](../../../workshop/lab-4-production)** - 生產部署模式
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - 高級部署場景

### 參考材料

- **[AI Foundry 整合指南](../docs/ai-foundry/azure-ai-foundry-integration.md)** - 全面的整合模式
- **[AI 模型部署指南](../docs/ai-foundry/ai-model-deployment.md)** - 模型部署最佳實踐
- **[生產 AI 實踐](../docs/ai-foundry/production-ai-practices.md)** - 企業部署模式
- **[AI 疑難排解指南](../docs/troubleshooting/ai-troubleshooting.md)** - 常見問題及解決方案

### 範例模板

常見 AI 場景的快速啟動模板：

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## 開始使用

### 選項 1: GitHub Codespaces (推薦)

最快速開始工作坊的方法：

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### 選項 2: 本地開發

1. **克隆工作坊倉庫:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **登入 Azure:**
```bash
az login
azd auth login
```

3. **從實驗室 1 開始:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### 選項 3: 講師引導工作坊

如果您參加的是講師引導的課程：

- 🎥 **工作坊錄影**: [隨時觀看](https://aka.ms/azd-ai-workshop)
- 💬 **Discord 社群**: [加入以獲得即時支援](https://aka.ms/foundry/discord)
- **工作坊回饋**: [分享您的體驗](https://aka.ms/azd-workshop-feedback)

## 工作坊時間表

### 自主學習 (3 小時)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### 講師引導課程 (2.5 小時)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## 成功標準

完成工作坊後，您將能夠：

✅ **使用 AZD 模板部署 AI 應用**  
✅ **配置 Azure OpenAI 服務並確保安全性**  
✅ **建立 RAG 應用**，整合 Azure AI 搜索  
✅ **實施生產模式**，適用於企業 AI 工作負載  
✅ **監控並排除 AI 應用部署問題**  
✅ **應用成本優化策略**，降低 AI 工作負載成本  

## 社群與支援

### 工作坊期間

- 🙋 **問題**: 使用工作坊聊天或舉手提問
- 🐛 **問題排解**: 查看 [疑難排解指南](../docs/troubleshooting/ai-troubleshooting.md)
- **提示**: 與其他參與者分享您的發現

### 工作坊後

- 💬 **Discord**: [Azure AI Foundry 社群](https://aka.ms/foundry/discord)
- **GitHub 問題**: [回報模板問題](https://github.com/YOUR_ORG/AZD-for-beginners/issues)
- 📧 **回饋**: [工作坊評估表](https://aka.ms/azd-workshop-feedback)

## 下一步

### 繼續學習

1. **高級場景**: 探索 [多區域部署](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)
2. **CI/CD 整合**: 設置 [GitHub Actions 工作流程](../docs/deployment/github-actions.md)
3. **自訂模板**: 創建您自己的 [AZD 模板](../docs/getting-started/custom-templates.md)

### 應用於您的專案

1. **評估**: 使用我們的 [準備檢查清單](./production-readiness-checklist.md)
2. **模板**: 從我們的 [AI 專用模板](../../../workshop/templates) 開始
3. **支援**: 加入 [Azure AI Foundry Discord](https://aka.ms/foundry/discord)

### 分享您的成功

- ⭐ **為倉庫加星**，如果本工作坊對您有幫助
- 🐦 **在社群媒體上分享**，使用 #AzureDeveloperCLI #AzureAI
- 📝 **撰寫部落格文章**，分享您的 AI 部署旅程

---

## 工作坊回饋

您的回饋能幫助我們改進工作坊體驗：

| 方面 | 評分 (1-5) | 評論 |
|------|-----------|------|
| 內容品質 | ⭐⭐⭐⭐⭐ | |
| 實作實驗室 | ⭐⭐⭐⭐⭐ | |
| 文件 | ⭐⭐⭐⭐⭐ | |
| 難度等級 | ⭐⭐⭐⭐⭐ | |
| 整體體驗 | ⭐⭐⭐⭐⭐ | |

**提交回饋**: [工作坊評估表](https://aka.ms/azd-workshop-feedback)

---

**上一頁:** [AI 疑難排解指南](../docs/troubleshooting/ai-troubleshooting.md) | **下一頁:** 開始 [實驗室 1: AZD 基礎](../../../workshop/lab-1-azd-basics)

**準備好開始使用 AZD 建立 AI 應用了嗎？**

[開始實驗室 1: AZD 基礎 →](./lab-1-azd-basics/README.md)

---

**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保翻譯的準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵信息，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
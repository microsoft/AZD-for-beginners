<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "32a717e79e5363b775f9bdac58002a80",
  "translation_date": "2025-09-12T16:44:30+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "tw"
}
-->
# AZD 基礎 - 認識 Azure Developer CLI

**上一章:** [安裝與設定](installation.md) | **下一章:** [配置](configuration.md)

## 簡介

本課程將介紹 Azure Developer CLI (azd)，這是一個強大的命令列工具，能加速您從本地開發到部署至 Azure 的過程。您將學習基本概念、核心功能，並了解 azd 如何簡化雲原生應用程式的部署。

## 學習目標

完成本課程後，您將能夠：
- 了解 Azure Developer CLI 是什麼及其主要用途
- 學習模板、環境和服務的核心概念
- 探索基於模板的開發和基礎架構即程式碼的關鍵功能
- 理解 azd 專案結構和工作流程
- 為您的開發環境安裝和配置 azd 做好準備

## 學習成果

完成本課程後，您將能夠：
- 解釋 azd 在現代雲端開發工作流程中的角色
- 識別 azd 專案結構的組成部分
- 描述模板、環境和服務如何協同工作
- 理解使用 azd 的基礎架構即程式碼的優勢
- 認識不同的 azd 命令及其用途

## 什麼是 Azure Developer CLI (azd)?

Azure Developer CLI (azd) 是一個命令列工具，旨在加速您從本地開發到部署至 Azure 的過程。它簡化了在 Azure 上構建、部署和管理雲原生應用程式的流程。

## 核心概念

### 模板
模板是 azd 的基礎，包含：
- **應用程式程式碼** - 您的原始碼和依賴項
- **基礎架構定義** - 使用 Bicep 或 Terraform 定義的 Azure 資源
- **配置檔案** - 設定和環境變數
- **部署腳本** - 自動化部署工作流程

### 環境
環境代表不同的部署目標：
- **開發** - 用於測試和開發
- **測試** - 預生產環境
- **生產** - 正式生產環境

每個環境都維護自己的：
- Azure 資源群組
- 配置設定
- 部署狀態

### 服務
服務是應用程式的構建模塊：
- **前端** - 網頁應用程式、單頁應用程式 (SPA)
- **後端** - API、微服務
- **資料庫** - 資料存儲解決方案
- **存儲** - 文件和 Blob 存儲

## 關鍵功能

### 1. 基於模板的開發
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. 基礎架構即程式碼
- **Bicep** - Azure 的領域專用語言
- **Terraform** - 多雲基礎架構工具
- **ARM Templates** - Azure 資源管理器模板

### 3. 整合工作流程
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. 環境管理
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 專案結構

典型的 azd 專案結構：
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 配置檔案

### azure.yaml
主要的專案配置檔案：
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
特定環境的配置：
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 常見工作流程

### 開始新專案
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### 開發週期
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## 理解 `azd down --force --purge`
`azd down --force --purge` 命令是一種強大的方式，可以完全拆除您的 azd 環境及所有相關資源。以下是每個標誌的功能解析：
```
--force
```
- 跳過確認提示。
- 適用於需要自動化或腳本化的情境，無需手動輸入。
- 即使 CLI 檢測到不一致，也能確保拆除過程不被中斷。

```
--purge
```
刪除 **所有相關的元數據**，包括：
環境狀態  
本地 `.azure` 資料夾  
緩存的部署資訊  
防止 azd "記住" 先前的部署，避免出現資源群組不匹配或過期的註冊表引用等問題。

### 為什麼要同時使用？
當您因殘留狀態或部分部署而在使用 `azd up` 時遇到問題時，這個組合能確保獲得 **乾淨的起點**。

特別是在 Azure 入口網站中手動刪除資源後，或切換模板、環境或資源群組命名約定時，這非常有用。

### 管理多個環境
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 導航命令

### 探索
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### 專案管理
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### 監控
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## 最佳實踐

### 1. 使用有意義的名稱
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. 善用模板
- 從現有模板開始
- 根據需求進行自訂
- 為您的組織創建可重用的模板

### 3. 環境隔離
- 為開發/測試/生產使用單獨的環境
- 切勿直接從本地機器部署至生產環境
- 使用 CI/CD 管道進行生產部署

### 4. 配置管理
- 使用環境變數存儲敏感資料
- 將配置保存在版本控制中
- 記錄環境特定的設定

## 學習進度

### 初學者 (第 1-2 週)
1. 安裝 azd 並進行身份驗證
2. 部署簡單模板
3. 理解專案結構
4. 學習基本命令 (up, down, deploy)

### 中級 (第 3-4 週)
1. 自訂模板
2. 管理多個環境
3. 理解基礎架構程式碼
4. 設置 CI/CD 管道

### 高級 (第 5 週及以上)
1. 創建自訂模板
2. 高級基礎架構模式
3. 多區域部署
4. 企業級配置

## 下一步

- [安裝與設定](installation.md) - 安裝並配置 azd
- [您的第一個專案](first-project.md) - 實作教程
- [配置指南](configuration.md) - 高級配置選項

## 其他資源

- [Azure Developer CLI 概述](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [模板庫](https://azure.github.io/awesome-azd/)
- [社群範例](https://github.com/Azure-Samples)

---

**上一章:** [安裝與設定](installation.md) | **下一章:** [配置](configuration.md)
- **下一課程**: [安裝與設定](installation.md)

---

**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵資訊，建議使用專業人工翻譯。我們對因使用此翻譯而產生的任何誤解或錯誤解釋不承擔責任。
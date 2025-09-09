<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-09T16:54:01+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "tw"
}
-->
# AZD 基礎 - 認識 Azure Developer CLI

## 介紹

本課程將向您介紹 Azure Developer CLI (azd)，這是一個強大的命令列工具，可加速您從本地開發到 Azure 部署的過程。您將學習基本概念、核心功能，並了解 azd 如何簡化雲原生應用程式的部署。

## 學習目標

完成本課程後，您將能夠：
- 了解 Azure Developer CLI 是什麼及其主要用途
- 學習模板、環境和服務的核心概念
- 探索包括基於模板的開發和基礎架構即代碼的關鍵功能
- 理解 azd 專案結構和工作流程
- 為您的開發環境安裝和配置 azd 做好準備

## 學習成果

完成本課程後，您將能夠：
- 解釋 azd 在現代雲開發工作流程中的角色
- 識別 azd 專案結構的組成部分
- 描述模板、環境和服務如何協同工作
- 理解使用 azd 的基礎架構即代碼的優勢
- 認識不同的 azd 命令及其用途

## 什麼是 Azure Developer CLI (azd)?

Azure Developer CLI (azd) 是一個命令列工具，旨在加速您從本地開發到 Azure 部署的過程。它簡化了在 Azure 上構建、部署和管理雲原生應用程式的流程。

## 核心概念

### 模板
模板是 azd 的基礎。它包含：
- **應用程式代碼** - 您的原始代碼和依賴項
- **基礎架構定義** - 使用 Bicep 或 Terraform 定義的 Azure 資源
- **配置文件** - 設定和環境變數
- **部署腳本** - 自動化部署工作流程

### 環境
環境代表不同的部署目標：
- **開發** - 用於測試和開發
- **測試** - 預生產環境
- **生產** - 正式生產環境

每個環境都有自己的：
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

### 2. 基礎架構即代碼
- **Bicep** - Azure 的領域專用語言
- **Terraform** - 多雲基礎架構工具
- **ARM Templates** - Azure 資源管理器模板

### 3. 整合工作流程
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
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

## 🔧 配置文件

### azure.yaml
主要的專案配置文件：
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

### 開發周期
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
azd down --force --purge
```

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
- 根據需求進行自定義
- 為您的組織創建可重用的模板

### 3. 環境隔離
- 為開發/測試/生產使用獨立的環境
- 切勿直接從本地機器部署到生產環境
- 使用 CI/CD 管道進行生產部署

### 4. 配置管理
- 使用環境變數存儲敏感資料
- 將配置保存在版本控制中
- 記錄特定環境的設定

## 學習進度

### 初學者 (第 1-2 週)
1. 安裝 azd 並進行身份驗證
2. 部署簡單模板
3. 理解專案結構
4. 學習基本命令 (up, down, deploy)

### 中級 (第 3-4 週)
1. 自定義模板
2. 管理多個環境
3. 理解基礎架構代碼
4. 設置 CI/CD 管道

### 高級 (第 5 週及以上)
1. 創建自定義模板
2. 高級基礎架構模式
3. 多區域部署
4. 企業級配置

## 下一步

- [安裝與設置](installation.md) - 安裝並配置 azd
- [您的第一個專案](first-project.md) - 實作教程
- [配置指南](configuration.md) - 高級配置選項

## 其他資源

- [Azure Developer CLI 概述](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [模板庫](https://azure.github.io/awesome-azd/)
- [社群範例](https://github.com/Azure-Samples)

---

**導航**
- **上一課程**: [README](../../README.md)
- **下一課程**: [安裝與設置](installation.md)

---

**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵資訊，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或錯誤解釋不承擔責任。
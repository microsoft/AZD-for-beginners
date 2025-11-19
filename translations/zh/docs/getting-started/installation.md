<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "dbc3f2f6acbaa09093b21a220e1c2769",
  "translation_date": "2025-11-19T09:51:29+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "zh"
}
-->
# 安装与设置指南

**章节导航：**
- **📚 课程主页**：[AZD 初学者指南](../../README.md)
- **📖 当前章节**：第1章 - 基础与快速入门
- **⬅️ 上一节**：[AZD 基础](azd-basics.md)
- **➡️ 下一节**：[你的第一个项目](first-project.md)
- **🚀 下一章**：[第2章：AI优先开发](../microsoft-foundry/microsoft-foundry-integration.md)

## 简介

本指南将详细介绍如何在您的系统上安装和配置 Azure Developer CLI (azd)。您将学习适用于不同操作系统的多种安装方法、身份验证设置以及初始配置，以便为 Azure 部署准备开发环境。

## 学习目标

完成本课程后，您将能够：
- 成功在您的操作系统上安装 Azure Developer CLI
- 使用多种方法配置 Azure 身份验证
- 设置开发环境所需的必要前提条件
- 理解不同的安装选项及其适用场景
- 解决常见的安装和设置问题

## 学习成果

完成本课程后，您将能够：
- 使用适合您平台的方法安装 azd
- 使用 `azd auth login` 进行 Azure 身份验证
- 验证安装并测试基本的 azd 命令
- 配置开发环境以优化 azd 的使用
- 独立解决常见的安装问题

本指南将帮助您在任何操作系统或开发环境中安装和配置 Azure Developer CLI。

## 前提条件

在安装 azd 之前，请确保您已具备：
- **Azure 订阅** - [创建一个免费账户](https://azure.microsoft.com/free/)
- **Azure CLI** - 用于身份验证和资源管理
- **Git** - 用于克隆模板和版本控制
- **Docker**（可选） - 用于容器化应用程序

## 安装方法

### Windows

#### 方法 1：PowerShell（推荐）
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### 方法 2：Windows 包管理器 (winget)
```cmd
winget install Microsoft.Azd
```

#### 方法 3：Chocolatey
```cmd
choco install azd
```

#### 方法 4：手动安装
1. 从 [GitHub](https://github.com/Azure/azure-dev/releases) 下载最新版本
2. 解压到 `C:\Program Files\azd\`
3. 添加到 PATH 环境变量

### macOS

#### 方法 1：Homebrew（推荐）
```bash
brew tap azure/azd
brew install azd
```

#### 方法 2：安装脚本
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 方法 3：手动安装
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```


### Linux

#### 方法 1：安装脚本（推荐）
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 方法 2：包管理器

**Ubuntu/Debian:**
```bash
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```


### GitHub Codespaces

azd 已预装在 GitHub Codespaces 中。只需创建一个 codespace 即可立即使用 azd。

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```


## ✅ 验证安装

安装完成后，验证 azd 是否正常工作：

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

预期输出：
```
azd version 1.5.0 (commit abc123)
```

**✅ 安装成功检查清单：**
- [ ] `azd version` 显示版本号且无错误
- [ ] `azd --help` 显示命令文档
- [ ] `azd template list` 显示可用模板
- [ ] `az account show` 显示您的 Azure 订阅
- [ ] 您可以创建一个测试目录并成功运行 `azd init`

**如果所有检查通过，您可以继续前往 [你的第一个项目](first-project.md)！**

## 身份验证设置

### Azure CLI 身份验证（推荐）
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### 设备代码身份验证
如果您使用无头系统或浏览器有问题：
```bash
az login --use-device-code
```

### 服务主体（CI/CD）
适用于自动化环境：
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```


## 配置

### 全局配置
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### 环境变量
将以下内容添加到您的 shell 配置文件（`.bashrc`、`.zshrc`、`.profile`）：
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```


## IDE 集成

### Visual Studio Code
安装 Azure Developer CLI 扩展：
1. 打开 VS Code
2. 转到扩展 (Ctrl+Shift+X)
3. 搜索 "Azure Developer CLI"
4. 安装扩展

功能：
- 对 azure.yaml 的 IntelliSense 支持
- 集成终端命令
- 模板浏览
- 部署监控

### GitHub Codespaces
创建 `.devcontainer/devcontainer.json`：
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```


### IntelliJ/JetBrains
1. 安装 Azure 插件
2. 配置 Azure 凭据
3. 使用集成终端运行 azd 命令

## 🐛 安装故障排除

### 常见问题

#### 权限被拒绝（Windows）
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH 问题
手动将 azd 添加到 PATH：

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### 网络/代理问题
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### 版本冲突
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```


### 获取更多帮助
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```


## 更新 azd

### 自动更新
azd 会在有更新时通知您：
```bash
azd version --check-for-updates
```

### 手动更新

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```


## 💡 常见问题解答

<details>
<summary><strong>azd 和 az CLI 有什么区别？</strong></summary>

**Azure CLI (az)**：用于管理单个 Azure 资源的低级工具
- `az webapp create`，`az storage account create`
- 一次管理一个资源
- 侧重于基础设施管理

**Azure Developer CLI (azd)**：用于完整应用程序部署的高级工具
- `azd up` 部署包含所有资源的整个应用程序
- 基于模板的工作流
- 侧重于开发者生产力

**两者都需要**：azd 使用 az CLI 进行身份验证
</details>

<details>
<summary><strong>我可以将 azd 与现有的 Azure 资源一起使用吗？</strong></summary>

可以！您可以：
1. 将现有资源导入 azd 环境
2. 在您的 Bicep 模板中引用现有资源
3. 在现有基础设施旁使用 azd 进行新部署

详见 [配置指南](configuration.md)。
</details>

<details>
<summary><strong>azd 是否支持 Azure 政府云或 Azure 中国？</strong></summary>

支持，配置云环境：
```bash
# Azure Government
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>我可以在 CI/CD 流水线中使用 azd 吗？</strong></summary>

当然可以！azd 专为自动化设计：
- GitHub Actions 集成
- 支持 Azure DevOps
- 服务主体身份验证
- 非交互模式

详见 [部署指南](../deployment/deployment-guide.md) 了解 CI/CD 模式。
</details>

<details>
<summary><strong>使用 azd 的成本是多少？</strong></summary>

azd 本身是**完全免费**且开源的。您只需支付：
- 您部署的 Azure 资源费用
- Azure 消耗成本（计算、存储等）

使用 `azd provision --preview` 在部署前估算成本。
</details>

## 下一步

1. **完成身份验证**：确保您可以访问您的 Azure 订阅
2. **尝试首次部署**：按照 [第一个项目指南](first-project.md)
3. **探索模板**：使用 `azd template list` 浏览可用模板
4. **配置您的 IDE**：设置开发环境

## 支持

如果您遇到问题：
- [官方文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [报告问题](https://github.com/Azure/azure-dev/issues)
- [社区讨论](https://github.com/Azure/azure-dev/discussions)
- [Azure 支持](https://azure.microsoft.com/support/)

---

**章节导航：**
- **📚 课程主页**：[AZD 初学者指南](../../README.md)
- **📖 当前章节**：第1章 - 基础与快速入门
- **⬅️ 上一节**：[AZD 基础](azd-basics.md) 
- **➡️ 下一节**：[你的第一个项目](first-project.md)
- **🚀 下一章**：[第2章：AI优先开发](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ 安装完成！** 继续前往 [你的第一个项目](first-project.md)，开始使用 azd 构建项目吧。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用此翻译而产生的任何误解或误读不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
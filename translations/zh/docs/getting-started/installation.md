<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c58e92a5b56ad73610b95518b0eea386",
  "translation_date": "2025-09-17T12:36:57+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "zh"
}
-->
# 安装与设置指南

**章节导航：**
- **📚 课程主页**: [AZD 初学者指南](../../README.md)
- **📖 当前章节**: 第1章 - 基础与快速入门
- **⬅️ 上一节**: [AZD 基础知识](azd-basics.md)
- **➡️ 下一节**: [你的第一个项目](first-project.md)
- **🚀 下一章**: [第2章: AI优先开发](../ai-foundry/azure-ai-foundry-integration.md)

## 简介

本指南将详细介绍如何在你的系统上安装和配置 Azure Developer CLI (azd)。你将学习适用于不同操作系统的多种安装方法、身份验证设置以及初始配置，以便为 Azure 部署准备开发环境。

## 学习目标

通过本节学习，你将能够：
- 成功在你的操作系统上安装 Azure Developer CLI
- 使用多种方法配置 Azure 身份验证
- 设置开发环境并安装必要的前置条件
- 理解不同的安装选项及其适用场景
- 解决常见的安装和设置问题

## 学习成果

完成本节后，你将能够：
- 根据你的平台选择合适的方法安装 azd
- 使用 `azd auth login` 进行 Azure 身份验证
- 验证安装并测试基本的 azd 命令
- 配置开发环境以优化 azd 的使用
- 独立解决常见的安装问题

本指南适用于所有操作系统和开发环境，帮助你安装和配置 Azure Developer CLI。

## 前置条件

在安装 azd 之前，请确保你已具备以下条件：
- **Azure 订阅** - [创建一个免费账户](https://azure.microsoft.com/free/)
- **Azure CLI** - 用于身份验证和资源管理
- **Git** - 用于克隆模板和版本控制
- **Docker**（可选） - 用于容器化应用程序

## 安装方法

### Windows

#### 方法1：PowerShell（推荐）
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### 方法2：Windows 包管理器（winget）
```cmd
winget install Microsoft.Azd
```

#### 方法3：Chocolatey
```cmd
choco install azd
```

#### 方法4：手动安装
1. 从 [GitHub](https://github.com/Azure/azure-dev/releases) 下载最新版本
2. 解压到 `C:\Program Files\azd\`
3. 添加到 PATH 环境变量

### macOS

#### 方法1：Homebrew（推荐）
```bash
brew tap azure/azd
brew install azd
```

#### 方法2：安装脚本
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 方法3：手动安装
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### 方法1：安装脚本（推荐）
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 方法2：包管理器

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

azd 已预装在 GitHub Codespaces 中。只需创建一个 codespace 即可立即开始使用 azd。

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
如果你使用的是无图形界面的系统或浏览器有问题：
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
将以下内容添加到你的 shell 配置文件（`.bashrc`、`.zshrc`、`.profile`）：
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
2. 转到扩展（Ctrl+Shift+X）
3. 搜索 "Azure Developer CLI"
4. 安装扩展

功能：
- 为 azure.yaml 提供 IntelliSense
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
azd 会在有更新时通知你：
```bash
azd version --check-for-updates
```

### 手动更新

**Windows（winget）:**
```cmd
winget upgrade Microsoft.Azd
```

**macOS（Homebrew）:**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 下一步

1. **完成身份验证**: 确保你可以访问 Azure 订阅
2. **尝试首次部署**: 按照 [第一个项目指南](first-project.md) 操作
3. **探索模板**: 使用 `azd template list` 浏览可用模板
4. **配置你的 IDE**: 设置开发环境

## 支持

如果遇到问题：
- [官方文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [报告问题](https://github.com/Azure/azure-dev/issues)
- [社区讨论](https://github.com/Azure/azure-dev/discussions)
- [Azure 支持](https://azure.microsoft.com/support/)

---

**章节导航：**
- **📚 课程主页**: [AZD 初学者指南](../../README.md)
- **📖 当前章节**: 第1章 - 基础与快速入门
- **⬅️ 上一节**: [AZD 基础知识](azd-basics.md) 
- **➡️ 下一节**: [你的第一个项目](first-project.md)
- **🚀 下一章**: [第2章: AI优先开发](../ai-foundry/azure-ai-foundry-integration.md)

**✅ 安装完成！** 继续阅读 [你的第一个项目](first-project.md)，开始使用 azd 构建项目吧。

---

**免责声明**：  
本文档使用AI翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。
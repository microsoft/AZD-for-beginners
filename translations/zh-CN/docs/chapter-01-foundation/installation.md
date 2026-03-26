# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

本综合指南将引导您在系统上安装和配置 Azure Developer CLI (azd)。您将了解针对不同操作系统的多种安装方法、身份验证设置以及初始配置，以为在 Azure 上的部署准备开发环境。

## Learning Goals

在本课结束时，您将能够：
- 在您的操作系统上成功安装 Azure Developer CLI
- 使用多种方法配置与 Azure 的身份验证
- 为开发环境设置必要的先决条件
- 了解不同的安装选项及其适用场景
- 排查常见的安装和设置问题

## Learning Outcomes

完成本课后，您将能够：
- 使用适合您平台的方法安装 azd
- 使用 azd auth login 与 Azure 进行身份验证
- 验证安装并测试基本的 azd 命令
- 为最佳 azd 使用体验配置您的开发环境
- 独立解决常见的安装问题

本指南将帮助您在任何操作系统或开发环境中安装和配置 Azure Developer CLI。

## Prerequisites

在安装 azd 之前，请确保您已具备：
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - 用于身份验证和资源管理
- **Git** - 用于克隆模板和版本控制
- **Docker (optional)** - 用于容器化应用程序

## Installation Methods

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# 以管理员身份运行或使用提升权限
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. Download the latest release from [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extract to `C:\Program Files\azd\`
3. Add to PATH environment variable

### macOS

#### Option 1: Homebrew (Recommended)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Manual Installation
```bash
# 下载并安装
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Ubuntu/Debian:**
```bash
# 添加 Microsoft 软件包存储库
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# 安装 azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# 添加 Microsoft 软件包仓库
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd 已预装在 GitHub Codespaces 中。只需创建一个 codespace 即可立即开始使用 azd。

### Docker

```bash
# 在容器中运行 azd
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# 创建别名以便更方便地使用
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verify Installation

安装完成后，验证 azd 是否正常工作：

```bash
# 检查版本
azd version

# 查看帮助
azd --help

# 列出可用模板
azd template list
```

Expected output:
```
azd version 1.x.x (commit xxxxxx)
```

**Note**: The actual version number will vary. Check [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) for the latest version.

**✅ Installation Success Checklist:**
- [ ] `azd version` shows version number without errors
- [ ] `azd --help` displays command documentation
- [ ] `azd template list` shows available templates
- [ ] `az account show` displays your Azure subscription
- [ ] You can create a test directory and run `azd init` successfully

**If all checks pass, you're ready to proceed to [Your First Project](first-project.md)!**

## Authentication Setup

### Azure CLI Authentication (Recommended)
```bash
# 如果尚未安装 Azure CLI，请安装
# Windows: 使用 winget 安装 Microsoft.AzureCLI
# macOS: 使用 brew 安装 azure-cli
# Linux: 运行 curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# 登录到 Azure
az login

# 验证身份
az account show
```

### Device Code Authentication
If you're on a headless system or having browser issues:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
For automated environments:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Configuration

### Global Configuration
```bash
# 设置默认订阅
azd config set defaults.subscription <subscription-id>

# 设置默认位置
azd config set defaults.location eastus2

# 查看所有配置
azd config list
```

### Environment Variables
Add to your shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure 配置
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd 配置
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # 启用调试日志记录
```

## IDE Integration

### Visual Studio Code
Install the Azure Developer CLI extension:
1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search for "Azure Developer CLI"
4. Install the extension

Features:
- IntelliSense for azure.yaml
- Integrated terminal commands
- Template browsing
- Deployment monitoring

### GitHub Codespaces
Create a `.devcontainer/devcontainer.json`:
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
1. Install the Azure plugin
2. Configure Azure credentials
3. Use integrated terminal for azd commands

## 🐛 Troubleshooting Installation

### Common Issues

#### Permission Denied (Windows)
```powershell
# 以管理员身份运行 PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Issues
Manually add azd to your PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Network/Proxy Issues
```bash
# 配置代理
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# 跳过 SSL 验证（不建议在生产环境中使用）
azd config set http.insecure true
```

#### Version Conflicts
```bash
# 删除旧安装
# Windows: 使用 winget 卸载 Microsoft.Azd
# macOS: 使用 brew 卸载 azd
# Linux: 使用 sudo apt remove azd 卸载 azd

# 清理配置
rm -rf ~/.azd
```

### Getting More Help
```bash
# 启用调试日志
export AZD_DEBUG=true
azd <command> --debug

# 查看当前配置
azd config list

# 查看当前部署状态
azd show
```

## Updating azd

### Automatic Updates
azd will notify you when updates are available:
```bash
azd version --check-for-updates
```

### Manual Updates

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

## 💡 Frequently Asked Questions

<details>
<summary><strong>azd 和 az CLI 有什么区别？</strong></summary>

**Azure CLI (az)**: 管理单个 Azure 资源的低级工具
- `az webapp create`、`az storage account create`
- 一次管理一个资源
- 侧重于基础设施管理

**Azure Developer CLI (azd)**: 用于完整应用部署的高级工具
- `azd up` 部署包含所有资源的整个应用
- 基于模板的工作流
- 侧重于提高开发者生产力

<strong>你需要两者</strong>：azd 在身份验证方面使用 az CLI
</details>

<details>
<summary><strong>我可以将 azd 与现有的 Azure 资源一起使用吗？</strong></summary>

可以！您可以：
1. 将现有资源导入到 azd 环境中
2. 在您的 Bicep 模板中引用现有资源
3. 在现有基础设施旁使用 azd 进行新部署

详情请参见 [Configuration Guide](configuration.md)。
</details>

<details>
<summary><strong>azd 能在 Azure Government 或 Azure China 上运行吗？</strong></summary>

是的，可以，配置云环境：
```bash
# Azure 政府云
az cloud set --name AzureUSGovernment
az login

# Azure 中国
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>我可以在 CI/CD 管道中使用 azd 吗？</strong></summary>

当然可以！azd 是为自动化设计的：
- 与 GitHub Actions 集成
- 支持 Azure DevOps
- 服务主体身份验证
- 非交互模式

有关 CI/CD 模式，请参见 [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)。
</details>

<details>
<summary><strong>使用 azd 会产生成本吗？</strong></summary>

azd 本身是 <strong>完全免费</strong> 的开源工具。您只需为以下内容付费：
- 您部署的 Azure 资源
- Azure 的消耗费用（计算、存储等）

在部署前使用 `azd provision --preview` 估算费用。
</details>

## Next Steps

1. **Complete authentication**: Ensure you can access your Azure subscription
2. **Try your first deployment**: Follow the [First Project Guide](first-project.md)
3. **Explore templates**: Browse available templates with `azd template list`
4. **Configure your IDE**: Set up your development environment

## Support

If you encounter issues:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - 在编辑器中直接获取 Azure 命令指导，使用 `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md) 
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation Complete!** Continue to [Your First Project](first-project.md) to start building with azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始文档的原文应被视为权威来源。对于重要信息，建议采用专业人工翻译。对于因使用本翻译而产生的任何误解或误释，我们不承担任何责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
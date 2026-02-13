# 安装与设置指南

**Chapter Navigation:**
- **📚 Course Home**: [AZD 入门](../../README.md)
- **📖 Current Chapter**: 第1章 - 基础与快速入门
- **⬅️ Previous**: [AZD 基础](azd-basics.md)
- **➡️ Next**: [你的第一个项目](first-project.md)
- **🚀 Next Chapter**: [第2章：以AI为先的开发](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

本综合指南将带您逐步在系统上安装和配置 Azure Developer CLI (azd)。您将学习针对不同操作系统的多种安装方法、身份验证设置以及初始配置，以为 Azure 部署准备开发环境。

## Learning Goals

在本课结束时，您将能够：
- 在您的操作系统上成功安装 Azure Developer CLI
- 使用多种方法配置与 Azure 的身份验证
- 为开发环境设置必要的先决条件
- 了解不同的安装选项以及何时使用它们
- 排查常见的安装和设置问题

## Learning Outcomes

完成本课后，您将能够：
- 使用适合您平台的方法安装 azd
- 通过 azd auth login 与 Azure 进行身份验证
- 验证安装并测试基本的 azd 命令
- 为最佳 azd 使用配置开发环境
- 独立解决常见安装问题

本指南将帮助您在任何操作系统或开发环境中安装和配置 Azure Developer CLI。

## Prerequisites

在安装 azd 之前，请确保您拥有：
- **Azure 订阅** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - 用于身份验证和资源管理
- **Git** - 用于克隆模板和版本控制
- **Docker**（可选） - 用于容器化应用

## Installation Methods

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# 以管理员身份运行或使用提升的权限
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
1. 从 [GitHub](https://github.com/Azure/azure-dev/releases) 下载最新发布版本
2. 解压到 `C:\Program Files\azd\`
3. 添加到 PATH 环境变量

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
# 添加 Microsoft 软件包存储库
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd 已预装在 GitHub Codespaces 中。只需创建 codespace 即可立即开始使用 azd。

### Docker

```bash
# 在容器中运行 azd
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# 创建别名以便更容易使用
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verify Installation

安装后，请验证 azd 是否正常工作：

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

**注意**: 实际版本号会有所不同。请查看 [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) 以获取最新版本。

**✅ 安装成功检查表:**
- [ ] `azd version` 显示版本号且无错误
- [ ] `azd --help` 显示命令文档
- [ ] `azd template list` 显示可用模板
- [ ] `az account show` 显示您的 Azure 订阅
- [ ] 您可以创建一个测试目录并成功运行 `azd init`

**如果所有检查通过，您就可以继续到 [你的第一个项目](first-project.md)！**

## Authentication Setup

### Azure CLI Authentication (Recommended)
```bash
# 如果尚未安装 Azure CLI，请安装
# Windows: 运行 winget install Microsoft.AzureCLI
# macOS: 运行 brew install azure-cli
# Linux: 运行 curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# 登录到 Azure
az login

# 验证身份
az account show
```

### Device Code Authentication
如果您在无头系统上或遇到浏览器问题：
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
用于自动化环境：
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
将以下内容添加到您的 shell 配置文件（`.bashrc`、`.zshrc`、`.profile`）：
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
安装 Azure Developer CLI 扩展：
1. 打开 VS Code
2. 转到扩展（Ctrl+Shift+X）
3. 搜索 “Azure Developer CLI”
4. 安装该扩展

功能：
- azure.yaml 的 IntelliSense
- 集成终端命令
- 模板浏览
- 部署监控

### GitHub Codespaces
创建一个 `.devcontainer/devcontainer.json`：
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
3. 在集成终端中使用 azd 命令

## 🐛 Troubleshooting Installation

### Common Issues

#### Permission Denied (Windows)
```powershell
# 以管理员身份运行 PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Issues
手动将 azd 添加到您的 PATH：

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

# 跳过 SSL 验证 (不建议在生产环境使用)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# 删除旧安装
# Windows: 使用 winget 卸载 Microsoft.Azd
# macOS: 使用 brew 卸载 azd
# Linux: 使用 sudo apt remove azd

# 清理配置
rm -rf ~/.azd
```

### Getting More Help
```bash
# 启用调试日志记录
export AZD_DEBUG=true
azd <command> --debug

# 查看当前配置
azd config list

# 查看当前部署状态
azd show
```

## Updating azd

### Automatic Updates
azd 会在有可用更新时通知您：
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

**Azure CLI (az)**：用于管理单个 Azure 资源的低级工具
- `az webapp create`、`az storage account create`
- 一次一个资源
- 专注于基础设施管理

**Azure Developer CLI (azd)**：用于完整应用部署的高级工具
- `azd up` 部署整个应用及其所有资源
- 基于模板的工作流程
- 专注于提高开发者生产力

**两者都需要**：azd 使用 az CLI 进行身份验证
</details>

<details>
<summary><strong>我可以在现有 Azure 资源上使用 azd 吗？</strong></summary>

可以！您可以：
1. 将现有资源导入到 azd 环境中
2. 在您的 Bicep 模板中引用现有资源
3. 在现有基础设施旁使用 azd 进行新部署

请参阅 [配置指南](configuration.md) 了解详细信息。
</details>

<details>
<summary><strong>azd 是否可在 Azure Government 或 Azure China 中使用？</strong></summary>

是的，请配置云环境：
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

当然可以！azd 旨在用于自动化：
- 与 GitHub Actions 集成
- 支持 Azure DevOps
- 服务主体身份验证
- 非交互模式

有关 CI/CD 模式，请参阅 [部署指南](../chapter-04-infrastructure/deployment-guide.md)。
</details>

<details>
<summary><strong>使用 azd 的费用是多少？</strong></summary>

azd 本身是 **完全免费** 且开源的。您只需支付：
- 您部署的 Azure 资源费用
- Azure 使用消耗费用（计算、存储等）

在部署前使用 `azd provision --preview` 估算费用。
</details>

## Next Steps

1. **完成身份验证**：确保您可以访问您的 Azure 订阅
2. **尝试第一次部署**：遵循 [你的第一个项目](first-project.md)
3. **探索模板**：使用 `azd template list` 浏览可用模板
4. **配置您的 IDE**：设置您的开发环境

## Support

如果您遇到问题：
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD 入门](../../README.md)
- **📖 Current Chapter**: 第1章 - 基础与快速入门
- **⬅️ Previous**: [AZD 基础](azd-basics.md) 
- **➡️ Next**: [你的第一个项目](first-project.md)
- **🚀 Next Chapter**: [第2章：以AI为先的开发](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ 安装完成！** 继续到 [你的第一个项目](first-project.md) 开始使用 azd 构建。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件使用 AI 翻译服务 Co-op Translator（https://github.com/Azure/co-op-translator）进行翻译。尽管我们力求准确，但请注意自动翻译可能存在错误或不准确之处。原始文件的母语版本应被视为权威来源。对于关键信息，建议采用专业人工翻译。对于因使用本翻译而产生的任何误解或曲解，我们不承担任何责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 安装与设置指南

**章节导航：**
- **📚 课程主页**: [AZD 入门](../../README.md)
- **📖 当前章节**: 第1章 - 基础与快速入门
- **⬅️ 上一章**: [AZD 基础](azd-basics.md)
- **➡️ 下一章**: [你的第一个项目](first-project.md)
- **🚀 下章**: [第2章：以 AI 为先的开发](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 介绍

本综合指南将引导你在系统上安装和配置 Azure Developer CLI (azd)。你将学习适用于不同操作系统的多种安装方法、身份验证设置以及初始化配置，以为在 Azure 上部署准备开发环境。

## 学习目标

完成本课后，你将：
- 在你的操作系统上成功安装 Azure Developer CLI
- 使用多种方法配置与 Azure 的身份验证
- 使用必要的先决条件设置开发环境
- 理解不同的安装选项以及何时使用每种方法
- 排查常见的安装与设置问题

## 学习成果

完成本课后，你将能够：
- 根据平台使用合适的方法安装 azd
- 使用 azd auth login 与 Azure 进行身份验证
- 验证安装并测试基本的 azd 命令
- 配置你的开发环境以实现最佳的 azd 使用体验
- 独立解决常见的安装问题

本指南将帮助你在任何操作系统或开发环境上安装并配置 Azure Developer CLI。

## 先决条件

在安装 azd 之前，请确保你拥有：
- **Azure 订阅** - [创建免费账户](https://azure.microsoft.com/free/)
- **Azure CLI** - 用于身份验证和资源管理
- **Git** - 用于克隆模板和版本控制
- **Docker**（可选）- 用于容器化应用

## 安装方法

### Windows

#### 选项 1：Windows 包管理器（推荐）
```cmd
winget install microsoft.azd
```

#### 选项 2：PowerShell 安装脚本
```powershell
# 当 winget 不可用时有用
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### 选项 3：Chocolatey
```cmd
choco install azd
```

#### 选项 4：手动安装
1. 从 [GitHub](https://github.com/Azure/azure-dev/releases) 下载最新版本
2. 解压到 `C:\Program Files\azd\`
3. 添加到 PATH 环境变量

### macOS

#### 选项 1：Homebrew（推荐）
```bash
brew tap azure/azd
brew install azd
```

#### 选项 2：安装脚本
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 选项 3：手动安装
```bash
# 下载并安装
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### 选项 1：安装脚本（推荐）
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 选项 2：包管理器

**从发布资产手动安装：**
```bash
# 从以下位置下载适用于您 Linux 架构的最新归档文件：
# https://github.com/Azure/azure-dev/releases
# 然后解压它，并将 azd 二进制文件添加到您的 PATH 中。
```

### GitHub Codespaces

某些 Codespaces 和开发容器环境已经包含 `azd`，但你应当验证而不是假设：

```bash
azd version
```

如果缺少 `azd`，请使用该环境的标准脚本进行安装。

### Docker

```bash
# 在容器中运行 azd
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# 创建一个别名以便更方便地使用
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ 验证安装

安装完成后，验证 azd 是否正常工作：

```bash
# 检查版本
azd version

# 查看帮助
azd --help

# 列出可用模板
azd template list
```

预期输出：
```
azd version 1.x.x (commit xxxxxx)
```

<strong>注意</strong>：实际版本号会有所不同。请查看 [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) 以获取最新版本。

**✅ 安装成功检查清单：**
- [ ] `azd version` 显示版本号且无错误
- [ ] `azd --help` 显示命令文档
- [ ] `azd template list` 显示可用模板
- [ ] 你可以创建一个测试目录并成功运行 `azd init`

**如果所有检查通过，你就可以继续前往 [你的第一个项目](first-project.md)！**

## 身份验证设置

### 推荐的初学者设置

对于以 AZD 为优先的工作流，请使用 `azd auth login` 登录。

```bash
# 为诸如 azd up 的 AZD 命令所需
azd auth login

# 验证 AZD 的身份验证状态
azd auth login --check-status
```

仅在你计划在课程期间亲自运行 `az` 命令时才使用 Azure CLI 登录。

### Azure CLI 身份验证（可选）
```bash
# 如果尚未安装，请安装 Azure CLI
# Windows：运行 winget install Microsoft.AzureCLI
# macOS：运行 brew install azure-cli
# Linux：请参阅针对您发行版的 Azure CLI 安装文档

# 登录到 Azure
az login

# 验证身份
az account show
```

### 应该使用哪种登录流程？

- 如果你遵循初学者的 AZD 路线并主要运行 `azd` 命令，请使用 `azd auth login`。
- 当你想运行诸如 `az account show` 或直接检查资源等 Azure CLI 命令时，也请使用 `az login`。
- 如果某个练习同时包含 `azd` 和 `az` 命令，请在开始时运行两者的登录命令一次。

### 设备代码身份验证
如果你处于无头系统或遇到浏览器问题：
```bash
azd auth login --use-device-code
```

### 服务主体（CI/CD）
用于自动化环境：
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### 验证你的完整设置

如果你想在开始第1章之前进行快速就绪检查：

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## 配置

### 全局配置
```bash
# 设置默认订阅
azd config set defaults.subscription <subscription-id>

# 设置默认位置
azd config set defaults.location eastus2

# 查看所有配置
azd config show
```

### 环境变量
将其添加到你的 shell 配置文件（`.bashrc`, `.zshrc`, `.profile`）：
```bash
# Azure 配置
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd 配置
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # 启用调试日志记录
```

## IDE 集成

### Visual Studio Code
安装 Azure Developer CLI 扩展：
1. 打开 VS Code
2. 转到 扩展（Ctrl+Shift+X）
3. 搜索 "Azure Developer CLI"
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

## 🐛 安装故障排除

### 常见问题

#### 权限被拒绝（Windows）
```powershell
# 以管理员身份运行 PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH 问题
手动将 azd 添加到你的 PATH：

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
# 配置代理
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# 跳过 SSL 验证 (不建议在生产环境中使用)
azd config set http.insecure true
```

#### 版本冲突
```bash
# 删除旧安装
# Windows: 使用 winget 卸载 microsoft.azd
# macOS: 使用 brew 卸载 azd
# Linux: 在重新安装之前删除现有的 azd 二进制文件或符号链接

# 清理配置
rm -rf ~/.azd
```

### 获取更多帮助
```bash
# 启用调试日志记录
export AZD_DEBUG=true
azd <command> --debug

# 查看当前配置
azd config show

# 查看当前部署状态
azd show
```

## 更新 azd

### 更新检查
当有更新版本可用时，azd 会发出警告，你可以使用以下命令确认当前构建：
```bash
azd version
```

### 手动更新

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
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
<summary><strong>azd 与 az CLI 有何区别？</strong></summary>

**Azure CLI (az)**：用于管理单个 Azure 资源的低级工具
- `az webapp create`, `az storage account create`
- 一次管理一个资源
- 侧重基础设施管理

**Azure Developer CLI (azd)**：用于完整应用部署的高级工具
- `azd up` 部署包含全部资源的整个应用
- 基于模板的工作流
- 侧重开发者生产力

<strong>两者都需要</strong>：azd 使用 az CLI 进行身份验证
</details>

<details>
<summary><strong>我可以将 azd 与现有的 Azure 资源一起使用吗？</strong></summary>

可以！你可以：
1. 将现有资源导入 azd 环境
2. 在你的 Bicep 模板中引用现有资源
3. 在现有基础设施旁使用 azd 进行新部署

详情请参见 [配置指南](configuration.md)。
</details>

<details>
<summary><strong>azd 能与 Azure Government 或 Azure China 一起使用吗？</strong></summary>

可以，配置云环境：
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

当然可以！azd 专为自动化设计：
- GitHub Actions 集成
- 支持 Azure DevOps
- 服务主体身份验证
- 非交互模式

参见 [部署指南](../chapter-04-infrastructure/deployment-guide.md) 了解 CI/CD 模式。
</details>

<details>
<summary><strong>使用 azd 的费用是多少？</strong></summary>

azd 本身是 <strong>完全免费的</strong> 并且是开源的。你只需为以下部分付费：
- 你部署的 Azure 资源
- Azure 的使用费用（计算、存储等）

使用 `azd provision --preview` 在部署前估算费用。
</details>

## 下一步

1. <strong>完成身份验证</strong>：确保你可以访问你的 Azure 订阅
2. <strong>尝试你的第一次部署</strong>：请参阅 [你的第一个项目指南](first-project.md)
3. <strong>探索模板</strong>：使用 `azd template list` 浏览可用模板
4. **配置你的 IDE**：设置你的开发环境

## 支持

如果你遇到问题：
- [官方文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [报告问题](https://github.com/Azure/azure-dev/issues)
- [社区讨论](https://github.com/Azure/azure-dev/discussions)
- [Azure 支持](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - 在你的编辑器中直接获取 Azure 命令指南，使用 `npx skills add microsoft/github-copilot-for-azure`

---

**章节导航：**
- **📚 课程主页**: [AZD 入门](../../README.md)
- **📖 当前章节**: 第1章 - 基础与快速入门
- **⬅️ 上一章**: [AZD 基础](azd-basics.md) 
- **➡️ 下一章**: [你的第一个项目](first-project.md)
- **🚀 下章**: [第2章：以 AI 为先的开发](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ 安装完成！** 继续前往 [你的第一个项目](first-project.md) 开始使用 azd 构建。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**:
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译而成。我们尽力保证准确性，但请注意自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。因使用此翻译而导致的任何误解或误释，我们概不负责。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
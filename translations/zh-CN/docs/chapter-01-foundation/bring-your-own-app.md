# 将您自己的应用接入 - 在现有项目中添加 azd

**章节导航：**
- **📚 课程首页**: [AZD 入门](../../README.md)
- **📖 当前章节**: 第1章 - 基础与快速入门
- **⬅️ 上一个**: [您的第一个项目](first-project.md)
- **➡️ 下一个**: [开发容器与 Codespaces](dev-containers.md)

> 已在 2026 年 6 月使用 `azd 1.25.6` 验证。

## 介绍

在 [您的第一个项目](first-project.md) 中，您通过从模板开始来部署应用。但在大多数情况下，您已经有了一个应用——一个 Node.js API、Python Flask 服务、.NET Web 应用——位于机器上的某个文件夹中。本课将演示如何将 azd 添加到现有代码，以便使用 `azd up` 部署，无需模板。

## 学习目标

完成本课后，您将能够：
- 了解开始 azd 项目的三种方式
- 在现有代码库中运行 `azd init`
- 了解 `azure.yaml` 和 `infra/` 文件夹对应用的作用
- 知道何时让 azd 生成基础设施，何时自己编写
- 使用 `azd up` 将现有应用部署到 Azure

## 学习成果

完成本课后，您将能够：
- 在已有项目中初始化 azd
- 阅读并编辑基本的 `azure.yaml` 文件
- 使用 `azd infra generate` 生成入门级基础设施
- 为您的应用选择合适的 Azure 托管服务
- 部署并清理您自己的应用

---

## 开始 azd 项目的三种方式

| 起点 | 命令 | 何时使用 |
|----------------|---------|-------------|
| <strong>从模板</strong> | `azd init --template <name>` | 用于学习或从经过验证的示例开始新应用 |
| <strong>从现有代码</strong> | `azd init` (在您的项目文件夹中) | 您已经有应用并希望部署它 |
| **从 Git 仓库** | `azd init --from-code` (在克隆的仓库中) | 在现有仓库中采用 azd |

您已经练习了第一种选项。本课覆盖第二种——最常见的真实场景。

---

## 第1步：在您的项目中运行 `azd init`

在<strong>现有项目文件夹内</strong>打开终端并运行：

```bash
cd my-existing-app
azd init
```

azd 会询问您如何初始化。请选择：

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

选择 **"Use code in the current directory."**，azd 然后会扫描您的文件夹，检测语言和框架，并建议一个主机。

### azd 会检测到什么

azd 会寻找像 package.json、requirements.txt、pom.xml、*.csproj 或 Dockerfile 这样的线索，并建议匹配的 Azure 主机：

| 您的应用 | 可能检测到的主机 |
|----------|----------------------|
| Node.js / Python / .NET web 应用 | Azure App Service 或 Container Apps |
| 容器化应用 (`Dockerfile`) | Azure Container Apps |
| 函数应用 | Azure Functions |
| 静态站点（React/Vue 构建输出） | Azure Static Web Apps |

确认检测到的服务，azd 会为您生成所需的文件。

---

## 第2步：了解 azd 创建了什么

初始化后，您的项目中会新增两样东西：

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — 项目定义

这是 azd 项目的核心。一个最简的示例如下：

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` 段是关键部分：每一项将您代码的某个文件夹映射到一个 Azure 主机。如果您的应用同时有前端和 API，就会有两个服务。

### `infra/` — 以代码形式的 Azure 资源

`infra/` 文件夹包含定义应用所需 Azure 资源的 Bicep 文件（例如 App Service、数据库等）。您不必手工编写这些文件——azd 会生成一个可用的起点。您可以在之后编辑它们以添加资源或加强安全性（详见 [第4章](../chapter-04-infrastructure/README.md)）。

> **提示：** 想在部署前查看或自定义生成的基础设施吗？运行 `azd infra generate`（也可用 `azd infra synth`）将 IaC 写入磁盘，这样您就可以审查并进行版本控制。

---

## 第3步：设置所需配置

如果您的应用需要设置或密钥（如连接字符串、API 密钥），不要将它们硬编码。使用环境值：

```bash
# 创建环境
azd env new dev

# 设置非机密的值
azd env set API_VERSION 1.0.0
```

对于真正的机密，请将它们存储在 Key Vault 中并从基础设施中引用——参见 [第3章：配置与身份验证](../chapter-03-configuration/authsecurity.md)。

---

## 第4步：部署

现在使用您已经熟悉的相同工作流程：

```bash
# 进行身份验证（azd 必需）
azd auth login

# 预览将创建的资源
azd provision --preview

# 预配基础设施并部署你的代码
azd up
```

完成后，azd 会打印您的应用 URL。按照任何 azd 应用相同的方式进行验证：

```bash
azd show           # 显示端点
azd monitor --logs # 如有需要，检查日志
```

---

## 常见首次问题

| 症状 | 可能原因 | 解决方法 |
|---------|--------------|-----|
| azd 未检测到我的应用 | 缺少清单（例如 `package.json`） | 添加清单，或在运行 `azd init` 时手动选择主机 |
| 在 `azd up` 期间构建失败 | 应用需要构建步骤 | 在 `azure.yaml` 中的服务下添加 `buildCommand`/`outputPath` |
| 应用启动但返回错误 | 缺少配置/密钥 | 使用 `azd env set` 设置值或将 Key Vault 连接起来 |
| 选择了错误的主机 | 自动检测猜测错误 | 编辑 `azure.yaml` 中的 `host:` 并重新运行 `azd up` |

有关更多信息，请参见 [第7章：故障排除](../chapter-07-troubleshooting/README.md)。

---

## 清理

```bash
azd down --force --purge
```

---

## 总结

- `azd init` → **"Use code in the current directory"** 将 azd 添加到您已有的应用中。
- `azure.yaml` 将您的代码文件夹映射到 Azure 主机；`infra/` 将资源定义为 Bicep。
- `azd infra generate` 让您可以查看或自定义生成的基础设施。
- 一旦初始化，您现有的应用将使用与基于模板的应用完全相同的 `azd up` / `azd down` 工作流程。

---

## 🔗 导航

| 方向 | 课程 |
|-----------|--------|
| <strong>上一个</strong> | [您的第一个项目](first-project.md) |
| <strong>下一个</strong> | [开发容器与 Codespaces](dev-containers.md) |

## 📖 相关资源

- [AZD 基础](azd-basics.md)
- [第4章：基础设施即代码](../chapter-04-infrastructure/README.md)
- [配置与身份验证](../chapter-03-configuration/authsecurity.md)
- [命令备忘单](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
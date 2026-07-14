# 自带应用 - 向现有项目添加 azd

**章节导航：**
- **📚 课程首页**：[AZD 初学者指南](../../README.md)
- **📖 当前章节**：第1章 - 基础与快速开始
- **⬅️ 上一章**：[你的第一个项目](first-project.md)
- **➡️ 下一章**：[开发容器与 Codespaces](dev-containers.md)

> 已在 2026年7月 使用 `azd 1.27.1` 验证。

## 介绍

在[你的第一个项目](first-project.md)中，你是从模板开始部署了一个应用。但大多数时候你已经<em>有</em>一个应用——一个 Node.js API、一个 Python Flask 服务、一个 .NET Web 应用——放在你电脑的某个文件夹里。本课展示如何将 azd 添加到已有代码中，方便你使用 `azd up` 部署，无需模板。

## 学习目标

完成本课后，你将能够：
- 了解启动 azd 项目的三种方式
- 在现有代码库中运行 `azd init`
- 了解 `azure.yaml` 和 `infra/` 文件夹对你的应用的作用
- 知道什么时候让 azd 自动生成基础设施，什么时候自己编写
- 使用 `azd up` 部署你现有的应用到 Azure

## 学习成果

完成本课后，你将能够：
- 在已有项目中初始化 azd
- 读取并编辑基础的 `azure.yaml` 文件
- 使用 `azd infra generate` 生成初始基础设施
- 为你的应用选择合适的 Azure 托管服务
- 部署并清理你自己的应用

---

## 启动 azd 项目的三种方式

| 起点 | 命令 | 何时使用 |
|----------------|---------|-------------|
| <strong>从模板开始</strong> | `azd init --template <name>` | 学习或从已验证示例开始新应用 |
| <strong>从已有代码开始</strong> | `azd init`（在你的项目文件夹中） | 你已有应用，想要部署它 |
| **从 Git 仓库开始** | `azd init --from-code`（在克隆的仓库中） | 为已有仓库采用 azd |

你已经练习过第一种方式。本课涵盖第二种——最常见的真实场景。

---

## 第一步：在项目中运行 `azd init`

打开<strong>你现有项目的文件夹内的终端</strong>，运行：

```bash
cd my-existing-app
azd init
```

azd 会询问你想如何初始化。选择：

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

选择 **“使用当前目录中的代码”**，azd 会扫描你的文件夹，检测语言和框架，并推荐一个托管服务。

### azd 检测内容

azd 会查找诸如 `package.json`、`requirements.txt`、`pom.xml`、`*.csproj` 或 `Dockerfile` 等信号文件，并推荐相应的 Azure 托管服务：

| 你的应用 | 可能检测到的托管服务 |
|----------|----------------------|
| Node.js / Python / .NET web 应用 | Azure App Service 或 Azure 容器应用 |
| 容器化应用（`Dockerfile`） | Azure 容器应用 |
| 函数应用 | Azure Functions |
| 静态网站（React/Vue 构建结果） | Azure 静态 Web 应用 |

确认检测到的服务，azd 会搭建所需文件。

---

## 第二步：了解 azd 创建了什么

初始化后，你的项目中会多两个新内容：

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — 项目定义文件

这是 azd 项目的核心。一个最简示例如下：

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` 部分是关键：每条目映射代码文件夹到 Azure 托管服务。如果你的应用既有前端又有 API，那么就会有两个服务条目。

### `infra/` — 你的 Azure 资源即代码

`infra/` 文件夹包含 Bicep 文件，定义应用使用的 Azure 资源（例如 App Service、数据库等）。你无需手写这些文件——azd 会生成可用起点。你<em>可以</em>后续编辑它们以添加资源或加强安全（详见[第4章](../chapter-04-infrastructure/README.md)）。

> **提示：** 想在部署前查看或自定义生成的基础设施？运行 `azd infra generate`（也可用 `azd infra synth`）可将 IaC 写入磁盘，方便你审查和版本控制。

---

## 第三步：设置必要的配置

如果应用需要配置或密钥（连接字符串、API 密钥），不要硬编码它们，要使用环境变量：

```bash
# 创建一个环境
azd env new dev

# 设置一个非机密值
azd env set API_VERSION 1.0.0
```

对于真实的密钥，请存储在 Key Vault 并在基础设施中引用——详见[第3章：配置与认证](../chapter-03-configuration/authsecurity.md)。

---

## 第四步：部署

现在，使用你已熟悉的流程：

```bash
# 认证（azd必需）
azd auth login

# 预览将创建的资源
azd provision --preview

# 配置基础设施并部署您的代码
azd up
```

运行结束后，azd 会打印应用的 URL。像验证任何 azd 应用一样，确认它：

```bash
azd show           # 显示端点
azd monitor --logs # 如果需要，检查日志
```

---

## 常见首次问题

| 现象 | 可能原因 | 解决方法 |
|---------|--------------|-----|
| azd 未检测到我的应用 | 缺少清单文件（如 `package.json`） | 添加清单文件，或运行 `azd init` 时手动选择主机 |
| `azd up` 构建失败 | 应用需要构建步骤 | 在 `azure.yaml` 的服务配置中添加 `buildCommand` / `outputPath` |
| 应用启动但返回错误 | 缺少配置/密钥 | 使用 `azd env set` 设值或配置 Key Vault |
| 选错主机 | 自动检测错误 | 编辑 `azure.yaml` 中的 `host:` 并重新运行 `azd up` |

更多信息见 [第7章：故障排除](../chapter-07-troubleshooting/README.md)。

---

## 清理

```bash
azd down --force --purge
```

---

## 总结

- `azd init` → **“使用当前目录中的代码”**，为已有应用添加 azd。
- `azure.yaml` 映射代码文件夹到 Azure 主机；`infra/` 定义资源的 Bicep 代码。
- 通过 `azd infra generate` 可查看或自定义生成的基础设施。
- 初始化后，你的现有应用使用与模板应用完全相同的 `azd up` / `azd down` 工作流。

---

## 🔗 导航

| 方向 | 课程 |
|-----------|--------|
| <strong>上一章</strong> | [你的第一个项目](first-project.md) |
| <strong>下一章</strong> | [开发容器与 Codespaces](dev-containers.md) |

## 📖 相关资源

- [AZD 基础](azd-basics.md)
- [第4章：基础设施即代码](../chapter-04-infrastructure/README.md)
- [配置与认证](../chapter-03-configuration/authsecurity.md)
- [命令备忘单](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
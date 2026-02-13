# 命令备忘单 - 常用 AZD 命令

**所有章节快速参考**
- **📚 课程主页**: [AZD For Beginners](../README.md)
- **📖 快速开始**: [第 1 章：基础与快速开始](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI 命令**: [第 2 章：以 AI 为先的开发](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 高级**: [第 4 章：基础设施即代码](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## 介绍

本综合备忘单按类别并配有实用示例，提供最常用的 Azure Developer CLI 命令的快速参考。非常适合在开发、故障排除和日常操作中快速查找 azd 项目相关命令。

## 学习目标

通过使用此备忘单，您将：
- 即刻获取关键的 Azure Developer CLI 命令和语法
- 理解按功能类别和使用场景组织的命令
- 参考常见开发与部署场景的实用示例
- 获取用于快速问题排查的诊断命令
- 高效找到高级配置与自定义选项
- 定位环境管理和多环境工作流命令

## 学习成果

经常参考此备忘单后，您将能够：
- 在无需查阅完整文档的情况下自信地执行 azd 命令
- 使用适当的诊断命令快速解决常见问题
- 高效管理多个环境和部署场景
- 按需应用高级 azd 功能和配置选项
- 使用系统化命令序列排查部署问题
- 通过有效使用 azd 快捷方式和选项优化工作流

## 入门命令

### 身份验证
```bash
# 通过 AZD 登录 Azure
azd auth login

# 登录到 Azure CLI（AZD 在底层使用它）
az login

# 检查当前账户
az account show

# 设置默认订阅
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# 从 AZD 注销
azd auth logout

# 从 Azure CLI 注销
az logout
```

### 项目初始化
```bash
# 浏览可用模板
azd template list

# 从模板初始化
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# 在当前目录初始化
azd init .

# 使用自定义名称初始化
azd init --template todo-nodejs-mongo my-awesome-app
```

## 核心部署命令

### 完整部署工作流
```bash
# 部署所有内容（预配置 + 部署）
azd up

# 部署时禁用确认提示
azd up --confirm-with-no-prompt

# 部署到指定环境
azd up --environment production

# 使用自定义参数部署
azd up --parameter location=westus2
```

### 仅基础设施
```bash
# 预配 Azure 资源
azd provision

# 🧪 预览基础设施更改
azd provision --preview
# 显示一个模拟运行视图，展示将要创建/修改/删除的资源
# 类似于 'terraform plan' 或 'bicep what-if' - 安全运行，不会应用任何更改
```

### 仅应用程序
```bash
# 部署应用程序代码
azd deploy

# 部署特定服务
azd deploy --service web
azd deploy --service api

# 部署所有服务
azd deploy --all
```

### 构建与打包
```bash
# 构建应用程序
azd package

# 构建特定的服务
azd package --service api
```

## 🌍 环境管理

### 环境操作
```bash
# 列出所有环境
azd env list

# 创建新环境
azd env new development
azd env new staging --location westus2

# 选择环境
azd env select production

# 显示当前环境
azd env show

# 刷新环境状态
azd env refresh
```

### 环境变量
```bash
# 设置环境变量
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# 获取环境变量
azd env get API_KEY

# 列出所有环境变量
azd env get-values

# 删除环境变量
azd env unset DEBUG
```

## ⚙️ 配置命令

### 全局配置
```bash
# 列出所有配置
azd config list

# 设置全局默认值
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# 删除配置
azd config unset defaults.location

# 重置所有配置
azd config reset
```

### 项目配置
```bash
# 验证 azure.yaml
azd config validate

# 显示项目信息
azd show

# 获取服务端点
azd show --output json
```

## 📊 监控与诊断

### 监控仪表板
```bash
# 打开 Azure 门户的监视仪表板
azd monitor

# 打开 Application Insights 实时指标
azd monitor --live

# 打开 Application Insights 日志窗格
azd monitor --logs

# 打开 Application Insights 概览
azd monitor --overview
```

### 查看容器日志
```bash
# 通过 Azure CLI 查看日志（适用于容器应用）
az containerapp logs show --name <app-name> --resource-group <rg-name>

# 实时跟踪日志
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# 从 Azure 门户查看日志
azd monitor --logs
```

### 日志分析查询
```bash
# 通过 Azure 门户访问日志分析
azd monitor --logs

# 使用 Azure CLI 查询日志
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ 维护命令

### 清理
```bash
# 删除所有 Azure 资源
azd down

# 强制删除，且无需确认
azd down --force

# 永久清除已软删除的资源
azd down --purge

# 完成清理
azd down --force --purge
```

### 更新
```bash
# 检查 azd 更新
azd version

# 获取当前版本
azd version

# 查看当前配置
azd config list
```

## 🔧 高级命令

### 流水线与 CI/CD
```bash
# 配置 GitHub Actions
azd pipeline config

# 配置 Azure DevOps
azd pipeline config --provider azdo

# 显示流水线配置
azd pipeline show
```

### 基础设施管理
```bash
# 生成基础设施模板
azd infra generate

# 🧪 基础设施预览与规划
azd provision --preview
# 在不实际部署的情况下模拟基础设施的配置
# 分析 Bicep/Terraform 模板并显示：
# - 要添加的资源（绿色 +）
# - 要修改的资源（黄色 ~）
# - 要删除的资源（红色 -）
# 可安全运行 - 不会对 Azure 环境进行实际更改

# 从 azure.yaml 合成基础设施
azd infra synth
```

### 项目信息
```bash
# 显示项目状态和端点
azd show

# 以 JSON 显示详细的项目信息
azd show --output json

# 获取服务端点
azd show --output json | jq '.services'
```

## 🎯 快速工作流

### 开发工作流
```bash
# 开始新项目
azd init --template todo-nodejs-mongo
cd my-project

# 部署到开发环境
azd env new dev
azd up

# 进行更改并重新部署
azd deploy

# 打开监控仪表板
azd monitor --live
```

### 多环境工作流
```bash
# 设置环境
azd env new dev
azd env new staging  
azd env new production

# 部署到开发环境
azd env select dev
azd up

# 测试并提升到预发布环境
azd env select staging
azd up

# 部署到生产环境
azd env select production
azd up
```

### 故障排除工作流
```bash
# 启用调试模式
export AZD_DEBUG=true

# 检查部署状态
azd show

# 验证配置
azd config list

# 打开监控仪表板以查看日志
azd monitor --logs

# 检查资源状态
azd show --output json
```

## 🔍 调试命令

### 调试信息
```bash
# 启用调试输出
export AZD_DEBUG=true
azd <command> --debug

# 禁用遥测以获得更简洁的输出
export AZD_DISABLE_TELEMETRY=true

# 检查当前配置
azd config list

# 检查身份验证状态
az account show
```

### 模板调试
```bash
# 列出可用模板及详细信息
azd template list --output json

# 显示模板信息
azd template show <template-name>

# 在初始化之前验证模板
azd template validate <template-name>
```

## 📁 文件与目录命令

### 项目结构
```bash
# 显示当前目录结构
tree /f  # Windows
find . -type f  # Linux/macOS

# 导航到 azd 项目根目录
cd $(azd root)

# 显示 azd 配置目录
echo $AZD_CONFIG_DIR  # 通常位于 ~/.azd
```

## 🎨 输出格式化

### JSON 输出
```bash
# 获取用于脚本的 JSON 输出
azd show --output json
azd env list --output json
azd config list --output json

# 使用 jq 解析
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### 表格输出
```bash
# 格式为表格
azd env list --output table

# 查看已部署的服务
azd show --output json | jq '.services | keys'
```

## 🔧 常见命令组合

### 健康检查脚本
```bash
#!/bin/bash
# 快速健康检查
azd show
azd env show
azd monitor --logs
```

### 部署验证
```bash
#!/bin/bash
# 部署前验证
azd show
azd provision --preview  # 在部署前预览更改
az account show
```

### 环境比较
```bash
#!/bin/bash
# 比较环境
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### 资源清理脚本
```bash
#!/bin/bash
# 清理旧环境
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 环境变量

### 常见环境变量
```bash
# Azure 配置
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD 配置
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# 应用程序配置
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 紧急命令

### 快速修复
```bash
# 重置身份验证
az account clear
az login

# 强制刷新环境
azd env refresh

# 重新部署所有服务
azd deploy

# 检查部署状态
azd show --output json
```

### 恢复命令
```bash
# 从部署失败中恢复 - 清理并重新部署
azd down --force --purge
azd up

# 仅重新配置基础设施
azd provision

# 仅重新部署应用程序
azd deploy
```

## 💡 专业提示

### 加速工作流的别名
```bash
# 将其添加到你的 .bashrc 或 .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### 功能快捷方式
```bash
# 快速切换环境
azd-env() {
    azd env select $1 && azd show
}

# 带监控的快速部署
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# 环境状态
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 帮助与文档

### 获取帮助
```bash
# 常规帮助
azd --help
azd help

# 针对特定命令的帮助
azd up --help
azd env --help
azd config --help

# 显示版本和构建信息
azd version
azd version --output json
```

### 文档链接
```bash
# 在浏览器中打开文档
azd docs

# 显示模板文档
azd template show <template-name> --docs
```

---

**提示**：将此备忘单加入书签并使用 `Ctrl+F` 快速查找所需命令！

---

**导航**
- **上一课**: [预部署检查](../docs/pre-deployment/preflight-checks.md)
- **下一课**: [词汇表](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件已使用 AI 翻译服务 Co-op Translator（https://github.com/Azure/co-op-translator）进行翻译。尽管我们力求准确，但请注意自动翻译可能包含错误或不准确之处。原始语言版本的文档应被视为权威来源。对于重要信息，建议使用专业人工翻译。因使用本翻译而产生的任何误解或错误解释，我们概不负责。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
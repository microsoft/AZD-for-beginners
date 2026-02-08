# 4. 配置模板

!!! tip "在本模块结束时您将能够"

    - [ ] 了解 `azure.yaml` 的用途
    - [ ] 了解 `azure.yaml` 的结构
    - [ ] 了解 azd 生命周期 `hooks` 的价值
    - [ ] **Lab 4:** 探索并修改环境变量

---

!!! prompt "`azure.yaml` 文件有什么作用？使用代码块并逐行解释"

      The `azure.yaml` file is the **configuration file for Azure Developer CLI (azd)**. It defines how your application should be deployed to Azure, including infrastructure, services, deployment hooks, and environment variables.

---

## 1. 目的和功能

此 `azure.yaml` 文件作为 AI 代理应用的**部署蓝图**，用于：

1. **在部署前验证环境**
2. **预置 Azure AI 服务**（AI Hub、AI Project、Search 等）
3. **将 Python 应用部署** 到 Azure Container Apps
4. **为聊天和嵌入功能配置 AI 模型**
5. **为 AI 应用设置监控和追踪**
6. **处理新建和现有的** Azure AI 项目场景

该文件使完整的 AI 代理解决方案能够通过**一条命令部署**（`azd up`），并具备适当的验证、预置和部署后配置。

??? info "展开以查看： `azure.yaml`"

      `azure.yaml` 文件定义了 Azure 开发者 CLI 应如何在 Azure 中部署和管理此 AI 代理应用。我们逐行解析。

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: do we need hooks? 
      # TODO: do we need all of the variables?

      name: azd-get-started-with-ai-agents
      metadata:
      template: azd-get-started-with-ai-agents@1.0.2
      requiredVersions:
      azd: ">=1.14.0"

      hooks:
      preup:
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
            interactive: true
            continueOnError: false
      windows:
            shell: pwsh
            run: ./scripts/validate_env_vars.ps1
            interactive: true
            continueOnError: false      
      postprovision:
      windows:
            shell: pwsh
            run: ./scripts/write_env.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
            continueOnError: true
            interactive: true
      postdeploy:
      windows:
            shell: pwsh
            run: ./scripts/postdeploy.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
            continueOnError: true
            interactive: true
      services:
      api_and_frontend:
      project: ./src
      language: py
      host: containerapp
      docker:
            image: api_and_frontend
            remoteBuild: true
      pipeline:
      variables:
      - AZURE_RESOURCE_GROUP
      - AZURE_AIHUB_NAME
      - AZURE_AIPROJECT_NAME
      - AZURE_AISERVICES_NAME
      - AZURE_SEARCH_SERVICE_NAME
      - AZURE_APPLICATION_INSIGHTS_NAME
      - AZURE_CONTAINER_REGISTRY_NAME
      - AZURE_KEYVAULT_NAME
      - AZURE_STORAGE_ACCOUNT_NAME
      - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
      - USE_CONTAINER_REGISTRY
      - USE_APPLICATION_INSIGHTS
      - USE_AZURE_AI_SEARCH_SERVICE
      - AZURE_AI_AGENT_NAME
      - AZURE_AI_AGENT_ID
      - AZURE_AI_AGENT_DEPLOYMENT_NAME
      - AZURE_AI_AGENT_DEPLOYMENT_SKU
      - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
      - AZURE_AI_AGENT_MODEL_NAME
      - AZURE_AI_AGENT_MODEL_FORMAT
      - AZURE_AI_AGENT_MODEL_VERSION
      - AZURE_AI_EMBED_DEPLOYMENT_NAME
      - AZURE_AI_EMBED_DEPLOYMENT_SKU
      - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
      - AZURE_AI_EMBED_MODEL_NAME
      - AZURE_AI_EMBED_MODEL_FORMAT
      - AZURE_AI_EMBED_MODEL_VERSION
      - AZURE_AI_EMBED_DIMENSIONS
      - AZURE_AI_SEARCH_INDEX_NAME
      - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
      - AZURE_EXISTING_AIPROJECT_ENDPOINT
      - AZURE_EXISTING_AGENT_ID
      - ENABLE_AZURE_MONITOR_TRACING
      - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
      ```

---

## 2. 拆解该文件

让我们逐节查看该文件，以理解它的作用及原因。

### 2.1 **头部与模式 (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: 为 IDE 支持和 IntelliSense 提供 YAML 语言服务器模式验证

### 2.2 项目元数据 (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: 定义 Azure Developer CLI 使用的项目名称
- **Lines 6-7**: 指定基于模板版本 1.0.2
- **Lines 8-9**: 要求 Azure Developer CLI 版本为 1.14.0 或更高

### 2.3 部署钩子 (11-40)

```yaml title="" linenums="0"
hooks:
  preup:
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
      interactive: true
      continueOnError: false
    windows:
      shell: pwsh
      run: ./scripts/validate_env_vars.ps1
      interactive: true
      continueOnError: false      
```

- **Lines 11-20**: **部署前钩子** - 在 `azd up` 之前运行

      - 在 Unix/Linux 上：使验证脚本可执行并运行它
      - 在 Windows 上：运行 PowerShell 验证脚本
      - 两者都是交互式的，如果失败将停止部署

```yaml  title="" linenums="0"
  postprovision:
    windows:
      shell: pwsh
      run: ./scripts/write_env.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
      continueOnError: true
      interactive: true
```
- **Lines 21-30**: **预置后钩子** - 在 Azure 资源创建后运行

  - 执行写入环境变量的脚本
  - 即使这些脚本失败也继续部署（`continueOnError: true`）

```yaml title="" linenums="0"
  postdeploy:
    windows:
      shell: pwsh
      run: ./scripts/postdeploy.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
      continueOnError: true
      interactive: true
```
- **Lines 31-40**: **部署后钩子** - 在应用部署后运行

  - 执行最终设置脚本
  - 即使脚本失败也继续

### 2.4 服务配置 (41-48)

这配置了您正在部署的应用服务。

```yaml title="" linenums="0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- **Line 42**: 定义名为 "api_and_frontend" 的服务
- **Line 43**: 指向 `./src` 目录的源代码
- **Line 44**: 指定 Python 作为编程语言
- **Line 45**: 使用 Azure Container Apps 作为托管平台
- **Lines 46-48**: Docker 配置

      - 使用 "api_and_frontend" 作为镜像名称
      - 在 Azure 中远程构建 Docker 镜像（而非本地）

### 2.5 管道变量 (49-76)

这些变量用于在 CI/CD 管道中帮助您运行 `azd` 以实现自动化

```yaml title="" linenums="0"
pipeline:
  variables:
    - AZURE_RESOURCE_GROUP
    - AZURE_AIHUB_NAME
    - AZURE_AIPROJECT_NAME
    - AZURE_AISERVICES_NAME
    - AZURE_SEARCH_SERVICE_NAME
    - AZURE_APPLICATION_INSIGHTS_NAME
    - AZURE_CONTAINER_REGISTRY_NAME
    - AZURE_KEYVAULT_NAME
    - AZURE_STORAGE_ACCOUNT_NAME
    - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
    - USE_CONTAINER_REGISTRY
    - USE_APPLICATION_INSIGHTS
    - USE_AZURE_AI_SEARCH_SERVICE
    - AZURE_AI_AGENT_NAME
    - AZURE_AI_AGENT_ID
    - AZURE_AI_AGENT_DEPLOYMENT_NAME
    - AZURE_AI_AGENT_DEPLOYMENT_SKU
    - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
    - AZURE_AI_AGENT_MODEL_NAME
    - AZURE_AI_AGENT_MODEL_FORMAT
    - AZURE_AI_AGENT_MODEL_VERSION
    - AZURE_AI_EMBED_DEPLOYMENT_NAME
    - AZURE_AI_EMBED_DEPLOYMENT_SKU
    - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
    - AZURE_AI_EMBED_MODEL_NAME
    - AZURE_AI_EMBED_MODEL_FORMAT
    - AZURE_AI_EMBED_MODEL_VERSION
    - AZURE_AI_EMBED_DIMENSIONS
    - AZURE_AI_SEARCH_INDEX_NAME
    - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
    - AZURE_EXISTING_AIPROJECT_ENDPOINT
    - AZURE_EXISTING_AGENT_ID
    - ENABLE_AZURE_MONITOR_TRACING
    - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
```

本节定义了在**部署期间**使用的环境变量，并按类别组织：

- **Azure 资源名称 (Lines 51-60)**:
      - 核心 Azure 服务资源名称，例如：资源组、AI Hub、AI Project 等。
- **功能开关 (Lines 61-63)**:
      - 用于启用/禁用特定 Azure 服务的布尔变量
- **AI 代理配置 (Lines 64-71)**:
      - 主要 AI 代理的配置，包括名称、ID、部署设置、模型细节
- **AI 嵌入配置 (Lines 72-79)**:
      - 用于向量检索的嵌入模型配置
- **搜索与监控 (Lines 80-84)**:
      - 搜索索引名称、现有资源 ID，以及监控/追踪 设置

---

## 3. 了解环境变量
以下环境变量控制部署的配置和行为，按主要用途组织。大多数变量有合理的默认值，但您可以根据特定需求或现有的 Azure 资源自定义它们。

### 3.1 必需变量 

```bash title="" linenums="0"
# Azure 核心配置
AZURE_ENV_NAME                    # 环境名称（用于资源命名）
AZURE_LOCATION                    # 部署区域
AZURE_SUBSCRIPTION_ID             # 目标订阅
AZURE_RESOURCE_GROUP              # 资源组名称
AZURE_PRINCIPAL_ID                # 用于 RBAC 的用户主体

# 资源名称（如未指定则自动生成）
AZURE_AIHUB_NAME                  # Microsoft Foundry 中心名称
AZURE_AIPROJECT_NAME              # AI 项目名称
AZURE_AISERVICES_NAME             # AI 服务帐户名称
AZURE_STORAGE_ACCOUNT_NAME        # 存储帐户名称
AZURE_CONTAINER_REGISTRY_NAME     # 容器注册表名称
AZURE_KEYVAULT_NAME               # Key Vault 名称（如果使用）
```

### 3.2 模型配置 
```bash title="" linenums="0"
# 聊天模型配置
AZURE_AI_AGENT_MODEL_NAME         # 默认: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # 默认: OpenAI (或 Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # 默认: 最新可用版本
AZURE_AI_AGENT_DEPLOYMENT_NAME    # 聊天模型的部署名称
AZURE_AI_AGENT_DEPLOYMENT_SKU     # 默认: 标准
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # 默认: 80 (千 TPM)

# 嵌入模型配置
AZURE_AI_EMBED_MODEL_NAME         # 默认: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # 默认: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # 默认: 最新可用版本
AZURE_AI_EMBED_DEPLOYMENT_NAME    # 嵌入的部署名称
AZURE_AI_EMBED_DEPLOYMENT_SKU     # 默认: 标准
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # 默认: 50 (千 TPM)

# 代理配置
AZURE_AI_AGENT_NAME               # 代理显示名称
AZURE_EXISTING_AGENT_ID           # 使用现有代理 (可选)
```

### 3.3 功能开关
```bash title="" linenums="0"
# 可选服务
USE_APPLICATION_INSIGHTS         # 默认：true
USE_AZURE_AI_SEARCH_SERVICE      # 默认：false
USE_CONTAINER_REGISTRY           # 默认：true

# 监控与追踪
ENABLE_AZURE_MONITOR_TRACING     # 默认：false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # 默认：false

# 搜索配置
AZURE_AI_SEARCH_INDEX_NAME       # 搜索索引名称
AZURE_SEARCH_SERVICE_NAME        # 搜索服务名称
```

### 3.4 AI 项目配置 
```bash title="" linenums="0"
# 使用现有资源
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # 现有 AI 项目的完整资源 ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # 现有项目的端点 URL
```

### 3.5 检查您的变量

使用 Azure Developer CLI 查看和管理您的环境变量：

```bash title="" linenums="0"
# 查看当前环境的所有环境变量
azd env get-values

# 获取特定的环境变量
azd env get-value AZURE_ENV_NAME

# 设置一个环境变量
azd env set AZURE_LOCATION eastus

# 从 .env 文件设置多个变量
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们尽力确保准确性，但请注意自动翻译可能存在错误或不准确之处。原始语言的原文应被视为权威来源。对于关键信息，建议使用专业人工翻译。对于因使用本翻译而导致的任何误解或错误解释，我们概不负责。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
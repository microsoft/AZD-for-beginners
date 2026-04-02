# 使用 Azure Developer CLI 的 AI 代理

**章节导航：**
- **📚 课程首页**: [AZD For Beginners](../../README.md)
- **📖 当前章节**: 第 2 章 - 以 AI 为先的开发
- **⬅️ 上一章**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ 下一章**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 高级**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## 介绍

AI 代理是能够感知环境、做出决策并采取行动以实现特定目标的自主程序。与仅响应提示的简单聊天机器人不同，代理可以：

- <strong>使用工具</strong> - 调用 API、搜索数据库、执行代码
- <strong>规划与推理</strong> - 将复杂任务分解为步骤
- <strong>从上下文中学习</strong> - 维护记忆并调整行为
- <strong>协作</strong> - 与其他代理协同工作（多代理系统）

本指南演示如何使用 Azure Developer CLI (azd) 将 AI 代理部署到 Azure。

> **验证说明（2026-03-25）：** 本指南已根据 `azd` `1.23.12` 和 `azure.ai.agents` `0.1.18-preview` 进行审查。`azd ai` 体验仍处于预览阶段，因此如果你已安装的扩展标志不同，请检查扩展帮助。

## 学习目标

完成本指南后，你将能够：
- 理解 AI 代理是什么以及它们与聊天机器人的区别
- 使用 AZD 部署预构建的 AI 代理模板
- 为自定义代理配置 Foundry Agents
- 实现基本代理模式（工具使用、RAG、多代理）
- 监控并调试已部署的代理

## 学习成果

完成后，你将能够：
- 使用单条命令将 AI 代理应用部署到 Azure
- 配置代理工具和能力
- 使用代理实现检索增强生成（RAG）
- 为复杂工作流设计多代理架构
- 解决常见的代理部署问题

---

## 🤖 代理与聊天机器人有何不同？

| 特性 | 聊天机器人 | AI 代理 |
|---------|---------|----------|
| <strong>行为</strong> | 响应提示 | 采取自主行动 |
| <strong>工具</strong> | 无 | 可调用 API、搜索、执行代码 |
| <strong>记忆</strong> | 仅基于会话 | 跨会话的持久记忆 |
| <strong>规划</strong> | 单次响应 | 多步骤推理 |
| <strong>协作</strong> | 单一实体 | 可与其他代理协作 |

### 简单类比

- <strong>聊天机器人</strong> = 信息台上回答问题的热心人员  
- **AI 代理** = 能为你打电话、预订日程并完成任务的个人助理

---

## 🚀 快速开始：部署你的第一个代理

### 选项 1：Foundry Agents 模板（推荐）

```bash
# 初始化 AI 代理模板
azd init --template get-started-with-ai-agents

# 部署到 Azure
azd up
```

**部署内容：**
- ✅ Foundry Agents
- ✅ Microsoft Foundry Models (gpt-4.1)
- ✅ Azure AI Search（用于 RAG）
- ✅ Azure Container Apps（Web 界面）
- ✅ Application Insights（监控）

**时间：** ~15-20 分钟  
**费用：** ~$100-150/月（开发环境）

### 选项 2：使用 Prompty 的 OpenAI 代理

```bash
# 初始化基于 Prompty 的代理模板
azd init --template agent-openai-python-prompty

# 部署到 Azure
azd up
```

**部署内容：**
- ✅ Azure Functions（无服务器代理执行）
- ✅ Microsoft Foundry Models
- ✅ Prompty 配置文件
- ✅ 示例代理实现

**时间：** ~10-15 分钟  
**费用：** ~$50-100/月（开发环境）

### 选项 3：RAG 聊天代理

```bash
# 初始化 RAG 聊天模板
azd init --template azure-search-openai-demo

# 部署到 Azure
azd up
```

**部署内容：**
- ✅ Microsoft Foundry Models
- ✅ 带示例数据的 Azure AI Search
- ✅ 文档处理管道
- ✅ 带引用的聊天界面

**时间：** ~15-25 分钟  
**费用：** ~$80-150/月（开发环境）

### 选项 4：AZD AI Agent Init（基于清单或模板的预览）

如果你有代理清单文件，可以使用 `azd ai` 命令直接搭建 Foundry Agent Service 项目。较新的预览版本还添加了基于模板的初始化支持，因此具体的提示流程可能会根据你安装的扩展版本略有不同。

```bash
# 安装 AI 代理扩展
azd extension install azure.ai.agents

# 可选：验证已安装的预览版本
azd extension show azure.ai.agents

# 从代理清单初始化
azd ai agent init -m agent-manifest.yaml

# 部署到 Azure
azd up
```

**何时使用 `azd ai agent init` 与 `azd init --template`：**

| 方法 | 最适合 | 工作方式 |
|----------|----------|------|
| `azd init --template` | 从一个可工作的示例应用开始 | 克隆一个包含代码 + 基础设施的完整模板仓库 |
| `azd ai agent init -m` | 从你自己的代理清单构建 | 从你的代理定义脚手架项目结构 |

> **提示：** 在学习时使用 `azd init --template`（上述选项 1-3）。在使用自己的清单构建生产代理时使用 `azd ai agent init`。完整参考见 [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

---

## 🏗️ 代理架构模式

### 模式 1：具备工具的单代理

最简单的代理模式 —— 一个代理可以使用多个工具。

```mermaid
graph TD
    UI[用户界面] --> Agent[AI 代理<br/>gpt-4.1]
    Agent --> Search[搜索工具]
    Agent --> Database[数据库工具]
    Agent --> API[API 工具]
```
**适合：**
- 客户支持机器人
- 研究助理
- 数据分析代理

**AZD 模板：** `azure-search-openai-demo`

### 模式 2：RAG 代理（检索增强生成）

在生成响应之前检索相关文档的代理。

```mermaid
graph TD
    Query[用户查询] --> RAG[RAG 代理]
    RAG --> Vector[向量搜索]
    RAG --> LLM[大型语言模型<br/>gpt-4.1]
    Vector -- 文档 --> LLM
    LLM --> Response[带引用的回复]
```
**适合：**
- 企业知识库
- 文档问答系统
- 合规与法律研究

**AZD 模板：** `azure-search-openai-demo`

### 模式 3：多代理系统

多个专门化代理协同处理复杂任务。

```mermaid
graph TD
    Orchestrator[编排者代理] --> Research[研究代理<br/>gpt-4.1]
    Orchestrator --> Writer[撰写者代理<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[审阅者代理<br/>gpt-4.1]
```
**适合：**
- 复杂内容生成
- 多步骤工作流
- 需要不同专业知识的任务

**了解更多：** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ 配置代理工具

当代理能够使用工具时，它们会变得更强大。以下是如何配置常见工具：

### 在 Foundry Agents 中配置工具

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# 定义自定义工具
search_tool = FunctionTool(
    name="search_knowledge_base",
    description="Search the company knowledge base for relevant documents",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "The search query"
            }
        },
        "required": ["query"]
    }
)

# 使用工具创建代理
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### 环境配置

```bash
# 设置代理特定的环境变量
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# 使用更新的配置进行部署
azd deploy
```

---

## 📊 监控代理

### Application Insights 集成

所有 AZD 代理模板都包含用于监控的 Application Insights：

```bash
# 打开监控仪表盘
azd monitor --overview

# 查看实时日志
azd monitor --logs

# 查看实时指标
azd monitor --live
```

### 关键要追踪的指标

| 指标 | 描述 | 目标 |
|--------|-------------|--------|
| 响应延迟 | 生成响应所需时间 | < 5 秒 |
| 令牌使用 | 每次请求的令牌数 | 监控费用 |
| 工具调用成功率 | 工具执行成功的百分比 | > 95% |
| 错误率 | 代理请求失败率 | < 1% |
| 用户满意度 | 反馈评分 | > 4.0/5.0 |

### 代理的自定义日志记录

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# 使用 OpenTelemetry 配置 Azure Monitor
configure_azure_monitor(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
)

tracer = trace.get_tracer(__name__)

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    with tracer.start_as_current_span("agent_interaction") as span:
        span.set_attributes({
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        })
```

> **注意：** 安装所需包：`pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 成本考虑

### 按模式估计的月度成本

| 模式 | 开发环境 | 生产环境 |
|---------|-----------------|------------|
| 单代理 | $50-100 | $200-500 |
| RAG 代理 | $80-150 | $300-800 |
| 多代理（2-3 个代理） | $150-300 | $500-1,500 |
| 企业级多代理 | $300-500 | $1,500-5,000+ |

### 成本优化技巧

1. **对简单任务使用 gpt-4.1-mini**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. <strong>对重复查询实施缓存</strong>
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. <strong>为每次运行设置令牌限制</strong>
   ```python
   # 在运行代理时设置 max_completion_tokens，而不是在创建时设置
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # 限制响应长度
   )
   ```

4. <strong>不使用时缩容到零</strong>
   ```bash
   # 容器应用会自动缩放到零
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 排查代理问题

### 常见问题及解决方案

<details>
<summary><strong>❌ 代理未响应工具调用</strong></summary>

```bash
# 检查工具是否已正确注册
azd show

# 验证 OpenAI 部署
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# 检查代理日志
azd monitor --logs
```

**常见原因：**
- 工具函数签名不匹配
- 缺少所需权限
- API 端点不可访问
</details>

<details>
<summary><strong>❌ 代理响应延迟高</strong></summary>

```bash
# 在 Application Insights 中检查瓶颈
azd monitor --live

# 考虑使用更快的模型
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**优化建议：**
- 使用流式响应
- 实现响应缓存
- 减小上下文窗口大小
</details>

<details>
<summary><strong>❌ 代理返回不正确或虚构的信息</strong></summary>

```python
# 使用更好的系统提示进行改进
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# 添加用于提供依据的检索
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # 在文档中为回复提供依据
)
```
</details>

<details>
<summary><strong>❌ 超出令牌限制的错误</strong></summary>

```python
# 实现上下文窗口管理
def truncate_context(messages, max_tokens=8000, model="gpt-4.1"):
    """Keep only recent messages within token limit."""
    import tiktoken
    encoding = tiktoken.encoding_for_model(model)
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(encoding.encode(msg.content))
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 实践练习

### 练习 1：部署一个基础代理（20 分钟）

**目标：** 使用 AZD 部署你的第一个 AI 代理

```bash
# 第1步：初始化模板
azd init --template get-started-with-ai-agents

# 第2步：登录 Azure
azd auth login
# 如果在多个租户间工作，请添加 --tenant-id <tenant-id>

# 第3步：部署
azd up

# 第4步：测试代理
# 部署后预期输出：
#   部署完成！
#   端点：https://<app-name>.<region>.azurecontainerapps.io
# 打开输出中显示的 URL 并尝试提问

# 第5步：查看监控
azd monitor --overview

# 第6步：清理
azd down --force --purge
```

**成功标准：**
- [ ] 代理能响应提问
- [ ] 能通过 `azd monitor` 访问监控仪表板
- [ ] 资源成功清理

### 练习 2：添加自定义工具（30 分钟）

**目标：** 为代理扩展一个自定义工具

1. 部署代理模板：
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. 在你的代理代码中创建一个新的工具函数：
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # 调用天气服务的 API
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. 将工具注册到代理中：
   ```python
   from azure.ai.projects.models import FunctionTool

   weather_tool = FunctionTool(
       name="get_weather",
       description="Get current weather for a location",
       parameters={
           "type": "object",
           "properties": {
               "location": {"type": "string", "description": "City name"}
           },
           "required": ["location"]
       }
   )

   agent = project_client.agents.create_agent(
       model="gpt-4.1",
       name="Weather Agent",
       tools=[weather_tool]
   )
   ```
4. 重新部署并测试：
   ```bash
   azd deploy
   # 提问："西雅图的天气怎么样？"
   # 预期：代理调用 get_weather("Seattle") 并返回天气信息
   ```

**成功标准：**
- [ ] 代理识别与天气相关的查询
- [ ] 工具被正确调用
- [ ] 响应包含天气信息

### 练习 3：构建 RAG 代理（45 分钟）

**目标：** 创建一个能从你的文档中回答问题的代理

```bash
# 步骤 1：部署 RAG 模板
azd init --template azure-search-openai-demo
azd up

# 步骤 2：上传您的文档
# 将 PDF/TXT 文件放入 data/ 目录，然后运行：
python scripts/prepdocs.py

# 步骤 3：使用特定领域的问题进行测试
# 打开 azd up 输出中的 Web 应用 URL
# 就您上传的文档提问
# 回答应包含类似 [doc.pdf] 的引用
```

**成功标准：**
- [ ] 代理从已上传文档中回答问题
- [ ] 响应包含引用
- [ ] 对于超出范围的问题不出现虚构内容

---

## 📚 后续步骤

现在你已了解 AI 代理，探索这些高级主题：

| 主题 | 描述 | 链接 |
|-------|-------------|------|
| <strong>多代理系统</strong> | 构建具有多个协作代理的系统 | [零售多代理示例](../../examples/retail-scenario.md) |
| <strong>协调模式</strong> | 学习编排和通信模式 | [协调模式](../chapter-06-pre-deployment/coordination-patterns.md) |
| <strong>生产部署</strong> | 面向企业的代理部署 | [生产 AI 实践](../chapter-08-production/production-ai-practices.md) |
| <strong>代理评估</strong> | 测试和评估代理性能 | [AI 故障排除](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI 工作坊实验** | 实践操作：使你的 AI 解决方案适配 AZD | [AI Workshop Lab](ai-workshop-lab.md) |

---

## 📖 额外资源

### 官方文档
- [Azure AI Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure AI Foundry Agent Service Quickstart](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent Framework](https://learn.microsoft.com/semantic-kernel/)

### AZD 代理模板
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### 社区资源
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### 编辑器的代理技能
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - 在 GitHub Copilot、Cursor 或任何受支持的代理中安装可重用的 AI 代理技能以支持 Azure 开发。包括针对 [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai)、[Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry)、[部署](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy) 和 [诊断](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) 的技能：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

<strong>导航</strong>
- <strong>上一课</strong>: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- <strong>下一课</strong>: [AI Model Deployment](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**:
本文档已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版本的文档应被视为权威来源。对于重要信息，建议采用专业人工翻译。对于因使用本翻译而导致的任何误解或曲解，我们不承担任何责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
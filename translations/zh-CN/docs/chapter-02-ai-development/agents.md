# AI Agents with Azure Developer CLI

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: 第2章 - AI 优先开发
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Practices](production-ai-practices.md)
- **🚀 Advanced**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## 介绍

AI 代理是能够感知其环境、做出决策并采取行动以实现特定目标的自主程序。与仅响应提示的简单聊天机器人不同，代理可以：

- **使用工具** - 调用 API、搜索数据库、执行代码
- **规划与推理** - 将复杂任务分解为多个步骤
- **从上下文中学习** - 保持记忆并调整行为
- **协作** - 与其他代理协同工作（多代理系统）

本指南将向您展示如何使用 Azure Developer CLI (azd) 将 AI 代理部署到 Azure。

## 学习目标

完成本指南后，您将能够：
- 了解 AI 代理是什么以及它们与聊天机器人的区别
- 使用 AZD 部署预构建的 AI 代理模板
- 为自定义代理配置 Foundry Agents
- 实现基本的代理模式（工具使用、RAG、多代理）
- 监控并调试已部署的代理

## 学习成果

完成后，您将能够：
- 使用单个命令将 AI 代理应用部署到 Azure
- 配置代理工具和能力
- 使用代理实现检索增强生成（RAG）
- 为复杂工作流设计多代理架构
- 排查常见的代理部署问题

---

## 🤖 代理与聊天机器人有何不同？

| 特性 | 聊天机器人 | AI 代理 |
|---------|---------|----------|
| **行为** | 回应提示 | 执行自主操作 |
| **工具** | 无 | 可以调用 API、搜索、执行代码 |
| **记忆** | 仅基于会话 | 会话间持久记忆 |
| **规划** | 单次回应 | 多步骤推理 |
| **协作** | 单一实体 | 可与其他代理协作 |

### 简单类比

- **聊天机器人** = 在信息台回答问题的热心人员
- **AI 代理** = 能为您打电话、预约并完成任务的私人助理

---

## 🚀 快速入门：部署你的第一个代理

### 选项 1：Foundry Agents 模板（推荐）

```bash
# 初始化 AI 代理模板
azd init --template get-started-with-ai-agents

# 部署到 Azure
azd up
```

**部署内容：**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search（用于 RAG）
- ✅ Azure Container Apps（Web 界面）
- ✅ Application Insights（监控）

**时间：** ~15-20 分钟  
**费用：** ~$100-150/月（开发）

### 选项 2：使用 Prompty 的 OpenAI 代理

```bash
# 初始化基于 Prompty 的代理模板
azd init --template agent-openai-python-prompty

# 部署到 Azure
azd up
```

**部署内容：**
- ✅ Azure Functions（无服务器代理执行）
- ✅ Azure OpenAI
- ✅ Prompty 配置文件
- ✅ 示例代理实现

**时间：** ~10-15 分钟  
**费用：** ~$50-100/月（开发）

### 选项 3：RAG 聊天代理

```bash
# 初始化 RAG 聊天模板
azd init --template azure-search-openai-demo

# 部署到 Azure
azd up
```

**部署内容：**
- ✅ Azure OpenAI
- ✅ Azure AI Search（含示例数据）
- ✅ 文档处理流水线
- ✅ 带引用的聊天界面

**时间：** ~15-25 分钟  
**费用：** ~$80-150/月（开发)

---

## 🏗️ 代理架构模式

### 模式 1：具有工具的单代理

最简单的代理模式——一个代理可以使用多个工具。

```
┌─────────────────────────────────────┐
│           User Interface            │
└─────────────────┬───────────────────┘
                  │
          ┌───────▼───────┐
          │  AI Agent     │
          │  (GPT-4o)     │
          └───────┬───────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌────▼────┐   ┌───▼───┐
│Search │   │Database │   │ API   │
│ Tool  │   │  Tool   │   │ Tool  │
└───────┘   └─────────┘   └───────┘
```

**适用于：**
- 客户支持机器人
- 研究助理
- 数据分析代理

**AZD 模板：** `azure-search-openai-demo`

### 模式 2：RAG 代理（检索增强生成）

在生成响应之前检索相关文档的代理。

```
┌──────────────────────────────────────────────┐
│                User Query                     │
└─────────────────────┬────────────────────────┘
                      │
              ┌───────▼───────┐
              │  RAG Agent    │
              └───────┬───────┘
                      │
         ┌────────────┴────────────┐
         │                         │
    ┌────▼────┐              ┌────▼────┐
    │ Vector  │              │  LLM    │
    │ Search  │──Documents──►│ (GPT-4) │
    └─────────┘              └────┬────┘
                                  │
                          ┌───────▼───────┐
                          │ Response with │
                          │  Citations    │
                          └───────────────┘
```

**适用于：**
- 企业知识库
- 文档问答系统
- 合规与法律研究

**AZD 模板：** `azure-search-openai-demo`

### 模式 3：多代理系统

多个专门化代理协同处理复杂任务。

```
                ┌─────────────────┐
                │  Orchestrator   │
                │    Agent        │
                └────────┬────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
┌───────▼───────┐ ┌─────▼──────┐ ┌───────▼───────┐
│   Research    │ │   Writer   │ │   Reviewer    │
│    Agent      │ │   Agent    │ │    Agent      │
│  (GPT-4o)     │ │(GPT-4o-mini│ │   (GPT-4o)    │
└───────────────┘ └────────────┘ └───────────────┘
```

**适用于：**
- 复杂内容生成
- 多步骤工作流
- 需要不同专业知识的任务

**了解更多：** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ 配置代理工具

当代理可以使用工具时，它们会更强大。以下是配置常见工具的方法：

### Foundry Agents 中的工具配置

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
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### 环境配置

```bash
# 为代理设置特定的环境变量
azd env set AZURE_OPENAI_MODEL "gpt-4o"
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
# 打开监控仪表板
azd monitor --overview

# 查看实时日志
azd monitor --logs

# 查看实时指标
azd monitor --live
```

### 关键指标跟踪

| 指标 | 描述 | 目标 |
|--------|-------------|--------|
| 响应延迟 | 生成响应的时间 | < 5 秒 |
| 令牌使用量 | 每次请求的令牌数 | 监控以控制成本 |
| 工具调用成功率 | 成功工具执行的百分比 | > 95% |
| 错误率 | 失败的代理请求 | < 1% |
| 用户满意度 | 反馈评分 | > 4.0/5.0 |

### 代理的自定义日志记录

```python
import logging
from opencensus.ext.azure.log_exporter import AzureLogHandler

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
))

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    logger.info("agent_interaction", extra={
        "custom_dimensions": {
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        }
    })
```

---

## 💰 成本考虑

### 按模式估计的每月费用

| 模式 | 开发环境 | 生产 |
|---------|-----------------|------------|
| 单代理 | $50-100 | $200-500 |
| RAG 代理 | $80-150 | $300-800 |
| 多代理（2-3 个代理） | $150-300 | $500-1,500 |
| 企业级多代理 | $300-500 | $1,500-5,000+ |

### 成本优化建议

1. **使用 GPT-4o-mini 处理简单任务**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **为重复查询实现缓存**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **设置令牌限制**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # 限制响应长度
   )
   ```

4. **在不使用时缩容为零**
   ```bash
   # 容器应用会自动缩减到零实例
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 代理故障排除

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
- 缺少必要权限
- API 端点不可访问
</details>

<details>
<summary><strong>❌ 代理响应延迟高</strong></summary>

```bash
# 检查 Application Insights 以定位瓶颈
azd monitor --live

# 考虑使用更快的模型
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**优化建议：**
- 使用流式响应
- 实现响应缓存
- 减小上下文窗口大小
</details>

<details>
<summary><strong>❌ 代理返回不正确或幻觉信息</strong></summary>

```python
# 通过更好的系统提示改进
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# 添加检索以提供依据
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # 让响应以文档为依据
)
```
</details>

<details>
<summary><strong>❌ 超出令牌限制错误</strong></summary>

```python
# 实现上下文窗口管理
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # 粗略估计
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 实践练习

### 练习 1：部署一个基础代理（20分钟）

**目标：** 使用 AZD 部署你的第一个 AI 代理

```bash
# 第1步：初始化模板
azd init --template get-started-with-ai-agents

# 第2步：登录到 Azure
azd auth login

# 第3步：部署
azd up

# 第4步：测试代理
# 打开输出中显示的 URL

# 第5步：清理
azd down --force --purge
```

**成功标准：**
- [ ] 代理能回应问题
- [ ] 可访问监控仪表板
- [ ] 资源已成功清理

### 练习 2：添加自定义工具（30分钟）

**目标：** 扩展代理以添加自定义工具

1. 部署代理模板
2. 创建一个新的工具函数：
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # 调用天气服务的 API
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. 将工具注册到代理
4. 测试代理是否使用新工具

**成功标准：**
- [ ] 代理识别与天气相关的查询
- [ ] 工具被正确调用
- [ ] 响应包含天气信息

### 练习 3：构建一个 RAG 代理（45分钟）

**目标：** 创建一个能从你的文档中回答问题的代理

```bash
# 部署 RAG 模板
azd init --template azure-search-openai-demo
azd up

# 上传你的文档
# (按照模板的数据导入指南)

# 使用领域特定的问题进行测试
```

**成功标准：**
- [ ] 代理能从已上传文档中回答
- [ ] 响应包含引用
- [ ] 对于超出范围的问题无幻觉

---

## 📚 后续步骤

既然你已经了解了 AI 代理，请探索以下高级主题：

| 主题 | 描述 | 链接 |
|-------|-------------|------|
| **多代理系统** | 构建具有多个协作代理的系统 | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **协调模式** | 学习编排和通信模式 | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **生产部署** | 企业级代理部署 | [Production AI Practices](production-ai-practices.md) |
| **代理评估** | 测试和评估代理性能 | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 附加资源

### 官方文档
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI 助手 API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel（Agent 框架）](https://learn.microsoft.com/semantic-kernel/)

### 用于代理的 AZD 模板
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### 社区资源
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**导航**
- **Previous Lesson**: [AI Model Deployment](ai-model-deployment.md)
- **Next Lesson**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译。尽管我们力求准确，但请注意自动翻译可能包含错误或不准确之处。原文（以其母语撰写的版本）应被视为权威来源。对于关键信息，建议采用专业人工翻译。我们不对因使用本翻译而导致的任何误解或曲解承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Examples - Practical AZD Templates and Configurations

**Learning by Example - Organized by Chapter**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Chapter Mapping**: Examples organized by learning complexity
- **🚀 Local Example**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 External AI Examples**: Links to Azure Samples repositories

> **📍 IMPORTANT: Local vs External Examples**  
> This repository contains **4 complete local examples** with full implementations:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 deployment with chat interface)  
> - **Container Apps** (Simple Flask API + Microservices)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Enterprise AI Solution)  
>  
> Additional examples are **external references** to Azure-Samples repositories that you can clone.

## Introduction

This directory provides practical examples and references to help you learn Azure Developer CLI through hands-on practice. The Retail Multi-Agent scenario is a complete, production-ready implementation included in this repository. Additional examples reference official Azure Samples that demonstrate various AZD patterns.

### Complexity Rating Legend

- ⭐ **Beginner** - Basic concepts, single service, 15-30 minutes
- ⭐⭐ **Intermediate** - Multiple services, database integration, 30-60 minutes
- ⭐⭐⭐ **Advanced** - Complex architecture, AI integration, 1-2 hours
- ⭐⭐⭐⭐ **Expert** - Production-ready, enterprise patterns, 2+ hours

## 🎯 What's Actually in This Repository

### ✅ Local Implementation (Ready to Use)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**Complete gpt-4.1 deployment with chat interface included in this repo**

- **Location:** `examples/azure-openai-chat/`
- **Complexity:** ⭐⭐ (Intermediate)
- **What's Included:**
  - Complete Microsoft Foundry Models deployment (gpt-4.1)
  - Python command-line chat interface
  - Key Vault integration for secure API keys
  - Bicep infrastructure templates
  - Token usage and cost tracking
  - Rate limiting and error handling

**Quick Start:**
```bash
# ਉਦਾਹਰਨ ਫੋਲਡਰ ਵਿੱਚ ਜਾਓ
cd examples/azure-openai-chat

# ਸਭ ਕੁਝ ਡਿਪਲੋਏ ਕਰੋ
azd up

# ਨਿਰਭਰਤਾਵਾਂ ਇੰਸਟਾਲ ਕਰੋ ਅਤੇ ਗੱਲਬਾਤ ਸ਼ੁਰੂ ਕਰੋ
pip install -r src/requirements.txt
python src/chat.py
```

**Technologies:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Comprehensive container deployment examples included in this repo**

- **Location:** `examples/container-app/`
- **Complexity:** ⭐-⭐⭐⭐⭐ (Beginner to Advanced)
- **What's Included:**
  - [Master Guide](container-app/README.md) - Complete overview of container deployments
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Basic REST API example
  - [Microservices Architecture](../../../examples/container-app/microservices) - Production-ready multi-service deployment
  - Quick Start, Production, and Advanced patterns
  - Monitoring, security, and cost optimization

**Quick Start:**
```bash
# ਮਾਸਟਰ ਗਾਈਡ ਵੇਖੋ
cd examples/container-app

# ਸਧਾਰਨ Flask API ਤੈਨਾਤ ਕਰੋ
cd simple-flask-api
azd up

# ਮਾਈਕਰੋਸਰਵਿਸਿਜ਼ ਉਦਾਹਰਣ ਤੈਨਾਤ ਕਰੋ
cd ../microservices
azd up
```

**Technologies:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Complete production-ready implementation included in this repo**

- **Location:** `examples/retail-multiagent-arm-template/`
- **Complexity:** ⭐⭐⭐⭐ (Advanced)
- **What's Included:**
  - Complete ARM deployment template
  - Multi-agent architecture (Customer + Inventory)
  - Microsoft Foundry Models integration
  - AI Search with RAG
  - Comprehensive monitoring
  - One-click deployment script

**Quick Start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologies:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 External Azure Samples (Clone to Use)

The following examples are maintained in official Azure-Samples repositories. Clone them to explore different AZD patterns:

### Simple Applications (Chapters 1-2)

| Template | Repository | Complexity | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**How to use:**
```bash
# ਕਿਸੇ ਵੀ ਉਦਾਹਰਨ ਨੂੰ ਕਲੋਨ ਕਰੋ
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# ਤੈਨਾਤ ਕਰੋ
azd up
```

### AI Application Examples (Chapters 2, 5, 8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Basic AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG pattern |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & Advanced Patterns (Chapters 3-8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database integration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Learning Goals

By working through these examples, you will:
- Practice Azure Developer CLI workflows with realistic application scenarios
- Understand different application architectures and their azd implementations
- Master Infrastructure as Code patterns for various Azure services
- Apply configuration management and environment-specific deployment strategies
- Implement monitoring, security, and scaling patterns in practical contexts
- Build experience with troubleshooting and debugging real deployment scenarios

## Learning Outcomes

Upon completing these examples, you will be able to:
- Deploy various application types using Azure Developer CLI confidently
- Adapt provided templates to your own application requirements
- Design and implement custom infrastructure patterns using Bicep
- Configure complex multi-service applications with proper dependencies
- Apply security, monitoring, and performance best practices in real scenarios
- Troubleshoot and optimize deployments based on practical experience

## Directory Structure

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Quick Start Examples

> **💡 New to AZD?** Start with example #1 (Flask API) - it takes ~20 minutes and teaches core concepts.

### For Beginners
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Deploy a simple REST API with scale-to-zero  
   **Time:** 20-25 minutes | **Cost:** $0-5/month  
   **You'll Learn:** Basic azd workflow, containerization, health probes  
   **Expected Outcome:** Working API endpoint returning "Hello, World!" with monitoring

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Deploy a Node.js Express web application with MongoDB  
   **Time:** 25-35 minutes | **Cost:** $10-30/month  
   **You'll Learn:** Database integration, environment variables, connection strings  
   **Expected Outcome:** Todo list app with create/read/update/delete functionality

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host a React static website with Azure Static Web Apps  
   **Time:** 20-30 minutes | **Cost:** $0-10/month  
   **You'll Learn:** Static hosting, serverless functions, CDN deployment  
   **Expected Outcome:** React UI with API backend, automatic SSL, global CDN

### For Intermediate Users
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Deploy gpt-4.1 with chat interface and secure API key management  
   **Time:** 35-45 minutes | **Cost:** $50-200/month  
   **You'll Learn:** Microsoft Foundry Models deployment, Key Vault integration, token tracking  
   **Expected Outcome:** Working chat application with gpt-4.1 and cost monitoring

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Production-ready multi-service architecture  
   **Time:** 45-60 minutes | **Cost:** $50-150/month  
   **You'll Learn:** Service communication, message queuing, distributed tracing  
   **Expected Outcome:** 2-service system (API Gateway + Product Service) with monitoring

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web application with C# API and Azure SQL Database  
   **Time:** 30-45 minutes | **Cost:** $20-80/month  
   **You'll Learn:** Entity Framework, database migrations, connection security  
   **Expected Outcome:** C# API with Azure SQL backend, automatic schema deployment

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions with HTTP triggers and Cosmos DB  
   **Time:** 30-40 minutes | **Cost:** $10-40/month  
   **You'll Learn:** Event-driven architecture, serverless scaling, NoSQL integration  
   **Expected Outcome:** Function app responding to HTTP requests with Cosmos DB storage

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service Java application with Container Apps and API gateway  
   **Time:** 60-90 minutes | **Cost:** $80-200/month  
   **You'll Learn:** Spring Boot deployment, service mesh, load balancing  
   **Expected Outcome:** Multi-service Java system with service discovery and routing

### Microsoft Foundry Templates

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Complete gpt-4.1 deployment with chat interface  
   **Time:** 35-45 minutes | **Cost:** $50-200/month  
   **Expected Outcome:** Working chat application with token tracking and cost monitoring

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chat application with RAG architecture  
   **Time:** 60-90 minutes | **Cost:** $100-300/month  
   **Expected Outcome:** RAG-powered chat interface with document search and citations

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Document analysis using Azure AI services  
   **Time:** 40-60 minutes | **Cost:** $20-80/month  
   **Expected Outcome:** API extracting text, tables, and entities from uploaded documents

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps workflow with Azure Machine Learning  
   **Time:** 2-3 hours | **Cost:** $150-500/month  
   **Expected Outcome:** Automated ML pipeline with training, deployment, and monitoring

### Real-World Scenarios

#### **Retail Multi-Agent Solution** 🆕
**[Complete Implementation Guide](./retail-scenario.md)**

A comprehensive, production-ready multi-agent customer support solution that demonstrates enterprise-grade AI application deployment with AZD. This scenario provides:
- **ਪੂਰਾ ਆਰਕੀਟੈਕਚਰ**: ਵਿਸ਼ੇਸ਼ਕਰਤੀ ਗਾਹਕ ਸੇਵਾ ਅਤੇ ਇਨਵੈਂਟਰੀ ਪ੍ਰਬੰਧਨ ਏਜੰਟਾਂ ਨਾਲ ਬਹੁ-ਏਜੰਟ ਸਿਸਟਮ
- **ਉਤਪਾਦਨ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ**: ਬਹੁ-ਖੇਤਰ Microsoft Foundry Models ਡਿਪਲੋਇਮੈਂਟਸ, AI Search, Container Apps, ਅਤੇ ਵਿਸ਼ਤ੍ਰਿਤ ਮਾਨੀਟਰਿੰਗ
- **ਤੁਰੰਤ-ਤਿਆਰ ARM ਟੈਮਪਲੇਟ**: ਇੱਕ-ਕਲਿੱਕ ਡਿਪਲੋਇਮੈਂਟ ਕਈ ਸੰਰਚਨਾ ਮੋਡਾਂ ਨਾਲ (Minimal/Standard/Premium)
- **ਉੱਨਤ ਫੀਚਰ**: ਰੈਡ ਟੀਮਿੰਗ ਸੁਰੱਖਿਆ ਪ੍ਰਮਾਣਿਕਤਾ, ਏਜੰਟ ਮੁਲਾਂਕਣ ਫਰੇਮਵਰਕ, ਲਾਗਤ ਅਪਟੀਮਾਈਜੇਸ਼ਨ, ਅਤੇ ਟਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ
- **ਅਸਲ ਕਾਰੋਬਾਰੀ ਪਰਿਸ਼ਤਭੂਮੀ**: ਰਿਟੇਲਰ ਗਾਹਕ ਸਮਰਥਨ ਇਸਤੇਮਾਲ ਕੇਸ ਫਾਇਲ ਅੱਪਲੋਡ, ਖੋਜ ਇੰਟੀਗ੍ਰੇਸ਼ਨ, ਅਤੇ ਡਾਇਨਾਮਿਕ ਸਕੇਲਿੰਗ ਦੇ ਨਾਲ

**ਟੈਕਨੋਲੋਜੀਆਂ**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**ਜਟਿਲਤਾ**: ⭐⭐⭐⭐ (ਉੱਨਤ - ਐਨਟਰਪ੍ਰਾਈਜ਼ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ)

**ਲਈ ਉੱਤਮ**: AI ਡਿਵੈਲਪਰ, ਸੋਲਿਊਸ਼ਨ ਆਰਕੀਟੈਕਟ, ਅਤੇ ਟੀਮਾਂ ਜੋ ਪ੍ਰੋਡਕਸ਼ਨ ਬਹੁ-ਏਜੰਟ ਸਿਸਟਮ ਬਣਾਉਂਦੀਆਂ ਹਨ

**ਤੁਰੰਤ ਸ਼ੁਰੂ**: ਸ਼ਾਮِل ARM ਟੈਮਪਲੇਟ ਦੀ ਵਰਤੋਂ ਨਾਲ ਪੂਰਾ ਹੱਲ 30 ਮਿੰਟ ਤੋਂ ਘੱਟ ਸਮੇਂ ਵਿੱਚ ਡਿਪਲੋਇ ਕਰੋ `./deploy.sh -g myResourceGroup`

## 📋 ਵਰਤੋਂ ਦੇ ਨਿਰਦੇਸ਼

### ਜਰੂਰੀ ਸ਼ਰਤਾਂ

Before running any example:
- ✅ Azure subscription with Owner or Contributor access
- ✅ Azure Developer CLI installed ([Installation Guide](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop running (for container examples)
- ✅ Appropriate Azure quotas (check example-specific requirements)

> **💰 ਲਾਗਤ ਚੇਤਾਵਨੀ:** ਸਾਰੇ ਉਦਾਹਰਣ ਅਸਲ Azure ਸਰੋਤ ਬਣਾਉਂਦੇ ਹਨ ਜੋ ਖਰਚ ਪੈਦਾ ਕਰਦੇ ਹਨ। ਲਾਗਤ ਦੇ ਅੰਦਾਜ਼ੇ ਲਈ ਇਨ੍ਹਾ README ਫਾਈਲਾਂ ਨੂੰ ਦੇਖੋ। ਜਾਰੀ ਖਰਚ ਤੋਂ ਬਚਣ ਲਈ ਕੰਮ ਮੁਕੰਮਲ ਹੋਣ 'ਤੇ `azd down` ਚਲਾਉਣਾ ਯਾਦ ਰੱਖੋ।

### ਲੋਕਲ 'ਤੇ ਉਦਾਹਰਣ ਚਲਾਉਣਾ

1. **ਕਲੋਨ ਜਾਂ ਨਕਲ ਕਰੋ ਉਦਾਹਰਣ**
   ```bash
   # ਚਾਹੀਦੀ ਉਦਾਹਰਣ ਤੇ ਜਾਓ
   cd examples/simple-web-app
   ```

2. **AZD ਵਾਤਾਵਰਣ ਸ਼ੁਰੂ ਕਰੋ**
   ```bash
   # ਮੌਜੂਦਾ ਟੈਮਪਲੇਟ ਨਾਲ ਆਰੰਭ ਕਰੋ
   azd init
   
   # ਜਾਂ ਨਵਾਂ ਵਾਤਾਵਰਣ ਬਣਾਓ
   azd env new my-environment
   ```

3. **ਵਾਤਾਵਰਣ ਸੰਰਚਨਾ ਕਰੋ**
   ```bash
   # ਲੋੜੀਂਦੇ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **ਡਿਪਲੋਇ ਕਰੋ**
   ```bash
   # ਇਨਫ੍ਰਾਸਟ੍ਰਕਚਰ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਤੈਨਾਤ ਕਰੋ
   azd up
   ```

5. **ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਜਾਂਚ ਕਰੋ**
   ```bash
   # ਸੇਵਾ ਦੇ ਐਂਡਪੌਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
   azd env get-values
   
   # ਐਂਡਪੌਇੰਟ ਦੀ ਜਾਂਚ ਕਰੋ (ਉਦਾਹਰਨ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **ਉਮੀਦ ਕੀਤੀਆਂ ਸਫਲਤਾ ਸੰਕੇਤਕ ਚੀਜ਼ਾਂ:**
   - ✅ `azd up` ਬਿਨਾਂ ਗ਼ਲਤੀਆਂ ਦੇ ਪੂਰਾ ਹੋਣਾ
   - ✅ ਸੇਵਾ endpoint HTTP 200 ਰਿਟਰਨ ਕਰਦਾ ਹੈ
   - ✅ Azure Portal "ਚਲ ਰਿਹਾ" ਦਰਸਾਂਦਾ ਹੈ
   - ✅ Application Insights ਟੈਲੀਮੇਟਰੀ ਪ੍ਰਾਪਤ ਕਰ ਰਿਹਾ ਹੈ

> **⚠️ ਸਮੱਸਿਆ ਆ ਰਹੀ ਹੈ?** ਡਿਪਲੋਇਮੈਂਟ ਟਰਬਲਸ਼ੂਟਿੰਗ ਲਈ [Common Issues](../docs/chapter-07-troubleshooting/common-issues.md) ਵੇਖੋ

### ਉਦਾਹਰਣਾਂ ਨੂੰ ਅਨੁਕੂਲ ਬਣਾਉਣਾ

ਹਰ ਉਦਾਹਰਣ ਵਿੱਚ ਸ਼ਾਮਲ ਹਨ:
- **README.md** - ਵਿਸਥਾਰ ਨਾਲ ਸੈਟਅਪ ਅਤੇ ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਨਿਰਦੇਸ਼
- **azure.yaml** - ਟਿੱਪਣੀਆਂ ਦੇ ਨਾਲ AZD ਸੰਰਚਨਾ
- **infra/** - ਪੈਰਾਮੀਟਰ ਵਿਆਖਿਆ ਨਾਲ Bicep ਟੈਮਪਲੇਟ
- **src/** - ਨਮੂਨਾ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ
- **scripts/** - ਆਮ ਕਾਰਜਾਂ ਲਈ ਹੈਲਪਰ ਸਕ੍ਰਿਪਟਾਂ

## 🎯 ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

### ਉਦਾਹਰਣ ਵਰਗ

#### **ਬੁਨਿਆਦੀ ਡਿਪਲੋਇਮੈਂਟਸ**
- ਇਕ-ਸੇਵਾ ਐਪਲੀਕੇਸ਼ਨ
- ਸਧਾਰਨ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਪੈਟਰਨ
- ਬੁਨਿਆਦੀ ਸੰਰਚਨਾ ਪ੍ਰਬੰਧਨ
- ਲਾਗਤ-ਕੁਸ਼ਲ ਵਿਕਾਸ ਸੈਟਅਪ

#### **ਉੱਨਤ ਦ੍ਰਿਸ਼**
- ਬਹੁ-ਸੇਵਾ ਆਰਕੀਟੈਕਚਰ
- ਜਟਿਲ ਨੈਟਵਰਕਿੰਗ ਸੰਰਚਨਾਵਾਂ
- ਡਾਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਪੈਟਰਨ
- ਸੁਰੱਖਿਆ ਅਤੇ ਅਨੁਕੂਲਤਾ ਨਿਰਮਾਣ

#### **ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਪੈਟਰਨ**
- ਉੱਚ ਉਪਲਬਧਤਾ ਸੰਰਚਨਾਵਾਂ
- ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਨਿਰੀਖਣਯੋਗਤਾ
- CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- ਡਿਜਾਸਟਰ ਰਿਕਵਰੀ ਸੈਟਅਪ

## 📖 ਉਦਾਹਰਣ ਵੇਰਵੇ

### ਸਧਾਰਨ ਵੈੱਬ ਐਪ - Node.js Express
**ਟੈਕਨੋਲੋਜੀਆਂ**: Node.js, Express, MongoDB, Container Apps  
**ਜਟਿਲਤਾ**: ਬਿਗਿਨਰ  
**ਸੰਕਲਪ**: ਬੁਨਿਆਦੀ ਡਿਪਲੋਇਮੈਂਟ, REST API, NoSQL ਡਾਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ

### ਸਟੈਟਿਕ ਵੈਬਸਾਈਟ - React SPA
**ਟੈਕਨੋਲੋਜੀਆਂ**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**ਜਟਿਲਤਾ**: ਬਿਗਿਨਰ  
**ਸੰਕਲਪ**: ਸਟੈਟਿਕ ਹੋਸਟਿੰਗ, ਸਰਵਰਲੈੱਸ ਬੈਕਐਂਡ, ਆਧੁਨਿਕ ਵੈਬ ਡਿਵੈਲਪਮੈਂਟ

### Container App - Python Flask
**ਟੈਕਨੋਲੋਜੀਆਂ**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**ਜਟਿਲਤਾ**: ਬਿਗਿਨਰ  
**ਸੰਕਲਪ**: ਕੰਟੇਨਰਾਈਜ਼ੇਸ਼ਨ, REST API, ਸਕੇਲ-ਟੂ-ਜ਼ੀਰੋ, ਹੈਲਥ ਪ੍ਰੋਬਸ, ਮਾਨੀਟਰਿੰਗ  
**Location**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - ਮਾਈਕ੍ਰੋਸਰਵਿਸ ਆਰਕੀਟੈਕਚਰ
**ਟੈਕਨੋਲੋਜੀਆਂ**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**ਜਟਿਲਤਾ**: ਉੱਨਤ  
**ਸੰਕਲਪ**: ਬਹੁ-ਸੇਵਾ ਆਰਕੀਟੈਕਚਰ, ਸੇਵਾ ਸੰਚਾਰ, ਮੈਸੇਜ ਕਿਊਇੰਗ, ਵੰਡਿਆ ਟਰੈਸਿੰਗ  
**Location**: [Local Example](../../../examples/container-app/microservices)

### ਡੈਟਾਬੇਸ ਐਪ - C# ਨਾਲ Azure SQL
**ਟੈਕਨੋਲੋਜੀਆਂ**: C# ASP.NET Core, Azure SQL Database, App Service  
**ਜਟਿਲਤਾ**: ਵਿਚਕਾਰਲੀ  
**ਸੰਕਲਪ**: Entity Framework, ਡਾਟਾਬੇਸ ਕਨੈਕਸ਼ਨ, ਵੈੱਬ API ਵਿਕਾਸ

### ਸਰਵਰਲੈੱਸ ਫੰਕਸ਼ਨ - Python Azure Functions
**ਟੈਕਨੋਲੋਜੀਆਂ**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**ਜਟਿਲਤਾ**: ਵਿਚਕਾਰਲੀ  
**ਸੰਕਲਪ**: ਘਟਨਾ-ਚਾਲਿਤ ਆਰਕੀਟੈਕਚਰ, ਸਰਵਰਲੈੱਸ ਕੰਪਿਊਟਿੰਗ, ਫੁਲ-ਸਟੈਕ ਡਿਵੈਲਪਮੈਂਟ

### ਮਾਈਕ੍ਰੋਸਰਵਿਸ - Java Spring Boot
**ਟੈਕਨੋਲੋਜੀਆਂ**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**ਜਟਿਲਤਾ**: ਵਿਚਕਾਰਲੀ  
**ਸੰਕਲਪ**: ਮਾਈਕ੍ਰੋਸਰਵਿਸਿਸ ਸੰਚਾਰ, ਵੰਡੇ ਹੋਏ ਪ੍ਰਣਾਲੀ, ਐਨਟਰਪ੍ਰਾਈਜ਼ ਪੈਟਰਨ

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**ਟੈਕਨੋਲੋਜੀਆਂ**: Microsoft Foundry Models, Cognitive Search, App Service  
**ਜਟਿਲਤਾ**: ਵਿਚਕਾਰਲੀ  
**ਸੰਕਲਪ**: RAG ਆਰਕੀਟੈਕਚਰ, ਵੇਕਟਰ ਖੋਜ, LLM ਇੰਟੀਗ੍ਰੇਸ਼ਨ

#### AI Document Processing
**ਟੈਕਨੋਲੋਜੀਆਂ**: Azure AI Document Intelligence, Storage, Functions  
**ਜਟਿਲਤਾ**: ਵਿਚਕਾਰਲੀ  
**ਸੰਕਲਪ**: ਦਸਤावेਜ਼ ਵਿਸ਼ਲੇਸ਼ਣ, OCR, ਡੇਟਾ ਨਿਕਾਅ

#### ਮਸ਼ੀਨ ਲਰਨਿੰਗ ਪਾਈਪਲਾਈਨ
**ਟੈਕਨੋਲੋਜੀਆਂ**: Azure ML, MLOps, Container Registry  
**ਜਟਿਲਤਾ**: ਉੱਨਤ  
**ਸੰਕਲਪ**: ਮਾਡਲ ਟ੍ਰੇਨਿੰਗ, ਡਿਪਲੋਇਮੈਂਟ ਪਾਈਪਲਾਈਨ, ਮਾਨੀਟਰਿੰਗ

## 🛠 ਸੰਰਚਨਾ ਉਦਾਹਰਣ

The `configurations/` directory contains reusable components:

### ਵਾਤਾਵਰਣ ਸੰਰਚਨਾਵਾਂ
- ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਸੈਟਿੰਗਜ਼
- ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ ਸੰਰਚਨਾਵਾਂ
- ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਸੰਰਚਨਾਵਾਂ
- ਬਹੁ-ਖੇਤਰ ਡਿਪਲੋਇਮੈਂਟ ਸੈਟਅਪ

### Bicep ਮੋਡੀਊਲ
- ਦੁਬਾਰਾ ਵਰਤਣ ਯੋਗ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਕੰਪੋਨੈਂਟ
- ਆਮ ਰਿਸੋਰਸ ਪੈਟਰਨ
- ਸੁਰੱਖਿਆ-ਸਖਤ ਟੈਮਪਲੇਟ
- ਲਾਗਤ-ਅਪਟੀਮਾਈਜ਼ਡ ਸੰਰਚਨਾਵਾਂ

### ਹੈਲਪਰ ਸਕ੍ਰਿਪਟ
- ਵਾਤਾਵਰਣ ਸੈਟਅਪ ਆਟੋਮੇਸ਼ਨ
- ਡਾਟਾਬੇਸ ਮਾਈਗਰੇਸ਼ਨ ਸਕ੍ਰਿਪਟ
- ਡਿਪਲੋਇਮੈਂਟ ਵੈਲਿਡੇਸ਼ਨ ਟੂਲ
- ਲਾਗਤ ਨਿਰੀਖਣ ਯੂਟਿਲਿਟੀਜ਼

## 🔧 ਕਸਟਮਾਈਜੇਸ਼ਨ ਗਾਈਡ

### ਆਪਣੇ ਇਸਤੇਮਾਲ ਮਾਮਲੇ ਲਈ ਉਦਾਹਰਣ ਅਨੁਕੂਲ ਬਣਾਉਣਾ

1. **ਪੂਰਵ-ਸ਼ਰਤਾਂ ਦੀ ਸਮੀਖਿਆ ਕਰੋ**
   - Azure ਸੇਵਾ ਦੀਆਂ ਲੋੜਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
   - ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੀਮਾਵਾਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
   - ਲਾਗਤ ਦੇ ਪ੍ਰਭਾਅ ਨੂੰ ਸਮਝੋ

2. **ਸੰਰਚਨਾ ਸੋਧੋ**
   - `azure.yaml` ਸਰਵਿਸ ਪਰਿਭਾਸ਼ਾਵਾਂ ਅੱਪਡੇਟ ਕਰੋ
   - Bicep ਟੈਮਪਲੇਟ ਕਸਟਮਾਈਜ਼ ਕਰੋ
   - ਵਾਤਾਵਰਣ ਵੇਰੀਏਬਲ ਐਡਜਸਟ ਕਰੋ

3. **ਪੂਰੀ ਤਰ੍ਹਾਂ ਟੈਸਟ ਕਰੋ**
   - ਪਹਿਲਾਂ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਵਿੱਚ ਡਿਪਲੋਇ ਕਰੋ
   - ਕਾਰਗੁਜ਼ਾਰੀ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
   - ਸਕੇਲਿੰਗ ਅਤੇ ਕਾਰਗੁਜ਼ਾਰੀ ਦੀ ਚਾਂਲੁਣੀ ਕਰੋ

4. **ਸੁਰੱਖਿਆ ਸਮੀਖਿਆ**
   - ਐਕਸੈਸ ਕੰਟਰੋਲ ਦੀ ਸਮੀਖਿਆ ਕਰੋ
   - ਸੀਕ੍ਰੇਟਸ ਪ੍ਰਬੰਧਨ ਲਾਗੂ ਕਰੋ
   - ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਅਲਰਟਿੰਗ ਚਾਲੂ ਕਰੋ

## 📊 ਤੁਲਨਾਤਮਕ ਮੈਟਰਿਕਸ

| ਉਦਾਹਰਣ | ਸਰਵਿਸਜ਼ | ਡਾਟਾਬੇਸ | ਪ੍ਰਮਾਣਿਕਤਾ | ਮਾਨੀਟਰਿੰਗ | ਜਟਿਲਤਾ |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | ਪੂਰਾ | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | ਬੁਨਿਆਦੀ | ਪੂਰਾ | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | ਐਨਟਰਪ੍ਰਾਈਜ਼ | ਉੱਨਤ | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | ਬੁਨਿਆਦੀ | ਬੁਨਿਆਦੀ | ⭐ |
| React SPA + Functions | 3 | ✅ | ਬੁਨਿਆਦੀ | ਪੂਰਾ | ⭐ |
| Python Flask Container | 2 | ❌ | ਬੁਨਿਆਦੀ | ਪੂਰਾ | ⭐ |
| C# Web API + SQL | 2 | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐ |
| Java Microservices | 5+ | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | ਬੁਨਿਆਦੀ | ਪੂਰਾ | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **ਐਨਟਰਪ੍ਰਾਈਜ਼** | **ਉੱਨਤ** | **⭐⭐⭐⭐** |

## 🎓 ਸਿੱਖਣ ਦਾ ਰਸਤਾ

### ਸਿਫਾਰਸ਼ੀ ਪ੍ਰਗਟਿ ਰਾਹ

1. **ਸਧਾਰਨ ਵੈੱਬ ਐਪ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ**
   - ਮੂਲ AZD ਸੰਕਲਪ ਸਿੱਖੋ
   - ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋ ਸਮਝੋ
   - ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ ਦਾ ਅਭਿਆਸ ਕਰੋ

2. **ਸਟੈਟਿਕ ਵੈਬਸਾਈਟ ਨੂੰ ਕੋਸ਼ਿਸ਼ ਕਰੋ**
   - ਵੱਖ-ਵੱਖ ਹੋਸਟਿੰਗ ਵਿਕਲਪਾਂ ਦੀ ਖੋਜ ਕਰੋ
   - CDN ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਬਾਰੇ ਸਿੱਖੋ
   - DNS ਸੰਰਚਨਾ ਨੂੰ ਸਮਝੋ

3. **Container App ਵੱਲ ਵਧੋ**
   - ਕੰਟੇਨਰਾਈਜ਼ੇਸ਼ਨ ਦੀਆਂ ਬੁਨਿਆਦੀਆਂ ਸ਼ਿਖੋ
   - ਸਕੇਲਿੰਗ ਸੰਕਲਪ ਸਮਝੋ
   - Docker ਨਾਲ ਅਭਿਆਸ ਕਰੋ

4. **ਡਾਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਜੋੜੋ**
   - ਡਾਟਾਬੇਸ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਸਿੱਖੋ
   - ਕਨੈਕਸ਼ਨ ਸਟਰਿੰਗਸ ਨੂੰ ਸਮਝੋ
   - ਸੀਕ੍ਰੇਟਸ ਪ੍ਰਬੰਧਨ ਦਾ ਅਭਿਆਸ ਕਰੋ

5. **ਸਰਵਰਲੈੱਸ ਦੀ ਜਾਂਚ ਕਰੋ**
   - ਘਟਨਾ-ਚਾਲਿਤ ਆਰਕੀਟੈਕਚਰ ਨੂੰ ਸਮਝੋ
   - ਟਰਿੱਗਰ ਅਤੇ ਬਾਈਂਡਿੰਗ ਬਾਰੇ ਸ਼ਿਖੋ
   - APIs ਨਾਲ ਅਭਿਆਸ ਕਰੋ

6. **ਮਾਈਕ੍ਰੋਸਰਵਿਸ ਬਣਾਓ**
   - ਸੇਵਾ ਸੰਚਾਰ ਸਿੱਖੋ
   - ਵੰਡੇ ਹੋਏ ਪ੍ਰਣਾਲੀ ਨੂੰ ਸਮਝੋ
   - ਜਟਿਲ ਡਿਪਲੋਇਮੈਂਟ ਦਾ ਅਭਿਆਸ ਕਰੋ

## 🔍 ਸਹੀ ਉਦਾਹਰਣ ਲੱਭਣਾ

### ਟੈਕਨੋਲੋਜੀ ਸਟੈਕ ਮੁਤਾਬਕ
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### ਆਰਕੀਟੈਕਚਰ ਪੈਟਰਨ ਮੁਤਾਬਕ
- **ਸਧਾਰਨ REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **ਮੋਨੋਲੀਥਿਕ**: Node.js Express Todo, C# Web API + SQL
- **ਸਟੈਟਿਕ + ਸਰਵਰਲੈੱਸ**: React SPA + Functions, Python Functions + SPA
- **ਮਾਈਕ੍ਰੋਸਰਵਿਸ**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **ਕੰਟੇਨਰਾਈਜ਼ਡ**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-ਪਾਵਰਡ**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **ਬਹੁ-ਏਜੰਟ ਆਰਕੀਟੈਕਚਰ**: **Retail Multi-Agent Solution**
- **ਐਨਟਰਪ੍ਰਾਈਜ਼ ਬਹੁ-ਸੇਵਾ**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### ਜਟਿਲਤਾ ਪੱਧਰ ਮੁਤਾਬਕ
- **ਬਿਗਿਨਰ**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **ਵਿੱਚਕਾਰਲੀ**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **ਉੱਨਤ**: ML Pipeline
- **ਐਨਟਰਪ੍ਰਾਈਜ਼ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ**: [Microservices (Local)](../../../examples/container-app/microservices) (ਮੈਸੇਜ ਕਿਊਇੰਗ ਨਾਲ ਬਹੁ-ਸੇਵਾ), **Retail Multi-Agent Solution** (ARM ਟੈਮਪਲੇਟ ਡਿਪਲੋਇਮੈਂਟ ਨਾਲ ਪੂਰਾ ਬਹੁ-ਏਜੰਟ ਸਿਸਟਮ)

## 📚 ਵਾਧੂ ਸਰੋਤ

### ਦਸਤਾਵੇਜ਼ੀ ਲਿੰਕ
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### ਕਮਿਊਨਿਟੀ ਉਦਾਹਰਣ
- [Azure ਨਮੂਨੇ AZD ਟੈਮਪਲੇਟ](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry ਟੈਮपਲੇਟ](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI ਗੈਲਰੀ](https://azure.github.io/awesome-azd/)
- [Todo ਐਪ C# ਅਤੇ Azure SQL ਨਾਲ](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo ਐਪ Python ਅਤੇ MongoDB ਨਾਲ](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo ਐਪ Node.js ਅਤੇ PostgreSQL ਨਾਲ](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React ਵੈੱਬ ਐਪ C# API ਨਾਲ](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps ਜੌਬ](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java ਨਾਲ](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### ਉਤਮ ਅਭਿਆਸ
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 ਉਦਾਹਰਣਾਂ ਵਿੱਚ ਯੋਗਦਾਨ

ਕੀ ਤੁਹਾਡੇ ਕੋਲ ਸਾਂਝਾ ਕਰਨ ਲਈ ਕੋਈ ਉਪਯੋਗੀ ਉਦਾਹਰਣ ਹੈ? ਅਸੀਂ ਯੋਗਦਾਨਾਂ ਦਾ ਸਵਾਗਤ ਕਰਦੇ ਹਾਂ!

### ਜਮ੍ਹਾਂ ਕਰਨ ਲਈ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼
1. ਥਾਪਿਤ ਡਾਇਰੈਕਟਰੀ ਢਾਂਚੇ ਦੀ ਪਾਲਨਾ ਕਰੋ
2. ਵਿਆਪਕ README.md ਸ਼ਾਮਲ ਕਰੋ
3. ਕਨਫਿਗਰੇਸ਼ਨ ਫਾਇਲਾਂ ਵਿੱਚ ਟਿੱਪਣੀਆਂ ਸ਼ਾਮਲ ਕਰੋ
4. ਜਮ੍ਹਾਂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਬ੍ਰਹਿੱਤ ਤੌਰ 'ਤੇ ਟੈਸਟ ਕਰੋ
5. ਲਾਗਤ ਅੰਦਾਜ਼ੇ ਅਤੇ ਪਹਿਲਾਂ ਲਾਜ਼ਮੀ ਚੀਜ਼ਾਂ ਸ਼ਾਮਲ ਕਰੋ

### ਉਦਾਹਰਣ ਟੈਮਪਲੇਟ ਢਾਂਚਾ
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**ਪ੍ਰੋ ਟਿਪ**: ਆਪਣੇ ਤਕਨੀਕੀ ਸਟੈਕ ਨਾਲ ਮਿਲਦਾ ਸਭ ਤੋਂ ਸਧਾਰਣ ਉਦਾਹਰਣ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ, ਫਿਰ ਕ੍ਰਮਾਤਮਕ ਢੰਗ ਨਾਲ ਵਧੇਰੇ ਜਟਿਲ ਪਰਿਸਥਿਤੀਆਂ ਵੱਲ ਜਾਓ। ਹਰ ਉਦਾਹਰਣ ਪਹਿਲੀਆਂ ਵਾਲੀਆਂ ਧਾਰਣਾਵਾਂ 'ਤੇ ਆਧਾਰਤ ਹੁੰਦੀ ਹੈ!

## 🚀 ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਤਿਆਰ?

### ਤੁਹਾਡਾ ਸਿੱਖਣ ਰਸਤਾ

1. **ਬਿਲਕੁਲ ਸ਼ੁਰੂਆਤੀ?** → Start with [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 ਮਿੰਟ)
2. **ਕੀ ਤੁਹਾਨੂੰ ਬੁਨਿਆਦੀ AZD ਗਿਆਨ ਹੈ?** → Try [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 ਮਿੰਟ)
3. **AI ਐਪ ਬਣਾਉਣੇ ਹਨ?** → Start with [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 ਮਿੰਟ) or explore [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ ਘੰਟੇ)
4. **ਕੋਈ ਖਾਸ ਤਕਨਾਲੋਜੀ ਸਟੈਕ ਚਾਹੀਦਾ ਹੈ?** → Use [Finding the Right Example](#-finding-the-right-example) section above

### ਅਗਲੇ ਕਦਮ

- ✅ Review [Prerequisites](#ਜਰੂਰੀ-ਸ਼ਰਤਾਂ) above
- ✅ ਆਪਣੀ ਸੱਖਮਤਾ ਦੇ ਅਨੁਸਾਰ ਇੱਕ ਉਦਾਹਰਣ ਚੁਣੋ (ਵੇਖੋ [Complexity Legend](#complexity-rating-legend))
- ✅ ਤਿਆਰ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਉਦਾਹਰਣ ਦਾ README ਧਿਆਨ ਨਾਲ ਪੜ੍ਹੋ
- ✅ ਟੈਸਟ ਦੇ ਬਾਅਦ `azd down` ਚਲਾਉਣ ਲਈ ਯਾਦ ਦਿਓ
- ✅ ਆਪਣੇ ਤਜਰਬੇ ਨੂੰ GitHub Issues ਜਾਂ Discussions ਰਾਹੀਂ ਸਾਂਝਾ ਕਰੋ

### ਮਦਦ ਚਾਹੀਦੀ ਹੈ?

- 📖 [FAQ](../resources/faq.md) - ਆਮ ਪ੍ਰਸ਼ਨਾਂ ਦੇ ਉੱਤਰ
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - ਡਿਪਲੋਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਦੁਰੁਸਤ ਕਰੋ
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - ਕਮਿਊਨਿਟੀ ਨਾਲ ਪੁੱਛੋ
- 📚 [Study Guide](../resources/study-guide.md) - ਆਪਣੇ ਸਿੱਖਣ ਨੂੰ ਮਜ਼ਬੂਤ ਕਰੋ

---

**ਨੇਵੀਗੇਸ਼ਨ**
- **📚 ਕੋਰਸ ਮੁੱਖ**: [AZD For Beginners](../README.md)
- **📖 ਅਧਿਐਨ ਸਮੱਗਰੀ**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 ਸੰਸਾਧਨ**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*ਆਖਰੀ ਅਪਡੇਟ: ਨਵੰਬਰ 2025 | [ਮਸਲਿਆਂ ਦੀ ਰਿਪੋਰਟ](https://github.com/microsoft/AZD-for-beginners/issues) | [ਉਦਾਹਰਣਾਂ ਵਿੱਚ ਯੋਗਦਾਨ ਕਰੋ](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸੁਚਿੱਤਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੇਟਿਕ/ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸਥਿਰਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਵਜੋਂ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਉਤਪੰਨ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀ ਜਾਂ ਗਲਤ ਵਿਅਖਿਆ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
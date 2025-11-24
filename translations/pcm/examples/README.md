<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a896781acb2a7bebb3c4c66c4f46e7f",
  "translation_date": "2025-11-24T13:31:00+00:00",
  "source_file": "examples/README.md",
  "language_code": "pcm"
}
-->
# Examples - Practical AZD Templates and Configurations

**Learn wit Example - Arrange by Chapter**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Chapter Mapping**: Examples arrange by how hard e be to learn
- **🚀 Local Example**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 External AI Examples**: Links to Azure Samples repositories

> **📍 IMPORTANT: Local vs External Examples**  
> Dis repository get **4 complete local examples** wey dey fully implement:  
> - **Azure OpenAI Chat** (GPT-4 deployment wit chat interface)  
> - **Container Apps** (Simple Flask API + Microservices)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Enterprise AI Solution)  
>  
> Extra examples na **external references** to Azure-Samples repositories wey you fit clone.

## Introduction

Dis directory dey provide practical examples and references to help you sabi Azure Developer CLI through hands-on practice. Di Retail Multi-Agent scenario na complete, production-ready implementation wey dey dis repository. Extra examples dey reference official Azure Samples wey dey show different AZD patterns.

### Complexity Rating Legend

- ⭐ **Beginner** - Basic concepts, one service, 15-30 minutes
- ⭐⭐ **Intermediate** - Multiple services, database integration, 30-60 minutes
- ⭐⭐⭐ **Advanced** - Complex architecture, AI integration, 1-2 hours
- ⭐⭐⭐⭐ **Expert** - Production-ready, enterprise patterns, 2+ hours

## 🎯 Wetin Dey Inside Dis Repository

### ✅ Local Implementation (Ready to Use)

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**Complete GPT-4 deployment wit chat interface dey inside dis repo**

- **Location:** `examples/azure-openai-chat/`
- **Complexity:** ⭐⭐ (Intermediate)
- **Wetin Dey Inside:**
  - Complete Azure OpenAI deployment (GPT-4)
  - Python command-line chat interface
  - Key Vault integration for secure API keys
  - Bicep infrastructure templates
  - Token usage and cost tracking
  - Rate limiting and error handling

**Quick Start:**
```bash
# Waka go example
cd examples/azure-openai-chat

# Put everything for ground
azd up

# Install wetin e need and start to dey yarn
pip install -r src/requirements.txt
python src/chat.py
```

**Technologies:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Comprehensive container deployment examples dey inside dis repo**

- **Location:** `examples/container-app/`
- **Complexity:** ⭐-⭐⭐⭐⭐ (Beginner to Advanced)
- **Wetin Dey Inside:**
  - [Master Guide](container-app/README.md) - Complete overview of container deployments
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Basic REST API example
  - [Microservices Architecture](../../../examples/container-app/microservices) - Production-ready multi-service deployment
  - Quick Start, Production, and Advanced patterns
  - Monitoring, security, and cost optimization

**Quick Start:**
```bash
# See master guide
cd examples/container-app

# Put simple Flask API for ground
cd simple-flask-api
azd up

# Put microservices example for ground
cd ../microservices
azd up
```

**Technologies:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Complete production-ready implementation dey inside dis repo**

- **Location:** `examples/retail-multiagent-arm-template/`
- **Complexity:** ⭐⭐⭐⭐ (Advanced)
- **Wetin Dey Inside:**
  - Complete ARM deployment template
  - Multi-agent architecture (Customer + Inventory)
  - Azure OpenAI integration
  - AI Search wit RAG
  - Comprehensive monitoring
  - One-click deployment script

**Quick Start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologies:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 External Azure Samples (Clone to Use)

Di following examples dey official Azure-Samples repositories. Clone dem to explore different AZD patterns:

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
# Clone any example
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Deploy
azd up
```

### AI Application Examples (Chapters 2, 5, 8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 deployment |
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

As you dey work through dis examples, you go:
- Practice Azure Developer CLI workflows wit real application scenarios
- Understand different application architectures and dia azd implementations
- Master Infrastructure as Code patterns for different Azure services
- Apply configuration management and environment-specific deployment strategies
- Implement monitoring, security, and scaling patterns for practical use
- Build experience wit troubleshooting and debugging real deployment scenarios

## Learning Outcomes

When you finish dis examples, you go fit:
- Deploy different application types using Azure Developer CLI confidently
- Adapt di templates wey dem provide to your own application needs
- Design and implement custom infrastructure patterns using Bicep
- Configure complex multi-service applications wit correct dependencies
- Apply security, monitoring, and performance best practices for real scenarios
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

> **💡 New to AZD?** Start wit example #1 (Flask API) - e go take ~20 minutes and e go teach core concepts.

### For Beginners
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Deploy simple REST API wey fit scale-to-zero  
   **Time:** 20-25 minutes | **Cost:** $0-5/month  
   **You Go Learn:** Basic azd workflow, containerization, health probes  
   **Expected Outcome:** Working API endpoint wey dey return "Hello, World!" wit monitoring

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Deploy Node.js Express web application wit MongoDB  
   **Time:** 25-35 minutes | **Cost:** $10-30/month  
   **You Go Learn:** Database integration, environment variables, connection strings  
   **Expected Outcome:** Todo list app wey fit create/read/update/delete functionality

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host React static website wit Azure Static Web Apps  
   **Time:** 20-30 minutes | **Cost:** $0-10/month  
   **You Go Learn:** Static hosting, serverless functions, CDN deployment  
   **Expected Outcome:** React UI wit API backend, automatic SSL, global CDN

### For Intermediate Users
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Deploy GPT-4 wit chat interface and secure API key management  
   **Time:** 35-45 minutes | **Cost:** $50-200/month  
   **You Go Learn:** Azure OpenAI deployment, Key Vault integration, token tracking  
   **Expected Outcome:** Working chat application wit GPT-4 and cost monitoring

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Production-ready multi-service architecture  
   **Time:** 45-60 minutes | **Cost:** $50-150/month  
   **You Go Learn:** Service communication, message queuing, distributed tracing  
   **Expected Outcome:** 2-service system (API Gateway + Product Service) wit monitoring

6. **[Database App - C# wit Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web application wit C# API and Azure SQL Database  
   **Time:** 30-45 minutes | **Cost:** $20-80/month  
   **You Go Learn:** Entity Framework, database migrations, connection security  
   **Expected Outcome:** C# API wit Azure SQL backend, automatic schema deployment

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions wit HTTP triggers and Cosmos DB  
   **Time:** 30-40 minutes | **Cost:** $10-40/month  
   **You Go Learn:** Event-driven architecture, serverless scaling, NoSQL integration  
   **Expected Outcome:** Function app wey dey respond to HTTP requests wit Cosmos DB storage

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service Java application wit Container Apps and API gateway  
   **Time:** 60-90 minutes | **Cost:** $80-200/month  
   **You Go Learn:** Spring Boot deployment, service mesh, load balancing  
   **Expected Outcome:** Multi-service Java system wit service discovery and routing

### Azure AI Foundry Templates

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Complete GPT-4 deployment wit chat interface  
   **Time:** 35-45 minutes | **Cost:** $50-200/month  
   **Expected Outcome:** Working chat application wit token tracking and cost monitoring

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chat application wit RAG architecture  
   **Time:** 60-90 minutes | **Cost:** $100-300/month  
   **Expected Outcome:** RAG-powered chat interface wit document search and citations

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Document analysis using Azure AI services  
   **Time:** 40-60 minutes | **Cost:** $20-80/month  
   **Expected Outcome:** API wey dey extract text, tables, and entities from uploaded documents

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps workflow wit Azure Machine Learning  
   **Time:** 2-3 hours | **Cost:** $150-500/month  
   **Expected Outcome:** Automated ML pipeline wit training, deployment, and monitoring

### Real-World Scenarios

#### **Retail Multi-Agent Solution** 🆕
**[Complete Implementation Guide](./retail-scenario.md)**

A comprehensive, production-ready multi-agent customer support solution wey dey show enterprise-grade AI application deployment wit AZD. Dis scenario dey provide:

- **Complete Architecture**: Multi-agent system wit specialized customer service and inventory management agents
- **Production Infrastructure**: Multi-region Azure OpenAI deployments, AI Search, Container Apps, and full monitoring
- **Ready-to-Deploy ARM Template**: One-click deployment wey get different configuration modes (Minimal/Standard/Premium)
- **Advanced Features**: Red teaming security validation, agent evaluation framework, cost optimization, and troubleshooting guides
- **Real Business Context**: Retailer customer support use case wey get file uploads, search integration, and dynamic scaling

**Technologies**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Advanced - Enterprise Production Ready)

**Perfect for**: AI developers, solution architects, and teams wey dey build production multi-agent systems

**Quick Start**: Deploy di complete solution under 30 minutes using di included ARM template with `./deploy.sh -g myResourceGroup`

## 📋 Usage Instructions

### Prerequisites

Before you run any example:
- ✅ Azure subscription wey get Owner or Contributor access
- ✅ Azure Developer CLI don dey installed ([Installation Guide](../docs/getting-started/installation.md))
- ✅ Docker Desktop dey run (for container examples)
- ✅ Correct Azure quotas (check example-specific requirements)

> **💰 Cost Warning:** All di examples go create real Azure resources wey go cost money. Check di individual README files for cost estimates. Remember to run `azd down` when you finish to avoid extra costs.

### Running Examples Locally

1. **Clone or Copy Example**
   ```bash
   # Move go di example wey you wan
   cd examples/simple-web-app
   ```

2. **Initialize AZD Environment**
   ```bash
   # Start am wit template wey dey already
   azd init
   
   # Or make new environment
   azd env new my-environment
   ```

3. **Configure Environment**
   ```bash
   # Set di variables wey we need
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy**
   ```bash
   # Set up infrastructure and application
   azd up
   ```

5. **Verify Deployment**
   ```bash
   # Collect service endpoints
   azd env get-values
   
   # Test di endpoint (example)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Expected Success Indicators:**
   - ✅ `azd up` go complete without errors
   - ✅ Service endpoint go return HTTP 200
   - ✅ Azure Portal go show "Running" status
   - ✅ Application Insights go dey receive telemetry

> **⚠️ Issues?** Check [Common Issues](../docs/troubleshooting/common-issues.md) for deployment troubleshooting

### Adapting Examples

Each example get:
- **README.md** - Detailed setup and customization instructions
- **azure.yaml** - AZD configuration wey get comments
- **infra/** - Bicep templates wey get parameter explanations
- **src/** - Sample application code
- **scripts/** - Helper scripts for common tasks

## 🎯 Learning Objectives

### Example Categories

#### **Basic Deployments**
- Single-service applications
- Simple infrastructure patterns
- Basic configuration management
- Cost-effective development setups

#### **Advanced Scenarios**
- Multi-service architectures
- Complex networking configurations
- Database integration patterns
- Security and compliance implementations

#### **Production-Ready Patterns**
- High availability configurations
- Monitoring and observability
- CI/CD integration
- Disaster recovery setups

## 📖 Example Descriptions

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Beginner  
**Concepts**: Basic deployment, REST API, NoSQL database integration

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Beginner  
**Concepts**: Static hosting, serverless backend, modern web development

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Beginner  
**Concepts**: Containerization, REST API, scale-to-zero, health probes, monitoring  
**Location**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Advanced  
**Concepts**: Multi-service architecture, service communication, message queuing, distributed tracing  
**Location**: [Local Example](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Intermediate  
**Concepts**: Entity Framework, database connections, web API development

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Intermediate  
**Concepts**: Event-driven architecture, serverless computing, full-stack development

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Intermediate  
**Concepts**: Microservices communication, distributed systems, enterprise patterns

### Azure AI Foundry Examples

#### Azure OpenAI Chat App
**Technologies**: Azure OpenAI, Cognitive Search, App Service  
**Complexity**: Intermediate  
**Concepts**: RAG architecture, vector search, LLM integration

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Intermediate  
**Concepts**: Document analysis, OCR, data extraction

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Advanced  
**Concepts**: Model training, deployment pipelines, monitoring

## 🛠 Configuration Examples

The `configurations/` directory get reusable components:

### Environment Configurations
- Development environment settings
- Staging environment configurations
- Production-ready configurations
- Multi-region deployment setups

### Bicep Modules
- Reusable infrastructure components
- Common resource patterns
- Security-hardened templates
- Cost-optimized configurations

### Helper Scripts
- Environment setup automation
- Database migration scripts
- Deployment validation tools
- Cost monitoring utilities

## 🔧 Customization Guide

### Adapting Examples for Your Use Case

1. **Review Prerequisites**
   - Check Azure service requirements
   - Verify subscription limits
   - Understand cost implications

2. **Modify Configuration**
   - Update `azure.yaml` service definitions
   - Customize Bicep templates
   - Adjust environment variables

3. **Test Thoroughly**
   - Deploy to development environment first
   - Validate functionality
   - Test scaling and performance

4. **Security Review**
   - Review access controls
   - Implement secrets management
   - Enable monitoring and alerting

## 📊 Comparison Matrix

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Learning Path

### Recommended Progression

1. **Start with Simple Web App**
   - Learn basic AZD concepts
   - Understand deployment workflow
   - Practice environment management

2. **Try Static Website**
   - Explore different hosting options
   - Learn about CDN integration
   - Understand DNS configuration

3. **Move to Container App**
   - Learn containerization basics
   - Understand scaling concepts
   - Practice with Docker

4. **Add Database Integration**
   - Learn database provisioning
   - Understand connection strings
   - Practice secrets management

5. **Explore Serverless**
   - Understand event-driven architecture
   - Learn about triggers and bindings
   - Practice with APIs

6. **Build Microservices**
   - Learn service communication
   - Understand distributed systems
   - Practice complex deployments

## 🔍 Finding the Right Example

### By Technology Stack
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### By Architecture Pattern
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### By Complexity Level
- **Beginner**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (Complete multi-agent system with ARM template deployment)

## 📚 Additional Resources

### Documentation Links
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Examples
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App wit Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App wit C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions wit Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Best Practices
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribut Examples

You get beta example wey you wan share? We go happy to see am!

### Submission Guidelines
1. Follow di directory structure wey dem don already set
2. Put better README.md wey go explain well
3. Add comments for configuration files
4. Test am well well before you submit
5. Add cost estimate and wetin you go need before you start

### Example Template Structure
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

**Pro Tip**: Start wit di simplest example wey match your technology stack, den you fit dey move go more complex ones small small. Each example dey build on top di one wey you don already learn!

## 🚀 Ready to Start?

### Your Learning Path

1. **You be Complete Beginner?** → Start wit [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 mins)
2. **You sabi small AZD?** → Try [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 mins)
3. **You dey build AI Apps?** → Start wit [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 mins) or check [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hours)
4. **You need specific tech stack?** → Use [Finding the Right Example](../../../examples) section wey dey up

### Next Steps

- ✅ Check [Prerequisites](../../../examples) wey dey up
- ✅ Pick example wey match your skill level (see [Complexity Legend](../../../examples))
- ✅ Read di example README well before you deploy am
- ✅ Set reminder to run `azd down` after you don test finish
- ✅ Share your experience for GitHub Issues or Discussions

### Need Help?

- 📖 [FAQ](../resources/faq.md) - Answer to common questions
- 🐛 [Troubleshooting Guide](../docs/troubleshooting/common-issues.md) - Fix deployment wahala
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Ask di community
- 📚 [Study Guide](../resources/study-guide.md) - Make your learning strong

---

**Navigation**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Study Materials**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 Resources**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/troubleshooting/common-issues.md)

---

*Last Updated: November 2025 | [Report Issues](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribute Examples](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI transle-shun service [Co-op Translator](https://github.com/Azure/co-op-translator) do di transle-shun. Even as we dey try make am correct, abeg sabi say AI transle-shun fit get mistake or no dey accurate well. Di original dokyument for im native language na di one wey you go take as di correct source. For important mata, e better make professional human transle-shun dey use. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis transle-shun.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
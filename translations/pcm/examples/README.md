# Examples - Wetin Practical for AZD Templates and Konfigureshon

**Learn by Example - Dem Organize by Chapter**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Chapter Mapping**: Examples dem organize by how e dey hard
- **🚀 Local Example**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 External AI Examples**: Links go Azure Samples repositories

> **📍 IMPORTANT: Local vs External Examples**  
> Dis repository get **4 complete local examples** wey get full implementations:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 deployment with chat interface)  
> - **Container Apps** (Simple Flask API + Microservices)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Enterprise AI Solution)  
>  
> Extra examples na **external references** to Azure-Samples repositories wey you fit clone.

## Introduction

Dis directory dey provide practical examples and references to help you learn Azure Developer CLI through hands-on practice. The Retail Multi-Agent scenario na complete, production-ready implementation wey dey included for this repository. Extra examples dey reference official Azure Samples wey dey show different AZD patterns.

### Complexity Rating Legend

- ⭐ **Biginna** - Basic concepts, one service, 15-30 minutes
- ⭐⭐ **Intermediate** - Multiple services, database integration, 30-60 minutes
- ⭐⭐⭐ **Advanced** - Complex architecture, AI integration, 1-2 hours
- ⭐⭐⭐⭐ **Expert** - Production-ready, enterprise patterns, 2+ hours

## 🎯 Wetin Dey Inside This Repository

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
# Go to di example
cd examples/azure-openai-chat

# Deploy everytin
azd up

# Install di dependencies an start dey chat
pip install -r src/requirements.txt
python src/chat.py
```

**Technologies:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Comprehensive container deployment examples included in this repo**

- **Location:** `examples/container-app/`
- **Complexity:** ⭐-⭐⭐⭐⭐ (Biginna to Advanced)
- **What's Included:**
  - [Master Guide](container-app/README.md) - Complete overview of container deployments
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Basic REST API example
  - [Microservices Architecture](../../../examples/container-app/microservices) - Production-ready multi-service deployment
  - Quick Start, Production, and Advanced patterns
  - Monitoring, security, and cost optimization

**Quick Start:**
```bash
# See di master guide
cd examples/container-app

# Deploy di simple Flask API
cd simple-flask-api
azd up

# Deploy example wey dey show microservices
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

The following examples dem maintain for official Azure-Samples repositories. Clone dem to explore different AZD patterns:

### Simple Applications (Chapters 1-2)

| Template | Repo | Complexity | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**How to use:**
```bash
# Make copy of any example
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Put am live
azd up
```

### AI Application Examples (Chapters 2, 5, 8)

| Template | Repo | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Basic AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG pattern |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & Advanced Patterns (Chapters 3-8)

| Template | Repo | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database integration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Learning Goals

If you waka through these examples, you go:
- Practice Azure Developer CLI workflows with realistic application scenarios
- Understand different application architectures and how dem implement for azd
- Master Infrastructure as Code patterns for various Azure services
- Apply configuration management and environment-specific deployment strategies
- Implement monitoring, security, and scaling patterns for practical use
- Build experience with troubleshooting and debugging real deployment scenarios

## Learning Outcomes

After you finish these examples, you go fit:
- Deploy different application types using Azure Developer CLI with confidence
- Adapt the templates wey dem provide to your own app requirements
- Design and implement custom infrastructure patterns using Bicep
- Configure complex multi-service applications with correct dependencies
- Apply security, monitoring, and performance best practices for real scenarios
- Troubleshoot and optimize deployments based on real experience

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

> **💡 New to AZD?** Start with example #1 (Flask API) - e go take ~20 minutes and e go teach core concepts.

### For Beginners
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Deploy simple REST API wey fit scale-to-zero  
   **Time:** 20-25 minutes | **Cost:** $0-5/month  
   **You go Learn:** Basic azd workflow, containerization, health probes  
   **Expected Outcome:** Working API endpoint wey dey return "Hello, World!" with monitoring

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Deploy Node.js Express web app with MongoDB  
   **Time:** 25-35 minutes | **Cost:** $10-30/month  
   **You go Learn:** Database integration, environment variables, connection strings  
   **Expected Outcome:** Todo list app wey fit create/read/update/delete

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host React static website with Azure Static Web Apps  
   **Time:** 20-30 minutes | **Cost:** $0-10/month  
   **You go Learn:** Static hosting, serverless functions, CDN deployment  
   **Expected Outcome:** React UI with API backend, automatic SSL, global CDN

### For Intermediate Users
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Deploy gpt-4.1 with chat interface and secure API key management  
   **Time:** 35-45 minutes | **Cost:** $50-200/month  
   **You go Learn:** Microsoft Foundry Models deployment, Key Vault integration, token tracking  
   **Expected Outcome:** Working chat application with gpt-4.1 and cost monitoring

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Production-ready multi-service architecture  
   **Time:** 45-60 minutes | **Cost:** $50-150/month  
   **You go Learn:** Service communication, message queuing, distributed tracing  
   **Expected Outcome:** 2-service system (API Gateway + Product Service) with monitoring

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web app with C# API and Azure SQL Database  
   **Time:** 30-45 minutes | **Cost:** $20-80/month  
   **You go Learn:** Entity Framework, database migrations, connection security  
   **Expected Outcome:** C# API with Azure SQL backend, automatic schema deployment

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions with HTTP triggers and Cosmos DB  
   **Time:** 30-40 minutes | **Cost:** $10-40/month  
   **You go Learn:** Event-driven architecture, serverless scaling, NoSQL integration  
   **Expected Outcome:** Function app wey respond to HTTP requests with Cosmos DB storage

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service Java app with Container Apps and API gateway  
   **Time:** 60-90 minutes | **Cost:** $80-200/month  
   **You go Learn:** Spring Boot deployment, service mesh, load balancing  
   **Expected Outcome:** Multi-service Java system with service discovery and routing

### Microsoft Foundry Templates

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Complete gpt-4.1 deployment with chat interface  
   **Time:** 35-45 minutes | **Cost:** $50-200/month  
   **Expected Outcome:** Working chat app with token tracking and cost monitoring

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chat app with RAG architecture  
   **Time:** 60-90 minutes | **Cost:** $100-300/month  
   **Expected Outcome:** RAG-powered chat interface with document search and citations

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Document analysis using Azure AI services  
   **Time:** 40-60 minutes | **Cost:** $20-80/month  
   **Expected Outcome:** API wey dey extract text, tables, and entities from uploaded documents

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps workflow with Azure Machine Learning  
   **Time:** 2-3 hours | **Cost:** $150-500/month  
   **Expected Outcome:** Automated ML pipeline with training, deployment, and monitoring

### Real-World Scenarios

#### **Retail Multi-Agent Solution** 🆕  
**[Complete Implementation Guide](./retail-scenario.md)**

Na comprehensive, production-ready multi-agent customer support solution wey dey show enterprise-grade AI application deployment with AZD. Dis scenario dey provide:
- **Complete Architecture**: Multi-agent system wey get special customer service agents and inventory management agents
- **Production Infrastructure**: Multi-region Microsoft Foundry Models deployments, AI Search, Container Apps, and comprehensive monitoring
- **Ready-to-Deploy ARM Template**: One-click deployment wit multiple configuration modes (Minimal/Standard/Premium)
- **Advanced Features**: Red teaming security validation, agent evaluation framework, cost optimization, and troubleshooting guides
- **Real Business Context**: Retailer customer support use case wey get file uploads, search integration, and dynamic scaling

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Advanced - Enterprise Production Ready)

**Perfect for**: AI developers, solution architects, and teams wey dey build production multi-agent systems

**Quick Start**: Deploy the complete solution in under 30 minutes using the included ARM template with `./deploy.sh -g myResourceGroup`

## 📋 Usage Instructions

### Prerequisites

Bifo you run any example:
- ✅ Azure subscription wey get Owner or Contributor access
- ✅ Azure Developer CLI installed ([Guide to install](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop dey run (na for container examples)
- ✅ Correct Azure quotas (check example-specific requirements)

> **💰 Cost Warning:** All examples go create real Azure resources wey go dey incur charges. Check each README file for how much e fit cost. Make you remember to run `azd down` when you finish to avoid ongoing charges.

### Running Examples Locally

1. **Clone or Copy Example**
   ```bash
   # Go to the example wey you want
   cd examples/simple-web-app
   ```

2. **Initialize AZD Environment**
   ```bash
   # Start wit di existing template
   azd init
   
   # Or make new environment
   azd env new my-environment
   ```

3. **Configure Environment**
   ```bash
   # Set di variables wey dem need
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy**
   ```bash
   # Deploy di infrastructure and di application
   azd up
   ```

5. **Verify Deployment**
   ```bash
   # Grab di service endpoints
   azd env get-values
   
   # Test di endpoint (na example)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Expected Success Indicators:**
   - ✅ `azd up` finish without errors
   - ✅ Service endpoint go return HTTP 200
   - ✅ Azure Portal go show "Running" status
   - ✅ Application Insights dey receive telemetry

> **⚠️ Wahala?** See [Common Issues](../docs/chapter-07-troubleshooting/common-issues.md) for deployment troubleshooting

### Adapting Examples

Each example get:
- **README.md** - Detailed setup and customization instructions
- **azure.yaml** - AZD configuration wit comments
- **infra/** - Bicep templates wit parameter explanations
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

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Cognitive Search, App Service  
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
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
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

### By Architecture Pattern
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### By Complexity Level
- **Beginner**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (Complete multi-agent system with ARM template deployment)

## 📚 Additional Resources

### Documentation Links
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Examples
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Best Practices
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contributing Examples

You get useful example wey you wan share? We dey welcome contributions!

### Submission Guidelines
1. Follow the established directory structure
2. Include comprehensive README.md
3. Add comments to configuration files
4. Test thoroughly before submitting
5. Include cost estimates and prerequisites

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

**Pro Tip**: Start with the simplest example that matches your technology stack, then gradually work your way up to more complex scenarios. Each example builds on concepts from the previous ones!

## 🚀 Ready to Start?

### Your Learning Path

1. **Complete Beginner?** → Start with [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 mins)
2. **Have Basic AZD Knowledge?** → Try [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 mins)
3. **Building AI Apps?** → Start with [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 mins) or explore [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hours)
4. **Need Specific Tech Stack?** → Use [Finding the Right Example](../../../examples) section above

### Next Steps

- ✅ Review [Prerequisites](../../../examples) above
- ✅ Choose an example matching your skill level (see [Complexity Legend](../../../examples))
- ✅ Read the example's README thoroughly before deploying
- ✅ Set a reminder to run `azd down` after testing
- ✅ Share your experience via GitHub Issues or Discussions

### Need Help?

- 📖 [FAQ](../resources/faq.md) - Common questions answered
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - Fix deployment issues
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Ask the community
- 📚 [Study Guide](../resources/study-guide.md) - Reinforce your learning

---

**Navigation**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Study Materials**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 Resources**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Last Updated: November 2025 | [Report Issues](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribute Examples](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Abeg note:
Dis document don translate by AI translation service (Co-op Translator) — https://github.com/Azure/co-op-translator. Even though we dey try make am correct, abeg sabi say automated translations fit get mistakes or no dey 100% accurate. Make una treat the original document for im native language as the correct, official source. If na serious or critical information, make una use professional human translation. We no go take responsibility for any misunderstanding or wrong interpretation wey fit come from this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
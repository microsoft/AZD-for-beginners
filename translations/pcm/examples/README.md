<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-11-18T19:00:45+00:00",
  "source_file": "examples/README.md",
  "language_code": "pcm"
}
-->
# Examples - Practical AZD Templates and Configurations

**Learn by Example - Arrange by Chapter**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Chapter Mapping**: Examples arrange by how hard dem be
- **🚀 Start Simple**: [Chapter 1 Examples](../../../examples)
- **🤖 AI Examples**: [Chapter 2 & 5 AI Solutions](../../../examples)

## Introduction

Dis folder get practical examples, templates, and real-life scenarios wey go help you sabi Azure Developer CLI by doing am yourself. Each example get complete working code, infrastructure templates, and step-by-step instructions for different application designs and deployment styles.

## Learning Goals

As you dey work through dis examples, you go:
- Practice Azure Developer CLI workflows with real-life application scenarios
- Understand different application designs and how dem dey work with azd
- Sabi Infrastructure as Code patterns for different Azure services
- Use configuration management and environment-specific deployment strategies
- Implement monitoring, security, and scaling patterns for real-life use
- Get experience with troubleshooting and debugging deployment issues

## Learning Outcomes

When you finish dis examples, you go fit:
- Deploy different application types with Azure Developer CLI without fear
- Adjust the templates to fit your own application needs
- Design and build custom infrastructure patterns with Bicep
- Configure complex multi-service applications with correct dependencies
- Use security, monitoring, and performance best practices for real-life scenarios
- Troubleshoot and make deployments better based on your experience

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

### For Beginners
1. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Deploy Node.js Express web app with MongoDB
2. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Host React static website with Azure Static Web Apps
3. **[Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Deploy containerized Python Flask app

### For Intermediate Users
4. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Web app with C# API and Azure SQL Database
5. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions with HTTP triggers and Cosmos DB
6. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Multi-service Java app with Container Apps and API gateway

### Azure AI Foundry Templates

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Smart chat app with Azure OpenAI
2. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** - Document analysis with Azure AI services
3. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** - MLOps workflow with Azure Machine Learning

### Real-World Scenarios

#### **Retail Multi-Agent Solution** 🆕
**[Complete Implementation Guide](./retail-scenario.md)**

Dis one na full, production-ready multi-agent customer support solution wey show enterprise-level AI application deployment with AZD. E include:

- **Complete Architecture**: Multi-agent system with customer service and inventory management agents
- **Production Infrastructure**: Multi-region Azure OpenAI deployments, AI Search, Container Apps, and full monitoring
- **Ready-to-Deploy ARM Template**: One-click deployment with different configuration modes (Minimal/Standard/Premium)
- **Advanced Features**: Security validation, agent evaluation framework, cost optimization, and troubleshooting guides
- **Real Business Context**: Retailer customer support use case with file uploads, search integration, and dynamic scaling

**Technologies**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Advanced - Enterprise Production Ready)

**Perfect for**: AI developers, solution architects, and teams wey dey build production multi-agent systems

**Quick Start**: Deploy the full solution in less than 30 minutes with the ARM template wey dey `./deploy.sh -g myResourceGroup`

## 📋 Usage Instructions

### How to Run Examples Locally

1. **Clone or Copy Example**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Initialize AZD Environment**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Configure Environment**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### How to Adjust Examples

Each example get:
- **README.md** - Full setup and customization instructions
- **azure.yaml** - AZD configuration with comments
- **infra/** - Bicep templates with parameter explanations
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
**Technologies**: Python Flask, Docker, Container Apps, Container Registry  
**Complexity**: Beginner  
**Concepts**: Containerization, microservices architecture, API development

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

The `configurations/` folder get reusable components:

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

### How to Adjust Examples for Your Use Case

1. **Check Prerequisites**
   - Confirm Azure service requirements
   - Check subscription limits
   - Understand cost implications

2. **Change Configuration**
   - Update `azure.yaml` service definitions
   - Adjust Bicep templates
   - Set environment variables

3. **Test Well**
   - Deploy to development environment first
   - Confirm functionality
   - Test scaling and performance

4. **Security Check**
   - Review access controls
   - Use secrets management
   - Enable monitoring and alerting

## 📊 Comparison Matrix

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Learning Path

### Recommended Steps

1. **Start with Simple Web App**
   - Learn basic AZD concepts
   - Understand deployment workflow
   - Practice environment management

2. **Try Static Website**
   - Explore hosting options
   - Learn CDN integration
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
   - Learn triggers and bindings
   - Practice with APIs

6. **Build Microservices**
   - Learn service communication
   - Understand distributed systems
   - Practice complex deployments

## 🔍 How to Find the Right Example

### By Technology Stack
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: Python Flask Container App, Java Microservices
- **Databases**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **Enterprise Production**: **Retail Multi-Agent Solution**

### By Architecture Pattern
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Containerized**: Python Flask Container App
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: **Retail Multi-Agent Solution**

### By Complexity Level
- **Beginner**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Intermediate**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: **Retail Multi-Agent Solution** (Full multi-agent system with ARM template deployment)

## 📚 Extra Resources

### Documentation Links
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Examples
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App wit C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App wit Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App wit Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App wit C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions wit Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Best Practices
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contributing Examples

You get example wey go help? We go happy if you fit share am!

### Submission Guidelines
1. Make sure say you follow di directory structure wey dem don already set.
2. Put better README.md wey explain well.
3. Add comments for configuration files.
4. Test am well well before you submit.
5. Include cost estimate and wetin you need before you fit run am.

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

**Pro Tip**: Start wit di simplest example wey match di technology wey you dey use, then dey add more complex ones small small. Each example dey build ontop di one wey dey before am!

**Next Steps**: 
- Pick example wey match your skill level
- Follow di setup instructions wey dey di example README
- Try customize am make e fit your own style
- Share wetin you learn wit di community

---

**Navigation**
- **Previous Lesson**: [Study Guide](../resources/study-guide.md)
- **Return to**: [Main README](../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI transle-shon service [Co-op Translator](https://github.com/Azure/co-op-translator) do di transle-shon. Even as we dey try make am correct, abeg make you sabi say machine transle-shon fit get mistake or no dey accurate well. Di original dokyument for im native language na di one wey you go take as di correct source. For important mata, e good make you use professional human transle-shon. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis transle-shon.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
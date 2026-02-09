# Examples - Practical AZD Templates and Configurations

**Learning by Example - Organized by Chapter**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Chapter Mapping**: Examples organized by learning complexity
- **🚀 Local Example**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 External AI Examples**: Links to Azure Samples repositories

> **📍 IMPORTANT: Local vs External Examples**  
> This repository contains **4 complete local examples** with full implementations:  
> - **Azure OpenAI Chat** (GPT-4 deployment with chat interface)  
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

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**Complete GPT-4 deployment with chat interface included in this repo**

- **Location:** `examples/azure-openai-chat/`
- **Complexity:** ⭐⭐ (Intermediate)
- **What's Included:**
  - Complete Azure OpenAI deployment (GPT-4)
  - Python command-line chat interface
  - Key Vault integration for secure API keys
  - Bicep infrastructure templates
  - Token usage and cost tracking
  - Rate limiting and error handling

**Quick Start:**
```bash
# example मा जानुहोस्
cd examples/azure-openai-chat

# सबै तैनाथ गर्नुहोस्
azd up

# निर्भरता स्थापना गर्नुहोस् र च्याट सुरु गर्नुहोस्
pip install -r src/requirements.txt
python src/chat.py
```

**Technologies:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

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
# मास्टर मार्गदर्शिका हेर्नुहोस्
cd examples/container-app

# सरल Flask API तैनात गर्नुहोस्
cd simple-flask-api
azd up

# माइक्रोसर्भिसहरूको उदाहरण तैनात गर्नुहोस्
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
  - Azure OpenAI integration
  - AI Search with RAG
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

The following examples are maintained in official Azure-Samples repositories. Clone them to explore different AZD patterns:

### Simple Applications (Chapters 1-2)

| Template | Repository | Complexity | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [स्थानीय: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [स्थानीय: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**How to use:**
```bash
# कुनै पनि उदाहरण क्लोन गर्नुहोस्
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# डिप्लोय गर्नुहोस्
azd up
```

### AI Application Examples (Chapters 2, 5, 8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [स्थानीय: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 deployment |
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
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Deploy GPT-4 with chat interface and secure API key management  
   **Time:** 35-45 minutes | **Cost:** $50-200/month  
   **You'll Learn:** Azure OpenAI deployment, Key Vault integration, token tracking  
   **Expected Outcome:** Working chat application with GPT-4 and cost monitoring

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

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Complete GPT-4 deployment with chat interface  
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

- **Complete Architecture**: Multi-agent system with specialized customer service and inventory management agents
- **उत्पादन पूर्वाधार**: बहु-क्षेत्र Azure OpenAI परिनियोजनहरू, AI Search, Container Apps, र व्यापक अनुगमन
- **तैनाथ गर्न तयार ARM टेम्पलेट**: Minimal/Standard/Premium जस्ता बहु कन्फिगरेसन मोडहरूसँग एक-क्लिक परिनियोजन
- **उन्नत सुविधाहरू**: रेड टीमिङ सुरक्षा मान्यकरण, एजेन्ट मूल्याङ्कन फ्रेमवर्क, लागत अनुकूलन, र समस्या निवारण मार्गदर्शिका
- **वास्तविक व्यवसायिक सन्दर्भ**: फाइल अपलोड, खोज एकीकरण, र गतिशील स्केलिङ सहित खुद्रा ग्राहक समर्थन प्रयोग केस

**प्रविधिहरू**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**जटिलता**: ⭐⭐⭐⭐ (उन्नत - एंटरप्राइज उत्पादन-तयार)

**उपयुक्त**: AI developers, solution architects, र उत्पादन बहु-एजेन्ट प्रणालीहरू बनाउने टोलीहरू

**द्रुत आरम्भ**: समावेश ARM टेम्पलेट प्रयोग गर्दै `./deploy.sh -g myResourceGroup` सँग ३० मिनेटभन्दा कममा पूर्ण समाधान तैनाथ गर्नुहोस्

## 📋 प्रयोग निर्देशहरू

### पूर्वआवश्यकताहरू

कुनै पनि उदाहरण चलाउनु अघि:
- ✅ Azure subscription with Owner or Contributor access
- ✅ Azure Developer CLI इन्स्टल गरिएको ([स्थापना मार्गदर्शिका](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop चलिरहेको छ (कन्टेनर उदाहरणहरूको लागि)
- ✅ उपयुक्त Azure कोटा (उदाहरण-विशेष आवश्यकताहरू जाँच गर्नुहोस्)

> **💰 लागत चेतावनी:** सबै उदाहरणहरूले वास्तविक Azure स्रोतहरू सिर्जना गर्दछन् जसले शुल्क लाग्नेछ। लागत अनुमानहरूको लागि व्यक्तिगत README फाइलहरू हेर्नुहोस्। जारी खर्चहरूबाट बच्न सकेपछि `azd down` चलाउन सम्झनुहोस्।

### उदाहरणहरू स्थानीय रूपमा चलाउने

1. **उदाहरण क्लोन वा प्रतिलिपि गर्नुहोस्**
   ```bash
   # इच्छित उदाहरणमा जानुहोस्
   cd examples/simple-web-app
   ```

2. **AZD वातावरण आरम्भ गर्नुहोस्**
   ```bash
   # अवस्थित टेम्पलेट प्रयोग गरी आरम्भ गर्नुहोस्
   azd init
   
   # वा नयाँ वातावरण सिर्जना गर्नुहोस्
   azd env new my-environment
   ```

3. **पर्यावरण कन्फिगर गर्नुहोस्**
   ```bash
   # आवश्यक भेरिएबलहरू सेट गर्नुहोस्
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **तैनाथ गर्नुहोस्**
   ```bash
   # पूर्वाधार र अनुप्रयोग तैनाथ गर्नुहोस्
   azd up
   ```

5. **परिनियोजन प्रमाणित गर्नुहोस्**
   **अपेक्षित सफलता संकेतक:**
   - ✅ `azd up` त्रुटि बिना सफलतापूर्वक सम्पन्न हुन्छ
   - ✅ सेवा एन्डपोइन्टले HTTP 200 फर्काउँछ
   - ✅ Azure Portal मा "Running" स्थिति देखिन्छ
   - ✅ Application Insights टेलिमेट्री प्राप्त गर्दैछ

> **⚠️ समस्या छ?** परिनियोजन समस्या निवारणका लागि [सामान्य समस्याहरू](../docs/chapter-07-troubleshooting/common-issues.md) हेर्नुहोस्

### उदाहरणहरू अनुकूलन गर्ने

प्रत्येक उदाहरण समावेश गर्दछ:
- **README.md** - विस्तृत सेटअप र अनुकूलन निर्देशनहरू
- **azure.yaml** - टिप्पणीहरू सहितको AZD कन्फिगरेसन
- **infra/** - प्यारामीटर व्याख्याहरू सहितका Bicep टेम्पलेटहरू
- **src/** - नमूना अनुप्रयोग कोड
- **scripts/** - सामान्य कार्यहरूको लागि सहायक स्क्रिप्टहरू

## 🎯 अध्ययन लक्ष्यहरू

### उदाहरण वर्गहरू

#### **आधारभूत परिनियोजनहरू**
- एकल-सेवा अनुप्रयोगहरू
- साधारण पूर्वाधार ढाँचा
- आधारभूत कन्फिगरेशन व्यवस्थापन
- लागत-कुशल विकास सेटअपहरू

#### **उन्नत परिदृश्यहरू**
- बहु-सेवा वास्तुकला
- जटिल नेटवर्किङ कन्फिगरेसनहरू
- डेटाबेस एकीकरण ढाँचा
- सुरक्षा र अनुपालन कार्यान्वयनहरू

#### **उत्पादन-तयार ढाँचा**
- उच्च उपलब्धता कन्फिगरेसनहरू
- अनुगमन र अवलोकनयोग्यता
- CI/CD एकीकरण
- डिजास्टर रिकभरी सेटअपहरू

## 📖 उदाहरण विवरणहरू

### Simple Web App - Node.js Express
**प्रविधिहरू**: Node.js, Express, MongoDB, Container Apps  
**जटिलता**: प्रारम्भिक  
**अवधारणाहरू**: आधारभूत परिनियोजन, REST API, NoSQL डेटाबेस एकीकरण

### Static Website - React SPA
**प्रविधिहरू**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**जटिलता**: प्रारम्भिक  
**अवधारणाहरू**: स्ट्याटिक होस्टिङ, सर्भरलेस ब्याकएन्ड, आधुनिक वेब विकास

### Container App - Python Flask
**प्रविधिहरू**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**जटिलता**: प्रारम्भिक  
**अवधारणाहरू**: कन्टेनराइजेशन, REST API, scale-to-zero, health probes, अनुगमन  
**स्थान**: [स्थानीय उदाहरण](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**प्रविधिहरू**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**जटिलता**: उन्नत  
**अवधारणाहरू**: बहु-सेवा वास्तुकला, सेवा संचार, मेसेज क्वियुइङ, वितरित ट्रेसिङ  
**स्थान**: [स्थानीय उदाहरण](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**प्रविधिहरू**: C# ASP.NET Core, Azure SQL Database, App Service  
**जटिलता**: अन्तरिम  
**अवधारणाहरू**: Entity Framework, डेटाबेस कनेक्शन, वेब API विकास

### Serverless Function - Python Azure Functions
**प्रविधिहरू**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**जटिलता**: अन्तरिम  
**अवधारणाहरू**: इभेन्ट-ड्रिवेन आर्किटेक्चर, सर्भरलेस कम्प्युटिङ, फुल-स्ट्याक विकास

### Microservices - Java Spring Boot
**प्रविधिहरू**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**जटिलता**: अन्तरिम  
**अवधारणाहरू**: माइक्रोसर्भिस संचार, वितरित प्रणालीहरू, एंटरप्राइज ढाँचा

### Microsoft Foundry Examples

#### Azure OpenAI Chat App
**प्रविधिहरू**: Azure OpenAI, Cognitive Search, App Service  
**जटिलता**: अन्तरिम  
**अवधारणाहरू**: RAG आर्किटेक्चर, भेक्टर खोज, LLM एकीकरण

#### AI Document Processing
**प्रविधिहरू**: Azure AI Document Intelligence, Storage, Functions  
**जटिलता**: अन्तरिम  
**अवधारणाहरू**: दस्तावेज़ विश्लेषण, OCR, डाटा निकासी

#### Machine Learning Pipeline
**प्रविधिहरू**: Azure ML, MLOps, Container Registry  
**जटिलता**: उन्नत  
**अवधारणाहरू**: मोडेल प्रशिक्षण, तैनाथीकरण पाइपलाइन, अनुगमन

## 🛠 कन्फिगरेशन उदाहरणहरू

`configurations/` डाइरेक्टरीले पुन:प्रयोगयोग्य कम्पोनेन्टहरू समावेश गर्दछ:

### वातावरण कन्फिगरेसनहरू
- विकास वातावरण सेटिङहरू
- स्टेजिङ वातावरण कन्फिगरेसनहरू
- उत्पादन-तयार कन्फिगरेसनहरू
- बहु-क्षेत्र तैनाथीकरण सेटअपहरू

### Bicep मोड्युलहरू
- पुन:प्रयोगयोग्य पूर्वाधार कम्पोनेन्टहरू
- साझा स्रोत ढाँचाहरू
- सुरक्षा-हार्डन्ड टेम्पलेटहरू
- लागत-अनुकूलित कन्फिगरेसनहरू

### सहायक स्क्रिप्टहरू
- वातावरण सेटअप स्वचालन
- डेटाबेस माइग्रेशन स्क्रिप्टहरू
- तैनाथीकरण मान्यकरण उपकरणहरू
- लागत अनुगमन युटिलिटीज

## 🔧 अनुकूलन मार्गदर्शिका

### तपाईंको प्रयोग केसका लागि उदाहरणहरू अनुकूलन गर्ने

1. **पूर्वआवश्यकताहरू समीक्षा गर्नुहोस्**
   - Azure सेवा आवश्यकताहरू जाँच्नुहोस्
   - सदस्यता सीमा प्रमाणित गर्नुहोस्
   - लागत प्रभावहरूको समझ राख्नुहोस्

2. **कन्फिगरेसन संशोधन गर्नुहोस्**
   - `azure.yaml` सेवा परिभाषाहरू अद्यावधिक गर्नुहोस्
   - Bicep टेम्पलेटहरू अनुकूलन गर्नुहोस्
   - वातावरण चरहरू समायोजन गर्नुहोस्

3. **पूर्ण रूपमा परीक्षण गर्नुहोस्**
   - पहिले विकास वातावरणमा तैनाथ गर्नुहोस्
   - कार्यक्षमता प्रमाणित गर्नुहोस्
   - स्केलिङ र प्रदर्शन परीक्षण गर्नुहोस्

4. **सुरक्षा समीक्षा**
   - पहुँच नियन्त्रणहरू समीक्षा गर्नुहोस्
   - गोप्य व्यवस्थापन कार्यान्वयन गर्नुहोस्
   - अनुगमन र अलर्टिङ सक्षम गर्नुहोस्

## 📊 तुलना म्याट्रिक्स

| उदाहरण | सेवाहरू | डेटाबेस | प्रमाणीकरण | अनुगमन | जटिलता |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (स्थानीय) | 2 | ❌ | Key Vault | पूर्ण | ⭐⭐ |
| **Python Flask API** (स्थानीय) | 1 | ❌ | मूलभूत | पूर्ण | ⭐ |
| **Microservices** (स्थानीय) | 5+ | ✅ | एंटरप्राइज | उन्नत | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | मूलभूत | मूलभूत | ⭐ |
| React SPA + Functions | 3 | ✅ | मूलभूत | पूर्ण | ⭐ |
| Python Flask Container | 2 | ❌ | मूलभूत | पूर्ण | ⭐ |
| C# Web API + SQL | 2 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Java Microservices | 5+ | ✅ | पूर्ण | पूर्ण | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | मूलभूत | पूर्ण | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | पूर्ण | पूर्ण | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (स्थानीय) | **8+** | **✅** | **एंटरप्राइज** | **उन्नत** | **⭐⭐⭐⭐** |

## 🎓 अध्ययन मार्ग

### सिफारिस गरिएको प्रगति

1. **सादा वेब एप बाट सुरु गर्नुहोस्**
   - AZD का आधारभूत अवधारणाहरू सिक्नुहोस्
   - परिनियोजन कार्यप्रवाह बुझ्नुहोस्
   - वातावरण व्यवस्थापन अभ्यास गर्नुहोस्

2. **स्ट्याटिक वेबसाइट प्रयास गर्नुहोस्**
   - विभिन्न होस्टिङ विकल्पहरू अन्वेषण गर्नुहोस्
   - CDN एकीकरणका बारेमा सिक्नुहोस्
   - DNS कन्फिगरेसन बुझ्नुहोस्

3. **कन्टेनर एपमा सर्छु**
   - कन्टेनराइजेशनका आधार बुझ्नुहोस्
   - स्केलिङ अवधारणाहरू बुझ्नुहोस्
   - Docker सँग अभ्यास गर्नुहोस्

4. **डेटाबेस एकीकरण थप्नुहोस्**
   - डेटाबेस प्रोविशनिङ सिक्नुहोस्
   - कनेक्शन स्ट्रिङहरू बुझ्नुहोस्
   - गोप्य व्यवस्थापन अभ्यास गर्नुहोस्

5. **सर्भरलेस अन्वेषण गर्नुहोस्**
   - इभेन्ट-ड्रिवेन आर्किटेक्चर बुझ्नुहोस्
   - ट्रिगर र बाइन्डिङहरू सिक्नुहोस्
   - APIs सँग अभ्यास गर्नुहोस्

6. **माइक्रोसर्भिसहरू बनाउनुहोस्**
   - सेवा संचार सिक्नुहोस्
   - वितरित प्रणालीहरू बुझ्नुहोस्
   - जटिल तैनाथीकरणहरू अभ्यास गर्नुहोस्

## 🔍 उपयुक्त उदाहरण कसरी फेला पार्ने

### प्रविधि स्ट्याक अनुसार
- **Container Apps**: [Python Flask API (स्थानीय)](../../../examples/container-app/simple-flask-api), [Microservices (स्थानीय)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (स्थानीय)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (स्थानीय)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (स्थानीय)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (स्थानीय)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (स्थानीय)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (स्थानीय)](../../../examples/container-app/simple-flask-api), [Microservices (स्थानीय)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (स्थानीय)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (स्थानीय)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (स्थानीय)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (स्थानीय)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### वास्तुकला ढाँचा अनुसार
- **Simple REST API**: [Python Flask API (स्थानीय)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (स्थानीय)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (स्थानीय)](../../../examples/container-app/simple-flask-api), [Microservices (स्थानीय)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (स्थानीय)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (स्थानीय)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### जटिलता स्तर अनुसार
- **प्रारम्भिक**: [Python Flask API (स्थानीय)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **अन्तरिम**: **[Azure OpenAI Chat (स्थानीय)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **उन्नत**: ML Pipeline
- **एंटरप्राइज उत्पादन-तयार**: [Microservices (स्थानीय)](../../../examples/container-app/microservices) (मेसेज क्वियुइङ सहित बहु-सेवा), **Retail Multi-Agent Solution** (ARM टेम्पलेट तैनाथीसहित पूर्ण बहु-एजेन्ट प्रणाली)

## 📚 अतिरिक्त स्रोतहरू

### डक्युमेन्टेशन लिङ्कहरू
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### समुदाय उदाहरणहरू
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js र PostgreSQL सहितको Todo एप](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API सहितको React वेब एप](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps जॉब](https://github.com/Azure-Samples/container-apps-jobs)
- [Java सहितको Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### उत्तम अभ्यास
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 योगदानका उदाहरणहरू

तपाईं सँग साझा गर्न उपयोगी उदाहरण छ? हामी योगदानलाई स्वागत गर्छौं!

### पेश गर्ने दिशानिर्देश
1. स्थापित निर्देशिका संरचना पालन गर्नुहोस्
2. व्यापक README.md समावेश गर्नुहोस्
3. कन्फिगरेसन फाइलहरूमा टिप्पणीहरू थप्नुहोस्
4. पेश गर्नु अघि पूर्ण रूपमा परीक्षण गर्नुहोस्
5. लागत अनुमान र पूर्वआवश्यकताहरू समावेश गर्नुहोस्

### उदाहरण टेम्पलेट संरचना
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

**प्रो टिप**: आफ्नो प्रविधि स्ट्याकसँग मेल खाने सबैभन्दा सरल उदाहरणबाट सुरु गर्नुहोस्, त्यसपछि क्रमशः थप जटिल परिदृश्यहरूमा जानुहोस्। प्रत्येक उदाहरणले अघिल्ला उदाहरणहरूका अवधारणाहरूमा निर्माण गर्छ!

## 🚀 सुरु गर्न तयार?

### तपाईंको सिक्ने मार्ग

1. **बिलकुल नयाँ?** → [Flask API](../../../examples/container-app/simple-flask-api) बाट सुरु गर्नुहोस् (⭐, 20 मिनेट)
2. **AZD को आधारभूत ज्ञान छ?** → [Microservices](../../../examples/container-app/microservices) प्रयास गर्नुहोस् (⭐⭐⭐⭐, 60 मिनेट)
3. **एआई एपहरू बनाउँदै हुनुहुन्छ?** → [Azure OpenAI Chat](../../../examples/azure-openai-chat) बाट सुरु गर्नुहोस् (⭐⭐, 35 मिनेट) वा अन्वेषण गर्नुहोस् [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ घण्टा)
4. **विशिष्ट प्रविधि स्ट्याक चाहिन्छ?** → माथि रहेको [सही उदाहरण भेट्टाउने](../../../examples) सेक्सन प्रयोग गर्नुहोस्

### अर्को कदमहरू

- ✅ माथि रहेको [पूर्वआवश्यकताहरू](../../../examples) समीक्षा गर्नुहोस्
- ✅ आफ्नो सीप स्तरसँग मेल खाने उदाहरण रोज्नुहोस् (हेर्नुहोस् [जटिलता लेजेन्ड](../../../examples))
- ✅ उदाहरणको README ध्यानपूर्वक पढ्नुहोस् र परिनियोजन गर्नु अघि बुझ्नुहोस्
- ✅ परीक्षणपछि `azd down` चलाउन स्मरणपत्र सेट गर्नुहोस्
- ✅ GitHub Issues वा Discussions मार्फत आफ्नो अनुभव साझा गर्नुहोस्

### मदत चाहिन्छ?

- 📖 [FAQ](../resources/faq.md) - सामान्य प्रश्नहरूको उत्तर
- 🐛 [समस्या समाधान मार्गदर्शक](../docs/chapter-07-troubleshooting/common-issues.md) - परिनियोजन समस्याहरू समाधान गर्नुहोस्
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - समुदायसँग सोध्नुहोस्
- 📚 [अध्ययन मार्गदर्शक](../resources/study-guide.md) - आफ्नो सिकाइ मजबुत पार्नुहोस्

---

**नेभिगेसन**
- **📚 कोर्स होम**: [AZD For Beginners](../README.md)
- **📖 अध्ययन सामग्रीहरू**: [अध्ययन मार्गदर्शक](../resources/study-guide.md) | [चीट शीट](../resources/cheat-sheet.md) | [शब्दावली](../resources/glossary.md)
- **🔧 स्रोतहरू**: [FAQ](../resources/faq.md) | [समस्या समाधान](../docs/chapter-07-troubleshooting/common-issues.md)

---

*अन्तिम अपडेट: नोभेम्बर 2025 | [समस्या रिपोर्ट गर्नुहोस्](https://github.com/microsoft/AZD-for-beginners/issues) | [उदाहरणहरू योगदान गर्नुहोस्](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताका लागि प्रयासरत भए तापनि, कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुनसक्छ। मूल दस्तावेजलाई त्यसको मूल भाषामा नै प्रामाणिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट हुने कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौँ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
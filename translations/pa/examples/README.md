<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:07:45+00:00",
  "source_file": "examples/README.md",
  "language_code": "pa"
}
-->
# ਉਦਾਹਰਨ - ਪ੍ਰੈਕਟਿਕਲ AZD ਟੈਂਪਲੇਟ ਅਤੇ ਕਨਫਿਗਰੇਸ਼ਨ

## ਪਰਿਚਯ

ਇਹ ਡਾਇਰੈਕਟਰੀ ਪ੍ਰੈਕਟਿਕਲ ਉਦਾਹਰਨਾਂ, ਟੈਂਪਲੇਟਾਂ ਅਤੇ ਅਸਲ-ਜੀਵਨ ਸਥਿਤੀਆਂ ਨੂੰ ਸ਼ਾਮਲ ਕਰਦੀ ਹੈ ਜੋ ਤੁਹਾਨੂੰ Azure Developer CLI ਨੂੰ ਹੱਥ-ਅਭਿਆਸ ਰਾਹੀਂ ਸਿੱਖਣ ਵਿੱਚ ਮਦਦ ਕਰਦੀ ਹੈ। ਹਰ ਉਦਾਹਰਨ ਵਿੱਚ ਪੂਰੀ ਤਰ੍ਹਾਂ ਕੰਮ ਕਰਨ ਵਾਲਾ ਕੋਡ, ਇੰਫਰਾਸਟਰਕਚਰ ਟੈਂਪਲੇਟ ਅਤੇ ਵੱਖ-ਵੱਖ ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਪੈਟਰਨ ਲਈ ਵਿਸਥਾਰਿਤ ਹਦਾਇਤਾਂ ਸ਼ਾਮਲ ਹਨ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਨ੍ਹਾਂ ਉਦਾਹਰਨਾਂ 'ਤੇ ਕੰਮ ਕਰਕੇ, ਤੁਸੀਂ:
- ਅਸਲ ਐਪਲੀਕੇਸ਼ਨ ਸਥਿਤੀਆਂ ਨਾਲ Azure Developer CLI ਵਰਕਫਲੋਅ ਦਾ ਅਭਿਆਸ ਕਰੋਗੇ
- ਵੱਖ-ਵੱਖ ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰ ਅਤੇ ਉਨ੍ਹਾਂ ਦੇ azd ਇੰਪਲੀਮੈਂਟੇਸ਼ਨ ਨੂੰ ਸਮਝੋ
- ਵੱਖ-ਵੱਖ Azure ਸੇਵਾਵਾਂ ਲਈ Infrastructure as Code ਪੈਟਰਨ ਵਿੱਚ ਮਾਹਰ ਬਣੋ
- ਕਨਫਿਗਰੇਸ਼ਨ ਮੈਨੇਜਮੈਂਟ ਅਤੇ ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰੋ
- ਪ੍ਰੈਕਟਿਕਲ ਸਥਿਤੀਆਂ ਵਿੱਚ ਮਾਨੀਟਰਿੰਗ, ਸੁਰੱਖਿਆ ਅਤੇ ਸਕੇਲਿੰਗ ਪੈਟਰਨ ਲਾਗੂ ਕਰੋ
- ਅਸਲ ਡਿਪਲੌਇਮੈਂਟ ਸਥਿਤੀਆਂ ਨਾਲ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਅਤੇ ਡੀਬੱਗਿੰਗ ਦਾ ਅਨੁਭਵ ਬਣਾਓ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਨ੍ਹਾਂ ਉਦਾਹਰਨਾਂ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ:
- ਵੱਖ-ਵੱਖ ਐਪਲੀਕੇਸ਼ਨ ਕਿਸਮਾਂ ਨੂੰ Azure Developer CLI ਦੀ ਮਦਦ ਨਾਲ ਵਿਸ਼ਵਾਸ ਨਾਲ ਡਿਪਲੌਇ ਕਰ ਸਕੋਗੇ
- ਦਿੱਤੇ ਗਏ ਟੈਂਪਲੇਟਾਂ ਨੂੰ ਆਪਣੇ ਐਪਲੀਕੇਸ਼ਨ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਲਈ ਅਨੁਕੂਲਿਤ ਕਰੋ
- Bicep ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕਸਟਮ ਇੰਫਰਾਸਟਰਕਚਰ ਪੈਟਰਨ ਡਿਜ਼ਾਈਨ ਅਤੇ ਲਾਗੂ ਕਰੋ
- ਸਹੀ ਨਿਰਭਰਤਾਵਾਂ ਨਾਲ ਜਟਿਲ ਮਲਟੀ-ਸੇਵਾ ਐਪਲੀਕੇਸ਼ਨ ਕਨਫਿਗਰ ਕਰੋ
- ਅਸਲ ਸਥਿਤੀਆਂ ਵਿੱਚ ਸੁਰੱਖਿਆ, ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਦੇ ਸਰਵੋਤਮ ਅਭਿਆਸ ਲਾਗੂ ਕਰੋ
- ਪ੍ਰੈਕਟਿਕਲ ਅਨੁਭਵ ਦੇ ਆਧਾਰ 'ਤੇ ਡਿਪਲੌਇਮੈਂਟ ਨੂੰ ਟ੍ਰਬਲਸ਼ੂਟ ਅਤੇ ਅਪਟਿਮਾਈਜ਼ ਕਰੋ

## ਡਾਇਰੈਕਟਰੀ ਸਟ੍ਰਕਚਰ

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

## ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ ਦੇ ਉਦਾਹਰਨ

### ਸ਼ੁਰੂਆਤੀ ਲਈ
1. **[ਸਧਾਰਨ ਵੈੱਬ ਐਪ - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - MongoDB ਨਾਲ ਇੱਕ Node.js Express ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ
2. **[ਸਟੈਟਿਕ ਵੈਬਸਾਈਟ - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Azure Static Web Apps ਨਾਲ React ਸਟੈਟਿਕ ਵੈਬਸਾਈਟ ਹੋਸਟ ਕਰੋ
3. **[ਕੰਟੇਨਰ ਐਪ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - ਇੱਕ ਕੰਟੇਨਰਾਈਜ਼ਡ Python Flask ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ

### ਮੱਧਮ ਦਰਜੇ ਦੇ ਯੂਜ਼ਰ ਲਈ
4. **[ਡਾਟਾਬੇਸ ਐਪ - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - C# API ਅਤੇ Azure SQL ਡਾਟਾਬੇਸ ਨਾਲ ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ
5. **[ਸਰਵਰਲੈਸ ਫੰਕਸ਼ਨ - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - HTTP ਟ੍ਰਿਗਰ ਅਤੇ Cosmos DB ਨਾਲ Python Azure Functions
6. **[ਮਾਈਕ੍ਰੋਸੇਵਾਵਾਂ - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - ਕੰਟੇਨਰ ਐਪਸ ਅਤੇ API ਗੇਟਵੇ ਨਾਲ ਮਲਟੀ-ਸੇਵਾ Java ਐਪਲੀਕੇਸ਼ਨ

### Azure AI Foundry ਟੈਂਪਲੇਟ

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Azure OpenAI ਨਾਲ ਸਮਰਥ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ
2. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** - Azure AI ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਦਸਤਾਵੇਜ਼ ਵਿਸ਼ਲੇਸ਼ਣ
3. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** - Azure Machine Learning ਨਾਲ MLOps ਵਰਕਫਲੋਅ

## 📋 ਵਰਤੋਂ ਦੀਆਂ ਹਦਾਇਤਾਂ

### ਉਦਾਹਰਨਾਂ ਨੂੰ ਲੋਕਲ ਰਨ ਕਰਨਾ

1. **ਉਦਾਹਰਨ ਕਲੋਨ ਜਾਂ ਕਾਪੀ ਕਰੋ**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **AZD ਵਾਤਾਵਰਣ ਸ਼ੁਰੂ ਕਰੋ**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **ਵਾਤਾਵਰਣ ਕਨਫਿਗਰ ਕਰੋ**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **ਡਿਪਲੌਇ ਕਰੋ**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### ਉਦਾਹਰਨਾਂ ਨੂੰ ਅਨੁਕੂਲਿਤ ਕਰਨਾ

ਹਰ ਉਦਾਹਰਨ ਵਿੱਚ ਸ਼ਾਮਲ ਹੈ:
- **README.md** - ਵਿਸਥਾਰਿਤ ਸੈਟਅਪ ਅਤੇ ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਹਦਾਇਤਾਂ
- **azure.yaml** - ਟਿੱਪਣੀਆਂ ਨਾਲ AZD ਕਨਫਿਗਰੇਸ਼ਨ
- **infra/** - ਪੈਰਾਮੀਟਰ ਵਿਆਖਿਆਵਾਂ ਨਾਲ Bicep ਟੈਂਪਲੇਟ
- **src/** - ਨਮੂਨਾ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ
- **scripts/** - ਆਮ ਕੰਮਾਂ ਲਈ ਸਹਾਇਕ ਸਕ੍ਰਿਪਟ

## 🎯 ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

### ਉਦਾਹਰਨ ਸ਼੍ਰੇਣੀਆਂ

#### **ਮੁੱਢਲੇ ਡਿਪਲੌਇਮੈਂਟ**
- ਸਿੰਗਲ-ਸੇਵਾ ਐਪਲੀਕੇਸ਼ਨ
- ਸਧਾਰਨ ਇੰਫਰਾਸਟਰਕਚਰ ਪੈਟਰਨ
- ਬੁਨਿਆਦੀ ਕਨਫਿਗਰੇਸ਼ਨ ਮੈਨੇਜਮੈਂਟ
- ਲਾਗਤ-ਪ੍ਰਭਾਵੀ ਵਿਕਾਸ ਸੈਟਅਪ

#### **ਉੱਚ-ਦਰਜੇ ਦੇ ਸਥਿਤੀਆਂ**
- ਮਲਟੀ-ਸੇਵਾ ਆਰਕੀਟੈਕਚਰ
- ਜਟਿਲ ਨੈਟਵਰਕਿੰਗ ਕਨਫਿਗਰੇਸ਼ਨ
- ਡਾਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਪੈਟਰਨ
- ਸੁਰੱਖਿਆ ਅਤੇ ਅਨੁਕੂਲਤਾ ਲਾਗੂ ਕਰਨਾ

#### **ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਪੈਟਰਨ**
- ਉੱਚ ਉਪਲਬਧਤਾ ਕਨਫਿਗਰੇਸ਼ਨ
- ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਦ੍ਰਿਸ਼ਟੀ
- CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- ਡਿਜਾਸਟਰ ਰਿਕਵਰੀ ਸੈਟਅਪ

## 📖 ਉਦਾਹਰਨਾਂ ਦੇ ਵੇਰਵੇ

### ਸਧਾਰਨ ਵੈੱਬ ਐਪ - Node.js Express
**ਤਕਨਾਲੋਜੀਆਂ**: Node.js, Express, MongoDB, Container Apps  
**ਜਟਿਲਤਾ**: ਸ਼ੁਰੂਆਤੀ  
**ਸੰਕਲਪ**: ਬੁਨਿਆਦੀ ਡਿਪਲੌਇਮੈਂਟ, REST API, NoSQL ਡਾਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ

### ਸਟੈਟਿਕ ਵੈਬਸਾਈਟ - React SPA
**ਤਕਨਾਲੋਜੀਆਂ**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**ਜਟਿਲਤਾ**: ਸ਼ੁਰੂਆਤੀ  
**ਸੰਕਲਪ**: ਸਟੈਟਿਕ ਹੋਸਟਿੰਗ, ਸਰਵਰਲੈਸ ਬੈਕਐਂਡ, ਆਧੁਨਿਕ ਵੈੱਬ ਵਿਕਾਸ

### ਕੰਟੇਨਰ ਐਪ - Python Flask
**ਤਕਨਾਲੋਜੀਆਂ**: Python Flask, Docker, Container Apps, Container Registry  
**ਜਟਿਲਤਾ**: ਸ਼ੁਰੂਆਤੀ  
**ਸੰਕਲਪ**: ਕੰਟੇਨਰਾਈਜ਼ੇਸ਼ਨ, ਮਾਈਕ੍ਰੋਸੇਵਾ ਆਰਕੀਟੈਕਚਰ, API ਵਿਕਾਸ

### ਡਾਟਾਬੇਸ ਐਪ - C# with Azure SQL
**ਤਕਨਾਲੋਜੀਆਂ**: C# ASP.NET Core, Azure SQL Database, App Service  
**ਜਟਿਲਤਾ**: ਮੱਧਮ  
**ਸੰਕਲਪ**: Entity Framework, ਡਾਟਾਬੇਸ ਕਨੈਕਸ਼ਨ, ਵੈੱਬ API ਵਿਕਾਸ

### ਸਰਵਰਲੈਸ ਫੰਕਸ਼ਨ - Python Azure Functions
**ਤਕਨਾਲੋਜੀਆਂ**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**ਜਟਿਲਤਾ**: ਮੱਧਮ  
**ਸੰਕਲਪ**: ਇਵੈਂਟ-ਡ੍ਰਿਵਨ ਆਰਕੀਟੈਕਚਰ, ਸਰਵਰਲੈਸ ਕਮਪਿਊਟਿੰਗ, ਫੁੱਲ-ਸਟੈਕ ਵਿਕਾਸ

### ਮਾਈਕ੍ਰੋਸੇਵਾਵਾਂ - Java Spring Boot
**ਤਕਨਾਲੋਜੀਆਂ**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**ਜਟਿਲਤਾ**: ਮੱਧਮ  
**ਸੰਕਲਪ**: ਮਾਈਕ੍ਰੋਸੇਵਾ ਸੰਚਾਰ, ਵੰਡੇ ਸਿਸਟਮ, ਇੰਟਰਪ੍ਰਾਈਜ਼ ਪੈਟਰਨ

### Azure AI Foundry ਉਦਾਹਰਨ

#### Azure OpenAI Chat App
**ਤਕਨਾਲੋਜੀਆਂ**: Azure OpenAI, Cognitive Search, App Service  
**ਜਟਿਲਤਾ**: ਮੱਧਮ  
**ਸੰਕਲਪ**: RAG ਆਰਕੀਟੈਕਚਰ, ਵੈਕਟਰ ਖੋਜ, LLM ਇੰਟੀਗ੍ਰੇਸ਼ਨ

#### AI Document Processing
**ਤਕਨਾਲੋਜੀਆਂ**: Azure AI Document Intelligence, Storage, Functions  
**ਜਟਿਲਤਾ**: ਮੱਧਮ  
**ਸੰਕਲਪ**: ਦਸਤਾਵੇਜ਼ ਵਿਸ਼ਲੇਸ਼ਣ, OCR, ਡਾਟਾ ਨਿਕਾਸ

#### Machine Learning Pipeline
**ਤਕਨਾਲੋਜੀਆਂ**: Azure ML, MLOps, Container Registry  
**ਜਟਿਲਤਾ**: ਉੱਚ  
**ਸੰਕਲਪ**: ਮਾਡਲ ਟ੍ਰੇਨਿੰਗ, ਡਿਪਲੌਇਮੈਂਟ ਪਾਈਪਲਾਈਨ, ਮਾਨੀਟਰਿੰਗ

## 🛠 ਕਨਫਿਗਰੇਸ਼ਨ ਉਦਾਹਰਨ

`configurations/` ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਦੁਬਾਰਾ ਵਰਤਣਯੋਗ ਕੰਪੋਨੈਂਟ ਸ਼ਾਮਲ ਹਨ:

### ਵਾਤਾਵਰਣ ਕਨਫਿਗਰੇਸ਼ਨ
- ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਸੈਟਿੰਗ
- ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ ਕਨਫਿਗਰੇਸ਼ਨ
- ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਕਨਫਿਗਰੇਸ਼ਨ
- ਮਲਟੀ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ ਸੈਟਅਪ

### Bicep ਮੋਡੀਊਲ
- ਦੁਬਾਰਾ ਵਰਤਣਯੋਗ ਇੰਫਰਾਸਟਰਕਚਰ ਕੰਪੋਨੈਂਟ
- ਆਮ ਸਰੋਤ ਪੈਟਰਨ
- ਸੁਰੱਖਿਆ-ਮਜ਼ਬੂਤ ਟੈਂਪਲੇਟ
- ਲਾਗਤ-ਅਨੁਕੂਲਿਤ ਕਨਫਿਗਰੇਸ਼ਨ

### ਸਹਾਇਕ ਸਕ੍ਰਿਪਟ
- ਵਾਤਾਵਰਣ ਸੈਟਅਪ ਆਟੋਮੇਸ਼ਨ
- ਡਾਟਾਬੇਸ ਮਾਈਗ੍ਰੇਸ਼ਨ ਸਕ੍ਰਿਪਟ
- ਡਿਪਲੌਇਮੈਂਟ ਵੈਧਤਾ ਟੂਲ
- ਲਾਗਤ ਮਾਨੀਟਰਿੰਗ ਯੂਟਿਲਿਟੀ

## 🔧 ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਗਾਈਡ

### ਆਪਣੇ ਕੇਸ ਲਈ ਉਦਾਹਰਨਾਂ ਨੂੰ ਅਨੁਕੂਲਿਤ ਕਰਨਾ

1. **ਪੂਰਵ ਸ਼ਰਤਾਂ ਦੀ ਸਮੀਖਿਆ ਕਰੋ**
   - Azure ਸੇਵਾ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
   - ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੀਮਾਵਾਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
   - ਲਾਗਤ ਦੇ ਪ੍ਰਭਾਵਾਂ ਨੂੰ ਸਮਝੋ

2. **ਕਨਫਿਗਰੇਸ਼ਨ ਨੂੰ ਸੋਧੋ**
   - `azure.yaml` ਸੇਵਾ ਦੀਆਂ ਵਿਆਖਿਆਵਾਂ ਨੂੰ ਅਪਡੇਟ ਕਰੋ
   - Bicep ਟੈਂਪਲੇਟ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰੋ
   - ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਨੂੰ ਅਨੁਕੂਲਿਤ ਕਰੋ

3. **ਥੋੜ੍ਹਾ ਟੈਸਟ ਕਰੋ**
   - ਪਹਿਲਾਂ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਵਿੱਚ ਡਿਪਲੌਇ ਕਰੋ
   - ਕਾਰਗੁਜ਼ਾਰੀ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
   - ਸਕੇਲਿੰਗ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ

4. **ਸੁਰੱਖਿਆ ਸਮੀਖਿਆ**
   - ਪਹੁੰਚ ਨਿਯੰਤਰਣ ਦੀ ਸਮੀਖਿਆ ਕਰੋ
   - ਰਾਜ਼ ਮੈਨੇਜਮੈਂਟ ਲਾਗੂ ਕਰੋ
   - ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਚੇਤਾਵਨੀ ਨੂੰ ਯਕੀਨੀ ਬਣਾਓ

## 📊 ਤੁਲਨਾ ਮੈਟ੍ਰਿਕਸ

| ਉਦਾਹਰਨ | ਸੇਵਾਵਾਂ | ਡਾਟਾਬੇਸ | ਥਰਡ-ਪਾਰਟੀ | ਮਾਨੀਟਰਿੰਗ | ਜਟਿਲਤਾ |
|---------|----------|----------|------|------------|------------|
| Node.js Express Todo | 2 | ✅ | ਬੁਨਿਆਦੀ | ਬੁਨਿਆਦੀ | ⭐ |
| React SPA + Functions | 3 | ✅ | ਬੁਨਿਆਦੀ | ਪੂਰਾ | ⭐ |
| Python Flask Container | 2 | ❌ | ਬੁਨਿਆਦੀ | ਪੂਰਾ | ⭐ |
| C# Web API + SQL | 2 | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐ |
| Java Microservices | 5+ | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | ਬੁਨਿਆਦੀ | ਪੂਰਾ | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐⭐⭐ |

## 🎓 ਸਿੱਖਣ ਦਾ ਪਾਥ

### ਸਿਫਾਰਸ਼ੀ ਤਰੱਕੀ

1. **ਸਧਾਰਨ ਵੈੱਬ ਐਪ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ**
   - ਬੁਨਿਆਦੀ AZD ਸੰਕਲਪ ਸਿੱਖੋ
   - ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋਅ ਨੂੰ ਸਮਝੋ
   - ਵਾਤਾਵਰਣ ਮੈਨੇਜਮੈਂਟ ਦਾ ਅਭਿਆਸ ਕਰੋ

2. **ਸਟੈਟਿਕ ਵੈਬਸਾਈਟ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ**
   - ਵੱਖ-ਵੱਖ ਹੋਸਟਿੰਗ ਵਿਕਲਪਾਂ ਦੀ ਖੋਜ ਕਰੋ
   - CDN ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਬਾਰੇ ਸਿੱਖੋ
   - DNS ਕਨਫਿਗਰੇਸ਼ਨ ਨੂੰ ਸਮਝੋ

3. **ਕੰਟੇਨਰ ਐਪ ਵੱਲ ਵਧੋ**
   - ਕੰਟੇਨਰਾਈਜ਼ੇਸ਼ਨ ਬੁਨਿਆਦੀਆਂ ਸਿੱਖੋ
   - ਸਕੇਲਿੰਗ ਸੰਕਲਪਾਂ ਨੂੰ ਸਮਝੋ
   - Docker ਨਾਲ ਅਭਿਆਸ ਕਰੋ

4. **ਡਾਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਸ਼ਾਮਲ ਕਰੋ**
   - ਡਾਟਾਬੇਸ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਸਿੱਖੋ
   - ਕਨੈਕਸ਼ਨ ਸਟ੍ਰਿੰਗ ਨੂੰ ਸਮਝੋ
   - ਰਾਜ਼ ਮੈਨੇਜਮੈਂਟ ਦਾ ਅਭਿਆਸ ਕਰੋ

5. **ਸਰਵਰਲੈਸ ਦੀ ਖੋਜ ਕਰੋ**
   - ਇਵੈਂਟ-ਡ੍ਰਿਵਨ ਆਰਕੀਟੈਕਚਰ ਨੂੰ ਸਮਝੋ
   - ਟ੍ਰਿਗਰ ਅਤੇ ਬਾਈਡਿੰਗ ਬਾਰੇ ਸਿੱਖੋ
   - APIs ਨਾਲ ਅਭਿਆਸ ਕਰੋ

6. **ਮਾਈਕ੍ਰੋਸੇਵਾਵਾਂ ਬਣਾਓ**
   - ਸੇਵਾ ਸੰਚਾਰ ਸਿੱਖੋ
   - ਵੰਡੇ ਸਿਸਟਮ ਨੂੰ ਸਮਝੋ
   - ਜਟਿਲ ਡਿਪਲੌਇਮੈਂਟ ਦਾ ਅਭਿਆਸ ਕਰੋ

## 🔍 ਸਹੀ ਉਦਾਹਰਨ ਲੱਭਣਾ

### ਤਕਨਾਲੋਜੀ ਸਟੈਕ ਦੁਆਰਾ
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: Python Flask Container App, Java Microservices
- **Databases**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### ਆਰਕੀਟੈਕਚਰ ਪੈਟਰਨ ਦੁਆਰਾ
- **Monolithic**: Node.js Express Todo, C

---

**ਅਸਵੀਕਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਹਾਲਾਂਕਿ ਅਸੀਂ ਸਹੀਅਤ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚਤਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
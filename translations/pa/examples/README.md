<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T21:09:35+00:00",
  "source_file": "examples/README.md",
  "language_code": "pa"
}
-->
# ਉਦਾਹਰਨਾਂ - ਪ੍ਰੈਕਟਿਕਲ AZD ਟੈਂਪਲੇਟ ਅਤੇ ਕਨਫਿਗਰੇਸ਼ਨ

**ਉਦਾਹਰਨਾਂ ਦੁਆਰਾ ਸਿੱਖਣਾ - ਅਧਿਆਇ ਅਨੁਸਾਰ ਵਿਵਸਥਿਤ**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਫਾਰ ਬਿਗਿਨਰਜ਼](../README.md)
- **📖 ਅਧਿਆਇ ਮੈਪਿੰਗ**: ਸਿੱਖਣ ਦੀ ਜਟਿਲਤਾ ਅਨੁਸਾਰ ਵਿਵਸਥਿਤ ਉਦਾਹਰਨਾਂ
- **🚀 ਸਧਾਰਨ ਸ਼ੁਰੂਆਤ**: [ਅਧਿਆਇ 1 ਉਦਾਹਰਨਾਂ](../../../examples)
- **🤖 AI ਉਦਾਹਰਨਾਂ**: [ਅਧਿਆਇ 2 ਅਤੇ 5 AI ਹੱਲ](../../../examples)

## ਪਰਿਚਯ

ਇਹ ਡਾਇਰੈਕਟਰੀ ਪ੍ਰੈਕਟਿਕਲ ਉਦਾਹਰਨਾਂ, ਟੈਂਪਲੇਟ ਅਤੇ ਅਸਲ-ਜੀਵਨ ਸਥਿਤੀਆਂ ਨੂੰ ਸ਼ਾਮਲ ਕਰਦੀ ਹੈ ਜੋ ਤੁਹਾਨੂੰ Azure Developer CLI ਨੂੰ ਹੱਥ-ਅਭਿਆਸ ਦੁਆਰਾ ਸਿੱਖਣ ਵਿੱਚ ਮਦਦ ਕਰਦੀ ਹੈ। ਹਰ ਉਦਾਹਰਨ ਵਿੱਚ ਪੂਰਾ ਕੰਮ ਕਰਨ ਵਾਲਾ ਕੋਡ, ਇੰਫਰਾਸਟਰਕਚਰ ਟੈਂਪਲੇਟ ਅਤੇ ਵੱਖ-ਵੱਖ ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਪੈਟਰਨ ਲਈ ਵਿਸਥਾਰਿਤ ਹਦਾਇਤਾਂ ਸ਼ਾਮਲ ਹਨ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਨ੍ਹਾਂ ਉਦਾਹਰਨਾਂ 'ਤੇ ਕੰਮ ਕਰਕੇ, ਤੁਸੀਂ:
- ਅਸਲ ਐਪਲੀਕੇਸ਼ਨ ਸਥਿਤੀਆਂ ਨਾਲ Azure Developer CLI ਵਰਕਫਲੋਅ ਦਾ ਅਭਿਆਸ ਕਰੋਗੇ
- ਵੱਖ-ਵੱਖ ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰ ਅਤੇ ਉਨ੍ਹਾਂ ਦੇ azd ਇੰਪਲੀਮੈਂਟੇਸ਼ਨ ਨੂੰ ਸਮਝੋਗੇ
- ਵੱਖ-ਵੱਖ Azure ਸੇਵਾਵਾਂ ਲਈ Infrastructure as Code ਪੈਟਰਨ ਵਿੱਚ ਮਾਹਰ ਹੋਵੋਗੇ
- ਕਨਫਿਗਰੇਸ਼ਨ ਮੈਨੇਜਮੈਂਟ ਅਤੇ ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰੋਗੇ
- ਪ੍ਰੈਕਟਿਕਲ ਸੰਦਰਭਾਂ ਵਿੱਚ ਮਾਨੀਟਰਿੰਗ, ਸੁਰੱਖਿਆ ਅਤੇ ਸਕੇਲਿੰਗ ਪੈਟਰਨ ਲਾਗੂ ਕਰੋਗੇ
- ਅਸਲ ਡਿਪਲੌਇਮੈਂਟ ਸਥਿਤੀਆਂ ਨਾਲ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਅਤੇ ਡਿਬੱਗਿੰਗ ਦਾ ਅਨੁਭਵ ਬਣਾਉਣਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਨ੍ਹਾਂ ਉਦਾਹਰਨਾਂ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ:
- ਵੱਖ-ਵੱਖ ਐਪਲੀਕੇਸ਼ਨ ਕਿਸਮਾਂ ਨੂੰ Azure Developer CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਵਿਸ਼ਵਾਸ ਨਾਲ ਡਿਪਲੌਇ ਕਰ ਸਕੋਗੇ
- ਦਿੱਤੇ ਟੈਂਪਲੇਟ ਨੂੰ ਆਪਣੇ ਐਪਲੀਕੇਸ਼ਨ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਅਨੁਸਾਰ ਅਨੁਕੂਲਿਤ ਕਰ ਸਕੋਗੇ
- Bicep ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕਸਟਮ ਇੰਫਰਾਸਟਰਕਚਰ ਪੈਟਰਨ ਡਿਜ਼ਾਈਨ ਅਤੇ ਇੰਪਲੀਮੈਂਟ ਕਰ ਸਕੋਗੇ
- ਸਹੀ ਨਿਰਭਰਤਾਵਾਂ ਨਾਲ ਜਟਿਲ ਮਲਟੀ-ਸਰਵਿਸ ਐਪਲੀਕੇਸ਼ਨ ਕਨਫਿਗਰ ਕਰ ਸਕੋਗੇ
- ਅਸਲ ਸਥਿਤੀਆਂ ਵਿੱਚ ਸੁਰੱਖਿਆ, ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਦੀਆਂ ਸ੍ਰੇਸ਼ਠ ਪ੍ਰਥਾਵਾਂ ਲਾਗੂ ਕਰ ਸਕੋਗੇ
- ਪ੍ਰੈਕਟਿਕਲ ਅਨੁਭਵ ਦੇ ਆਧਾਰ 'ਤੇ ਡਿਪਲੌਇਮੈਂਟ ਨੂੰ ਟ੍ਰਬਲਸ਼ੂਟ ਅਤੇ ਅਪਟਿਮਾਈਜ਼ ਕਰ ਸਕੋਗੇ

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

## ਕਵਿਕ ਸਟਾਰਟ ਉਦਾਹਰਨਾਂ

### ਸ਼ੁਰੂਆਤੀ ਲਈ
1. **[ਸਧਾਰਨ ਵੈਬ ਐਪ - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - MongoDB ਨਾਲ Node.js Express ਵੈਬ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ
2. **[ਸਟੈਟਿਕ ਵੈਬਸਾਈਟ - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Azure Static Web Apps ਨਾਲ React ਸਟੈਟਿਕ ਵੈਬਸਾਈਟ ਹੋਸਟ ਕਰੋ
3. **[ਕੰਟੇਨਰ ਐਪ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - ਕੰਟੇਨਰਾਈਜ਼ਡ Python Flask ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ

### ਮੱਧਮ ਦਰਜੇ ਦੇ ਯੂਜ਼ਰ ਲਈ
4. **[ਡਾਟਾਬੇਸ ਐਪ - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - C# API ਅਤੇ Azure SQL ਡਾਟਾਬੇਸ ਨਾਲ ਵੈਬ ਐਪਲੀਕੇਸ਼ਨ
5. **[ਸਰਵਰਲੈਸ ਫੰਕਸ਼ਨ - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - HTTP ਟ੍ਰਿਗਰ ਅਤੇ Cosmos DB ਨਾਲ Python Azure Functions
6. **[ਮਾਈਕ੍ਰੋਸਰਵਿਸ - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - ਕੰਟੇਨਰ ਐਪਸ ਅਤੇ API ਗੇਟਵੇ ਨਾਲ ਮਲਟੀ-ਸਰਵਿਸ Java ਐਪਲੀਕੇਸ਼ਨ

### Azure AI Foundry ਟੈਂਪਲੇਟ

1. **[Azure OpenAI ਚੈਟ ਐਪ](https://github.com/Azure-Samples/azure-search-openai-demo)** - Azure OpenAI ਨਾਲ ਬੁੱਧੀਮਾਨ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ
2. **[AI ਡੌਕੂਮੈਂਟ ਪ੍ਰੋਸੈਸਿੰਗ](https://github.com/Azure-Samples/azure-ai-document-processing)** - Azure AI ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਡੌਕੂਮੈਂਟ ਵਿਸ਼ਲੇਸ਼ਣ
3. **[ਮਸ਼ੀਨ ਲਰਨਿੰਗ ਪਾਈਪਲਾਈਨ](https://github.com/Azure-Samples/mlops-v2)** - Azure Machine Learning ਨਾਲ MLOps ਵਰਕਫਲੋਅ

### ਅਸਲ-ਜੀਵਨ ਸਥਿਤੀਆਂ

#### **ਰਿਟੇਲ ਮਲਟੀ-ਏਜੰਟ ਹੱਲ** 🆕  
**[ਪੂਰੀ ਇੰਪਲੀਮੈਂਟੇਸ਼ਨ ਗਾਈਡ](./retail-scenario.md)**  

AZD ਨਾਲ ਉੱਨਤ-ਪੈਮਾਨੇ ਦੇ AI ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਨੂੰ ਦਰਸਾਉਣ ਵਾਲਾ ਇੱਕ ਉਤਪਾਦਨ-ਤਿਆਰ ਮਲਟੀ-ਏਜੰਟ ਗਾਹਕ ਸਹਾਇਤਾ ਹੱਲ। ਇਹ ਸਥਿਤੀ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ:

- **ਪੂਰੀ ਆਰਕੀਟੈਕਚਰ**: ਗਾਹਕ ਸੇਵਾ ਅਤੇ ਇਨਵੈਂਟਰੀ ਮੈਨੇਜਮੈਂਟ ਏਜੰਟਾਂ ਨਾਲ ਮਲਟੀ-ਏਜੰਟ ਸਿਸਟਮ
- **ਉਤਪਾਦਨ ਇੰਫਰਾਸਟਰਕਚਰ**: ਮਲਟੀ-ਰੀਜਨ Azure OpenAI ਡਿਪਲੌਇਮੈਂਟ, AI Search, Container Apps, ਅਤੇ ਵਿਸਥਾਰਿਤ ਮਾਨੀਟਰਿੰਗ
- **ਤਿਆਰ-ਡਿਪਲੌਇ ARM ਟੈਂਪਲੇਟ**: ਕਈ ਕਨਫਿਗਰੇਸ਼ਨ ਮੋਡ (ਮਿਨੀਮਲ/ਸਟੈਂਡਰਡ/ਪ੍ਰੀਮੀਅਮ) ਨਾਲ ਇੱਕ-ਕਲਿੱਕ ਡਿਪਲੌਇਮੈਂਟ
- **ਉੱਨਤ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ**: ਰੈਡ ਟੀਮਿੰਗ ਸੁਰੱਖਿਆ ਵੈਰੀਫਿਕੇਸ਼ਨ, ਏਜੰਟ ਮੁਲਾਂਕਣ ਫਰੇਮਵਰਕ, ਲਾਗਤ ਅਪਟਿਮਾਈਜ਼ੇਸ਼ਨ, ਅਤੇ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ
- **ਅਸਲ ਕਾਰੋਬਾਰੀ ਸੰਦਰਭ**: ਫਾਈਲ ਅੱਪਲੋਡ, ਸੇਰਚ ਇੰਟੀਗ੍ਰੇਸ਼ਨ, ਅਤੇ ਡਾਇਨਾਮਿਕ ਸਕੇਲਿੰਗ ਨਾਲ ਰਿਟੇਲਰ ਗਾਹਕ ਸਹਾਇਤਾ ਯੂਜ਼ ਕੇਸ

**ਟੈਕਨੋਲੋਜੀ**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**ਜਟਿਲਤਾ**: ⭐⭐⭐⭐ (ਉੱਨਤ - ਉਤਪਾਦਨ ਤਿਆਰ)  

**ਸਰਬੋਤਮ**: AI ਡਿਵੈਲਪਰ, ਸੋਲੂਸ਼ਨ ਆਰਕੀਟੈਕਟ, ਅਤੇ ਉਤਪਾਦਨ ਮਲਟੀ-ਏਜੰਟ ਸਿਸਟਮ ਬਣਾਉਣ ਵਾਲੀਆਂ ਟੀਮਾਂ  

**ਕਵਿਕ ਸਟਾਰਟ**: ਸ਼ਾਮਲ ARM ਟੈਂਪਲੇਟ ਦੀ ਵਰਤੋਂ ਕਰਕੇ 30 ਮਿੰਟ ਤੋਂ ਘੱਟ ਸਮੇਂ ਵਿੱਚ ਪੂਰਾ ਹੱਲ ਡਿਪਲੌਇ ਕਰੋ `./deploy.sh -g myResourceGroup`  

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

#### **ਮੂਲ ਡਿਪਲੌਇਮੈਂਟ**
- ਸਿੰਗਲ-ਸਰਵਿਸ ਐਪਲੀਕੇਸ਼ਨ
- ਸਧਾਰਨ ਇੰਫਰਾਸਟਰਕਚਰ ਪੈਟਰਨ
- ਬੁਨਿਆਦੀ ਕਨਫਿਗਰੇਸ਼ਨ ਮੈਨੇਜਮੈਂਟ
- ਲਾਗਤ-ਪ੍ਰਭਾਵੀ ਵਿਕਾਸ ਸੈਟਅਪ

#### **ਉੱਨਤ ਸਥਿਤੀਆਂ**
- ਮਲਟੀ-ਸਰਵਿਸ ਆਰਕੀਟੈਕਚਰ
- ਜਟਿਲ ਨੈਟਵਰਕਿੰਗ ਕਨਫਿਗਰੇਸ਼ਨ
- ਡਾਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਪੈਟਰਨ
- ਸੁਰੱਖਿਆ ਅਤੇ ਅਨੁਕੂਲਤਾ ਇੰਪਲੀਮੈਂਟੇਸ਼ਨ

#### **ਉਤਪਾਦਨ-ਤਿਆਰ ਪੈਟਰਨ**
- ਉੱਚ ਉਪਲਬਧਤਾ ਕਨਫਿਗਰੇਸ਼ਨ
- ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਦ੍ਰਿਸ਼ਮਾਨਤਾ
- CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- ਡਿਜਾਸਟਰ ਰਿਕਵਰੀ ਸੈਟਅਪ

## 📖 ਉਦਾਹਰਨਾਂ ਦਾ ਵੇਰਵਾ

### ਸਧਾਰਨ ਵੈਬ ਐਪ - Node.js Express  
**ਟੈਕਨੋਲੋਜੀ**: Node.js, Express, MongoDB, Container Apps  
**ਜਟਿਲਤਾ**: ਸ਼ੁਰੂਆਤੀ  
**ਧਾਰਨਾ**: ਬੁਨਿਆਦੀ ਡਿਪਲੌਇਮੈਂਟ, REST API, NoSQL ਡਾਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ  

### ਸਟੈਟਿਕ ਵੈਬਸਾਈਟ - React SPA  
**ਟੈਕਨੋਲੋਜੀ**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**ਜਟਿਲਤਾ**: ਸ਼ੁਰੂਆਤੀ  
**ਧਾਰਨਾ**: ਸਟੈਟਿਕ ਹੋਸਟਿੰਗ, ਸਰਵਰਲੈਸ ਬੈਕਐਂਡ, ਆਧੁਨਿਕ ਵੈਬ ਵਿਕਾਸ  

### ਕੰਟੇਨਰ ਐਪ - Python Flask  
**ਟੈਕਨੋਲੋਜੀ**: Python Flask, Docker, Container Apps, Container Registry  
**ਜਟਿਲਤਾ**: ਸ਼ੁਰੂਆਤੀ  
**ਧਾਰਨਾ**: ਕੰਟੇਨਰਾਈਜ਼ੇਸ਼ਨ, ਮਾਈਕ੍ਰੋਸਰਵਿਸ ਆਰਕੀਟੈਕਚਰ, API ਵਿਕਾਸ  

### ਡਾਟਾਬੇਸ ਐਪ - C# with Azure SQL  
**ਟੈਕਨੋਲੋਜੀ**: C# ASP.NET Core, Azure SQL Database, App Service  
**ਜਟਿਲਤਾ**: ਮੱਧਮ  
**ਧਾਰਨਾ**: Entity Framework, ਡਾਟਾਬੇਸ ਕਨੈਕਸ਼ਨ, ਵੈਬ API ਵਿਕਾਸ  

### ਸਰਵਰਲੈਸ ਫੰਕਸ਼ਨ - Python Azure Functions  
**ਟੈਕਨੋਲੋਜੀ**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**ਜਟਿਲਤਾ**: ਮੱਧਮ  
**ਧਾਰਨਾ**: ਇਵੈਂਟ-ਡ੍ਰਿਵਨ ਆਰਕੀਟੈਕਚਰ, ਸਰਵਰਲੈਸ ਕਮਪਿਊਟਿੰਗ, ਫੁੱਲ-ਸਟੈਕ ਵਿਕਾਸ  

### ਮਾਈਕ੍ਰੋਸਰਵਿਸ - Java Spring Boot  
**ਟੈਕਨੋਲੋਜੀ**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**ਜਟਿਲਤਾ**: ਮੱਧਮ  
**ਧਾਰਨਾ**: ਮਾਈਕ੍ਰੋਸਰਵਿਸ ਕਮਿਊਨਿਕੇਸ਼ਨ, ਵੰਡੇ ਸਿਸਟਮ, ਉੱਨਤ ਪੈਟਰਨ  

### Azure AI Foundry ਉਦਾਹਰਨਾਂ

#### Azure OpenAI ਚੈਟ ਐਪ  
**ਟੈਕਨੋਲੋਜੀ**: Azure OpenAI, Cognitive Search, App Service  
**ਜਟਿਲਤਾ**: ਮੱਧਮ  
**ਧਾਰਨਾ**: RAG ਆਰਕੀਟੈਕਚਰ, ਵੈਕਟਰ ਸੇਰਚ, LLM ਇੰਟੀਗ੍ਰੇਸ਼ਨ  

#### AI ਡੌਕੂਮੈਂਟ ਪ੍ਰੋਸੈਸਿੰਗ  
**ਟੈਕਨੋਲੋਜੀ**: Azure AI Document Intelligence, Storage, Functions  
**ਜਟਿਲਤਾ**: ਮੱਧਮ  
**ਧਾਰਨਾ**: ਡੌਕੂਮੈਂਟ ਵਿਸ਼ਲੇਸ਼ਣ, OCR, ਡਾਟਾ ਐਕਸਟ੍ਰੈਕਸ਼ਨ  

#### ਮਸ਼ੀਨ ਲਰਨਿੰਗ ਪਾਈਪਲਾਈਨ  
**ਟੈਕਨੋਲੋਜੀ**: Azure ML, MLOps, Container Registry  
**ਜਟਿਲਤਾ**: ਉੱਨਤ  
**ਧਾਰਨਾ**: ਮਾਡਲ ਟ੍ਰੇਨਿੰਗ, ਡਿਪਲੌਇਮੈਂਟ ਪਾਈਪਲਾਈਨ, ਮਾਨੀਟਰਿੰਗ  

## 🛠 ਕਨਫਿਗਰੇਸ਼ਨ ਉਦਾਹਰਨਾਂ

`configurations/` ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਦੁਬਾਰਾ ਵਰਤਣਯੋਗ ਕੰਪੋਨੈਂਟ ਸ਼ਾਮਲ ਹਨ:

### ਵਾਤਾਵਰਣ ਕਨਫਿਗਰੇਸ਼ਨ  
- ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਸੈਟਅਪ  
- ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ ਕਨਫਿਗਰੇਸ਼ਨ  
- ਉਤਪਾਦਨ-ਤਿਆਰ ਕਨਫਿਗਰੇਸ਼ਨ  
- ਮਲਟੀ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ ਸੈਟਅਪ  

### Bicep ਮੋਡਿਊਲ  
- ਦੁਬਾਰਾ ਵਰਤਣਯੋਗ ਇੰਫਰਾਸਟਰਕਚਰ ਕੰਪੋਨੈਂਟ  
- ਆਮ ਸਰੋਤ ਪੈਟਰਨ  
- ਸੁਰੱਖਿਆ-ਮਜ਼ਬੂਤ ਟੈਂਪਲੇਟ  
- ਲਾਗਤ-ਅਪਟਿਮਾਈਜ਼ਡ ਕਨਫਿਗਰੇਸ਼ਨ  

### ਸਹਾਇਕ ਸਕ੍ਰਿਪਟ  
- ਵਾਤਾਵਰਣ ਸੈਟਅਪ ਆਟੋਮੇਸ਼ਨ  
- ਡਾਟਾਬੇਸ ਮਾਈਗ੍ਰੇਸ਼ਨ ਸਕ੍ਰਿਪਟ  
- ਡਿਪਲੌਇਮੈਂਟ ਵੈਰੀਫਿਕੇਸ਼ਨ ਟੂਲ  
- ਲਾਗਤ ਮਾਨੀਟਰਿੰਗ ਯੂਟਿਲਿਟੀ  

## 🔧 ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਗਾਈਡ

### ਆਪਣੇ ਯੂਜ਼ ਕੇਸ ਲਈ ਉਦਾਹਰਨਾਂ ਨੂੰ ਅਨੁਕੂਲਿਤ ਕਰਨਾ

1. **ਪ੍ਰੀਰੀਕੁਇਜ਼ਿਟਸ ਦੀ ਸਮੀਖਿਆ ਕਰੋ**  
   - Azure ਸੇਵਾ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਦੀ ਜਾਂਚ ਕਰੋ  
   - ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੀਮਾਵਾਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ  
   - ਲਾਗਤ ਦੇ ਪ੍ਰਭਾਵਾਂ ਨੂੰ ਸਮਝੋ  

2. **ਕਨਫਿਗਰੇਸ਼ਨ ਨੂੰ ਸੋਧੋ**  
   - `azure.yaml` ਸੇਵਾ ਦੀਆਂ ਵਿਆਖਿਆਵਾਂ ਨੂੰ ਅਪਡੇਟ ਕਰੋ  
   - Bicep ਟੈਂਪਲੇਟ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰੋ  
   - ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਨੂੰ ਅਨੁਕੂਲਿਤ ਕਰੋ  

3. **ਥੋਰੋਲੀ ਟੈਸਟ ਕਰੋ**  
   - ਪਹਿਲਾਂ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਵਿੱਚ ਡਿਪਲੌਇ ਕਰੋ  
   - ਕਾਰਗੁਜ਼ਾਰੀ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ  
   - ਸਕੇਲਿੰਗ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ  

4. **ਸੁਰੱਖਿਆ ਸਮੀਖਿਆ**  
   - ਐਕਸੈਸ ਕੰਟਰੋਲ ਦੀ ਸਮੀਖਿਆ ਕਰੋ  
   - ਸੀਕ੍ਰੇਟ ਮੈਨੇਜਮੈਂਟ ਲਾਗੂ ਕਰੋ  
   - ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਅਲਰਟਿੰਗ ਨੂੰ ਯਕੀਨੀ ਬਣਾਓ  

## 📊
- [ਟੂਡੂ ਐਪ C# ਅਤੇ Azure SQL ਨਾਲ](https://github.com/Azure-Samples/todo-csharp-sql)
- [ਟੂਡੂ ਐਪ Python ਅਤੇ MongoDB ਨਾਲ](https://github.com/Azure-Samples/todo-python-mongo)
- [ਟੂਡੂ ਐਪ Node.js ਅਤੇ PostgreSQL ਨਾਲ](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React ਵੈੱਬ ਐਪ C# API ਨਾਲ](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps ਜੌਬ](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java ਨਾਲ](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### ਸਭ ਤੋਂ ਵਧੀਆ ਤਰੀਕੇ
- [Azure ਵੈਲ-ਆਰਕੀਟੈਕਟਡ ਫਰੇਮਵਰਕ](https://learn.microsoft.com/en-us/azure/well-architected/)
- [ਕਲਾਉਡ ਅਡਾਪਸ਼ਨ ਫਰੇਮਵਰਕ](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 ਉਦਾਹਰਨਾਂ ਵਿੱਚ ਯੋਗਦਾਨ ਪਾਉਣਾ

ਕੀ ਤੁਹਾਡੇ ਕੋਲ ਕੋਈ ਲਾਭਦਾਇਕ ਉਦਾਹਰਨ ਹੈ ਜੋ ਸਾਂਝਾ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ? ਅਸੀਂ ਯੋਗਦਾਨਾਂ ਦਾ ਸਵਾਗਤ ਕਰਦੇ ਹਾਂ!

### ਜਮ੍ਹਾਂ ਕਰਨ ਦੇ ਨਿਯਮ
1. ਸਥਾਪਿਤ ਡਾਇਰੈਕਟਰੀ ਸਟ੍ਰਕਚਰ ਦੀ ਪਾਲਣਾ ਕਰੋ
2. ਵਿਸਤ੍ਰਿਤ README.md ਸ਼ਾਮਲ ਕਰੋ
3. ਕਨਫਿਗਰੇਸ਼ਨ ਫਾਈਲਾਂ ਵਿੱਚ ਟਿੱਪਣੀਆਂ ਸ਼ਾਮਲ ਕਰੋ
4. ਜਮ੍ਹਾਂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਪੂਰੀ ਤਰ੍ਹਾਂ ਟੈਸਟ ਕਰੋ
5. ਲਾਗਤ ਦੇ ਅੰਦਾਜ਼ੇ ਅਤੇ ਪੂਰਵ ਸ਼ਰਤਾਂ ਸ਼ਾਮਲ ਕਰੋ

### ਉਦਾਹਰਨ ਟੈਂਪਲੇਟ ਸਟ੍ਰਕਚਰ
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

**ਪ੍ਰੋ ਟਿਪ**: ਸਭ ਤੋਂ ਸਧਾਰਨ ਉਦਾਹਰਨ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ ਜੋ ਤੁਹਾਡੇ ਤਕਨਾਲੋਜੀ ਸਟੈਕ ਨਾਲ ਮੇਲ ਖਾਂਦਾ ਹੈ, ਫਿਰ ਹੌਲੀ-ਹੌਲੀ ਵਧੇਰੇ ਜਟਿਲ ਸਥਿਤੀਆਂ ਵੱਲ ਵਧੋ। ਹਰ ਉਦਾਹਰਨ ਪਿਛਲੇ ਵਾਲੇ ਤੋਂ ਸਿੱਖੇ ਗਏ ਸੰਕਲਪਾਂ 'ਤੇ ਅਧਾਰਿਤ ਹੁੰਦੀ ਹੈ!

**ਅਗਲੇ ਕਦਮ**: 
- ਇੱਕ ਉਦਾਹਰਨ ਚੁਣੋ ਜੋ ਤੁਹਾਡੇ ਹੁਨਰ ਦੇ ਪੱਧਰ ਨਾਲ ਮੇਲ ਖਾਂਦਾ ਹੈ
- ਉਦਾਹਰਨ ਦੇ README ਵਿੱਚ ਦਿੱਤੇ ਸੈਟਅੱਪ ਨਿਰਦੇਸ਼ਾਂ ਦੀ ਪਾਲਣਾ ਕਰੋ
- ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਨਾਲ ਪ੍ਰਯੋਗ ਕਰੋ
- ਆਪਣੇ ਸਿੱਖੇ ਸਾਂਝੇ ਕਰੋ ਕਮਿਊਨਿਟੀ ਨਾਲ

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਅਧਿਐਨ ਗਾਈਡ](../resources/study-guide.md)
- **ਵਾਪਸ ਜਾਓ**: [ਮੁੱਖ README](../README.md)

---

**ਅਸਵੀਕਰਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦਾ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁੱਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।  
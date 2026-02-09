# ਉਦਾਹਰਨਾਂ - ਪ੍ਰਯੋਗਕਾਰੀ AZD ਟੈਮਪਲੇਟ ਅਤੇ ਸੰਰਚਨਾਵਾਂ

**ਉਦਾਹਰਨਾਂ ਰਾਹੀਂ ਸਿੱਖਣਾ - ਅਧਿਆਇ ਅਨੁਸਾਰ ਸੰਗਠਿਤ**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../README.md)
- **📖 ਅਧਿਆਇ ਨਕਸ਼ਾ**: ਸਿੱਖਣ ਦੀ জਟਿਲਤਾ ਅਨੁਸਾਰ ਉਦਾਹਰਨਾਂ ਸੰਗਠਿਤ
- **🚀 ਲੋਕਲ ਉਦਾਹਰਨ**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 ਬਾਹਰੀ AI ਉਦਾਹਰਨ**: Azure Samples ਗਿਟਹੱਬ ਰਿਪੋਜ਼ੀਟਰੀਜ਼ ਲਈ ਲਿੰਕ

> **📍 ਮਹੱਤਵপূর্ণ: ਲੋਕਲ ਬਨਾਮ ਬਾਹਰੀ ਉਦਾਹਰਨਾਂ**  
> ਇਸ ਰਿਪੋਜ਼ਟਰੀ ਵਿੱਚ **4 ਪੂਰਨ ਲੋਕਲ ਉਦਾਹਰਨਾਂ** ਦੀ ਪੂਰੀ ਲਾਗੂਆਤੀ ਰਿਪੋਜ਼ਟਰੀ ਸ਼ਾਮਲ ਹੈ:  
> - **Azure OpenAI Chat** (GPT-4 ਡੀਪਲੋਇਮੈਂਟ ਚੈਟ ਇੰਟਰਫੇਸ ਨਾਲ)  
> - **Container Apps** (ਸਾਦਾ Flask API + ਮਾਈਕਰੋਸਰਵਿਸز)  
> - **Database App** (ਵੈੱਬ + SQL ਡੇਟਾਬੇਸ)  
> - **Retail Multi-Agent** (ਐਂਟਰਪਰਾਈਜ਼ AI ਸਮਾਧਾਨ)  
>  
> ਵਾਧੂ ਉਦਾਹਰਨਾਂ **ਬਾਹਰੀ ਰੈਫਰੈਂਸ** ਹਨ Azure-Samples ਰਿਪੋਜ਼ੀਟਰੀਆਂ ਦੇ, ਜਿਨ੍ਹਾਂ ਨੂੰ ਤੁਸੀਂ ਕਲੋਨ ਕਰ ਸਕਦੇ ਹੋ।

## ਪਰੀਚਯ

ਇਹ ਡਾਇਰੈਕਟਰੀ ਹੱਥੋਂ-ਹੱਥ ਅਭਿਆਸ ਰਾਹੀਂ Azure Developer CLI ਸਿੱਖਣ ਵਿੱਚ ਮਦਦ ਲਈ ਪ੍ਰਯੋਗਕਾਰੀ ਉਦਾਹਰਨਾਂ ਅਤੇ ਰੈਫਰੈਂਸ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ। Retail Multi-Agent ਦ੍ਰਿਸ਼ਟਾਂਤ ਇੱਕ ਪੂਰਾ, ਉਤਪਾਦਨ-ਤਿਆਰ ਲਾਗੂਆਤੀ ਕੇਸ ਹੈ ਜੋ ਇਸ ਰਿਪੋਜ਼ਟਰੀ ਵਿੱਚ ਸ਼ਾਮਲ ਹੈ। ਵਾਧੂ ਉਦਾਹਰਨਾਂ ਅਧਿਕਾਰਕ Azure Samples ਨੂੰ ਰੈਫਰ ਕਰਦੀਆਂ ਹਨ ਜਿਹੜੀਆਂ ਵੱਖ-ਵੱਖ AZD ਪੈਟਰਨ ਦਿਖਾਉਂਦੀਆਂ ਹਨ।

### ਜਟਿਲਤਾ ਦਰ ਦਰਜਾ ਕ੍ਲਾਸੀਫਿਕੇਸ਼ਨ

- ⭐ **ਸ਼ੁਰੂਆਤੀ** - ਬੁਨਿਆਦੀ ਧਾਰਣਾਵਾਂ, ਇੱਕ ਸੇਵਾ, 15-30 ਮਿੰਟ
- ⭐⭐ **ਮੱਧਮ** - ਕਈ ਸੇਵਾਵਾਂ, ਡੇਟਾਬੇਸ ਇੰਟਿਗ੍ਰੇਸ਼ਨ, 30-60 ਮਿੰਟ
- ⭐⭐⭐ **ਉੱਨਤ** - ਜਟਿਲ ਆਰਕੀਟੈਕਚਰ, AI ਇੰਟੀਗ੍ਰੇਸ਼ਨ, 1-2 ਘੰਟੇ
- ⭐⭐⭐⭐ **ਮਾਹਿਰ** - ਉਤਪਾਦਨ-ਤਿਆਰ, ਐਂਟਰਪਰਾਈਜ਼ ਪੈਟਰਨ, 2+ ਘੰਟੇ

## 🎯 ਇਸ ਰਿਪੋਜ਼ਟਰੀ ਵਿੱਚ ਅਸਲ ਵਿੱਚ ਕੀ ਹੈ

### ✅ ਲੋਕਲ ਲਾਗੂਆਤੀ (ਤਤਕਾਲ ਵਰਤੋਂ ਲਈ ਤਿਆਰ)

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**ਇਸ ਰਿਪੋਜ਼ਟਰੀ ਵਿੱਚ ਪੂਰਾ GPT-4 ਡੀਪਲੋਇਮੈਂਟ ਚੈਟ ਇੰਟਰਫੇਸ ਸਮੇਤ**

- **ਟਿਕਾਣਾ:** `examples/azure-openai-chat/`
- **ਜਟਿਲਤਾ:** ⭐⭐ (ਮੱਧਮ)
- **ਇਸ ਵਿੱਚ ਸ਼ਾਮਲ ਹੈ:**
  - ਪੂਰਾ Azure OpenAI ਡੀਪਲੋਇਮੈਂਟ (GPT-4)
  - Python ਕਮਾਂਡ-ਲਾਈਨ ਚੈਟ ਇੰਟਰਫੇਸ
  - Key Vault ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਸੁਰੱਖਿਅਤ API ਕੀਆਂ ਲਈ
  - Bicep ਇੰਫ੍ਰਾਸਟ੍ਰਕਚਰ ਟੈਮਪਲੇਟ
  - ਟੋਕਨ ਉਪਯੋਗਤਾ ਅਤੇ ਲਾਗਤ ਟ੍ਰੈਕਿੰਗ
  - ਰੇਟ ਲਿਮਿਟਿੰਗ ਅਤੇ ਐਰਰ ਹੈਂਡਲਿੰਗ

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ:**
```bash
# example ਫੋਲਡਰ ਵਿੱਚ ਜਾਓ
cd examples/azure-openai-chat

# ਸਭ ਕੁਝ ਤੈਨਾਤ ਕਰੋ
azd up

# ਨਿਰਭਰਤਾਵਾਂ ਸਥਾਪਿਤ ਕਰੋ ਅਤੇ ਗੱਲਬਾਤ ਸ਼ੁਰੂ ਕਰੋ
pip install -r src/requirements.txt
python src/chat.py
```

**ਟੈਕਨੋਲੋਜੀਜ਼:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**ਇਸ ਰਿਪੋਜ਼ਟਰੀ ਵਿੱਚ ਵਿਆਪਕ ਕੰਟੇਨਰ ਡੀਪਲੋਇਮੈਂਟ ਉਦਾਹਰਨਾਂ ਸ਼ਾਮਲ ਹਨ**

- **ਟਿਕਾਣਾ:** `examples/container-app/`
- **ਜਟਿਲਤਾ:** ⭐-⭐⭐⭐⭐ (ਸ਼ੁਰੂਆਤੀ ਤੋਂ ਉੱਨਤ)
- **ਇਸ ਵਿੱਚ ਸ਼ਾਮਲ ਹੈ:**
  - [Master Guide](container-app/README.md) - ਕੰਟੇਨਰ ਡੀਪਲੋਇਮੈਂਟ ਦੀ ਪੂਰੀ ਝਲਕ
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - ਬੁਨਿਆਦੀ REST API ਉਦਾਹਰਨ
  - [Microservices Architecture](../../../examples/container-app/microservices) - ਉਤਪਾਦਨ-ਤਿਆਰ ਬਹੁ-ਸੇਵਾ ਡੀਪਲੋਇਮੈਂਟ
  - ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ, ਉਤਪਾਦਨ, ਅਤੇ ਉੱਨਤ ਪੈਟਰਨ
  - ਮਾਨੀਟਰਿੰਗ, ਸੁਰੱਖਿਆ, ਅਤੇ ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ:**
```bash
# ਮਾਸਟਰ ਗਾਈਡ ਵੇਖੋ
cd examples/container-app

# ਸਧਾਰਨ Flask API ਨੂੰ ਤੈਨਾਤ ਕਰੋ
cd simple-flask-api
azd up

# ਮਾਈਕ੍ਰੋਸਰਵਿਸਾਂ ਦੀ ਉਦਾਹਰਣ ਤੈਨਾਤ ਕਰੋ
cd ../microservices
azd up
```

**ਟੈਕਨੋਲੋਜੀਜ਼:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**ਇਸ ਰਿਪੋਜ਼ਟਰੀ ਵਿੱਚ ਪੂਰਾ ਉਤਪਾਦਨ-ਤਿਆਰ ਲਾਗੂਆਤੀ ਕੇਸ ਸ਼ਾਮਲ ਹੈ**

- **ਟਿਕਾਣਾ:** `examples/retail-multiagent-arm-template/`
- **ਜਟਿਲਤਾ:** ⭐⭐⭐⭐ (ਉੱਨਤ)
- **ਇਸ ਵਿੱਚ ਸ਼ਾਮਲ ਹੈ:**
  - ਪੂਰਾ ARM ਡੀਪਲੋਇਮੈਂਟ ਟੈਮਪਲੇਟ
  - ਮਲਟੀ-ਏਜੰਟ ਆਰਕੀਟੈਕਚਰ (Customer + Inventory)
  - Azure OpenAI ਇੰਟੀਗ੍ਰੇਸ਼ਨ
  - RAG ਨਾਲ AI Search
  - ਵਿਆਪਕ ਮਾਨੀਟਰਿੰਗ
  - ਇੱਕ-ਕਲਿਕ ਡੀਪਲੋਇਮੈਂਟ ਸਕ੍ਰਿਪਟ

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**ਟੈਕਨੋਲੋਜੀਜ਼:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 ਬਾਹਰੀ Azure Samples (ਕਲੋਨ ਕਰਕੇ ਵਰਤੋ)

ਹੇਠਾਂ ਦਿੱਤੀਆਂ ਉਦਾਹਰਨਾਂ ਅਧਿਕਾਰਕ Azure-Samples ਰਿਪੋਜ਼ੀਟਰੀਜ਼ ਵਿੱਚ ਰੱਖੀਆਂ ਗਈਆਂ ਹਨ। ਵੱਖ-ਵੱਖ AZD ਪੈਟਰਨ ਨੂੰ ਖੋਜਣ ਲਈ ਉਹਨਾਂ ਨੂੰ ਕਲੋਨ ਕਰੋ:

### ਸਧਾਰਣ ਐਪਲੀਕੇਸ਼ਨ (ਅਧਿਆਇ 1-2)

| Template | Repository | Complexity | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**ਕਿਵੇਂ ਵਰਤਣਾ ਹੈ:**
```bash
# ਕਿਸੇ ਵੀ ਉਦਾਹਰਣ ਨੂੰ ਕਲੋਨ ਕਰੋ
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# ਤੈਨਾਤ ਕਰੋ
azd up
```

### AI ਐਪਲੀਕੇਸ਼ਨ ਉਦਾਹਰਨਾਂ (ਅਧਿਆਇ 2, 5, 8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | ਬੁਨਿਆਦੀ AI ਚੈਟ |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | ਏਜੰਟ ਫਰੇਮਵਰਕ |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG ਪੈਟਰਨ |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | ਐਂਟਰਪਰਾਈਜ਼ AI |

### ਡੇਟਾਬੇਸ ਅਤੇ ਉੱਨਤ ਪੈਟਰਨ (ਅਧਿਆਇ 3-8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | ਡੇਟਾਬੇਸ ਇੰਟਿਗ੍ਰੇਸ਼ਨ |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL ਸਰਵਰਲੈੱਸ |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | ਬਹੁ-ਸੇਵਾ |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਹ ਉਦਾਹਰਨਾਂ 'ਤੇ ਕੰਮ ਕਰਨ ਨਾਲ, ਤੁਸੀਂ:
- ਯਥਾਰਥ ਐਪਲੀਕੇਸ਼ਨ ਸਿੱਥਾਂਤਾਂ ਨਾਲ Azure Developer CLI ਵਰਕਫਲੋਜ਼ ਦਾ ਅਭਿਆਸ ਕਰੋਂਗੇ
- ਵੱਖ-ਵੱਖ ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰਾਂ ਅਤੇ ਉਹਨਾਂ ਦੇ azd ਲਾਗੂਆਤਾਂ ਨੂੰ ਸਮਝੋਗੇ
- ਵੱਖ-ਵੱਖ Azure ਸੇਵਾਵਾਂ ਲਈ Infrastructure as Code ਪੈਟਰਨ ਮਾਹਿਰ ਕਰੋਗੇ
- ਸੰਰਚਨਾ ਪ੍ਰਬੰਧਨ ਅਤੇ ਮਾਹੌਲ-ਵਿਸ਼ੇਸ਼ ਡੀਪਲੋਇਮੈਂਟ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰਨਾ ਸਿੱਖੋਗੇ
- ਯਥਾਰਥ ਪਰੇਦ੍ਰਿਸ਼ਿਆਂ ਵਿੱਚ ਮਾਨੀਟਰਿੰਗ, ਸੁਰੱਖਿਆ ਅਤੇ ਸਕੇਲਿੰਗ ਪੈਟਰਨ ਅਮਲ ਕਰੋਗੇ
- ਅਸਲੀ ਡੀਪਲੋਇਮੈਂਟ ਦੀਆਂ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਟ੍ਰਬਲਸ਼ੂਟ ਅਤੇ ਡੀਬੱਗ ਕਰਨ ਦਾ ਅਨੁਭਵ ਪ੍ਰਾਪਤ ਕਰੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਹ ਉਦਾਹਰਨਾਂ ਪੂਰੀ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- Azure Developer CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਵੱਖ-ਵੱਖ ਐਪਲੀਕੇਸ਼ਨ ਕਿਸਮਾਂ ਨੂੰ ਭਰੋਸੇਯੋਗ ਢੰਗ ਨਾਲ ਡੀਪਲੋਇ ਕਰਨਾ
- ਦਿੱਤੇ ਗਏ ਟੈਮਪਲੇਟਾਂ ਨੂੰ ਆਪਣੇ ਐਪਲੀਕੇਸ਼ਨ ਦੀਆਂ ਲੋੜਾਂ ਮੁਤਾਬਕ ਅਡੈਪਟ ਕਰਨਾ
- Bicep ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕਸਟਮ ਇੰਫ੍ਰਾਸਟ੍ਰਕਚਰ ਪੈਟਰਨ ਡਿਜ਼ਾਈਨ ਅਤੇ ਲਾਗੂ ਕਰਨਾ
- ਢੁਕਵੀਂ ਨਿਰਭਰਤਾਵਾਂ ਦੇ ਨਾਲ ਜਟਿਲ ਬਹੁ-ਸੇਵਾ ਐਪਲੀਕੇਸ਼ਨਾਂ ਦੀ ਸੰਰਚਨਾ ਕਰਨਾ
- ਅਸਲੀ ਪਰਿਸਥਿਤੀਆਂ ਵਿੱਚ ਸੁਰੱਖਿਆ, ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਦੇ ਸਿੱਧ-ਉਤਮ ਅਭਿਆਸ ਲਾਗੂ ਕਰਨਾ
- ਅਭਿਆਸਿਕ ਅਨੁਭਵ ਦੇ ਆਧਾਰ 'ਤੇ ਡੀਪਲੋਇਮੈਂਟ ਨੂੰ ਟ੍ਰਬਲਸ਼ੂਟ ਅਤੇ ਅਪਟੀਮਾਈਜ਼ ਕਰਨਾ

## ਡਾਇਰੈਕਟਰੀ ਰਚਨਾ

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

## ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ ਉਦਾਹਰਨਾਂ

> **💡 AZD ਵਿੱਚ ਨਵਾਂ ਹੋ?** ਉਦਾਹਰਨ #1 (Flask API) ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ - ਇਹ ~20 ਮਿੰਟ ਲੈਂਦਾ ਹੈ ਅਤੇ ਮੁੱਖ ਧਾਰਣਾਵਾਂ ਸਿਖਾਉਂਦਾ ਹੈ।

### ਸ਼ੁਰੂਆਤੀ ਲਈ
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (ਲੋਕਲ) ⭐  
   ਇੱਕ ਸਾਦਾ REST API ਡੀਪਲੋਇ ਕਰੋ ਜਿਸ ਵਿੱਚ scale-to-zero ਹੈ  
   **ਸਮਾਂ:** 20-25 ਮਿੰਟ | **ਲਾਗਤ:** $0-5/ਮਹੀਨਾ  
   **ਤੁਸੀਂ ਸਿੱਖੋਗੇ:** ਬੁਨਿਆਦੀ azd ਵਰਕਫਲੋ, ਕੰਟੇਨਰਾਈਜ਼ੇਸ਼ਨ, ਹੈਲਥ ਪ੍ਰਭੋਬ  
   **ਉਮੀਦ ਕੀਤੀ ਨਤੀਜਾ:** "Hello, World!" ਵਾਪਸ ਕਰਨ ਵਾਲਾ ਕੰਮ ਕਰਦਾ API ਐਂਡਪੋਇੰਟ ਜਿਸਨੂੰ ਮਾਨੀਟਰ ਕੀਤਾ ਜਾ ਸਕੇ

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB ਨਾਲ Node.js Express ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਡੀਪਲੋਇ ਕਰੋ  
   **ਸਮਾਂ:** 25-35 ਮਿੰਟ | **ਲਾਗਤ:** $10-30/ਮਹੀਨਾ  
   **ਤੁਸੀਂ ਸਿੱਖੋਗੇ:** ਡੇਟਾਬੇਸ ਇੰਟਿਗ੍ਰੇਸ਼ਨ, ਮਾਹੌਲ ਵੇਰੀਏਬਲ, ਕਨੈਕਸ਼ਨ ਸਟ੍ਰਿੰਗਜ਼  
   **ਉਮੀਦ ਕੀਤੀ ਨਤੀਜਾ:** CRUD ਫੰਕਸ਼ਨਲਿਟੀ ਵਾਲੀ Todo ਲਿਸਟ ਐਪ

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps ਨਾਲ React ਸਟੇਟਿਕ ਵੈੱਬਸਾਈਟ ਹੋਸਟ ਕਰੋ  
   **ਸਮਾਂ:** 20-30 ਮਿੰਟ | **ਲਾਗਤ:** $0-10/ਮਹੀਨਾ  
   **ਤੁਸੀਂ ਸਿੱਖੋਗੇ:** ਸਟੇਟਿਕ ਹੋਸਟਿੰਗ, ਸਰਵਰਲੈੱਸ ਫੰਕਸ਼ਨਜ਼, CDN ਡੀਪਲੋਇਮੈਂਟ  
   **ਉਮੀਦ ਕੀਤੀ ਨਤੀਜਾ:** API ਬੈਕਐਂਡ ਨਾਲ React UI, ਆਟੋਮੈਟਿਕ SSL, ਗਲੋਬਲ CDN

### ਮੱਧਮ ਵਰਤੋਂਕਾਰਾਂ ਲਈ
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (ਲੋਕਲ) ⭐⭐  
   GPT-4 ਨੂੰ ਚੈਟ ਇੰਟਰਫੇਸ ਅਤੇ ਸੁਰੱਖਿਅਤ API ਕੀ ਪ੍ਰਬੰਧਨ ਨਾਲ ਡੀਪਲੋਇ ਕਰੋ  
   **ਸਮਾਂ:** 35-45 ਮਿੰਟ | **ਲਾਗਤ:** $50-200/ਮਹੀਨਾ  
   **ਤੁਸੀਂ ਸਿੱਖੋਗੇ:** Azure OpenAI ਡੀਪਲੋਇਮੈਂਟ, Key Vault ਇੰਟੀਗ੍ਰੇਸ਼ਨ, ਟੋਕਨ ਟ੍ਰੈਕਿੰਗ  
   **ਉਮੀਦ ਕੀਤੀ ਨਤੀਜਾ:** GPT-4 ਅਤੇ ਲਾਗਤ ਮਾਨੀਟਰਿੰਗ ਨਾਲ ਕੰਮ ਕਰਦਾ ਚੈਟ ਐਪ

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (ਲੋਕਲ) ⭐⭐⭐⭐  
   ਉਤਪਾਦਨ-ਤਿਆਰ ਬਹੁ-ਸੇਵਾ ਆਰਕੀਟੈਕਚਰ  
   **ਸਮਾਂ:** 45-60 ਮਿੰਟ | **ਲਾਗਤ:** $50-150/ਮਹੀਨਾ  
   **ਤੁਸੀਂ ਸਿੱਖੋਗੇ:** ਸੇਵਾ ਸੰਚਾਰ, ਮੈਸੇਜ ਕੁਇੰਗ, ਡਿਸਟ੍ਰੀਬਿਊਟਿਡ ਟ੍ਰੇਸਿੰਗ  
   **ਉਮੀਦ ਕੀਤੀ ਨਤੀਜਾ:** ਮਾਨੀਟਰਿੰਗ ਨਾਲ 2-ਸੇਵਾ ਪ੍ਰਣਾਲੀ (API Gateway + Product Service)

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API ਅਤੇ Azure SQL Database ਨਾਲ ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ  
   **ਸਮਾਂ:** 30-45 ਮਿੰਟ | **ਲਾਗਤ:** $20-80/ਮਹੀਨਾ  
   **ਤੁਸੀਂ ਸਿੱਖੋਗੇ:** Entity Framework, ਡੇਟਾਬੇਸ ਮਾਈਗ੍ਰੇਸ਼ਨ, ਕਨੈਕਸ਼ਨ ਸੁਰੱਖਿਆ  
   **ਉਮੀਦ ਕੀਤੀ ਨਤੀਜਾ:** Azure SQL ਬੈਕਐਂਡ ਵਾਲਾ C# API, ਆਟੋਮੈਟਿਕ ਸਕੀਮਾ ਡੀਪਲੋਇਮੈਂਟ

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ਟ੍ਰਿਗਰਾਂ ਅਤੇ Cosmos DB ਨਾਲ Python Azure Functions  
   **ਸਮਾਂ:** 30-40 ਮਿੰਟ | **ਲਾਗਤ:** $10-40/ਮਹੀਨਾ  
   **ਤੁਸੀਂ ਸਿੱਖੋਗੇ:** ਇਵੈਂਟ-ਚਲਿਤ ਆਰਕੀਟੈਕਚਰ, ਸਰਵਰਲੈੱਸ ਸਕੇਲਿੰਗ, NoSQL ਇੰਟੀਗ੍ਰੇਸ਼ਨ  
   **ਉਮੀਦ ਕੀਤੀ ਨਤੀਜਾ:** HTTP ਬੇਸਡ ਰਿਸਪਾਂਸ ਕਰਨ ਵਾਲੀ Function app ਜਿਸਦਾ ਸਟੋਰੇਜ Cosmos DB ਹੈ

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps ਅਤੇ API ਗੇਟਵੇ ਨਾਲ ਬਹੁ-ਸੇਵਾ Java ਐਪਲੀਕੇਸ਼ਨ  
   **ਸਮਾਂ:** 60-90 ਮਿੰਟ | **ਲਾਗਤ:** $80-200/ਮਹੀਨਾ  
   **ਤੁਸੀਂ ਸਿੱਖੋਗੇ:** Spring Boot ਡੀਪਲੋਇਮੈਂਟ, ਸੇਵਾ ਮੈਸ਼, ਲੋਡ ਬੈਲਨਸਿੰਗ  
   **ਉਮੀਦ ਕੀਤੀ ਨਤੀਜਾ:** ਸੇਵਾ ਡਿਸਕਵਰੀ ਅਤੇ ਰੂਟਿੰਗ ਨਾਲ ਬਹੁ-ਸੇਵਾ Java ਸਿਸਟਮ

### Microsoft Foundry ਟੈਮਪਲੇਟਸ

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   ਪੂਰਾ GPT-4 ਡੀਪਲੋਇਮੈਂਟ ਚੈਟ ਇੰਟਰਫੇਸ ਸਮੇਤ  
   **ਸਮਾਂ:** 35-45 ਮਿੰਟ | **ਲਾਗਤ:** $50-200/ਮਹੀਨਾ  
   **ਉਮੀਦ ਕੀਤੀ ਨਤੀਜਾ:** ਟੋਕਨ ਟਰੈਕਿੰਗ ਅਤੇ ਲਾਗਤ ਮਾਨੀਟਰਿੰਗ ਨਾਲ ਕੰਮ ਕਰਦਾ ਚੈਟ ਐਪ

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG ਆਰਕੀਟੈਕਚਰ ਵਾਲਾ ਬੁੱਧੀਮਾਨ ਚੈਟ ਐਪ  
   **ਸਮਾਂ:** 60-90 ਮਿੰਟ | **ਲਾਗਤ:** $100-300/ਮਹੀਨਾ  
   **ਉਮੀਦ ਕੀਤੀ ਨਤੀਜਾ:** ਡੌਕਯੂਮੈਂਟ ਸੇਰਚ ਅਤੇ ਹਵਾਲਿਆਂ ਨਾਲ RAG-ਸਕਸ਼ਮ ਚੈਟ ਇੰਟਰਫੇਸ

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਡੌਕਯੂਮੈਂਟ ਵਿਸ਼ਲੇਸ਼ਣ  
   **ਸਮਾਂ:** 40-60 ਮਿੰਟ | **ਲਾਗਤ:** $20-80/ਮਹੀਨਾ  
   **ਉਮੀਦ ਕੀਤੀ ਨਤੀਜਾ:** ਅਪਲੋਡ ਕੀਤੇ ਡੌਕਯੂਮੈਂਟ ਤੋਂ ਟੈਕਸਟ, ਟੇਬਲ ਅਤੇ ਐਂਟੀਟੀਜ਼ ਨਿਕਾਲਣ ਵਾਲਾ API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning ਨਾਲ MLOps ਵਰਕਫਲੋ  
   **ਸਮਾਂ:** 2-3 ਘੰਟੇ | **ਲਾਗਤ:** $150-500/ਮਹੀਨਾ  
   **ਉਮੀਦ ਕੀਤੀ ਨਤੀਜਾ:** ਟ੍ਰੇਨਿੰਗ, ਡੀਪਲੋਇਮੈਂਟ ਅਤੇ ਮਾਨੀਟਰਿੰਗ ਵਾਲਾ ਆਟੋਮੇਟਡ ML ਪਾਈਪਲਾਈਨ

### ਹਕੀਕਤੀ ਦੁਨੀਆ ਦੇ ਪਰਿਦ੍ਰਸ਼

#### **Retail Multi-Agent Solution** 🆕
**[Complete Implementation Guide](./retail-scenario.md)**

ਇੱਕ ਵਿਸਥਾਰਪੂਰਣ, ਉਤਪਾਦਨ-ਤਿਆਰ ਮਲਟੀ-ਏਜੰਟ ਗ੍ਰਾਹਕ ਸਹਾਇਤਾ ਸਮਾਧਾਨ ਜੋ AZD ਨਾਲ ਐਂਟਰਪਰਾਈਜ਼-ਗਰੇਡ AI ਐਪਲੀਕੇਸ਼ਨ ਡੀਪਲੋਇਮੈਂਟ ਦਰਸਾਉਂਦਾ ਹੈ। ਇਹ ਦ੍ਰਿਸ਼ਟਾਂਤ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ:

- **ਪੂਰੀ ਆਰਕੀਟੈਕਚਰ**: ਵਿਸ਼ੇਸ਼ ਕਰਕੇ ਗ੍ਰਾਹਕ ਸੇਵਾ ਅਤੇ ਇਨਵੈਂਟਰੀ ਪ੍ਰਬੰਧਨ ਏਜੰਟਾਂ ਵਾਲੀ ਮਲਟੀ-ਏਜੰਟ ਪ੍ਰਣਾਲੀ
- **Production Infrastructure**: Multi-region Azure OpenAI deployments, AI Search, Container Apps, and comprehensive monitoring
- **Ready-to-Deploy ARM Template**: One-click deployment with multiple configuration modes (Minimal/Standard/Premium)
- **Advanced Features**: Red teaming security validation, agent evaluation framework, cost optimization, and troubleshooting guides
- **Real Business Context**: Retailer customer support use case with file uploads, search integration, and dynamic scaling

**Technologies**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Advanced - Enterprise Production Ready)

**Perfect for**: AI developers, solution architects, and teams building production multi-agent systems

**Quick Start**: Deploy the complete solution in under 30 minutes using the included ARM template with `./deploy.sh -g myResourceGroup`

## 📋 ਵਰਤੋਂ ਦੇ ਨਿਰਦੇਸ਼

### ਪੂਰਵ-ਸ਼ਰਤਾਂ

Before running any example:
- ✅ Azure subscription with Owner or Contributor access
- ✅ Azure Developer CLI installed ([ਇੰਸਟਾਲੇਸ਼ਨ ਗਾਈਡ](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop running (for container examples)
- ✅ Appropriate Azure quotas (check example-specific requirements)

> **💰 ਖਰਚੇ ਦੀ ਚੇਤਾਵਨੀ:** All examples create real Azure resources that incur charges. See individual README files for cost estimates. Remember to run `azd down` when done to avoid ongoing costs.

### ਉਦਾਹਰਣਾਂ ਨੂੰ ਸਥਾਨਕ ਤੌਰ 'ਤੇ ਚਲਾਉਣਾ

1. **ਉਦਾਹਰਨ ਕਲੋਨ ਜਾਂ ਕਾਪੀ ਕਰੋ**
   ```bash
   # ਇੱਛਿਤ ਉਦਾਹਰਨ ਤੇ ਜਾਓ
   cd examples/simple-web-app
   ```

2. **AZD ਵਾਤਾਵਰਨ ਸ਼ੁਰੂ ਕਰੋ**
   ```bash
   # ਮੌਜੂਦਾ ਟੈਂਪਲੇਟ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ
   azd init
   
   # ਜਾਂ ਨਵਾਂ ਵਾਤਾਵਰਣ ਬਣਾਓ
   azd env new my-environment
   ```

3. **ਵਾਤਾਵਰਨ ਕੰਫਿਗਰ ਕਰੋ**
   ```bash
   # ਜਰੂਰੀ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **ਡਿਪਲੋਇ ਕਰੋ**
   ```bash
   # ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
   azd up
   ```

5. **ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ**
   ```bash
   # ਸੇਵਾ ਦੇ ਐਂਡਪੋਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
   azd env get-values
   
   # ਐਂਡਪੋਇੰਟ ਦੀ ਜਾਂਚ ਕਰੋ (ਉਦਾਹਰਨ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **ਉਮੀਦ ਕੀਤੇ ਗਿਆ ਸਫਲਤਾ ਦੇ ਸੰਕੇਤ:**
   - ✅ `azd up` completes without errors
   - ✅ Service endpoint returns HTTP 200
   - ✅ Azure Portal shows "Running" status
   - ✅ Application Insights receiving telemetry

> **⚠️ ਮੁਸ਼ਕਲਾਂ?** ਡਿਪਲੋਇਮੈਂਟ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਲਈ [ਆਮ ਸਮੱਸਿਆਵਾਂ](../docs/chapter-07-troubleshooting/common-issues.md) ਵੇਖੋ

### ਉਦਾਹਰਣਾਂ ਨੂੰ ਅਨੁਕੂਲ ਬਨਾਉਣਾ

Each example includes:
- **README.md** - ਵਿਸਥਰਿਤ ਸੈਟਅਪ ਅਤੇ ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਨਿਰਦੇਸ਼
- **azure.yaml** - AZD ਸੰਰਚਨਾ ਟਿੱਪਣੀਆਂ ਨਾਲ
- **infra/** - Bicep ਟੈਂਪਲੇਟ ਪੈਰਾਮੀਟਰ ਵਿਆਖਿਆਵਾਂ ਨਾਲ
- **src/** - ਨਮੂਨਾ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ
- **scripts/** - ਆਮ ਕਾਰਜਾਂ ਲਈ ਸਹਾਇਕ ਸਕ੍ਰਿਪਟਾਂ

## 🎯 ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

### ਉਦਾਹਰਣ ਸ਼੍ਰੇਣੀਆਂ

#### **ਬੁਨਿਆਦੀ ਡਿਪਲੌਇਮੈਂਟਸ**
- Single-service applications
- Simple infrastructure patterns
- Basic configuration management
- Cost-effective development setups

#### **ਉੱਨਤ ਸਥਿਤੀਆਂ**
- Multi-service architectures
- Complex networking configurations
- Database integration patterns
- Security and compliance implementations

#### **ਉਤਪਾਦਨ-ਤਿਆਰ ਪੈਟਰਨ**
- High availability configurations
- Monitoring and observability
- CI/CD integration
- Disaster recovery setups

## 📖 ਉਦਾਹਰਣ ਵੇਰਵੇ

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
**Location**: [ਸਥਾਨਕ ਉਦਾਹਰਨ](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Advanced  
**Concepts**: Multi-service architecture, service communication, message queuing, distributed tracing  
**Location**: [ਸਥਾਨਕ ਉਦਾਹਰਨ](../../../examples/container-app/microservices)

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

## 🛠 ਸੰਰਚਨਾ ਉਦਾਹਰਣ

The `configurations/` directory contains reusable components:

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

## 🔧 ਕਸਟਮਾਈਜੇਸ਼ਨ ਗਾਈਡ

### ਤੁਹਾਡੇ ਯੂਜ਼ ਕੇਸ ਲਈ ਉਦਾਹਰਣਾਂ ਨੂੰ ਅਨੁਕੂਲ ਕਰਨ ਲਈ

1. **ਪੂਰਵ-ਸ਼ਰਤਾਂ ਦੀ ਸਮੀਖਿਆ ਕਰੋ**
   - Check Azure service requirements
   - Verify subscription limits
   - Understand cost implications

2. **ਸੰਰਚਨਾ ਸੋਧੋ**
   - Update `azure.yaml` service definitions
   - Customize Bicep templates
   - Adjust environment variables

3. **ਥਰੋੜੀ ਜਾਂਚ ਕਰੋ**
   - Deploy to development environment first
   - Validate functionality
   - Test scaling and performance

4. **ਸੁਰੱਖਿਆ ਸਮੀਖਿਆ**
   - Review access controls
   - Implement secrets management
   - Enable monitoring and alerting

## 📊 ਤੁਲਨਾਤਮਕ ਮਾਟ੍ਰਿਕਸ

| ਉਦਾਹਰਣ | ਸੇਵਾਵਾਂ | ਡੇਟਾਬੇਸ | ਪ੍ਰਮਾਣੀਕਰਨ | ਮਾਨੀਟਰਿੰਗ | ਕਠਿਨਾਈ |
|---------|----------|----------|-----------|------------|------------|
| **Azure OpenAI Chat** (ਸਥਾਨਕ) | 2 | ❌ | Key Vault | ਪੂਰਾ | ⭐⭐ |
| **Python Flask API** (ਸਥਾਨਕ) | 1 | ❌ | ਬੁਨਿਆਦੀ | ਪੂਰਾ | ⭐ |
| **Microservices** (ਸਥਾਨਕ) | 5+ | ✅ | Enterprise | ਉੱਨਤ | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | ਬੁਨਿਆਦੀ | ਬੁਨਿਆਦੀ | ⭐ |
| React SPA + Functions | 3 | ✅ | ਬੁਨਿਆਦੀ | ਪੂਰਾ | ⭐ |
| Python Flask Container | 2 | ❌ | ਬੁਨਿਆਦੀ | ਪੂਰਾ | ⭐ |
| C# Web API + SQL | 2 | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐ |
| Java Microservices | 5+ | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | ਬੁਨਿਆਦੀ | ਪੂਰਾ | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (ਸਥਾਨਕ) | **8+** | **✅** | **Enterprise** | **ਉੱਨਤ** | **⭐⭐⭐⭐** |

## 🎓 ਸਿੱਖਣ ਦਾ ਰਸਤਾ

### ਸੁਝਾਈ ਗਈ ਤਰੱਕੀ

1. **ਸਧਾਰਨ ਵੈੱਬ ਐਪ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ**
   - Learn basic AZD concepts
   - Understand deployment workflow
   - Practice environment management

2. **ਸਟੈਟਿਕ ਵੈੱਬਸਾਈਟ ਉਪਰ ਅਜ਼ਮਾਓ**
   - Explore different hosting options
   - Learn about CDN integration
   - Understand DNS configuration

3. **ਕੰਟੇਨਰ ਐਪ ਵੱਲ ਵਧੋ**
   - Learn containerization basics
   - Understand scaling concepts
   - Practice with Docker

4. **ਡੇਟਾਬੇਸ ਇੰਟਿਗ੍ਰੇਸ਼ਨ ਜੁੜ੍ਹੋ**
   - Learn database provisioning
   - Understand connection strings
   - Practice secrets management

5. **ਸਰਵਰਲੇਸ ਨੂੰ ਖੋਜੋ**
   - Understand event-driven architecture
   - Learn about triggers and bindings
   - Practice with APIs

6. **ਮਾਈਕ੍ਰੋਸਰਵਿਸ ਬਣਾਓ**
   - Learn service communication
   - Understand distributed systems
   - Practice complex deployments

## 🔍 ਸਹੀ ਉਦਾਹਰਨ ਲੱਭਣਾ

### ਤਕਨਾਲੋਜੀ ਸਟੈਕ ਮੁਤਾਬਕ
- **Container Apps**: [Python Flask API (ਸਥਾਨਕ)](../../../examples/container-app/simple-flask-api), [Microservices (ਸਥਾਨਕ)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (ਸਥਾਨਕ)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (ਸਥਾਨਕ)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (ਸਥਾਨਕ)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (ਸਥਾਨਕ)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (ਸਥਾਨਕ)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (ਸਥਾਨਕ)](../../../examples/container-app/simple-flask-api), [Microservices (ਸਥਾਨਕ)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (ਸਥਾਨਕ)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (ਸਥਾਨਕ)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (ਸਥਾਨਕ)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (ਸਥਾਨਕ)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### ਆਰਕੀਟੈਕਚਰ ਪੈਟਰਨ ਮੁਤਾਬਕ
- **Simple REST API**: [Python Flask API (ਸਥਾਨਕ)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (ਸਥਾਨਕ)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (ਸਥਾਨਕ)](../../../examples/container-app/simple-flask-api), [Microservices (ਸਥਾਨਕ)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (ਸਥਾਨਕ)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (ਸਥਾਨਕ)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### ਕਠਿਨਾਈ ਸਤਰ ਅਨੁਸਾਰ
- **Beginner**: [Python Flask API (ਸਥਾਨਕ)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Azure OpenAI Chat (ਸਥਾਨਕ)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (ਸਥਾਨਕ)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (Complete multi-agent system with ARM template deployment)

## 📚 ਵਾਧੂ ਸਰੋਤ

### ਦਸਤਾਵੇਜ਼ ਲਿੰਕ
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### ਕਮਿਊਨਿਟੀ ਉਦਾਹਰਣ
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo ਐਪ Node.js ਅਤੇ PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React ਵੈੱਬ ਐਪ C# API ਨਾਲ](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java ਨਾਲ](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### ਸਰਵੋਤਮ ਅਭਿਆਸ
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 ਯੋਗਦਾਨ ਦੇ ਉਦਾਹਰਣ

ਕੀ ਤੁਹਾਡੇ ਕੋਲ ਸਾਂਝਾ ਕਰਨ ਲਈ ਕੋਈ ਲਾਭਦਾਇਕ ਉਦਾਹਰਣ ਹੈ? ਅਸੀਂ ਯੋਗਦਾਨਾਂ ਦਾ ਸਵਾਗਤ ਕਰਦੇ ਹਾਂ!

### ਜਮ੍ਹਾਂ ਕਰਨ ਦੇ ਨਿਰਦੇਸ਼
1. ਥਾਪਿਤ ਡਾਇਰੈਕਟਰੀ ਢਾਂਚੇ ਦੀ ਪਾਲਣਾ ਕਰੋ
2. ਵਿਆਪਕ README.md ਸ਼ਾਮਲ ਕਰੋ
3. ਕਾਂਫਿਗਰੇਸ਼ਨ ਫਾਇਲਾਂ ਵਿੱਚ ਟਿੱਪਣੀਆਂ ਸ਼ਾਮਲ ਕਰੋ
4. ਸਪੁਰਦ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਪੂਰੀ ਤਰ੍ਹਾਂ ਟੈਸਟ ਕਰੋ
5. ਖਰਚ ਅਨੁਮਾਨ ਅਤੇ ਲੋੜੀਂਦੀਆਂ ਪੂਰਵ-ਸ਼ਰਤਾਂ ਸ਼ਾਮਲ ਕਰੋ

### ਉਦਾਹਰਣ ਟੈਂਪਲੇਟ ਢਾਂਚਾ
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

**Pro Tip**: ਆਪਣੇ ਟੈਕਨੋਲੋਜੀ ਸਟੈਕ ਨਾਲ ਮੇਲ ਖਾਣ ਵਾਲੀ ਸਭ ਤੋਂ ਸਧਾਰਨ ਉਦਾਹਰਣ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ, ਫਿਰ ਧੀਰੇ-ਧੀਰੇ ਹੋਰ ਜ਼ਿਆਦਾ ਜਟਿਲ ਪਰਿਸਥਿਤੀਆਂ ਵੱਲ ਵਧੋ। ਹਰ ਇੱਕ ਉਦਾਹਰਣ ਪਹਿਲਾਂ ਵਾਲੀਆਂ ਧਾਰਨਾਵਾਂ 'ਤੇ ਨਿਰਮਾਣ ਕਰਦੀ ਹੈ!

## 🚀 ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਤਿਆਰ?

### ਤੁਹਾਡਾ ਸਿੱਖਣ ਦਾ ਰਸਤਾ

1. **ਪੂਰਨ ਸ਼ੁਰੂਆਤੀ?** → ਸ਼ੁਰੂ ਕਰੋ ਨਾਲ [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 ਮਿੰਟ)
2. **ਕੀ ਤੁਹਾਡੇ ਕੋਲ ਬੁਨਿਆਦੀ AZD ਗਿਆਨ ਹੈ?** → ਕੋਸ਼ਿਸ਼ ਕਰੋ [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 ਮਿੰਟ)
3. **AI ਐਪ ਬਣਾਉ ਰਹੇ ਹੋ?** → ਸ਼ੁਰੂ ਕਰੋ ਨਾਲ [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 ਮਿੰਟ) ਜਾਂ ਖੋਜੋ [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ ਘੰਟੇ)
4. **ਕੀ ਤੁਹਾਨੂੰ ਖਾਸ ਟੈਕ ਸਟੈਕ ਦੀ ਲੋੜ ਹੈ?** → ਵਰਤੋਂ [Finding the Right Example](../../../examples) ਸੈਕਸ਼ਨ ਉਪਰ

### ਅਗਲੇ ਕਦਮ

- ✅ ਉਪਰ ਦਿੱਤੀਆਂ [ਪੂਰਵ-ਅਵਸ਼੍ਯਕਤਾਵਾਂ](../../../examples) ਦੀ ਸਮੀਖਿਆ ਕਰੋ
- ✅ ਆਪਣੇ ਹੁਨਰ ਦੇ ਪੱਧਰ ਨਾਲ ਮੇਲ ਖਾਣ ਵਾਲਾ ਉਦਾਹਰਣ ਚੁਣੋ (ਦੇਖੋ [ਕਠਿਨਾਈ ਲੇਜੰਡ](../../../examples))
- ✅ ਉਦਾਹਰਣ ਦੇ README ਨੂੰ ਤੈਨਾਤ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਧਿਆਨ ਨਾਲ ਪੜ੍ਹੋ
- ✅ ਟੈਸਟ ਕਰਨ ਤੋਂ ਬਾਅਦ `azd down` ਚਲਾਉਣ ਲਈ ਯਾਦ ਰੱਖਣ ਵਾਲਾ ਨੋਟ ਸੈੱਟ ਕਰੋ
- ✅ ਆਪਣਾ ਤਜਰਬਾ GitHub Issues ਜਾਂ Discussions ਰਾਹੀਂ ਸਾਂਝਾ ਕਰੋ

### ਸਹਾਇਤਾ ਚਾਹੀਦੀ ਹੈ?

- 📖 [FAQ](../resources/faq.md) - ਆਮ ਪ੍ਰਸ਼ਨਾਂ ਦੇ ਉੱਤਰ
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - ਡਿਪਲੋਯਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਦਾ ਹੱਲ
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - ਕਮਿਊਨਿਟੀ ਨਾਲ ਪੁੱਛੋ
- 📚 [Study Guide](../resources/study-guide.md) - ਆਪਣੀ ਸਿੱਖਿਆ ਮਜ਼ਬੂਤ ਕਰੋ

---

**Navigation**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Study Materials**: [ਅਧਿਐਨ ਮਾਰਗਦਰਸ਼ਕ](../resources/study-guide.md) | [ਚੀਟ ਸ਼ੀਟ](../resources/cheat-sheet.md) | [ਸ਼ਬਦਾਵਲੀ](../resources/glossary.md)
- **🔧 Resources**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*ਆਖਰੀ ਅੱਪਡੇਟ: ਨਵੰਬਰ 2025 | [ਮਸਲੇ ਰਿਪੋਰਟ ਕਰੋ](https://github.com/microsoft/AZD-for-beginners/issues) | [ਉਦਾਹਰਣਾਂ ਵਿੱਚ ਯੋਗਦਾਨ ਪਾਓ](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਅਸਵੀਕਾਰ:
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ Co‑op Translator (https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਨਾਲ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚਿਤਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਅਸਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਂ ਸੰਵੇਦਨਸ਼ੀਲ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤ ਸਮਝਾਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
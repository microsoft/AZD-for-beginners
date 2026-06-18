# ਉਦਾਹਰਨਾਂ - ਵਿਆਵਹਾਰਕ AZD ਟੈਂਪਲੇਟ ਅਤੇ ਸੰਰਚਨਾਵਾਂ

**ਉਦਾਹਰਨਾਂ ਰਾਹੀਂ ਸਿੱਖਣਾ - ਅਧਿਆਇ ਅਨੁਸਾਰ ਵਿਵਸਥਿਤ**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../README.md)
- **📖 ਅਧਿਆਇ ਨਕਸ਼ਾ**: ਉਦਾਹਰਨਾਂ ਸਿੱਖਣ ਦੀ ਕਠਿਨਾਈ ਅਨੁਸਾਰ ਵਿਵਸਥਿਤ
- **🚀 ਲੋਕਲ ਉਦਾਹਰਨ**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 ਬਾਹਰੀ AI ਉਦਾਹਰਨਾਂ**: Azure Samples ਰਿਪੋਜ਼ਿਟਰੀਜ਼ ਲਈ ਲਿੰਕ

> **📍 ਮਹੱਤਵਪੂਰਨ: ਲੋਕਲ ਬਨਾਮ ਬਾਹਰੀ ਉਦਾਹਰਨਾਂ**  
> ਇਸ ਰਿਪੋਜ਼ਿਟਰੀ ਵਿੱਚ **4 ਪੂਰਨ ਲੋਕਲ ਉਦਾਹਰਨਾਂ** ਪੂਰੀਆਂ ਇੰਪਲੀਮੈਂਟੇਸ਼ਨਾਂ ਸਮੇਤ ਹਨ:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 ਡਿਪਲੋਇਮੈਂਟ ਚੈਟ ਇੰਟਰਫੇਸ ਨਾਲ)  
> - **Container Apps** (ਸਧਾਰਣ Flask API + ਮਾਈਕਰੋਸਰਵਿਸਿਜ)  
> - **Database App** (ਵੈੱਬ + SQL ਡੇਟਾਬੇਸ)  
> - **Retail Multi-Agent** (ਉਦਯੋਗ AI ਹੱਲ)  
>  
> ਹੋਰ ਉਦਾਹਰਨਾਂ **ਬਾਹਰੀ ਹਵਾਲੇ** ਹਨ Azure-Samples ਰਿਪੋਜ਼ਿਟਰੀਜ਼ ਲਈ ਜੋ ਤੁਸੀਂ ਕਲੋਨ ਕਰ ਸਕਦੇ ਹੋ।

## ਪਰਿਚਯ

ਇਹ ਡਾਇਰੈਕਟਰੀ ਹੱਥ-ਅਨਭਵ ਅਭਿਆਸ ਦੇ ਰਾਹੀਂ ਤੁਹਾਨੂੰ Azure Developer CLI ਸਿੱਖਣ ਵਿੱਚ ਸਹਾਇਤਾ ਲਈ ਵਿਆਵਹਾਰਕ ਉਦਾਹਰਨਾਂ ਅਤੇ ਹਵਾਲੇ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ। Retail Multi-Agent ਦ੍ਰਿਸ਼ਯ ਇੱਕ ਪੂਰਨ, ਉਤਪਾਦਨ-ਤਿਆਰ ਇੰਪਲੀਮੈਂਟੇਸ਼ਨ ਹੈ ਜੋ ਇਸ ਰਿਪੋਜ਼ਿਟਰੀ ਵਿੱਚ ਸ਼ਾਮਲ ਹੈ। ਹੋਰ ਉਦਾਹਰਨਾਂ ਅਧਿਕਾਰਿਕ Azure Samples ਨੂੰ ਹਵਾਲਾ ਦਿੰਦੀਆਂ ਹਨ ਜੋ ਵੱਖ-ਵੱਖ AZD ਪੈਟਰਨਸ ਨੂੰ ਦਰਸਾਉਂਦੀਆਂ ਹਨ।

### ਕਠਿਨਾਈ ਰੇਟਿੰਗ ਲੇਜੰਡ

- ⭐ **ਬਿਨੈਅਰ** - ਮੂਲ ਧਾਰਣਾ, ਇੱਕ ਸੇਵਾ, 15-30 ਮਿੰਟ
- ⭐⭐ **ਮੱਧਵਰਗੀ** - 여러 ਸੇਵਾਵਾਂ, ਡੇਟਾਬੇਸ ਇੰਟੀਗਰੇਸ਼ਨ, 30-60 ਮਿੰਟ
- ⭐⭐⭐ **ਆਪਰੇਟਿੰਗ** - ਜਟਿਲ ਆਰਕੀਟੈਕਚਰ, AI ਇੰਟੀਗਰੇਸ਼ਨ, 1-2 ਘੰਟੇ
- ⭐⭐⭐⭐ **ਮਾਹਿਰ** - ਉਤਪਾਦਨ-ਤਿਆਰ, ਏੰਟਰਪਰਾਈਜ਼ ਪੈਟਰਨ, 2+ ਘੰਟੇ

## 🎯 ਇਸ ਰਿਪੋਜ਼ਿਟਰੀ ਵਿੱਚ ਅਸਲ ਵਿੱਚ ਕੀ ਹੈ

### ✅ ਲੋਕਲ ਇੰਪਲੀਮੈਂਟੇਸ਼ਨ (ਤਿਆਰ ਵਰਤੋਂ ਲਈ)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**ਇਸ ਰਿਪੋਜ਼ਿਟਰੀ ਵਿੱਚ ਚੈਟ ਇੰਟਰਫੇਸ ਸਮੇਤ ਪੂਰਾ gpt-4.1 ਡਿਪਲੋਇਮੈਂਟ**

- **ਟਿਕਾਣਾ:** `examples/azure-openai-chat/`
- **ਕਠਿਨਾਈ:** ⭐⭐ (ਮੱਧਵਰਗੀ)
- **ਸ਼ਾਮਲ ਕੀ ਹੈ:**
  - ਪੂਰਾ Microsoft Foundry Models ਡਿਪਲੋਇਮੈਂਟ (gpt-4.1)
  - Python ਕਮਾਂਡ-ਲਾਈਨ ਚੈਟ ਇੰਟਰਫੇਸ
  - ਸੁਰੱਖਿਅਤ API ਕੁੰਜੀਆਂ ਲਈ Key Vault ਇੰਟੀਗਰੇਸ਼ਨ
  - Bicep ਇੰਫਰਾਸਟਰਕਚਰ ਟੈਂਪਲੇਟ
  - ਟੋਕਨ ਦੀ ਵਰਤੋਂ ਅਤੇ ਲਾਗਤ ਟ੍ਰੈਕਿੰਗ
  - ਰੇਟ ਲਿਮਿਟਿੰਗ ਅਤੇ ਐਰਰ ਹੈਂਡਲਿੰਗ

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ:**
```bash
# ਉਦਾਹਰਣ ਵੱਲ ਜਾਓ
cd examples/azure-openai-chat

# ਸਭ ਕੁਝ ਤੈਨਾਤ ਕਰੋ
azd up

# ਨਿਰਭਰਤਾਵਾਂ ਸਥਾਪਤ ਕਰੋ ਅਤੇ ਗੱਲਬਾਤ ਸ਼ੁਰੂ ਕਰੋ
pip install -r src/requirements.txt
python src/chat.py
```

**ਤਕਨੀਕਾਂ:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**ਇਸ ਰਿਪੋਜ਼ਿਟਰੀ ਵਿੱਚ ਵਿਸ਼ਤ੍ਰਤ ਕంటੇਨਰ ਡਿਪਲੋਇਮੈਂਟ ਉਦਾਹਰਨਾਂ ਸ਼ਾਮਲ ਹਨ**

- **ਟਿਕਾਣਾ:** `examples/container-app/`
- **ਕਠਿਨਾਈ:** ⭐-⭐⭐⭐⭐ (ਬਿਨੈਅਰ ਤੋਂ ਮਾਹਿਰ)
- **ਸ਼ਾਮਲ ਕੀ ਹੈ:**
  - [ਮਾਸਟਰ ਗਾਈਡ](container-app/README.md) - ਕન્ટੇਨਰ ਡਿਪਲੋਇਮੈਂਟਸ ਦਾ ਪੂਰਾ ਝਲਕ
  - [ਸਧਾਰਣ Flask API](../../../examples/container-app/simple-flask-api) - ਬੁਨਿਆਦੀ REST API ਉਦਾਹਰਨ
  - [ਮਾਈਕਰੋਸਰਵਿਸ ਆਰਕੀਟੈਕਚਰ](../../../examples/container-app/microservices) - ਉਤਪਾਦਨ-ਤਿਆਰ ਬਹੁ-ਸੇਵਾ ਡਿਪਲੋਇਮੈਂਟ
  - ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ, ਉਤਪਾਦਨ, ਅਤੇ ਉੱਨਤ ਪੈਟਰਨ
  - ਮਾਨੀਟਰਿੰਗ, ਸੁਰੱਖਿਆ, ਅਤੇ ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ:**
```bash
# ਮਾਸਟਰ ਗਾਈਡ ਵੇਖੋ
cd examples/container-app

# ਸਧਾਰਨ ਫਲੇਸਕ ਏਪੀਆਈ ਤੈਨਾਤ ਕਰੋ
cd simple-flask-api
azd up

# ਮਾਈਕਰੋਸਰਵਿਸਜ਼ ਦੀ ਉਦਾਹਰਣ ਤੈਨਾਤ ਕਰੋ
cd ../microservices
azd up
```

**ਤਕਨੀਕਾਂ:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**ਇਸ ਰਿਪੋਜ਼ਿਟਰੀ ਵਿੱਚ ਪੂਰਾ ਉਤਪਾਦਨ-ਤਿਆਰ ਇੰਪਲੀਮੈਂਟੇਸ਼ਨ ਸ਼ਾਮਲ ਹੈ**

- **ਟਿਕਾਣਾ:** `examples/retail-multiagent-arm-template/`
- **ਕਠਿਨਾਈ:** ⭐⭐⭐⭐ (ਆਪਰੇਟਿੰਗ)
- **ਸ਼ਾਮਲ ਕੀ ਹੈ:**
  - ਪੂਰਾ ARM ਡਿਪਲੋਇਮੈਂਟ ਟੈਂਪਲੇਟ
  - ਮਲਟੀ-ਏਜੰਟ ਆਰਕੀਟੈਕਚਰ (ਗਾਹਕ + ਇਨਵੇਂਟਰੀ)
  - Microsoft Foundry Models ਇੰਟੀਗਰੇਸ਼ਨ
  - RAG ਨਾਲ AI Search
  - ਵਿਸ਼ਤ੍ਰਤ ਮਾਨੀਟਰਿੰਗ
  - ਇੱਕ-ਕਲਿਕ ਡਿਪਲੋਇਮੈਂਟ ਸਕ੍ਰਿਪਟ

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**ਤਕਨੀਕਾਂ:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 ਬਾਹਰੀ Azure Samples (ਕਲੋਨ ਕਰਕੇ ਵਰਤੋ)

ਹੇਠਾਂ ਦਿੱਤੀਆਂ ਉਦਾਹਰਨਾਂ ਅਧਿਕਾਰਿਕ Azure-Samples ਰਿਪੋਜ਼ਿਟਰੀਜ਼ ਵਿੱਚ ਰੱਖੀਆਂ ਗਈਆਂ ਹਨ। ਵੱਖ-ਵੱਖ AZD ਪੈਟਰਨਸ ਦੀ ਖੋਜ ਕਰਨ ਲਈ ਇਨ੍ਹਾਂ ਨੂੰ ਕਲੋਨ ਕਰੋ:

### ਸਧਾਰਣ ਐਪਲੀਕੇਸ਼ਨ (ਅਧਿਆਇ 1-2)

| Template | Repository | Complexity | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [ਲੋਕਲ: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [ਲੋਕਲ: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**ਕਿਵੇਂ ਵਰਤਣਾ:**
```bash
# ਕਿਸੇ ਵੀ ਉਦਾਹਰਨ ਨੂੰ ਕਲੋਨ ਕਰੋ
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# ਤੈਨਾਤ ਕਰੋ
azd up
```

### AI ਐਪਲੀਕੇਸ਼ਨ ਉਦਾਹਰਨ (ਅਧਿਆਇ 2, 5, 8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [ਲੋਕਲ: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 ਡਿਪਲੋਇਮੈਂਟ |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | ਬੁਨਿਆਦੀ AI ਚੈਟ |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | ਏਜੰਟ ਫਰੇਮਵਰਕ |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG ਪੈਟਰਨ |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | ਏੰਟਰਪਰਾਈਜ਼ AI |

### ਡੇਟਾਬੇਸ ਅਤੇ ਉੱਨਤ ਪੈਟਰਨ (ਅਧਿਆਇ 3-8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | ਡੇਟਾਬੇਸ ਇੰਟੀਗਰੇਸ਼ਨ |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL ਸਰਵਰਲੈਸ |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | ਬਹੁ-ਸੇਵਾ |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਹਨਾਂ ਉਦਾਹਰਨਾਂ 'ਤੇ ਕੰਮ ਕਰਕੇ, ਤੁਸੀਂ:
- ਹਕੀਕਤੀ ਐਪਲੀਕੇਸ਼ਨ ਨਜ਼ਾਰੇ ਨਾਲ Azure Developer CLI ਵਰਕਫਲੋਜ਼ ਦਾ ਅਭਿਆਸ ਕਰੋਗੇ
- ਵੱਖ-ਵੱਖ ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰ ਅਤੇ ਉਹਨਾਂ ਦੀਆਂ azd ਇੰਪਲੀਮੈਂਟੇਸ਼ਨਾਂ ਨੂੰ ਸਮਝੋਗੇ
- ਵੱਖ-ਵੱਖ Azure ਸੇਵਾਵਾਂ ਲਈ Infrastructure as Code ਪੈਟਰਨਸ 'ਚ ਮਾਹਿਰ ਹੋਵੋਗੇ
- ਕਨਫਿਗਰੇਸ਼ਨ ਪ੍ਰਬੰਧਨ ਅਤੇ ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਡਿਪਲੋਇਮੈਂਟ ਰਣਨੀਤੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰੋਗੇ
- ਵਿਆਵਹਾਰਕ ਸੰਦਰਭਾਂ ਵਿੱਚ ਮਾਨੀਟਰਿੰਗ, ਸੁਰੱਖਿਆ, ਅਤੇ ਸਕੇਲਿੰਗ ਪੈਟਰਨ ਲਾਗੂ ਕਰੋਗੇ
- ਅਸਲੀ ਡਿਪਲੋਇਮੈਂਟ ਸਿਨੇਰੀਓਜ਼ ਵਿੱਚ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਅਤੇ ਡੀਬੱਗਿੰਗ ਦਾ ਅਨੁਭਵ ਬਣਾਵੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਹਨਾਂ ਉਦਾਹਰਨਾਂ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋ ਜਾਵੋਗੇ:
- Azure Developer CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਵੱਖ-ਵੱਖ ਐਪਲੀਕੇਸ਼ਨ ਕਿਸਮਾਂ ਨੂੰ ਵਿਸ਼ਵਾਸ਼ਯੋਗ ਤਰੀਕੇ ਨਾਲ ਡਿਪਲੋਇ ਕਰਨ ਲਈ
- ਦਿੱਤੇ ਗਏ ਟੈਂਪਲੇਟਸ ਨੂੰ ਆਪਣੇ ਐਪਲੀਕੇਸ਼ਨ ਦੀਆਂ ਲੋੜਾਂ ਅਨੁਸਾਰ ਅਡੈਪਟ ਕਰਨ ਲਈ
- Bicep ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕਸਟਮ ਇੰਫਰਾਸਟਰਕਚਰ ਪੈਟਰਨ ਡਿਜ਼ਾਇਨ ਅਤੇ ਲਾਗੂ ਕਰਨ ਲਈ
- ਉਦਯੋਗਿਕ ਨਿਰਭਰਤਾਵਾਂ ਦੇ ਨਾਲ ਜਟਿਲ ਬਹੁ-ਸੇਵਾ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰਨ ਲਈ
- ਅਸਲੀ ਸੰਦਰਭਾਂ ਵਿੱਚ ਸੁਰੱਖਿਆ, ਮਾਨੀਟਰਿੰਗ, ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਲਈ ਸਰਵੋਤਮ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰਨ ਲਈ
- ਅਭਿਆਸਿਕ ਅਨੁਭਵ ਦੇ ਆਧਾਰ 'ਤੇ ਡਿਪਲੋਇਮੈਂਟਸ ਦੀ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਅਤੇ ਓਪਟੀਮਾਈਜ਼ੇਸ਼ਨ ਕਰਨ ਲਈ

## ਡਾਇਰੈਕਟਰੀ ਸੰਰਚਨਾ

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

> **💡 AZD ਵਿੱਚ ਨਵਾਂ?** ਉਦਾਹਰਨ #1 (Flask API) ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ - ਇਹ ~20 ਮਿੰਟ ਲੈਂਦਾ ਹੈ ਅਤੇ ਮੁੱਖ ਸੰਕਲਪ ਸਿਖਾਉਂਦਾ ਹੈ।

### ਨਵੀਆਂ ਦੀਆਂ ਲਈ
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (ਲੋਕਲ) ⭐  
   ਇੱਕ ਸਧਾਰਣ REST API ਡਿਪਲੋਇ ਕਰੋ ਜਿਸ ਵਿੱਚ scale-to-zero ਹੈ  
   **ਸਮਾਂ:** 20-25 ਮਿੰਟ | **ਲਾਗਤ:** $0-5/ਮਹੀਨਾ  
   **ਤੁਸੀਂ ਸਿੱਖੋਗੇ:** ਮੂਲ azd ਵਰਕਫਲੋ, ਕন্টੇਨਰਾਈਜ਼ੇਸ਼ਨ, ਹੈਲਥ ਪ੍ਰੋਬਜ਼  
   **ਉਮੀਦਿਤ ਨਤੀਜਾ:** ਕੰਮ ਕਰ ਰਹੀ API ਐਂਡਪਾਇੰਟ ਜੋ "Hello, World!" ਵਾਪਸ ਕਰਦੀ ਹੈ ਅਤੇ ਮਾਨੀਟਰਿੰਗ ਹੋਵੇ

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB ਨਾਲ ਇੱਕ Node.js Express ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇ ਕਰੋ  
   **ਸਮਾਂ:** 25-35 ਮਿੰਟ | **ਲਾਗਤ:** $10-30/ਮਹੀਨਾ  
   **ਤੁਸੀਂ ਸਿੱਖੋਗੇ:** ਡੇਟਾਬੇਸ ਇੰਟੀਗਰੇਸ਼ਨ, ਵਾਤਾਵਰਣ ਵੇਰੀਏਬਲ, ਕਨੈਕਸ਼ਨ ਸਟ੍ਰਿੰਗਜ਼  
   **ਉਮੀਦਿਤ ਨਤੀਜਾ:** Todo ਲਿਸਟ ਐਪ ਜਿਸ ਵਿੱਚ ਬਣਾਉ/ਪੜ੍ਹੋ/ਅਪਡੇਟ/ਡਿਲੀਟ ਫੰਕਸ਼ਨ ਹੋਣ

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps ਨਾਲ ਇੱਕ React ਸਟੈਟਿਕ ਵੈੱਬਸਾਈਟ ਹੋਸਟ ਕਰੋ  
   **ਸਮਾਂ:** 20-30 ਮਿੰਟ | **ਲਾਗਤ:** $0-10/ਮਹੀਨਾ  
   **ਤੁਸੀਂ ਸਿੱਖੋਗੇ:** ਸਟੈਟਿਕ ਹੋਸਟਿੰਗ, ਸਰਵਰਲੈਸ ਫੰਕਸ਼ਨ, CDN ਡਿਪਲੋਇਮੈਂਟ  
   **ਉਮੀਦਿਤ ਨਤੀਜਾ:** React UI ਜਿਸਦਾ API ਬੈਕਐਂਡ ਹੋਵੇ, ਆਟੋਮੈਟਿਕ SSL, ਗਲੋਬਲ CDN

### ਮੱਧਵਰਗੀ ਯੂਜ਼ਰਾਂ ਲਈ
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (ਲੋਕਲ) ⭐⭐  
   gpt-4.1 ਨੂੰ ਚੈਟ ਇੰਟਰਫੇਸ ਅਤੇ ਸੇਫ਼ API ਕੀ ਪ੍ਰਬੰਧਨ ਨਾਲ ਡਿਪਲੋਇ ਕਰੋ  
   **ਸਮਾਂ:** 35-45 ਮਿੰਟ | **ਲਾਗਤ:** $50-200/ਮਹੀਨਾ  
   **ਤੁਸੀਂ ਸਿੱਖੋਗੇ:** Microsoft Foundry Models ਡਿਪਲੋਇਮੈਂਟ, Key Vault ਇੰਟੀਗਰੇਸ਼ਨ, ਟੋਕਨ ਟ੍ਰੈਕਿੰਗ  
   **ਉਮੀਦਿਤ ਨਤੀਜਾ:** gpt-4.1 ਅਤੇ ਲਾਗਤ ਮਾਨੀਟਰਿੰਗ ਵਾਲੀ ਕੰਮ ਕਰਦੀ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (ਲੋਕਲ) ⭐⭐⭐⭐  
   ਉਤਪਾਦਨ-ਤਿਆਰ ਬਹੁ-ਸੇਵਾ ਆਰਕੀਟੈਕਚਰ  
   **ਸਮਾਂ:** 45-60 ਮਿੰਟ | **ਲਾਗਤ:** $50-150/ਮਹੀਨਾ  
   **ਤੁਸੀਂ ਸਿੱਖੋਗੇ:** ਸੇਵਾ ਸੰਚਾਰ, ਮੈਸੇਜ ਕਿਊਇੰਗ, ਵੰਡਿਆ ਟ੍ਰੇਸਿੰਗ  
   **ਉਮੀਦਿਤ ਨਤੀਜਾ:** 2-ਸੇਵਾ ਸਿਸਟਮ (API ਗੇਟਵੇ + ਉਤਪਾਦ ਸੇਵਾ) ਮਾਨੀਟਰਿੰਗ ਦੇ ਨਾਲ

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API ਅਤੇ Azure SQL ਡੇਟਾਬੇਸ ਨਾਲ ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ  
   **ਸਮਾਂ:** 30-45 ਮਿੰਟ | **ਲਾਗਤ:** $20-80/ਮਹੀਨਾ  
   **ਤੁਸੀਂ ਸਿੱਖੋਗੇ:** Entity Framework, ਡੇਟਾਬੇਸ ਮਾਈਗਰੇਸ਼ਨ, ਕਨੈਕਸ਼ਨ ਸੁਰੱਖਿਆ  
   **ਉਮੀਦਿਤ ਨਤੀਜਾ:** Azure SQL ਬੈਕਐਂਡ ਵਾਲਾ C# API, ਆਟੋਮੈਟਿਕ ਸਕੀਮਾ ਡਿਪਲੋਇਮੈਂਟ

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ਟ੍ਰਿਗਰ ਅਤੇ Cosmos DB ਨਾਲ Python Azure Functions  
   **ਸਮਾਂ:** 30-40 ਮਿੰਟ | **ਲਾਗਤ:** $10-40/ਮਹੀਨਾ  
   **ਤੁਸੀਂ ਸਿੱਖੋਗੇ:** ਇਵੈਂਟ-ਡ੍ਰਿਵਨ ਆਰਕੀਟੈਕਚਰ, ਸਰਵਰਲੈਸ ਸਕੇਲਿੰਗ, NoSQL ਇੰਟੀਗਰੇਸ਼ਨ  
   **ਉਮੀਦਿਤ ਨਤੀਜਾ:** HTTP ਪ੍ਰਤੀਕਿਰਿਆ ਦੇਣ ਵਾਲਾ ਫੰਕਸ਼ਨ ਐਪ ਜਿਸਦਾ ਸਟੋਰੇਜ Cosmos DB ਵਿੱਚ ਹੋਵੇ

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps ਅਤੇ API ਗੇਟਵੇ ਨਾਲ ਬਹੁ-ਸੇਵਾ Java ਐਪਲੀਕੇਸ਼ਨ  
   **ਸਮਾਂ:** 60-90 ਮਿੰਟ | **ਲਾਗਤ:** $80-200/ਮਹੀਨਾ  
   **ਤੁਸੀਂ ਸਿੱਖੋਗੇ:** Spring Boot ਡਿਪਲੋਇਮੈਂਟ, ਸੇਵਾ ਮੇਸ਼, ਲੋਡ ਬੈਲੈਂਸਿੰਗ  
   **ਉਮੀਦਿਤ ਨਤੀਜਾ:** ਸੇਵਾ ਖੋਜ ਅਤੇ ਰਾਉਟਿੰਗ ਵਾਲਾ ਬਹੁ-ਸੇਵਾ Java ਸਿਸਟਮ

### Microsoft Foundry ਟੈਂਪਲੇਟਸ

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   ਚੈਟ ਇੰਟਰਫੇਸ ਸਮੇਤ ਪੂਰਾ gpt-4.1 ਡਿਪਲੋਇਮੈਂਟ  
   **ਸਮਾਂ:** 35-45 ਮਿੰਟ | **ਲਾਗਤ:** $50-200/ਮਹੀਨਾ  
   **ਉਮੀਦਿਤ ਨਤੀਜਾ:** ਟੋਕਨ ਟ੍ਰੈਕਿੰਗ ਅਤੇ ਲਾਗਤ ਮਾਨੀਟਰਿੰਗ ਵਾਲੀ ਕੰਮ ਕਰਦੀ ਚੈਟ ਐਪ

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG ਆਰਕੀਟੈਕਚਰ ਵਾਲੀ ਇੰਟੈਲੀਜੈਂਟ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ  
   **ਸਮਾਂ:** 60-90 ਮਿੰਟ | **ਲਾਗਤ:** $100-300/ਮਹੀਨਾ  
   **ਉਮੀਦਿਤ ਨਤੀਜਾ:** ਡਾਕਯੂਮੈਂਟ ਸਰਚ ਅਤੇ ਹਵਾਲਿਆਂ ਵਾਲੀ RAG-ਸਮਰਥਚੈਟ ਇੰਟਰਫੇਸ

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਡਾਕਯੂਮੈਂਟ ਵਿਸ਼ਲੇਸ਼ਣ  
   **ਸਮਾਂ:** 40-60 ਮਿੰਟ | **ਲਾਗਤ:** $20-80/ਮਹੀਨਾ  
   **ਉਮੀਦਿਤ ਨਤੀਜਾ:** ਅਪਲੋਡ ਕੀਤੇ ਡਾਕਯੂਮੈਂਟਾਂ ਵਿੱਚੋਂ ਟੈਕਸਟ, ਟੇਬਲ ਅਤੇ ਐਂਟਿਟੀਜ਼ ਖਿੱਚਨ ਵਾਲਾ API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning ਨਾਲ MLOps ਵਰਕਫਲੋ  
   **ਸਮਾਂ:** 2-3 ਘੰਟੇ | **ਲਾਗਤ:** $150-500/ਮਹੀਨਾ  
   **ਉਮੀਦਿਤ ਨਤੀਜਾ:** ਟ੍ਰੇਨਿੰਗ, ਡਿਪਲੋਇਮੈਂਟ ਅਤੇ ਮਾਨੀਟਰਿੰਗ ਸਮੇਤ ਆਟੋਮੇਟਡ ML ਪਾਈਪਲਾਈਨ

### ਅਸਲੀ-ਦੁਨੀਆ ਦ੍ਰਿਸ਼

#### **Retail Multi-Agent Solution** 🆕
**[Complete Implementation Guide](./retail-scenario.md)**

ਇੱਕ ਵਿਆਪਕ, ਉਤਪਾਦਨ-ਤਿਆਰ ਮਲਟੀ-ਏਜੰਟ ਗਾਹਕ ਸਹਾਇਤਾ ਹੱਲ ਜੋ AZD ਨਾਲ ਏੰਟਰਪਰਾਈਜ਼-ਗਰੇਡ AI ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇਮੈਂਟ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ। ਇਹ ਦ੍ਰਿਸ਼ ਤੁਹਾਨੂੰ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ:

- **ਪੂਰੀ ਆਰਕੀਟੈਕਚਰ**: ਮਹਿਰਤਾਪੂਰਣ ਗਾਹਕ ਸੇਵਾ ਅਤੇ ਇਨਵੇਂਟਰੀ ਪ੍ਰਬੰਧਨ ਏਜੰਟਾਂ ਵਾਲੀ ਮਲਟੀ-ਏਜੰਟ ਸਿਸਟਮ
- **ਉਤਪਾਦਨ ਇਨਫ੍ਰਾਸਟ੍ਰਕਚਰ**: ਬਹੁ-ਖੇਤਰ Microsoft Foundry Models ਡਿਪਲੋਇਮੈਂਟਸ, AI Search, Container Apps, ਅਤੇ ਵਿਆਪਕ ਨਿਗਰਾਨੀ
- **ਤੁਰੰਤ-ਡਿਪਲੋਯ ਕਰਨ ਯੋਗ ARM ਟੈਮਪਲੇਟ**: ਇੱਕ-ਕਲਿੱਕ ਡਿਪਲੋਇਮੈਂਟ ਨਾਲ ਕਈ ਕਨਫਿਗਰੇਸ਼ਨ ਮੋਡ (Minimal/Standard/Premium)
- **ਅਡਵਾਂਸਡ ਫੀਚਰ**: ਰੈੱਡ ਟੀਮਿੰਗ ਸੁਰੱਖਿਆ ਜਾਂਚ, ਏਜੰਟ ਮੁਲਾਂਕਣ ਫਰੇਮਵਰਕ, ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ, ਅਤੇ ਤ੍ਰੁੱਟੀ ਨਿਰਾਕਰਣ ਗਾਈਡ
- **ਅਸਲੀ ਕਾਰੋਬਾਰੀ ਪ੍ਰਸੰਗ**: ਰਿਟੇਲਰ ਗਾਹਕ ਸਹਾਇਤਾ ਉਪਯੋਗ ਕੇਸ ਫਾਈਲ ਅੱਪਲੋਡ, ਖੋਜ ਇੰਟੀਗਰੇਸ਼ਨ, ਅਤੇ ਗਤੀਸ਼ੀਲ ਸਕੇਲਿੰਗ ਨਾਲ

**ਟੈਕਨੋਲੋਜੀਜ਼**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**ਜਟਿਲਤਾ**: ⭐⭐⭐⭐ (ਅਡਵਾਂਸਡ - ਐਂਟਰਪ੍ਰਾਇਜ਼ ਉਤਪਾਦਨ-ਤਿਆਰ)

**ਉਪਯੁਕਤ ਲਈ**: AI ਡਿਵੈਲਪਰ, ਸੋਲੂਸ਼ਨ ਆਰਕੀਟੈਕਟ, ਅਤੇ ਉਨ੍ਹਾਂ ਟੀਮਾਂ ਲਈ ਜੋ ਉਤਪਾਦਨ ਬਹੁ-ਏਜੰਟ ਸਿਸਟਮ ਬਣਾਉਂਦੀਆਂ ਹਨ

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**: ਸ਼ਾਮਿਲ ARM ਟੈਮਪਲੇਟ ਨਾਲ `./deploy.sh -g myResourceGroup` ਵਰਤ ਕੇ ਪੂਰਾ ਹੱਲ 30 ਮਿੰਟ ਤੋਂ ਘੱਟ ਵਿੱਚ ਡਿਪਲੋਇ ਕਰੋ

## 📋 ਵਰਤੋਂ ਨਿਰਦੇਸ਼

### ਪੂਰਵ-ਸ਼ਰਤਾਂ

Before running any example:
- ✅ Azure subscription with Owner or Contributor access
- ✅ Azure Developer CLI installed ([Installation Guide](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop running (for container examples)
- ✅ Appropriate Azure quotas (check example-specific requirements)

> **💰 ਲਾਗਤ ਚੇਤਾਵਨੀ:** ਸਾਰੀਆਂ ਉਦਾਹਰਨਾਂ ਅਸਲ Azure ਸਰੋਤ ਬਣਾਉਂਦੀਆਂ ਹਨ ਜੋ ਖਰਚ ਵਾਧਾ ਕਰਦੇ ਹਨ। ਲਾਗਤ ਅੰਦਾਜ਼ੇ ਲਈ ਵਿਅਕਤੀਗਤ README ਫਾਈਲਾਂ ਵੇਖੋ। ਜਾਰੀ ਖਰਚ ਤੋਂ ਬਚਣ ਲਈ ਕੰਮ ਮੁਕੰਮਲ ਹੋਣ 'ਤੇ `azd down` ਚਲਾਉਣਾ ਯਾਦ ਰੱਖੋ।

### ਉਦਾਹਰਨਾਂ ਨੂੰ ਸਥਾਨਕ ਤੌਰ 'ਤੇ ਚਲਾਉਣਾ

1. **Clone or Copy Example**
   ```bash
   # ਚਾਹੀਦੀ ਉਦਾਹਰਨ ਤੇ ਜਾਓ
   cd examples/simple-web-app
   ```

2. **Initialize AZD Environment**
   ```bash
   # ਮੌਜੂਦਾ ਟੈਮਪਲੇਟ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ
   azd init
   
   # ਜਾਂ ਨਵਾਂ ਮਾਹੌਲ ਬਣਾਓ
   azd env new my-environment
   ```

3. **Configure Environment**
   ```bash
   # ਲਾਜ਼ਮੀ ਵੈਰੀਏਬਲਾਂ ਸੈੱਟ ਕਰੋ
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy**
   ```bash
   # ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਤੈਨਾਤ ਕਰੋ
   azd up
   ```

5. **Verify Deployment**
   ```bash
   # ਸੇਵਾ ਦੇ ਐਂਡਪੌਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
   azd env get-values
   
   # ਐਂਡਪੌਇੰਟ ਦੀ ਜਾਂਚ ਕਰੋ (ਉਦਾਹਰਨ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **ਉਮੀਦ ਕੀਤੀਆਂ ਸਫਲਤਾ संकेतਕ:**
   - ✅ `azd up` ਬਿਨਾਂ ਤਰੁੱਟੀ ਦੇ ਪੂਰਾ ਹੋਵੇ
   - ✅ ਸਰਵਿਸ ਐਂਡਪੋਇੰਟ HTTP 200 ਰਿਟਰਨ ਕਰੇ
   - ✅ Azure Portal "Running" ਸਥਿਤੀ ਦਿਖਾਏ
   - ✅ Application Insights ਟੈਲੀਮੈਟਰੀ ਪ੍ਰਾਪਤ ਕਰ ਰਿਹਾ ਹੋਵੇ

> **⚠️ ਸਮੱਸਿਆਵਾਂ?** ਡਿਪਲੋਇਮੈਂਟ ਤ੍ਰੁੱਟੀ ਨਿਰਾਕਰਨ ਲਈ [ਆਮ ਸਮੱਸਿਆਵਾਂ](../docs/chapter-07-troubleshooting/common-issues.md) ਵੇਖੋ

### ਉਦਾਹਰਨਾਂ ਨੂੰ ਅਨੁਕੂਲ ਕਰਨਾ

Each example includes:
- **README.md** - ਵਿਸਥਾਰਪੂਰਣ ਸੈਟਅਪ ਅਤੇ ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਨਿਰਦੇਸ਼
- **azure.yaml** - ਟਿੱਪਣੀਆਂ ਸਮੇਤ AZD ਕਨਫਿਗਰੇਸ਼ਨ
- **infra/** - ਪੈਰਾਮੀਟਰ ਵਿਆਖਿਆਵਾਂ ਸਮੇਤ Bicep ਟੈਮਪਲੇਟ
- **src/** - ਨਮੂਨਾ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ
- **scripts/** - ਆਮ ਕਾਰਜਾਂ ਲਈ ਸਹਾਇਕ ਸਕ੍ਰਿਪਟਾਂ

## 🎯 ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

### ਉਦਾਹਰਨ ਵਰਗ

#### **ਬੁਨਿਆਦੀ ਡਿਪਲੋਇਮੈਂਟ**
- ਇਕ-ਸੇਵਾ ਐਪਲੀਕੇਸ਼ਨ
- ਸਧਾਰਣ ਢਾਂਚਾਗਤ ਨਮੂਨੇ
- ਬੁਨਿਆਦੀ ਕਨਫਿਗਰੇਸ਼ਨ ਪ੍ਰਬੰਧਨ
- ਲਾਗਤ-ਦਰਸ਼ੀ ਵਿਕਾਸ ਸੈਟਅਪ

#### **ਅਡਵਾਂਸਡ ਸਥਿਤੀਆਂ**
- ਬਹੁ-ਸੇਵਾ ਆਰਕੀਟੈਕਚਰ
- ਜਟਿਲ ਨੈਟਵਰਕਿੰਗ ਸੰਰਚਨਾਵਾਂ
- ਡੇਟਾਬੇਸ ਇੰਟੀਗਰੇਸ਼ਨ ਨਮੂਨੇ
- ਸੁਰੱਖਿਆ ਅਤੇ ਅਨੁਕੂਲਤਾ ਇੰਪਲੀਮੈਂਟੇਸ਼ਨ

#### **ਉਤਪਾਦਨ-ਤਿਆਰ ਨਮੂਨੇ**
- ਉੱਚ ਉਪਲਬਧਤਾ ਸੰਰਚਨਾਵਾਂ
- ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਦਿਖਾਈ ਦੇਣਯੋਗਤਾ
- CI/CD ਇੰਟੀਗਰੇਸ਼ਨ
- ਡਿਜਾਸਟਰ ਰਿਕਵਰੀ ਸੈਟਅਪ

## 📖 ਉਦਾਹਰਨ ਵੇਰਵੇ

### Simple Web App - Node.js Express
**ਟੈਕਨੋਲੋਜੀਜ਼**: Node.js, Express, MongoDB, Container Apps  
**ਜਟਿਲਤਾ**: ਸ਼ੁਰੂਆਤੀ  
**ਧਾਰਣਾਵਾਂ**: ਬੁਨਿਆਦੀ ਡਿਪਲੋਇਮੈਂਟ, REST API, NoSQL ਡੇਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ

### Static Website - React SPA
**ਟੈਕਨੋਲੋਜੀਜ਼**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**ਜਟਿਲਤਾ**: ਸ਼ੁਰੂਆਤੀ  
**ਧਾਰਣਾਵਾਂ**: ਸਥਿਰ ਹੋਸਟਿੰਗ, ਸਰਵਰਲੈਸ ਬੈਕਐਂਡ, ਆਧੁਨਿਕ ਵੈੱਬ ਡਿਵੈਲਪਮੈਂਟ

### Container App - Python Flask
**ਟੈਕਨੋਲੋਜੀਜ਼**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**ਜਟਿਲਤਾ**: ਸ਼ੁਰੂਆਤੀ  
**ਧਾਰਣਾਵਾਂ**: ਕੰਟੇਨਰੀਕਰਨ, REST API, scale-to-zero, ਹੈਲਥ probes, ਮਾਨੀਟਰਿੰਗ  
**ਟਿਕਾਣਾ**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**ਟੈਕਨੋਲੋਜੀਜ਼**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**ਜਟਿਲਤਾ**: ਅਡਵਾਂਸਡ  
**ਧਾਰਣਾਵਾਂ**: ਬਹੁ-ਸੇਵਾ ਆਰਕੀਟੈਕਚਰ, ਸੇਵਾ ਸੰਚਾਰ, ਸੁਨੇਹਾ 큐ਇੰਗ, ਵਿਤਰਿਤ ਟ੍ਰੇਸਿੰਗ  
**ਟਿਕਾਣਾ**: [Local Example](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**ਟੈਕਨੋਲੋਜੀਜ਼**: C# ASP.NET Core, Azure SQL Database, App Service  
**ਜਟਿਲਤਾ**: ਦਰਮਿਆਨਾ  
**ਧਾਰਣਾਵਾਂ**: Entity Framework, ਡੇਟਾਬੇਸ ਕਨੈਕਸ਼ਨ, ਵੈੱਬ API ਵਿਕਾਸ

### Serverless Function - Python Azure Functions
**ਟੈਕਨੋਲੋਜੀਜ਼**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**ਜਟਿਲਤਾ**: ਦਰਮਿਆਨਾ  
**ਧਾਰਣਾਵਾਂ**: ਇਵੈਂਟ-ਚਲਿਤ ਆਰਕੀਟੈਕਚਰ, ਸਰਵਰਲੈਸ ਕੰਪਿਊਟਿੰਗ, ਫੁੱਲ-ਸਟੈਕ ਵਿਕਾਸ

### Microservices - Java Spring Boot
**ਟੈਕਨੋਲੋਜੀਜ਼**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**ਜਟਿਲਤਾ**: ਦਰਮਿਆਨਾ  
**ਧਾਰਣਾਵਾਂ**: ਮਾਈਕ੍ਰੋਸਰਵਿਸੇਜ਼ ਸੰਚਾਰ, ਵਿਤਰਿਤ ਸਿਸਟਮ, ਐਂਟਰਪ੍ਰਾਇਜ਼ ਨਮੂਨੇ

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**ਟੈਕਨੋਲੋਜੀਜ਼**: Microsoft Foundry Models, Azure AI Search, App Service  
**ਜਟਿਲਤਾ**: ਦਰਮਿਆਨਾ  
**ਧਾਰਣਾਵਾਂ**: RAG ਆਰਕੀਟੈਕਚਰ, ਵੇਕਟਰ ਖੋਜ, LLM ਇੰਟੀਗਰੇਸ਼ਨ

#### AI Document Processing
**ਟੈਕਨੋਲੋਜੀਜ਼**: Azure AI Document Intelligence, Storage, Functions  
**ਜਟਿਲਤਾ**: ਦਰਮਿਆਨਾ  
**ਧਾਰਣਾਵਾਂ**: ਦਸਤਾਵੇਜ਼ ਵਿਸ਼ਲੇਸ਼ਣ, OCR, ਡੇਟਾ ਨਿਕਾਸ

#### Machine Learning Pipeline
**ਟੈਕਨੋਲੋਜੀਜ਼**: Azure ML, MLOps, Container Registry  
**ਜਟਿਲਤਾ**: ਅਡਵਾਂਸਡ  
**ਧਾਰਣਾਵਾਂ**: ਮਾਡਲ ਟ੍ਰੇਨਿੰਗ, ਡਿਪਲੋਇਮੈਂਟ ਪਾਈਪਲਾਈਨ, ਮਾਨੀਟਰਿੰਗ

## 🛠 ਸੰਰਚਨਾ ਉਦਾਹਰਨ

The `configurations/` ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਦੁਬਾਰਾ ਵਰਤਣ ਯੋਗ ਘਟਕ ਹਨ:

### ਵਾਤਾਵਰਣ ਸੰਰਚਨਾਵਾਂ
- ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਣ ਸੈਟਿੰਗਜ਼
- ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ ਸੰਰਚਨਾਵਾਂ
- ਉਤਪਾਦਨ-ਤਿਆਰ ਸੰਰਚਨਾਵਾਂ
- ਬਹੁ-ਖੇਤਰ ਡਿਪਲੋਇਮੈਂਟ ਸੀਟਅਪ

### Bicep ਮਾਡਿਊਲ
- ਦੁਬਾਰਾ ਵਰਤਣ ਯੋਗ ਇਨਫ੍ਰਾਸਟਰੱਕਚਰ ਘਟਕ
- ਆਮ ਸਰੋਤ ਨਮੂਨੇ
- ਸੁਰੱਖਿਆ-ਹਾਰਡਨਡ ਟੈਮਪਲੇਟ
- ਲਾਗਤ-ਅਪਟੀਮਾਈਜ਼ਡ ਕਨਫਿਗਰੇਸ਼ਨ

### ਸਹਾਇਕ ਸਕ੍ਰਿਪਟਾਂ
- ਵਾਤਾਵਰਣ ਸੈਟਅਪ ਆਟੋਮੇਸ਼ਨ
- ਡੇਟਾਬੇਸ ਮਾਈਗ੍ਰੇਸ਼ਨ ਸਕ੍ਰਿਪਟ
- ਡਿਪਲੋਇਮੈਂਟ ਵੈਰੀਫਿਕੇਸ਼ਨ ਟੂਲ
- ਲਾਗਤ ਨਿਗਰਾਨੀ ਯੂਟਿਲਿਟੀਜ਼

## 🔧 ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਗਾਈਡ

### ਆਪਣੇ ਉਪਯੋਗ ਕੇਸ ਲਈ ਉਦਾਹਰਨਾਂ ਨੂੰ ਅਨੁਕੂਲ ਕਰਨਾ

1. **ਪੂਰਵ-ਸ਼ਰਤਾਂ ਦੀ ਸਮੀਖਿਆ ਕਰੋ**
   - Azure ਸੇਵਾ ਦੀਆਂ ਲੋੜਾਂ ਚੈੱਕ ਕਰੋ
   - ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੀਮਾਵਾਂ ਦੀ ਤਸਦੀਕ ਕਰੋ
   - ਲਾਗਤ ਪ੍ਰਭਾਵ ਸਮਝੋ

2. **ਕਨਫਿਗਰੇਸ਼ਨ ਸੋਧੋ**
   - `azure.yaml` ਵਿੱਚ ਸਰਵਿਸ ਪਰਿਭਾਸ਼ਾਵਾਂ ਅਪਡੇਟ ਕਰੋ
   - Bicep ਟੈਮਪਲੇਟ ਕਸਟਮਾਈਜ਼ ਕਰੋ
   - ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਅਨੁਕੂਲ ਕਰੋ

3. **ਚੰਗੀ ਤਰ੍ਹਾਂ ਟੈਸਟ ਕਰੋ**
   - ਪਹਿਲਾਂ ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਣ 'ਤੇ ਡਿਪਲੋਇ ਕਰੋ
   - ਕਾਰਯਕੁਸ਼ਲਤਾ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
   - ਸਕੇਲਿੰਗ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਟੈਸਟ ਕਰੋ

4. **ਸੁਰੱਖਿਆ ਸਮੀਖਿਆ**
   - ਪਹੁੰਚ ਨਿਯੰਤਰਣਾਂ ਦੀ ਸਮੀਖਿਆ ਕਰੋ
   - ਸੀਕ੍ਰੇਟਸ ਪ੍ਰਬੰਧਨ ਲਾਗੂ ਕਰੋ
   - ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਅਲਰਟਿੰਗ ਚਾਲੂ ਕਰੋ

## 📊 ਤੁਲਨਾਤਮਕ ਮੈਟ੍ਰਿਕਸ

| ਉਦਾਹਰਨ | ਸੇਵਾਵਾਂ | ਡੇਟਾਬੇਸ | ਪ੍ਰਮਾਣਿਕਤਾ | ਨਿਗਰਾਨੀ | ਜਟਿਲਤਾ |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (ਸਥਾਨਕ) | 2 | ❌ | Key Vault | ਪੂਰਾ | ⭐⭐ |
| **Python Flask API** (ਸਥਾਨਕ) | 1 | ❌ | ਬੁਨਿਆਦੀ | ਪੂਰਾ | ⭐ |
| **Microservices** (ਸਥਾਨਕ) | 5+ | ✅ | ਐਂਟਰਪ੍ਰਾਇਜ਼ | ਅਡਵਾਂਸਡ | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | ਬੁਨਿਆਦੀ | ਬੁਨਿਆਦੀ | ⭐ |
| React SPA + Functions | 3 | ✅ | ਬੁਨਿਆਦੀ | ਪੂਰਾ | ⭐ |
| Python Flask Container | 2 | ❌ | ਬੁਨਿਆਦੀ | ਪੂਰਾ | ⭐ |
| C# Web API + SQL | 2 | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐ |
| Java Microservices | 5+ | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | ਬੁਨਿਆਦੀ | ਪੂਰਾ | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | ਪੂਰਾ | ਪੂਰਾ | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (ਸਥਾਨਕ) | **8+** | **✅** | **ਐਂਟਰਪ੍ਰਾਇਜ਼** | **ਅਡਵਾਂਸਡ** | **⭐⭐⭐⭐** |

## 🎓 ਸਿੱਖਣ ਦਾ ਰਸਤਾ

### ਸਿਫਾਰਸ਼ੀ ਤਰੱਕੀ

1. **ਸਧਾਰਣ ਵੈੱਬ ਐਪ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ**
   - ਬੁਨਿਆਦੀ AZD ਸੰਕਲਪ ਸਿੱਖੋ
   - ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋ ਸਮਝੋ
   - ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ ਅਭਿਆਸ ਕਰੋ

2. **ਸਟੈਟਿਕ ਵੈਬਸਾਈਟ ਅਜ਼ਮਾਓ**
   - ਵੱਖ-ਵੱਖ ਹੋਸਟਿੰਗ ਵਿਕਲਪ ਵੇਖੋ
   - CDN ਇੰਟੀਗਰੇਸ਼ਨ ਬਾਰੇ ਸਿੱਖੋ
   - DNS ਸੰਰਚਨਾ ਸਮਝੋ

3. **ਕੰਟੇਨਰ ਐਪ ਵੱਲ ਵਧੋ**
   - ਕੰਟੇਨਰੀਕਰਨ ਦੇ ਮੁੱਲ ਸਿੱਖੋ
   - ਸਕੇਲਿੰਗ ਸੰਕਲਪ ਸਮਝੋ
   - Docker ਨਾਲ ਅਭਿਆਸ ਕਰੋ

4. **ਡੇਟਾਬੇਸ ਇੰਟੀਗਰੇਸ਼ਨ ਜੋੜੋ**
   - ਡੇਟਾਬੇਸ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਸਿੱਖੋ
   - ਕਨੈਕਸ਼ਨ ਸਟਰਿੰਗਜ਼ ਸਮਝੋ
   - ਸੀਕ੍ਰੇਟਸ ਮੈਨੇਜਮੈਂਟ ਅਭਿਆਸ ਕਰੋ

5. **ਸਰਵਰਲੈਸ ਨੂੰ ਖੋਜੋ**
   - ਇਵੈਂਟ-ਚਲਿਤ ਆਰਕੀਟੈਕਚਰ ਨੂੰ ਸਮਝੋ
   - ਟ੍ਰਿਗਰ ਅਤੇ ਬਾਇੰਡਿੰਗ ਬਾਰੇ ਸਿੱਖੋ
   - APIs ਨਾਲ ਅਭਿਆਸ ਕਰੋ

6. **ਮਾਈਕ੍ਰੋਸਰਵਿਸੇਜ਼ ਬਣਾਓ**
   - ਸੇਵਾ ਸੰਚਾਰ ਸਿੱਖੋ
   - ਵਿਤਰਿਤ ਸਿਸਟਮ ਸਮਝੋ
   - ਜਟਿਲ ਡਿਪਲੋਇਮੈਂਟ ਕਰਨ ਦਾ ਅਭਿਆਸ ਕਰੋ

## 🔍 ਸਹੀ ਉਦਾਹਰਨ ਲੱਭਣਾ

### ਟੈਕਨੋਲੋਜੀ ਸਟੈਕ ਅਨੁਸਾਰ
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

### ਆਰਕੀਟੈਕਚਰ ਪੈਟਰਨ ਅਨੁਸਾਰ
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### ਜਟਿਲਤਾ ਪੱਧਰ ਅਨੁਸਾਰ
- **ਸ਼ੁਰੂਆਤੀ**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **ਦਰਮਿਆਨਾ**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **ਅਡਵਾਂਸਡ**: ML Pipeline
- **ਐਂਟਰਪ੍ਰਾਇਜ਼ ਉਤਪਾਦਨ-ਤਿਆਰ**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (Complete multi-agent system with ARM template deployment)

## 📚 ਵਾਧੂ ਸਰੋਤ

### ਦਸਤਾਵੇਜ਼ ਲਿੰਕ
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### ਕਮਿਊਨਿਟੀ ਉਦਾਹਰਨ
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API ਨਾਲ React ਵੈੱਬ ਐਪ](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Java ਨਾਲ Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### ਵਧੀਆ ਅਭਿਆਸ
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 ਯੋਗਦਾਨ ਦੇ ਉਦਾਹਰਣ

ਕੋਈ ਵਿਚਾਰਯੋਗ ਉਦਾਹਰਣ ਸਾਂਝਾ ਕਰਨ ਲਈ ਹੈ? ਅਸੀਂ ਯੋਗਦਾਨਾਂ ਦਾ ਸਵਾਗਤ ਕਰਦੇ ਹਾਂ!

### ਜਮ੍ਹਾਂ ਕਰਨ ਲਈ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼
1. ਸਥਾਪਿਤ ਡਾਇਰੈਕਟਰੀ ਢਾਂਚੇ ਦੀ ਪਾਲਣਾ ਕਰੋ
2. ਵਿਸਤ੍ਰਿਤ README.md ਸ਼ਾਮਲ ਕਰੋ
3. ਸੰਰਚਨਾ ਫਾਇਲਾਂ 'ਤੇ ਟਿੱਪਣੀਆਂ ਜੋੜੋ
4. ਜਮ੍ਹਾਂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਪੂਰੀ ਤਰ੍ਹਾਂ ਟੈਸਟ ਕਰੋ
5. ਲਾਗਤ ਅੰਦਾਜ਼ੇ ਅਤੇ ਲੋੜੀਂਦੀਆਂ ਸ਼ਰਤਾਂ ਸ਼ਾਮਲ ਕਰੋ

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

**Pro Tip**: ਸਭ ਤੋਂ ਸਧਾਰਣ ਉਦਾਹਰਣ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ ਜੋ ਤੁਹਾਡੇ ਤਕਨੀਕੀ ਸਟੈਕ ਨਾਲ ਮਿਲਦੀ ਹੋਵੇ, ਫਿਰGradually ਹੌਲੇ-ਹੌਲੇ ਹੋਰ ਜਟਿਲ ਸਥਿਤੀਆਂ ਵੱਲ ਵਧੋ। ਹਰ ਉਦਾਹਰਣ ਪਿਛਲੇ ਵਾਲਿਆਂ ਦੇ ਸੰਕਲਪਾਂ 'ਤੇ ਨਿਰਮਿਤ ਹੁੰਦੀ ਹੈ!

## 🚀 ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਤਿਆਰ?

### ਤੁਹਾਡਾ ਸਿੱਖਣ ਰਸਤਾ

1. **ਬਿਲਕੁਲ ਸ਼ੁਰੂਆਤੀ?** → [Flask API](../../../examples/container-app/simple-flask-api) ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ (⭐, 20 ਮਿੰਟ)
2. **ਕੀ ਤੁਹਾਨੂੰ AZD ਬਾਰੇ ਬੁਨਿਆਦੀ ਗਿਆਨ ਹੈ?** → [Microservices](../../../examples/container-app/microservices) ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ (⭐⭐⭐⭐, 60 ਮਿੰਟ)
3. **AI ਐਪ ਬਣਾ ਰਹੇ ਹੋ?** → [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ (⭐⭐, 35 ਮਿੰਟ) ਜਾਂ [Retail Multi-Agent](retail-scenario.md) ਦੀ ਖੋਜ ਕਰੋ (⭐⭐⭐⭐, 2+ ਘੰਟੇ)
4. **ਕੀ ਕੋਈ ਖਾਸ ਟੈਕ ਸਟੈਕ ਚਾਹੀਦਾ ਹੈ?** → ਉਪਰ ਦਿੱਤੇ [ਠੀਕ ਉਦਾਹਰਣ ਲੱਭਣਾ](#-finding-the-right-example) ਸੈਕਸ਼ਨ ਦੀ ਵਰਤੋਂ ਕਰੋ

### ਅਗਲੇ ਕਦਮ

- ✅ ਉਪਰ ਦਿੱਤੇ [ਪੂਰਵ-ਆਵਸ਼ਯਕਤਾਵਾਂ](#ਪੂਰਵ-ਸ਼ਰਤਾਂ) ਨੂੰ ਸਮੀਖਿਆ ਕਰੋ
- ✅ ਆਪਣੇ ਹੁਨਰ ਦੇ ਅਨੁਸਾਰ ਇੱਕ ਉਦਾਹਰਣ ਚੁਣੋ (ਦੇਖੋ [ਕਠਿਨਾਈ ਲੇਜੰਡ](#ਕਠਿਨਾਈ-ਰੇਟਿੰਗ-ਲੇਜੰਡ))
- ✅ ਡਿਪਲੋਇ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਉਦਾਹਰਣ ਦਾ README ਧਿਆਨ ਨਾਲ ਪੜ੍ਹੋ
- ✅ ਟੈਸਟ ਕਰਨ ਤੋਂ ਬਾਅਦ `azd down` ਚਲਾਉਣ ਲਈ ਰੀਮਾਇੰਡਰ ਸੈੱਟ ਕਰੋ
- ✅ ਆਪਣਾ ਅਨੁਭਵ GitHub Issues ਜਾਂ Discussions ਰਾਹੀਂ ਸਾਂਝਾ ਕਰੋ

### ਮਦਦ ਚਾਹੀਦੀ ਹੈ?

- 📖 [FAQ](../resources/faq.md) - ਆਮ ਸਵਾਲਾਂ ਦੇ ਜਵਾਬ
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - ਡਿਪਲੋਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਠੀਕ ਕਰੋ
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - ਕਮਿਊਨਿਟੀ ਤੋਂ ਪੁੱਛੋ
- 📚 [Study Guide](../resources/study-guide.md) - ਆਪਣੀ ਸਿੱਖਿਆ ਨੂੰ ਮਜ਼ਬੂਤ ਕਰੋ

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../README.md)
- **📖 ਅਧਿਐਨ ਸਮੱਗਰੀ**: [ਅਧਿਐਨ ਗਾਈਡ](../resources/study-guide.md) | [ਚੀਟ-ਸ਼ੀਟ](../resources/cheat-sheet.md) | [ਸ਼ਬਦਾਵਲੀ](../resources/glossary.md)
- **🔧 ਸਰੋਤ**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*ਆਖਰੀ ਅਪਡੇਟ: ਨਵੰਬਰ 2025 | [Report Issues](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribute Examples](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
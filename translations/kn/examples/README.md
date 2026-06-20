# ಉದಾಹರಣೆಗಳು - ಪ್ರಾಯೋಗಿಕ AZD ಟೆಂಪ್ಲೇಟ್ಗಳು ಮತ್ತು ಸಂರಚನೆಗಳು

**ಉದಾಹರಣೆಯ ಮೂಲಕ ಕಲಿಕೆ - ಅಧ್ಯಾಯದ ಮೂಲಕ ಆಯೋಜಿಸಲಾಗಿದೆ**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [AZD For Beginners](../README.md)
- **📖 ಅಧ್ಯಾಯ ಹೊಂದಾಣಿಕೆ**: ಕಲಿಕೆಯ ಜಟಿಲತೆ ಆಧಾರದಲ್ಲಿ ಉದಾಹರಣೆಗಳು ಆಯೋಜಿಸಲಾಗಿದೆ
- **🚀 ಸ್ಥಳೀಯ ಉದಾಹರಣೆ**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 ಬಾಹ್ಯ AI ಉದಾಹರಣೆಗಳು**: Azure Samples ಸಂಗ್ರಹಗಳಿಗೆ ಲಿಂಕ್ಸ್

> **📍 முக்கிய: ಸ್ಥಳೀಯ ವಿ. ಬಾಹ್ಯ ಉದಾಹರಣೆಗಳು**  
> ಈ ರೆಪೊಸಿಟರಿಯಲ್ಲಿ **4 ಪೂರ್ಣ ಸ್ಥಳೀಯ ಉದಾಹರಣೆಗಳು** ಸಂಪೂರ್ಣ ಕಾರ್ಯಗತ ಅನುಷ್ಠಾನಗಳೊಂದಿಗೆ ಸೇರಿವೆ:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 ಡಿಪ್ಲಯ್ಮೆಂಟಿನಿಂದ ಚಾಟ್ ಇಂಟರ್ಫೇಸ್)  
> - **Container Apps** (ಸರಳ Flask API + ಮೈಕ್ರೋಸರ್ವಿಸ್‌ಗಳು)  
> - **Database App** (ವೆಬ್ + SQL ಡೇಟಾಬೇಸ್)  
> - **Retail Multi-Agent** (ಎಂಟರ್ಪ್ರೈಸ್ AI ಪರಿಹಾರ)  
>  
> ಹೆಚ್ಚುವರಿ ಉದಾಹರಣೆಗಳು **ಬಾಹ್ಯ ಉಲ್ಲೇಖಗಳು** ಆಗಿದ್ದು, ನೀವು ಅವುಗಳನ್ನು ಕ್ಲೋನ್ ಮಾಡಬಹುದು.

## ಪರಿಚಯ

ಈ ಡೈರೆಕ್ಟರಿ ಆಸನ್‌ ತರಬೇತಿಗಾಗಿ ಕೈಯಿಂದ-practice ಮೂಲಕ Azure Developer CLI ಅನ್ನು ಕಲಿಯಲು ಪ್ರಾಯೋಗಿಕ ಉದಾಹರಣೆಗಳು ಮತ್ತು ಉಲ್ಲೇಖಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ. Retail Multi-Agent ದಾಖಲಾತಿ ಈ ರೆಪೊಸಿಟರಿಯಲ್ಲಿ ಮುಗಿದ, ಉತ್ಪಾದನಾ-ರೇಡಿಯಿ ಅನುಷ್ಟಾಹನವನ್ನು ಒಳಗೊಂಡಿದೆ. ಹೆಚ್ಚುವರಿ ಉದಾಹರಣೆಗಳು ವಿವಿಧ AZD ಪ್ಯಾಟರ್ನ್ಗಳನ್ನು ತೋರಿಸುವ ಅಧಿಕೃತ Azure Samples ಗಳಿಗೆ ಉಲ್ಲೇಖಗಳನ್ನು ಒದಗಿಸುತ್ತವೆ.

### ಜಟಿಲತೆ ರೇಟಿಂಗ್ ಲೆಜೆಂಡ್

- ⭐ **ಆರಂಭಿಕ** - ಮೂಲಭೂತ ತತ್ವಗಳು, ಏಕ ಸೇವೆ, 15-30 ನಿಮಿಷ
- ⭐⭐ **ಮಧ್ಯಂತರ** - ಬಹು ಸೇವೆಗಳು, ಡೇಟಾಬೇಸ್ ಒಕ್ಕೂಟ, 30-60 ನಿಮಿಷ
- ⭐⭐⭐ **ಸಲಹೆಗಾರ** - ಸಂಕೀರ್ಣ ವಾಸ್ತುಶಿಲ್ಪ, AI ಒಕ್ಕೂಟ, 1-2 ಗಂಟೆಗಳ
- ⭐⭐⭐⭐ **ತಜ್ಞ** - ಉತ್ಪಾದನಾ-ರೇಡಿಯಿ, ಎಂಟರ್ಪ್ರೈಸ್ ಪ್ಯಾಟರ್ನ್ಗಳು, 2+ ಗಂಟೆಗಳು

## 🎯 ಈ ರೆಪೊಸಿಟರಿಯಲ್ಲಿ ಏನು ಇದೆ

### ✅ ಸ್ಥಳೀಯ ಅನುಷ್ಠಾನ (ಬಳಕೆಗೆ ಸಿದ್ಧ)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**ಈ ರೆಪೊಸಿಟರಿಯಲ್ಲಿ ಸೇರಿಸಿರುವ ಚಾಟ್ ಇಂಟರ್ಫೇಸ್ ಹೊಂದಿರುವ ಪೂರ್ಣ gpt-4.1 ಡಿಪ್ಲಯ್ಮೆಂಟ್**

- **ಸ್ಥಳ:** `examples/azure-openai-chat/`
- **ಜಟಿಲತೆ:** ⭐⭐ (ಮಧ್ಯಂತರ)
- **ಒಳಗೊಂಡದ್ದು:**
  - ಪೂರ್ಣ Microsoft Foundry Models ಡಿಪ್ಲಯ್ಮೆಂಟ್ (gpt-4.1)
  - Python ಕಮಾಂಡ್-ಲೈನ್ ಚಾಟ್ ಇಂಟರ್ಫೇಸ್
  - ಸುರಕ್ಷಿತ API ಕೀಗಳಿಗಾಗಿ Key Vault ಒಕ್ಕೂಟ
  - Bicep ಮೂಲಸೌಕರ್ಯ ಟೆಂಪ್ಲೇಟ್ಗಳು
  - ಟೋಕನ್ ಬಳಕೆ ಮತ್ತು ವೆಚ್ಚ ಟ್ರ್ಯಾಕಿಂಗ್
  - ದರ-ಮಿತಿ ಮತ್ತು ದೋಷ ನಿರ್ವಹಣೆ

**ತ್ವರಿತ ಆರಂಭ:**
```bash
# ಉದಾಹರಣೆಗೆ ಹೋಗಿ
cd examples/azure-openai-chat

# ಎಲ್ಲಾವನ್ನೂ ನಿಯೋಜಿಸಿ
azd up

# ನಿರ್ಭರತೆಗಳನ್ನು ಸ್ಥಾಪಿಸಿ ಮತ್ತು ಚಾಟ್ ಪ್ರಾರಂಭಿಸಿ
pip install -r src/requirements.txt
python src/chat.py
```

**ತಂತ್ರಜ್ಞಾನಗಳು:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**ಈ ರೆಪೊಸಿಟರಿಯಲ್ಲಿ ಸಮಗ್ರ ಕಂಟೇನರ್ ಡಿಪ್ಲಯ್ಮೆಂಟ್ ಉದಾಹರಣೆಗಳು ಸೇರಿವೆ**

- **ಸ್ಥಳ:** `examples/container-app/`
- **জಟಿಲತೆ:** ⭐-⭐⭐⭐⭐ (ಆರಂಭಿಕದಿಂದ ತಜ್ಞ)
- **ಒಳಗೊಂಡದ್ದು:**
  - [Master Guide](container-app/README.md) - ಕಂಟೇನರ್ ಡಿಪ್ಲೈಮೆಂಟ್‌ಗಳ ಸಂಪೂರ್ಣ ಅವಲೋಕನ
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - ಮೂಲ REST API ಉದಾಹರಣೆ
  - [Microservices Architecture](../../../examples/container-app/microservices) - ಉತ್ಪಾದನಾ-ರೇಡಿಯಿ ಬಹು-ಸೇವಾ ಡಿಪ್ಲಯ್ಮೆಂಟ್
  - ತ್ವರಿತ ಪ್ರಾರಂಭ, ಉತ್ಪಾದನೆ, ಮತ್ತು ಖಚಿತವಾದ ಪ್ಯಾಟರ್ನ್ಗಳು
  - ಮಾನಿಟರಿಂಗ್, ಭದ್ರತೆ, ಮತ್ತು ವೆಚ್ಚ ಆಪ್ಟಿಮೈಸೇಶನ್

**ತ್ವರಿತ ಆರಂಭ:**
```bash
# ಮಾಸ್ಟರ್ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ವೀಕ್ಷಿಸಿ
cd examples/container-app

# ಸರಳ Flask API ಅನ್ನು ನಿಯೋಜಿಸಿ
cd simple-flask-api
azd up

# ಮೈಕ್ರೋಸರ್ವಿಸುಗಳ ಉದಾಹರಣೆಯನ್ನು ನಿಯೋಜಿಸಿ
cd ../microservices
azd up
```

**ತಂತ್ರಜ್ಞಾನಗಳು:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**ಈ ರೆಪೊಸಿಟರಿಯಲ್ಲಿ ಸೇರಿಸಿರುವ ಸಂಪೂರ್ಣ ಉತ್ಪಾದನಾ-ರೇಡಿಯಿ ಅನುಷ್ಠಾನ**

- **ಸ್ಥಳ:** `examples/retail-multiagent-arm-template/`
- **ಜಟಿಲತೆ:** ⭐⭐⭐⭐ (ಉನ್ನತ)
- **ಒಳಗೊಂಡದ್ದು:**
  - ಪೂರ್ಣ ARM ಡಿಪ್ಲಯ್ಮೆಂಟ್ ಟೆಂಪ್ಲೇಟ್
  - ಬಹು-ಏಜೆಂಟ್ ವಾಸ್ತುಶಿಲ್ಪ (Customer + Inventory)
  - Microsoft Foundry Models ಒಕ್ಕೂಟ
  - RAG ಜೊತೆಗೆ AI Search
  - ಸಮಗ್ರ ಮಾನಿಟರಿಂಗ್
  - ಒಂದು-ಕ್ಲಿಕ್ ಡಿಪ್ಲಯ್ಮೆಂಟ್ ಸ್ಕ್ರಿಪ್ಟ್

**ತ್ವರಿತ ಆರಂಭ:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**ತಂತ್ರಜ್ಞಾನಗಳು:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 ಬಾಹ್ಯ Azure Samples (ಕ್ಲೋನ್ ಮಾಡಿ ಬಳಸಲು)

ಕೆಳಗಿನ ಉದಾಹರಣೆಗಳು ಅಧಿಕೃತ Azure-Samples ರೆಪೊಸಿಟರಿಗಳಲ್ಲಿ ನಿರ್ವಹಿಸಲಾಗುತ್ತವೆ. ವಿಭಿನ್ನ AZD ಪ್ಯಾಟರ್ನ್ಗಳನ್ನು ಅನ್ವೇಷಿಸಲು ಅವುಗಳನ್ನು ಕ್ಲೋನ್ ಮಾಡಿ:

### ಸರಳ ಅಪ್ಲಿಕೇಶನ್ಗಳು (ಅಧ್ಯಾಯಗಳು 1-2)

| ಟೆಂಪ್ಲೇಟ್ | ರಿಪೊಸಿಟರಿ | ಜಟಿಲತೆ | ಸೇವೆಗಳು |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [ಸ್ಥಳೀಯ: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [ಸ್ಥಳೀಯ: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | ಬಹು-ಸೇವಾ, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**ಹೆಚ್‌ಗಾ ಬಳಸುವುದು:**
```bash
# ಯಾವುದೇ ಉದಾಹರಣೆಯನ್ನು ಕ್ಲೋನ್ ಮಾಡಿ
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# ಡೆಪ್ಲಾಯ್ ಮಾಡಿ
azd up
```

### AI ಅಪ್ಲಿಕೇಶನ್ ಉದಾಹರಣೆಗಳು (ಅಧ್ಯಾಯಗಳು 2, 5, 8)

| ಟೆంప್ಲೇಟ್ | ರಿಪೊಸಿಟರಿ | ಜಟಿಲತೆ | фೋಕಸ್ |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [ಸ್ಥಳೀಯ: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 ಡಿಪ್ಲಯ್ಮೆಂಟ್ |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | ಮೂಲ AI ಚಾಟ್ |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | ಏಜೆಂಟ್ ಫ್ರೇಂವರ್ಕ್ |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG ಪ್ಯಾಟರ್ನ್ |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | ಎಂಟರ್ಪ್ರೈಸ್ AI |

### ಡೇಟಾಬೇಸ್ ಮತ್ತು ಉನ್ನತ ಪ್ಯಾಟರ್ನ್ಗಳು (ಅಧ್ಯಾಯಗಳು 3-8)

| ಟೆಂಪ್ಲೇಟ್ | ರಿಪೊಸಿಟರಿ | ಜಟಿಲತೆ | фೋಕಸ್ |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | ಡೇಟಾಬೇಸ್ ಒಕ್ಕೂಟ |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL ಸರ್ವರ್‌ಲೆಸ್ |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | ಬಹು-ಸೇವಾ |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## ಕಲಿಕಾ ಗುರಿಗಳು

ಈ ಉದಾಹರಣೆಗಳ ಮೂಲಕ ಕೆಲಸಮಾಡುವುದರಿಂದ, ನೀವು:
- ನೈಪುಣ್ಯದ ಅಪ್ಲಿಕೇಶನ್ ದೃಶ್ಯಾವಳಿಗಳೊಂದಿಗೆ ಯಥಾರ್ಥ ಪ್ರಯೋಗಾತ್ಮಕ ಪ್ರದೇಶಗಳಲ್ಲಿ Azure Developer CLI ಕೆಲಸಪದ್ಧತಿಗಳನ್ನು ಅಭ್ಯಾಸ ಮಾಡಬಹುದು
- ವಿಭಿನ್ನ ಅಪ್ಲಿಕೇಶನ್ ವಾಸ್ತುಶಿಲ್ಪಗಳನ್ನು ಮತ್ತು ಅವುಗಳ azd ಅನುಷ್ಠಾನಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು
- ವಿವಿಧ Azure ಸೇವೆಗಳಿಗಾಗಿ Infrastructure as Code ಪ್ಯಾಟರ್ನ್ಗಳನ್ನು ಆರೆಂಜಿಸಿಕೊಂಡು ಅನುಷ್ಠಾನಗೊಳಿಸಬಹುದು
- ಕಾನ್ಫಿಗರೇಶನ್ ನಿರ್ವಹಣೆ ಮತ್ತು ವಾತಾವರಣ-ನಿರ್ದಿಷ್ಟ ಡಿಪ್ಲಯ್ಮೆಂಟ್ ತಂತ್ರಗಳನ್ನು ಅನ್ವಯಿಸಬಹುದು
- ಪ್ರಾಯೋಗಿಕ ಸಂದರ್ಭದಲ್ಲಿ ಮಾನಿಟರಿಂಗ್, ಭದ್ರತೆ, ಮತ್ತು ಸ್ಕೇಲಿಂಗ್ ಪ್ಯಾಟರ್ನ್ಗಳನ್ನು ಅನುಷ್ಟಾನಗೊಳಿಸಬಹುದು
- ವಾಸ್ತವಿಕ ಡಿಪ್ಲಯ್ಮೆಂಟ್ ದೃಶ್ಯಾವಳಿಗಳಲ್ಲಿ ತೊಂದರೆಹರಿದ ಪರಿಶೋಧನೆ ಮತ್ತು ಡಿಬੱਗಿಂಗ್ ಅನುಭವವನ್ನು ರೂಪಿಸಬಹುದು

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಈ ಉದಾಹರಣೆಗಳನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವುಬಲ್ಲಿರಿ:
- Azure Developer CLI ಬಳಸಿ ವಿವಿಧ ಅಪ್ಲಿಕೇಶನ್ ಪ್ರಕಾರಗಳನ್ನು ವಿಶ್ವಾಸದಿಂದ ಡಿಪ್ಲಾಯ್ ಮಾಡುವುದು
- ನೀಡಲಾದ ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ನಿಮ್ಮ ಸ್ವಂತ ಅಪ್ಲಿಕೇಶನ್ ಅಗತ್ಯಗಳಿಗೆ ಹೊಂದಿಕೊಳ್ಳುವುದು
- Bicep ಬಳಸಿ ಕಸ್ಟಮ್ ಮೂಲಸೌಕರ್ಯ ಪ್ಯಾಟರ್ನ್ಗಳನ್ನು ರಚಿಸಿ ಅನುಷ್ಟಾನಗೊಳಿಸುವುದು
- ಸರಿಯಾದ ಅವಲಂಬನೆಗಳೊಂದಿಗೆ ಸಂಕೀರ್ಣ ಬಹು-ಸೇವಾ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ರಚಿಸಿ ಕಾನ್ಫಿಗರ್ ಮಾಡುವುದು
- ವಾಸ್ತವಿಕ ಸನ್ನಿವೇಶಗಳಲ್ಲಿ ಭದ್ರತೆ, ಮಾನಿಟರಿಂಗ್, ಮತ್ತು ಕಾರ್ಯಕ್ಷಮತೆಯ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳನ್ನು ಅನ್ವಯಿಸುವುದು
- ಪ್ರಾಯೋಗಿಕ ಅನುಭವದ ಆಧಾರದ ಮೇಲೆ ಡಿಪ್ಲಯ್ಮೆಂಟ್‌ಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ ಆಪ್ಟಿಮೈಸು ಮಾಡುವುದು

## ಡೈರೆಕ್ಟರಿ ರಚನೆ

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

## ತ್ವರಿತ ಪ್ರಾರಂಭದ ಉದಾಹರಣೆಗಳು

> **💡 AZD ಗೆ ಹೊಸದಾದೀರಾ?** ಉದಾಹರಣೆ #1 (Flask API) ನಿಂದ ಪ್ರಾರಂಭಿಸಿ - ಇದು ~20 ನಿಮಿಷ ತೆಗೆದುಕೊಳ್ಳುತ್ತದೆ ಮತ್ತು ಮೂಲ ತತ್ವಗಳನ್ನು ಕಲಿಸುತ್ತದೆ.

### ಆರಂಭಿಕರಿಗಾಗಿ
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (ಸ್ಥಳೀಯ) ⭐  
   ಸ್ಕೇಲ್-ಟು-ೋಝೆರೊ ಸಹಿತ ಸರಳ REST API ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ  
   **ಸಮಯ:** 20-25 ನಿಮಿಷ | **ಖರ್ಚು:** $0-5/ತಿಂಗಳು  
   **ನೀವು ಕಲೀತೀರಿ:** ಮೂಲ azd ಕಾರ್ಯಪ್ರವಾಹ, ಕಂಟೇನರೈಜೆಶನ್, ಹೆಲ್ತ್ ಪ್ರೋಬ್‌ಗಳು  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ಕಾರ್ಯನಿರ್ವಹಿಸುವ API ಎಂಡ್‌ಪಾಯಿಂಟ್ "Hello, World!" ಅನ್ನು ಮರಳುತನಕ ರಿಟರ್ನ್ ಮಾಡುತ್ತದೆ ಮತ್ತು ಮಾನಿಟರಿಂಗ್ ಹೊಂದಿದೆ

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB ಜೊತೆಗೆ Node.js Express ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ  
   **ಸಮಯ:** 25-35 ನಿಮಿಷ | **ಖರ್ಚು:** $10-30/ತಿಂಗಳು  
   **ನೀವು ಕಲೀತೀರಿ:** ಡೇಟಾಬೇಸ್ ಒಕ್ಕೂಟ, ವಾತಾವರಣ ಚರ, ಕನೆಕ್ಷನ್ ಸ್ಟ್ರಿಂಗ್‌ಗಳು  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** создать/ಓದಿ/ಯುಪ್ಡೇಟ್/ಅಳಿಸಲು ಕಾರ್ಯರೀತಿಯ todo ಅ್ಯಪ್

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps ಬಳಸಿ React ಸ್ಟാറ്റಿಕ್ ವೆಬ್‌ಸೈಟ್ ಹೋಸ್ಟ್ ಮಾಡಿ  
   **ಸಮಯ:** 20-30 ನಿಮಿಷ | **ಖರ್ಚು:** $0-10/ತಿಂಗಳು  
   **ನೀವು ಕಲೀತೀರಿ:** ಸ್ಟಾಟಿಕ್ ಹೋಸ್ಟಿಂಗ್, ಸರ್ವರ್‌ಲೆಸ್ ಫಂಕ್ಷನ್‌ಗಳು, CDN ಡಿಪ್ಲಾಯ್ಮೆಂಟ್  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** API ಬ್ಯಾಕ್‌ಎಂಡ್ ಇರುವ React UI, ಸ್ವಯಂಚಾಲಿತ SSL, ಜಾಗತಿಕ CDN

### ಮಧ್ಯಂತರ ಬಳಕೆದಾರರಿಗೆ
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (ಸ್ಥಳೀಯ) ⭐⭐  
   ಚಾಟ್ ಇಂಟರ್ಫೇಸ್ ಮತ್ತು ಸುರಕ್ಷಿತ API ಕೀ ನಿರ್ವಹಣೆಯೊಂದಿಗೆ gpt-4.1 ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ  
   **ಸಮಯ:** 35-45 ನಿಮಿಷ | **ಖರ್ಚು:** $50-200/ತಿಂಗಳು  
   **ನೀವು ಕಲೀತೀರಿ:** Microsoft Foundry Models ಡಿಪ್ಲಾಯ್ಮೆಂಟ್, Key Vault ಒಕ್ಕೂಟ, ಟೋಕನ್ ಟ್ರ್ಯಾಕಿಂಗ್  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** gpt-4.1 ಮತ್ತು ವೆಚ್ಚ ಮಾನಿಟರಿಂಗ್ ಹೊಂದಿರುವ ಕಾರ್ಯರತರ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (ಸ್ಥಳೀಯ) ⭐⭐⭐⭐  
   ಉತ್ಪಾದನಾ-ರೇಡಿಯಿ ಬಹು-ಸೇವಾ ವಾಸ್ತುಶಿಲ್ಪ  
   **ಸಮಯ:** 45-60 ನಿಮಿಷ | **ಖರ್ಚು:** $50-150/ತಿಂಗಳು  
   **ನೀವು ಕಲೀತೀರಿ:** ಸೇವಾ ಸಂವಹನ, ಮೆಸ್ಸೇಜ್ ಕ್ಯೂ잉, ವಿತರಿತ ಟ್ರೇಸಿಂಗ್  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** 2-ಸರ್ವಿಸ್ ಸಿಸ್ಟಂ (API ಗೇಟ್ವೇ + ಪ್ರಾಡಕ್ಟ್ ಸರ್ವಿಸ್) ಮಾನಿಟರಿಂಗ್ ಜೊತೆ

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API ಮತ್ತು Azure SQL Database ಹೊಂದಿರುವ ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್  
   **ಸಮಯ:** 30-45 ನಿಮಿಷ | **ಖರ್ಚು:** $20-80/ತಿಂಗಳು  
   **ನೀವು ಕಲೀತೀರಿ:** Entity Framework, ಡೇಟಾಬೇಸ್ ಮೈಗ್ರೇಶನ್ಗಳು, ಕನೆಕ್ಷನ್ ಭದ್ರತೆ  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** Azure SQL ಬ್ಯಾಕ್‌ಎಂಡ್‌ನ್ನು ಹೊಂದಿದ C# API ಮತ್ತು ಸ್ವಯಂಚಾಲಿತ ಸ್ಕೀಮಾ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ಟ್ರಿಗರ್‌ಗಳೊಂದಿಗೆ Python Azure Functions ಮತ್ತು Cosmos DB  
   **ಸಮಯ:** 30-40 ನಿಮಿಷ | **ಖರ್ಚು:** $10-40/ತಿಂಗಳು  
   **ನೀವು ಕಲೀತೀರಿ:** ಇವೆಂಟ್-ಚಾಲಿತ ವಾಸ್ತವಶಿಲ್ಪ, ಸರ್ವರ್‌ಲೆಸ್ ಸ್ಕೇಲಿಂಗ್, NoSQL ಒಕ್ಕೂಟ  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** HTTP ವಿನಂತಿಗಳಿಗೆ ಪ್ರತಿಕ್ರಿಯಿಸುವ ಮತ್ತು Cosmos DB ಸ್ಟೋರೇಜ್ ಹೊಂದಿರುವ ಫಂಕ್ಷನ್ ಅಪ್

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps ಮತ್ತು API ಗೇಟ್ವೇ ಜೊತೆಗೆ ಬಹು-ಸೇವಾ Java ಅಪ್ಲಿಕೇಶನ್  
   **ಸಮಯ:** 60-90 ನಿಮಿಷ | **ಖರ್ಚು:** $80-200/ತಿಂಗಳು  
   **ನೀವು ಕಲೀತೀರಿ:** Spring Boot ಡಿಪ್ಲಾಯ್ಮೆಂಟ್, ಸೇವಾ ಮೆಶ್, ಲೋಡ್ ಬ್ಯಾಲೆನ್ಸಿಂಗ್  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ಸೇವಾ ಡಿಸ್ಕವರಿ ಮತ್ತು ರೌಟಿಂಗ್ ಹೊಂದಿರುವ ಬಹು-ಸೇವಾ Java ಸಿಸ್ಟಮ್

### Microsoft Foundry ಟೆಂಪ್ಲೇಟ್ಗಳು

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   ಚಾಟ್ ಇಂಟರ್ಫೇಸ್ ಹೊಂದಿರುವ ಪೂರ್ಣ gpt-4.1 ಡಿಪ್ಲಾಯ್ಮೆಂಟ್  
   **ಸಮಯ:** 35-45 ನಿಮಿಷ | **ಖರ್ಚು:** $50-200/ತಿಂಗಳು  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ಟೋಕನ್ ಟ್ರ್ಯಾಕಿಂಗ್ ಮತ್ತು ವೆಚ್ಚ ಮಾನಿಟರಿಂಗ್ ಹೊಂದಿರುವ ಕಾರ್ಯರತರ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG ವಾಸ್ತುಶಿಲ್ಪದೊಂದಿಗೆ ಬೌದ್ಧಿಕ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್  
   **ಸಮಯ:** 60-90 ನಿಮಿಷ | **ಖರ್ಚು:** $100-300/ತಿಂಗಳು  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ಡಾಕ್ಯುಮೆಂಟ್ ಶೋಧನೆ ಮತ್ತು ಉಲ್ಲೇಖಗಳೊಂದಿಗೆ RAG-ಸಂಚಾಲಿತ ಚಾಟ್ ಇಂಟರ್ಫೇಸ್

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI ಸೇವೆಗಳ ಬಳಕೆ ಮೂಲಕ ಡಾಕ್ಯುಮೆಂಟ್ ವಿಶ್ಲೇಷಣೆ  
   **ಸಮಯ:** 40-60 ನಿಮಿಷ | **ಖರ್ಚು:** $20-80/ತಿಂಗಳು  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ಅಪ್ಲೋಡ್ ಮಾಡಿದ ಡಾಕ್ಯುಮೆಂಟುಗಳಿಂದ ಪಠ್ಯ, ಟೇಬಲ್, ಮತ್ತು ಎಂಟಿಟಿ ಗಳನ್ನು ಎಕ್ಸ್ಟ್ರ್ಯಾಕ್ಟ್ ಮಾಡುವ API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning ಹೊಂದಿರುವ MLOps ಕಾರ್ಯಪ್ರವಾಹ  
   **ಸಮಯ:** 2-3 ಗಂಟೆಗಳು | **ಖರ್ಚು:** $150-500/ತಿಂಗಳು  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ತರಬೇತಿ, ಡಿಪ್ಲಾಯ್ಮೆಂಟ್, ಮತ್ತು ಮಾನಿಟರಿಂಗ್ ಹೊಂದಿರುವ ಸ್ವಯಂಚಾಲಿತ ML ಪೈಪ್‌ಲೈನ್

### ವಾಸ್ತವಿಕ ಸಂದರ್ಭದಲ್ಲಿ ಸನ್ನಿವೇಶಗಳು

#### **Retail Multi-Agent Solution** 🆕
**[ಸंपೂರ್ಣ ಅನುಷ್ಠಾನ ಮಾರ್ಗದರ್ಶಿ](./retail-scenario.md)**

AZD ಬಳಸಿ ಎಂಟರ್ಪ್ರೈಸ್-ಗ್ರೇಡ್ AI ಅಪ್ಲಿಕೇಶನ್ ಡಿಪ್ಲಾಯ್ಮೆಂಟನ್ನು ತೋರಿಸುವ ಸಮಗ್ರ, ಉತ್ಪಾದನಾ-ರೇಡಿಯಿ ಬಹು-ಏಜೆಂಟ್ ಗ್ರಾಹಕ ಬೆಂಬಲ ಪರಿಹಾರ. ಈ ದೃಶ್ಯಾವಳಿ ಒದಗಿಸುತ್ತದೆ:

- **ಸಂಪೂರ್ಣ ವಾಸ್ತುಶಿಲ್ಪ**: ವಿಶೇಷಗೊಳಿಸಿದ ಗ್ರಾಹಕ ಸೇವೆ ಮತ್ತು ಇನ್ವೆಂಟರಿ ನಿರ್ವಹಣಾ ಏಜೆಂಟ್‌ಗಳೊಂದಿಗೆ ಬಹು-ಏಜೆಂಟ್ ಸಿಸ್ಟಮ್
- **ಉತ್ಪಾದನಾ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್**: ಬಹು-ಪ್ರದೇಶ Microsoft Foundry Models desplements, AI Search, Container Apps, ಮತ್ತು ಸಮಗ್ರ ಮೇಲ್ವಿಚಾರಣೆ
- **ಉಪಯೋಗಕ್ಕೆ ಸಿದ್ಧ ARM ಟೆಂಪ್ಲೇಟು**: ಅನೇಕರ.configuration ಮೋಡ್‌ಗಳೊಂದಿಗೆ ಒಂದೇ ಕ್ಲಿಕ್ ವಿನ್ಯಾಸ (Minimal/Standard/Premium)
- **ಆಧುನಿಕ ವೈಶಿಷ್ಟ್ಯಗಳು**: ರೆಡ್-ಟೀಮಿಂಗ್ ಭದ್ರತಾ ಪರಿಶೀಲನೆ, ಏಜೆಂಟ್ ಮೌಲ್ಯಮಾಪನ ವ್ಯವಸ್ಥೆ, ಖರ್ಚು ದಕ್ಷೀಕರಣ, ಮತ್ತು ಸಮಸ್ಯೆ ಪರಿಹಾರ ಮಾರ್ಗದರ್ಶಿಗಳು
- **ವಾಸ್ತವ ವ್ಯವಹಾರ ಸಂದರ್ಭ**: ಫೈಲ್ ಅಪ್ಲೋಡ್, ಶೋಧ ಸಂಯೋಜನೆ ಮತ್ತು ಡೈನಾಮಿಕ್ ಸ್ಕೇಲಿಂಗ್ ಹೊಂದಿರುವ ರಿಟೇಲರ್ ಗ್ರಾಹಕ ಬೆಂಬಲ ಬಳಕಾ ಪ್ರಕರಣ

**ತಂತ್ರಜ್ಞಾನಗಳು**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**ಸಂಕೀರ್ಣತೆ**: ⭐⭐⭐⭐ (ಉನ್ನತ ಮಟ್ಟ - ಎಂಟರ್‌ಪ್ರೈಸ್ ಉತ್ಪಾದನಾ ಸಿದ್ಧ)

**ಉತ್ತಮವಾದವರು**: AI ಡೆವಲಪರ್‌ಗಳು, ಸೊಲ್ಯೂಶನ್ ಆರ್ಕಿಟೆಕ್ಟ್ಗಳ ಮತ್ತು ಉತ್ಪಾದನಾ ಬಹು-ಏಜೆಂಟ್ ವ್ಯವಸ್ಥೆಗಳು ನಿರ್ಮಿಸುತ್ತಿರುವ ತಂಡಗಳು

**ತ್ರುಟ್ ಸ್ಟಾರ್ಟ್**: ಸೇರಿಸಿದ ARM ಟೆಂಪ್ಲೇಟನ್ನು ಉಪಯೋಗಿಸಿ `./deploy.sh -g myResourceGroup` ಮೂಲಕ 30 ನಿಮಿಷಗಳ ಒಳಗೆ ಸಂಪೂರ್ಣ ಪರಿಹಾರವನ್ನು ನಿಯೋಜಿಸಿ

## 📋 ಬಳಕೆ ಸೂಚನೆಗಳು

### ಪೂರ್ವಾಪೇಕ್ಷೆಗಳು

ಯಾವುದೇ ಉದಾಹರಣೆಯನ್ನು ಚಾಲಿಸುವ ಮುನ್ನ:
- ✅ Owner ಅಥವಾ Contributor ಅಕ್ಸೆಸ್ ಹೊಂದಿರುವ Azure ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್
- ✅ Azure Developer CLI நிறுவಿಸಲಾಗಿದೆ ([ಇನ್‌ಸ್ಟಾಲೇಷನ್ ಮಾರ್ಗದರ್ಶಿ](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop ಚಾಲನೆಯಲ್ಲಿರಬೇಕು (ಕಂಟೈನರ್ ಉದಾಹರಣೆಗಳಿಗಾಗಿ)
- ✅ ಉಪಯುಕ್ತ Azure ಕೋಟಾಗಳು (ಉದಾಹರಣಾ-ವಿಶೇಷ ಅವಶ್ಯಕತೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ)

> **💰 ವೆಚ್ಚ ಸೂಚನೆ:** ಎಲ್ಲಾ ಉದಾಹರಣೆಗಳು ಶುಲ್ಕ ವಿಧಿಸುವ ನಿಜವಾದ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸುತ್ತವೆ. ವೆಚ್ಚ ಅಂದಾಜುಗಳಿಗಾಗಿ ಪ್ರತ್ಯೇಕ README ಫೈಲ್‌ಗಳನ್ನು ನೋಡಿ. ನಿರಂತರ ವೆಚ್ಚಗಳನ್ನು ತಪ್ಪಿಸಲು ಮುಗಿಸಿರುವ ಮೇಲೆ `azd down` ನಡೆಸಿಕೊಡಿ.

### ಉದಾಹರಣೆಗಳನ್ನು ಸ್ಥಳೀಯವಾಗಿ ಓಡಿಸುವುದು

1. **ಉದಾಹರಣೆಯನ್ನು ಕ್ಲೋನ್ ಅಥವಾ ನಕಲಿಸಿ**
   ```bash
   # ಆಯಿಸಿದ ಉದಾಹರಣೆಗೆ ನಾವಿಗೇಟ್ ಮಾಡಿ
   cd examples/simple-web-app
   ```

2. **AZD ಪರಿಸರವನ್ನು ಆರಂಭಿಸಿ**
   ```bash
   # ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಟೆಂಪ್ಲೇಟನ್ನು ಬಳಸಿ ಪ್ರಾರಂಭಿಸಿ
   azd init
   
   # ಅಥವಾ ಹೊಸ ವಾತಾವರಣವನ್ನು ರಚಿಸಿ
   azd env new my-environment
   ```

3. **ಪರಿಸರವನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ**
   ```bash
   # ಆವಶ್ಯಕ ಚರಗಳನ್ನು ಹೊಂದಿಸಿ
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **ಡಿಪ್ಲೋಯ್ ಮಾಡಿ**
   ```bash
   # ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
   azd up
   ```

5. **ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಪರಿಶೀಲಿಸಿ**
   ```bash
   # ಸೇವಾ ಅಂತಿಮಬಿಂದುಗಳನ್ನು ಪಡೆಯಿರಿ
   azd env get-values
   
   # ಅಂತಿಮಬಿಂದು (ಉದಾಹರಣೆ) ಅನ್ನು ಪರೀಕ್ಷಿಸಿ
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   ** ನಿರೀಕ್ಷಿತ ಯಶಸ್ಸಿನ ಸೂಚಕಗಳು:**
   - ✅ `azd up` ದೋಷರहितವಾಗಿ ಪೂರ್ಣಗೊಳ್ಳುತ್ತದೆ
   - ✅ ಸರ್ವಿಸ್ ಎಂಡ್‌ಪಾಯಿಂಟ್ HTTP 200 ಅನ್ನು ಹಿಂತಿರುಗಿಸುತ್ತದೆ
   - ✅ Azure Portal “Running” ಸ್ಥಿತಿಯನ್ನು ತೋರಿಸುತ್ತಿದೆ
   - ✅ Application Insights ಟೆಲಿಮೆಟ್ರಿಯನ್ನು ಸ್ವೀಕರಿಸುತ್ತಿದೆ

> **⚠️ ಸಮಸ್ಯೆಗಳಿದೆಯೇ?** ನಿಯೋಜನಾ ಸಮಸ್ಯೆಗಳಿಗೆ [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು](../docs/chapter-07-troubleshooting/common-issues.md) ನೋಡಿ

### ಉದಾಹರಣೆಗಳನ್ನು ಹೊಂದಿಕೊಳ್ಳಿಸುವುದು

ಪ್ರತಿ ಉದಾಹರಣೆಯಲ್ಲಿ ಇದರಿವೆ:
- **README.md** - ವಿವರವಾದ ಸೆಟ್ಟಪ್ ಮತ್ತು ಕಸ್ಟಮೈಜೆ이션 ಸೂಚನೆಗಳು
- **azure.yaml** - ಕಾಮೆಂಟ್‌ಗಳೊಂದಿಗೆ AZD ಕಾನ್ಫಿಗರೇಶನ್
- **infra/** - ಪ್ಯಾರಾಮೀಟರ್ ವಿವರಣೆಯೊಂದಿಗೆ Bicep ಟೆಂಪ್ಲೇಟುಗಳು
- **src/** - ಹೊಸಾಗಿನ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್
- **scripts/** - ಸಾಮಾನ್ಯ ಕಾರ್ಯಗಳ ಸಹಾಯಕ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು

## 🎯 ಕಲಿಕೆಯ ಗುರಿಗಳು

### ಉದಾಹರಣೆ ವಿಭಾಗಗಳು

#### **ಮೂಲಭೂತ ನಿಯೋಜನೆಗಳು**
- ಏಕರೂಪ ಸೇವೆ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು
- ಸರಳ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಮಾದರಿಗಳು
- ಮೂಲಭೂತ ಕಾನ್ಫಿಗರೇಶನ್ ನಿರ್ವಹಣೆ
- ವೆಚ್ಚ-ಕಾರ್ಯಕ್ಷಮ ಡೆವಲಪ್‌ಮೆಂಟ್ ಸೆಟ್ಟಪ್‌ಗಳು

#### **ಆಧುನಿಕ ಸನ್ನಿವೇಶಗಳು**
- ಬಹು-ಸೇವೆ ಆರ್ಕಿಟೆಕ್ಟ್‌ಚ್‍಼ರ್‌ಗಳು
- ಸಂಕೀರ್ಣ ನೆಟ್‌ವರ್ಕಿಂಗ್ ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳು
- ಡೇಟಾಬೇಸ್ ಸಂಯೋಜನೆ ಮಾದರಿಗಳು
- ಭದ್ರತೆ ಮತ್ತು ಅನುಪಾಲನಾ ಜಾರಿಗೊಳಿಸುವಿಕೆ

#### **ಉತ್ಪಾದನಾ-ಸಿದ್ಧ ಮಾದರಿಗಳು**
- ಹೈ ಅವೈಲಬಿಲಿಟಿ ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳು
- ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಗಮನಾರ್ಹತೆ
- CI/CD ಏಕೀಕರಣ
- ವಿಪತ್ತು ಪುನರುದ್ಧಾರ ಸೆಟ್ಟಪ್‌ಗಳು

## 📖 ಉದಾಹರಣೆ ವಿವರಣೆಗಳು

### Simple Web App - Node.js Express
**ತಂತ್ರಜ್ಞಾನಗಳು**: Node.js, Express, MongoDB, Container Apps  
**ಸಂಕೀರ್ಣತೆ**: ಪ್ರಾರಂಭಿಕ  
**ಧಾರಣೆಗಳು**: ಮೂಲ ನಿಯೋಜನೆ, REST API, NoSQL ಡೇಟಾಬೇಸ್ ಸಂಯೋಜನೆ

### Static Website - React SPA
**ತಂತ್ರಜ್ಞಾನಗಳು**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**ಸಂಕೀರ್ಣತೆ**: ಪ್ರಾರಂಭಿಕ  
**ಧಾರಣೆಗಳು**: ಸ್ಥಿರ ಹೋಸ್ಟಿಂಗ್, ಸರ್ವರ್‌ಲೆಸ್ ಬ್ಯಾಕ್‌ಎಂಡ್, ಆಧುನಿಕ ವೆಬ್ ಡೆವಲಪ್‌ಮೆಂಟ್

### Container App - Python Flask
**ತಂತ್ರಜ್ಞಾನಗಳು**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**ಸಂಕೀರ್ಣತೆ**: ಪ್ರಾರಂಭಿಕ  
**ಧಾರಣೆಗಳು**: ಕಂಟೈನರೀಕರಣ, REST API, scale-to-zero, health probes, ಮಾನಿಟರಿಂಗ್  
**ಸ್ಥಳ**: [ಸ್ಥಳೀಯ ಉದಾಹರಣೆ](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**ತಂತ್ರಜ್ಞಾನಗಳು**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**ಸಂಕೀರ್ಣತೆ**: ಉನ್ನತ  
**ಧಾರಣೆಗಳು**: ಬಹು-ಸೇವೆ ಆರ್ಕಿಟೆಕ್ಟ್‌ಚ್‍಼ರ್, ಸೇವೆ ಸಂವಹನ, ಮೆಸೇಜ್ ಕ್ಯೂಯಿಂಗ್, ವಿತರಿತ ಟ್ರಾಸಿಂಗ್  
**ಸ್ಥಳ**: [ಸ್ಥಳೀಯ ಉದಾಹರಣೆ](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**ತಂತ್ರಜ್ಞಾನಗಳು**: C# ASP.NET Core, Azure SQL Database, App Service  
**ಸಂಕೀರ್ಣತೆ**: ಮಧ್ಯಮ  
**ಧಾರಣೆಗಳು**: Entity Framework, ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕಗಳು, ವೆಬ್ API ಡೆವಲಪ್‌ಮೆಂಟ್

### Serverless Function - Python Azure Functions
**ತಂತ್ರಜ್ಞಾನಗಳು**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**ಸಂಕೀರ್ಣತೆ**: ಮಧ್ಯಮ  
**ಧಾರಣೆಗಳು**: ಇವೆಂಟ್-ಚಾಲಿತ ಆರ್ಕಿಟೆಕ್ಟರ್, ಸರ್ವರ್‌ಲೆಸ್ ಗಣನೆ, ಫುಲ್-ಸ್ಟಾಕ್ ಡೆವಲಪ್‌ಮೆಂಟ್

### Microservices - Java Spring Boot
**ತಂತ್ರಜ್ಞಾನಗಳು**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**ಸಂಕೀರ್ಣತೆ**: ಮಧ್ಯಮ  
**ಧಾರಣೆಗಳು**: ಮைக್ರೋಸರ್ವೀಸ್ ಸಂವಹನ, ವಿತರಿತ ವ್ಯವಸ್ಥೆಗಳು, ಎಂಟರ್‌ಪ್ರೈಸ್ ಮಾದರಿಗಳು

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**ತಂತ್ರಜ್ಞಾನಗಳು**: Microsoft Foundry Models, Azure AI Search, App Service  
**ಸಂಕೀರ್ಣತೆ**: ಮಧ್ಯಮ  
**ಧಾರಣೆಗಳು**: RAG ಆರ್ಕಿಟೆಕ್ಟ್‌ಚರ್, ವೆಕ್ಟರ್ ಶೋಧ, LLM ಸಂಯೋಜನೆ

#### AI Document Processing
**ತಂತ್ರಜ್ಞಾನಗಳು**: Azure AI Document Intelligence, Storage, Functions  
**ಸಂಕೀರ್ಣತೆ**: ಮಧ್ಯಮ  
**ಧಾರಣೆಗಳು**: ದಸ್ತಾವೇಜು ವಿಶ್ಲೇಷಣೆ, OCR, ಡೇಟಾ ಎಕ್ಸ್ಟ್ರಾಕ್ಷನ್

#### Machine Learning Pipeline
**ತಂತ್ರಜ್ಞಾನಗಳು**: Azure ML, MLOps, Container Registry  
**ಸಂಕೀರ್ಣತೆ**: ಉನ್ನತ  
**ಧಾರಣೆಗಳು**: ಮಾದರಿ ತರಬೇತಿ, ನಿಯೋಜನಾ ಪೈಪ್‌ಲೈನ್‌ಗಳು, ಮಾನಿಟರಿಂಗ್

## 🛠 ಕಾನ್ಫಿಗರೇಶನ್ ಉದಾಹರಣೆಗಳು

`configurations/` ಡೈರೆಕ್ಟರಿ ಪುನಃಬಳಕೆ ಮಾಡಬಹುದಾದ ಘಟಕಗಳನ್ನು ಒಳಗೊಂಡಿದೆ:

### ಪರಿಸರ ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳು
- ಡೆವಲಪ್‌ಮೆಂಟ್ ಪರಿಸರ ಸೆಟ್ಟಿಂಗ್‌ಗಳು
- ಸ್ಟೇಜಿಂಗ್ ಪರಿಸರ ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳು
- ಉತ್ಪಾದನಾ-ಸಿದ್ಧ ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳು
- ಬಹು-ಪ್ರದೇಶ ನಿಯೋಜನೆ ಸೆಟ್ಟಪ್‌ಗಳು

### Bicep ಮೋಡ್ಯೂಲ್‌ಗಳು
- ಪುನಃಬಳಕೆ ಮಾಡಬಹುದಾದ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಘಟಕಗಳು
- ಸಾಮಾನ್ಯ ಸಂಪನ್ಮೂಲ ಪ್ಯಾಟರ್ನ್‌ಗಳು
- ಭದ್ರತೆ ಬಲಪಡಿಸಿದ ಟೆಂಪ್ಲೇಟುಗಳು
- ವೆಚ್ಚವನ್ನು ದಕ್ಷಗೊಳಿಸಿದ ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳು

### ಸಹಾಯಕ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
- ಪರಿಸರ ಸೆಟ್‌ಅಪ್ ಸ್ವಯಂಕ್ರಿಯತೆ
- ಡೇಟಾಬೇಸ್ ಮೈಗ್ರೇಶನ್ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
- ನಿಯೋಜನೆ ಪ್ರಮಾಣೀಕರಣ ಸಾಧನಗಳು
- ವೆಚ್ಚ ಮಾನಿಟರಿಂಗ್ ಉಪಕರಣಗಳು

## 🔧 ಕಸ್ಟಮೈಜೆಷನ್ ಮಾರ್ಗದರ್ಶಿ

### ನಿಮ್ಮ ಬಳಕಾ ಪ್ರಕರಣದಿಗಾಗಿ ಉದಾಹರಣೆಗಳನ್ನು ಹೊಂದಿಸಿಕೊಳ್ಳುವುದು

1. **ಪೂರ್ವಾಪೇಕ್ಷೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ**
   - Azure ಸೇವೆಗಳ ಅಗತ್ಯಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
   - ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್ ಮಿತಿ ಪರಿಶೀಲಿಸಿ
   - ವೆಚ್ಚ ಪರಿಣಾಮಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ

2. **ಕಾನ್ಫಿಗರೇಶನ್ ತಿದ್ದುಪಡಿಸಿಕೊಳ್ಳಿ**
   - `azure.yaml` ಸೇವೆ ವ್ಯಾಖ್ಯಾನಗಳನ್ನು ಅಪ್ಡೇಟ್ ಮಾಡಿ
   - Bicep ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ
   - ಪರಿಸರ ಚರಗಳನ್ನು ಹೊಂದಿಸಿ

3. **ಸೂಕ್ಷ್ಮವಾಗಿ ಪರೀಕ್ಷಿಸಿ**
   - ಮೊದಲು ಡೆವಲಪ್‌ಮೆಂಟ್ ಪರಿಸರಕ್ಕೆ ನಿಯೋಜಿಸಿ
   - ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
   - ಸ್ಕೇಲಿಂಗ್ ಮತ್ತು ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ

4. **ಭದ್ರತಾ ವಿಮರ್ಶೆ**
   - ಪ್ರವೇಶ ನಿಯಂತ್ರಣಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
   - ಸೀಕ್ರೆಟ್‌ಗಳ ನಿರ್ವಹಣೆ ಜಾರಿಗೊಳ್ಳಿ
   - ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಅಲರ್ಟ್‌ಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ

## 📊 ಹೋಲಾಟ ಮ್ಯಾಟ್ರಿಕ್ಸ್

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (ಸ್ಥಳೀಯ) | 2 | ❌ | Key Vault | ಪೂರ್ಣ | ⭐⭐ |
| **Python Flask API** (ಸ್ಥಳೀಯ) | 1 | ❌ | ಮೂಲಭೂತ | ಪೂರ್ಣ | ⭐ |
| **Microservices** (ಸ್ಥಳೀಯ) | 5+ | ✅ | ಎಂಟರ್‌ಪ್ರೈಸ್ | ಉನ್ನತ | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | ಮೂಲಭೂತ | ಮೂಲಭೂತ | ⭐ |
| React SPA + Functions | 3 | ✅ | ಮೂಲಭೂತ | ಪೂರ್ಣ | ⭐ |
| Python Flask Container | 2 | ❌ | ಮೂಲಭೂತ | ಪೂರ್ಣ | ⭐ |
| C# Web API + SQL | 2 | ✅ | ಪೂರ್ಣ | ಪೂರ್ಣ | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | ಪೂರ್ಣ | ಪೂರ್ಣ | ⭐⭐ |
| Java Microservices | 5+ | ✅ | ಪೂರ್ಣ | ಪೂರ್ಣ | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | ಪೂರ್ಣ | ಪೂರ್ಣ | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | ಮೂಲಭೂತ | ಪೂರ್ಣ | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | ಪೂರ್ಣ | ಪೂರ್ಣ | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (ಸ್ಥಳೀಯ) | **8+** | **✅** | **ಎಂಟರ್‌ಪ್ರೈಸ್** | **ಉನ್ನತ** | **⭐⭐⭐⭐** |

## 🎓 ಕಲಿಕಾ ಮಾರ್ಗ

### ಶಿಫಾರಸು progression

1. **Simple Web App ನಿಂದ ಪ್ರಾರಂಭಿಸಿ**
   - ಮೂಲ AZD ಸಂಪ್ರದಾಯಗಳನ್ನು ಕಲಿಯಿರಿ
   - ನಿಯೋಜನಾ ಕಾರ್ಯಪ್ರವಾಹವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
   - ಪರಿಸರ ನಿರ್ವಹಣೆಯಲ್ಲಿ ಅಭ್ಯಾಸ ಮಾಡಿ

2. **Static Website ಪ್ರಯತ್ನಿಸಿ**
   - ವಿಭಿನ್ನ ಹೋಸ್ಟಿಂಗ್ ಆಯ್ಕೆಗಳನ್ನು ಅನ್ವೇಷಿಸಿ
   - CDN ಸಂಯೋಜನೆ ಬಗ್ಗೆ ತಿಳಿಯಿರಿ
   - DNS ಕಾನ್ಫಿಗರೇಶನ್ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ

3. **Container App ಕಡೆಗೆ ಸಾಗಿರಿ**
   - ಕಂಟೈನರೀಕರಣ ಮೂಲಭೂತಗಳನ್ನು ಕಲಿಯಿರಿ
   - ಸ್ಕೇಲಿಂಗ್ ಆವಧಾನಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
   - Dockerೊಂದಿಗೆ ಅಭ್ಯಾಸ ಮಾಡಿ

4. **ಡೇಟಾಬೇಸ್ ಸಂಯೋಜನೆ ಸೇರಿಸಿ**
   - ಡೇಟಾಬೇಸ್Provisioning ಕಲಿಯಿರಿ
   - ಕನೆಕ್ಷನ್ ಸ್ಟ್ರಿಂಗ್‌ಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
   - ಸೀಕ್ರೆಟ್‌ಗಳ ನಿರ್ವಹಣೆಯಲ್ಲಿ ಅಭ್ಯಾಸ ಮಾಡಿ

5. **ಸರ್ವರ್‌ಲೆಸ್ ಅನ್ವೇಷಿಸಿ**
   - ಇವೆಂಟ್-ಚಾಲಿತ ಆರ್ಕಿಟೆಕ್ಟರ್ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
   - ಟ್ರಿಗರ್‌ಗಳು ಮತ್ತು ಬೈಂಡಿಂಗ್‌ಗಳ ಬಗ್ಗೆ ಕಲಿಯಿರಿ
   - API ಗಳೊಂದಿಗೆ ಅಭ್ಯಾಸ ಮಾಡಿ

6. **ಮೈಕ್ರೋಸರ್ವೀಸ್ ನಿರ್ಮಿಸಿ**
   - ಸೇವೆ ಸಂವಹನವನ್ನು ಕಲಿಯಿರಿ
   - ವಿತರಿತ ವ್ಯವಸ್ಥೆಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
   - ಸಂಕೀರ್ಣ ನಿಯೋಜನೆಗಳಲ್ಲಿ ಅಭ್ಯಾಸ ಮಾಡಿ

## 🔍 ಹೊಂದಿರುವ ಸರಿಯಾದ ಉದಾಹರಣೆಯನ್ನು ಹುಡುಕು

### ತಂತ್ರಜ್ಞಾನ ಸ್ಟ್ಯಾಕ್ ಅನ್ವಯವಾಗಿ
- **Container Apps**: [Python Flask API (ಸ್ಥಳೀಯ)](../../../examples/container-app/simple-flask-api), [Microservices (ಸ್ಥಳೀಯ)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (ಸ್ಥಳೀಯ)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (ಸ್ಥಳೀಯ)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (ಸ್ಥಳೀಯ)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (ಸ್ಥಳೀಯ)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (ಸ್ಥಳೀಯ)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (ಸ್ಥಳೀಯ)](../../../examples/container-app/simple-flask-api), [Microservices (ಸ್ಥಳೀಯ)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (ಸ್ಥಳೀಯ)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (ಸ್ಥಳೀಯ)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (ಸ್ಥಳೀಯ)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (ಸ್ಥಳೀಯ)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### ಆರ್ಕಿಟೆಕ್ಟ್‌ಚರ್ ಮಾದರಿಗಳ ಅನುಸಾರ
- **ಸರಳ REST API**: [Python Flask API (ಸ್ಥಳೀಯ)](../../../examples/container-app/simple-flask-api)
- **ಮೋನೋಲಿಥಿಕ್**: Node.js Express Todo, C# Web API + SQL
- **ಸ್ಥಿರ + ಸರ್ವರ್‌ಲೆಸ್**: React SPA + Functions, Python Functions + SPA
- **ಮೈಕ್ರೋಸರ್ವೀಸ್‌ಗಳು**: [Production Microservices (ಸ್ಥಳೀಯ)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **ಕಂಟೈನರ್‌ಯುಕ್ತ**: [Python Flask (ಸ್ಥಳೀಯ)](../../../examples/container-app/simple-flask-api), [Microservices (ಸ್ಥಳೀಯ)](../../../examples/container-app/microservices)
- **AI-ಚಾಲಿತ**: **[Microsoft Foundry Models Chat (ಸ್ಥಳೀಯ)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **ಬಹು-ಏಜೆಂಟ್ ಆರ್ಕಿಟೆಕ್ಟ್‌ಚರ್**: **Retail Multi-Agent Solution**
- **ಎಂಟರ್‌ಪ್ರೈಸ್ ಬಹು-ಸೇವೆ**: [Microservices (ಸ್ಥಳೀಯ)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### ಕಷ್ಟತಾ ಮಟ್ಟದ ಪ್ರಕಾರ
- **ಪ್ರಾರಂಭಿಕ**: [Python Flask API (ಸ್ಥಳೀಯ)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **ಮಧ್ಯಮ**: **[Microsoft Foundry Models Chat (ಸ್ಥಳೀಯ)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **ಉನ್ನತ**: ML Pipeline
- **ಎಂಟರ್‌ಪ್ರೈಸ್ ಉತ್ಪಾದನಾ-ಸಿದ್ಧ**: [Microservices (ಸ್ಥಳೀಯ)](../../../examples/container-app/microservices) (ಮಲ್ಟಿ-ಸೇವೆ ಮೆಸೇಜ್ ಕ್ಯೂಯಿಂಗ್‌ೊಂದಿಗೆ), **Retail Multi-Agent Solution** (ARM ಟೆಂಪ್ಲೇಟು ನಿಯೋಜನೆಯನ್ನು ಹೊಂದಿರುವ ಸಮಗ್ರ ಬಹು-ಏಜೆಂಟ್ ಸಿಸ್ಟಂ)

## 📚 ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

### ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ಲಿಂಕ್ಸ್
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### ಸಮುದಾಯ ಉದಾಹರಣೆಗಳು
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API ಜೊತೆಗೆ React ವೆಬ್ ಅಪ್](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps ಜಾಬ್](https://github.com/Azure-Samples/container-apps-jobs)
- [Java ಜೊತೆಗೆ Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### ಅತ್ಯುತ್ತಮ ಅಭ್ಯಾಸಗಳು
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 ಉದಾಹರಣೆಗಳ ಕೊಡುಗೆ

ಹಂಚಿಕೊಳ್ಳಲು ಉಪಯುಕ್ತ ಉದಾಹರಣೆ ಇದೆಯೇ? ನಾವು ಕೊಡುಗೆಗಳನ್ನು ಸ್ವಾಗತಿಸುತ್ತೇವೆ!

### ಸಲ್ಲಿಸುವ ಮಾರ್ಗಸೂಟಗಳು
1. ಸ್ಥಾಪಿತ ಡೈರೆಕ್ಟರಿ ರಚನೆಯನ್ನು ಅನುಸರಿಸಿ
2. ವಿಸ್ತೃತ README.md ಸೇರಿಸಿ
3. ಕಾನ್ಫಿಗರೇಶನ್ ಫೈಲ್‌ಗಳಿಗೆ ಕಾಮೆಂಟ್‌ಗಳು ಸೇರಿಸಿ
4. ಸಲ್ಲಿಸುವ ಮೊದಲು ಸಂಪೂರ್ಣವಾಗಿ ಪರೀಕ್ಷಿಸಿ
5. ಖರ್ಚಿನ ಅಂದಾಜುಗಳು ಮತ್ತು ಪೂರ್ವಶರತ್ತುಗಳನ್ನು ಸೇರಿಸಿ

### ಉದಾಹರಣೆ ಟೆಂಪ್ಲೇಟ್ ರಚನೆ
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

**Pro Tip**: ನಿಮ್ಮ ತಂತ್ರಜ್ಞಾನ ಸ್ಟ್ಯಾಕ್‌ಗೆ ಹೊಂದುವ ಅತ್ಯಂತ ಸರಳ ಉದಾಹರಣೆಯಿಂದ ಪ್ರಾರಂಭಿಸಿ, ನಂತರ ಕ್ರಮೇಣ ಹೆಚ್ಚು ಸಂಕೀರ್ಣ ಸನ್ನಿವೇಶಗಳಿಗೆ ಹೋಗಿ. ಪ್ರತಿ ಉದಾಹರಣೆ ಹಿಂದಿನ ಉದಾಹರಣೆಗಳ ತತ್ವಗಳ ಮೇಲೆ ನಿರ್ಮಿತವಾಗುತ್ತದೆ!

## 🚀 ಪ್ರಾರಂಭಿಸಲು ಸಿದ್ಧ?

### ನಿಮ್ಮ ಕಲಿಕೆ ಮಾರ್ಗ

1. **ಸಂಪೂರ್ಣ ಆರಂಭಿಕರು?** → [Flask API](../../../examples/container-app/simple-flask-api) ನಿಂದ ಪ್ರಾರಂಭಿಸಿ (⭐, 20 ನಿಮಿಷ)
2. **ಮೂಲಭೂತ AZD ಜ್ಞಾನವಿದೆಯೇ?** → [Microservices](../../../examples/container-app/microservices) ಪ್ರಯತ್ನಿಸಿ (⭐⭐⭐⭐, 60 ನಿಮಿಷ)
3. **AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳು ನಿರ್ಮಿಸುತ್ತಿದ್ದೀರಾ?** → [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) ನಿಂದ ಪ್ರಾರಂಭಿಸಿ (⭐⭐, 35 ನಿಮಿಷ) ಅಥವಾ [Retail Multi-Agent](retail-scenario.md) ಅನ್ನು ಅನ್ವೇಷಿಸಿ (⭐⭐⭐⭐, 2+ ಗಂಟೆಗಳು)
4. **ನಿಮಗೆ ನಿರ್ದಿಷ್ಟ ತಂತ್ರಜ್ಞಾನ ಸ್ಟ್ಯಾಕ್ ಬೇಕೇ?** → ಮೇಲಿನ [ಸರಿಯಾದ ಉದಾಹರಣೆಯನ್ನು ಹುಡುಕುವುದು](#-finding-the-right-example) ವಿಭಾಗವನ್ನು ಬಳಸಿ

### ಮುಂದಿನ ಹಂತಗಳು

- ✅ ಮೇಲಿನ [ಪೂರ್ವಶರತ್ತುಗಳು](#ಪೂರ್ವಾಪೇಕ್ಷೆಗಳು) ಪರಿಶೀಲಿಸಿ
- ✅ ನಿಮ್ಮ ಕೌಶಲ್ಯ ಮಟ್ಟಕ್ಕೆ ಹೊಂದುವ ಉದಾಹರಣೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ (ನೋಡಿ [ಸಂಕೀರ್ಣತಾ ಲೆಜೆಂಡ್](#ಜಟಿಲತೆ-ರೇಟಿಂಗ್-ಲೆಜೆಂಡ್))
- ✅ ನಿಯೋಜಿಸುವ ಮುಂಚೆ ಉದಾಹರಣೆಯ README ಅನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ಓದಿ
- ✅ ಪರೀಕ್ಷಿಸಿದ ನಂತರ `azd down` ಚಾಲಿಸಲು ಸ್ಮರಣಿಕೆ ಹೊಂದಿಸಿ
- ✅ GitHub Issues ಅಥವಾ Discussions ಮೂಲಕ ನಿಮ್ಮ ಅನುಭವವನ್ನು ಹಂಚಿಕೊಳ್ಳಿ

### ಸಹಾಯ ಬೇಕೇ?

- 📖 [FAQ](../resources/faq.md) - ಸಾಮಾನ್ಯ ಪ್ರಶ್ನೆಗಳಿಗೆ ಉತ್ತರಗಳು
- 🐛 [ಸಮಸ್ಯೆ ಪರಿಹಾರ ಮಾರ್ಗದರ್ಶಿ](../docs/chapter-07-troubleshooting/common-issues.md) - ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸಿ
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - ಸಮುದಾಯಕ್ಕೆ ಕೇಳಿ
- 📚 [ಅಧ್ಯಯನ ಮಾರ್ಗದರ್ಶಿ](../resources/study-guide.md) - ನಿಮ್ಮ ಕಲಿಕೆಯನ್ನು ಬಲಪಡಿಸಿ

---

**Navigation**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../README.md)
- **📖 ಅಧ್ಯಯನ ಸಾಮಗ್ರಿಗಳು**: [ಅಧ್ಯಯನ ಮಾರ್ಗದರ್ಶಿ](../resources/study-guide.md) | [ಚೀಟ್ ಶೀಟ್](../resources/cheat-sheet.md) | [ಶಬ್ದಕೋಶ](../resources/glossary.md)
- **🔧 ಸಂಪನ್ಮೂಲಗಳು**: [FAQ](../resources/faq.md) | [ಸಮಸ್ಯೆ ಪರಿಹಾರ](../docs/chapter-07-troubleshooting/common-issues.md)

---

*ಕೊನೆಯದಾಗಿ ನವೀಕರಿಸಲಾಗಿದೆ: November 2025 | [ಸಮಸ್ಯೆಗಳನ್ನು ವರದಿ ಮಾಡಿ](https://github.com/microsoft/AZD-for-beginners/issues) | [ಉದಾಹರಣೆಗಳನ್ನು ಕೊಡುಗೆ ನೀಡಿ](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
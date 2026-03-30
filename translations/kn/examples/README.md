# ಉದಾಹರಣೆಗಳು - ವ್ಯವಹಾರಿಕ AZD ಟೆಂಪ್ಲೇಟುಗಳು ಮತ್ತು ಸಂರಚನೆಗಳು

**ಉದಾಹರಣೆಯಿಂದ ಕಲಿಯುವುದು - ಅಧ್ಯಾಯದ ಮೂಲಕ ವ್ಯವಸ್ಥಿತ**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD ಪ್ರಾರಂಭಿಕರಿಗೆ](../README.md)
- **📖 ಅಧ್ಯಾಯ ನಕ್ಷೆ**: ಕಲಿಕೆಯ জಟಿಲತೆಗೆ ಅನುಸಾರ ವ್ಯವಸ್ಥಿತ ಉದಾಹರಣೆಗಳು
- **🚀 ಸ್ಥಳೀಯ ಉದಾಹರಣೆ**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 ಹೊರಗಿನ AI ಉದಾಹರಣೆಗಳು**: Azure Samples ರೆಪೊಗಳ ಲಿಂಕ್‌ಗಳು

> **📍 ಮುಖ್ಯ: ಸ್ಥಳೀಯ ಮತ್ತು ಹೊರಗಿನ ಉದಾಹರಣೆಗಳು**  
> ಈ ರೆಪೊಯಲ್ಲಿ **4 ಸಂಪೂರ್ಣ ಸ್ಥಳೀಯ ಉದಾಹರಣೆಗಳು** ಪೂರ್ಣ ಅನುಷ್ಠಾನಗಳೊಂದಿಗೆ ಸೇರಿದವು:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 ನೇ ನಿಯೋಜನೆ ಚಾಟ್ ಇಂಟರ್ಫೇಸ್ ಜೊತೆಗೆ)  
> - **Container Apps** (ಸರಳ Flask API + ಮೈಕ್ರೋಸರ್ವಿಸ್‌ಗಳು)  
> - **Database App** (ವೆಬ್ + SQL ಡೇಟಾಬೇಸ್)  
> - **Retail Multi-Agent** (ಎಂಟರ್‌ಪ್ರೈಸ್ AI ಪರಿಹಾರ)  
>  
> ಹೆಚ್ಚುವರಿ ಉದಾಹರಣೆಗಳು Azure-Samples ರೆಪೊಗಳ ಹೊರಗಿನ ಉಲ್ಲೇಖಗಳಾಗಿವೆ, ಅವನ್ನು ನೀವು ಕ್ಲೋನ್ ಮಾಡಬಹುದು.

## ಪರಿಚಯ

ಈ ಡೈರೆಕ್ಟರಿ ನಿಮಗೆ Azure Developer CLI ಅನ್ನು ಕೈಗೊಳ್ಳುವ ಅಭ್ಯಾಸದ ಮೂಲಕ ಕಲಿಯಲು ನೆರವಾಗುವ ವ್ಯವಹಾರಿಕ ಉದಾಹರಣೆಗಳು ಮತ್ತು ಉಲ್ಲೇಖಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ. Retail Multi-Agent ಸನ್ನಿವೇಶವು ಈ ರೆಪೊದಲ್ಲಿ ಸೇರಿಸಲಾದ ಸಂಪೂರ್ಣ, ಉತ್ಪಾದನಾ-ಸಿದ್ಧ ಅನುಷ್ಠಾನವಾಗಿದೆ. ಹೆಚ್ಚುವರಿ ಉದಾಹರಣೆಗಳು ವಿವಿಧ AZD ಮಾದರಿಗಳನ್ನು ಪ್ರದರ್ಶಿಸುವ ಅಧಿಕೃತ Azure Samplesಗಳನ್ನು ಉಲ್ಲೇಖಿಸುತ್ತವೆ.

### ಜಟಿಲತೆ ಶ್ರೇಣಿ ಸಾಹಿತ್ಯ

- ⭐ **ಆರಂಭಿಕ** - ಮೂಲ ತತ್ವಗಳು, ಏಕ ಸೇವೆ, 15-30 ನಿಮಿಷ
- ⭐⭐ **ಮಧ್ಯಮ** - ಬಹು ಸೇವೆ, ಡೇಟಾಬೇಸ್ ಏಕೀಕರಣ, 30-60 ನಿಮಿಷ
- ⭐⭐⭐ **ಉನ್ನತ** - ಜಟಿಲ ಆರ್ಕಿಟೆಕ್ಚರ್, AI ಏಕೀಕರಣ, 1-2 ಗಂಟೆಗಳ
- ⭐⭐⭐⭐ **ತಜ್ಞ** - ಉತ್ಪಾದನಾ-ಸಿದ್ಧ, ಎಂಟರ್‌ಪ್ರೈಸ್ ವಿನ್ಯಾಸಗಳು, 2+ ಗಂಟೆಗಳ

## 🎯ಈ ರೆಪೊದಲ್ಲಿ ಏನು ಇದೆ

### ✅ ಸ್ಥಳೀಯ ಅನುಷ್ಠಾನ (ಬಳಕೆಗೆ ಸಿದ್ಧ)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**ಈ ರೆಪೊದಲ್ಲಿ ಸಂಪೂರ್ಣ gpt-4.1 ನಿಯೋಜನೆ ಚಾಟ್ ಇಂಟರ್ಫೇಸ್ ಸಹಿತ ಸೇರಿಸಲಾಗಿದೆ**

- **ಸ್ಥಳ:** `examples/azure-openai-chat/`
- **ಜಟಿಲತೆ:** ⭐⭐ (ಮಧ್ಯಮ)
- **ಸೇರಿಸಿರುವವು:**
  - ಸಂಪೂರ್ಣ Microsoft Foundry Models ನಿಯೋಜನೆ (gpt-4.1)
  - Python ಕಮಾಂಡ್-ಲೈನ್ ಚಾಟ್ ಇಂಟರ್ಫೇಸ್
  - Key Vault ಏಕೀಕರಣ ಸುರಕ್ಷಿತ API ಕೀಸ್ಗಾಗಿ
  - Bicep ಮೂಲಸೌಕರ್ಯ ಟೆಂಪ್ಲೇಟುಗಳು
  - ಟೋಕನ್ ಬಳಕೆ ಮತ್ತು ವೆಚ್ಚ ಅನುಸರಣೆ
  - ದರ ನಿರ್ಣಯ ಮತ್ತು ದೋಷ ನಿರ್ವಹಣೆ

**ತ್ವರಿತ ಪ್ರಾರಂಭ:**
```bash
# ಉದಾಹರಣೆಗೆ ಹೋಗಿ
cd examples/azure-openai-chat

# ಲ್ಲಾವನ್ನೂ ನಿಯೋಜಿಸಿ
azd up

# ಅವಲಂಬನೆಗಳನ್ನು ಸ್ಥಾಪಿಸಿ ಮತ್ತು ಚಾಟ್ ಪ್ರಾರಂಭಿಸಿ
pip install -r src/requirements.txt
python src/chat.py
```

**ತಂತ್ರಜ್ಞಾನಗಳು:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**ಈ ರೆಪೊದಲ್ಲಿ ಸಂಪೂರ್ಣ ಕಂಟೈನರ್ ನಿಯೋಜನೆ ಉದಾಹರಣೆಗಳು ಸೇರಿವೆ**

- **ಸ್ಥಳ:** `examples/container-app/`
- **ಜಟಿಲತೆ:** ⭐-⭐⭐⭐⭐ (ಆರಂಭಿಕದಿಂದ ಉನ್ನತ)
- **ಸೇರಿಸಿರುವವು:**
  - [Master Guide](container-app/README.md) - ಕಂಟೈನರ್ ನಿಯೋಜನೆಗಳ ಸಮಗ್ರ ಅವಲೋಕನ
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - ಮೂಲ REST API ಉದಾಹರಣೆ
  - [Microservices Architecture](../../../examples/container-app/microservices) - ಉತ್ಪಾದನಾ-ಸಿದ್ಧ ಬಹು-ಸೇವೆಯ ನಿಯೋಜನೆ
  - ತ್ವರಿತ ಪ್ರಾರಂಭ, ಉತ್ಪಾದನೆ, ಮತ್ತು ಉನ್ನತ ಮಾದರಿಗಳು
  - ಮೇಲ್ವಿಚಾರಣೆ, ಭದ್ರತೆ, ಮತ್ತು ವೆಚ್ಚ օಪ್ಟಿಮೈಸೇಶನ್

**ತ್ವರಿತ ಪ್ರಾರಂಭ:**
```bash
# ಮಾಸ್ಟರ್ ಮಾರ್ಗಸೂಚಿಯನ್ನು ವೀಕ್ಷಿಸಿ
cd examples/container-app

# ಸರಳ Flask API ಅನ್ನು ನಿಯೋಜಿಸಿ
cd simple-flask-api
azd up

# ಮೈಕ್ರೋಸೇವೆಗಳ ಉದಾಹರಣೆಯನ್ನು ನಿಯೋಜಿಸಿ
cd ../microservices
azd up
```

**ತಂತ್ರಜ್ಞಾನಗಳು:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**ಈ ರೆಪೊದಲ್ಲಿ ಸಂಪೂರ್ಣ ಉತ್ಪಾದನಾ-ಸಿದ್ಧ ಅನುಷ್ಠಾನ ಸೇರಿಸಲಾಗಿದೆ**

- **ಸ್ಥಳ:** `examples/retail-multiagent-arm-template/`
- **ಜಟಿಲತೆ:** ⭐⭐⭐⭐ (ಉನ್ನತ)
- **ಸೇರಿಸಿರುವವು:**
  - ಸಂಪೂರ್ಣ ARM ನಿಯೋಜನೆ ಟೆಂಪ್ಲೇಟ್
  - ಮಲ್ಟಿ-ಏಜೆಂಟ್ ಆರ್ಕಿಟೆಕ್ಚರ್ (Customer + Inventory)
  - Microsoft Foundry Models ಏಕೀಕರಣ
  - AI Search ಸಹಿತ RAG
  - ಸಮಗ್ರ ಮೇಲ್ವಿಚಾರಣೆ
  - ಒನ್-ಕ್ಲಿಕ್ ನಿಯೋಜನೆ ಸ್ಕ್ರಿಪ್ಟ್

**ತ್ವರಿತ ಪ್ರಾರಂಭ:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**ತಂತ್ರಜ್ಞಾನಗಳು:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 ಹೊರಗಿನ Azure Samples (ಕ್ಲೋನ್ ಮಾಡಿ ಬಳಸು)

ಕೆಳಗಿನ ಉದಾಹರಣೆಗಳು ಅಧಿಕೃತ Azure-Samples ರೆಪೊಗಳಲ್ಲಿ ನಿರ್ವಹಿಸಲ್ಪಡುತ್ತವೆ. ವಿಭಿನ್ನ AZD ಮಾದರಿಗಳನ್ನು ಅನ್ವೇಷಿಸಲು ಅವುಗಳನ್ನು ಕ್ಲೋನ್ ಮಾಡಿ:

### ಸರಳ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು (ಅಧ್ಯಾಯಗಳು 1-2)

| ಟೆಂಪ್ಲೇಟ್ | ರೆಪೊ | ಜಟಿಲತೆ | ಸೇವೆಗಳು |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [ಸ್ಥಳೀಯ: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [ಸ್ಥಳೀಯ: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | ಬಹು-ಸೇವೆ, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**ಬಳಕೆ ಹೇಗೆ:**
```bash
# ಯಾವುದೇ ಉದಾಹರಣೆಯನ್ನು ಕ್ಲೋನ್ ಮಾಡಿ
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
azd up
```

### AI ಅಪ್ಲಿಕೇಶನ್ ಉದಾಹರಣೆಗಳು (ಅಧ್ಯಾಯಗಳು 2, 5, 8)

| ಟೆಂಪ್ಲೇಟ್ | ರೆಪೊ | ಜಟಿಲತೆ | ಗಮನಕೇಂದ್ರ |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [ಸ್ಥಳೀಯ: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 ನಿಯೋಜನೆ |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | ಮೂಲ AI ಚಾಟ್ |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | ಏಜೆಂಟ್ ಫ್ರೇಮ್ವರ್ಕ್ |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG ಮಾದರಿ |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | ಎಂಟರ್‌ಪ್ರೈಸ್ AI |

### ಡೇಟಾಬೇಸ್ & ಉನ್ನತ ಮಾದರಿಗಳು (ಅಧ್ಯಾಯಗಳು 3-8)

| ಟೆಂಪ್ಲೇಟ್ | ರೆಪೊ | ಜಟಿಲತೆ | ಗಮನಕೇಂದ್ರ |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | ಡೇಟಾಬೇಸ್ ಏಕೀಕರಣ |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL ಸರ್ವರ್ಸ್ಲೆಸ್ |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | ಬಹು-ಸೇವೆ |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಉದಾಹರಣೆಗಳ ಮೂಲಕ ಕೆಲಸ ಮಾಡುವ ಮೂಲಕ ನೀವು:
- ಯಥಾರ್ಥ ಅಪ್ಲಿಕೇಶನ್ ಸನ್ನಿವೇಶಗಳೊಂದಿಗೆ Azure Developer CLI ವರ್ಕ್ಫ್ಲೋಗಳನ್ನು ಅಭ್ಯಾಸ ಮಾಡುತ್ತೀರಿ
- ವಿಭಿನ್ನ ಅಪ್ಲಿಕೇಶನ್ ಆರ್ಕಿಟೆಕ್ಚರ್‌ಗಳನ್ನು ಮತ್ತು ಅವುಗಳ azd ಅನುಷ್ಠಾನಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುತ್ತೀರಿ
- ವಿವಿಧ Azure ಸೇವೆಗಳಿಗಾಗಿ Infrastructure as Code ಮಾದರಿಗಳನ್ನು ಪ್ರಧಾನವಾಗಿ ಕೈಗೆತ್ತಿಕೊಳ್ಳುತ್ತೀರಿ
- ಸಂರಚನಾ ನಿರ್ವಹಣೆ ಮತ್ತು ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ನಿಯೋಜನೆ ತಂತ್ರಗಳನ್ನು ಅನ್ವಯಿಸುತ್ತೀರಿ
- ಕಾರ್ಯಾಚರಣೆ, ಭದ್ರತೆ ಮತ್ತು ಸ್ಕೇಲಿಂಗ್ ಮಾದರಿಗಳನ್ನು ವ್ಯವಹಾರಿಕ ಸನ್ನಿವೇಶಗಳಲ್ಲಿ ಅನುಷ್ಠಾನಗೊಳಿಸುತ್ತೀರಿ
- ನೈಜ ನಿಯೋಜನೆ ಪರಿಸ್ಥಿತಿಗಳಲ್ಲಿ ಸಮಸ್ಯಾ ಪರಿಹಾರ ಮತ್ತು ಡಿಬಗ್ಗೆ ಮಾಡುವ ಅನುಭವ ನಿರ್ಮಿಸುತ್ತೀರಿ

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಈ ಉದಾಹರಣೆಗಳನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು ಸಾಧ್ಯವಿದ್ದು:
- Azure Developer CLI ಬಳಸಿ ವೈವಿಧ್ಯಮಯ ಅಪ್ಲಿಕೇಶನ್ ಪ್ರಕಾರಗಳನ್ನು ಆತ್ಮವಿಶ್ವಾಸದಿಂದ ನಿಯೋಜಿಸಬಹುದು
- ಒದಗಿಸಿದ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ನಿಮ್ಮ ಸ್ವಂತ ಅಪ್ಲಿಕೇಶನ್ ಅಗತ್ಯಗಳಿಗೆ ಹೊಂದಿಕೆ ಮಾಡಬಹುದು
- Bicep ಬಳಸಿ ಕಸ್ಟಮ್ ಮೂಲಸೌಕರ್ಯ ಮಾದರಿಗಳನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸಿ ಅನುಷ್ಠಾನ ಮಾಡಬಹುದು
- ಸರಿಯಾದ ನಿಗಮಗಳೊಂದಿಗೆ ಜಟಿಲ ಬಹು-ಸೇವಾ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ಸಂರಚಿಸಬಹುದು
- ನೈಜ ಸನ್ನಿವೇಶಗಳಲ್ಲಿ ಭದ್ರತೆ, ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ಪ್ರದರ್ಶನದ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳನ್ನು ಅನ್ವಯಿಸಬಹುದು
- ವ್ಯವಹಾರಿಕ ಅನುಭವದ ಆಧಾರದ ಮೇಲೆ ನಿಯೋಜನೆಗಳ ಸಮಸ್ಯಾ ಪರಿಹಾರ ಮತ್ತು ಅನುಕೂಲಗೊಳಿಸುವಿಕೆ ಮಾಡಬಹುದು

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

## ತ್ವರಿತ ಪ್ರಾರಂಭ ಉದಾಹರಣೆಗಳು

> **💡 AZD ಹೊಸದಾಗಿ ಕಂಡೀರಾ?** ಉದಾಹರಣೆ #1 (Flask API) ನಲ್ಲಿ ಪ್ರಾರಂಭಿಸಿ - ಸುಮಾರು ~20 ನಿಮಿಷ ತೆಗೆದುಕೊಳ್ಳುತ್ತದೆ ಮತ್ತು ಆಧಾರಭೂತ ತತ್ವಗಳನ್ನು ಕಲಿಸುತ್ತದೆ.

### ಆರಂಭಿಕರಿಗೆ
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (ಸ್ಥಳೀಯ) ⭐  
   ಮೆಟ್ಟಿಲಿಗೆ ಶೂನ್ಯಕ್ಕೆ ಸ್ಕೇಲಿಂಗ್ ಹೊಂದಿರುವ ಸರಳ REST API ಅನ್ನು ನಿಯೋಜಿಸಿ  
   **ಸಮಯ:** 20-25 ನಿಮಿಷ | **ಖರ್ಚು:** $0-5/ತಿಂಗಳು  
   **ನೀವು ಕಲಿಯುವದು:** ಮೂಲ azd ವರ್ಕ್ಫ್ಲೋ, ಕಂಟೈನರೈಜೆಷನ್, ಹೆಲ್ತ್ ಪ್ರೋಬ್‌ಗಳು  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** "Hello, World!" ಅನ್ನು ಹಿಂತಿರುಗಿಸುವ ಕಾರ್ಯನಿರ್ವಹಿಸುವ API ಎಂಡ್‌ಪಾಯಿಂಟ್ ಮತ್ತು ಮೇಲ್ವಿಚಾರಣೆ

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB ಜೊತೆಗೆ Node.js Express ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜಿಸಿ  
   **ಸಮಯ:** 25-35 ನಿಮಿಷ | **ಖರ್ಚು:** $10-30/ತಿಂಗಳು  
   **ನೀವು ಕಲಿಯುವದು:** ಡೇಟಾಬೇಸ್ ಏಕೀಕರಣ, ಪರಿಸರ ವ್ಯತ್ಯಯಗಳು, ಸಂಪರ್ಕ ಸ್ಟ್ರಿಂಗ್‌ಗಳು  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ರಚಿಸಿ/ಓದು/ಅಪ್ಡೇಟ್/ಅಳಿಸುವ ಕಾರ್ಯವೊಂದನ್ನು ಹೊಂದಿರುವ Todo ಲಿಸ್ಟ್ ಆಪ್

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps ಬಳಸಿ React ಸ್ಥಿರ ವೆಬ್‌ಸೈಟ್ ಅನ್ನು ಹೋಸ್ಟ್ ಮಾಡಿ  
   **ಸಮಯ:** 20-30 ನಿಮಿಷ | **ಖರ್ಚು:** $0-10/ತಿಂಗಳು  
   **ನೀವು ಕಲಿಯುವದು:** ಸ್ಥಿರ ಹೊಸ್ಟಿಂಗ್, ಸರ್ವರ್‌ಲೆಸ್ ಫಂಕ್ಷನ್‌ಗಳು, CDN ನಿಯೋಜನೆ  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** API ಬ್ಯಾಕ್‌ಎಂಡ್‌ನೊಂದಿಗೆ React UI, ಸ್ವಯಂಚಾಲಿತ SSL, ಜಾಗತಿಕ CDN

### ಮಧ್ಯಮ ಬಳಕೆದಾರರಿಗೆ
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (ಸ್ಥಳೀಯ) ⭐⭐  
   gpt-4.1 ಅನ್ನು ಚಾಟ್ ಇಂಟರ್ಫೇಸ್ ಮತ್ತು ಸುರಕ್ಷಿತ API ಕೀ ನಿರ್ವಹಣೆಯೊಂದಿಗೆ ನಿಯೋಜಿಸಿ  
   **ಸಮಯ:** 35-45 ನಿಮಿಷ | **ಖರ್ಚು:** $50-200/ತಿಂಗಳು  
   **ನೀವು ಕಲಿಯುವದು:** Microsoft Foundry Models ನಿಯೋಜನೆ, Key Vault ಏಕೀಕರಣ, ಟೋಕನ್ ಟ್ರ್ಯಾಕಿಂಗ್  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** gpt-4.1 ಮತ್ತು ವೆಚ್ಚ ಮೇಲ್ವಿಚಾರಣೆಯೊಂದಿಗೆ ಕಾರ್ಯನಿರ್ವಹಿಸುವ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (ಸ್ಥಳೀಯ) ⭐⭐⭐⭐  
   ಉತ್ಪಾದನಾ-ಸಿದ್ಧ ಬಹು-ಸೇವೆ ಆರ್ಕಿಟೆಕ್ಚರ್  
   **ಸಮಯ:** 45-60 ನಿಮಿಷ | **ಖರ್ಚು:** $50-150/ತಿಂಗಳು  
   **ನೀವು ಕಲಿಯುವದು:** ಸೇವಾ ಸಂವಹನ, ಸಂದೇಶ ಕುಯಿಂಗ್, ವಿತರಣಾ ಟ್ರೇಸಿಂಗ್  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** 2-ಸೇವೆಯ ವ್ಯವಸ್ಥೆ (API ಗೇಟ್ವೇ + ಉತ್ಪನ್ನ ಸೇವೆ) ಮೇಲ್ವಿಚಾರಣೆಯೊಂದಿಗೆ

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API ಮತ್ತು Azure SQL ಡೇಟಾಬೇಸ್ ಹೊಂದಿರುವ ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್  
   **ಸಮಯ:** 30-45 ನಿಮಿಷ | **ಖರ್ಚು:** $20-80/ತಿಂಗಳು  
   **ನೀವು ಕಲಿಯುವದು:** Entity Framework, ಡೇಟಾಬೇಸ್ ಮೈಗ್ರೇಶನ್‌ಗಳು, ಸಂಪರ್ಕ ಭದ್ರತೆ  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** Azure SQL ಬೆಕ್‌ಎಂಡ್ ಇರುವ C# API, ಸ್ವಯಂಚಾಲಿತ ಸ್ಕೀಮಾ ನಿಯೋಜನೆ

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ಟ್ರಿಗರ್ಗಳು ಮತ್ತು Cosmos DB ಹೊಂದಿರುವ Python Azure Functions  
   **ಸಮಯ:** 30-40 ನಿಮಿಷ | **ಖರ್ಚು:** $10-40/ತಿಂಗಳು  
   **ನೀವು ಕಲಿಯುವದು:** ಘಟನೆ-ಚಾಲಿತ ಆರ್ಕಿಟೆಕ್ಚರ್, ಸರ್ವರ್‌ಲೆಸ್ ಸ್ಕೇಲಿಂಗ್, NoSQL ಏಕೀಕರಣ  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** HTTP ವಿನಂತಿಗಳಿಗೆ ಪ್ರತಿಕ್ರಿಯಿಸುವ ಮತ್ತು Cosmos DB ಸ್ಟೋರೇಜ್ ಬಳಸುವ ಫಂಕ್ಷನ್ ಅಪ್

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps ಮತ್ತು API ಗೇಟ್ವೇ ಇರುವ ಬಹು-ಸೇವೆ Java ಅಪ್ಲಿಕೇಶನ್  
   **ಸಮಯ:** 60-90 ನಿಮಿಷ | **ಖರ್ಚು:** $80-200/ತಿಂಗಳು  
   **ನೀವು ಕಲಿಯುವದು:** Spring Boot ನಿಯೋಜನೆ, ಸೇವೆ ಮೇಶ್, ಲೋಡ್ ಬ್ಯಾಲೆನ್ಸಿಂಗ್  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ಸೇವೆ ಅನ್ವೇಷಣೆ ಮತ್ತು ರೌಟಿಂಗ್ ಇರುವ ಬಹು-ಸೇವೆ Java ವ್ಯವಸ್ಥೆ

### Microsoft Foundry ಮಾದರಿಗಳು

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   ಚಾಟ್ ಇಂಟರ್ಫೇಸ್ ಹೊಂದಿರುವ ಸಂಪೂರ್ಣ gpt-4.1 ನಿಯೋಜನೆ  
   **ಸಮಯ:** 35-45 ನಿಮಿಷ | **ಖರ್ಚು:** $50-200/ತಿಂಗಳು  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ಟೋಕನ್ ಟ್ರ್ಯಾಕಿಂಗ್ ಮತ್ತು ವೆಚ್ಚ ಮೇಲ್ವಿಚಾರಣೆಯೊಂದಿಗಿನ ಕಾರ್ಯನಿರ್ವಹಿಸುವ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG ಆರ್ಕಿಟೆಕ್ಷರ್ ಹೊಂದಿರುವ ಬುದ್ಧಿವಂತ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್  
   **ಸಮಯ:** 60-90 ನಿಮಿಷ | **ಖರ್ಚು:** $100-300/ತಿಂಗಳ  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ಡಾಕ್ಯುಮೆಂಟ್ ಶೋಧ ಮತ್ತು ಉಲ್ಲೇಖಗಳೊಂದಿಗೆ RAG ಶಕ್ತಿಯ ಚಾಟ್ ಇಂಟರ್ಫೇಸ್

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI ಸೇವೆಗಳನ್ನು ಬಳಸಿಕೊಂಡು ಡಾಕ್ಯುಮೆಂಟ್ ವಿಶ್ಲೇಷಣೆ  
   **ಸಮಯ:** 40-60 ನಿಮಿಷ | **ಖರ್ಚು:** $20-80/ತಿಂಗಳು  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ಅಪ್ಲೋಡ್ ಮಾಡಿದ ಡಾಕ್ಯುಮೆಂಟ್‌ಗಳಿಂದ ಪಠ್ಯ, ಟೇಬಲ್‌ಗಳು ಮತ್ತು ಎಂಟಿಟಿಗಳನ್ನು ಉದ್ಘಟಿಸುವ API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning ಹೊಂದಿರುವ MLOps ವರ್ಕ್‌ಫ್ಲೋ  
   **ಸಮಯ:** 2-3 ಗಂಟೆಗಳು | **ಖರ್ಚು:** $150-500/ತಿಂಗಳು  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ತರಬೇತಿ, ನಿಯೋಜನೆ ಮತ್ತು ಮೇಲ್ವಿಚಾರಣೆಯೊಂದಿಗೆ ಸ್ವಯಂಚಾಲಿತ ML ಪೈಪ್‌ಲೈನ್

### ನೈಜ ಜಗತ್ತಿನ ಸನ್ನಿವೇಶಗಳು

#### **Retail Multi-Agent Solution** 🆕
**[ಸಂಪೂರ್ಣ ಅನುಷ್ಠಾನ ಮಾರ್ಗದರ್ಶಿ](./retail-scenario.md)**

AZD ಬಳಸಿ ಎಂಟರ್‌ಪ್ರೈಸ್-ಗ್ರೇಡ್ AI ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆಯನ್ನು ಪ್ರದರ್ಶಿಸುವ ಸಂಪೂರ್ಣ, ಉತ್ಪಾದನಾ-ಸಿದ್ಧ ಬಹು-ಏಜೆಂಟ್ ಗ್ರಾಹಕ ಬೆಂಬಲ ಪರಿಹಾರದ ಸಮಗ್ರ ಮಾರ್ಗದರ್ಶಿ. ಈ ಸನ್ನಿವೇಶವು ಒದಗಿಸುವದು:
- **ಸಂಪೂರ್ಣ ವಾಸ್ತುಶಿಲ್ಪ**: ವಿಶೇಷीकೃತ ಗ್ರಾಹಕ ಸೇವೆ ಮತ್ತು ಇನ್ವೆಂಟರಿ ನಿರ್ವಹಣಾ ಏಜೆಂಟ್‌ಗಳನ್ನು ಒಳಗೊಂಡಿರುವ ಬಹು-ಏಜೆಂಟ್ ವ್ಯವಸ್ಥೆ
- **ಉತ್ಪಾದನಾ ಮೂಲಸೌಕರ್ಯ**: ಬಹು-ಪ್ರಾಂತ Microsoft Foundry Models ನಿಯೋಜನೆಗಳು, AI Search, Container Apps, ಮತ್ತು ಸಮಗ್ರ ಮೇಲ್ವಿಚಾರಣೆ
- **ನಿಯೋಜನೆಗೆ ಸಿದ್ಧ ARM Template**: ಒಂದು ಕ್ಲಿಕ್‌ನಲ್ಲಿ ನಿಯೋಜನೆ ಹಲವಾರು ಸಂರಚನಾ ಮೋಡ್‌ಗಳೊಂದಿಗೆ (Minimal/Standard/Premium)
- **ಉನ್ನತ ವೈಶಿಷ್ಟ್ಯಗಳು**: ರೆಡ್ ಟೀಮಿಂಗ್ ಭದ್ರತಾ ಮಾನ್ಯತೆ, ಏಜೆಂಟ್ ಮೌಲ್ಯಮಾಪನ ಫ್ರೇಮ್ವರ್ಕ್, ವೆಚ್ಚ ಆಪ್ಟಿಮೈಜೇಶನ್, ಮತ್ತು ಸಮಸ್ಯೆ ಪರಿಹಾರ ಮಾರ್ಗದರ್ಶಿಗಳು
- **ವಾಸ್ತವ ವ್ಯವಹಾರದ ಸನ್ನಿವೇಶ**: ರಿಟೇಲರ್ ಗ್ರಾಹಕ ಬೆಂಬಲ ಬಳಕೆದ ಉದಾಹರಣೆ — ಫೈಲ್ ಅಪ್‌ಲೋಡ್‌ಗಳು, ಶೋಧ ಸಂಯೋಜನೆ ಮತ್ತು ಡೈನಾಮಿಕ್ ಸ್ಕೇಲಿಂಗ್

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (ಉನ್ನತ - ಎಂಟರ್‌ಪ್ರೈಸು ಉತ್ಪಾದನಾ ಸಿದ್ಧ)

**Perfect for**: AI ಅಭಿವೃದ್ಧಿಗಾರರು, ಪರಿಹಾರ ಆರ್ಕಿಟೆಕ್ಟ್ಗಳು, ಮತ್ತು ಉತ್ಪಾದನಾ ಬಹು-ಏಜೆಂಟ್ ವ್ಯವಸ್ಥೆಗಳನ್ನು ನಿರ್ಮಿಸುವ ತಂಡಗಳು

**Quick Start**: ಸೇರಿರುವ ARM ಟೆಂಪ್ಲೇಟ್ ಬಳಸಿ `./deploy.sh -g myResourceGroup` ಮೂಲಕ 30 ನಿಮಿಷಕ್ಕೊಳಗಾಗಿ ಸಂಪೂರ್ಣ ಪರಿಹಾರವನ್ನು ನಿಯೋಜಿಸಿ

## 📋 ಉಪಯೋಗ ಸೂಚನೆಗಳು

### ಅಗತ್ಯಗಳು

Before running any example:
- ✅ Owner ಅಥವಾ Contributor ಅನುಮತಿ ಹೊಂದಿರುವ Azure ಚಂದಾದಾರಿಕೆ
- ✅ Azure Developer CLI ಸ್ಥಾಪನೆಯಾಗಿರಬೇಕು ([ಸ್ಥಾಪನೆ ಮಾರ್ಗದರ್ಶಿ](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop ಚಾಲನೆಯಲ್ಲಿರಬೇಕು (container ಉದಾಹರಣೆಗಳಿಗಾಗಿ)
- ✅ ಸೂಕ್ತ Azure ಕೋಟ್‌ಗಳು (ಉದಾಹರಣೆ-ವಿಶೇಷ ಅಗತ್ಯಗಳನ್ನು ಪರಿಶೀಲಿಸಿ)

> **💰 ವೆಚ್ಚ ಎಚ್ಚರಿಕೆ:** ಎಲ್ಲಾ ಉದಾಹರಣೆಗಳು ವಾಸ್ತವ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸುತ್ತವೆ ಮತ್ತು ಅವುಗಳಿಗೆ ಶುಲ್ಕ ವಿಧಿಸಲಾಗುತ್ತದೆ. ವೆಚ್ಚ ಅಂದಾಜುಗಳಿಗಾಗಿ ಪ್ರತ್ಯೇಕ README ಫೈಲ್‌ಗಳನ್ನು ನೋಡಿ. ನಿರಂತರ ವೆಚ್ಚಗಳಿಂದ ತಪ್ಪಿಸಿಕೊಳ್ಳಲು ಮುಗಿದ ನಂತರ `azd down` ಅನ್ನು ಓಡಿಸಿ.

### ಉದಾಹರಣೆಗಳನ್ನು ಸ್ಥಳೀಯವಾಗಿ ನಡೆಸುವುದು

1. **ಉದಾಹರಣೆಯನ್ನು ಕ್ಲೋನ್ ಅಥವಾ ನಕಲು ಮಾಡುವುದು**
   ```bash
   # ಬಯಸಿದ ಉದಾಹರಣೆಗೆ ಹೋಗಿ
   cd examples/simple-web-app
   ```

2. **AZD ಪರಿಸರವನ್ನು ಪ್ರಾರಂಭಿಸಿ**
   ```bash
   # ಈಗಿರುವ ಟೆಂಪ್ಲೇಟಿನಿಂದ ಪ್ರಾರಂಭಿಸಿ
   azd init
   
   # ಅಥವಾ ಹೊಸ ಪರಿಸರವನ್ನು ರಚಿಸಿ
   azd env new my-environment
   ```

3. **ಪರಿಸರವನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ**
   ```bash
   # ಆವಶ್ಯಕ ಚರಗಳನ್ನು ಹೊಂದಿಸಿ
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **ನಿಯೋಜಿಸಿ**
   ```bash
   # ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
   azd up
   ```

5. **ನಿಯೋಜನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ**
   ```bash
   # ಸೇವಾ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪಡೆಯಿರಿ
   azd env get-values
   
   # ಎಂಡ್ಪಾಯಿಂಟ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ (ಉದಾಹರಣೆ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **ನಿರೀಕ್ಷಿತ ಯಶಸ್ಸಿನ ಸೂಚಕಗಳು:**
   - ✅ `azd up` ಯಾವುದೇ ದೋಷವಿಲ್ಲದೆ ಪೂರ್ಣಗೊಳ್ಳುತ್ತದೆ
   - ✅ ಸೇವಾ ಎಂಡ್‌ಪಾಯಿಂಟ್ HTTP 200 ಅನ್ನು ಹಿಂತಿರುಗಿಸುತ್ತದೆ
   - ✅ Azure Portal "Running" ಸ್ಥಿತಿಯನ್ನು ತೋರಿಸುತ್ತದೆ
   - ✅ Application Insights ಟೆಲಿಮೆಟ್ರಿಯನ್ನು ಸ್ವೀಕರಿಸುತ್ತಿದೆ

> **⚠️ ಸಮಸ್ಯೆಗಳು ಇದೆಯೇ?** ನಿಯೋಜನೆ ದೋಷನಿವಾರಣೆಗೆ [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು](../docs/chapter-07-troubleshooting/common-issues.md) ಅನ್ನು ನೋಡಿ

### ಉದಾಹರಣೆಗಳನ್ನು ಹೊಂದಿಸುವುದು

Each example includes:
- **README.md** - ವಿಸ್ತೃತ ಸೆಟಪ್ ಮತ್ತು ಕಸ್ಟಮೈಜೆಶನ್ ಸೂಚನೆಗಳು
- **azure.yaml** - కామೆಂಟ್‌ಗಳೊಂದಿಗೆ AZD ಸಂರಚನೆ
- **infra/** - ಪ್ಯಾರಾಮೀಟರ್ ವಿವರಣೆಗಳೊಂದಿಗೆ Bicep ಟೆಂಪ್ಲೇಟ್‌ಗಳು
- **src/** - ನಮೂನಾ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್
- **scripts/** - ಸಾಮಾನ್ಯ ಕಾರ್ಯಗಳಿಗೆ ಸಹಾಯಕ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು

## 🎯 ಕಲಿಕೆಯ ಉದ್ದೇಶಗಳು

### ಉದಾಹರಣೆ ವರ್ಗಗಳು

#### **ಮೂಲಭೂತ ನಿಯೋಜನೆಗಳು**
- ಏಕ-ಸೇವಾ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು
- ಸರಳ ಮೂಲಸೌಕರ್ಯ ಮಾದರಿಗಳು
- ಮೂಲಭೂತ ಸಂರಚನಾ ನಿರ್ವಹಣೆ
- ವೆಚ್ಚ-ಕಾರ್ಯಕ್ಷಮ ಅಭಿವೃದ್ಧಿ ಸೆಟಪ್‌ಗಳು

#### **ಉನ್ನತ ದೃಶ್ಯಗಳು**
- ಬಹು-ಸೇವಾ ವಾಸ್ತುಶಿಲ್ಪಗಳು
- ಸಂಕೀರ್ಣ ನೆಟ್‌ವರ್ಕಿಂಗ್ ಸಂರಚನೆಗಳು
- ಡೇಟಾಬೇಸ್ ಏಕೀಕರಣ ಮಾದರಿಗಳು
- ಭದ್ರತೆ ಮತ್ತು ಅನುಸರಣೆ ಅನುಷ್ಠಾನಗಳು

#### **ಉತ್ಪಾದನಾ-ಸಿದ್ಧ ಮಾದರಿಗಳು**
- ಉನ್ನತ ಲಭ್ಯತೆ ಸಂರಚನೆಗಳು
- ಮೋನಿಟರಿಂಗ್ ಮತ್ತು ಗಮನಾರ್ಹತೆ
- CI/CD ಏಕೀಕರಣ
- ವಿಪತ್ತು ಪುನಶ್ಚೇತನ ನಿಯೋಜನೆಗಳು

## 📖 ಉದಾಹರಣೆಯ ವಿವರಣೆಗಳು

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: ಪ್ರಾರಂಭಿಕ  
**Concepts**: ಮೂಲ ನಿಯೋಜನೆ, REST API, NoSQL ಡೇಟಾಬೇಸ್ ಏಕೀಕರಣ

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: ಪ್ರಾರಂಭಿಕ  
**Concepts**: ಸ್ಥಿರ ಹೊಸ್ಟ್‌ಿಂಗ್, ಸರ್ವರ್ಲೆಸ್ ಬ್ಯಾಕೆಂಡ್, ಆಧುನಿಕ ವೆಬ್ ಅಭಿವೃದ್ಧಿ

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: ಪ್ರಾರಂಭಿಕ  
**Concepts**: ಕಂಟೇನರೈಜೇಶನ್, REST API, scale-to-zero, health probes, monitoring  
**Location**: [ಸ್ಥಳೀಯ ಉದಾಹರಣೆ](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: ಉನ್ನತ  
**Concepts**: ಬಹು-ಸೇವೆ ವಾಸ್ತುಶಿಲ್ಪ, ಸೇವಾ ಸಂವಹನ, ಮೆಸೇಜ್ ಕ್ಯೂಯಿಂಗ್, ವಿಂಗಡಿತ ಟ್ರೇಸಿಂಗ್  
**Location**: [ಸ್ಥಳೀಯ ಉದಾಹರಣೆ](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: ಮಧ್ಯಮ  
**Concepts**: Entity Framework, ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕಗಳು, ವೆಬ್ API ಅಭಿವೃದ್ಧಿ

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: ಮಧ್ಯಮ  
**Concepts**: ಇವೆಂಟ್-ಪ್ರೇರಿತ ವಾಸ್ತುಶಿಲ್ಪ, ಸರ್ವರ್ಲೆಸ್ ಕಂಪ್ಯೂಟಿಂಗ್, ಫುಲ್-ಸ್ಟಾಕ್ ಅಭಿವೃದ್ಧಿ

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: ಮಧ್ಯಮ  
**Concepts**: ಮೈಕ್ರೋಸರ್ವೀಸ್ ಸಂವಹನ, ವಿಂಗಡಿತ ವ್ಯವಸ್ಥೆಗಳು, ಎಂಟರ್‌ಪ್ರೈಸು ಮಾದರಿಗಳು

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complexity**: ಮಧ್ಯಮ  
**Concepts**: RAG ವಾಸ್ತುಶಿಲ್ಪ, ವೆಕ್ಟರ್ ಶೋಧ, LLM ಏಕರೂಪಣೆ

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: ಮಧ್ಯಮ  
**Concepts**: ದಾಖಲೆ ವಿಶ್ಲೇಷಣೆ, OCR, ಡೇಟಾ ಎಕ್ಸ್‌ ಟ್ರಾಕ्शन

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: ಉನ್ನತ  
**Concepts**: ಮಾದರಿ ತರಬೇತಿ, ನಿಯೋಜನೆ ಪೈಪ್‌ಲೈನ್ಗಳು, ಮೆನಿಟರಿಂಗ್

## 🛠 ಕಾನ್ಫಿಗರೇಷನ್ ಉದಾಹರಣೆಗಳು

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

## 🔧 ಕಸ್ಟಮೈಜೇಶನ್ ಮಾರ್ಗದರ್ಶಿ

### ನಿಮ್ಮ ಬಳಕೆಕೇಸ್‌ಗೆ ಉದಾಹರಣೆಗಳನ್ನು ಹೊಂದಿಸುವುದು

1. **ಆವಶ್ಯಕತೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ**
   - Azure ಸೇವಾ ಅಗತ್ಯಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
   - ಚಂದಾದಾರಿಕೆ ಮಿತಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
   - ವೆಚ್ಚ ಪರಿಣಾಮಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ

2. **ಕಾನ್ಫಿಗರೇಷನನ್ನು ಬದಲಾಯಿಸಿ**
   - `azure.yaml` ಸೇವಾ ವ್ಯಾಖ್ಯಾನಗಳನ್ನು ಅಪ್ಡೇಟ್ ಮಾಡಿ
   - Bicep ಟೆಂಪ್ಲೇಟ್‌ಗಳನ್ನು ಕಸ್ಟಮೈಜ್ ಮಾಡಿ
   - ಪರಿಸರ ವ್ಯತ್ಯಾಸವನ್ನು ಹೊಂದಿಸಿ

3. **ಸೂಕ್ಷ್ಮವಾಗಿ ಪರೀಕ್ಷಿಸಿ**
   - ಮೊದಲು ಡೆವಲಪ್‌ಮೆಂಟ್ ಪರಿಸರಕ್ಕೆ ನಿಯೋಜಿಸಿ
   - ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
   - ಸ್ಕೇಲಿಂಗ್ ಮತ್ತು ಪ್ರಸ್ತುತ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ

4. **ಭದ್ರತಾ ವಿಮರ್ಶೆ**
   - ಆಕ್ಸೆಸ್ ನಿಯಂತ್ರಣವನ್ನು ಪರಿಶೀಲಿಸಿ
   - ಸिक्रೆಟ್ಸ್ ನಿರ್ವಹಣೆ ಜಾರಿಗೆ ತರಲಿ
   - ನಿಗಾ ಮತ್ತು ಅಲೆರ್ಟ್ ಹಾಕಿ

## 📊 ಹೋಲಿಕೆಯ ಮ್ಯಾಟ್ರಿಕ್ಸ್

| ಉದಾಹರಣೆ | ಸೇವೆಗಳು | ಡೇಟಾಬೇಸ್ | ಪ್ರಾಮಾಣೀಕರಣ | ನಿಗಾ | ಸಂಕೀರ್ಣತೆ |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (ಸ್ಥಳೀಯ) | 2 | ❌ | Key Vault | ಸಂಪೂರ್ಣ | ⭐⭐ |
| **Python Flask API** (ಸ್ಥಳೀಯ) | 1 | ❌ | ಮೂಲಭೂತ | ಸಂಪೂರ್ಣ | ⭐ |
| **Microservices** (ಸ್ಥಳೀಯ) | 5+ | ✅ | ಎಂಟರ್‌ಪ್ರೈಸು | ಉನ್ನತ | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | ಮೂಲಭೂತ | ಮೂಲಭೂತ | ⭐ |
| React SPA + Functions | 3 | ✅ | ಮೂಲಭೂತ | ಸಂಪೂರ್ಣ | ⭐ |
| Python Flask Container | 2 | ❌ | ಮೂಲಭೂತ | ಸಂಪೂರ್ಣ | ⭐ |
| C# Web API + SQL | 2 | ✅ | ಸಂಪೂರ್ಣ | ಸಂಪೂರ್ಣ | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | ಸಂಪೂರ್ಣ | ಸಂಪೂರ್ಣ | ⭐⭐ |
| Java Microservices | 5+ | ✅ | ಸಂಪೂರ್ಣ | ಸಂಪೂರ್ಣ | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | ಸಂಪೂರ್ಣ | ಸಂಪೂರ್ಣ | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | ಮೂಲಭೂತ | ಸಂಪೂರ್ಣ | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | ಸಂಪೂರ್ಣ | ಸಂಪೂರ್ಣ | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (ಸ್ಥಳೀಯ) | **8+** | **✅** | **ಎಂಟರ್‌ಪ್ರೈಸು** | **ಉನ್ನತ** | **⭐⭐⭐⭐** |

## 🎓 ಕಲಿಕಾ ಮಾರ್ಗ

### ಶಿಫಾರಸು ಮಾಡಿದ ಕ್ರಮ

1. **ಸರಳ ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌ನಿಂದ ಪ್ರಾರಂಭಿಸಿ**
   - ಮೂಲ AZD ধারণೆಗಳನ್ನು ಕಲಿಯಿರಿ
   - ನಿಯೋಜನಾ ವರ್ಕ್‌ಫ್ಲೋ ಅನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
   - ಪರಿಸರ ನಿರ್ವಹಣೆಯನ್ನು ಅಭ್ಯಾಸ ಮಾಡಿ

2. **ಸ್ಥಿರ ವೆಬ್‌ಸೈಟ್ ಪ್ರಯತ್ನಿಸಿ**
   - ವಿವಿಧ ಹೋಸ್ಟಿಂಗ್ ಆಯ್ಕೆಗಳು ಅನ್ವೇಷಿಸಿ
   - CDN ಸಂಯೋಜನೆ ಬಗ್ಗೆ ತಿಳಿಯಿರಿ
   - DNS ಸಂರಚನೆಯನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ

3. **Container App ಕಡೆಗೆ ಮುಂದಿರಿ**
   - ಕಂಟೇನರೈಸೇಶನ್ ಮೂಲತತ್ವಗಳನ್ನು ಕಲಿಯಿರಿ
   - ಸ್ಕೇಲಿಂಗ್ ತತ್ವಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
   - Docker ಜೊತೆಗೆ ಅಭ್ಯಾಸ ಮಾಡಿ

4. **ಡೇಟಾಬೇಸ್ ಏಕೀಕರಣ ಸೇರಿಸಿ**
   - ಡೇಟಾಬೇಸ್ ಪ್ರೊವೀಜನಿಂಗ್ ಅನ್ನು ಕಲಿಯಿರಿ
   - ಸಂಪರ್ಕ ಸ್ಟ್ರಿಂಗ್‌ಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
   - ಸिक्रೆಟ್ಸ್ ನಿರ್ವಹಣೆಯನ್ನು ಅಭ್ಯಾಸ ಮಾಡಿ

5. **ಸರ್ವರ್‌ಲೆಸ್ ಅನ್ನು ಅನ್ವೇಷಿಸಿ**
   - ಇವೆಂಟ್-ಪ್ರೇರಿತ ವಾಸ್ತುಶಿಲ್ಪವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
   - ಟ್ರಿಗರ್‌ಗಳು ಮತ್ತು ಬಿಂಗ್‌ಗಳನ್ನು ತಿಳಿಯಿರಿ
   - APIಗಳೊಂದಿಗೆ ಅಭ್ಯಾಸ ಮಾಡಿ

6. **ಮೈಕ್ರೋಸರ್ವೀಸ್ ಅನ್ನು ನಿರ್ಮಿಸಿ**
   - ಸೇವಾ ಸಂವಹನವನ್ನು ಕಲಿಯಿರಿ
   - ವಿಂಗಡಿತ ವ್ಯವಸ್ಥೆಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
   - ಸಂಕೀರ್ಣ ನಿಯೋಜನೆಗಳೊಂದಿಗೆ ಅಭ್ಯಾಸ ಮಾಡಿ

## 🔍 ಸರಿಯಾದ ಉದಾಹರಣೆಯನ್ನು ಹುಡುಕು

### ತಂತ್ರಜ್ಞಾನ ಸ್ಟ್ಯಾಕ್ ಮೂಲಕ
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

### ವಾಸ್ತುಶಿಲ್ಪ ಮಾದರಿಯ ಮೂಲಕ
- **ಸರಳ REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **ಮೊನೋಲಿಥಿಕ್**: Node.js Express Todo, C# Web API + SQL
- **ಸ್ಟ್ಯಾಟಿಕ್ + ಸರ್ವರ್‌ಲೆಸ್**: React SPA + Functions, Python Functions + SPA
- **ಮೈಕ್ರೋಸರ್ವೀಸ್‌ಗಳು**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **ಕಂಟೈನರೈಜ್ಡ್**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-ಸಂಚಾಲಿತ**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **ಬಹು-ಏಜೆಂಟ್ ವಾಸ್ತುಶಿಲ್ಪ**: **Retail Multi-Agent Solution**
- **ಎಂಟರ್‌ಪ್ರೈಸು ಬಹು-ಸೇವಾ**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### ಸಂಕೀರ್ಣತೆ ಮಟ್ಟದ ಮೂಲಕ
- **ಆರಂಭಿಕ**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **ಮಧ್ಯಮ**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **ಉನ್ನತ**: ML Pipeline
- **ಎಂಟರ್‌ಪ್ರೈಸು ಉತ್ಪಾದನಾ-ಸಿದ್ಧ**: [Microservices (Local)](../../../examples/container-app/microservices) (ಮಲ್ಟಿ-ಸರ್ವಿಸ್ ಮೆಸೇಜ್ ಕ್ಯೂಯಿಂಗ್ ಒದಗಿಸುವ), **Retail Multi-Agent Solution** (ಸಂಪೂರ್ಣ ಬಹು-ಏಜೆಂಟ್ ವ್ಯವಸ್ಥೆ ARM ಟೆಂಪ್ಲೇಟ್ ನಿಯೋಜನೆಯೊಂದಿಗೆ)

## 📚 ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

### ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ಲಿಂಕ್‌ಗಳು
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### ಸಮುದಾಯ ಉದಾಹರಣೆಗಳು
- [Azure Samples AZD ಟೆಂಪ್ಲೇಟುಗಳು](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry ಟೆಂಪ್ಲೇಟುಗಳು](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI ಗ್ಯಾಲರಿ](https://azure.github.io/awesome-azd/)
- [C# ಮತ್ತು Azure SQL ಹೊಂದಿರುವ Todo ಅಪ್ಲಿಕೇಶನ್](https://github.com/Azure-Samples/todo-csharp-sql)
- [Python ಮತ್ತು MongoDB ಹೊಂದಿರುವ Todo ಅಪ್ಲಿಕೇಶನ್](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js ಮತ್ತು PostgreSQL ಹೊಂದಿರುವ Todo ಅಪ್ಲಿಕೇಶನ್](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API ಹೊಂದಿರುವ React ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps ಜಾಬ್](https://github.com/Azure-Samples/container-apps-jobs)
- [Java ಹೊಂದಿರುವ Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು
- [Azure ಉತ್ತಮ ವಿನ್ಯಾಸಿತ ಫ್ರೇಮ್ವರ್ಕ್](https://learn.microsoft.com/en-us/azure/well-architected/)
- [ಮೇಘ ಅಂಗೀಕಾರ ಫ್ರೇಮ್ವರ್ಕ್](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 ಉದಾಹರಣೆಗಳ ಕೊಡುಗೆ

ಹಂಚಿಕೊಳ್ಳಲು ಉಪಯುಕ್ತ ಉದಾಹರಣೆ ಇದೆಯೇ? ನಿಮ್ಮ ಕೊಡುಗೆಯನ್ನು ಸ್ವಾಗತಿಸುತ್ತೇವೆ!

### ಸಲ್ಲಿಸುವ ಮಾರ್ಗಸೂಚಿಗಳು
1. ನಿಗದಿಹೊಂದಿದ ಡೈರೆಕ್ಟರಿ ರಚನೆಗೆ ಅನುಸರಿಸಿ
2. ಸಂಪೂರ್ಣ README.md ಅನ್ನು ಸೇರಿಸಿ
3. ಕಾನ್ಫಿಗರೇಶನ್ ಫೈಲ್‌ಗಳಿಗೆ ಕಾಮೆಂಟ್‌ಗಳನ್ನು ಸೇರಿಸಿ
4. ಸಲ್ಲಿಸುವ ಮೊದಲು ಸಂಪೂರ್ಣವಾಗಿ ಪರೀಕ್ಷಿಸಿ
5. ವೆಚ್ಚದ ಅಂದಾಜುಗಳು ಮತ್ತು ಪೂರ್ವಶರತ್ತುಗಳನ್ನು ಸೇರಿಸಿ

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

**ಪ್ರೋ ಟಿಪ್**: ನಿಮ್ಮ ತಂತ್ರಜ್ಞಾನ ಸ್ಟಾಕ್‌ಗೆ ಹೊಂದಿಕೊಳ್ಳುವ ಅತಿ ಸರಳ ಉದಾಹರಣೆದಿಂದ ಪ್ರಾರಂಭಿಸಿ, ನಂತರ ಕ್ರಮೇಣ ಹೆಚ್ಚು ಜಟಿಲ ದೃಶ್ಯಾವಳಿಗಳ ಕಡೆಗೆ ಸಾಗಿಸಿ. ಪ್ರತಿಯೊಂದು ಉದಾಹರಣೆ ಹಿಂದಿನ ಉದಾಹರಣೆಗಳ ಕಲ್ಪನೆಗಳ ಮೇಲೆ ನಿರ್ಮಿತವಾಗಿದೆ!

## 🚀 ಪ್ರಾರಂಭಿಸಲು ಸಿದ್ಧವೇ?

### ನಿಮ್ಮ ಅಧ್ಯಯನ ಮಾರ್ಗ

1. **ಸಂಪೂರ್ಣ ಆರಂಭಿಕ?** → ಪ್ರಾರಂಭಿಸಿ [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 ನಿಮಿಷ)
2. **ಪ್ರಾಥಮಿಕ AZD ಜ್ಞಾನ ಇದೆಯೆ?** → ಪ್ರಯತ್ನಿಸಿ [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 ನಿಮಿಷ)
3. **AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ಕಟ್ಟುತ್ತಿದ್ದೀರಾ?** → ಪ್ರಾರಂಭಿಸಿ [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 ನಿಮಿಷ) ಅಥವಾ ಅನ್ವೇಷಿಸಿ [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ ಗಂಟೆಗಳು)
4. **ನಿಖರ ತಂತ್ರಜ್ಞಾನ ಸ್ಟಾಕ್ ಬೇಕೆ?** → ಮೇಲಿನ [ಸರಿಯಾದ ಉದಾಹರಣೆಯನ್ನು ಹುಡುಕುವುದು](#-finding-the-right-example) ವಿಭಾಗವನ್ನು ಬಳಸಿ

### ಮುಂದಿನ ಹಂತಗಳು

- ✅ ಮೇಲಿನ [ಆವಶ್ಯಕತೆಗಳು](#ಅಗತ್ಯಗಳು) ಪರಿಶೀಲಿಸಿ
- ✅ ನಿಮ್ಮ ಕೌಶಲ್ಯ ಮಟ್ಟಕ್ಕೆ ತಕ್ಕದು ಆದ ಉದಾಹರಣೆಯನ್ನು ಆರಿಸಿ (ನೋಡಿ [ಸಂಕೀರ್ಣತೆ ಲೆಜೆಂಡ್](#ಜಟಿಲತೆ-ಶ್ರೇಣಿ-ಸಾಹಿತ್ಯ))
- ✅ ನಿಯೋಜಿಸುವ ಮೊದಲು ಉದಾಹರಣೆಯ README ಅನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ಓದಿ
- ✅ ಪರೀಕ್ಷೆ ನಂತರ `azd down` ರನ್ ಮಾಡಲು ನೆನಪಿಸಿಕೊಳ್ಳುವಂತೆ ಸೆಟ್ ಮಾಡಿ
- ✅ GitHub Issues ಅಥವಾ Discussions ಮೂಲಕ ನಿಮ್ಮ ಅನುಭವವನ್ನು ಹಂಚಿಕೊಳ್ಳಿ

### ಸಹಾಯ ಬೇಕೆ?

- 📖 [FAQ](../resources/faq.md) - ಸಾಮಾನ್ಯ ಪ್ರಶ್ನೆಗಳಿಗೆ ಉತ್ತರಗಳು
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳನ್ನು ಸರಿಪಡಿಸಿ
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - ಸಮುದಾಯಕ್ಕೆ ಕೇಳಿ
- 📚 [Study Guide](../resources/study-guide.md) - ನಿಮ್ಮ ಕಲಿಕೆಯನ್ನು ಬಲಪಡಿಸಿ

---

**ನ್ಯಾವಿಗೇಶನ್**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../README.md)
- **📖 ಅಧ್ಯಯನ ಸಾಮಗ್ರಿಗಳು**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 ಸಂಪನ್ಮೂಲಗಳು**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*ಕೊನೆಯ ನವೀಕರಣ: ನವೆಂಬರ್ 2025 | [ಸಮಸ್ಯೆಗಳನ್ನು ವರದಿ ಮಾಡಿ](https://github.com/microsoft/AZD-for-beginners/issues) | [ಉದಾಹರಣೆಗಳನ್ನು ಕೊಡುಗೆ ನೀಡಿ](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ಈ ದಾಖಲೆವನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗೆ ಪ್ರಯತ್ನಿಸಿದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಮರ್ಥತೆಗಳಿರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿನ ಮೂಲ ದಾಖಲೆವನ್ನೇ ಪ್ರಾಧಿಕಾರಿತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಗೊಂದಲಗಳು ಅಥವಾ ದುರ್ವ್ಯಾಖ್ಯಾನಗಳಿಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
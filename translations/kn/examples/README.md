# ಉದಾಹರಣೆಗಳು - ಪ್ರಾಯೋಗಿಕ AZD ಟೆಂಪ್ಲೇಟ್ಗಳು ಮತ್ತು ಸಂರಚನೆಗಳು

**ಉದಾಹರಣೆಯಿಂದ ಕಲಿಯುವುದು - ಅಧ್ಯಾಯದ მიხედვით ಸಂಘಟಿತ**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD ಆರಂಭಿಕರಿಗೆ](../README.md)
- **📖 ಅಧ್ಯಾಯದ ನಕ್ಷೆ**: ಉದಾಹರಣೆಗಳು ಕಲಿಕೆಯ ಸಂಕೀರ್ಣತೆಯ ಪ್ರಕಾರ ಸಂಘಟಿಸಲ್ಪಟ್ಟಿವೆ
- **🚀 ಸ್ಥಳೀಯ ಉದಾಹರಣೆ**: [ರಿಟೇಲ್ ಮಲ್ಟಿ-ಏಜೆಂಟ್ ಪರಿಹಾರ](retail-scenario.md)
- **🤖 ಹೊರಗಿನ AI ಉದಾಹರಣೆಗಳು**: Azure Samples ರಿಪೊಸಿಟರಿಗಳ ಲಿಂಕ್‌ಗಳು

> **📍 ಪ್ರಮುಖ: ಸ್ಥಳೀಯ ಮತ್ತು ಹೊರಗಿನ ಉದಾಹರಣೆಗಳು**  
> ಈ ರೆಪೊಸಿಟರಿ ಸಂಪೂರ್ಣ ಜಾರಿಗೆ ಸಿದ್ಧವಾದ **4 ಸಂಪೂರ್ಣ ಸ್ಥಳೀಯ ಉದಾಹರಣೆಗಳನ್ನು** ಒಳಗೊಂಡಿದೆ:  
> - **Azure OpenAI Chat** (ಚಾಟ್ ಇಂಟರ್‌ಫೇಸ್‌ನೊಂದಿಗೆ GPT-4 ನಿಯೋಜನೆ)  
> - **Container Apps** (ಸರಳ Flask API + ಮೈಕ್ರೋಸರ್ವಿಸ್ಗಳು)  
> - **Database App** (ವೆಬ್ + SQL ಡೇಟಾಬೇಸ್)  
> - **Retail Multi-Agent** (ಎಂಟರ್‌ಪ್ರೈಸ್ AI ಪರಿಹಾರ)  
>  
> ಹೆಚ್ಚಿನ ಉದಾಹರಣೆಗಳು ನೀವು ಕ್ಲೋನ್ ಮಾಡಬಹುದಾದ Azure-Samples ರೆಪೊಸಿಟರಿಗಳ **ಹೊರಗಿನ ಉಲ್ಲೇಖಗಳು**.

## ಪರಿಚಯ

ಈ ಡೈರೆಕ್ಟರಿ ಬಳಕೆದಾರನ ಕೈಯಿಂದ ಅಭ್ಯಾಸದ ಮೂಲಕ Azure Developer CLI ಅನ್ನು ಕಲಿಯಲು ಸಹಾಯ ಮಾಡುವ ಪ್ರಾಯೋಗಿಕ ಉದಾಹರಣೆಗಳು ಮತ್ತು ಉಲ್ಲೇಖಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ. ರಿಟೇಲ್ ಮಲ್ಟಿ-ಏಜೆಂಟ್ ದೃಶ್ಯಾವಳಿ ಈ ರೆಪೊಸಿಟರಿಯಲ್ಲಿ ಒಳಗೊಂಡು ಪೂರ್ಣ, ಉತ್ಪಾದನೆ-ಸಿದ್ಧ ಜಾರಿಗೊಳಿಸುವಿಕೆಯನ್ನು ಹೊಂದಿದೆ. ಹೆಚ್ಚಿನ ಉದಾಹರಣೆಗಳು ವಿವಿಧ AZD ಮಾದರಿಗಳನ್ನು ತೋರಿಸುವ ಅಧಿಕೃತ Azure Samples ಗೆ ಉಲ್ಲೇಖಿಸುತ್ತವೆ.

### ಸಂಕೀರ್ಣತೆ ಶ್ರೇಣೀಕರಣದ ಮಾರ್ಗದರ್ಶಿ

- ⭐ **ಆರಂಭಿಕ** - ಮೂಲಭೂತ ಕಲ್ಪನೆಗಳು, ಒಂದು ಸೇವೆ, 15-30 ನಿಮಿಷ
- ⭐⭐ **ಮಧ್ಯಮ** - ಬಹುಸೇವೆಗಳು, ಡೇಟಾಬೇಸ್ ಏಕೀಕರಣ, 30-60 ನಿಮಿಷ
- ⭐⭐⭐ **ಉನ್ನತ** - ಸಂಕೀರ್ಣ ವಾಸ್ತುಶಿಲ್ಪ, AI ಏಕೀಕರಣ, 1-2 ಗಂಟೆ
- ⭐⭐⭐⭐ **ನಿಪುಣ** - ಉತ್ಪಾದನೆ-ಸಿದ್ಧ, ಎಂಟರ್‌ಪ್ರೈಸ್ ಮಾದರಿಗಳು, 2+ ಗಂಟೆಗಳು

## 🎯 ಈ ರೆಪೊಸಿಟರಿಯಲ್ಲಿ ವಾಸ್ತವವಾಗಿ ಏನಿದೆ

### ✅ ಸ್ಥಳೀಯ ಜಾರಿಗೊಳಿಸುವಿಕೆ (ಬಳಕೆಗೆ ಸಿದ್ಧ)

#### [Azure OpenAI ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್](azure-openai-chat/README.md) 🆕
**ಈ ರೆಪೊಸಿಟರಿಯಲ್ಲಿ ಚಾಟ್ ಇಂಟರ್‌ಫೇಸ್‌ನೊಂದಿಗೆ ಪೂರ್ಣ GPT-4 ನಿಯೋಜನೆ ಒಳಗೊಂಡಿದೆ**

- **ಸ್ಥಳ:** `examples/azure-openai-chat/`
- **ಸಂಕೀರ್ಣತೆ:** ⭐⭐ (ಮಧ್ಯಮ)
- **ಒಳಗೊಂಡಿದೆ:**
  - ಪೂರ್ಣ Azure OpenAI ನಿಯೋಜನೆ (GPT-4)
  - Python ಕಮಾಂಡ್-ಲೈನ್ ಚಾಟ್ ಇಂಟರ್‌ಫೇಸ್
  - ಸುರಕ್ಷಿತ API ಕೀಲಿಗಳಿಗಾಗಿ Key Vault ಏಕೀಕರಣ
  - Bicep ಮೂಲಸೌಕರ್ಯ ಟೆಂಪ್ಲೇಟ್ಗಳು
  - ಟೋಕನ್ ಬಳಕೆ ಮತ್ತು ವೆಚ್ಚ ಟ್ರ್ಯಾಕಿಂಗ್
  - ದರ ಮಿತಿಗೊಳಿಸುವಿಕೆ ಮತ್ತು ದೋಷ ನಿರ್ವಹಣೆ

ತ್ವರಿತ ಪ್ರಾರಂಭ:
```bash
# ಉದಾಹರಣೆಗೆ ಹೋಗಿ
cd examples/azure-openai-chat

# ಎಲ್ಲವನ್ನೂ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
azd up

# ಅವಲಂಬನೆಗಳನ್ನು ಸ್ಥಾಪಿಸಿ ಮತ್ತು ಚಾಟ್ ಪ್ರಾರಂಭಿಸಿ
pip install -r src/requirements.txt
python src/chat.py
```

**ತಂತ್ರಜ್ಞಾನಗಳು:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಉದಾಹರಣೆಗಳು](container-app/README.md) 🆕
**ಈ ರೆಪೊಸಿಟರಿಯಲ್ಲಿ ಸಮಗ್ರ ಕಂಟೈನರ್ ನಿಯೋಜನೆ ಉದಾಹರಣೆಗಳು ಒಳಗೊಂಡಿವೆ**

- **ಸ್ಥಳ:** `examples/container-app/`
- **ಸಂಕೀರ್ಣತೆ:** ⭐-⭐⭐⭐⭐ (ಆರಂಭಿಕದಿಂದ ಉನ್ನತದವರೆಗೆ)
- **ಒಳಗೊಂಡಿದೆ:**
  - [ಮುಖ್ಯ ಮಾರ್ಗದರ್ಶಿ](container-app/README.md) - ಕಂಟೈನರ್ ನಿಯೋಜನೆಗಳ ಸಂಪೂರ್ಣ ಅವಲೋಕನ
  - [ಸರಳ Flask API](../../../examples/container-app/simple-flask-api) - ಮೂಲಭೂತ REST API ಉದಾಹರಣೆ
  - [ಮೈಕ್ರೋಸರ್ವಿಸಸ್ ವಾಸ್ತುಶಿಲ್ಪ](../../../examples/container-app/microservices) - ಉತ್ಪಾದನೆ-ಸిద్ధ ಬಹು-ಸೇವೆಯ ನಿಯೋಜನೆ
  - ತ್ವರಿತ ಪ್ರಾರಂಭ, ಉತ್ಪಾದನೆ, ಮತ್ತು ಉನ್ನತ ಮಾದರಿಗಳು
  - ಮಾನಿಟರಿಂಗ್, ಭದ್ರತೆ ಮತ್ತು ವೆಚ್ಚ ಆಪ್ಟಿಮೈಸೇಶನ್

ತ್ವರಿತ ಪ್ರಾರಂಭ:
```bash
# ಮಾಸ್ಟರ್ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ವೀಕ್ಷಿಸಿ
cd examples/container-app

# ಸರಳ Flask API ಅನ್ನು ನಿಯೋಜಿಸಿ
cd simple-flask-api
azd up

# ಮೈಕ್ರೋಸೇವೆಗಳ ಉದಾಹರಣೆಯನ್ನು ನಿಯೋಜಿಸಿ
cd ../microservices
azd up
```

**ತಂತ್ರಜ್ಞಾನಗಳು:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [ರಿಟೇಲ್ ಮಲ್ಟಿ-ಏಜೆಂಟ್ ಪರಿಹಾರ](retail-scenario.md) 🆕
**ಈ ರೆಪೊಸಿಟರಿಯಲ್ಲಿ ಪೂರ್ಣ ಉತ್ಪಾದನೆ-ಸಿದ್ಧ ಜಾರಿಗೊಳಿಸುವಿಕೆ ಒಳಗೊಂಡಿದೆ**

- **ಸ್ಥಳ:** `examples/retail-multiagent-arm-template/`
- **ಸಂಕೀರ್ಣತೆ:** ⭐⭐⭐⭐ (ಉನ್ನತ)
- **ಒಳಗೊಂಡಿದೆ:**
  - ಪೂರ್ಣ ARM ನಿಯೋಜನೆ ಟೆಂಪ್ಲೇಟು
  - ಮಲ್ಟಿ-ಏಜೆಂಟ್ ವಾಸ್ತುಶಿಲ್ಪ (ಗ್ರಾಹಕ + ಇನ್ವೆಂಟರಿ)
  - Azure OpenAI ಏಕೀಕರಣ
  - RAG ಬಳಸುವ AI ಶೋಧನೆ
  - ವಿಸ್ತೃತ ಮಾನಿಟರಿಂಗ್
  - ಒನ್-ಕ್ಲಿಕ್ ನಿಯೋಜನೆ ಸ್ಕ್ರಿಪ್ಟ್

**ತ್ವರಿತ ಪ್ರಾರಂಭ:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**ತಂತ್ರಜ್ಞಾನಗಳು:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 ಹೊರಗಿನ Azure Samples (ಬಳಕೆಗಾಗಿ ಕ್ಲೋನ್ ಮಾಡಿ)

ಕೆಳಗಿನ ಉದಾಹರಣೆಗಳು ಅಧಿಕೃತ Azure-Samples ರೆಪೊಸಿಟರಿಗಳಲ್ಲಿ ನಿರ್ವಹಿಸಲ್ಪಡುತ್ತವೆ. ವಿಭಿನ್ನ AZD ಮಾದರಿಗಳನ್ನು ಅನ್ವೇಷಿಸಲು ಅವನ್ನು ಕ್ಲೋನ್ ಮಾಡಿ:

### ಸರಳ ಅಪ್ಲಿಕೇಶನ್‍ಗಳು (ಅಧ್ಯಾಯಗಳು 1-2)

| ಟೆಂಪ್ಲೇಟು | ರೆಪೊಸಿಟರಿ | ಸಂಕೀರ್ಣತೆ | ಸೇವೆಗಳು |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [ಸ್ಥಳೀಯ: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **ಮೈಕ್ರೋಸರ್ವಿಸಸ್** | [ಸ್ಥಳೀಯ: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | ಬಹು-ಸೇವೆಗಳು, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

ಹೇಗೆ ಬಳಸುವುದು:
```bash
# ಯಾವುದೇ ಉದಾಹರಣೆಯನ್ನು ಕ್ಲೋನ್ ಮಾಡಿ
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
azd up
```

### AI ಅಪ್ಲಿಕೇಶನ್ ಉದಾಹರಣೆಗಳು (ಅಧ್ಯಾಯಗಳು 2, 5, 8)

| ಟೆಂಪ್ಲೇಟು | ರೆಪೊಸಿಟರಿ | ಸಂಕೀರ್ಣತೆ | ಒತ್ತು |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI ಚಾಟ್** | [ಸ್ಥಳೀಯ: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 ನಿಯೋಜನೆ |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | ಮೂಲ AI ಚಾಟ್ |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | ಏಜೆಂಟ್ ಫ್ರೇಮ್ವರ್ಕ್ |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG ಮಾದರಿ |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | ಎಂಟರ್‌ಪ್ರೈಸ್ AI |

### ಡೇಟಾಬೇಸ್ ಮತ್ತು ಉನ್ನತ ಮಾದರಿಗಳು (ಅಧ್ಯಾಯಗಳು 3-8)

| ಟೆಂಪ್ಲೇಟು | ರೆಪೊಸಿಟರಿ | ಸಂಕೀರ್ಣತೆ | ಒದ್ದು |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | ಡೇಟಾಬೇಸ್ ಏಕೀಕರಣ |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL ಸರ್ವರ್‌ಲೆಸ್ |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | ಬಹು-ಸೇವೆ |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## ಕಲಿಕೆಯ ಗುರಿಗಳು

- ವಾಸ್ತವಿಕ ಅಪ್ಲಿಕೇಶನ್ ದೃಶ್ಯಾವಳಿಗಳೊಂದಿಗೆ Azure Developer CLI ಕಾರ್ಯಪ್ರವಾಹಗಳನ್ನು ಅಭ್ಯಾಸ ಮಾಡಿ
- ವಿವಿಧ ಅಪ್ಲಿಕೇಶನ್ ವಾಸ್ತುಶಿಲ್ಪಗಳನ್ನು ಮತ್ತು ಅವರ azd ಜಾರಿಗೊಳಿಸುವಿಕೆಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
- ವಿವಿಧ Azure ಸೇವೆಗಳಿಗೆ Infrastructure as Code ಮಾದರಿಗಳಲ್ಲಿ ಪರಿಣತಿ ಗಳಿಸಿ
- ಸಂರಚನಾ ನಿರ್ವಹಣೆ ಮತ್ತು ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ನಿಯೋಜನೆ ತಂತ್ರಗಳನ್ನು ಅನ್ವಯಿಸಿ
- ಪ್ರಾಯೋಗಿಕ ಸಂದರ್ಭಗಳಲ್ಲಿ ಮಾನಿಟರಿಂಗ್, ಭದ್ರತೆ ಮತ್ತು ಸ್ಕೇಲಿಂಗ್ ಮಾದರಿಗಳನ್ನು ಜಾರಿಗೊಳಿಸಿ
- ನೈಜ ನಿಯೋಜನೆ ದೃಶ್ಯಾವಳಿಗಳಲ್ಲಿ ತೊಂದರೆ ಪರಿಹಾರ ಮತ್ತು ಡಿಬಗ್ ಮಾಡುವ ಅನುಭವವನ್ನು ನಿರ್ಮಿಸಿ

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ನೀವು ಈ ಉದಾಹರಣೆಗಳನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು ಸಾಮರ್ಥ್ಯವನ್ನು ಹೊಂದಿರುತ್ತೀರಿ:
- Azure Developer CLI ಬಳಸಿ müxtəlif ಅಪ್ಲಿಕೇಶನ್ ಪ್ರಕಾರಗಳನ್ನು ಆತ್ಮವಿಶ್ವಾಸದಿಂದ ನಿಯೋಜಿಸಬಹುದು
- ನೀಡಲಾದ ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ನಿಮ್ಮ ಸ್ವಂತ ಅಪ್ಲಿಕೇಶನ್ ಅಗತ್ಯಗಳಿಗೆ ಹೊಂದಿಸಿ
- Bicep ಬಳಸಿ ಕಸ್ಟಮ್ ಮೂಲಸೌகர್ಯ ಮಾದರಿಗಳನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸಿ ಮತ್ತು ಜಾರಿಗೊಳಿಸಿ
- ಸೂಕ್ತ ಅವಲಂಬನೆಗಳೊಂದಿಗೆ ಸಂಕೀರ್ಣ ಬಹು-ಸೇವೆ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ಸಂರಚಿಸಿ
- ನೈಜ ದೃಶ್ಯಾವಳಿಗಳಲ್ಲಿ ಭದ್ರತೆ, ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಕಾರ್ಯಕ್ಷಮತಾ ಉತ್ತಮ ನಿಯಮಗಳನ್ನು ಅನ್ವಯಿಸಿ
- ಪ್ರಾಯೋಗಿಕ ಅನುಭವಕ್ಕೆ ಆಧಾರವಾಗಿ ನಿಯೋಜನೆಗಳನ್ನು ತೊಂದರೆ ಪರಿಹಾರ ಮಾಡಿ ಮತ್ತು ಆಪ್ಟಿಮೈಜ್ ಮಾಡಿ

## ಡೈರೆಕ್ಟরি ರಚನೆ

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

> **💡 AZD ಹೊಸದಿದ್ದರೆ?** ಉದಾಹರಣೆ #1 (Flask API) ನಿಂದ ಪ್ರಾರಂಭಿಸಿ - ಇದು ~20 ನಿಮಿಷ ತೆಗೆದುಕೊಳ್ಳುತ್ತದೆ ಮತ್ತು ಮೂಲ ಕಲ್ಪನೆಗಳನ್ನು ಕಲಿಸುತ್ತದೆ.

### ಆರಂಭಿಕರಿಗಾಗಿ
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (ಸ್ಥಳೀಯ) ⭐  
   ಸ್ಕೇಲ್-ಟು-ಝೀರೋ ಸಹಿತ ಸರಳ REST API ನಿಯೋಜಿಸಿ  
   **ಸಮಯ:** 20-25 ನಿಮಿಷಗಳು | **ವೆಚ್ಚ:** $0-5/ತಿಂಗಳು  
   **ನೀವು ಕಲಿಯುವಿರಿ:** ಮೂಲ azd ಕಾರ್ಯಪ್ರವಾಹ, ಕಂಟೈನರೈಜೆಶನ್, ಆರೋಗ್ಯ ಪರಿಶೀಲನೆಗಳು  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ಮಾನಿಟರಿಂಗ್‌ ಜೋಡಿಸಲಾಗಿರುವ ಮತ್ತು "Hello, World!" ಅನ್ನು ಹಿಂತಿರುಗಿಸುವ ಕಾರ್ಯನಿರ್ವಹಿಸುವ API ಎಂಡ್‌ಪಾಯಿಂಟ್

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB ಸಹಿತ Node.js Express ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ  
   **ಸಮಯ:** 25-35 ನಿಮಿಷಗಳು | **ವೆಚ್ಚ:** $10-30/ತಿಂಗಳು  
   **ನೀವು ಕಲಿಯುವಿರಿ:** ಡೇಟಾಬೇಸ್ ಏಕೀಕರಣ, ಪರಿಸರ ವ್ಯತ್ಯಯಗಳು, ಕನೆಕ್ಷನ್ ಸ್ಟ್ರಿಂಗ್‌ಗಳು  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ಸೃಷ್ಟಿ/ಓದು/ಅಪ್‌ಡೇಟ್/ಮಾಳ್ವಾರಿ ಕಾರ್ಯಕ್ಷಮತೆ ಹೊಂದಿರುವ Todo ಲಿಸ್ಟ್ ಅಪ್ಲಿಕೇಶನ್

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps ಬಳಸಿ React ಸ್ಥಿರ ವೆಬ್‌ಸೈಟ್ ಅನ್ನು ಹೋಸ್ಟ್ ಮಾಡಿ  
   **ಸಮಯ:** 20-30 ನಿಮಿಷಗಳು | **ವೆಚ್ಚ:** $0-10/ತಿಂಗಳು  
   **ನೀವು ಕಲಿಯುವಿರಿ:** ಸ್ಥಿರ ಹೋಸ್ಟಿಂಗ್, ಸರ್ವರ್‌ಲೆಸ್ ಫಂಕ್ಷನ್ಗಳು, CDN ನಿಯೋಜನೆ  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** API ಬ್ಯಾಕೆಂಡ್ನೊಂದಿಗೆ React UI, ಸ್ವಯಂಚಾಲಿತ SSL, ಜಾಗತಿಕ CDN

### ಮಧ್ಯಮ ಮಟ್ಟದ ಬಳಕೆದಾರರಿಗೆ
4. **[Azure OpenAI ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್](../../../examples/azure-openai-chat)** (ಸ್ಥಳೀಯ) ⭐⭐  
   ಚಾಟ್ ಇಂಟರ್‌ಫೇಸ್ ಮತ್ತು ಸುರಕ್ಷಿತ API ಕೀ ನಿರ್ವಹಣೆಯೊಂದಿಗೆ GPT-4 ನಿಯೋಜಿಸಿ  
   **ಸಮಯ:** 35-45 ನಿಮಿಷಗಳು | **ವೆಚ್ಚ:** $50-200/ತಿಂಗಳು  
   **ನೀವು ಕಲಿಯುವಿರಿ:** Azure OpenAI ನಿಯೋಜನೆ, Key Vault ಏಕೀಕರಣ, ಟೋಕನ್ ಟ್ರ್ಯಾಕಿಂಗ್  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** GPT-4 ಸಹಿತ ಕಾರ್ಯನಿರ್ವಹಿಸುವ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ ಮತ್ತು ವೆಚ್ಚ ಮಾನಿಟರಿಂಗ್

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (ಸ್ಥಳೀಯ) ⭐⭐⭐⭐  
   ಉತ್ಪಾದನೆ-ಸಿದ್ಧ ಬಹು-ಸೇವೆ ವಾಸ್ತುಶಿಲ್ಪ  
   **ಸಮಯ:** 45-60 ನಿಮಿಷಗಳು | **ವೆಚ್ಚ:** $50-150/ತಿಂಗಳು  
   **ನೀವು ಕಲಿಯುವಿರಿ:** ಸೇವೆ ಸಂವಹನ, ಮೆಸೇಜ್ ಕ್ಯೂಯಿಂಗ್, ವಿತರಿತ ಟ್ರೇಸಿಂಗ್  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ಮಾನಿಟರಿಂಗ್ ಜೊತೆಗೆ 2-ಸೇವೆಗಳ ವ್ಯವಸ್ಥೆ (API ಗೇಟವೇ + ಉತ್ಪನ್ನ ಸೇವೆ)

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API ಮತ್ತು Azure SQL ಡೇಟಾಬೇಸ್ ಹೊಂದಿರುವ ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್  
   **ಸಮಯ:** 30-45 ನಿಮಿಷಗಳು | **ವೆಚ್ಚ:** $20-80/ತಿಂಗಳು  
   **ನೀವು ಕಲಿಯುವಿರಿ:** Entity Framework, ಡೇಟಾಬೇಸ್ ಮೈಗ್ರೇಷನ್ಗಳು, ಕನೆಕ್ಷನ್ ಭದ್ರತೆ  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** Azure SQL ಬ್ಯಾಕೆಂಡ್ನೊಂದಿಗೆ C# API, ಸ್ವಯಂಚಾಲಿತ ಸ್ಕೀಮಾ ನಿಯೋಜನೆ

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ಟ್ರಿಗರ್‌ಗಳೊಂದಿಗೆ Python Azure Functions ಮತ್ತು Cosmos DB  
   **ಸಮಯ:** 30-40 ನಿಮಿಷಗಳು | **ವೆಚ್ಚ:** $10-40/ತಿಂಗಳು  
   **ನೀವು ಕಲಿಯುವಿರಿ:** ಇವೆಂಟ್-ನಿರ್ವಾಹಿತ ವಾಸ್ತುಶಿಲ್ಪ, ಸರ್ವರ್‌ಲೆಸ್ ಸ್ಕೇಲಿಂಗ್, NoSQL ಏಕೀಕರಣ  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** HTTP ವಿನಂತಿಗಳಿಗೆ ಪ್ರತಿಕ್ರಿಯಿಸುವ ಮತ್ತು Cosmos DB ಸಂಗ್ರಹಣೆಯನ್ನು ಬಳಸುವ ಫಂಕ್ಷನ್ ಅಪ್

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps ಮತ್ತು API ಗೇಟವೇ ಹೊಂದಿರುವ ಬಹು-ಸೇವೆ Java ಅಪ್ಲಿಕೇಶನ್  
   **ಸಮಯ:** 60-90 ನಿಮಿಷಗಳು | **ವೆಚ್ಚ:** $80-200/ತಿಂಗಳು  
   **ನೀವು ಕಲಿಯುವಿರಿ:** Spring Boot ನಿಯೋಜನೆ, ಸೇವೆ ಮೆಶ್, ಲೋಡ್ ಬ್ಯಾಲನ್ಸಿಂಗ್  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ಸೇವೆ ಕಂಡುಹಿಡಿಯುವಿಕೆ ಮತ್ತು ರೌಟಿಂಗ್ ಹೊಂದಿರುವ ಬಹು-ಸೇವೆ Java ವ್ಯವಸ್ಥೆ

### Microsoft Foundry ಟೆಂಪ್ಲೇಟ್ಗಳು

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   ಚಾಟ್ ಇಂಟರ್‌ಫೇಸ್‌ನೊಂದಿಗೆ ಪೂರ್ಣ GPT-4 ನಿಯೋಜನೆ  
   **ಸಮಯ:** 35-45 ನಿಮಿಷಗಳು | **ವೆಚ್ಚ:** $50-200/ತಿಂಗಳು  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ಟೋಕನ್ ಟ್ರ್ಯಾಕಿಂಗ್ ಮತ್ತು ವೆಚ್ಚ ಮಾನಿಟರಿಂಗ್ ಹೊಂದಿರುವ ಕಾರ್ಯನಿರ್ವಹಿಸುವ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG ವಾಸ್ತುಶಿಲ್ಪದೊಂದಿಗೆ ಬುದ್ಧಿಮತ್ತೆಯಿಂದ ನಡೆಸುವ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್  
   **ಸಮಯ:** 60-90 ನಿಮಿಷಗಳು | **ವೆಚ್ಚ:** $100-300/ತಿಂಗಳು  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ಡಾಕ್ಯುಮೆಂಟ್ ಶೋಧನೆ ಮತ್ತು ಉಲ್ಲೇಖಗಳೊಂದಿಗೆ RAG ಚಾಲಿತ ಚಾಟ್ ಇಂಟರ್‌ಫೇಸ್

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI ಸೇವೆಗಳ ಬಳಕೆ ಮೂಲಕ ಡಾಕ್ಯುಮೆಂಟ್ ವಿಶ್ಲೇಷಣೆ  
   **ಸಮಯ:** 40-60 ನಿಮಿಷಗಳು | **ವೆಚ್ಚ:** $20-80/ತಿಂಗಳು  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ಅಪ್ಲೋಡ್ ಮಾಡಿದ ಡಾಕ್ಯುಮೆಂಟ್‌ಗಳಿಂದ ಪಠ್ಯ, ಟೇಬಲ್ಗಳು ಮತ್ತು_ENTITY_ಗಳನ್ನು ಹೊರತೆಗೆಯುವ API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning ಜೊತೆಗೆ MLOps ಕಾರ್ಯಪ್ರವಾಹ  
   **ಸಮಯ:** 2-3 ಗಂಟೆಗಳು | **ವೆಚ್ಚ:** $150-500/ತಿಂಗಳು  
   **ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:** ತರಬೇತಿ, ನಿಯೋಜನೆ ಮತ್ತು ಮಾನಿಟರಿಂಗ್ ಹೊಂದಿರುವ ಸ್ವಯಂಚಾಲಿತ ML ಪೈಪ್‌ಲೈನ್

### ವಾಸ್ತವೈಕ ದೃಶ್ಯಾವಳಿಗಳು

#### **ರಿಟೇಲ್ ಮಲ್ಟಿ-ಏಜೆಂಟ್ ಪರಿಹಾರ** 🆕
**[ಪೂರ್ಣ ಜಾರಿಗೊಳಿಸುವಿಕೆ ಮಾರ್ಗದರ್ಶಿ](./retail-scenario.md)**

ಉತ್ಪಾದನೆ-ಸಿದ್ಧ, ವಿಸ್ತೃತ ಮಲ್ಟಿ-ಏಜೆಂಟ್ ಗ್ರಾಹಕ ಬೆಂಬಲ ಪರಿಹಾರವು ಇದು AZD ಬಳಸಿ ಎಂಟರ್‌ಪ್ರೈಸ್-ಗುಣಮಟ್ಟದ AI ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆಯನ್ನು ಪ್ರದರ್ಶಿಸುತ್ತದೆ. ಈ ದೃಶ್ಯಾವಳಿ ನೀಡುತ್ತದೆ:

- **ಪೂರ್ಣ ವಾಸ್ತುಶಿಲ್ಪ**: ವಿಶೇಷ ಗ್ರಾಹಕ ಸೇವೆ ಮತ್ತು ಇನ್ವೆಂಟರಿ ನಿರ್ವಹಣಾ ಏಜೆಂಟ್‌ಗಳೊಂದಿಗೆ ಮಲ್ಟಿ-ಏಜೆಂಟ್ ಸಿಸ್ಟಮ್
- **ಉತ್ಪಾದನಾ ಮೂಲಸೌಕರ್ಯ**: ಬಹು-ಪ್ರದೇಶದ Azure OpenAI ನಿಯೋಜನೆಗಳು, AI Search, Container Apps, ಮತ್ತು ಸಮಗ್ರ ಮಾನಿಟರಿಂಗ್
- **ನಿಯೋಜನಕ್ಕೆ ಸಿದ್ಧ ARM Template**: ಒಂದು ಕ್ಲಿಕ್ ನಿಯೋಜನೆ ದೊಡ್ಡ ಕಾನ್ಫಿಗರೇಶನ್ ಮೋಡ್‌ಗಳೊಂದಿಗೆ (Minimal/Standard/Premium)
- **ಅಧುನಿಕ ವೈಶಿಷ್ಟ್ಯಗಳು**: ರೆಡ್-ಟೀಮಿಂಗ್ ಭದ್ರತಾ ಪರಿಶೀಲನೆ, ಏಜೆಂಟ್ ಮೌಲ್ಯಾಂಕನ ಫ್ರೇಮ್‌ವರ್ಕ್, ವೆಚ್ಚದ ಪ್ರಭಾವೋತ್ತಮಗೊಳಿಸುವಿಕೆ, ಮತ್ತು ಸಮಸ್ಯೆ ಪರಿಹಾರ ಮಾರ್ಗದರ್ಶಿಗಳು
- **ವಾಸ್ತವಿಕ ವ್ಯವಹಾರ ಸಂಬಂಧ**: ಫೈಲ್ ಅಪ್ಲೋಡ್‌ಗಳು, ಹುಡುಕಾಟ ಸಂಯೋಜನೆ, ಮತ್ತು ಡೈನಾಮಿಕ್ ಸ್ಕೇಲಿಂಗ್ ಜೊತೆಗೆ ರಿಟೈಲರ್ ಗ್ರಾಹಕ ಬೆಂಬಲ ಬಳಕೆದೃಶ್ಯ

**ಸಾಂಸ್ಕೃತಿಕತೆಗಳು**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**ಸಂಕೀರ್ಣತೆ**: ⭐⭐⭐⭐ (ಅಡ್ವಾನ್ಸ್ಡ್ - ಎಂಟರ್‌ಪ್ರೈಸ್ ಉತ್ಪಾದನೆಗೆ ಸಿದ್ಧ)

**ಉತ್ತಮವು**: AI ಡೆವಲಪರ್‌ಗಳು, ಸೊಲ್ಯೂಶನ್ ಆರ್ಕಿಟೆಕ್ಟ್ಸ್, ಮತ್ತು ಉತ್ಪಾದನಾ ಬಹು-ಏಜೆಂಟ್ ವ್ಯವಸ್ಥೆಗಳನ್ನು ನಿರ್ಮಿಸುವ ತಂಡಗಳು

**ತ್ವರಿತ ಪ್ರಾರಂಭ**: ಹೊಂದಿಕೆಗೊಂಡ ARM ಟೆಂಪ್ಲೇಟ್ ಬಳಸಿ `./deploy.sh -g myResourceGroup` ಮೂಲಕ ಸಂಪೂರ್ಣ ಪರಿಹಾರವನ್ನು 30 ನಿಮಿಷಕ್ಕಿಂತ ಕಡಿಮೆ ಸಮಯದಲ್ಲಿ ನಿಯೋಜಿಸಿ

## 📋 ಬಳಕೆ ಸೂಚನೆಗಳು

### ಅಗತ್ಯವಿರುವವು

ಯಾವುದೇ ಉದಾಹರಣೆಯನ್ನು ಓಡಿಸುವ ಮೊದಲು:
- ✅ ಒನರ್ ಅಥವಾ ಕೊನ್ರಿಬ್ಯೂಟರ್ ಪ್ರವೇಶ ಇರುವ Azure ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್
- ✅ Azure Developer CLI ಇನ್‌ಸ್ಟಾಲ್ ಆಗಿರುವುದು ([ಇನ್‌ಸ್ಟಾಲೇಶನ್ ಮಾರ್ಗದರ್ಶಿ](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop ರನ್ ಆಗುತ್ತಿದ್ದಂತೆ (ಕಂಟೈನರ್ ಉದಾಹರಣೆಗಳಿಗಾಗಿ)
- ✅ ಸೂಕ್ತ Azure ಕ್ವೋಟಾಗಳು (ಉದಾಹರಣೆ-ವಿಶೇಷ ಅಗತ್ಯಗಳನ್ನು ಪರಿಶೀಲಿಸಿ)

> **💰 ವೆಚ್ಚ ಎಚ್ಚರಿಕೆ:** ಎಲ್ಲಾ ಉದಾಹರಣೆಗಳು ನಿಜವಾದ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸೃಷ್ಟಿಸುತ್ತವೆ ಮತ್ತು ಶುಲ್ಕಗಳಾದರಿಸುತ್ತದೆ. ವೆಚ್ಚದ ಅಂದಾಜುಗಳಿಗಾಗಿ ಪ್ರತ್ಯೇಕ README ಕಡತಗಳನ್ನು ನೋಡಿ. ನಿರಂತರ ಶುಲ್ಕಗಳು ತಪ್ಪಿಸಲು ಕೆಲಸ ಮುಗಿದ ನಂತರ `azd down` ಅನ್ನು ರನ್ ಮಾಡಲು ನೆನಪಿಡಿ.

### ಉದಾಹರಣೆಗಳನ್ನು ಸ್ಥಳೀಯವಾಗಿ ಓಡಿಸುವುದು

1. **ಉದಾಹರಣೆಯನ್ನು ಕ್ಲೋನ್ ಅಥವಾ ನಕಲಿಸಿ**
   ```bash
   # ಬಯಸಿದ ಉದಾಹರಣೆಗೆ ನವಿಗೇಟ್ ಮಾಡಿ
   cd examples/simple-web-app
   ```

2. **AZD ಪರಿಸರವನ್ನು ಪ್ರಾರಂಭಿಸಿ**
   ```bash
   # ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಟೆಂಪ್ಲೇಟಿನಿಂದ ಪ್ರಾರಂಭಿಸಿ
   azd init
   
   # ಅಥವಾ ಹೊಸ ಪರಿಸರವನ್ನು ರಚಿಸಿ
   azd env new my-environment
   ```

3. **ಪರಿಸರವನ್ನು ಸಂರಚಿಸಿ**
   ```bash
   # ಅಗತ್ಯ ಚರಗಳನ್ನು ಹೊಂದಿಸಿ
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
   # ಸೇವಾ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪಡೆಯಿರಿ
   azd env get-values
   
   # ಎಂಡ್‌ಪಾಯಿಂಟ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ (ಉದಾಹರಣೆ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **ನಿರೀಕ್ಷಿತ ಯಶಸ್ಸಿನ ಸೂಚಕಗಳು:**
   - ✅ `azd up` ದೋಷವಿಲ್ಲದೆ ಪೂರ್ಣಗೊಳ್ಳಬೇಕು
   - ✅ ಸೇವೆ ಎಂಡ್‌ಪಾಯಿಂಟ್ HTTP 200 ವನ್ನು 반환ಿಸಬೇಕು
   - ✅ Azure ಪೋರ್ಟಲ್ "Running" ಸ್ಥಿತಿಯನ್ನು ತೋರಿಸಬೇಕು
   - ✅ Application Insights ಟೆಲಿಮೆಟ್ರಿಯನ್ನು ಸ್ವీకರಿಸುತ್ತಿರುವುದು

> **⚠️ ಸಮಸ್ಯೆಗಳಿವೆಯಾ?** ನಿಯೋಜನೆ ಸಮಸ್ಯೆ ಪರಿಹಾರದಿಗಾಗಿ [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು](../docs/chapter-07-troubleshooting/common-issues.md) ನೋಡಿ

### ಉದಾಹರಣೆಗಳನ್ನು ಹೊಂದಿಸುವುದು

ಪ್ರತಿ ಉದಾಹರಣೆಯಲ್ಲಿ ಒಳಗೊಂಡಿರುತ್ತವೆ:
- **README.md** - ವಿವರವಾದ ಸೆಟ್‌ಅಪ್ ಮತ್ತು ಕಸ್ಟಮೈಜೆಷನ್ ಸೂಚನೆಗಳು
- **azure.yaml** - ಕಾಮೆಂಟ್‌ಗಳೊಂದಿಗೆ AZD ಕಾನ್ಫಿಗರೇಷನ್
- **infra/** - ಪ್ಯಾರಾಮಿಟರ್ ವಿವರಣೆಗಳೊಂದಿಗೆ Bicep ಟೆಂಪ್ಲೇಟುಗಳು
- **src/** - ಸ್ಯಾಂಪಲ್ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್
- **scripts/** - ಸಾಮಾನ್ಯ ಕಾರ್ಯಗಳಿಗಾಗಿ ಸಹಾಯಕ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು

## 🎯 ಕಲಿಕಾ ಉದ್ದೇಶಗಳು

### ಉದಾಹರಣೆ ವರ್ಗಗಳು

#### **ಮೂಲ ನಿಯೋಜನೆಗಳು**
- ಏಕ-ಸೇವಾ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು
- ಸರಳ ಮೂಲಸೌಕರ್ಯ ಮಾದರಿಗಳು
- ಮೂಲ ಕಾನ್ಫಿಗರೇಶನ್ ನಿರ್ವಹಣೆ
- ವೆಚ್ಚ-ಪ್ರಭಾವಿ ಡೆವಲಪ್‌ಮೆಂಟ್ ಸೆಟ್‌ಅಪ್‌ಗಳು

#### **ಅಧುನಿಕ ಸಂದರ್ಭಗಳು**
- ಬಹು-ಸೇವಾ ವಾಸ್ತುಶಿಲ್ಪಗಳು
- ಜಟಿಲ ನೆಟ್ವರ್ಕಿಂಗ್ ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳು
- ಡೇಟಾಬೇಸ್ ಇಂಟಿಗ್ರೇಶನ್ ಮಾದರಿಗಳು
- ಭದ್ರತೆ ಮತ್ತು ಪಾಲನಾ ಅನುಷ್ಠಾನಗಳು

#### **ಉತ್ಪಾದನೆಗೆ ಸಿದ್ಧ ಮಾದರಿಗಳು**
- ಹೆಚ್ಚಿನ ಲಭ್ಯತೆ ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳು
- ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಅವಲೋಕನ
- CI/CD ಸಂಯೋಜನೆ
- ವಿಪತ್ತು ಮರುನಿರ್ಮಾಣ ಸಂಯೋಜನೆ

## 📖 ಉದಾಹರಣೆ ವಿವರಣೆಗಳು

### Simple Web App - Node.js Express
**ಸಾಂಸ್ಕೃತಿಕತೆಗಳು**: Node.js, Express, MongoDB, Container Apps  
**ಜಟಿಲತೆ**: ಪ್ರಾರಂಭಿಕ  
**ಕಲ್ಪನೆಗಳು**: ಮೂಲ ನಿಯೋಜನೆ, REST API, NoSQL ಡೇಟಾಬೇಸ್ ಸಮಾವೇಶ

### Static Website - React SPA
**ಸಾಂಸ್ಕೃತಿಕತೆಗಳು**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**ಜಟಿಲತೆ**: ಪ್ರಾರಂಭಿಕ  
**ಕಲ್ಪನೆಗಳು**: ಸ್ಥಿರ ಹೋಸ್ಟಿಂಗ್, ಸರ್ವರ್‌ಲೆಸ್ ಬ್ಯಾಕ್‌ಎಂಡ್, ಆಧುನಿಕ ವೆಬ್ ಡೆವಲಪ್‌ಮೆಂಟ್

### Container App - Python Flask
**ಸಾಂಸ್ಕೃತಿಕತೆಗಳು**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**ಜಟಿಲತೆ**: ಪ್ರಾರಂಭಿಕ  
**ಕಲ್ಪನೆಗಳು**: ಕಾಂಟೈನರೈಜೆ이션, REST API, scale-to-zero, health probes, ಮಾನಿಟರಿಂಗ್  
**ಸ್ಥಳ**: [ಸ್ಥಳೀಯ ಉದಾಹರಣೆ](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**ಸಾಂಸ್ಕೃತಿಕತೆಗಳು**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**ಜಟಿಲತೆ**: ಅಡ್ವಾನ್ಸ್ಡ್  
**ಕಲ್ಪನೆಗಳು**: ಬಹು-ಸೇವಾ ವಾಸ್ತುಶಿಲ್ಪ, ಸೇವಾ ಸಂವಹನ, ಮೆಸೇಜ್ ಕ್ಯುಯಿಂಗ್, ವಿತರಿತ ಟ್ರೇಸಿಂಗ್  
**ಸ್ಥಳ**: [ಸ್ಥಳೀಯ ಉದಾಹರಣೆ](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**ಸಾಂಸ್ಕೃತಿಕತೆಗಳು**: C# ASP.NET Core, Azure SQL Database, App Service  
**ಜಟಿಲತೆ**: ಮಧ್ಯಮ  
**ಕಲ್ಪನೆಗಳು**: Entity Framework, ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕಗಳು, ವೆಬ್ API ಡೆವಲಪ್‌ಮೆಂಟ್

### Serverless Function - Python Azure Functions
**ಸಾಂಸ್ಕೃತಿಕತೆಗಳು**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**ಜಟಿಲತೆ**: ಮಧ್ಯಮ  
**ಕಲ್ಪನೆಗಳು**: ಇವೆಂಟ್-ಚಾಲಿತ ವಾಸ್ತುಶಿಲ್ಪ, ಸರ್ವರ್‌ಲೆಸ್ ಕಂಪ್ಯೂಟಿಂಗ್, ಫುಲ್-ಸ್ಟಾಕ್ ಡೆವಲಪ್‌ಮೆಂಟ್

### Microservices - Java Spring Boot
**ಸಾಂಸ್ಕೃತಿಕತೆಗಳು**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**ಜಟಿಲತೆ**: ಮಧ್ಯಮ  
**ಕಲ್ಪನೆಗಳು**: ಮাইಕ್ರೋಸರ್ವಿಸಸ್ ಸಂವಹನ, ವಿತರಿತ ವ್ಯವಸ್ಥೆಗಳು, ಎಂಟರ್‌ಪ್ರೈಸ್ ಮಾದರಿಗಳು

### Microsoft Foundry Examples

#### Azure OpenAI Chat App
**ಸಾಂಸ್ಕೃತিকತೆಗಳು**: Azure OpenAI, Cognitive Search, App Service  
**ಜಟಿಲತೆ**: ಮಧ್ಯಮ  
**ಕಲ್ಪನೆಗಳು**: RAG ವಾಸ್ತುಶಿಲ್ಪ, ವೆಕ್ಟರ್ ಹುಡುಕಾಟ, LLM ಸಂಯೋಜನೆ

#### AI Document Processing
**ಸಾಂಸ್ಕೃತಿಕತೆಗಳು**: Azure AI Document Intelligence, Storage, Functions  
**ಜಟಿಲತೆ**: ಮಧ್ಯಮ  
**ಕಲ್ಪನೆಗಳು**: ಡಾಕ್ಯುಮೆಂಟ್ ವಿಶ್ಲೇಷಣೆ, OCR, ಡೇಟಾ ಹೊರತೆಗೆದುಕೊಡಲು

#### Machine Learning Pipeline
**ಸಾಂಸ್ಕೃತಿಕತೆಗಳು**: Azure ML, MLOps, Container Registry  
**ಜಟಿಲತೆ**: ಅಡ್ವಾನ್ಸ್ಡ್  
**ಕಲ್ಪನೆಗಳು**: ಮಾದರಿ ತರಬೇತಿ, ನಿಯೋಜನೆ ಪೈಪ್‌ಲೈನ್‌ಗಳು, ಮಾನಿಟರಿಂಗ್

## 🛠 ಕಾಂಫಿಗರೇಶನ್ ಉದಾಹರಣೆಗಳು

`configurations/` ಡೈರೆಕ್ಟರಿ ಪುನರ್‌ಬಳಕೆ ಮಾಡಬಹುದಾದ ಕಂಪೋನಂಟುಗಳನ್ನು ಒಳಗೊಂಡಿದೆ:

### ಪರಿಸರ ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳು
- ಅಭಿವೃದ್ಧಿ ಪರಿಸರ ಸೆಟ್ಟಿಂಗ್‌ಗಳು
- ಸ್ಟೇಜಿಂಗ್ ಪರಿಸರ ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳು
- ಉತ್ಪಾದನೆಗೆ ಸಿದ್ಧ ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳು
- ಬಹು-ಪ್ರದೇಶ ನಿಯೋಜನೆ ಸೆಟ್ಅಪ್‌ಗಳು

### Bicep ಮೋಡ್ಯೂಲ್ಸ್
- ಪುನರ್‌ಬಳಕೆ ಮಾಡಬಹುದಾದ ಮೂಲಸೌಕರ್ಯ ಘಟಕಗಳು
- ಸಾಮಾನ್ಯ ಸಂಪನ್ಮೂಲ ಮಾದರಿಗಳು
- ಭದ್ರತಾಪ್ರಬಲಿತ ಟೆಂಪ್ಲೇಟುಗಳು
- ವೆಚ್ಚ-ಆಪ್ಟಿಮೈಸ್ ಮಾಡಿದ ಕಾನ್ಫಿಗರೇಶನ್ಗಳು

### ಸಹಾಯಕ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
- ಪರಿಸರ ಸೆಟ್‌ಅಪ್ ಸ್ವಯಂಚಾಲಿತಗೊಳಿಸುವಿಕೆ
- ಡೇಟಾಬೇಸ್ ಮೈಗ್ರೇಶನ್ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
- ನಿಯೋಜನೆ ಮಾನ್ಯತೆ ಸಾಧನಗಳು
- ವೆಚ್ಚ ಮಾನಿಟರಿಂಗ್ ಉಪಕರಣಗಳು

## 🔧 ಕಸ್ಟಮೈಜೆಷನ್ ಮಾರ್ಗದರ್ಶಿ

### ನಿಮ್ಮ ಬಳಕೆದೃಶ್ಯಕ್ಕಾಗಿ ಉದಾಹರಣೆಗಳನ್ನು ಹೊಂದಿಸುವುದು

1. **ಆವಶ್ಯಕತೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ**
   - Azure ಸೇವಾ ಅಗತ್ಯಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
   - ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್ ಮಿತಿಗಳನ್ನು ದೃಢೀಕರಿಸಿ
   - ವೆಚ್ಚದ ಪರಿಣಾಮಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ

2. **ಕಾನ್ಫಿಗರೇಶನ್ ತಿದ್ದುಪಡಿ ಮಾಡಿ**
   - `azure.yaml` ಸೇವಾ ವ್ಯಾಖ್ಯಾನಗಳನ್ನು ನವೀಕರಿಸಿ
   - Bicep ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ
   - ಪರಿಸರ ಚಾರಗಳನ್ನು ಹೊಂದಿಸಿ

3. **ಪರೀಕ್ಷೆ ಸಂಪೂರ್ಣವಾಗಿ ಮಾಡಿ**
   - ಮೊದಲು ಅಭಿವೃದ್ಧಿ ಪರಿಸರಕ್ಕೆ ನಿಯೋಜಿಸಿ
   - ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಮಾನ್ಯ ಮಾಡಿ
   - ಸ್ಕೇಲಿಂಗ್ ಮತ್ತು ಫರ್‌ಫಾರ್ಮನ್ಸ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ

4. **ಭದ್ರತಾ ವಿಮರ್ಶೆ**
   - ಪ್ರವೇಶ ನಿಯಂತ್ರಣಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
   - ಸೀಕ್ರೆಟ್‌ಗಳ ನಿರ್ವಹಣೆ ಜಾರಿಗೊಳಿಸಿ
   - ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಅಲರ್ಟಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ

## 📊 ಹೋಲಿಕೆ ಮ್ಯಾಟ್ರಿಕ್ಸ್

| ಉದಾಹರಣೆ | ಸೇವೆಗಳು | ಡೇಟಾಬೇಸ್ | ಪ್ರಾಮಾಣೀಕರಣ | ಮಾನಿಟರಿಂಗ್ | ಜಟಿಲತೆ |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Local) | 2 | ❌ | Key Vault | ಪೂರ್ಣ | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | ಮೂಲ | ಪೂರ್ಣ | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | ಎಂಟರ್‌ಪ್ರೈಸ್ | ಅಡ್ವಾನ್ಸ್ಡ್ | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | ಮೂಲ | ಮೂಲ | ⭐ |
| React SPA + Functions | 3 | ✅ | ಮೂಲ | ಪೂರ್ಣ | ⭐ |
| Python Flask Container | 2 | ❌ | ಮೂಲ | ಪೂರ್ಣ | ⭐ |
| C# Web API + SQL | 2 | ✅ | ಪೂರ್ಣ | ಪೂರ್ಣ | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | ಪೂರ್ಣ | ಪೂರ್ಣ | ⭐⭐ |
| Java Microservices | 5+ | ✅ | ಪೂೂರ್ಣ | ಪೂರ್ಣ | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | ಪೂರ್ಣ | ಪೂರ್ಣ | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | ಮೂಲ | ಪೂರ್ಣ | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | ಪೂರ್ಣ | ಪೂರ್ಣ | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **ಎಂಟರ್‌ಪ್ರೈಸ್** | **ಅಡ್ವಾನ್ಸಡ್** | **⭐⭐⭐⭐** |

## 🎓 ಕಲಿಕಾ ಮಾರ್ಗ

### ಶಿಫಾರಸ್ಸು ಮಾಡಿದ ಮುಂದಿನ ಕ್ರಮ

1. **ಸರಳ ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌ನಿಂದ ಪ್ರಾರಂಭಿಸಿ**
   - ಮೂಲ AZD ಪರಿಕಲ್ಪನೆಗಳನ್ನು ಕಲಿಯಿರಿ
   - ನಿಯೋಜನೆ ವರ್ಕ್‌ಫ್ಲೋ ಅನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
   - ಪರಿಸರ ನಿರ್ವಹಣೆಯಲ್ಲಿ ಅಭ್ಯಾಸ ಮಾಡಿ

2. **ಸ್ತಿರ ವೆಬ್‌ಸೈಟ್ ಪ್ರಯತ್ನಿಸಿ**
   - ವಿಭಿನ್ನ ಹೋಸ್ಟಿಂಗ್ ಆಯ್ಕೆಗಳು ಅನ್ವೇಷಿಸಿ
   - CDN ಸಂಯೋಜನೆಯ ಬಗ್ಗೆ ತಿಳಿಯಿರಿ
   - DNS ಕಾನ್ಫಿಗರೇಶನ್ ಅನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ

3. **ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ಸಾಗಿರಿ**
   - ಕಾಂಟೈನರೈಜೆಷನ್ ಮೂಲಭೂತಗಳನ್ನು ಕಲಿಯಿರಿ
   - ಸ್ಕೇಲಿಂಗ್ ಪರಿಕಲ್ಪನೆಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
   - Docker ಜೊತೆ ಅಭ್ಯಾಸ ಮಾಡಿ

4. **ಡೇಟಾಬೇಸ್ ಇಂಟಿಗ್ರೇಶನ್ ಸೇರಿಸಿ**
   - ಡೇಟಾಬೇಸ್ ಪ್ರೊವಿಷನಿಂಗ್ ಕಲಿಯಿರಿ
   - ಕನೆಕ್ಷನ್ ಸ್ಟ್ರಿಂಗ್ಸ್ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
   - ಸೀಕ್ರೆಟ್‌ಗಳ ನಿರ್ವಹಣೆಯಲ್ಲಿ ಅಭ್ಯಾಸ ಮಾಡಿ

5. **ಸರ್ವರ್‌ಲೆಸ್ ಅನ್ನು ಅನ್ವೇಷಿಸಿ**
   - ಇವೆಂಟ್-ಚಾಲಿತ ವಾಸ್ತುಶಿಲ್ಪ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
   - ಟ್ರಿಗರ್‌ಗಳು ಮತ್ತು ಬೈಂಡಿಂಗ್‌ಗಳ ಕುರಿತು ಕಲಿಯಿರಿ
   - APIs ಮೂಲಕ ಅಭ್ಯಾಸ ಮಾಡಿ

6. **ಮೈಕ್ರೋಸರ್ವಿಸಸ್ ನಿರ್ಮಿಸಿ**
   - ಸೇವಾ ಸಂವಹನ ಕಲಿಯಿರಿ
   - ವಿತರಿತ ವ್ಯವಸ್ಥೆಗಳ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
   - ಜಟಿಲ ನಿಯೋಜನೆಗಳಲ್ಲಿ ಅಭ್ಯಾಸ ಮಾಡಿ

## 🔍 ಸರಿಯಾದ ಉದಾಹರಣೆಯನ್ನು ಹುಡುಕುವುದು

### ತಂತ್ರಜ್ಞಾನ ಸ್ಟ್ಯಾಕ್ ಆಧಾರಿತ
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

### ವಾಸ್ತುಶಿಲ್ಪ ಮಾದರಿ ಆಧಾರಿತ
- **ಸರಳ REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **ಮೊನೊಲಿಥಿಕ್**: Node.js Express Todo, C# Web API + SQL
- **ಸ್ಥಿರ + ಸರ್ವರ್‌ಲೆಸ್**: React SPA + Functions, Python Functions + SPA
- **ಮೈಕ್ರೋಸರ್ವಿಸಸ್**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **ಕಂಟೈನರೈಸ್‌ಡ್**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-ಚಾಲಿತ**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **ಬಹು-ಏಜೆಂಟ್ ವಾಸ್ತುಶಿಲ್ಪ**: **Retail Multi-Agent Solution**
- **ಎಂಟರ್‌ಪ್ರೈಸ್ ಬಹು-ಸೇವಾ**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### ಕಠಿಣತೆ ಮಟ್ಟದಿಂದ
- **ಆರಂಭಿಕ**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **ಮಧ್ಯಮ**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **ಅಡ್ವಾನ್ಸ್ಡ್**: ML Pipeline
- **ಎಂಟರ್‌ಪ್ರೈಸ್ ಉತ್ಪಾದನೆಗೆ ಸಿದ್ಧ**: [Microservices (Local)](../../../examples/container-app/microservices) (ಮಲ್ಟಿ-ಸೇವಾ ಮತ್ತು ಮೆಸೇಜ್ 큐ಯಿಂಗ್), **Retail Multi-Agent Solution** (ARM ಟೆಂಪ್ಲೇಟ್ ನಿಯೋಜನೆతో ಸಂಪೂರ್ಣ ಬಹು-ಏಜೆಂಟ್ ವ್ಯವಸ್ಥೆ)

## 📚 ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

### ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ಲಿಂಕ್‌ಗಳು
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
- [Node.js ಮತ್ತು PostgreSQL ಜೊತೆಗೆ ಟುಡೋ ಅಪ್ಲಿಕೇಶನ್](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API ಜೊತೆಗೆ React ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps ಜಾಬ್](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions ಜೊತೆಗೆ Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು
- [Azure ಉತ್ತಮ ವಿನ್ಯಾಸ ಫ್ರೇಮ್ವರ್ಕ್](https://learn.microsoft.com/en-us/azure/well-architected/)
- [ಮೇಘ ಅಂಗೀಕಾರ ಫ್ರೇಮ್ವರ್ಕ್](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 ಉದಾಹರಣೆಗಳನ್ನು ಕೊಡುಗೆ ನೀಡುವುದು

ಹಂಚಿಕೊಳ್ಳಲು ಒಂದು ಉಪಯುಕ್ತ ಉದಾಹರಣೆ ಇದೆಯೆ? ನಾವು ಕೊಡುಗೆಗಳನ್ನು ಸ್ವಾಗತಿಸುತ್ತೇವೆ!

### ಸಲ್ಲಿಕೆ ಮಾರ್ಗದರ್ಶಿಗಳು
1. ಸ್ಥಾಪಿಸಲಾಗಿರುವ ಡೈರೆಕ್ಟರಿ ರಚನೆಯನ್ನು ಅನುಸರಿಸಿ
2. ವಿಸ್ತೃತ README.md ಅನ್ನು ಸೇರಿಸಿ
3. ಕಾನ್ಫಿಗರೇಶನ್ ಫೈಲ್‌ಗಳಲ್ಲಿ ಕಾಮೆಂಟ್‌ಗಳನ್ನು ಸೇರಿಸಿ
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

**ಪ್ರೋ ಟಿಪ್**: ನಿಮ್ಮ ತಂತ್ರಜ್ಞಾನ ಸ್ಟ್ಯಾಕ್‌ಗೆ ಹೊಂದುವ ಅತ್ಯಂತ ಸರಳ ಉದಾಹರಣೆದಿಂದ ಪ್ರಾರಂಭಿಸಿ, ನಂತರ ಹಂತ ಹಂತವಾಗಿ ಹೆಚ್ಚು ಸಂಕೀರ್ಣ ಸಂದರ್ಭಗಳಿಗೆ ಹೋಗಿ. ಪ್ರತಿ ಉದಾಹರಣೆ ಹಿಂದಿನದರಿಂದ ಇರುವ ಪರಿಕಲ್ಪನೆಗಳ ಮೇಲೆ ನಿರ್ಮಿಸಲಾಗಿದೆ!

## 🚀 ಪ್ರಾರಂಭಿಸಲು ಸಿದ್ಧ?

### ನಿಮ್ಮ ಓದುವ ಮಾರ್ಗ

1. **ಸಂಪೂರ್ಣ ಪ್ರಾರಂಭಿಕ?** → Start with [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 ನಿಮಿಷ)
2. **ಮೂಲ AZD ಜ್ಞಾನವಿದೆಯೆ?** → Try [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 ನಿಮಿಷ)
3. **AI ಆಪ್‌ಗಳನ್ನು ನಿರ್ಮಿಸುತ್ತಿದ್ದೀರಾ?** → Start with [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 ನಿಮಿಷ) ಅಥವಾ ಅನ್ವೇಷಿಸಿ [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ ಗಂಟೆಗಳು)
4. **ನಿರ್ದಿಷ್ಟ ತಂತ್ರಜ್ಞಾನ ಸ್ಟ್ಯಾಕ್ ಬೇಕೆ?** → ಮೇಲಿನ [ಸರಿಯಾದ ಉದಾಹರಣೆಯನ್ನು ಕಂಡುಹಿಡಿಯುವ](../../../examples) ವಿಭಾಗವನ್ನು ಬಳಸಿರಿ

### ಮುಂದಿನ ಹಂತಗಳು

- ✅ ಮೇಲಿನ [ಪೂರ್ವಶರತ್ತುಗಳು](../../../examples) ಪರಿಶೀಲಿಸಿ
- ✅ ನಿಮ್ಮ ನಿಪುಣತೆ ಮಟ್ಟಕ್ಕೆ ಹೊಂದುವ ಉದಾಹರಣೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ (ಗಮನಿಸಿ [ಸಂಕೀರ್ಣತೆ ಲೆಜೆಂಡ್](../../../examples))
- ✅ ಡಿಪ್ಲಾಯ್ ಮಾಡುವ ಮೊದಲು ಉದಾಹರಣೆಯ README ಅನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ಓದಿ
- ✅ ಪರೀಕ್ಷೆಯ ನಂತರ `azd down` ಅನ್ನು ಓಡಿಸಲು ನೆನಪಿಡಿ
- ✅ GitHub Issues ಅಥವಾ Discussions ಮೂಲಕ ನಿಮ್ಮ ಅನುಭವವನ್ನು ಹಂಚಿಕೊಳ್ಳಿ

### ಸಹಾಯ ಬೇಕೇ?

- 📖 [FAQ](../resources/faq.md) - ಸಾಮಾನ್ಯ ಪ್ರಶ್ನೆಗಳಿಗೆ ಉತ್ತರಗಳು
- 🐛 [ದೋಷ ಪರಿಹಾರ ಮಾರ್ಗದರ್ಶಿ](../docs/chapter-07-troubleshooting/common-issues.md) - ಡಿಪ್ಲಾಯ್ ಸಮಸ್ಯೆಗಳನ್ನು ಸರಿಪಡಿಸಿ
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - ಸಮುದಾಯಕ್ಕೆ ಕೇಳಿ
- 📚 [ಅಧ್ಯಯನ ಮಾರ್ಗದರ್ಶಿ](../resources/study-guide.md) - ನಿಮ್ಮ ಕಲಿಕೆಯನ್ನು ಗಟ್ಟಿಗೊಳಿಸಿ

---

**ನಾವಿಗೇಶನ್**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../README.md)
- **📖 ಅಧ್ಯಯನ ವಸ್ತುಗಳು**: [ಅಧ್ಯಯನ ಮಾರ್ಗದರ್ಶಿ](../resources/study-guide.md) | [ಚೀಟ್ ಶೀಟ್](../resources/cheat-sheet.md) | [ಶಬ್ದಕೋಶ](../resources/glossary.md)
- **🔧 ಸಂಪನ್ಮೂಲಗಳು**: [FAQ](../resources/faq.md) | [ದೋಷ ಪರಿಹಾರ](../docs/chapter-07-troubleshooting/common-issues.md)

---

*ಇತ್ತೀಚಿನ ನವೀಕರಣ: ನವೆಂಬರ್ 2025 | [ಸಮಸ್ಯೆಗಳನ್ನು ವರದಿ ಮಾಡಿ](https://github.com/microsoft/AZD-for-beginners/issues) | [ಉದಾಹರಣೆಗಳನ್ನು ಕೊಡುಗೆ ನೀಡಿ](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ನಿರಾಕರಣೆ:
ಈ ದಾಖಲೇನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತೇವೆ, ಆದರೆ ದಯವಿಟ್ಟು ಗಮನಿಸಿ ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅನಿಖ್ರತೆಗಳು ಇರಬಹುದು. ಮೂಲ ದಾಖಲೆ ಅದರ ಮೂಲ ಭಾಷೆಯಲ್ಲಿ ಅಧಿಕೃತ ಮೂಲವಾಗಿದೆ ಎಂದು ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವುದರಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಅರ್ಥಭ್ರಮೆಗಳಿಗೆ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳಿಗೆ ನಾವು ಜವಾಬ್ದಾರಿಯಾಗುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
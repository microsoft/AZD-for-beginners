# ഉദാഹരണങ്ങൾ - പ്രായോഗിക AZD സാൻപിളുകളും കോൺഫിഗറേഷനുകളും

**ഉദാഹരണങ്ങളിലൂടെ പഠനം - അദ്ധ്യായങ്ങളായി ക്രമീകരിച്ചിരിക്കുന്നു**  
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../README.md)  
- **📖 അദ്ധ്യായ മാപ്പിംഗ്**: പഠനസങ്കീർണ്ണത പ്രകാരം ക്രമീകരിച്ച ഉദാഹരണങ്ങൾ  
- **🚀 ലോക്കൽ ഉദാഹരണം**: [Retail Multi-Agent Solution](retail-scenario.md)  
- **🤖 ബാഹ്യ AI ഉദാഹരണങ്ങൾ**: Azure സാംപിള്‍സ് റിപോസിറ്ററികൾക്ക് ലിങ്കുകൾ  

> **📍 പ്രധാനമായി: ലോക്കൽ vs ബാഹ്യ ഉദാഹരണങ്ങൾ**  
> ഈ റിപോസിറ്ററിയിൽ **4 പൂർണ്ണ ലോക്കൽ ഉദാഹരണങ്ങൾ** ഫുൾ ഇമ്പ്ലിമെന്റേഷനോടുകൂടി ഉണ്ട്:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 ഡിപ്ലോയ്മെന്റ് ചാറ്റ് ഇന്റർഫേസ് സഹിതം)  
> - **Container Apps** (സിമ്പിൾ ഫ്ലാസ്ക് API + മൈക്രോസർവിസസ്)  
> - **Database App** (വെബ് + SQL ഡേറ്റാബേസ്)  
> - **Retail Multi-Agent** (എന്റർപ്രൈസ് AI സൊല്യൂഷൻ)  
>  
> അധിക ഉദാഹരണങ്ങൾ ക്ളോൺ ചെയ്യാവുന്ന Azure-Samples റിപോസിറ്ററികളിലേക്കുള്ള **ബാഹ്യ റഫറൻസുകൾ** ആണ്.

## പരിചയം

ഈ ഡയറക്റ്ററി പ്രായോഗിക ഉദാഹരണങ്ങളും റഫറൻസുകളും നൽകിയുകൊണ്ട് Azure Developer CLI പിടിച്ചു പഠിക്കാൻ സഹായപ്പെടുന്നു. Retail Multi-Agent സീനാരിയോ ഒരു പൂർണ്ണവും പ്രൊഡക്ഷൻ റെഡി ആയ ഇംപ്ലിമെന്റേഷനാണ്, ഇത് ഈ റിപോസിറ്ററിയിൽ ഉൾപ്പെടുന്നു. അധിക ഉദാഹരണങ്ങൾ വിവിധ AZD പാറ്റേണുകൾ കാണിക്കുന്ന ഔദ്യോഗിക Azure സാംപിളുകളിലേക്കുള്ള റഫറൻസ് ആണ്.

### സങ്കീർണ്ണത റേറ്റിങ് ലെജൻഡ്

- ⭐ **ആരംഭക** - അടിസ്ഥാന ആശയങ്ങൾ, ഏകസേവനം, 15-30 മിനിറ്റ്  
- ⭐⭐ **മദ്ധ്യനില** - ബഹുസേവനങ്ങൾ, ഡേറ്റാബേസ് ഇന്റഗ്രേഷൻ, 30-60 മിനിറ്റ്  
- ⭐⭐⭐ **ഉയർന്ന** - സങ്കീർണ്ണ ആർക്കിടെക്ചർ, AI ഇന്റഗ്രേഷൻ, 1-2 മണിക്കൂർ  
- ⭐⭐⭐⭐ **വിദഗ്ധൻ** - പ്രൊഡക്ഷൻ റെഡി, എന്റർപ്രൈസ് പാറ്റേണുകൾ, 2+ മണിക്കൂർ  

## 🎯 ഈ റിപോസിറ്ററിയിൽ യഥാർത്ഥത്തിൽ എന്തുണ്ട്

### ✅ ലോക്കൽ ഇംപ്ലിമെന്റേഷൻ (ഉപയോഗത്തിനായി റെഡി)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕  
**ഗാനമായ gpt-4.1 ഡിപ്ലോയ്മെന്റ് ചാറ്റ് ഇന്റർഫേസായി ഈ റിപോസിറ്ററിയിൽ ഉൾപ്പെട്ടിരിക്കുന്നു**  

- **സ്ഥലം:** `examples/azure-openai-chat/`  
- **സങ്കീർണ്ണത:** ⭐⭐ (മദ്ധ്യമ)**  
- **ഉൾപ്പെടുത്തിയിരിക്കുന്നത്:**  
  - പൂർണ്ണ Microsoft Foundry Models ഡിപ്ലോയ്മെന്റ് (gpt-4.1)  
  - പൈത്തൺ കമാൻഡ്-ലൈൻ ചാറ്റ് ഇന്റർഫേസ്  
  - എപി ഐ കീകൾക്കായി കി വോൾട്ട് ഇന്റഗ്രേഷൻ  
  - ബൈസപ് ഇൻഫ്രാസ്ട്രക്‌ചർ ടെംപ്ലേറ്റുകൾ  
  - ടോക്കൺ ഉപയോഗവും ചിലവുകളും ട്രാക്കിംഗ്  
  - നിരക്ക് നിയന്ത്രണവും പിശകുകൾ കൈകാര്യം ചെയ്യലും  

**ക്വിക് സ്റ്റാർട്ട്:**  
```bash
# ഉദാഹരണത്തിലേക്ക് നാവിഗേറ്റ് ചെയ്യുക
cd examples/azure-openai-chat

# എല്ലാം വിന്യസിക്കുക
azd up

# ആശ്രിതങ്ങൾ ഇൻസ്റ്റാൾ ചെയ്ത് ചാറ്റ് ആരംഭിക്കുക
pip install -r src/requirements.txt
python src/chat.py
```
  
**ടെക്‌നോളജീസ്:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep  

#### [Container App Examples](container-app/README.md) 🆕  
**കമ്പ്രീഹൻസീവ് കൺTAINER ഡിപ്ലോയ്മെന്റ് സാമ്പിളുകൾ ഈ റിപോസിറ്ററിയിൽ ഉൾപ്പെടുത്തിയിരിക്കുന്നു**  

- **സ്ഥലം:** `examples/container-app/`  
- **സങ്കീർണ്ണത:** ⭐ മുതൽ ⭐⭐⭐⭐⭐ വരെ (ആരംഭക മുതൽ ഉയർന്ന വരെ)  
- **ഉൾപ്പെടുത്തിയിരിക്കുന്നത്:**  
  - [മാസ്റ്റർ ഗൈഡ്](container-app/README.md) - കൺTAINER ഡിപ്ലോയ്മെന്റുകളുടെ പൂർണ്ണ അവലോകനം  
  - [സിംപിൾ ഫ്ലാസ്ക് API](../../../examples/container-app/simple-flask-api) - അടിസ്ഥാന REST API ഉദാഹരണം  
  - [മൈക്രോസർവിസസ് ആർക്കിടെക്ചർ](../../../examples/container-app/microservices) - പ്രൊഡക്ഷൻ റെഡി മൾട്ടി-സർവീസ് ഡിപ്ലോയ്മെന്റ്  
  - ക്വിക് സ്റ്റാർട്ട്, പ്രൊഡക്ഷൻ, ആഡ്‌വാൻസഡ് പാറ്റേണുകൾ  
  - മോണിറ്ററിംഗ്, സുരക്ഷ, ചിലവ് ഒപ്റ്റിമൈസേഷൻ  

**ക്വിക് സ്റ്റാർട്ട്:**  
```bash
# മാസ്റ്റർ ഗൈഡ് കാണുക
cd examples/container-app

# ലളിതമായ ഫ്ലാസ്‌ക് API വിന്യസിക്കുക
cd simple-flask-api
azd up

# മൈക്രോസർവീസസ് ഉദാഹരണം വിന്യസിക്കുക
cd ../microservices
azd up
```
  
**ടെക്‌നോളജീസ്:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights  

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕  
**പൂർണ്ണ പ്രൊഡക്ഷൻ റെഡി ഇംപ്ലിമെന്റേഷൻ ഈ റിപോസിറ്ററിയിൽ ഉൾപ്പെടുത്തിയിരിക്കുന്നു**  

- **സ്ഥലം:** `examples/retail-multiagent-arm-template/`  
- **സങ്കീർണ്ണത:** ⭐⭐⭐⭐ (ഉയർന്ന)**  
- **ഉൾപ്പെടുത്തിയിരിക്കുന്നത്:**  
  - പൂർണ്ണ ARM ഡിപ്ലോയ്മെന്റ് ടെംപ്ലേറ്റ്  
  - മൾട്ടി-എജന്റ് ആർക്കിടെക്ചർ (കസ്റ്റമർ + ഇൻവെന്ററി)  
  - Microsoft Foundry Models ഇന്റഗ്രേഷൻ  
  - RAG ഉപയോഗിച്ച AI സെർച്ചും  
  - വ്യാപകമായ മോണിറ്ററിംഗ്  
  - ഒറ്റ ക്ലിക്ക് ഡിപ്ലോയ്മെന്റ് സ്ക്രിപ്റ്റ്  

**ക്വിക് സ്റ്റാർട്ട്:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**ടെക്‌നോളജീസ്:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 ബാഹ്യ Azure Samples (ഉപയോഗത്തിനായി ക്ളോൺ ചെയ്യുക)

താഴെപ്പറയുന്ന ഉദാഹരണങ്ങൾ ഔദ്യോഗിക Azure-Samples റിപോസിറ്ററികളിൽ വ്യക്തമായി നിലനിർത്തുന്നു. വിവിധ AZD പാറ്റേണുകൾ പഠിക്കാൻ ഇവ ക്ളോൺ ചെയ്യാം:

### ലളിതമായ അപ്ലിക്കേഷനുകൾ (അദ്ധ്യായങ്ങൾ 1-2)

| ടെംപ്ലേറ്റ് | റിപോസിറ്ററി | സങ്കീർണ്ണത | സർവീസുകൾ |  
|:---------|:-----------|:-----------|:---------|  
| **Python Flask API** | [ലോക്കൽ: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |  
| **Microservices** | [ലോക്കൽ: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | ബഹുസേവനങ്ങൾ, സർവീസ് ബസ്, കോസ്മോസ് DB, SQL |  
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |  
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |  
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |  

**ഉപയോഗിക്കുന്ന വിധി:**  
```bash
# എളുപ്പ് ഏതെങ്കിലുമൊരു ഉദാഹരണം
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# വിന്യസിക്കുക
azd up
```
  

### AI അപ്ലിക്കേഷൻ ഉദാഹരണങ്ങൾ (അദ്ധ്യായങ്ങൾ 2, 5, 8)

| ടെംപ്ലേറ്റ് | റിപോസിറ്ററി | സങ്കീർണ്ണത | പ്രാധാന്യം |  
|:---------|:-----------|:-----------|:------|  
| **Microsoft Foundry Models Chat** | [ലോക്കൽ: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 ഡിപ്ലോയ്മെന്റ് |  
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | അടിസ്ഥാന AI ചാറ്റ് |  
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | ഏജന്റ് ഫ്രെയിംവർക്ക് |  
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG പാറ്റേൺ |  
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | എന്റർപ്രൈസ് AI |  

### ഡേറ്റാബേസ് & ഉയർന്ന പാറ്റേണുകൾ (അദ്ധ്യായങ്ങൾ 3-8)

| ടെംപ്ലേറ്റ് | റിപോസിറ്ററി | സങ്കീർണ്ണത | പ്രാധാന്യം |  
|:---------|:-----------|:-----------|:------|  
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | ഡേറ്റാബേസ് ഇന്റഗ്രേഷൻ |  
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | നോSQL സർവർലെസ് |  
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | ബഹുസേവനം |  
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | എംഎൽഓപ്സ് |  

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഉദാഹരണങ്ങൾ വഴി നിങ്ങൾ:  
- യാഥാർത്ഥ്യമുള്ള അപ്ലിക്കേഷൻ സീനാരിയോകളുടെ സഹായത്തോടെ Azure Developer CLI രീതികൾ അഭ്യസിക്കും  
- വ്യത്യസ്ത അപ്ലിക്കേഷൻ ആർക്കിടെക്ചറുകളും അവയുടെ azd ഇംപ്ലിമെന്റേഷനുകളും മനസ്സിലാക്കും  
- വിവിധ Azure സർവിസുകൾക്കായി ഇൻഫ്രാസ്ട്രക്ഷർ ആസ് കോഡിന്റെ പാറ്റേണുകൾ കൈകാര്യം ചെയ്യാൻ കഴിവുണ്ടാക്കും  
- കോൺഫിഗറേഷൻ മാനേജ്‌മെന്റ്, പരിസ്ഥിതി-നിഷ്ഠമായ ഡിപ്ലോയ്മെന്റ് തന്ത്രങ്ങൾ ഉപയോഗിക്കും  
- പ്രായോഗിക സാഹചര്യങ്ങളിൽ മോണിറ്ററിംഗ്, സുരക്ഷ, സ്കേലിംഗ് പാറ്റേണുകളും നടപ്പിലാക്കും  
- യഥാർത്ഥ ഡിപ്ലോയ്മെന്റ് സാഹചര്യങ്ങളിൽ തകരാർ പരിഹാരവും ഡീബഗ് ചെയ്യലും പരിചയം നേടും  

## പഠന ഫലങ്ങൾ

ഈ ഉദാഹരണങ്ങൾ പൂർത്തിയാക്കിയ ശേഷം, നിങ്ങൾ:  
- വിവിധ അപ്ലിക്കേഷൻ തരം Azure Developer CLI ഉപയോഗിച്ച് ആത്മവിശ്വാസത്തോടെ ഡിപ്ലോയ്ചെയ്യാനാകും  
- ലഭിച്ച ടെംപ്ലേറ്റുകൾ നിങ്ങളുടെ സ്വന്തം അപ്ലിക്കേഷൻ ആവശ്യങ്ങൾക്ക് അനുയോജ്യമാക്കാനാകും  
- ബൈസപ് ഉപയോഗിച്ച് കസ്റ്റം ഇൻഫ്രാസ്ട്രക്ഷർ പാറ്റേണുകൾ രൂപകൽ‌പനയും നടപ്പാക്കൽയും നടത്താനാകും  
- ശരിയായ ആശ്രിതത്വങ്ങളോടെ സങ്കീർണ്ണ മൾട്ടി-സർവീസ് അപ്ലിക്കേഷനുകൾ കോൺഫിഗർ ചെയ്യാനാകും  
- യഥാർത്ഥ സാഹചര്യങ്ങളിൽ സുരക്ഷ, മോണിറ്ററിംഗ്, പ്രകടന മികച്ച രീതികൾ പ്രയോഗിക്കാനാകും  
- പ്രായോഗിക പരിചയം അടിസ്ഥാനമാക്കി ഡിപ്ലോയ്മെന്റ് പ്രശ്നങ്ങൾ കണ്ടെത്താനും ഒപ്റ്റിമൈസേഷനും നടത്താനാകും  

## ഡയറക്റ്ററി ഘടന

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
  
## ക്വിക് സ്റ്റാർട്ട് ഉദാഹരണങ്ങൾ

> **💡 AZD-യിൽ പുതിയ ആണോ?** ഉദാഹരണം #1 (Flask API) ഉപയോഗിച്ച് ആരംഭിക്കൂ - ഏകദേശം 20 മിനിറ്റ് എടുത്ത് അടിസ്ഥാന ആശയങ്ങൾ പഠിപ്പിക്കും.

### ആരംഭക്കാർക്ക്  
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (ലോക്കൽ) ⭐  
   സ്കെയിൽ-ടു-സീറോ സവിശേഷതയോടെ ലളിതമായ REST API ഡിപ്ലോയ്ചെയ്യുക  
   **സമയം:** 20-25 മിനിറ്റ് | **ചിലവ്:** $0-5/മാസം  
   **നിങ്ങൾക്ക് പഠിക്കാം:** ആസിഡി വർക്ക്‌ഫ്ലോ, കണ്ടെയ്‌നറൈസേഷൻ, ഹെൽത്ത് പ്രോബുകൾ  
   **പ്രതീക്ഷിത ഫലം:** "Hello, World!" എന്ന പ്രതികരണം നൽകുന്ന API എൻഡ്പോയിന്റ് പ്രവർത്തനക്ഷമമായി മോണിറ്ററിംഗ് ഉൾക്കൊള്ളിച്ച്  

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB ഉപയോഗിച്ച് Node.js Express വെബ് അപ്ലിക്കേഷൻ ഡിപ്ലോയ്ചെയ്യുക  
   **സമയം:** 25-35 മിനിറ്റ് | **ചിലവ്:** $10-30/മാസം  
   **നിങ്ങൾക്ക് പഠിക്കാം:** ഡേറ്റാബേസ് ഇന്റഗ്രേഷൻ, പരിസ്ഥിതി വ്യത്യാസങ്ങൾ, കണക്ഷൻ സ്ട്രിങ്  
   **പ്രതീക്ഷിത ഫലം:** സൃഷ്ടി/വായിക്കൽ/അപ്‌ഡേറ്റ്/ഡിലീറ്റ് പ്രവർത്തനങ്ങൾ ഉള്ള ടു-ഡു ലിസ്റ്റ് അപ്ലിക്കേഷൻ  

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps ഉപയോഗിച്ച് React സ്റ്റാറ്റിക് വെബ്സൈറ്റ് ഹോസ്റ്റ് ചെയ്യുക  
   **സമയം:** 20-30 മിനിറ്റ് | **ചിലവ്:** $0-10/മാസം  
   **നിങ്ങൾക്ക് പഠിക്കാം:** സ്റ്റാറ്റിക് ഹോസ്റ്റിംഗ്, സര്‍വര്‍ലെസ് ഫങ്ഷൻസ്, CDN ഡിപ്ലോയ്മെന്റ്  
   **പ്രതീക്ഷിത ഫലം:** API ബാക്ക്എൻഡ് ഉള്ള React UI, സ്വയം SSL, ഗ്ലോബൽ CDN  

### മദ്ധ്യമനില ഉപയോക്താക്കൾക്ക്  
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (ലോക്കൽ) ⭐⭐  
   ചാറ്റ് ഇന്റർഫേസും സുരക്ഷിത API കീ മാനേജ്മെന്റും ഉള്ള gpt-4.1 ഡിപ്ലോയ്ചെയ്യുക  
   **സമയം:** 35-45 മിനിറ്റ് | **ചിലവ്:** $50-200/മാസം  
   **നിങ്ങൾക്ക് പഠിക്കാം:** Microsoft Foundry Models ഡിപ്ലോയ്മെന്റ്, കി വോൾട്ട് ഇന്റഗ്രേഷൻ, ടോക്കൺ ട്രാക്കിംഗ്  
   **പ്രതീക്ഷിത ഫലം:** gpt-4.1 ഉള്ള പ്രവർത്തനക്ഷമമായ ചാറ്റ് അപ്ലിക്കേഷൻ കൂടാതെ ചിലവ് മോണിറ്ററിംഗ്  

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (ലോക്കൽ) ⭐⭐⭐⭐  
   പ്രൊഡക്ഷൻ റെഡി മൾട്ടി-സർവീസ് ആർക്കിടെക്ചർ  
   **സമയം:** 45-60 മിനിറ്റ് | **ചിലവ്:** $50-150/മാസം  
   **നിങ്ങൾക്ക് പഠിക്കാം:** സർവീസ് കമ്മ്യൂണിക്കേഷൻ, മെസ്സേജ് ക്യൂയിംഗ്, ഡിസ്‌ട്രിബ്യൂട്ടഡ് ട്രേസിംഗ്  
   **പ്രതീക്ഷിത ഫലം:** 2 സർവീസ് സിസ്റ്റം (API ഗേറ്റ്വേ + ഉൽപ്പന്ന സർവീസ്) മോണിറ്ററിംഗുമായി  

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API പുറം Azure SQL ഡേറ്റാബേസ് ഉള്ള വെബ് അപ്ലിക്കേഷൻ  
   **സമയം:** 30-45 മിനിറ്റ് | **ചിലവ്:** $20-80/മാസം  
   **നിങ്ങൾക്ക് പഠിക്കാം:** Entity Framework, ഡേറ്റാബേസ് മൈഗ്രേഷൻസ്, കണക്ഷൻ സുരക്ഷ  
   **പ്രതീക്ഷിത ഫലം:** Azure SQL ബാക്ക്എൻഡ് ഉള്ള C# API, സ്വയം സ്കീമ ഡിപ്ലോയ്മെന്റ്  

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ട്രിഗ്ഗറുകളും Cosmos DB ഉപയോഗവും ഉള്ള Python Azure Functions  
   **സമയം:** 30-40 മിനിറ്റ് | **ചിലവ്:** $10-40/മാസം  
   **നിങ്ങൾക്ക് പഠിക്കാം:** ഇവന്റ്-ഓറിയന്റഡ് ആർക്കിടെക്ചർ, സര്‍വര്‍ലെസ് സ്കേലിംഗ്, നോSQL ഇന്റഗ്രേഷൻ  
   **പ്രതീക്ഷിത ഫലം:** HTTP അഭ്യർത്ഥനകൾക്ക് പ്രതികരിക്കുന്ന ഫങ്ക്ഷൻ അപ്ലിക്കേഷൻ Cosmos DB സ്റ്റോറേജോടുകൂടെ  

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Контൈനെർ એપ્સ, API ഗേറ്റ്വേ ഉപയോഗിച്ച് മൾട്ടി-സർവീസ് ജावा അപ്ലിക്കേഷൻ  
   **സമയം:** 60-90 മിനിറ്റ് | **ചിലവ്:** $80-200/മാസം  
   **നിങ്ങൾക്ക് പഠിക്കാം:** Spring Boot ഡിപ്ലോയ്മെന്റ്, സർവീസ് മെഷ്, ലോഡ് ബാലാൻസിംഗ്  
   **പ്രതീക്ഷിത ഫലം:** സർവീസ് ഡിസ്കവറി, റൂട്ടിംഗ് ഉള്ള മൾട്ടി-സർവീസ് ജावा സിസ്റ്റം  

### Microsoft Foundry ടെംപ്ലേറ്റുകൾ

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   പൂർണ്ണമായ gpt-4.1 ഡിപ്ലോയ്മെന്റ് ചാറ്റ് ഇന്റർഫേസോടെ  
   **സമയം:** 35-45 മിനിറ്റ് | **ചിലവ്:** $50-200/മാസം  
   **പ്രതീക്ഷിത ഫലം:** ടോക്കൺ ട്രാക്കിംഗ്, ചിലവ് മോണിറ്ററിംഗ് ഉള്ള പ്രവർത്തനക്ഷമമായ ചാറ്റ് അപ്ലിക്കേഷൻ  

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG ആർക്കിടെക്ചർ ഉള്ള ബുദ്ധിമുട്ടുള്ള ചാറ്റ് അപ്ലിക്കേഷൻ  
   **സമയം:** 60-90 മിനിറ്റ് | **ചിലവ്:** $100-300/മാസം  
   **പ്രതീക്ഷിത ഫലം:** ഡോക്യുമെന്റ് സെർച്ച്, ഉദ്ധരണികളും കൂടിയ RAG-പ്രേരിത ചാറ്റ് ഇന്റർഫേസ്  

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI സർവീസുകൾ ഉപയോ​ഗിച്ച് ഡോക്യുമെന്റ് വിശകലനം  
   **സമയം:** 40-60 മിനിറ്റ് | **ചിലവ്:** $20-80/മാസം  
   **പ്രതീക്ഷിത ഫലം:** അപ്‌ലോഡ് ചെയ്ത ഡോക്യുമെന്റുകൾ മുതൽ ടെക്സ്റ്റ്, ടേബിളുകൾ, എന്റിറ്റികൾ എക്സ്ട്രാക്ഷൻ ചെയ്യുന്നതിന് API  

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning ഉപയോഗിക്കുന്ന MLOps വർക്ക്‌ഫ്ലോ  
   **സമയം:** 2-3 മണിക്കൂർ | **ചിലവ്:** $150-500/മാസം  
   **പ്രതീക്ഷിത ഫലം:** പരിശീലനം, ഡിപ്ലോയ്മെന്റ്, മോണിറ്ററിംഗ് ഉൾക്കൊള്ളുന്ന സ്വയം പ്രവർത്തിക്കുന്ന ML പൈപ്പ്‌ലൈൻ  

### യഥാർത്ഥ ലോക സീനാരിയോസ്

#### **Retail Multi-Agent Solution** 🆕  
**[പൂർണ്ണ ഇംപ്ലിമെന്റേഷൻ ഗൈഡ്](./retail-scenario.md)**  

AZD ഉപയോഗിച്ചുള്ള എന്റർപ്രൈസ് നിലവാരമുള്ള AI അപ്ലിക്കേഷൻ ഡിപ്ലോയ്മെന്റ് തെളിയിക്കുന്ന, വ്യാപകവും പ്രൊഡക്ഷൻ റെഡിയുമായ മൾട്ടി-എജന്റ് കസ്റ്റമർ സഹായ സൊല്യൂഷൻ. ഈ സീനാരിയോ നിങ്ങൾക്ക് നൽകുന്നു:
- **സമഗ്ര ആർക്കിടെക്ചർ**: പ്രത്യേകीकൃത കസ്റ്റമര്‍ സപ്പോര്‍ട്ട്, ഇൻവെന്ററി മാനേജുമെന്റ് ഏജന്റുകളുമായി മൾട്ടി-ഏജന്റ് സിസ്റ്റം  
- **പ്രൊഡക്ഷൻ ഇൻഫ്രാസ്ട്രക്ചർ**: മൾട്ടി-റിയജന്മുള്ള Microsoft Foundry Models ഡിപ്ലോയ്‌മെന്റുകൾ, AI Search, Container Apps, സമ്പൂർണ്ണ മോണിറ്ററിംഗ്  
- **റെഡി-ടു-ഡിപ്ലോയ് ARM ടെംപ്ലേറ്റ്**: ഒറ്റ ക്ലിക്കിൽ ഡിപ്ലോയ്‌മെന്റ് വിവിധ കോൺഫിഗറേഷൻ മോഡുകൾ (Minimal/Standard/Premium)  
- **അൽഫ-ഫീച്ചറുകൾ**: റെഡ് ടീം സുരക്ഷാ സ്ഥിരീകരണം, ഏജന്റ് വിലയിരുത്തല്‍ ഫ്രെയിംവർക്ക്, ചെലവ് മെച്ചപ്പെടുത്തല്‍, പ്രശ്‌നപരിഹാര ഗൈഡുകൾ  
- **പാരിസ്ഥിതിക ബിസിനസ് അനുഭവം**: റീട്ടെയ്ലർ കസ്റ്റമർ സപ്പോർട്ട് ഉപയോഗകുറിപ്പ്, ഫയൽ അപ്‌ലോഡുകൾ, സെർച്ച് ഇന്റഗ്രേഷൻ, ഡൈനാമിക് സ്കെയിലിംഗ്

**സാങ്കേതികവിദ്യകൾ**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**സങ്കീർണത**: ⭐⭐⭐⭐ (അഡ്വാൻസ്ഡ് - എന്റർപ്രൈസ് പ്രൊഡക്ഷൻ റെഡി)

**പരിപൂർണമായി അനുയോജ്യം**: AI ഡെവലപ്പർമാർ, സൊല്യൂഷൻ ആർക്കിടെക്റ്റുകൾ, പ്രൊഡക്ഷൻ മൾട്ടി-ഏജന്റ് സിസ്റ്റങ്ങൾ നിർമ്മിക്കുന്ന ടീമുകൾ

**ക്വിക്ക് സ്റ്റാർട്ട്**: ഉൾപ്പെടുത്തിയിരിക്കുന്ന ARM ടെംപ്ലേറ്റ് ഉപയോഗിച്ച് `./deploy.sh -g myResourceGroup` ഡിപ്പ്ലോയ് ചെയ്ത് 30 മിനിറ്റിനകം സമ്പൂർണ്ണ സൊല്യൂഷൻ ആരംഭിക്കുക

## 📋 ഉപയോഗ നിർദ്ദേശങ്ങൾ

### മുൻപരിഭാഷകൾ

ഏതെങ്കിലും ഉദാഹരണം പ്രവർത്തിപ്പിക്കുന്നതിനുമുമുമ്പ്:  
- ✅ ഓണർ അല്ലെങ്കിൽ കോൺട്രിബ്യൂട്ടർ ആക്‌സസ് ഉള്ള Azure സബ്‌സ്‌ക്രിപ്ഷൻ  
- ✅ Azure Developer CLI ഇൻസ്റ്റാൾ ചെയ്തിരിക്കുന്നത് ([ഇൻസ്റ്റലേഷൻ ഗൈഡ്](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop പ്രവർത്തനക്ഷമം (കണ്ടെയ്‌നർ ഉദാഹരണങ്ങൾക്കായി)  
- ✅ അനുയോജ്യമായ Azure കൊറ്റാസുകൾ (ഉദാഹരണ വിഭാഗം ആവശ്യകതകൾ പരിശോധിക്കുക)  

> **💰 ചെലവ് സൂচনা:** എല്ലാ ഉദാഹരണങ്ങളും യഥാർത്ഥ Azure റിസോഴ്‌സുകൾ സൃഷ്ടിച്ച് ചാർജുകൾ ഉണ്ടാക്കും. ചെലവു കണക്കുകള്‍ക്കായി README ഫയലുകൾ കാണുക. തുടരുന്ന ചെലവുകൾ ഒഴിവാക്കാൻ ജോലികൾ കഴിഞ്ഞ് `azd down` ഓടിക്കുക.

### പ്രാദേശികമായി ഉദാഹരണങ്ങൾ പ്രവർത്തിപ്പിക്കൽ

1. **ഉദാഹരണം ക്ലോൺ ചെയ്യുക അല്ലെങ്കിൽ കോപ്പി ചെയ്യുക**  
   ```bash
   # ആഗ്രഹിച്ച ഉദാഹരണത്തിലേക്ക് നാവിഗേറ്റ് ചെയ്യുക
   cd examples/simple-web-app
   ```
  
2. **AZD പരിസ്ഥിതി തുടക്കം**  
   ```bash
   # നിലവിലുള്ള ടെംപ്ലേറ്റ് ഉപയോഗിച്ച് ആരംഭിക്കുക
   azd init
   
   # അല്ലെങ്കിൽ പുതിയ പരിസ്ഥിതി സൃഷ്ടിക്കുക
   azd env new my-environment
   ```
  
3. **പരിസ്ഥിതി കോൺഫിഗർ ചെയ്യുക**  
   ```bash
   # ആവശ്യമുള്ള മാറ്റികൾ സജ്ജീകരിക്കുക
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **ഡിപ്ലോയ് ചെയ്യുക**  
   ```bash
   # അടിസ്ഥാന ഘടനയും അപ്ലിക്കേഷനും വിന്യസിക്കുക
   azd up
   ```
  
5. **ഡിപ്ലോയ്‌മെന്റ് സ്ഥിരീകരിക്കുക**  
   ```bash
   # സേവിറ്റ് എന്റ്പോയിന്റുകൾ നേടുക
   azd env get-values
   
   # എന്റ്പോയിന്റ് പരീക്ഷിക്കുക (ഉദാഹരണം)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **പ്രതീക്ഷിച്ച വിജയം സൂചകങ്ങൾ:**  
   - ✅ `azd up` പിഴവുകളില്ലാതെ പൂർത്തിയാകണം  
   - ✅ സർവീസ് എൻഡ്‌പോയിന്റ് HTTP 200 തിരിച്ചിടണം  
   - ✅ Azure പോർട്ടൽ "Running" നില കാണിക്കുക  
   - ✅ Application Insights ടെലിമെട്രി സ്വീകരിക്കുന്നു  

> **⚠️ പ്രശ്‌നമുണ്ടോ?** [Common Issues](../docs/chapter-07-troubleshooting/common-issues.md) കാണുക ഡിപ്ലോയ്മെന്റ് പ്രശ്‌നപരിഹാരത്തിന്

### ഉദാഹരണങ്ങളോടൊപ്പം ഇനം മാറ്റൽ

ഓരോ ഉദാഹരണത്തിനും ഉൾപ്പെടുത്തുന്നവ:  
- **README.md** - വിശദമായ സജ്ജീകരണവും നിലവറമാറ്റത്തിന്റെ നിർദ്ദേശങ്ങളും  
- **azure.yaml** - കമൻറുകളോടെ AZD കോൺഫിഗറേഷൻ  
- **infra/** - പാരാമീറ്റർ വിശദീകരണങ്ങളോടെ ബിസെപ് ടെംപ്ലേറ്റുകൾ  
- **src/** - സാമ്പിൾ അപ്ലിക്കേഷൻ കോഡ്  
- **scripts/** - സാധാരണ പ്രവർത്തനങ്ങൾക്ക് സഹായക സ്‌ക്രിപ്റ്റുകൾ  

## 🎯 പഠന ലക്കങ്ങൾ

### ഉദാഹരണ വിഭാഗങ്ങൾ

#### **അടിസ്ഥാന ഡിപ്പ്ലോയ്മെന്റുകൾ**  
- സിംഗിൾ-സർവീസ് അപ്ലിക്കേഷനുകൾ  
- ലളിതമായ ഇൻഫ്രാസ്ട്രക്ചർ മാതൃകകൾ  
- അടിസ്ഥാന കോൺഫിഗറേഷൻ മാനേജ്‌മെന്റ്  
- ചെലവുകുറഞ്ഞ ഡെവലപ്പ്മെന്റ് സെറ്റപ്പുകൾ  

#### **അഡ്വാൻസ്ഡ് സീനാർയോകൾ**  
- മൾട്ടി-സർവീസ് ആർക്കിടെക്ചറുകൾ  
- സങ്കീർണ നെട്വർക്ക് കോൺഫിഗറേഷനുകൾ  
- ഡാറ്റാബേസ് ഇന്റഗ്രേഷൻ മാതൃകകൾ  
- സുരക്ഷയും പാലനവും  

#### **പ്രൊഡക്ഷൻ-റെഡി മാതൃകകൾ**  
- ഹൈ അവയിലബിലിറ്റി കോൺഫിഗറേഷനുകൾ  
- മോണിറ്ററിംഗ്, ഒബ്സർവബിലിറ്റി  
- CI/CD ഇന്റഗ്രേഷൻ  
- ദുരന്ത പുനരുദ്ധാരണം സെറ്റപ്പുകൾ  

## 📖 ഉദാഹരണ വിവരണങ്ങൾ

### ലളിത വെബ് ആപ്പ് - Node.js Express  
**സാങ്കേതികവിദ്യകൾ**: Node.js, Express, MongoDB, Container Apps  
**സങ്കീർണത**: നൂതന  
**കരട് ആശയങ്ങൾ**: അടിസ്ഥാന ഡിപ്പ്ലോയ്മെന്റ്, REST API, NoSQL ഡാറ്റാബേസ് ഇന്റഗ്രേഷൻ

### സ്റ്റാറ്റിക് വെബ്‌സൈറ്റ് - React SPA  
**സാങ്കേതികവിദ്യകൾ**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**സങ്കീർണത**: നൂതന  
**കരട് ആശയങ്ങൾ**: സ്റ്റാറ്റിക് ഹോസ്റ്റിംഗ്, സർവറലെസ് ബാക്ക്‌എൻഡ്, ആധുനിക വെബ് ഡെവലപ്പ്മെന്റ്

### കണ്ടെയ്‌നർ ആപ് - Python Flask  
**സാങ്കേതികവിദ്യകൾ**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**സങ്കീർണത**: നൂതന  
**കരട് ആശയങ്ങൾ**: കണ്ടെയ്‌നറൈസേഷൻ, REST API, സ്കെയിൽ-ടു-സീറോ, ഹെൽത്ത് പ്രോബുകൾ, മോണിറ്ററിംഗ്  
**സ്ഥാനം**: [പ്രാദേശിക ഉദാഹരണം](../../../examples/container-app/simple-flask-api)

### കണ്ടെയ്‌നർ ആപ് - മൈക്രോസർവീസസ് ആർക്കിടെക്ചർ  
**സാങ്കേതികവിദ്യകൾ**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**സങ്കീർണത**: അഡ്വാൻസ്ഡ്  
**കരട് ആശയങ്ങൾ**: മൾട്ടി-സർവീസ് ആർക്കിടെക്ചർ, സർവീസ് കമ്മ്യൂണിക്കേഷൻ, മെസേജ് ക്യൂയിംഗ്, ഡിസ്‌ട്രിബ്യൂട്ടഡ് ട്രേസിംഗ്  
**സ്ഥാനം**: [പ്രാദേശിക ഉദാഹരണം](../../../examples/container-app/microservices)

### ഡാറ്റാബേസ് ആപ് - C# Azure SQL ഉപയോഗിച്ച്  
**സാങ്കേതികവിദ്യകൾ**: C# ASP.NET കോർ, Azure SQL ഡാറ്റാബേസ്, ആപ്പ് സർവീസ്  
**സങ്കീർണത**: ഇടത്തരം  
**കരട് ആശയങ്ങൾ**: Entity Framework, ഡാറ്റാബേസ് കണക്ഷനുകൾ, വെബ് API വികസനം

### സർവറലെസ് ഫംഗ്ഷൻ - Python Azure Functions  
**സാങ്കേതികവിദ്യകൾ**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**സങ്കീർണത**: ഇടത്തരം  
**കരട് ആശയങ്ങൾ**: ഇവന്റ്-ഡ്രിവൻ ആർക്കിടെക്ചർ, സർവറലെസ് കമ്പ്യൂട്ടിംഗ്, ഫുൾ-സ്റ്റാക്ക് ഡെവലപ്പ്മെന്റ്

### മൈക്രോസർവീസസ് - Java Spring Boot  
**സാങ്കേതികവിദ്യകൾ**: Java Spring Boot, Container Apps, Service Bus, API ഗേറ്റ്‌വെ  
**സങ്കീർണത**: ഇടത്തരം  
**കരട് ആശയങ്ങൾ**: മൈക്രോസർവീസ് കമ്മ്യൂണിക്കേഷൻ, ഡിസ്‌ട്രിബ്യൂട്ടഡ് സിസ്റ്റങ്ങൾ, എന്റർപ്രൈസ് മാതൃകകൾ

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App  
**സാങ്കേതികവിദ്യകൾ**: Microsoft Foundry Models, Cognitive Search, App Service  
**സങ്കീർണത**: ഇടത്തരം  
**കരട് ആശയങ്ങൾ**: RAG ആർക്കിടെക്ചർ, വെക്ടർ സെർച്ച്, LLM ഇന്റഗ്രേഷൻ

#### AI Document Processing  
**സാങ്കേതികവിദ്യകൾ**: Azure AI Document Intelligence, സ്റ്റോറേജ്, Functions  
**സങ്കീർണത**: ഇടത്തരം  
**കരട് ആശയങ്ങൾ**: ഡോക്യുമെന്റ് അനാലിസിസ്, OCR, ഡാറ്റ എക്സ്‌ട്രാക്ഷൻ

#### Machine Learning Pipeline  
**സാങ്കേതികവിദ്യകൾ**: Azure ML, MLOps, Container Registry  
**സങ്കീർണത**: അഡ്വാൻസ്ഡ്  
**കരട് ആശയങ്ങൾ**: മോഡൽ ട്രെയിനിംഗ്, ഡിപ്ലോയ്മെന്റ് പൈപ്പ്‌ലൈനുകൾ, മോണിറ്ററിംഗ്

## 🛠 കോൺഫിഗറേഷൻ ഉദാഹരണങ്ങൾ

`configurations/` ഡയറക്ടറിയിൽ പുനരുപയോഗയോഗ്യമായ ഘടകങ്ങൾ:

### പരിസ്ഥിതി കോൺഫിഗറേഷനുകൾ  
- ഡെവലപ്പ്മെന്റ് പരിസ്ഥിതി ക്രമീകരണങ്ങൾ  
- സ്റ്റേജിംഗ് പരിസ്ഥിതി കോൺഫിഗറേഷനുകൾ  
- പ്രൊഡക്ഷൻ റെഡി കോൺഫിഗറേഷനുകൾ  
- മൾട്ടി-റിയജൻ ഡിപ്ലോയ്മെന്റ് സെറ്റപ്പുകൾ

### ബിസെപ് മോഡ്യൂളുകൾ  
- പുനരുപയോഗയോഗ്യമായ ഇൻഫ്രാസ്ട്രക്ചർ ഘടകങ്ങൾ  
- സാധാരണ റിസോഴ്‌സ് മാതൃകകൾ  
- സുരക്ഷ ഉറപ്പു ടെംപ്ലേറ്റുകൾ  
- ചെലവ്-മേൽവിലയിൽ കോൺഫിഗറേഷനുകൾ

### സഹായകര സ്‌ക്രിപ്റ്റുകൾ  
- പരിസ്ഥിതി സജ്ജീകരണ ഓട്ടോമേഷൻ  
- ഡാറ്റാബേസ് മൈഗ്രേഷൻ സ്‌ക്രിപ്റ്റുകൾ  
- ഡിപ്ലോയ്‌മെന്റ് പരിശോധന ഉപകരണങ്ങൾ  
- ചെലവ് മോണിറ്ററിംഗ് ഉപകരണം  

## 🔧 കസ്റ്റമൈസേഷൻ ഗൈഡ്

### നിങ്ങളുടെ ഉപയോഗത്തിനായി ഉദാഹരണങ്ങൾ ഇനംതിരുത്തൽ

1. **മുൻപരിഭാഷകൾ പരിശോധിക്കുക**  
   - Azure സേവന ആവശ്യകതകൾ പരിശോധിക്കുക  
   - സബ്‌സ്‌ക്രിപ്ഷൻ പരിധികൾ ഉറപ്പാക്കുക  
   - ചെലവ് ബാധ്യതകൾ മനസ്സിലാക്കുക  

2. **കോൺഫിഗറേഷൻമാറ്റം**  
   - `azure.yaml` സർവീസ് നിർവചനങ്ങൾ പുതുക്കുക  
   - ബിസെപ് ടെംപ്ലേറ്റുകൾ ഇനംതിരുത്തുക  
   - പരിസ്ഥിതി മാറ്ററുകൾ ക്രമീകരിക്കുക  

3. **വിവരത്തിലുള്ള പരിശോധന**  
   - ആദ്യം ഡെവലപ്പ്മെന്റ് പരിസ്ഥിതിയിൽ ഡിപ്ലോയ് ചെയ്യുക  
   - ഫംഗ്ഷണാലിറ്റി വരാംശം പരിശോധിക്കുക  
   - സ്കെയ്‌ലിംഗ്, പ്രകടനം പരീക്ഷിക്കുക  

4. **സുരക്ഷാ അവലോകനം**  
   - ആക്സസ് നിയന്ത്രണങ്ങൾ പരിശോധിക്കുക  
   - സീക്രട്ട് മാനേജ്മെന്റ് നടപ്പിലാക്കുക  
   - മോണിറ്ററിംഗ്, അലംബന സജ്ജമാക്കുക  

## 📊 താരതമ്യ മാട്രിക്സ്

| ഉദാഹരണം | സർവീസുകൾ | ഡാറ്റാബേസ് | ഓത് | മോണിറ്ററിംഗ് | സങ്കീർണത |  
|---------|----------|----------|------|------------|------------|  
| **Microsoft Foundry Models Chat** (പ്രാദേശികം) | 2 | ❌ | കീ വാൾറ്റ് | ഫുൾ | ⭐⭐ |  
| **Python Flask API** (പ്രാദേശികം) | 1 | ❌ | അടിസ്ഥാന | ഫുൾ | ⭐ |  
| **Microservices** (പ്രാദേശികം) | 5+ | ✅ | എന്റർപ്രൈസ് | അഡ്വാൻസ്ഡ് | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | അടിസ്ഥാന | അടിസ്ഥാന | ⭐ |  
| React SPA + Functions | 3 | ✅ | അടിസ്ഥാന | ഫുൾ | ⭐ |  
| Python Flask Container | 2 | ❌ | അടിസ്ഥാന | ഫുൾ | ⭐ |  
| C# Web API + SQL | 2 | ✅ | ഫുൾ | ഫുൾ | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | ഫുൾ | ഫുൾ | ⭐⭐ |  
| Java Microservices | 5+ | ✅ | ഫുൾ | ഫുൾ | ⭐⭐ |  
| Microsoft Foundry Models Chat | 3 | ✅ | ഫുൾ | ഫുൾ | ⭐⭐⭐ |  
| AI Document Processing | 2 | ❌ | അടിസ്ഥാന | ഫുൾ | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | ഫുൾ | ഫുൾ | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (പ്രാദേശികം) | **8+** | **✅** | **എന്റർപ്രൈസ്** | **അഡ്വാൻസ്ഡ്** | **⭐⭐⭐⭐** |

## 🎓 പഠന പാത

### ശുപാർശ ചെയ്യുന്ന പുരോഗതി

1. **سادി वेब ആപ്പ് മുതൽ ആരംഭിക്കുക**  
   - അടിസ്ഥാന AZD ആശയങ്ങൾ പഠിക്കുക  
   - ഡിപ്ലോയ്മെന്റ് ഫ്ലോ മനസ്സിലാക്കുക  
   - പരിസ്ഥിതി മാനേജുമെന്റ് അഭ്യാസം നടത്തുക  

2. **സ്റ്റാറ്റിക് വെബ്സൈറ്റ് പരീക്ഷിക്കുക**  
   - വ്യത്യസ്ത ഹോസ്റ്റിംഗ് ഓപ്ഷനുകൾ നോക്കുക  
   - CDN ഇന്റഗ്രേഷൻ പഠിക്കുക  
   - DNS കോൺഫിഗറേഷൻ മനസ്സിലാക്കുക  

3. **കണ്ടെയ്‌നർ ആപ്പിലേക്ക് നീങ്ങുക**  
   - കണ്ടെയ്‌നറൈസേഷൻ അടിസ്ഥാനങ്ങൾ പഠിക്കുക  
   - സ്കെയിലിംഗ് ആശയങ്ങൾ മനസ്സിലാക്കുക  
   - ഡോക്കർ ഉപയോഗിച്ച് പരിചയപ്പെടുക  

4. **ഡാറ്റാബേസ് ഇന്റഗ്രേഷൻ ചേർക്കുക**  
   - ഡാറ്റാബേസ് പ്രാവിദനിംഗ് പഠിക്കുക  
   - കണക്ഷൻ സ്റ്റ്രിങ്ങുകൾ മനസ്സിലാക്കുക  
   - സീക്രറ്റ്സ് മാനേജ്മെന്റ് അഭ്യാസം നടത്തുക  

5. **സർവറലെസ് ആർക്കിടെക്ചർ പരീക്ഷിക്കുക**  
   - ഇവന്റ്-ഡ്രിവൻ ആർക്കിടെക്ചർ പഠിക്കുക  
   - ട്രിഗേഴുകളും ബൈൻഡിംഗുകളും മനസ്സിലാക്കുക  
   - API-കളുമായി പരിചിതമാകുക  

6. **മൈക്രോസർവീസസ് വികസിപ്പിക്കുക**  
   - സർവീസ് കമ്മ്യൂണിക്കേഷൻ പഠിക്കുക  
   - ഡിസ്‌ട്രിബ്യൂട്ടഡ് സിസ്റ്റങ്ങൾ മനസ്സിലാക്കുക  
   - സങ്കീർണ ഡിപ്ലോയ്മെന്റുകൾ അഭ്യാസം നടത്തുക  

## 🔍 ശരിയായ ഉദാഹരണം കണ്ടെത്തൽ

### സാങ്കേതിക സ്റ്റാക്ക് പ്രകാരം  
- **Container Apps**: [Python Flask API (പ്രാദേശികം)](../../../examples/container-app/simple-flask-api), [Microservices (പ്രാദേശികം)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (പ്രാദേശികം)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (പ്രാദേശികം)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (പ്രാദേശികം)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (പ്രാദേശികം)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [Microservices User Service (പ്രാദേശികം)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **Containers**: [Python Flask (പ്രാദേശികം)](../../../examples/container-app/simple-flask-api), [Microservices (പ്രാദേശികം)](../../../examples/container-app/microservices), Java Microservices  
- **Databases**: [Microservices (പ്രാദേശികം)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models Chat (പ്രാദേശികം)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**  
- **OpenAI ഇന്റഗ്രേഷൻ**: **[Microsoft Foundry Models Chat (പ്രാദേശികം)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **എന്റർപ്രൈസ് പ്രൊഡക്ഷൻ**: [Microservices (പ്രാദേശികം)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### ആർക്കിടെക്ചർ മാതൃക അനുസരിച്ച്  
- **സിംപിൾ REST API**: [Python Flask API (പ്രാദേശികം)](../../../examples/container-app/simple-flask-api)  
- **മൊണോളിതിക്**: Node.js Express Todo, C# Web API + SQL  
- **സ്റ്റാറ്റിക് + സർവറലെസ്**: React SPA + Functions, Python Functions + SPA  
- **മൈക്രോസർവീസസ്**: [Production Microservices (പ്രാദേശികം)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **കണ്ടെയ്‌നറൈസ്ഡ്**: [Python Flask (പ്രാദേശികം)](../../../examples/container-app/simple-flask-api), [Microservices (പ്രാദേശികം)](../../../examples/container-app/microservices)  
- **AI-പവർഡ്**: **[Microsoft Foundry Models Chat (പ്രാദേശികം)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **മൾട്ടി-ഏജന്റ് ആർക്കിടെക്ചർ**: **Retail Multi-Agent Solution**  
- **എന്റർപ്രൈസ് മൾട്ടി-സർവീസ്**: [Microservices (പ്രാദേശികം)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### സങ്കീർണത നിരപ്പ്  
- **നൂതന**: [Python Flask API (പ്രാദേശികം)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **ഇടത്തരം**: **[Microsoft Foundry Models Chat (പ്രാദേശികം)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing  
- **അഡ്വാൻസ്ഡ്**: ML Pipeline  
- **എന്റർപ്രൈസ് പ്രൊഡക്ഷൻ റെഡി**: [Microservices (പ്രാദേശികം)](../../../examples/container-app/microservices) (മൾട്ടി-സർവീസ് ക്യൂയിംഗ്), **Retail Multi-Agent Solution** (പൂർണ്ണമായ മൾട്ടി-ഏജന്റ് സിസ്റ്റം ARM ടെംപ്ലേറ്റ് ഡിപ്ലോയ്മെന്റോടൊപ്പം)

## 📚 അധിക റിസോഴ്‌സുകൾ

### ഡോക്യുമെന്റേഷൻ ലിങ്കുകൾ  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### കമ്മ്യൂണിറ്റി ഉദാഹരണങ്ങൾ
- [Azure സാമ്പിൾസ് AZD ടെംപ്ലേറ്റുകൾ](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry ടെംപ്ലേറ്റുകൾ](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI ഗ്യാലറി](https://azure.github.io/awesome-azd/)
- [C# һәм Azure SQL ഉപയോഗിച്ച് Todo ആപ്പ്](https://github.com/Azure-Samples/todo-csharp-sql)
- [Python һәм MongoDB ഉപയോഗിച്ച് Todo ആപ്പ്](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js һәм PostgreSQL ഉപയോഗിച്ച് Todo ആപ്പ്](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API-യുള്ള React വെബ് ആപ്പ്](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps ജോബ്](https://github.com/Azure-Samples/container-apps-jobs)
- [Java ഉപയോഗിച്ച് Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### മികച്ച പ്രാക്ടീസുകൾ
- [Azure നന്നായി രൂപകൽപ്പനചെയ്‌ത ഫ്രെയിംവർക്ക്](https://learn.microsoft.com/en-us/azure/well-architected/)
- [ക്ലൗഡ് ദത്തലഭ.Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 ഉദാഹരണങ്ങൾ സംഭാവന ചെയ്യൽ

ഉപകാരപ്രദമായ ഉദാഹരണം പങ്കുവെക്കാൻ ആഗ്രഹിക്കുന്നുണ്ടോ? ഞങ്ങൾ സംഭാവനകൾ സ്വാഗതം ചെയ്യുന്നു!

### സമർപ്പണ മാർഗ്ഗനിർദ്ദേശങ്ങൾ
1. സ്ഥാപിച്ചിട്ടുള്ള ഡയറക്ടറി ഘടന പാലിക്കുക
2. വ്യ്യാപകമായ README.md ഉൾപ്പെടുത്തുക
3. കോൺഫിഗറേഷൻ ഫയലുകളിൽ കമന്റുകൾ ചേർക്കുക
4. സമർപ്പിക്കുന്നതിന് മുൻപ് പൂർണ്ണമായി പരീക്ഷിക്കുക
5. ചെലവ് കണക്കുകൂട്ടലുകളും മുൻവശപ്പെട്ടിട്ടും ഉൾപ്പെടുത്തുക

### ഉദാഹരണ ടെംപ്ലേറ്റ് ഘടന
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

**പ്രൊ ടിപ്പ്**: നിങ്ങളുടെ ടെക്നോളജി സ്റ്റാക്ക് അനുയായിയായ ഏറ്റവും ലളിതമായ ഉദാഹരണത്തോടെ ആരംഭിക്കുക, ശേഷം ക്രമേന കൂടുതൽ സങ്കീർണ്ണ സാഹചര്യങ്ങളിലേക്ക് മുന്നേറുക. ഓരോ ഉദാഹരണവും മുൻവുള്ളവയിൽ നിന്നും ആശയങ്ങൾ ഉപയോഗിച്ച് നിർമ്മിക്കപ്പെട്ടതാണ്!

## 🚀 തുടങ്ങാൻ തയ്യാറായത്?

### നിങ്ങളുടെ പഠന പാത

1. **പൂർണ്ണം തുടങ്ങുന്നവർ?** → [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 മിനിറ്റ്) ഇവിടത്ത് തുടങ്ങുക
2. **അടിസ്ഥ AZD അറിവുള്ളവർക്കു?** → [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 മിനിറ്റ്) പരീക്ഷിക്കുക
3. **AI ആപ്പുകൾ നിർമ്മിക്കുന്നവർ?** → [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 മിനിറ്റ്) ആരംഭിക്കുക അല്ലെങ്കിൽ [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ മണിക്കൂർ) അന്വേഷിക്കുക
4. **പ്രത്യേക ടെക് സ്റ്റാക്ക് ആവശ്യമുണ്ടോ?** → മുകളിൽ കാണുന്ന [Right Example കണ്ടെത്തൽ](#-finding-the-right-example) ഭാഗം ഉപയോഗിക്കുക

### അടുത്ത നടപടികൾ

- ✅ മുകളിൽ പറയുന്ന [പ്രിവ Voraussetzung](#മുൻപരിഭാഷകൾ) പരിശോധിക്കുക
- ✅ നിങ്ങളുടെ പ്രാവീണ്യം അനുസരിച്ചുള്ള ഉദാഹരണം തിരഞ്ഞെടുക്കുക ([സങ്കീർണത ലെജന്റ്](#സങ്കീർണ്ണത-റേറ്റിങ്-ലെജൻഡ്) കാണുക)
- ✅ ഉദാഹരണത്തിന്റെ README ശ്രദ്ധാപൂർവ്വം വായിക്കുക മുൻഡിപ്പ്ലോയ്മെന്റ്
- ✅ പരിശോധന കഴിഞ്ഞ് `azd down` ഓടിക്കാൻ ഓർമ്മപ്പെടുത്തൽ സജ്ജമാക്കുക
- ✅ നിങ്ങളുടെ അനുഭവം GitHub Issues അല്ലെങ്കിൽ Discussions വഴി പങ്കുവെക്കുക

### സഹായം വേണോ?

- 📖 [അक्सर ചോദിക്കപ്പെടുന്ന പ്രശ്നങ്ങൾ](../resources/faq.md) - സാധാരണ ചോദ്യങ്ങൾക്കുള്ള ഉത്തരങ്ങൾ
- 🐛 [പ്രശ്ന പരിഹാര ഗൈഡ്](../docs/chapter-07-troubleshooting/common-issues.md) - ഡിപ്പ്ലോയ്മെന്റ് പ്രശ്നങ്ങൾ പരിഹരിക്കുക
- 💬 [GitHub ചർച്ചകൾ](https://github.com/microsoft/AZD-for-beginners/discussions) - കമ്മ്യൂണിറ്റിയെ ചോദിക്കുക
- 📚 [പഠന ഗൈഡ്](../resources/study-guide.md) - നിങ്ങളുടെ പഠനം ശക്തിപ്പെടുത്തുക

---

**നാവിഗേഷൻ**
- **📚 കോഴ്‌സ് ഹോം**: [AZD ആദ്യപടങ്ങൾ](../README.md)
- **📖 പഠന സാമഗ്രികൾ**: [പഠന ഗൈഡ്](../resources/study-guide.md) | [ചീറ്റ്ഷീറ്റ്](../resources/cheat-sheet.md) | [ഗ്ലോസറി](../resources/glossary.md)
- **🔧 വിഭവങ്ങൾ**: [അक्सर ചോദിക്കപ്പെടുന്ന ചോദ്യങ്ങൾ](../resources/faq.md) | [പ്രശ്ന പരിഹാരം](../docs/chapter-07-troubleshooting/common-issues.md)

---

*യഥാർത്ഥമായി അപ്ഡേറ്റ് ചെയ്തത്: നവംബർ 2025 | [പ്രശ്നങ്ങൾ റിപ്പോർട്ട് ചെയ്യുക](https://github.com/microsoft/AZD-for-beginners/issues) | [ഉദാഹരണങ്ങൾ സംഭാവന ചെയ്യുക](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അസൂയിപ്പ്**:  
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യത കൈവരിക്കാൻ പരിശ്രമിയ്ക്കുന്നുെങ്കിലും, ഓട്ടോമാറ്റിക് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റിദ്ധാരണകൾ ഉണ്ടാകാം എന്ന് ദയവായി ശ്രദ്ധിക്കുക. ആധികാരിക സ്രോതസ്സ് നൂറ് ശതമാനം ശരിയായ ഭാഷയിൽ ഉള്ള അത്യ 原 документ 应 considered വേണം. നിർണായക വിവരങ്ങൾക്കായി, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ നിർബന്ധമാണ്. ഈ പരിഭാഷ ഉപയോഗിച്ചുവ γενതികൾ അല്ലെങ്കിൽ തെറ്റിദ്ധാരണകൾ ഉണ്ടെങ്കിൽ ഞങ്ങൾ ഉത്തരവാദിത്തമൊള്ളതല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
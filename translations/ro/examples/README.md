<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a896781acb2a7bebb3c4c66c4f46e7f",
  "translation_date": "2025-11-23T16:44:13+00:00",
  "source_file": "examples/README.md",
  "language_code": "ro"
}
-->
# Exemple - Șabloane și Configurații Practice AZD

**Învățare prin Exemple - Organizate pe Capitole**
- **📚 Acasă la Curs**: [AZD Pentru Începători](../README.md)
- **📖 Mapare Capitole**: Exemple organizate după complexitatea învățării
- **🚀 Exemplu Local**: [Soluție Multi-Agent pentru Retail](retail-scenario.md)
- **🤖 Exemple AI Externe**: Linkuri către depozite Azure Samples

> **📍 IMPORTANT: Exemple Locale vs Externe**  
> Acest depozit conține **4 exemple locale complete** cu implementări complete:  
> - **Azure OpenAI Chat** (implementare GPT-4 cu interfață de chat)  
> - **Container Apps** (API simplu Flask + Microservicii)  
> - **Database App** (Web + Bază de date SQL)  
> - **Retail Multi-Agent** (Soluție AI pentru Enterprise)  
>  
> Exemplele suplimentare sunt **referințe externe** către depozite Azure-Samples pe care le puteți clona.

## Introducere

Acest director oferă exemple practice și referințe pentru a vă ajuta să învățați Azure Developer CLI prin practică. Scenariul Retail Multi-Agent este o implementare completă, gata de producție, inclusă în acest depozit. Exemplele suplimentare fac referire la Azure Samples oficiale care demonstrează diverse modele AZD.

### Legendă Rating Complexitate

- ⭐ **Începător** - Concepte de bază, un singur serviciu, 15-30 minute
- ⭐⭐ **Intermediar** - Mai multe servicii, integrare bază de date, 30-60 minute
- ⭐⭐⭐ **Avansat** - Arhitectură complexă, integrare AI, 1-2 ore
- ⭐⭐⭐⭐ **Expert** - Gata de producție, modele enterprise, 2+ ore

## 🎯 Ce conține acest depozit

### ✅ Implementare Locală (Gata de utilizare)

#### [Aplicație Azure OpenAI Chat](azure-openai-chat/README.md) 🆕
**Implementare completă GPT-4 cu interfață de chat inclusă în acest depozit**

- **Locație:** `examples/azure-openai-chat/`
- **Complexitate:** ⭐⭐ (Intermediar)
- **Ce este inclus:**
  - Implementare completă Azure OpenAI (GPT-4)
  - Interfață de chat Python în linia de comandă
  - Integrare Key Vault pentru chei API securizate
  - Șabloane de infrastructură Bicep
  - Urmărirea utilizării token-urilor și costurilor
  - Limitarea ratei și gestionarea erorilor

**Start Rapid:**
```bash
# Navigați la exemplu
cd examples/azure-openai-chat

# Implementați totul
azd up

# Instalați dependențele și începeți să conversați
pip install -r src/requirements.txt
python src/chat.py
```

**Tehnologii:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Exemple Container App](container-app/README.md) 🆕
**Exemple complete de implementare container incluse în acest depozit**

- **Locație:** `examples/container-app/`
- **Complexitate:** ⭐-⭐⭐⭐⭐ (De la Începător la Avansat)
- **Ce este inclus:**
  - [Ghid Principal](container-app/README.md) - Prezentare completă a implementărilor container
  - [API Flask Simplu](../../../examples/container-app/simple-flask-api) - Exemplu de API REST de bază
  - [Arhitectură Microservicii](../../../examples/container-app/microservices) - Implementare multi-serviciu gata de producție
  - Modele Start Rapid, Producție și Avansate
  - Monitorizare, securitate și optimizare costuri

**Start Rapid:**
```bash
# Vizualizați ghidul principal
cd examples/container-app

# Implementați API Flask simplu
cd simple-flask-api
azd up

# Implementați exemplul de microservicii
cd ../microservices
azd up
```

**Tehnologii:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Soluție Multi-Agent pentru Retail](retail-scenario.md) 🆕
**Implementare completă gata de producție inclusă în acest depozit**

- **Locație:** `examples/retail-multiagent-arm-template/`
- **Complexitate:** ⭐⭐⭐⭐ (Avansat)
- **Ce este inclus:**
  - Șablon complet de implementare ARM
  - Arhitectură multi-agent (Client + Inventar)
  - Integrare Azure OpenAI
  - Căutare AI cu RAG
  - Monitorizare cuprinzătoare
  - Script de implementare cu un singur clic

**Start Rapid:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tehnologii:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Exemple Externe Azure Samples (Clonează pentru utilizare)

Următoarele exemple sunt menținute în depozite oficiale Azure-Samples. Clonează-le pentru a explora diferite modele AZD:

### Aplicații Simple (Capitolele 1-2)

| Șablon | Depozit | Complexitate | Servicii |
|:-------|:--------|:------------|:---------|
| **API Flask Python** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservicii** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-serviciu, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Container Flask Python** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Cum să folosești:**
```bash
# Clonează orice exemplu
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Desfășoară
azd up
```

### Exemple Aplicații AI (Capitolele 2, 5, 8)

| Șablon | Depozit | Complexitate | Focus |
|:-------|:--------|:------------|:------|
| **Azure OpenAI Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Implementare GPT-4 |
| **Start Rapid AI Chat** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat AI de bază |
| **Agenți AI** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Cadru pentru agenți |
| **Demo Căutare + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Model RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI pentru Enterprise |

### Baze de Date & Modele Avansate (Capitolele 3-8)

| Șablon | Depozit | Complexitate | Focus |
|:-------|:--------|:------------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrare bază de date |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Microservicii Java** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-serviciu |
| **Pipeline ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Obiective de Învățare

Prin lucrul cu aceste exemple, veți:
- Exersa fluxurile de lucru Azure Developer CLI cu scenarii realiste de aplicații
- Înțelege diferite arhitecturi de aplicații și implementările lor AZD
- Stăpâni modelele Infrastructure as Code pentru diverse servicii Azure
- Aplica strategii de gestionare a configurației și implementări specifice mediului
- Implementa modele de monitorizare, securitate și scalare în contexte practice
- Dobândi experiență în depanarea și rezolvarea problemelor în scenarii reale de implementare

## Rezultate de Învățare

După finalizarea acestor exemple, veți putea:
- Implementa cu încredere diverse tipuri de aplicații folosind Azure Developer CLI
- Adapta șabloanele furnizate la cerințele proprii ale aplicației
- Proiecta și implementa modele personalizate de infrastructură folosind Bicep
- Configura aplicații complexe multi-serviciu cu dependențe corecte
- Aplica cele mai bune practici de securitate, monitorizare și performanță în scenarii reale
- Depana și optimiza implementările bazate pe experiență practică

## Structura Directorului

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

## Exemple Start Rapid

> **💡 Nou în AZD?** Începeți cu exemplul #1 (API Flask) - durează ~20 minute și învață concepte de bază.

### Pentru Începători
1. **[Container App - API Flask Python](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Implementați un API REST simplu cu scale-to-zero  
   **Timp:** 20-25 minute | **Cost:** $0-5/lună  
   **Ce veți învăța:** Flux de lucru azd de bază, containerizare, sonde de sănătate  
   **Rezultat așteptat:** Endpoint API funcțional care returnează "Hello, World!" cu monitorizare

2. **[Aplicație Web Simplă - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Implementați o aplicație web Node.js Express cu MongoDB  
   **Timp:** 25-35 minute | **Cost:** $10-30/lună  
   **Ce veți învăța:** Integrare bază de date, variabile de mediu, stringuri de conexiune  
   **Rezultat așteptat:** Aplicație de listă de sarcini cu funcționalități de creare/citire/actualizare/ștergere

3. **[Website Static - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Găzduiți un website static React cu Azure Static Web Apps  
   **Timp:** 20-30 minute | **Cost:** $0-10/lună  
   **Ce veți învăța:** Găzduire statică, funcții serverless, implementare CDN  
   **Rezultat așteptat:** UI React cu backend API, SSL automat, CDN global

### Pentru Utilizatori Intermediari
4. **[Aplicație Azure OpenAI Chat](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Implementați GPT-4 cu interfață de chat și gestionare securizată a cheilor API  
   **Timp:** 35-45 minute | **Cost:** $50-200/lună  
   **Ce veți învăța:** Implementare Azure OpenAI, integrare Key Vault, urmărirea token-urilor  
   **Rezultat așteptat:** Aplicație de chat funcțională cu GPT-4 și monitorizare costuri

5. **[Container App - Microservicii](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Arhitectură multi-serviciu gata de producție  
   **Timp:** 45-60 minute | **Cost:** $50-150/lună  
   **Ce veți învăța:** Comunicare între servicii, cozi de mesaje, trasare distribuită  
   **Rezultat așteptat:** Sistem cu 2 servicii (API Gateway + Product Service) cu monitorizare

6. **[Aplicație Bază de Date - C# cu Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplicație web cu API C# și Azure SQL Database  
   **Timp:** 30-45 minute | **Cost:** $20-80/lună  
   **Ce veți învăța:** Entity Framework, migrații baze de date, securitate conexiuni  
   **Rezultat așteptat:** API C# cu backend Azure SQL, implementare automată a schemei

7. **[Funcție Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Funcții Azure Python cu trigger HTTP și Cosmos DB  
   **Timp:** 30-40 minute | **Cost:** $10-40/lună  
   **Ce veți învăța:** Arhitectură bazată pe evenimente, scalare serverless, integrare NoSQL  
   **Rezultat așteptat:** Aplicație funcțională care răspunde la cereri HTTP cu stocare Cosmos DB

8. **[Microservicii - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplicație Java multi-serviciu cu Container Apps și API gateway  
   **Timp:** 60-90 minute | **Cost:** $80-200/lună  
   **Ce veți învăța:** Implementare Spring Boot, rețea de servicii, echilibrare încărcare  
   **Rezultat așteptat:** Sistem Java multi-serviciu cu descoperire și rutare servicii

### Șabloane Azure AI Foundry

1. **[Aplicație Azure OpenAI Chat - Exemplu Local](../../../examples/azure-openai-chat)** ⭐⭐  
   Implementare completă GPT-4 cu interfață de chat  
   **Timp:** 35-45 minute | **Cost:** $50-200/lună  
   **Rezultat așteptat:** Aplicație de chat funcțională cu urmărirea token-urilor și monitorizarea costurilor

2. **[Demo Căutare + OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplicație inteligentă de chat cu arhitectură RAG  
   **Timp:** 60-90 minute | **Cost:** $100-300/lună  
   **Rezultat așteptat:** Interfață de chat alimentată de RAG cu căutare documente și citări

3. **[Procesare Documente AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analiza documentelor folosind servicii Azure AI  
   **Timp:** 40-60 minute | **Cost:** $20-80/lună  
   **Rezultat așteptat:** API care extrage text, tabele și entități din documente încărcate

4. **[Pipeline Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Flux de lucru MLOps cu Azure Machine Learning  
   **Timp:** 2-3 ore | **Cost:** $150-500/lună  
   **Rezultat așteptat:** Pipeline ML automatizat cu antrenare, implementare și monitorizare

### Scenarii din Lumea Reală

#### **Soluție Multi-Agent pentru Retail** 🆕
**[Ghid de Implementare Complet](./retail-scenario.md)**

O soluție cuprinzătoare, gata de producție, pentru suport clienți multi-agent care demonstrează implementarea aplicațiilor AI de nivel enterprise cu AZD. Acest scenariu oferă:

- **Arhitectură Completă**: Sistem multi-agent cu agenți specializați pentru servicii clienți și gestionarea inventarului
- **Infrastructură de Producție**: Implementări Azure OpenAI multi-regiune, AI Search, Container Apps și monitorizare cuprinzătoare  
- **Șablon ARM Gata de Implementare**: Implementare cu un singur clic cu moduri multiple de configurare (Minimal/Standard/Premium)  
- **Funcționalități Avansate**: Validare de securitate red teaming, cadru de evaluare a agenților, optimizare a costurilor și ghiduri de depanare  
- **Context Real de Afaceri**: Caz de utilizare pentru suport clienți în retail cu încărcare de fișiere, integrare de căutare și scalare dinamică  

**Tehnologii**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Complexitate**: ⭐⭐⭐⭐ (Avansat - Gata pentru Producție la Nivel de Întreprindere)  

**Ideal pentru**: Dezvoltatori AI, arhitecți de soluții și echipe care construiesc sisteme multi-agent pentru producție  

**Start Rapid**: Implementați soluția completă în mai puțin de 30 de minute folosind șablonul ARM inclus cu `./deploy.sh -g myResourceGroup`  

## 📋 Instrucțiuni de Utilizare  

### Cerințe Prealabile  

Înainte de a rula orice exemplu:  
- ✅ Abonament Azure cu acces de tip Owner sau Contributor  
- ✅ Azure Developer CLI instalat ([Ghid de Instalare](../docs/getting-started/installation.md))  
- ✅ Docker Desktop activ (pentru exemplele cu containere)  
- ✅ Cote Azure adecvate (verificați cerințele specifice fiecărui exemplu)  

> **💰 Avertisment privind Costurile:** Toate exemplele creează resurse reale Azure care generează costuri. Consultați fișierele README individuale pentru estimări de costuri. Nu uitați să rulați `azd down` când ați terminat pentru a evita costuri continue.  

### Rularea Exemplului Local  

1. **Clonați sau Copiați Exemplul**  
   ```bash
   # Navigați la exemplul dorit
   cd examples/simple-web-app
   ```
  
2. **Inițializați Mediul AZD**  
   ```bash
   # Inițializează cu șablonul existent
   azd init
   
   # Sau creează un mediu nou
   azd env new my-environment
   ```
  
3. **Configurați Mediul**  
   ```bash
   # Setează variabilele necesare
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Implementați**  
   ```bash
   # Implementați infrastructura și aplicația
   azd up
   ```
  
5. **Verificați Implementarea**  
   ```bash
   # Obține punctele finale ale serviciului
   azd env get-values
   
   # Testează punctul final (exemplu)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Indicatori de Succes Așteptați:**  
   - ✅ `azd up` se finalizează fără erori  
   - ✅ Endpoint-ul serviciului returnează HTTP 200  
   - ✅ Portalul Azure afișează statusul "Running"  
   - ✅ Application Insights primește telemetrie  

> **⚠️ Probleme?** Consultați [Probleme Comune](../docs/troubleshooting/common-issues.md) pentru depanare în timpul implementării  

### Adaptarea Exemplului  

Fiecare exemplu include:  
- **README.md** - Instrucțiuni detaliate de configurare și personalizare  
- **azure.yaml** - Configurare AZD cu comentarii  
- **infra/** - Șabloane Bicep cu explicații pentru parametri  
- **src/** - Codul aplicației exemplu  
- **scripts/** - Scripturi ajutătoare pentru sarcini comune  

## 🎯 Obiective de Învățare  

### Categorii de Exemple  

#### **Implementări de Bază**  
- Aplicații cu un singur serviciu  
- Modele simple de infrastructură  
- Management de configurare de bază  
- Configurații economice pentru dezvoltare  

#### **Scenarii Avansate**  
- Arhitecturi multi-serviciu  
- Configurații complexe de rețea  
- Modele de integrare a bazelor de date  
- Implementări de securitate și conformitate  

#### **Modele Gata pentru Producție**  
- Configurații de înaltă disponibilitate  
- Monitorizare și observabilitate  
- Integrare CI/CD  
- Configurații pentru recuperare în caz de dezastru  

## 📖 Descrierea Exemplului  

### Aplicație Web Simplă - Node.js Express  
**Tehnologii**: Node.js, Express, MongoDB, Container Apps  
**Complexitate**: Începător  
**Concepte**: Implementare de bază, REST API, integrare cu baze de date NoSQL  

### Website Static - React SPA  
**Tehnologii**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexitate**: Începător  
**Concepte**: Găzduire statică, backend serverless, dezvoltare web modernă  

### Aplicație Container - Python Flask  
**Tehnologii**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexitate**: Începător  
**Concepte**: Containerizare, REST API, scale-to-zero, probe de sănătate, monitorizare  
**Locație**: [Exemplu Local](../../../examples/container-app/simple-flask-api)  

### Aplicație Container - Arhitectură Microservicii  
**Tehnologii**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexitate**: Avansat  
**Concepte**: Arhitectură multi-serviciu, comunicare între servicii, cozi de mesaje, trasabilitate distribuită  
**Locație**: [Exemplu Local](../../../examples/container-app/microservices)  

### Aplicație cu Bază de Date - C# cu Azure SQL  
**Tehnologii**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexitate**: Intermediar  
**Concepte**: Entity Framework, conexiuni la baze de date, dezvoltare web API  

### Funcție Serverless - Python Azure Functions  
**Tehnologii**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexitate**: Intermediar  
**Concepte**: Arhitectură bazată pe evenimente, calcul serverless, dezvoltare full-stack  

### Microservicii - Java Spring Boot  
**Tehnologii**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexitate**: Intermediar  
**Concepte**: Comunicare între microservicii, sisteme distribuite, modele pentru întreprinderi  

### Exemple Azure AI Foundry  

#### Aplicație Chat Azure OpenAI  
**Tehnologii**: Azure OpenAI, Cognitive Search, App Service  
**Complexitate**: Intermediar  
**Concepte**: Arhitectură RAG, căutare vectorială, integrare LLM  

#### Procesare Documente AI  
**Tehnologii**: Azure AI Document Intelligence, Storage, Functions  
**Complexitate**: Intermediar  
**Concepte**: Analiză documente, OCR, extragere de date  

#### Pipeline de Machine Learning  
**Tehnologii**: Azure ML, MLOps, Container Registry  
**Complexitate**: Avansat  
**Concepte**: Antrenare modele, pipeline-uri de implementare, monitorizare  

## 🛠 Exemple de Configurare  

Directorul `configurations/` conține componente reutilizabile:  

### Configurări de Mediu  
- Setări pentru mediu de dezvoltare  
- Configurări pentru mediu de testare  
- Configurări gata de producție  
- Configurări pentru implementări multi-regiune  

### Module Bicep  
- Componente de infrastructură reutilizabile  
- Modele comune de resurse  
- Șabloane securizate  
- Configurări optimizate pentru costuri  

### Scripturi Ajutătoare  
- Automatizare pentru configurarea mediului  
- Scripturi pentru migrarea bazelor de date  
- Instrumente de validare a implementării  
- Utilitare pentru monitorizarea costurilor  

## 🔧 Ghid de Personalizare  

### Adaptarea Exemplului la Cazul Dvs.  

1. **Revizuiți Cerințele Prealabile**  
   - Verificați cerințele serviciilor Azure  
   - Verificați limitele abonamentului  
   - Înțelegeți implicațiile financiare  

2. **Modificați Configurarea**  
   - Actualizați definițiile serviciilor din `azure.yaml`  
   - Personalizați șabloanele Bicep  
   - Ajustați variabilele de mediu  

3. **Testați Temeinic**  
   - Implementați mai întâi în mediul de dezvoltare  
   - Validați funcționalitatea  
   - Testați scalarea și performanța  

4. **Revizuire de Securitate**  
   - Revizuiți controalele de acces  
   - Implementați managementul secretelor  
   - Activați monitorizarea și alertele  

## 📊 Matrice de Comparație  

| Exemplu | Servicii | Bază de Date | Autentificare | Monitorizare | Complexitate |  
|---------|----------|--------------|---------------|--------------|--------------|  
| **Azure OpenAI Chat** (Local) | 2 | ❌ | Key Vault | Complet | ⭐⭐ |  
| **Python Flask API** (Local) | 1 | ❌ | Basic | Complet | ⭐ |  
| **Microservicii** (Local) | 5+ | ✅ | Enterprise | Avansat | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |  
| React SPA + Functions | 3 | ✅ | Basic | Complet | ⭐ |  
| Python Flask Container | 2 | ❌ | Basic | Complet | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Complet | Complet | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Complet | Complet | ⭐⭐ |  
| Java Microservicii | 5+ | ✅ | Complet | Complet | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Complet | Complet | ⭐⭐⭐ |  
| AI Document Processing | 2 | ❌ | Basic | Complet | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | Complet | Complet | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Avansat** | **⭐⭐⭐⭐** |  

## 🎓 Parcurs de Învățare  

### Progres Recomandat  

1. **Începeți cu Aplicația Web Simplă**  
   - Învățați conceptele de bază AZD  
   - Înțelegeți fluxul de lucru pentru implementare  
   - Exersați managementul mediului  

2. **Încercați Website-ul Static**  
   - Explorați opțiuni diferite de găzduire  
   - Învățați despre integrarea CDN  
   - Înțelegeți configurarea DNS  

3. **Treceți la Aplicația Container**  
   - Învățați elementele de bază ale containerizării  
   - Înțelegeți conceptele de scalare  
   - Exersați cu Docker  

4. **Adăugați Integrarea cu Baza de Date**  
   - Învățați despre aprovizionarea bazelor de date  
   - Înțelegeți stringurile de conexiune  
   - Exersați managementul secretelor  

5. **Explorați Serverless**  
   - Înțelegeți arhitectura bazată pe evenimente  
   - Învățați despre trigger-uri și legături  
   - Exersați cu API-uri  

6. **Construiți Microservicii**  
   - Învățați comunicarea între servicii  
   - Înțelegeți sistemele distribuite  
   - Exersați implementări complexe  

## 🔍 Găsirea Exemplului Potrivit  

### După Tehnologie  
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservicii (Local)](../../../examples/container-app/microservices), Java Microservicii  
- **Node.js**: Node.js Express Todo App, [Microservicii API Gateway (Local)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservicii Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservicii Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Go**: [Microservicii User Service (Local)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservicii  
- **React**: React SPA + Functions  
- **Containere**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservicii (Local)](../../../examples/container-app/microservices), Java Microservicii  
- **Baze de Date**: [Microservicii (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Sisteme Multi-Agent**: **Retail Multi-Agent Solution**  
- **Integrare OpenAI**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Producție la Nivel de Întreprindere**: [Microservicii (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### După Model Arhitectural  
- **REST API Simplu**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)  
- **Monolitic**: Node.js Express Todo, C# Web API + SQL  
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Microservicii**: [Microservicii pentru Producție (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservicii  
- **Containerizat**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservicii (Local)](../../../examples/container-app/microservices)  
- **AI-Powered**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Arhitectură Multi-Agent**: **Retail Multi-Agent Solution**  
- **Multi-Servicii pentru Întreprinderi**: [Microservicii (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### După Nivel de Complexitate  
- **Începător**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Intermediar**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservicii, Azure OpenAI Chat App, AI Document Processing  
- **Avansat**: ML Pipeline  
- **Gata pentru Producție la Nivel de Întreprindere**: [Microservicii (Local)](../../../examples/container-app/microservices) (Multi-servicii cu cozi de mesaje), **Retail Multi-Agent Solution** (Sistem complet multi-agent cu implementare ARM template)  

## 📚 Resurse Suplimentare  

### Linkuri de Documentație  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Documentație Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centrul de Arhitectură Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Exemple din Comunitate  
- [Șabloane AZD Azure Samples](https://github.com/Azure-Samples/azd-templates)  
- [Șabloane Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [Galeria Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [Aplicație Todo cu C# și Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Aplicație Todo cu Python și MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Aplicație Todo cu Node.js și PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplicație Web React cu API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Joburi Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Funcții Azure cu Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Cele mai bune practici
- [Framework-ul Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Framework-ul de Adoptare a Cloud-ului](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuirea Exemplarelor

Ai un exemplu util de împărtășit? Suntem deschiși la contribuții!

### Ghid pentru Trimitere
1. Urmează structura de directoare stabilită
2. Include un README.md detaliat
3. Adaugă comentarii în fișierele de configurare
4. Testează temeinic înainte de a trimite
5. Include estimări de costuri și cerințe preliminare

### Structura Șablonului Exemplu
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

**Sfat Util**: Începe cu cel mai simplu exemplu care se potrivește cu tehnologia ta, apoi avansează treptat către scenarii mai complexe. Fiecare exemplu se bazează pe conceptele din cele anterioare!

## 🚀 Gata de Start?

### Calea Ta de Învățare

1. **Începător complet?** → Începe cu [API Flask](../../../examples/container-app/simple-flask-api) (⭐, 20 minute)
2. **Ai cunoștințe de bază AZD?** → Încearcă [Microservicii](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minute)
3. **Construiești aplicații AI?** → Începe cu [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minute) sau explorează [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, peste 2 ore)
4. **Ai nevoie de un stack tehnologic specific?** → Folosește secțiunea [Găsirea Exemplului Potrivit](../../../examples) de mai sus

### Următorii Pași

- ✅ Revizuiește [Cerințele Preliminare](../../../examples) de mai sus
- ✅ Alege un exemplu care se potrivește nivelului tău de competență (vezi [Legenda Complexității](../../../examples))
- ✅ Citește cu atenție README-ul exemplului înainte de implementare
- ✅ Setează un memento pentru a rula `azd down` după testare
- ✅ Împărtășește experiența ta prin GitHub Issues sau Discussions

### Ai nevoie de ajutor?

- 📖 [FAQ](../resources/faq.md) - Întrebări frecvente
- 🐛 [Ghid de Depanare](../docs/troubleshooting/common-issues.md) - Rezolvă problemele de implementare
- 💬 [Discuții pe GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Întreabă comunitatea
- 📚 [Ghid de Studiu](../resources/study-guide.md) - Consolidează-ți învățarea

---

**Navigare**
- **📚 Curs Acasă**: [AZD Pentru Începători](../README.md)
- **📖 Materiale de Studiu**: [Ghid de Studiu](../resources/study-guide.md) | [Fișă de Ajutor](../resources/cheat-sheet.md) | [Glosar](../resources/glossary.md)
- **🔧 Resurse**: [FAQ](../resources/faq.md) | [Depanare](../docs/troubleshooting/common-issues.md)

---

*Ultima actualizare: Noiembrie 2025 | [Raportează Probleme](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuie Exemplare](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de oameni. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Exemple - Șabloane și Configurații AZD Practice

**Învățare prin Exemplu - Organizate pe Capitole**  
- **📚 Pagina cursului**: [AZD Pentru Începători](../README.md)  
- **📖 Harta capitolelor**: Exemple organizate după complexitatea învățării  
- **🚀 Exemplu Local**: [Soluția Retail Multi-Agent](retail-scenario.md)  
- **🤖 Exemple AI Externe**: Linkuri către depozitele Azure Samples  

> **📍 IMPORTANT: Exemple Locale vs Externe**  
> Acest depozit conține **4 exemple locale complete** cu implementări complete:  
> - **Microsoft Foundry Models Chat** (implementare gpt-4.1 cu interfață chat)  
> - **Container Apps** (API Flask simplu + Microservicii)  
> - **Aplicație Bază de Date** (Web + Bază de Date SQL)  
> - **Retail Multi-Agent** (Soluție Enterprise AI)  
>  
> Exemplele suplimentare sunt **referințe externe** către depozitele Azure-Samples pe care le puteți clona.

## Introducere

Acest director oferă exemple practice și referințe pentru a vă ajuta să învățați Azure Developer CLI prin practică directă. Scenariul Retail Multi-Agent este o implementare completă, gata pentru producție, inclusă în acest depozit. Exemplele suplimentare fac referire la exemple oficiale Azure care demonstrează diferite modele AZD.

### Legenda Clasificării Complexității

- ⭐ **Începător** - Concepte de bază, un singur serviciu, 15-30 minute  
- ⭐⭐ **Intermediar** - Servicii multiple, integrare bază de date, 30-60 minute  
- ⭐⭐⭐ **Avansat** - Arhitectură complexă, integrare AI, 1-2 ore  
- ⭐⭐⭐⭐ **Expert** - Gata pentru producție, modele enterprise, peste 2 ore  

## 🎯 Ce Se Găsește De Fapt În Acest Depozit

### ✅ Implementare Locală (Gata de Folosit)

#### [Aplicația Microsoft Foundry Models Chat](azure-openai-chat/README.md) 🆕  
**Implementare completă gpt-4.1 cu interfață chat inclusă în acest repo**

- **Locație:** `examples/azure-openai-chat/`  
- **Complexitate:** ⭐⭐ (Intermediar)  
- **Ce este inclus:**  
  - Implementare completă Microsoft Foundry Models (gpt-4.1)  
  - Interfață chat Python în linia de comandă  
  - Integrare Key Vault pentru chei API sigure  
  - Șabloane infrastructură Bicep  
  - Monitorizarea utilizării tokenurilor și costurilor  
  - Limitare rată și gestionare erori  

**Începe rapid:**  
```bash
# Navighează la exemplu
cd examples/azure-openai-chat

# Desfășoară totul
azd up

# Instalează dependențele și începe să conversezi
pip install -r src/requirements.txt
python src/chat.py
```
  
**Tehnologii:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep  

#### [Exemple Container App](container-app/README.md) 🆕  
**Exemple complete de implementare container incluse în repo**

- **Locație:** `examples/container-app/`  
- **Complexitate:** ⭐-⭐⭐⭐⭐ (De la Începător la Avansat)  
- **Ce este inclus:**  
  - [Ghid complet](container-app/README.md) - Prezentare generală a implementărilor container  
  - [API Flask Simplu](../../../examples/container-app/simple-flask-api) - Exemplu REST API de bază  
  - [Arhitectură Microservicii](../../../examples/container-app/microservices) - Implementare multi-servicii gata de producție  
  - Modele Quick Start, producție și avansate  
  - Monitorizare, securitate și optimizare costuri  

**Începe rapid:**  
```bash
# Vizualizează ghidul principal
cd examples/container-app

# Distribuie API simplu Flask
cd simple-flask-api
azd up

# Distribuie exemplu de microservicii
cd ../microservices
azd up
```
  
**Tehnologii:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights  

#### [Soluția Retail Multi-Agent](retail-scenario.md) 🆕  
**Implementare completă gata pentru producție inclusă în acest repo**

- **Locație:** `examples/retail-multiagent-arm-template/`  
- **Complexitate:** ⭐⭐⭐⭐ (Avansat)  
- **Ce este inclus:**  
  - Șablon complet de implementare ARM  
  - Arhitectură multi-agent (Client + Inventar)  
  - Integrare Microsoft Foundry Models  
  - AI Search cu RAG  
  - Monitorizare cuprinzătoare  
  - Script de implementare cu un singur click  

**Începe rapid:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Tehnologii:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 Exemple Externe Azure Samples (Clonează Pentru Folosire)

Următoarele exemple sunt menținute în depozitele oficiale Azure-Samples. Clonați-le pentru a explora diferite modele AZD:

### Aplicații Simple (Capitolele 1-2)

| Șablon | Depozit | Complexitate | Servicii |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |  
| **Microservicii** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-servicii, Service Bus, Cosmos DB, SQL |  
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |  
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |  
| **Container Python Flask** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |  

**Cum se folosește:**  
```bash
# Clonează orice exemplu
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Desfășoară
azd up
```
  
### Exemple Aplicații AI (Capitolele 2, 5, 8)

| Șablon | Depozit | Complexitate | Focalizare |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Implementare gpt-4.1 |  
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat AI de bază |  
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Cadru agent |  
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Model RAG |  
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI Enterprise |  

### Baze de Date & Modele Avansate (Capitolele 3-8)

| Șablon | Depozit | Complexitate | Focalizare |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrare bază de date |  
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Serverless NoSQL |  
| **Java Microservicii** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-servicii |  
| **Pipeline ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |  

## Obiective de Învățare

Lucrând prin aceste exemple, vei:  
- Exersa fluxurile de lucru Azure Developer CLI cu scenarii reale de aplicații  
- Înțelege diferite arhitecturi de aplicații și implementările lor azd  
- Stăpâni modele Infrastructure as Code pentru servicii Azure diverse  
- Aplica strategii de gestionare a configurației și implementări specifice mediului  
- Implementa monitorizare, securitate și modele de scalare în contexte practice  
- Dobândi experiență în depanarea și rezolvarea problemelor în scenarii reale de implementare  

## Rezultate de Învățare

La finalizarea acestor exemple, vei putea:  
- Implementa diferite tipuri de aplicații folosind Azure Developer CLI cu încredere  
- Adapta șabloanele oferite în funcție de cerințele proprii de aplicație  
- Proiecta și implementa modele de infrastructură personalizate folosind Bicep  
- Configura aplicații multi-servicii complexe cu dependențe corecte  
- Aplica bune practici de securitate, monitorizare și performanță în scenarii reale  
- Depana și optimiza implementările pe baza experienței practice  

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
  
## Exemple Quick Start

> **💡 Începător cu AZD?** Începe cu exemplul #1 (Flask API) - durează ~20 minute și predă conceptele de bază.

### Pentru Începători  
1. **[Container App - API Python Flask](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Implementează un API REST simplu cu scalare la zero  
   **Timp:** 20-25 minute | **Cost:** $0-5/lună  
   **Veți învăța:** Flux de lucru azd de bază, containerizare, probe de sănătate  
   **Rezultat așteptat:** Endpoint API funcțional care returnează "Hello, World!" cu monitorizare  

2. **[Aplicație Web Simplă - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Implementează o aplicație web Node.js Express cu MongoDB  
   **Timp:** 25-35 minute | **Cost:** $10-30/lună  
   **Veți învăța:** Integrare bază de date, variabile de mediu, șiruri de conexiune  
   **Rezultat așteptat:** Aplicație Listă Todo cu funcționalități CRUD  

3. **[Site Static - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Găzduiește un site static React cu Azure Static Web Apps  
   **Timp:** 20-30 minute | **Cost:** $0-10/lună  
   **Veți învăța:** Hosting static, funcții serverless, implementare CDN  
   **Rezultat așteptat:** UI React cu backend API, SSL automat, CDN global  

### Pentru Utilizatori Intermediari  
4. **[Aplicația Microsoft Foundry Models Chat](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Implementează gpt-4.1 cu interfață chat și management securizat chei API  
   **Timp:** 35-45 minute | **Cost:** $50-200/lună  
   **Veți învăța:** Implementare Microsoft Foundry Models, integrare Key Vault, monitorizare token  
   **Rezultat așteptat:** Aplicație chat funcțională cu gpt-4.1 și monitorizare cost  

5. **[Container App - Microservicii](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Arhitectură multi-servicii gata de producție  
   **Timp:** 45-60 minute | **Cost:** $50-150/lună  
   **Veți învăța:** Comunicare servicii, cozi mesaje, trasabilitate distribuită  
   **Rezultat așteptat:** Sistem 2-servicii (API Gateway + Product Service) cu monitorizare  

6. **[Aplicație Bază de Date - C# cu Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplicație web cu API C# și Azure SQL Database  
   **Timp:** 30-45 minute | **Cost:** $20-80/lună  
   **Veți învăța:** Entity Framework, migrații bază de date, securitate conexiuni  
   **Rezultat așteptat:** API C# cu backend Azure SQL, implementare schemă automată  

7. **[Funcție Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Funcții Python Azure cu trigger HTTP și Cosmos DB  
   **Timp:** 30-40 minute | **Cost:** $10-40/lună  
   **Veți învăța:** Arhitectură bazată pe evenimente, scalare serverless, integrare NoSQL  
   **Rezultat așteptat:** Aplicație funcție răspunzând la cereri HTTP cu stocare Cosmos DB  

8. **[Microservicii - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplicație multi-servicii Java cu Container Apps și gateway API  
   **Timp:** 60-90 minute | **Cost:** $80-200/lună  
   **Veți învăța:** Implementare Spring Boot, service mesh, balansare încărcare  
   **Rezultat așteptat:** Sistem multi-servicii Java cu descoperire și rutare servicii  

### Șabloane Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Exemplu Local](../../../examples/azure-openai-chat)** ⭐⭐  
   Implementare completă gpt-4.1 cu interfață chat  
   **Timp:** 35-45 minute | **Cost:** $50-200/lună  
   **Rezultat așteptat:** Aplicație chat funcțională cu monitorizare token și cost  

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplicație chat inteligentă cu arhitectură RAG  
   **Timp:** 60-90 minute | **Cost:** $100-300/lună  
   **Rezultat așteptat:** Interfață chat RAG cu căutare documente și citări  

3. **[Procesare Documente AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analiză documente folosind servicii Azure AI  
   **Timp:** 40-60 minute | **Cost:** $20-80/lună  
   **Rezultat așteptat:** API care extrage text, tabele și entități din documentele încărcate  

4. **[Pipeline Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Workflow MLOps cu Azure Machine Learning  
   **Timp:** 2-3 ore | **Cost:** $150-500/lună  
   **Rezultat așteptat:** Pipeline automatizat ML cu antrenare, implementare și monitorizare  

### Scenarii din Lumea Reală

#### **Soluția Retail Multi-Agent** 🆕  
**[Ghid Complet de Implementare](./retail-scenario.md)**

O soluție cuprinzătoare, gata pentru producție, de asistență clienți multi-agent care demonstrează o implementare AI de nivel enterprise cu AZD. Acest scenariu oferă:
- **Arhitectură Completă**: Sistem multi-agent cu agenți specializați pentru serviciul clienți și gestionarea stocurilor  
- **Infrastructură de Producție**: Implementări multi-regiune Microsoft Foundry Models, Azure AI Search, Container Apps și monitorizare completă  
- **Șablon ARM Pregătit pentru Implementare**: Implementare cu un singur clic cu mai multe moduri de configurare (Minimal/Standard/Premium)  
- **Funcționalități Avansate**: Validare de securitate red teaming, cadru de evaluare a agenților, optimizare costuri și ghiduri de depanare  
- **Context Real de Afaceri**: Caz de utilizare pentru suport clienți retailer cu încărcare fișiere, integrare căutare și scalare dinamică  

**Tehnologii**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Complexitate**: ⭐⭐⭐⭐ (Avansat - Pregătit pentru Producție Enterprise)  

**Ideal pentru**: Dezvoltatori AI, arhitecți de soluții și echipe care construiesc sisteme multi-agent pentru producție  

**Start Rapid**: Implementează soluția completă în mai puțin de 30 de minute folosind șablonul ARM inclus cu `./deploy.sh -g myResourceGroup`  

## 📋 Instrucțiuni de Utilizare  

### Cerințe Prealabile  

Înainte de a rula orice exemplu:  
- ✅ Abonament Azure cu acces Owner sau Contributor  
- ✅ Azure Developer CLI instalat ([Ghid de instalare](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop pornit (pentru exemple cu containere)  
- ✅ Cote Azure adecvate (verifică cerințele specifice fiecărui exemplu)  

> **💰 Atenție Costuri:** Toate exemplele creează resurse reale Azure care implică costuri. Vezi fișierele README individuale pentru estimări de cost. Nu uita să rulezi `azd down` după terminare pentru a evita costuri continue.  

### Rularea Exemplului Local  

1. **Clonează sau Copiază Exemplul**  
   ```bash
   # Navigați la exemplul dorit
   cd examples/simple-web-app
   ```
  
2. **Initializează Mediul AZD**  
   ```bash
   # Inițializează cu șablonul existent
   azd init
   
   # Sau creează un mediu nou
   azd env new my-environment
   ```
  
3. **Configurează Mediul**  
   ```bash
   # Setează variabilele necesare
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Implementează**  
   ```bash
   # Implementați infrastructura și aplicația
   azd up
   ```
  
5. **Verifică Implementarea**  
   ```bash
   # Obține punctele finale ale serviciului
   azd env get-values
   
   # Testează punctul final (exemplu)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Indicatori de Succes Așteptați:**  
   - ✅ `azd up` se termină fără erori  
   - ✅ Endpoint-ul serviciului răspunde cu HTTP 200  
   - ✅ Portalul Azure afișează starea "Running"  
   - ✅ Application Insights primește telemetrie  

> **⚠️ Probleme?** Vezi [Probleme Comune](../docs/chapter-07-troubleshooting/common-issues.md) pentru depanare implementare  

### Adaptarea Exemplului  

Fiecare exemplu include:  
- **README.md** - Instrucțiuni detaliate de configurare și personalizare  
- **azure.yaml** - Configurare AZD cu comentarii  
- **infra/** - Șabloane Bicep cu explicații pentru parametri  
- **src/** - Cod aplicativ exemplu  
- **scripts/** - Scripturi ajutătoare pentru activități comune  

## 🎯 Obiective de Învățare  

### Categorii de Exemple  

#### **Implementări de Bază**  
- Aplicații cu un singur serviciu  
- Modele simple de infrastructură  
- Management simplu al configurației  
- Configurări eficiente din punct de vedere al costurilor pentru dezvoltare  

#### **Scenarii Avansate**  
- Arhitecturi multi-serviciu  
- Configurări complexe de rețea  
- Modele de integrare baze de date  
- Implementări de securitate și conformitate  

#### **Modele Pregătite pentru Producție**  
- Configurări cu înaltă disponibilitate  
- Monitorizare și observabilitate  
- Integrare CI/CD  
- Configurări pentru recuperare în caz de dezastru  

## 📖 Descrieri Exemple  

### Aplicație Web Simplă - Node.js Express  
**Tehnologii**: Node.js, Express, MongoDB, Container Apps  
**Complexitate**: Începător  
**Concepte**: Implementare de bază, REST API, integrare bază de date NoSQL  

### Website Static - React SPA  
**Tehnologii**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexitate**: Începător  
**Concepte**: Hosting static, backend serverless, dezvoltare web modernă  

### Container App - Python Flask  
**Tehnologii**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexitate**: Începător  
**Concepte**: Containerizare, REST API, scale-to-zero, probe de sănătate, monitorizare  
**Locație**: [Exemplu Local](../../../examples/container-app/simple-flask-api)  

### Container App - Arhitectură Microservicii  
**Tehnologii**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexitate**: Avansat  
**Concepte**: Arhitectură multi-serviciu, comunicare servicii, cozi de mesaje, trasare distribuită  
**Locație**: [Exemplu Local](../../../examples/container-app/microservices)  

### Aplicație Bază de Date - C# cu Azure SQL  
**Tehnologii**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexitate**: Intermediar  
**Concepte**: Entity Framework, conexiuni baze de date, dezvoltare API web  

### Funcție Serverless - Python Azure Functions  
**Tehnologii**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexitate**: Intermediar  
**Concepte**: Arhitectură event-driven, calcul serverless, dezvoltare full-stack  

### Microservicii - Java Spring Boot  
**Tehnologii**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexitate**: Intermediar  
**Concepte**: Comunicare microservicii, sisteme distribuite, modele enterprise  

### Exemple Microsoft Foundry  

#### Aplicație Chat Microsoft Foundry Models  
**Tehnologii**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complexitate**: Intermediar  
**Concepte**: Arhitectură RAG, căutare vectorială, integrare LLM  

#### Procesare Documente AI  
**Tehnologii**: Azure AI Document Intelligence, Storage, Functions  
**Complexitate**: Intermediar  
**Concepte**: Analiză documente, OCR, extragere date  

#### Pipeline Machine Learning  
**Tehnologii**: Azure ML, MLOps, Container Registry  
**Complexitate**: Avansat  
**Concepte**: Antrenare modele, pipeline-uri implementare, monitorizare  

## 🛠 Exemple de Configurare  

Directorul `configurations/` conține componente reutilizabile:  

### Configurări Mediu  
- Setări mediu de dezvoltare  
- Configurări mediu staging  
- Configurări pregătite pentru producție  
- Configurări pentru implementări multi-regiune  

### Module Bicep  
- Componente infrastructură reutilizabile  
- Modele comune de resurse  
- Șabloane securizate  
- Configurări optimizate din punct de vedere al costurilor  

### Scripturi Ajutătoare  
- Automatizare configurare mediu  
- Scripturi migrare baze de date  
- Instrumente validare implementare  
- Utilitare monitorizare costuri  

## 🔧 Ghid de Personalizare  

### Adaptarea Exemplelor la Cazul Tău  

1. **Verifică Cerințele Prealabile**  
   - Verifică cerințele serviciilor Azure  
   - Verifică limitele abonamentului  
   - Înțelege implicațiile costurilor  

2. **Modifică Configurația**  
   - Actualizează definițiile serviciilor din `azure.yaml`  
   - Personalizează șabloanele Bicep  
   - Ajustează variabilele de mediu  

3. **Testează Temeinic**  
   - Implementează mai întâi în mediul de dezvoltare  
   - Verifică funcționalitatea  
   - Testează scalabilitatea și performanța  

4. **Revizuire Securitate**  
   - Verifică controalele de acces  
   - Implementează managementul secretelor  
   - Activează monitorizarea și alertele  

## 📊 Matrice de Comparare  

| Exemplu | Servicii | Bază de date | Autentificare | Monitorizare | Complexitate |  
|---------|----------|--------------|---------------|--------------|--------------|  
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Complet | ⭐⭐ |  
| **Python Flask API** (Local) | 1 | ❌ | Basic | Complet | ⭐ |  
| **Microservicii** (Local) | 5+ | ✅ | Enterprise | Avansat | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |  
| React SPA + Functions | 3 | ✅ | Basic | Complet | ⭐ |  
| Python Flask Container | 2 | ❌ | Basic | Complet | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Complet | Complet | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Complet | Complet | ⭐⭐ |  
| Java Microservicii | 5+ | ✅ | Complet | Complet | ⭐⭐ |  
| Microsoft Foundry Models Chat | 3 | ✅ | Complet | Complet | ⭐⭐⭐ |  
| AI Document Processing | 2 | ❌ | Basic | Complet | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | Complet | Complet | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Avansat** | **⭐⭐⭐⭐** |  

## 🎓 Parcurs de Învățare  

### Progresie Recomandată  

1. **Începe cu Aplicația Web Simplă**  
   - Învață conceptele de bază AZD  
   - Înțelege fluxul de implementare  
   - Exersează managementul mediului  

2. **Încearcă Website-ul Static**  
   - Explorează opțiuni de hosting  
   - Învață despre integrarea CDN  
   - Înțelege configurarea DNS  

3. **Treci la Container App**  
   - Învață noțiunile de bază despre containerizare  
   - Înțelege conceptele de scalare  
   - Exersează cu Docker  

4. **Adaugă Integrare Bază de Date**  
   - Învață implementarea bazelor de date  
   - Înțelege stringurile de conexiune  
   - Exersează managementul secretelor  

5. **Explorează Serverless**  
   - Înțelege arhitectura bazată pe evenimente  
   - Învață despre trigger-e și bindings  
   - Exersează cu API-uri  

6. **Construiește Microservicii**  
   - Învață comunicarea între servicii  
   - Înțelege sistemele distribuite  
   - Exersează implementări complexe  

## 🔍 Găsirea Exemplului Potrivit  

### După Stack Tehnologic  
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservicii (Local)](../../../examples/container-app/microservices), Java Microservicii  
- **Node.js**: Node.js Express Todo App, [Microservicii API Gateway (Local)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservicii Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservicii Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [Microservicii User Service (Local)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservicii  
- **React**: React SPA + Functions  
- **Containere**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservicii (Local)](../../../examples/container-app/microservices), Java Microservicii  
- **Baze de Date**: [Microservicii (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, Procesare Documente AI, ML Pipeline, **Retail Multi-Agent Solution**  
- **Sisteme Multi-Agent**: **Retail Multi-Agent Solution**  
- **Integrare OpenAI**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Producție Enterprise**: [Microservicii (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### După Model Arhitectural  
- **REST API Simplu**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)  
- **Monolitic**: Node.js Express Todo, C# Web API + SQL  
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Microservicii**: [Microservicii Producție (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservicii  
- **Containerizat**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservicii (Local)](../../../examples/container-app/microservices)  
- **Bazat pe AI**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, Procesare Documente AI, ML Pipeline, **Retail Multi-Agent Solution**  
- **Arhitectură Multi-Agent**: **Retail Multi-Agent Solution**  
- **Enterprise Multi-Serviciu**: [Microservicii (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### După Nivelul de Complexitate  
- **Începător**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Intermediar**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservicii, Microsoft Foundry Models Chat App, Procesare Documente AI  
- **Avansat**: ML Pipeline  
- **Pregătit pentru Producție Enterprise**: [Microservicii (Local)](../../../examples/container-app/microservices) (Multi-serviciu cu cozi de mesaje), **Retail Multi-Agent Solution** (Sistem complet multi-agent cu șablon ARM pentru implementare)  

## 📚 Resurse Suplimentare  

### Linkuri Documentație  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Documentație Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Exemple Comunitare  
- [Șabloane Azure Samples AZD](https://github.com/Azure-Samples/azd-templates)
- [Șabloane Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galeria Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Aplicație Todo cu C# și Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Aplicație Todo cu Python și MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplicație Todo cu Node.js și PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplicație Web React cu API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Job Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Funcții Azure cu Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Cele mai bune practici
- [Cadru de lucru Azure bine arhitecturat](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cadru de adoptare a cloud-ului](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuirea exemplelor

Ai un exemplu util de împărtășit? Binevenite contribuțiile!

### Ghid de trimitere
1. Urmează structura de directoare stabilită
2. Include un README.md cuprinzător
3. Adaugă comentarii în fișierele de configurare
4. Testează temeinic înainte de a trimite
5. Include estimări de costuri și prerechizite

### Structura șablonului exemplu
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

**Sfat Profi**: Începe cu cel mai simplu exemplu care se potrivește cu tehnologia ta, apoi avansează treptat către scenarii mai complexe. Fiecare exemplu construiește pe conceptele celor precedente!

## 🚀 Gata să începi?

### Calea ta de învățare

1. **Începător complet?** → Începe cu [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 de minute)
2. **Ai cunoștințe de bază AZD?** → Încearcă [Microservicii](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 de minute)
3. **Construiești aplicații AI?** → Începe cu [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 de minute) sau explorează [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ ore)
4. **Ai nevoie de un anumit stack tehnologic?** → Folosește secțiunea [Găsirea exemplului potrivit](#-finding-the-right-example) de mai sus

### Pași următori

- ✅ Revizuiește [Prerechizitele](#cerințe-prealabile) de mai sus
- ✅ Alege un exemplu potrivit nivelului tău (vezi [Legenda complexității](#legenda-clasificării-complexității))
- ✅ Citește cu atenție README-ul exemplului înainte de a-l implementa
- ✅ Setează un reminder să rulezi `azd down` după testare
- ✅ Împărtășește experiența ta prin GitHub Issues sau Discussions

### Ai nevoie de ajutor?

- 📖 [FAQ](../resources/faq.md) - Întrebări frecvente
- 🐛 [Ghid de depanare](../docs/chapter-07-troubleshooting/common-issues.md) - Remediază problemele de implementare
- 💬 [Discuții GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Întreabă comunitatea
- 📚 [Ghid de studiu](../resources/study-guide.md) - Consolidarea învățării

---

**Navigare**
- **📚 Acasă curs**: [AZD Pentru Începători](../README.md)
- **📖 Materiale de studiu**: [Ghid de studiu](../resources/study-guide.md) | [Fișă rapidă](../resources/cheat-sheet.md) | [Glosar](../resources/glossary.md)
- **🔧 Resurse**: [FAQ](../resources/faq.md) | [Depanare](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Ultima actualizare: noiembrie 2025 | [Raportează probleme](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuie cu exemple](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus utilizând serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un traducător uman. Nu suntem responsabili pentru neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
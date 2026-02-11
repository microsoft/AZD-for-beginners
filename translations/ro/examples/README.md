# Exemple - Șabloane și Configurații Practice AZD

**Învățare prin Exemplu - Organizate pe Capitol**  
- **📚 Acasă curs**: [AZD Pentru Începători](../README.md)  
- **📖 Harta Capitolului**: Exemple organizate după complexitatea învățării  
- **🚀 Exemplu Local**: [Soluție Retail Multi-Agent](retail-scenario.md)  
- **🤖 Exemple AI Externe**: Legături către depozitele Azure Samples  

> **📍 IMPORTANT: Exemple Locale vs Externe**  
> Acest depozit conține **4 exemple locale complete** cu implementări integrale:  
> - **Azure OpenAI Chat** (implementare GPT-4 cu interfață chat)  
> - **Container Apps** (API Flask simplu + Microservicii)  
> - **Aplicație Bază de Date** (Web + Bază de date SQL)  
> - **Retail Multi-Agent** (Soluție AI Enterprise)  
>  
> Exemple suplimentare sunt referințe **externe** către depozitele Azure-Samples pe care le puteți clona.

## Introducere

Acest director oferă exemple practice și referințe pentru a vă ajuta să învățați Azure Developer CLI prin practică directă. Scenariul Retail Multi-Agent este o implementare completă, gata pentru producție, inclusă în acest depozit. Exemplele suplimentare fac referire la Azure Samples oficiale care demonstrează diverse modele AZD.

### Legenda Nivelului de Complexitate

- ⭐ **Începător** - Concepte de bază, un singur serviciu, 15-30 minute  
- ⭐⭐ **Intermediar** - Mai multe servicii, integrare baze de date, 30-60 minute  
- ⭐⭐⭐ **Avansat** - Arhitectură complexă, integrare AI, 1-2 ore  
- ⭐⭐⭐⭐ **Expert** - Gata pentru producție, modele enterprise, 2+ ore  

## 🎯 Ce se Găsește de Fapt în Acest Depozit

### ✅ Implementări Locale (Gata de Folosit)

#### [Aplicație Azure OpenAI Chat](azure-openai-chat/README.md) 🆕  
**Implementare completă GPT-4 cu interfață chat inclusă în acest repo**  

- **Locație:** `examples/azure-openai-chat/`  
- **Complexitate:** ⭐⭐ (Intermediar)  
- **Ce include:**  
  - Implementare completă Azure OpenAI (GPT-4)  
  - Interfață chat în linie de comandă Python  
  - Integrare Key Vault pentru chei API securizate  
  - Șabloane infrastructură Bicep  
  - Monitorizare consum tokeni și costuri  
  - Limitare rată și tratare erori  

**Pornire Rapidă:**  
```bash
# Navighează la exemplu
cd examples/azure-openai-chat

# Desfășoară totul
azd up

# Instalează dependențele și începe conversația
pip install -r src/requirements.txt
python src/chat.py
```
  
**Tehnologii:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep  

#### [Exemple Container App](container-app/README.md) 🆕  
**Exemple cuprinzătoare de implementare container incluse în acest repo**  

- **Locație:** `examples/container-app/`  
- **Complexitate:** ⭐-⭐⭐⭐⭐ (De la Începător la Avansat)  
- **Ce include:**  
  - [Ghid complet](container-app/README.md) - Prezentare completă a implementărilor container  
  - [API Flask simplu](../../../examples/container-app/simple-flask-api) - Exemplu de API REST de bază  
  - [Arhitectură Microservicii](../../../examples/container-app/microservices) - Implementare multi-serviciu gata pentru producție  
  - Modele Pornire rapidă, Producție și Avansat  
  - Monitorizare, securitate și optimizare cost  

**Pornire Rapidă:**  
```bash
# Vizualizează ghidul principal
cd examples/container-app

# Desfășoară un API Flask simplu
cd simple-flask-api
azd up

# Desfășoară exemplul de microservicii
cd ../microservices
azd up
```
  
**Tehnologii:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights  

#### [Soluție Retail Multi-Agent](retail-scenario.md) 🆕  
**Implementare completă gata pentru producție inclusă în acest repo**  

- **Locație:** `examples/retail-multiagent-arm-template/`  
- **Complexitate:** ⭐⭐⭐⭐ (Avansat)  
- **Ce include:**  
  - Șablon ARM complet pentru implementare  
  - Arhitectură multi-agent (Client + Inventar)  
  - Integrare Azure OpenAI  
  - Căutare AI cu RAG  
  - Monitorizare cuprinzătoare  
  - Script de implementare cu un singur clic  

**Pornire Rapidă:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Tehnologii:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 Exemple Azure Externe (Clonați pentru utilizare)

Următoarele exemple sunt întreținute în depozitele oficiale Azure-Samples. Clonați-le pentru a explora diferite modele AZD:

### Aplicații Simple (Capitolele 1-2)

| Șablon | Depozit | Complexitate | Servicii |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservicii** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-serviciu, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Cum se folosește:**  
```bash
# Clonați orice exemplu
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Implementați
azd up
```
  
### Exemple Aplicații AI (Capitolele 2, 5, 8)

| Șablon | Depozit | Complexitate | Focus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Implementare GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat AI de bază |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework agenți |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Model RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI Enterprise |

### Baze de Date & Modele Avansate (Capitolele 3-8)

| Șablon | Depozit | Complexitate | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrare bază de date |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Serverless NoSQL |
| **Java Microservicii** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-serviciu |
| **Pipeline ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Obiective de Învățare  

Parcurgând aceste exemple, vei:  
- Practica fluxuri de lucru Azure Developer CLI cu scenarii reale de aplicații  
- Înțelege diverse arhitecturi de aplicații și implementările lor azd  
- Stăpâni modele Infrastructure as Code pentru diverse servicii Azure  
- Aplica managementul configurațiilor și strategii de implementare specifice mediului  
- Implementa monitorizare, securitate și modele de scalare în contexte practice  
- Câștiga experiență în depanarea și verificarea scenariilor reale de implementare  

## Rezultate așteptate după învățare

După finalizarea acestor exemple, vei putea:  
- Implementa diverse tipuri de aplicații folosind Azure Developer CLI cu încredere  
- Adapta șabloanele oferite la cerințele proprii aplicației tale  
- Proiecta și implementa modele personalizate de infrastructură cu Bicep  
- Configura aplicații complexe multi-serviciu cu dependențe corecte  
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
  
## Exemple Pornire Rapidă  

> **💡 Nou în AZD?** Începe cu exemplul nr. 1 (Flask API) - durează ~20 minute și predă conceptele de bază.

### Pentru începători  
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Implementează un API REST simplu cu scalare la zero  
   **Durată:** 20-25 minute | **Cost:** $0-5/lună  
   **Veți învăța:** Flux azd de bază, containerizare, probe de sănătate  
   **Rezultat așteptat:** Endpoint API funcțional care returnează "Hello, World!" cu monitorizare  

2. **[Aplicație web simplă - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Implementează o aplicație Node.js Express cu MongoDB  
   **Durată:** 25-35 minute | **Cost:** $10-30/lună  
   **Veți învăța:** Integrare bază de date, variabile de mediu, stringuri de conexiune  
   **Rezultat așteptat:** Aplicație todo list cu funcții de creare/citire/actualizare/ștergere  

3. **[Website static - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Găzduiește un site static React cu Azure Static Web Apps  
   **Durată:** 20-30 minute | **Cost:** $0-10/lună  
   **Veți învăța:** Găzduire statică, funcții serverless, implementare CDN  
   **Rezultat așteptat:** UI React cu backend API, SSL automat, CDN global  

### Pentru utilizatori intermediari  
4. **[Aplicație Azure OpenAI Chat](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Implementează GPT-4 cu interfață chat și management securizat cheie API  
   **Durată:** 35-45 minute | **Cost:** $50-200/lună  
   **Veți învăța:** Implementare Azure OpenAI, integrare Key Vault, monitorizare tokeni  
   **Rezultat așteptat:** Aplicație chat funcțională cu GPT-4 și monitorizare costuri  

5. **[Container App - Microservicii](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Arhitectură multi-serviciu gata pentru producție  
   **Durată:** 45-60 minute | **Cost:** $50-150/lună  
   **Veți învăța:** Comunicare servicii, coada de mesaje, trasabilitate distribuită  
   **Rezultat așteptat:** Sistem 2-servicii (API Gateway + Serviciul de produse) cu monitorizare  

6. **[Aplicație bază de date - C# cu Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplicație web cu API C# și baza de date Azure SQL  
   **Durată:** 30-45 minute | **Cost:** $20-80/lună  
   **Veți învăța:** Entity Framework, migrări baze de date, securitate conexiune  
   **Rezultat așteptat:** API C# cu backend Azure SQL, implementare schema automată  

7. **[Funcție serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Funcții Python Azure cu trigger HTTP și Cosmos DB  
   **Durată:** 30-40 minute | **Cost:** $10-40/lună  
   **Veți învăța:** Arhitectură event-driven, scalare serverless, integrare NoSQL  
   **Rezultat așteptat:** Aplicație funcție răspunzând la HTTP cu stocare Cosmos DB  

8. **[Microservicii - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplicație Java multi-serviciu cu Container Apps și API gateway  
   **Durată:** 60-90 minute | **Cost:** $80-200/lună  
   **Veți învăța:** Implementare Spring Boot, service mesh, load balancing  
   **Rezultat așteptat:** Sistem Java multi-serviciu cu descoperire și rutare servicii  

### Șabloane Microsoft Foundry  

1. **[Aplicație Azure OpenAI Chat - Exemplu local](../../../examples/azure-openai-chat)** ⭐⭐  
   Implementare completă GPT-4 cu interfață chat  
   **Durată:** 35-45 minute | **Cost:** $50-200/lună  
   **Rezultat așteptat:** Aplicație chat funcțională cu monitorizare tokeni și costuri  

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplicație chat inteligentă cu arhitectură RAG  
   **Durată:** 60-90 minute | **Cost:** $100-300/lună  
   **Rezultat așteptat:** Interfață chat alimentată RAG cu căutare documente și citări  

3. **[Procesare documente AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analiză documente folosind servicii Azure AI  
   **Durată:** 40-60 minute | **Cost:** $20-80/lună  
   **Rezultat așteptat:** API extragere text, tabele și entități din documente încărcate  

4. **[Pipeline Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Flux de lucru MLOps cu Azure Machine Learning  
   **Durată:** 2-3 ore | **Cost:** $150-500/lună  
   **Rezultat așteptat:** Pipeline ML automatizat cu antrenare, implementare și monitorizare  

### Scenarii din lumea reală  

#### **Soluție Retail Multi-Agent** 🆕  
**[Ghid complet de implementare](./retail-scenario.md)**  

O soluție cuprinzătoare, gata pentru producție, multi-agent pentru suport clienți, care demonstrează implementarea unei aplicații AI la nivel enterprise cu AZD. Acest scenariu oferă:

- **Arhitectură completă**: Sistem multi-agent cu agenți specializați pentru serviciul clienți și gestionarea inventarului
- **Infrastructură de Producție**: Implementări Azure OpenAI multi-regiune, AI Search, Container Apps și monitorizare completă  
- **Șablon ARM gata de implementare**: Implementare cu un singur clic cu multiple moduri de configurare (Minimal/Standard/Premium)  
- **Funcționalități Avansate**: Validare de securitate red teaming, cadru de evaluare agenți, optimizarea costurilor și ghiduri de depanare  
- **Context Real de Afaceri**: Caz de utilizare suport clienți retailer cu încărcare fișiere, integrare căutare și scalare dinamică  

**Tehnologii**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Complexitate**: ⭐⭐⭐⭐ (Avansat - Gata pentru Producție Enterprise)  

**Perfect pentru**: Dezvoltatori AI, arhitecți de soluții și echipe care construiesc sisteme multi-agent pentru producție  

**Pornire Rapidă**: Implementați soluția completă în mai puțin de 30 de minute folosind șablonul ARM inclus cu `./deploy.sh -g myResourceGroup`  

## 📋 Instrucțiuni de utilizare  

### Cerințe preliminare  

Înainte de a rula orice exemplu:  
- ✅ Abonament Azure cu acces Owner sau Contributor  
- ✅ Azure Developer CLI instalat ([Ghid de Instalare](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop pornit (pentru exemplele cu containere)  
- ✅ Cote Azure corespunzătoare (verificați cerințele specifice exemplului)  

> **💰 Atenție Costuri:** Toate exemplele creează resurse reale Azure care implică costuri. Consultați fișierele README individuale pentru estimări de costuri. Nu uitați să rulați `azd down` după terminare pentru a evita costurile continue.  

### Rularea exemplelor local  

1. **Clonați sau copiați exemplul**  
   ```bash
   # Navigați la exemplul dorit
   cd examples/simple-web-app
   ```
  
2. **Inițializați mediul AZD**  
   ```bash
   # Inițializează cu un șablon existent
   azd init
   
   # Sau creează un mediu nou
   azd env new my-environment
   ```
  
3. **Configurați mediul**  
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
  
5. **Verificați implementarea**  
   ```bash
   # Obțineți punctele finale ale serviciului
   azd env get-values
   
   # Testați punctul final (exemplu)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Indicatori de succes așteptați:**  
   - ✅ `azd up` se finalizează fără erori  
   - ✅ Endpoint-ul serviciului returnează HTTP 200  
   - ✅ Portalul Azure afișează statusul „Running”  
   - ✅ Application Insights primește telemetrie  

> **⚠️ Probleme?** Consultați [Probleme Comune](../docs/chapter-07-troubleshooting/common-issues.md) pentru depanarea implementării  

### Adaptarea exemplelor  

Fiecare exemplu include:  
- **README.md** - Instrucțiuni detaliate de configurare și personalizare  
- **azure.yaml** - Configurație AZD cu comentarii  
- **infra/** - Șabloane Bicep cu explicații pentru parametri  
- **src/** - Cod aplicație exemplu  
- **scripts/** - Scripturi ajutătoare pentru sarcini comune  

## 🎯 Obiective de învățare  

### Categorii de exemple  

#### **Implementări de bază**  
- Aplicații cu un singur serviciu  
- Modele simple de infrastructură  
- Management de configurare de bază  
- Configurări eficiente din punct de vedere al costurilor  

#### **Scenarii avansate**  
- Arhitecturi multi-serviciu  
- Configurări complexe de rețea  
- Modele de integrare baze de date  
- Implementări de securitate și conformitate  

#### **Modele gata de producție**  
- Configurări de înaltă disponibilitate  
- Monitorizare și observabilitate  
- Integrare CI/CD  
- Configurări de recuperare în caz de dezastru  

## 📖 Descrieri Exemple  

### Aplicație Web Simplă - Node.js Express  
**Tehnologii**: Node.js, Express, MongoDB, Container Apps  
**Complexitate**: Începător  
**Concepte**: Implementare de bază, API REST, integrare bază NoSQL  

### Website Static - React SPA  
**Tehnologii**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexitate**: Începător  
**Concepte**: Găzduire statică, backend serverless, dezvoltare web modernă  

### Container App - Python Flask  
**Tehnologii**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexitate**: Începător  
**Concepte**: Containerizare, API REST, scale-to-zero, sonde de sănătate, monitorizare  
**Locație**: [Exemplu local](../../../examples/container-app/simple-flask-api)  

### Container App - Arhitectură Microservicii  
**Tehnologii**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexitate**: Avansat  
**Concepte**: Arhitectură multi-serviciu, comunicare între servicii, cozi de mesaje, trasare distribuită  
**Locație**: [Exemplu local](../../../examples/container-app/microservices)  

### Aplicație Bază Date - C# cu Azure SQL  
**Tehnologii**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexitate**: Intermediar  
**Concepte**: Entity Framework, conexiuni baze de date, dezvoltare API web  

### Funcție Serverless - Python Azure Functions  
**Tehnologii**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexitate**: Intermediar  
**Concepte**: Arhitectură bazată pe evenimente, calcul serverless, dezvoltare full-stack  

### Microservicii - Java Spring Boot  
**Tehnologii**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexitate**: Intermediar  
**Concepte**: Comunicare microservicii, sisteme distribuite, modele enterprise  

### Exemple Microsoft Foundry  

#### Azure OpenAI Chat App  
**Tehnologii**: Azure OpenAI, Cognitive Search, App Service  
**Complexitate**: Intermediar  
**Concepte**: Arhitectură RAG, căutare vectorială, integrare LLM  

#### Procesare Documente AI  
**Tehnologii**: Azure AI Document Intelligence, Storage, Functions  
**Complexitate**: Intermediar  
**Concepte**: Analiză documente, OCR, extragere date  

#### Pipeline Machine Learning  
**Tehnologii**: Azure ML, MLOps, Container Registry  
**Complexitate**: Avansat  
**Concepte**: Antrenare modele, pipeline-uri de implementare, monitorizare  

## 🛠 Exemple de Configurare  

Directorul `configurations/` conține componente reutilizabile:  

### Configurații Mediu  
- Setări pentru mediu de dezvoltare  
- Configurații pentru mediu de staging  
- Configurări gata pentru producție  
- Configurări pentru implementări multi-regiune  

### Module Bicep  
- Componente reutilizabile de infrastructură  
- Modele comune de resurse  
- Șabloane securizate  
- Configurări optimizate pentru costuri  

### Scripturi Ajutătoare  
- Automatizare configurare mediu  
- Scripturi migrare baze de date  
- Unelte de validare implementare  
- Utilitare pentru monitorizare costuri  

## 🔧 Ghid de Personalizare  

### Adaptarea Exemplelor la Cazul tău de Utilizare  

1. **Revizuiește Cerințele Preliminare**  
   - Verifică cerințele serviciilor Azure  
   - Confirmă limitele abonamentului  
   - Înțelege implicațiile financiare  

2. **Modifică Configurația**  
   - Actualizează definițiile serviciilor din `azure.yaml`  
   - Personalizează șabloanele Bicep  
   - Ajustează variabilele de mediu  

3. **Testează Temeinic**  
   - Implementează mai întâi în mediu de dezvoltare  
   - Validă funcționalitatea  
   - Testează scalarea și performanța  

4. **Revizuire Securitate**  
   - Verifică controalele de acces  
   - Implementează gestionarea secretelor  
   - Activează monitorizarea și alertarea  

## 📊 Matrice Comparativă  

| Exemplu | Servicii | Bază de date | Autentificare | Monitorizare | Complexitate |  
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
| Procesare Documente AI | 2 | ❌ | Basic | Complet | ⭐⭐ |  
| Pipeline ML | 4+ | ✅ | Complet | Complet | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Avansat** | **⭐⭐⭐⭐** |  

## 🎓 Parcurs de Învățare  

### Progresie Recomandată  

1. **Începe cu Aplicația Web Simplă**  
   - Învață conceptele de bază AZD  
   - Înțelege fluxul de implementare  
   - Practică managementul mediilor  

2. **Încearcă Website Static**  
   - Explorează opțiuni diferite de găzduire  
   - Învață despre integrarea CDN  
   - Înțelege configurarea DNS  

3. **Treci la Container App**  
   - Învață bazele containerizării  
   - Înțelege conceptele de scalare  
   - Exersează cu Docker  

4. **Adaugă Integrare Bază de Date**  
   - Învață furnizarea bazei de date  
   - Înțelege string-urile de conexiune  
   - Practică gestionarea secretelor  

5. **Explorează Serverless**  
   - Înțelege arhitectura bazată pe evenimente  
   - Învață despre trigger-e și binding-uri  
   - Exersează cu API-uri  

6. **Construiește Microservicii**  
   - Învață comunicarea între servicii  
   - Înțelege sistemele distribuite  
   - Practică implementări complexe  

## 🔍 Găsirea Exemplului Potrivit  

### După Stack Tehnologic  
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservicii (Local)](../../../examples/container-app/microservices), Java Microservicii  
- **Node.js**: Node.js Express Todo App, [Microservicii API Gateway (Local)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservicii Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservicii Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, Pipeline ML  
- **Go**: [Microservicii User Service (Local)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservicii  
- **React**: React SPA + Functions  
- **Containere**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservicii (Local)](../../../examples/container-app/microservices), Java Microservicii  
- **Baze de date**: [Microservicii (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, Procesare Documente AI, Pipeline ML, **Retail Multi-Agent Solution**  
- **Sisteme Multi-Agent**: **Retail Multi-Agent Solution**  
- **Integrare OpenAI**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Producție Enterprise**: [Microservicii (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### După Model Arhitectural  
- **API REST Simplu**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)  
- **Monolitic**: Node.js Express Todo, C# Web API + SQL  
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Microservicii**: [Microservicii Producție (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservicii  
- **Containerizat**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservicii (Local)](../../../examples/container-app/microservices)  
- **AI-Powered**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, Procesare Documente AI, Pipeline ML, **Retail Multi-Agent Solution**  
- **Arhitectură Multi-Agent**: **Retail Multi-Agent Solution**  
- **Multi-Serviciu Enterprise**: [Microservicii (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### După Nivelul de Complexitate  
- **Începător**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Intermediar**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservicii, Azure OpenAI Chat App, Procesare Documente AI  
- **Avansat**: Pipeline ML  
- **Gata pentru Producție Enterprise**: [Microservicii (Local)](../../../examples/container-app/microservices) (Multi-serviciu cu mesagerie), **Retail Multi-Agent Solution** (Sistem multi-agent complet cu implementare șablon ARM)  

## 📚 Resurse Suplimentare  

### Linkuri Documentație  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Documentație Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Exemple Comunitate  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Galerie Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [Todo App cu C# și Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App cu Python și MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplicație Todo cu Node.js și PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplicație Web React cu API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Job Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions cu Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Cele mai bune practici
- [Cadru Azure bine arhitecturat](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cadru de adoptare a cloud-ului](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuirea exemplelor

Ai un exemplu util de împărtășit? Primim cu drag contribuții!

### Ghid pentru trimitere
1. Urmează structura de directoare stabilită
2. Include un README.md detaliat
3. Adaugă comentarii în fișierele de configurare
4. Testează temeinic înainte de a trimite
5. Include estimări de costuri și prerechizite

### Structura șablonului de exemplu
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

**Sfat profesionist**: Începe cu cel mai simplu exemplu care se potrivește tehnologiei tale, apoi avansează treptat către scenarii mai complexe. Fiecare exemplu se bazează pe conceptele celor precedente!

## 🚀 Gata să începi?

### Drumul tău de învățare

1. **Începător complet?** → Începe cu [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minute)
2. **Ai cunoștințe de bază AZD?** → Încearcă [Microservicii](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minute)
3. **Construiești aplicații AI?** → Începe cu [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minute) sau explorează [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, peste 2 ore)
4. **Ai nevoie de un stack tehnologic specific?** → Folosește secțiunea [Găsirea exemplului potrivit](../../../examples) de mai sus

### Pașii următori

- ✅ Revizuiește [Prerechizitele](../../../examples) de mai sus
- ✅ Alege un exemplu care se potrivește nivelului tău de competență (vezi [Legenda complexității](../../../examples))
- ✅ Citește cu atenție README-ul exemplului înainte de implementare
- ✅ Setează o reamintire să rulezi `azd down` după testare
- ✅ Împărtășește-ți experiența prin GitHub Issues sau Discussions

### Ai nevoie de ajutor?

- 📖 [FAQ](../resources/faq.md) - Întrebări frecvente și răspunsuri
- 🐛 [Ghid de depanare](../docs/chapter-07-troubleshooting/common-issues.md) - Rezolvă probleme de implementare
- 💬 [Discuții GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Întreabă comunitatea
- 📚 [Ghid de studiu](../resources/study-guide.md) - Întărește-ți cunoștințele

---

**Navigare**
- **📚 Pagina principală curs**: [AZD pentru începători](../README.md)
- **📖 Materiale de studiu**: [Ghid de studiu](../resources/study-guide.md) | [Fișă de referință](../resources/cheat-sheet.md) | [Glosar](../resources/glossary.md)
- **🔧 Resurse**: [FAQ](../resources/faq.md) | [Depanare](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Ultima actualizare: noiembrie 2025 | [Raportează probleme](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuie cu exemple](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinarea responsabilității**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională efectuată de un traducător uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
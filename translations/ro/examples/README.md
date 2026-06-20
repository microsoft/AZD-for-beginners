# Exemple - Șabloane și Configurații Practice AZD

**Învățare prin Exemplu - Organizate pe Capitole**  
- **📚 Pagina Cursului**: [AZD Pentru Începători](../README.md)  
- **📖 Maparea Capitolului**: Exemple organizate după complexitatea învățării  
- **🚀 Exemplu Local**: [Soluția Retail Multi-Agent](retail-scenario.md)  
- **🤖 Exemple Externe AI**: Legături către depozitele Azure Samples  

> **📍 IMPORTANT: Exemple Locale vs Externe**  
> Acest depozit conține **4 exemple locale complete** cu implementări complete:  
> - **Microsoft Foundry Models Chat** (implementare gpt-4.1 cu interfață chat)  
> - **Container Apps** (API simplu Flask + Microservicii)  
> - **Aplicație Bază de Date** (Web + Bază de date SQL)  
> - **Retail Multi-Agent** (Soluție AI Enterprise)  
>  
> Exemplele suplimentare sunt **referințe externe** către depozitele Azure-Samples pe care le poți clona.

## Introducere

Acest director oferă exemple practice și referințe pentru a te ajuta să înveți Azure Developer CLI prin practică directă. Scenariul Retail Multi-Agent este o implementare completă, pregătită pentru producție, inclusă în acest depozit. Exemplele suplimentare fac referire la mostre oficiale Azure care demonstrează diverse modele AZD.

### Legenda Evaluării Complexității

- ⭐ **Începător** - Concepte de bază, serviciu unic, 15-30 minute  
- ⭐⭐ **Intermediar** - Multiple servicii, integrare baze de date, 30-60 minute  
- ⭐⭐⭐ **Avansat** - Arhitectură complexă, integrare AI, 1-2 ore  
- ⭐⭐⭐⭐ **Expert** - Pregătit pentru producție, modele enterprise, 2+ ore  

## 🎯 Ce conține de fapt acest depozit

### ✅ Implementare Locală (Pregătită de utilizare)

#### [Aplicația de Chat Microsoft Foundry Models](azure-openai-chat/README.md) 🆕  
**Implementare completă gpt-4.1 cu interfață chat inclusă în acest depozit**

- **Locație:** `examples/azure-openai-chat/`  
- **Complexitate:** ⭐⭐ (Intermediar)  
- **Ce include:**  
  - Implementare completă Microsoft Foundry Models (gpt-4.1)  
  - Interfață chat în linie de comandă Python  
  - Integrare Key Vault pentru chei API securizate  
  - Șabloane de infrastructură Bicep  
  - Monitorizarea utilizării token-urilor și costurilor  
  - Limitarea ratelor și gestionarea erorilor  

**Pornire Rapidă:**  
```bash
# Navighează către exemplu
cd examples/azure-openai-chat

# Desfășoară totul
azd up

# Instalează dependențele și începe să discuți
pip install -r src/requirements.txt
python src/chat.py
```
  
**Tehnologii:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep  

#### [Exemple Container App](container-app/README.md) 🆕  
**Exemple cuprinzătoare de implementare container inclus în acest depozit**

- **Locație:** `examples/container-app/`  
- **Complexitate:** ⭐-⭐⭐⭐⭐ (De la Începător la Avansat)  
- **Ce include:**  
  - [Ghid Complet](container-app/README.md) - Prezentare generală a implementărilor container  
  - [API simplu Flask](../../../examples/container-app/simple-flask-api) - Exemplu bazic REST API  
  - [Arhitectură Microservicii](../../../examples/container-app/microservices) - Implementare multi-servicii pregătită pentru producție  
  - Modele de Pornire Rapidă, Producție și Avansate  
  - Monitorizare, securitate și optimizare costuri  

**Pornire Rapidă:**  
```bash
# Vizualizați ghidul principal
cd examples/container-app

# Implementați un API Flask simplu
cd simple-flask-api
azd up

# Implementați un exemplu de microservicii
cd ../microservices
azd up
```
  
**Tehnologii:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights  

#### [Soluția Retail Multi-Agent](retail-scenario.md) 🆕  
**Implementare completă pregătită pentru producție inclusă în acest depozit**

- **Locație:** `examples/retail-multiagent-arm-template/`  
- **Complexitate:** ⭐⭐⭐⭐ (Avansat)  
- **Ce include:**  
  - Șablon complet de implementare ARM  
  - Arhitectură multi-agent (Client + Inventar)  
  - Integrare Microsoft Foundry Models  
  - Căutare AI cu RAG  
  - Monitorizare complexă  
  - Script de implementare cu un singur click  

**Pornire Rapidă:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Tehnologii:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 Mostre Externe Azure (Clonează pentru utilizare)

Următoarele exemple sunt întreținute în depozitele oficiale Azure-Samples. Clonează-le pentru a explora diferite modele AZD:

### Aplicații Simple (Capitolele 1-2)

| Șablon | Depozit | Complexitate | Servicii |  
|:---------|:-----------|:-----------|:---------|  
| **Python Flask API** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |  
| **Microservicii** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-serviciu, Service Bus, Cosmos DB, SQL |  
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |  
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |  
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Cum se folosesc:**  
```bash
# Clonează orice exemplu
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Deploiază
azd up
```
  
### Exemple Aplicații AI (Capitolele 2, 5, 8)

| Șablon | Depozit | Complexitate | Focus |  
|:---------|:-----------|:-----------|:------|  
| **Microsoft Foundry Models Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Implementare gpt-4.1 |  
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat AI de bază |  
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Cadru agent |  
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Model RAG |  
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI Enterprise |

### Bazele de Date & Modele Avansate (Capitolele 3-8)

| Șablon | Depozit | Complexitate | Focus |  
|:---------|:-----------|:-----------|:------|  
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrare bază de date |  
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |  
| **Java Microservicii** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-serviciu |  
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Obiective de Învățare

Parcurgând aceste exemple, vei:  
- Exersa fluxuri de lucru Azure Developer CLI cu scenarii realiste de aplicații  
- Înțelege arhitecturi diferite de aplicații și implementările lor azd  
- Stăpâni modele Infrastructure as Code pentru diverse servicii Azure  
- Aplica managementul configurației și strategii de implementare specifice mediului  
- Implementa modele de monitorizare, securitate și scalare în contexte practice  
- Căpăta experiență în depanarea și rezolvarea problemelor în scenarii reale de implementare  

## Rezultate de Învățare

După finalizarea acestor exemple, vei putea:  
- Implementa diverse tipuri de aplicații folosind Azure Developer CLI cu încredere  
- Adapta șabloanele furnizate la cerințele proprii ale aplicațiilor tale  
- Proiecta și implementa modele custom de infrastructură folosind Bicep  
- Configura aplicații complexe multi-servicii cu dependențe corecte  
- Aplica bune practici de securitate, monitorizare și performanță în scenarii reale  
- Depana și optimiza implementările bazându-te pe experiență practică  

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
  
## Exemple de Pornire Rapidă

> **💡 Nou în AZD?** Începe cu exemplul #1 (Flask API) - durează ~20 minute și învață concepte de bază.

### Pentru Începători  
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Implementare API REST simplu cu scalare la zero  
   **Durată:** 20-25 minute | **Cost:** $0-5/lună  
   **Veți învăța:** flux de lucru azd de bază, containerizare, probe de sănătate  
   **Rezultat așteptat:** Endpoint API funcțional care returnează "Hello, World!" cu monitorizare  

2. **[Aplicație Web Simplă - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Implementare aplicație web Node.js Express cu MongoDB  
   **Durată:** 25-35 minute | **Cost:** $10-30/lună  
   **Veți învăța:** integrare bază de date, variabile de mediu, stringuri de conexiune  
   **Rezultat așteptat:** Aplicație listă todo cu funcționalități create/citit/actualizat/șters  

3. **[Website Static - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Găzduire site static React cu Azure Static Web Apps  
   **Durată:** 20-30 minute | **Cost:** $0-10/lună  
   **Veți învăța:** hosting static, funcții fără server, implementare CDN  
   **Rezultat așteptat:** UI React cu backend API, SSL automat, CDN global  

### Pentru Utilizatori Intermediari  
4. **[Aplicația de Chat Microsoft Foundry Models](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Implementare gpt-4.1 cu interfață chat și management sigur al cheilor API  
   **Durată:** 35-45 minute | **Cost:** $50-200/lună  
   **Veți învăța:** implementare Microsoft Foundry Models, integrare Key Vault, monitorizarea token-urilor  
   **Rezultat așteptat:** Aplicație de chat funcțională cu gpt-4.1 și monitorizare costuri  

5. **[Container App - Microservicii](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Arhitectură multi-serviciu pregătită pentru producție  
   **Durată:** 45-60 minute | **Cost:** $50-150/lună  
   **Veți învăța:** comunicare servicii, cozi de mesaje, trasabilitate distribuită  
   **Rezultat așteptat:** Sistem 2-servicii (API Gateway + Serviciu Produs) cu monitorizare  

6. **[Aplicație Bază de Date - C# cu Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplicație Web cu API C# și Azure SQL Database  
   **Durată:** 30-45 minute | **Cost:** $20-80/lună  
   **Veți învăța:** Entity Framework, migrații baze de date, securitatea conexiunii  
   **Rezultat așteptat:** API C# cu backend Azure SQL, implementare automată schema  

7. **[Funcție Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Azure Functions în Python cu trigger-e HTTP și Cosmos DB  
   **Durată:** 30-40 minute | **Cost:** $10-40/lună  
   **Veți învăța:** arhitectură orientată pe evenimente, scalare serverless, integrare NoSQL  
   **Rezultat așteptat:** Aplicație Funcții răspunzând la cereri HTTP cu stocare Cosmos DB  

8. **[Microservicii - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplicație multi-servicii Java cu Container Apps și API Gateway  
   **Durată:** 60-90 minute | **Cost:** $80-200/lună  
   **Veți învăța:** implementare Spring Boot, service mesh, echilibrare încărcare  
   **Rezultat așteptat:** Sistem multi-servicii Java cu descoperire servicii și rutare  

### Șabloane Microsoft Foundry

1. **[Aplicație Chat Microsoft Foundry Models - Exemplu Local](../../../examples/azure-openai-chat)** ⭐⭐  
   Implementare completă gpt-4.1 cu interfață chat  
   **Durată:** 35-45 minute | **Cost:** $50-200/lună  
   **Rezultat așteptat:** Aplicație chat funcțională cu monitorizare token și costuri  

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplicație chat inteligentă cu arhitectură RAG  
   **Durată:** 60-90 minute | **Cost:** $100-300/lună  
   **Rezultat așteptat:** Interfață chat bazată pe RAG cu căutare documente și citări  

3. **[Prelucrare Documente AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analiză documente folosind servicii AI Azure  
   **Durată:** 40-60 minute | **Cost:** $20-80/lună  
   **Rezultat așteptat:** API care extrage text, tabele și entități din documente încărcate  

4. **[Pipeline Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Flux de lucru MLOps cu Azure Machine Learning  
   **Durată:** 2-3 ore | **Cost:** $150-500/lună  
   **Rezultat așteptat:** Pipeline ML automatizat cu antrenare, implementare și monitorizare  

### Scenarii din Lumea Reală

#### **Soluția Retail Multi-Agent** 🆕  
**[Ghid Complet de Implementare](./retail-scenario.md)**

O soluție cuprinzătoare, pregătită pentru producție, multi-agent de suport clienți care demonstrează implementarea aplicațiilor AI de nivel enterprise cu AZD. Acest scenariu oferă:

- **Arhitectură Completă**: Sistem multi-agent cu agenți specializați pentru servicii clienți și gestionare inventar
- **Infrastructură de Producție**: Implementări Microsoft Foundry Models multi-regiune, AI Search, Container Apps și monitorizare cuprinzătoare  
- **Șablon ARM gata de implementare**: Implementare cu un singur clic cu multiple moduri de configurare (Minimal/Standard/Premium)  
- **Funcționalități Avansate**: Validarea securității red teaming, cadru pentru evaluarea agenților, optimizarea costurilor și ghiduri de depanare  
- **Context Real de Afaceri**: Caz de utilizare pentru suportul clienților retailerilor cu încărcare de fișiere, integrare în căutare și scalare dinamică  

**Tehnologii**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Complexitate**: ⭐⭐⭐⭐ (Avansat - Pregătit pentru Producție Enterprise)  

**Potrivit pentru**: Dezvoltatori AI, arhitecți de soluții și echipe care construiesc sisteme multi-agent în producție  

**Pornire rapidă**: Implementați soluția completă în mai puțin de 30 de minute folosind șablonul ARM inclus cu `./deploy.sh -g myResourceGroup`  

## 📋 Instrucțiuni de utilizare

### Precondiții

Înainte de a rula orice exemplu:  
- ✅ Abonament Azure cu acces Owner sau Contributor  
- ✅ Azure Developer CLI instalat ([Ghid de instalare](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop în funcțiune (pentru exemple cu containere)  
- ✅ Cotele Azure corespunzătoare (verificați cerințele specifice pentru fiecare exemplu)  

> **💰 Avertisment costuri:** Toate exemplele creează resurse reale Azure care presupun costuri. Consultați fișierele README individuale pentru estimări de cost. Nu uitați să rulați `azd down` la final pentru a evita costuri continue.  

### Executarea exemplelor local

1. **Clonați sau copiați exemplul**  
   ```bash
   # Navigați la exemplul dorit
   cd examples/simple-web-app
   ```
  
2. **Inițializați mediul AZD**  
   ```bash
   # Inițializați cu șablonul existent
   azd init
   
   # Sau creați un mediu nou
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
   # Obține punctele finale ale serviciului
   azd env get-values
   
   # Testează punctul final (exemplu)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Indicatori așteptați de succes:**  
   - ✅ `azd up` se finalizează fără erori  
   - ✅ Endpoint-ul serviciului returnează HTTP 200  
   - ✅ Portalul Azure afișează statusul „Running”  
   - ✅ Application Insights primește datele telemetrice  

> **⚠️ Probleme?** Consultați [Probleme Comune](../docs/chapter-07-troubleshooting/common-issues.md) pentru depanarea implementării  

### Adaptarea exemplelor

Fiecare exemplu include:  
- **README.md** - Instrucțiuni detaliate de configurare și personalizare  
- **azure.yaml** - Configurare AZD cu comentarii  
- **infra/** - Șabloane Bicep cu explicații pentru parametri  
- **src/** - Codul aplicației exemplu  
- **scripts/** - Scripturi de suport pentru sarcini comune  

## 🎯 Obiective de învățare

### Categorii de exemple

#### **Implementări de bază**  
- Aplicații cu un singur serviciu  
- Modele simple de infrastructură  
- Management de bază al configurației  
- Configurări de dezvoltare eficiente din punct de vedere al costului  

#### **Scenarii avansate**  
- Arhitecturi multi-serviciu  
- Configurări complexe de rețea  
- Modele de integrare a bazelor de date  
- Implementări de securitate și conformitate  

#### **Modele pregătite pentru producție**  
- Configurări de înaltă disponibilitate  
- Monitorizare și observabilitate  
- Integrare CI/CD  
- Configurări pentru recuperare după dezastru  

## 📖 Descrieri exemple

### Aplicație web simplă - Node.js Express  
**Tehnologii**: Node.js, Express, MongoDB, Container Apps  
**Complexitate**: Începător  
**Concepte**: Implementare de bază, REST API, integrare bază de date NoSQL  

### Website static - React SPA  
**Tehnologii**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexitate**: Începător  
**Concepte**: Găzduire statică, backend serverless, dezvoltare web modernă  

### Container App - Python Flask  
**Tehnologii**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexitate**: Începător  
**Concepte**: Containerizare, REST API, scalare la zero, probe de sănătate, monitorizare  
**Locație**: [Exemplu Local](../../../examples/container-app/simple-flask-api)  

### Container App - Arhitectură Microservicii  
**Tehnologii**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexitate**: Avansat  
**Concepte**: Arhitectură multi-serviciu, comunicare între servicii, cozi de mesaje, trasare distribuită  
**Locație**: [Exemplu Local](../../../examples/container-app/microservices)  

### Aplicație de baze de date - C# cu Azure SQL  
**Tehnologii**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexitate**: Intermediar  
**Concepte**: Entity Framework, conexiuni la baze de date, dezvoltare web API  

### Funcție serverless - Python Azure Functions  
**Tehnologii**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexitate**: Intermediar  
**Concepte**: Arhitectură eveniment-driven, calcul serverless, dezvoltare full-stack  

### Microservicii - Java Spring Boot  
**Tehnologii**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexitate**: Intermediar  
**Concepte**: Comunicare între microservicii, sisteme distribuite, modele enterprise  

### Exemple Microsoft Foundry

#### Aplicație chat Microsoft Foundry Models  
**Tehnologii**: Microsoft Foundry Models, Azure AI Search, App Service  
**Complexitate**: Intermediar  
**Concepte**: Arhitectură RAG, căutare vectorială, integrare LLM  

#### Procesare documente AI  
**Tehnologii**: Azure AI Document Intelligence, Storage, Functions  
**Complexitate**: Intermediar  
**Concepte**: Analiză documente, OCR, extragere date  

#### Pipeline Machine Learning  
**Tehnologii**: Azure ML, MLOps, Container Registry  
**Complexitate**: Avansat  
**Concepte**: Antrenare modele, pipeline-uri de implementare, monitorizare  

## 🛠 Exemple de configurare  

Directorul `configurations/` conține componente reutilizabile:  

### Configurări de mediu  
- Setări pentru mediu de dezvoltare  
- Configurări de mediu staging  
- Configurări pregătite pentru producție  
- Setări pentru implementări multi-regiune  

### Module Bicep  
- Componente infrastructură reutilizabile  
- Modele comune de resurse  
- Șabloane securizate  
- Configurări optimizate pentru cost  

### Scripturi de suport  
- Automatizare configurare mediu  
- Scripturi de migrare baze de date  
- Unelte pentru validarea implementării  
- Utilitare pentru monitorizarea costurilor  

## 🔧 Ghid de personalizare

### Adaptarea exemplelor pentru cazul tău de utilizare

1. **Revizuiește precondițiile**  
   - Verifică cerințele serviciilor Azure  
   - Verifică limitele abonamentului  
   - Înțelege implicațiile costurilor  

2. **Modifică configurația**  
   - Actualizează definițiile serviciilor în `azure.yaml`  
   - Personalizează șabloanele Bicep  
   - Ajustează variabilele de mediu  

3. **Testează riguros**  
   - Implementează mai întâi în mediu de dezvoltare  
   - Validează funcționalitatea  
   - Testează scalarea și performanța  

4. **Revizie de securitate**  
   - Verifică controalele de acces  
   - Implementează managementul secretelor  
   - Activează monitorizarea și alertarea  

## 📊 Matrice de comparație

| Exemplu                          | Servicii | Bază de date | Autentificare | Monitorizare | Complexitate  |
|---------------------------------|----------|--------------|---------------|--------------|--------------|
| **Microsoft Foundry Models Chat** (Local) | 2        | ❌           | Key Vault    | Complet      | ⭐⭐           |
| **Python Flask API** (Local)     | 1        | ❌           | Basic         | Complet      | ⭐            |
| **Microservicii** (Local)        | 5+       | ✅           | Enterprise    | Avansat      | ⭐⭐⭐⭐         |
| Node.js Express Todo             | 2        | ✅           | Basic         | Basic        | ⭐            |
| React SPA + Functions            | 3        | ✅           | Basic         | Complet      | ⭐            |
| Python Flask Container           | 2        | ❌           | Basic         | Complet      | ⭐            |
| C# Web API + SQL                | 2        | ✅           | Complet       | Complet      | ⭐⭐           |
| Python Functions + SPA           | 3        | ✅           | Complet       | Complet      | ⭐⭐           |
| Java Microservicii               | 5+       | ✅           | Complet       | Complet      | ⭐⭐           |
| Microsoft Foundry Models Chat    | 3        | ✅           | Complet       | Complet      | ⭐⭐⭐          |
| AI Document Processing           | 2        | ❌           | Basic         | Complet      | ⭐⭐           |
| ML Pipeline                     | 4+       | ✅           | Complet       | Complet      | ⭐⭐⭐⭐         |
| **Retail Multi-Agent** (Local)  | **8+**   | **✅**       | **Enterprise**| **Avansat**  | **⭐⭐⭐⭐**     |

## 🎓 Parcurs de învățare

### Progresie recomandată

1. **Începe cu Aplicația web simplă**  
   - Învață conceptele de bază AZD  
   - Înțelege fluxul de implementare  
   - Exersează managementul mediului  

2. **Încearcă Website-ul static**  
   - Explorează diferite opțiuni de găzduire  
   - Învață despre integrarea CDN  
   - Înțelege configurația DNS  

3. **Treci la Container App**  
   - Învață noțiuni de bază despre containerizare  
   - Înțelege conceptele de scalare  
   - Exersează cu Docker  

4. **Adaugă integrare de baze de date**  
   - Învățare despre provisioning baze de date  
   - Înțelege string-uri de conectare  
   - Exersează managementul secretelor  

5. **Explorează Serverless**  
   - Înțelege arhitectura bazată pe evenimente  
   - Învață despre triggeri și binding-uri  
   - Exersează cu API-uri  

6. **Construiește Microservicii**  
   - Învață comunicarea între servicii  
   - Înțelege sistemele distribuite  
   - Exersează implementări complexe  

## 🔍 Cum să găsești exemplul potrivit

### După tehnologie  
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **Containere**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices  
- **Baze de date**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Sisteme Multi-Agent**: **Retail Multi-Agent Solution**  
- **Integrare OpenAI**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Enterprise în producție**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### După tipar arhitectural  
- **REST API simplu**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)  
- **Monolitic**: Node.js Express Todo, C# Web API + SQL  
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Microservicii**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **Containerizat**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)  
- **Cu Inteligență Artificială**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Arhitectură Multi-Agent**: **Retail Multi-Agent Solution**  
- **Enterprise Multi-Serviciu**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### După nivel de complexitate  
- **Începător**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Intermediar**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing  
- **Avansat**: ML Pipeline  
- **Pregătit pentru Producție Enterprise**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-serviciu cu cozi de mesaje), **Retail Multi-Agent Solution** (Sistem multi-agent complet cu implementare ARM template)  

## 📚 Resurse suplimentare

### Linkuri către documentație  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Documentație Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Exemple din comunitate  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Galeria Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [Aplicație Todo cu C# și Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Aplicație Todo cu Python și MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Aplicație Todo cu Node.js și PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplicație web React cu API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Job Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions cu Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Cele mai bune practici
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuie cu exemple

Ai un exemplu util de împărtășit? Primim cu drag contribuții!

### Ghid pentru trimitere
1. Urmează structura de directoare stabilită
2. Include un README.md complet
3. Adaugă comentarii în fișierele de configurare
4. Testează temeinic înainte de a trimite
5. Include estimări de cost și cerințe preliminare

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

**Sfat util**: Începe cu cel mai simplu exemplu care se potrivește tehnologiei tale, apoi avansează treptat către scenarii mai complexe. Fiecare exemplu se bazează pe conceptele celor precedente!

## 🚀 Gata să începi?

### Calea ta de învățare

1. **Începător complet?** → Începe cu [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Ai cunoștințe de bază AZD?** → Încearcă [Microservicii](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Construiești aplicații AI?** → Începe cu [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) sau explorează [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, peste 2 ore)
4. **Ai nevoie de un anumit stack tehnologic?** → Folosește secțiunea [Găsirea exemplului potrivit](#-finding-the-right-example) de mai sus

### Pașii următori

- ✅ Revizuiește [Cerințele preliminare](#precondiții) de mai sus
- ✅ Alege un exemplu potrivit nivelului tău de competență (vezi [Legenda complexității](#legenda-evaluării-complexității))
- ✅ Citește în detaliu README-ul exemplului înainte de implementare
- ✅ Setează o reamintire pentru a rula `azd down` după testare
- ✅ Împărtășește experiența ta prin GitHub Issues sau Discussions

### Ai nevoie de ajutor?

- 📖 [Întrebări frecvente](../resources/faq.md) - Răspunsuri la întrebări comune
- 🐛 [Ghid de depanare](../docs/chapter-07-troubleshooting/common-issues.md) - Remediază problemele de implementare
- 💬 [Discuții GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Întreabă comunitatea
- 📚 [Ghid de studiu](../resources/study-guide.md) - Consolidează-ți învățarea

---

**Navigare**
- **📚 Pagina principală curs**: [AZD Pentru Începători](../README.md)
- **📖 Materiale de studiu**: [Ghid de studiu](../resources/study-guide.md) | [Fișă de ajutor](../resources/cheat-sheet.md) | [Glosar](../resources/glossary.md)
- **🔧 Resurse**: [Întrebări frecvente](../resources/faq.md) | [Depanare](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Ultima actualizare: noiembrie 2025 | [Raportează probleme](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuie cu exemple](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:24:48+00:00",
  "source_file": "examples/README.md",
  "language_code": "ro"
}
-->
# Exemple - Șabloane și Configurații Practice AZD

## Introducere

Acest director conține exemple practice, șabloane și scenarii reale pentru a te ajuta să înveți Azure Developer CLI prin practică. Fiecare exemplu oferă cod complet funcțional, șabloane de infrastructură și instrucțiuni detaliate pentru diferite arhitecturi de aplicații și modele de implementare.

## Obiective de Învățare

Lucrând prin aceste exemple, vei:
- Exersa fluxurile de lucru Azure Developer CLI cu scenarii realiste de aplicații
- Înțelege diferite arhitecturi de aplicații și implementările lor cu azd
- Stăpâni modelele Infrastructure as Code pentru diverse servicii Azure
- Aplica strategii de gestionare a configurației și implementări specifice mediului
- Implementa modele de monitorizare, securitate și scalare în contexte practice
- Dobândi experiență în depanarea și rezolvarea problemelor reale de implementare

## Rezultate de Învățare

După finalizarea acestor exemple, vei putea:
- Implementa cu încredere diverse tipuri de aplicații folosind Azure Developer CLI
- Adapta șabloanele furnizate la cerințele proprii ale aplicației tale
- Proiecta și implementa modele personalizate de infrastructură folosind Bicep
- Configura aplicații complexe multi-servicii cu dependențe corecte
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

## Exemple de Start Rapid

### Pentru Începători
1. **[Aplicație Web Simplă - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Implementarea unei aplicații web Node.js Express cu MongoDB
2. **[Website Static - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Găzduirea unui website static React cu Azure Static Web Apps
3. **[Aplicație Containerizată - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Implementarea unei aplicații Python Flask containerizate

### Pentru Utilizatori Intermediari
4. **[Aplicație cu Bază de Date - C# cu Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Aplicație web cu API C# și baza de date Azure SQL
5. **[Funcție Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Funcții Azure Python cu declanșatori HTTP și Cosmos DB
6. **[Microservicii - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Aplicație Java multi-servicii cu Container Apps și API gateway

### Șabloane Azure AI Foundry

1. **[Aplicație Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Aplicație inteligentă de chat cu Azure OpenAI
2. **[Procesare Documente AI](https://github.com/Azure-Samples/azure-ai-document-processing)** - Analiza documentelor folosind serviciile Azure AI
3. **[Pipeline de Machine Learning](https://github.com/Azure-Samples/mlops-v2)** - Flux de lucru MLOps cu Azure Machine Learning

## 📋 Instrucțiuni de Utilizare

### Rularea Exemplelor Local

1. **Clonează sau Copiază Exemplul**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inițializează Mediul AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Configurează Mediul**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Implementează**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Adaptarea Exemplelor

Fiecare exemplu include:
- **README.md** - Instrucțiuni detaliate de configurare și personalizare
- **azure.yaml** - Configurație AZD cu comentarii
- **infra/** - Șabloane Bicep cu explicații ale parametrilor
- **src/** - Cod de aplicație exemplu
- **scripts/** - Scripturi ajutătoare pentru sarcini comune

## 🎯 Obiective de Învățare

### Categorii de Exemple

#### **Implementări de Bază**
- Aplicații cu un singur serviciu
- Modele simple de infrastructură
- Gestionarea de bază a configurației
- Configurații economice pentru dezvoltare

#### **Scenarii Avansate**
- Arhitecturi multi-servicii
- Configurații complexe de rețea
- Modele de integrare a bazelor de date
- Implementări de securitate și conformitate

#### **Modele Pregătite pentru Producție**
- Configurații de înaltă disponibilitate
- Monitorizare și observabilitate
- Integrare CI/CD
- Configurații pentru recuperare în caz de dezastru

## 📖 Descrierea Exemplelor

### Aplicație Web Simplă - Node.js Express
**Tehnologii**: Node.js, Express, MongoDB, Container Apps  
**Complexitate**: Începător  
**Concepte**: Implementare de bază, REST API, integrare bază de date NoSQL

### Website Static - React SPA
**Tehnologii**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexitate**: Începător  
**Concepte**: Găzduire statică, backend serverless, dezvoltare web modernă

### Aplicație Containerizată - Python Flask
**Tehnologii**: Python Flask, Docker, Container Apps, Container Registry  
**Complexitate**: Începător  
**Concepte**: Containerizare, arhitectură microservicii, dezvoltare API

### Aplicație cu Bază de Date - C# cu Azure SQL
**Tehnologii**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexitate**: Intermediar  
**Concepte**: Entity Framework, conexiuni la bază de date, dezvoltare API web

### Funcție Serverless - Python Azure Functions
**Tehnologii**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexitate**: Intermediar  
**Concepte**: Arhitectură bazată pe evenimente, calcul serverless, dezvoltare full-stack

### Microservicii - Java Spring Boot
**Tehnologii**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexitate**: Intermediar  
**Concepte**: Comunicare între microservicii, sisteme distribuite, modele enterprise

### Exemple Azure AI Foundry

#### Aplicație Chat Azure OpenAI
**Tehnologii**: Azure OpenAI, Cognitive Search, App Service  
**Complexitate**: Intermediar  
**Concepte**: Arhitectură RAG, căutare vectorială, integrare LLM

#### Procesare Documente AI
**Tehnologii**: Azure AI Document Intelligence, Storage, Functions  
**Complexitate**: Intermediar  
**Concepte**: Analiza documentelor, OCR, extragerea datelor

#### Pipeline de Machine Learning
**Tehnologii**: Azure ML, MLOps, Container Registry  
**Complexitate**: Avansat  
**Concepte**: Antrenarea modelelor, fluxuri de implementare, monitorizare

## 🛠 Exemple de Configurații

Directorul `configurations/` conține componente reutilizabile:

### Configurații de Mediu
- Setări pentru mediu de dezvoltare
- Configurații pentru mediu de testare
- Configurații pregătite pentru producție
- Configurații pentru implementări multi-regiune

### Module Bicep
- Componente de infrastructură reutilizabile
- Modele comune de resurse
- Șabloane securizate
- Configurații optimizate pentru costuri

### Scripturi Ajutătoare
- Automatizarea configurării mediului
- Scripturi de migrare a bazelor de date
- Instrumente de validare a implementării
- Utilitare pentru monitorizarea costurilor

## 🔧 Ghid de Personalizare

### Adaptarea Exemplelor la Cazul Tău

1. **Revizuiește Prerechizitele**
   - Verifică cerințele serviciilor Azure
   - Confirmă limitele abonamentului
   - Înțelege implicațiile costurilor

2. **Modifică Configurația**
   - Actualizează definițiile serviciilor din `azure.yaml`
   - Personalizează șabloanele Bicep
   - Ajustează variabilele de mediu

3. **Testează Temeinic**
   - Implementează mai întâi în mediul de dezvoltare
   - Validează funcționalitatea
   - Testează scalarea și performanța

4. **Revizuiește Securitatea**
   - Verifică controalele de acces
   - Implementează gestionarea secretelor
   - Activează monitorizarea și alertele

## 📊 Matrice de Comparare

| Exemplu | Servicii | Bază de Date | Autentificare | Monitorizare | Complexitate |
|---------|----------|--------------|---------------|--------------|--------------|
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |

## 🎓 Parcurs de Învățare

### Progres Recomandat

1. **Începe cu Aplicația Web Simplă**
   - Învață conceptele de bază AZD
   - Înțelege fluxul de implementare
   - Exersează gestionarea mediului

2. **Încearcă Website-ul Static**
   - Explorează opțiuni diferite de găzduire
   - Învață despre integrarea CDN
   - Înțelege configurarea DNS

3. **Treci la Aplicația Containerizată**
   - Învață bazele containerizării
   - Înțelege conceptele de scalare
   - Exersează cu Docker

4. **Adaugă Integrarea Bazei de Date**
   - Învață despre aprovizionarea bazelor de date
   - Înțelege șirurile de conexiune
   - Exersează gestionarea secretelor

5. **Explorează Serverless**
   - Înțelege arhitectura bazată pe evenimente
   - Învață despre declanșatori și legături
   - Exersează cu API-uri

6. **Construiește Microservicii**
   - Învață comunicarea între servicii
   - Înțelege sistemele distribuite
   - Exersează implementări complexe

## 🔍 Găsirea Exemplului Potrivit

### După Stack-ul Tehnologic
- **Node.js**: Aplicația Node.js Express Todo
- **Python**: Aplicația Python Flask Container, Python Functions + SPA
- **C#**: Aplicația C# Web API + SQL Database, Aplicația Chat Azure OpenAI, Pipeline ML
- **Java**: Microservicii Java Spring Boot
- **React**: React SPA + Functions
- **Containere**: Aplicația Python Flask Container, Microservicii Java
- **Baze de Date**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Aplicația Chat Azure OpenAI, Procesare Documente AI, Pipeline ML

### După Modelul Arhitectural
- **Monolitic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservicii**: Microservicii Java Spring Boot
- **Containerizat**: Aplicația Python Flask Container
- **AI-Powered**: Aplicația Chat Azure OpenAI, Procesare Documente AI, Pipeline ML

### După Nivelul de Complexitate
- **Începător**: Node.js Express Todo, React SPA + Functions, Aplicația Python Flask Container
- **Intermediar**: C# Web API + SQL, Python Functions + SPA, Microservicii Java, Aplicația Chat Azure OpenAI, Procesare Documente AI
- **Avansat**: Pipeline ML

## 📚 Resurse Suplimentare

### Link-uri Documentație
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Șabloane Azure AI Foundry AZD](https://github.com/Azure/ai-foundry-templates)
- [Documentație Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centrul de Arhitectură Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Exemple Comunitare
- [Șabloane AZD Azure Samples](https://github.com/Azure-Samples/azd-templates)
- [Șabloane Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galeria Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Aplicație Todo cu C# și Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Aplicație Todo cu Python și MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplicație Todo cu Node.js și PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplicație Web React cu API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Job Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Funcții Azure cu Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Cele Mai Bune Practici
- [Framework-ul Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Framework-ul de Adoptare Cloud](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuirea Exemplelor

Ai un exemplu util de împărtășit? Acceptăm contribuții!

### Ghid de Trimitere
1. Urmează structura de director stabilită
2. Include README.md cuprinzător
3. Adaugă comentarii la fișierele de configurație
4. Testează temeinic înainte de trimitere
5. Include estimări de costuri și prerechizite

### Structura Șablonului de Exemplu
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

**Sfat Util**: Începe cu cel mai simplu exemplu care se potrivește stack-ului tău tehnologic, apoi avansează treptat către scenarii mai complexe. Fiecare exemplu construiește pe conceptele din cele anterioare!

**Pași Următori**: 
- Alege un exemplu care se potrivește nivelului tău de competență
- Urmează instrucțiunile de configurare din README-ul exemplului
- Experimentează cu personalizări
- Împărtășește învățăturile tale cu comunitatea

---

**Navigare**
- **Lecția Anterioară**: [Ghid de Studiu](../resources/study-guide.md)
- **Întoarcere la**: [README Principal](../README.md)

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
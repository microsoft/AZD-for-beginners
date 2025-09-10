<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:30:09+00:00",
  "source_file": "examples/README.md",
  "language_code": "lt"
}
-->
# Pavyzdžiai - Praktiniai AZD šablonai ir konfigūracijos

## Įvadas

Šiame kataloge rasite praktinius pavyzdžius, šablonus ir realaus pasaulio scenarijus, kurie padės jums išmokti naudotis Azure Developer CLI per praktinę veiklą. Kiekvienas pavyzdys pateikia pilnai veikiančius kodus, infrastruktūros šablonus ir išsamias instrukcijas skirtingoms programų architektūroms bei diegimo modeliams.

## Mokymosi tikslai

Dirbdami su šiais pavyzdžiais, jūs:
- Praktikuosite Azure Developer CLI darbo eigas su realistiniais programų scenarijais
- Suprasite skirtingas programų architektūras ir jų azd įgyvendinimus
- Įvaldysite infrastruktūros kaip kodo modelius įvairioms Azure paslaugoms
- Taikysite konfigūracijos valdymo ir aplinkai specifines diegimo strategijas
- Įgyvendinsite stebėjimo, saugumo ir mastelio keitimo modelius praktiniuose kontekstuose
- Įgysite patirties sprendžiant problemas ir derinant realius diegimo scenarijus

## Mokymosi rezultatai

Baigę šiuos pavyzdžius, jūs galėsite:
- Pasitikėdami diegti įvairių tipų programas naudodami Azure Developer CLI
- Pritaikyti pateiktus šablonus savo programų poreikiams
- Kurti ir įgyvendinti individualius infrastruktūros modelius naudojant Bicep
- Konfigūruoti sudėtingas daugiapaslaugines programas su tinkamomis priklausomybėmis
- Taikyti saugumo, stebėjimo ir našumo geriausias praktikas realiuose scenarijuose
- Spręsti problemas ir optimizuoti diegimus remiantis praktine patirtimi

## Katalogo struktūra

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

## Greito starto pavyzdžiai

### Pradedantiesiems
1. **[Paprasta žiniatinklio programa - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Diegti Node.js Express žiniatinklio programą su MongoDB
2. **[Statinė svetainė - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Talpinti React statinę svetainę su Azure Static Web Apps
3. **[Konteinerinė programa - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Diegti konteinerizuotą Python Flask programą

### Vidutinio lygio vartotojams
4. **[Duomenų bazės programa - C# su Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Žiniatinklio programa su C# API ir Azure SQL duomenų baze
5. **[Serverless funkcija - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions su HTTP trigeriais ir Cosmos DB
6. **[Mikropaslaugos - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Daugiapaslaugė Java programa su Container Apps ir API gateway

### Azure AI Foundry šablonai

1. **[Azure OpenAI pokalbių programa](https://github.com/Azure-Samples/azure-search-openai-demo)** - Išmani pokalbių programa su Azure OpenAI
2. **[AI dokumentų apdorojimas](https://github.com/Azure-Samples/azure-ai-document-processing)** - Dokumentų analizė naudojant Azure AI paslaugas
3. **[Mašininio mokymosi pipeline](https://github.com/Azure-Samples/mlops-v2)** - MLOps darbo eiga su Azure Machine Learning

## 📋 Naudojimo instrukcijos

### Pavyzdžių paleidimas vietoje

1. **Klonuoti arba kopijuoti pavyzdį**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inicializuoti AZD aplinką**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfigūruoti aplinką**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Diegti**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Pavyzdžių pritaikymas

Kiekvienas pavyzdys apima:
- **README.md** - Išsamias nustatymo ir pritaikymo instrukcijas
- **azure.yaml** - AZD konfigūracija su komentarais
- **infra/** - Bicep šablonai su parametrų paaiškinimais
- **src/** - Pavyzdinis programos kodas
- **scripts/** - Pagalbiniai skriptai bendroms užduotims

## 🎯 Mokymosi tikslai

### Pavyzdžių kategorijos

#### **Pagrindiniai diegimai**
- Vienos paslaugos programos
- Paprasti infrastruktūros modeliai
- Pagrindinis konfigūracijos valdymas
- Ekonomiški kūrimo nustatymai

#### **Sudėtingi scenarijai**
- Daugiapaslaugės architektūros
- Sudėtingos tinklo konfigūracijos
- Duomenų bazės integracijos modeliai
- Saugumo ir atitikties įgyvendinimai

#### **Paruošti gamybai modeliai**
- Aukšto prieinamumo konfigūracijos
- Stebėjimas ir stebimumas
- CI/CD integracija
- Atsigavimo po nelaimių nustatymai

## 📖 Pavyzdžių aprašymai

### Paprasta žiniatinklio programa - Node.js Express
**Technologijos**: Node.js, Express, MongoDB, Container Apps  
**Sudėtingumas**: Pradedantiesiems  
**Koncepcijos**: Pagrindinis diegimas, REST API, NoSQL duomenų bazės integracija

### Statinė svetainė - React SPA
**Technologijos**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Sudėtingumas**: Pradedantiesiems  
**Koncepcijos**: Statinis talpinimas, serverless backend, modernus žiniatinklio kūrimas

### Konteinerinė programa - Python Flask
**Technologijos**: Python Flask, Docker, Container Apps, Container Registry  
**Sudėtingumas**: Pradedantiesiems  
**Koncepcijos**: Konteinerizacija, mikropaslaugų architektūra, API kūrimas

### Duomenų bazės programa - C# su Azure SQL
**Technologijos**: C# ASP.NET Core, Azure SQL Database, App Service  
**Sudėtingumas**: Vidutinis  
**Koncepcijos**: Entity Framework, duomenų bazės jungtys, žiniatinklio API kūrimas

### Serverless funkcija - Python Azure Functions
**Technologijos**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Sudėtingumas**: Vidutinis  
**Koncepcijos**: Įvykių pagrįsta architektūra, serverless skaičiavimai, pilnas programų kūrimas

### Mikropaslaugos - Java Spring Boot
**Technologijos**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Sudėtingumas**: Vidutinis  
**Koncepcijos**: Mikropaslaugų komunikacija, paskirstytos sistemos, įmonės modeliai

### Azure AI Foundry pavyzdžiai

#### Azure OpenAI pokalbių programa
**Technologijos**: Azure OpenAI, Cognitive Search, App Service  
**Sudėtingumas**: Vidutinis  
**Koncepcijos**: RAG architektūra, vektorinė paieška, LLM integracija

#### AI dokumentų apdorojimas
**Technologijos**: Azure AI Document Intelligence, Storage, Functions  
**Sudėtingumas**: Vidutinis  
**Koncepcijos**: Dokumentų analizė, OCR, duomenų ištraukimas

#### Mašininio mokymosi pipeline
**Technologijos**: Azure ML, MLOps, Container Registry  
**Sudėtingumas**: Sudėtingas  
**Koncepcijos**: Modelių mokymas, diegimo pipeline, stebėjimas

## 🛠 Konfigūracijos pavyzdžiai

`configurations/` kataloge rasite pakartotinai naudojamus komponentus:

### Aplinkos konfigūracijos
- Kūrimo aplinkos nustatymai
- Staging aplinkos konfigūracijos
- Paruoštos gamybai konfigūracijos
- Daugiaregioniai diegimo nustatymai

### Bicep moduliai
- Pakartotinai naudojami infrastruktūros komponentai
- Bendri resursų modeliai
- Saugumo sustiprinti šablonai
- Ekonomiškai optimizuotos konfigūracijos

### Pagalbiniai skriptai
- Aplinkos nustatymo automatizavimas
- Duomenų bazės migracijos skriptai
- Diegimo validacijos įrankiai
- Kaštų stebėjimo priemonės

## 🔧 Pritaikymo vadovas

### Pavyzdžių pritaikymas jūsų poreikiams

1. **Peržiūrėti reikalavimus**
   - Patikrinti Azure paslaugų reikalavimus
   - Patikrinti prenumeratos limitus
   - Suprasti kaštų pasekmes

2. **Modifikuoti konfigūraciją**
   - Atnaujinti `azure.yaml` paslaugų apibrėžimus
   - Pritaikyti Bicep šablonus
   - Koreguoti aplinkos kintamuosius

3. **Kruopščiai testuoti**
   - Pirmiausia diegti kūrimo aplinkoje
   - Patikrinti funkcionalumą
   - Testuoti mastelio keitimą ir našumą

4. **Saugumo peržiūra**
   - Peržiūrėti prieigos kontrolę
   - Įgyvendinti paslapčių valdymą
   - Įjungti stebėjimą ir įspėjimus

## 📊 Palyginimo matrica

| Pavyzdys | Paslaugos | Duomenų bazė | Autentifikacija | Stebėjimas | Sudėtingumas |
|----------|-----------|--------------|-----------------|------------|--------------|
| Node.js Express Todo | 2 | ✅ | Pagrindinė | Pagrindinis | ⭐ |
| React SPA + Functions | 3 | ✅ | Pagrindinė | Pilnas | ⭐ |
| Python Flask Container | 2 | ❌ | Pagrindinė | Pilnas | ⭐ |
| C# Web API + SQL | 2 | ✅ | Pilnas | Pilnas | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Pilnas | Pilnas | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Pilnas | Pilnas | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Pilnas | Pilnas | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Pagrindinė | Pilnas | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Pilnas | Pilnas | ⭐⭐⭐⭐ |

## 🎓 Mokymosi kelias

### Rekomenduojama progresija

1. **Pradėti nuo paprastos žiniatinklio programos**
   - Išmokti pagrindines AZD sąvokas
   - Suprasti diegimo eigą
   - Praktikuoti aplinkos valdymą

2. **Išbandyti statinę svetainę**
   - Ištyrinėti skirtingas talpinimo galimybes
   - Suprasti CDN integraciją
   - Suprasti DNS konfigūraciją

3. **Pereiti prie konteinerinės programos**
   - Išmokti konteinerizacijos pagrindus
   - Suprasti mastelio keitimo sąvokas
   - Praktikuoti su Docker

4. **Pridėti duomenų bazės integraciją**
   - Išmokti duomenų bazės paruošimą
   - Suprasti jungčių eilutes
   - Praktikuoti paslapčių valdymą

5. **Ištyrinėti serverless**
   - Suprasti įvykių pagrįstą architektūrą
   - Išmokti apie trigerius ir susiejimus
   - Praktikuoti su API

6. **Kurti mikropaslaugas**
   - Išmokti paslaugų komunikaciją
   - Suprasti paskirstytas sistemas
   - Praktikuoti sudėtingus diegimus

## 🔍 Tinkamo pavyzdžio paieška

### Pagal technologijų rinkinį
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Konteineriai**: Python Flask Container App, Java Microservices
- **Duomenų bazės**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Pagal architektūros modelį
- **Monolitinis**: Node.js Express Todo, C# Web API + SQL
- **Statinis + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikropaslaugos**: Java Spring Boot Microservices
- **Konteinerizuotas**: Python Flask Container App
- **AI pagrįstas**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Pagal sudėtingumo lygį
- **Pradedantiesiems**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Vidutinis**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Sudėtingas**: ML Pipeline

## 📚 Papildomi ištekliai

### Dokumentacijos nuorodos
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep dokumentacija](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)

### Bendruomenės pavyzdžiai
- [Azure pavyzdžių AZD šablonai](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry šablonai](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI galerija](https://azure.github.io/awesome-azd/)
- [Todo programa su C# ir Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo programa su Python ir MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo programa su Node.js ir PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React žiniatinklio programa su C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps darbas](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions su Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Geriausios praktikos
- [Azure gerai suprojektuota sistema](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Debesų priėmimo sistema](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Pavyzdžių prisidėjimas

Turite naudingą pavyzdį? Mes laukiame jūsų indėlio!

### Pateikimo gairės
1. Laikykitės nustatytos katalogo struktūros
2. Įtraukite išsamų README.md
3. Pridėkite komentarus prie konfigūracijos failų
4. Kruopščiai išbandykite prieš pateikdami
5. Įtraukite kaštų įvertinimus ir reikalavimus

### Pavyzdžio šablono struktūra
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

**Naudingas patarimas**: Pradėkite nuo paprasčiausio pavyzdžio, kuris atitinka jūsų technologijų rinkinį, tada palaipsniui pereikite prie sudėtingesnių scenarijų. Kiekvienas pavyzdys remiasi ankstesnių sąvokomis!

**Kiti žingsniai**: 
- Pasirinkite pavyzdį, kuris atitinka jūsų įgūdžių lygį
- Sekite nustatymo instrukcijas pavyzdžio README faile
- Eksperimentuokite su pritaikymais
- Pasidalinkite savo mokymosi patirtimi su bendruomene

---

**Navigacija**
- **Ankstesnė pamoka**: [Studijų vadovas](../resources/study-guide.md)
- **Grįžti į**: [Pagrindinį README](../README.md)

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius naudojant šį vertimą.
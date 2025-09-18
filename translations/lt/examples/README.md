<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-18T14:12:04+00:00",
  "source_file": "examples/README.md",
  "language_code": "lt"
}
-->
# Pavyzdžiai - Praktiniai AZD šablonai ir konfigūracijos

**Mokymasis per pavyzdžius - suskirstyta pagal skyrius**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../README.md)
- **📖 Skyrių suskirstymas**: Pavyzdžiai pagal mokymosi sudėtingumą
- **🚀 Pradėkite nuo paprasto**: [1 skyriaus pavyzdžiai](../../../examples)
- **🤖 AI pavyzdžiai**: [2 ir 5 skyriaus AI sprendimai](../../../examples)

## Įvadas

Šiame kataloge pateikiami praktiniai pavyzdžiai, šablonai ir realaus pasaulio scenarijai, padedantys mokytis Azure Developer CLI per praktinę veiklą. Kiekvienas pavyzdys apima pilną veikiančio kodo rinkinį, infrastruktūros šablonus ir išsamius nurodymus įvairioms programų architektūroms ir diegimo modeliams.

## Mokymosi tikslai

Dirbdami su šiais pavyzdžiais, jūs:
- Praktikuosite Azure Developer CLI darbo eigas su realistiniais programų scenarijais
- Suprasite skirtingas programų architektūras ir jų AZD įgyvendinimus
- Įvaldysite infrastruktūros kaip kodo modelius įvairioms Azure paslaugoms
- Taikysite konfigūracijos valdymo ir aplinkai pritaikytas diegimo strategijas
- Įgyvendinsite stebėjimo, saugumo ir mastelio keitimo modelius praktiniuose kontekstuose
- Įgysite patirties sprendžiant ir derinant realius diegimo scenarijus

## Mokymosi rezultatai

Baigę šiuos pavyzdžius, jūs galėsite:
- Pasitikėdami diegti įvairių tipų programas naudodami Azure Developer CLI
- Pritaikyti pateiktus šablonus savo programų poreikiams
- Kurti ir įgyvendinti individualius infrastruktūros modelius naudodami Bicep
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
2. **[Statinė svetainė - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Talpinti React statinę svetainę naudojant Azure Static Web Apps
3. **[Konteinerinė programa - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Diegti konteinerizuotą Python Flask programą

### Vidutinio lygio vartotojams
4. **[Duomenų bazės programa - C# su Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Žiniatinklio programa su C# API ir Azure SQL duomenų baze
5. **[Serverless funkcija - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions su HTTP trigeriais ir Cosmos DB
6. **[Mikropaslaugos - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Daugiafunkcinė Java programa su Container Apps ir API vartais

### Azure AI Foundry šablonai

1. **[Azure OpenAI pokalbių programa](https://github.com/Azure-Samples/azure-search-openai-demo)** - Intelektuali pokalbių programa su Azure OpenAI
2. **[AI dokumentų apdorojimas](https://github.com/Azure-Samples/azure-ai-document-processing)** - Dokumentų analizė naudojant Azure AI paslaugas
3. **[Mašininio mokymosi procesas](https://github.com/Azure-Samples/mlops-v2)** - MLOps darbo eiga su Azure Machine Learning

### Realūs scenarijai

#### **Mažmeninės prekybos daugiaveikė sprendimas** 🆕
**[Pilnas įgyvendinimo vadovas](./retail-scenario.md)**

Išsamus, gamybai paruoštas daugiaveikės klientų aptarnavimo sprendimas, demonstruojantis įmonės lygio AI programų diegimą su AZD. Šis scenarijus apima:

- **Pilna architektūra**: Daugiaveikė sistema su specializuotais klientų aptarnavimo ir inventoriaus valdymo agentais
- **Gamybinė infrastruktūra**: Daugiaregioniniai Azure OpenAI diegimai, AI paieška, Container Apps ir išsamus stebėjimas
- **Paruoštas diegimui ARM šablonas**: Vieno paspaudimo diegimas su kelių konfigūracijų režimais (Minimalus/Standartinis/Premium)
- **Pažangios funkcijos**: Saugumo testavimas, agentų vertinimo sistema, kaštų optimizavimas ir problemų sprendimo vadovai
- **Tikras verslo kontekstas**: Mažmenininko klientų aptarnavimo atvejis su failų įkėlimu, paieškos integracija ir dinamišku mastelio keitimu

**Technologijos**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Sudėtingumas**: ⭐⭐⭐⭐ (Pažangus - Įmonės gamybai paruoštas)

**Puikiai tinka**: AI kūrėjams, sprendimų architektams ir komandoms, kuriančioms gamybines daugiaveikes sistemas

**Greitas startas**: Diegti visą sprendimą per mažiau nei 30 minučių naudojant pridėtą ARM šabloną su `./deploy.sh -g myResourceGroup`

## 📋 Naudojimo instrukcijos

### Pavyzdžių paleidimas lokaliai

1. **Klonuokite arba nukopijuokite pavyzdį**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inicializuokite AZD aplinką**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfigūruokite aplinką**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Diegimas**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Pavyzdžių pritaikymas

Kiekvienas pavyzdys apima:
- **README.md** - Išsamūs nustatymo ir pritaikymo nurodymai
- **azure.yaml** - AZD konfigūracija su komentarais
- **infra/** - Bicep šablonai su parametrų paaiškinimais
- **src/** - Pavyzdinis programos kodas
- **scripts/** - Pagalbiniai scenarijai bendroms užduotims

## 🎯 Mokymosi tikslai

### Pavyzdžių kategorijos

#### **Pagrindiniai diegimai**
- Vienos paslaugos programos
- Paprasti infrastruktūros modeliai
- Pagrindinis konfigūracijos valdymas
- Ekonomiški kūrimo nustatymai

#### **Pažangūs scenarijai**
- Daugiapaslaugės architektūros
- Sudėtingos tinklo konfigūracijos
- Duomenų bazių integracijos modeliai
- Saugumo ir atitikties įgyvendinimai

#### **Gamybai paruošti modeliai**
- Didelio prieinamumo konfigūracijos
- Stebėjimas ir stebimumas
- CI/CD integracija
- Atsigavimo po nelaimių nustatymai

## 📖 Pavyzdžių aprašymai

### Paprasta žiniatinklio programa - Node.js Express
**Technologijos**: Node.js, Express, MongoDB, Container Apps  
**Sudėtingumas**: Pradedantysis  
**Koncepcijos**: Pagrindinis diegimas, REST API, NoSQL duomenų bazės integracija

### Statinė svetainė - React SPA
**Technologijos**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Sudėtingumas**: Pradedantysis  
**Koncepcijos**: Statinis talpinimas, serverless backend, moderni žiniatinklio plėtra

### Konteinerinė programa - Python Flask
**Technologijos**: Python Flask, Docker, Container Apps, Container Registry  
**Sudėtingumas**: Pradedantysis  
**Koncepcijos**: Konteinerizacija, mikropaslaugų architektūra, API kūrimas

### Duomenų bazės programa - C# su Azure SQL
**Technologijos**: C# ASP.NET Core, Azure SQL Database, App Service  
**Sudėtingumas**: Vidutinis  
**Koncepcijos**: Entity Framework, duomenų bazės jungtys, žiniatinklio API kūrimas

### Serverless funkcija - Python Azure Functions
**Technologijos**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Sudėtingumas**: Vidutinis  
**Koncepcijos**: Įvykių valdomos architektūros, serverless kompiuterija, pilno ciklo plėtra

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
**Koncepcijos**: Dokumentų analizė, OCR, duomenų išgavimas

#### Mašininio mokymosi procesas
**Technologijos**: Azure ML, MLOps, Container Registry  
**Sudėtingumas**: Pažangus  
**Koncepcijos**: Modelių mokymas, diegimo procesai, stebėjimas

## 🛠 Konfigūracijos pavyzdžiai

`configurations/` kataloge yra pakartotinai naudojami komponentai:

### Aplinkos konfigūracijos
- Kūrimo aplinkos nustatymai
- Testavimo aplinkos konfigūracijos
- Gamybai paruoštos konfigūracijos
- Daugiaregioniniai diegimo nustatymai

### Bicep moduliai
- Pakartotinai naudojami infrastruktūros komponentai
- Bendri išteklių modeliai
- Saugumo sustiprinti šablonai
- Kaštų optimizuotos konfigūracijos

### Pagalbiniai scenarijai
- Aplinkos nustatymo automatizavimas
- Duomenų bazių migracijos scenarijai
- Diegimo patikros įrankiai
- Kaštų stebėjimo įrankiai

## 🔧 Pritaikymo vadovas

### Pavyzdžių pritaikymas jūsų poreikiams

1. **Peržiūrėkite reikalavimus**
   - Patikrinkite Azure paslaugų reikalavimus
   - Patikrinkite prenumeratos limitus
   - Supraskite kaštų pasekmes

2. **Modifikuokite konfigūraciją**
   - Atnaujinkite `azure.yaml` paslaugų apibrėžimus
   - Pritaikykite Bicep šablonus
   - Pakoreguokite aplinkos kintamuosius

3. **Išbandykite kruopščiai**
   - Pirmiausia diegkite kūrimo aplinkoje
   - Patikrinkite funkcionalumą
   - Išbandykite mastelio keitimą ir našumą

4. **Saugumo peržiūra**
   - Peržiūrėkite prieigos kontrolę
   - Įgyvendinkite slaptų duomenų valdymą
   - Įjunkite stebėjimą ir įspėjimus

## 📊 Palyginimo matrica

| Pavyzdys | Paslaugos | Duomenų bazė | Autentifikacija | Stebėjimas | Sudėtingumas |
|---------|----------|----------|------|------------|------------|
| Node.js Express Todo | 2 | ✅ | Pagrindinė | Pagrindinė | ⭐ |
| React SPA + Functions | 3 | ✅ | Pagrindinė | Pilna | ⭐ |
| Python Flask Container | 2 | ❌ | Pagrindinė | Pilna | ⭐ |
| C# Web API + SQL | 2 | ✅ | Pilna | Pilna | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Pilna | Pilna | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Pilna | Pilna | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Pilna | Pilna | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Pagrindinė | Pilna | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Pilna | Pilna | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Įmonės** | **Pažangus** | **⭐⭐⭐⭐** |

## 🎓 Mokymosi kelias

### Rekomenduojama eiga

1. **Pradėkite nuo paprastos žiniatinklio programos**
   - Supraskite pagrindines AZD sąvokas
   - Išmokite diegimo eigą
   - Praktikuokite aplinkos valdymą

2. **Išbandykite statinę svetainę**
   - Tyrinėkite skirtingas talpinimo galimybes
   - Supraskite CDN integraciją
   - Išmokite DNS konfigūraciją

3. **Pereikite prie konteinerinės programos**
   - Supraskite konteinerizacijos pagrindus
   - Supraskite mastelio keitimo sąvokas
   - Praktikuokite su Docker

4. **Pridėkite duomenų bazės integraciją**
   - Supraskite duomenų bazių teikimą
   - Supraskite jungčių eilutes
   - Praktikuokite slaptų duomenų valdymą

5. **Tyrinėkite serverless**
   - Supraskite įvykių valdomą architektūrą
   - Išmokite apie trigerius ir susiejimus
   - Praktikuokite su API

6. **Kurkite mikropaslaugas**
   - Supraskite paslaugų komunikaciją
   - Supraskite paskirstytas sistemas
   - Praktikuokite sudėtingus diegimus

## 🔍 Tinkamo pavyzdžio paieška

### Pagal technologijų rinkinį
- **Node.js**: Node.js Express Todo programa
- **Python**: Python Flask konteinerinė programa, Python Functions + SPA
- **C#**: C# Web API + SQL duomenų bazė, Azure OpenAI pokalbių programa, ML procesas
- **Java**: Java Spring Boot mikropaslaugos
- **React**: React SPA + Functions
- **Konteineriai**: Python Flask konteinerinė programa, Java mikropaslaugos
- **Duomenų bazės**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI pokalbių programa, AI dokumentų apdorojimas, ML procesas, **Retail Multi-Agent Solution**
- **Daugiaveikės sistemos**: **Retail Multi-Agent Solution**
- **Įmonės gamyba**: **Retail Multi-Agent Solution**

### Pagal architektūros modelį
- **Monolitinė**: Node.js Express Todo, C# Web API + SQL
- **Statinė + serverless**: React SPA + Functions, Python Functions + SPA
- **Mikropaslaugos**: Java Spring Boot mikropaslaugos
- **Konteinerizuota**: Python Flask konteinerinė programa
- **AI pagrįsta**: Azure OpenAI pokalbių programa, AI dokumentų apdorojimas, ML procesas, **Retail Multi-Agent Solution**
- **Daugiaveikė architektūra**: **Retail Multi-Agent Solution**
- **Įmonės daugiapaslaugė**: **Retail Multi-Agent Solution**

### Pagal sudėtingumo lygį
- **Pradedantysis**: Node.js Express Todo, React SPA + Functions, Python Flask konteinerinė programa
- **Vidutinis**: C# Web API + SQL, Python Functions + SPA, Java mikropaslaugos, Azure OpenAI pokalbių programa, AI dokumentų
- [Užduočių programa su C# ir Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Užduočių programa su Python ir MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Užduočių programa su Node.js ir PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React internetinė programa su C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps užduotis](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions su Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Geriausios praktikos
- [Azure gerai suprojektuotos architektūros pagrindai](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Debesų technologijų diegimo pagrindai](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Prisidėkite prie pavyzdžių kūrimo

Turite naudingą pavyzdį, kuriuo norite pasidalinti? Laukiame jūsų indėlio!

### Pateikimo gairės
1. Laikykitės nustatytos katalogų struktūros
2. Įtraukite išsamų README.md
3. Pridėkite komentarus prie konfigūracijos failų
4. Kruopščiai išbandykite prieš pateikdami
5. Įtraukite sąnaudų įvertinimus ir reikalavimus

### Pavyzdinės šablono struktūros
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

**Naudingas patarimas**: Pradėkite nuo paprasčiausio pavyzdžio, kuris atitinka jūsų technologijų rinkinį, o tada palaipsniui pereikite prie sudėtingesnių scenarijų. Kiekvienas pavyzdys remiasi ankstesnių pavyzdžių koncepcijomis!

**Kiti žingsniai**: 
- Pasirinkite pavyzdį, kuris atitinka jūsų įgūdžių lygį
- Vadovaukitės nustatymo instrukcijomis pavyzdžio README faile
- Eksperimentuokite su pritaikymais
- Pasidalinkite savo patirtimi su bendruomene

---

**Navigacija**
- **Ankstesnė pamoka**: [Mokymosi vadovas](../resources/study-guide.md)
- **Grįžti į**: [Pagrindinį README](../README.md)

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius naudojant šį vertimą.
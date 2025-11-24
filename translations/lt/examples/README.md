<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a896781acb2a7bebb3c4c66c4f46e7f",
  "translation_date": "2025-11-24T09:10:40+00:00",
  "source_file": "examples/README.md",
  "language_code": "lt"
}
-->
# Pavyzdžiai - Praktiniai AZD šablonai ir konfigūracijos

**Mokymasis per pavyzdžius - suskirstyta pagal skyrius**
- **📚 Kurso pagrindinis puslapis**: [AZD pradedantiesiems](../README.md)
- **📖 Skyrių susiejimas**: Pavyzdžiai, suskirstyti pagal mokymosi sudėtingumą
- **🚀 Vietinis pavyzdys**: [Mažmeninės prekybos kelių agentų sprendimas](retail-scenario.md)
- **🤖 Išoriniai AI pavyzdžiai**: Nuorodos į Azure Samples saugyklas

> **📍 SVARBU: Vietiniai ir išoriniai pavyzdžiai**  
> Šioje saugykloje yra **4 pilni vietiniai pavyzdžiai** su visomis įgyvendinimo detalėmis:  
> - **Azure OpenAI pokalbis** (GPT-4 diegimas su pokalbių sąsaja)  
> - **Konteinerių programos** (Paprastas Flask API + mikroservisai)  
> - **Duomenų bazės programa** (Tinklalapis + SQL duomenų bazė)  
> - **Mažmeninės prekybos kelių agentų sprendimas** (Įmonės AI sprendimas)  
>  
> Papildomi pavyzdžiai yra **išorinės nuorodos** į Azure-Samples saugyklas, kurias galite klonuoti.

## Įvadas

Šiame kataloge pateikiami praktiniai pavyzdžiai ir nuorodos, padedančios mokytis Azure Developer CLI per praktinę veiklą. Mažmeninės prekybos kelių agentų scenarijus yra pilnai parengtas gamybai ir įtrauktas į šią saugyklą. Papildomi pavyzdžiai remiasi oficialiais Azure Samples, kurie demonstruoja įvairius AZD modelius.

### Sudėtingumo įvertinimo legenda

- ⭐ **Pradedantysis** - Pagrindinės sąvokos, viena paslauga, 15-30 minučių
- ⭐⭐ **Vidutinis** - Kelios paslaugos, duomenų bazės integracija, 30-60 minučių
- ⭐⭐⭐ **Pažengęs** - Sudėtinga architektūra, AI integracija, 1-2 valandos
- ⭐⭐⭐⭐ **Ekspertas** - Parengta gamybai, įmonės modeliai, 2+ valandos

## 🎯 Kas iš tikrųjų yra šioje saugykloje

### ✅ Vietinis įgyvendinimas (paruoštas naudoti)

#### [Azure OpenAI pokalbių programa](azure-openai-chat/README.md) 🆕
**Pilnas GPT-4 diegimas su pokalbių sąsaja, įtrauktas į šią saugyklą**

- **Vieta:** `examples/azure-openai-chat/`
- **Sudėtingumas:** ⭐⭐ (Vidutinis)
- **Kas įtraukta:**
  - Pilnas Azure OpenAI diegimas (GPT-4)
  - Python komandinės eilutės pokalbių sąsaja
  - Key Vault integracija saugiems API raktams
  - Bicep infrastruktūros šablonai
  - Žetonų naudojimo ir išlaidų stebėjimas
  - Greičio ribojimas ir klaidų tvarkymas

**Greitas startas:**
```bash
# Naršykite į pavyzdį
cd examples/azure-openai-chat

# Įdiegti viską
azd up

# Įdiekite priklausomybes ir pradėkite pokalbį
pip install -r src/requirements.txt
python src/chat.py
```

**Technologijos:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Konteinerių programų pavyzdžiai](container-app/README.md) 🆕
**Išsamūs konteinerių diegimo pavyzdžiai, įtraukti į šią saugyklą**

- **Vieta:** `examples/container-app/`
- **Sudėtingumas:** ⭐-⭐⭐⭐⭐ (Nuo pradedančiojo iki eksperto)
- **Kas įtraukta:**
  - [Pagrindinis vadovas](container-app/README.md) - Išsamus konteinerių diegimų aprašymas
  - [Paprastas Flask API](../../../examples/container-app/simple-flask-api) - Pagrindinis REST API pavyzdys
  - [Mikroservisų architektūra](../../../examples/container-app/microservices) - Parengtas gamybai kelių paslaugų diegimas
  - Greito starto, gamybos ir pažangūs modeliai
  - Stebėjimas, saugumas ir išlaidų optimizavimas

**Greitas startas:**
```bash
# Peržiūrėti pagrindinį vadovą
cd examples/container-app

# Diegti paprastą Flask API
cd simple-flask-api
azd up

# Diegti mikroservisų pavyzdį
cd ../microservices
azd up
```

**Technologijos:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Mažmeninės prekybos kelių agentų sprendimas](retail-scenario.md) 🆕
**Pilnas parengtas gamybai įgyvendinimas, įtrauktas į šią saugyklą**

- **Vieta:** `examples/retail-multiagent-arm-template/`
- **Sudėtingumas:** ⭐⭐⭐⭐ (Pažengęs)
- **Kas įtraukta:**
  - Pilnas ARM diegimo šablonas
  - Kelių agentų architektūra (klientų + inventoriaus)
  - Azure OpenAI integracija
  - AI paieška su RAG
  - Išsamus stebėjimas
  - Vieno paspaudimo diegimo scenarijus

**Greitas startas:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologijos:** Azure OpenAI, AI paieška, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Išoriniai Azure pavyzdžiai (klonuoti naudojimui)

Šie pavyzdžiai yra palaikomi oficialiose Azure-Samples saugyklose. Klonuokite juos, kad išbandytumėte įvairius AZD modelius:

### Paprastos programos (1-2 skyriai)

| Šablonas | Saugykla | Sudėtingumas | Paslaugos |
|:---------|:---------|:-------------|:----------|
| **Python Flask API** | [Vietinis: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroservisai** | [Vietinis: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Kelių paslaugų, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask konteineris** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Kaip naudoti:**
```bash
# Nukopijuokite bet kurį pavyzdį
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Įdiegti
azd up
```

### AI programų pavyzdžiai (2, 5, 8 skyriai)

| Šablonas | Saugykla | Sudėtingumas | Dėmesys |
|:---------|:---------|:-------------|:--------|
| **Azure OpenAI pokalbis** | [Vietinis: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 diegimas |
| **AI pokalbių greitas startas** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Pagrindinis AI pokalbis |
| **AI agentai** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agentų sistema |
| **Paieška + OpenAI demonstracija** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG modelis |
| **Contoso pokalbis** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Įmonės AI |

### Duomenų bazės ir pažangūs modeliai (3-8 skyriai)

| Šablonas | Saugykla | Sudėtingumas | Dėmesys |
|:---------|:---------|:-------------|:--------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Duomenų bazės integracija |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java mikroservisai** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Kelių paslaugų |
| **ML procesas** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Mokymosi tikslai

Dirbdami su šiais pavyzdžiais, jūs:
- Praktikuosite Azure Developer CLI darbo eigas su realistiniais programų scenarijais
- Suprasite skirtingas programų architektūras ir jų AZD įgyvendinimus
- Įvaldysite infrastruktūros kaip kodo modelius įvairioms Azure paslaugoms
- Taikysite konfigūracijos valdymo ir aplinkai specifines diegimo strategijas
- Įgyvendinsite stebėjimo, saugumo ir mastelio modelius praktiniuose kontekstuose
- Įgysite patirties sprendžiant ir derinant realius diegimo scenarijus

## Mokymosi rezultatai

Baigę šiuos pavyzdžius, jūs galėsite:
- Pasitikėdami diegti įvairių tipų programas naudodami Azure Developer CLI
- Pritaikyti pateiktus šablonus savo programų poreikiams
- Kurti ir įgyvendinti individualius infrastruktūros modelius naudodami Bicep
- Konfigūruoti sudėtingas kelių paslaugų programas su tinkamomis priklausomybėmis
- Taikyti saugumo, stebėjimo ir našumo geriausias praktikas realiuose scenarijuose
- Spręsti ir optimizuoti diegimus remiantis praktine patirtimi

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

> **💡 Naujas AZD?** Pradėkite nuo 1 pavyzdžio (Flask API) - tai užtruks ~20 minučių ir išmokys pagrindinių sąvokų.

### Pradedantiesiems
1. **[Konteinerių programa - Python Flask API](../../../examples/container-app/simple-flask-api)** (Vietinis) ⭐  
   Diegti paprastą REST API su automatinio mastelio mažinimu  
   **Laikas:** 20-25 minutės | **Kaina:** $0-5/mėn  
   **Išmoksite:** Pagrindinė azd darbo eiga, konteinerizacija, sveikatos patikros  
   **Tikėtinas rezultatas:** Veikiantis API galinis taškas, grąžinantis "Hello, World!" su stebėjimu

2. **[Paprasta tinklalapio programa - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Diegti Node.js Express tinklalapio programą su MongoDB  
   **Laikas:** 25-35 minutės | **Kaina:** $10-30/mėn  
   **Išmoksite:** Duomenų bazės integracija, aplinkos kintamieji, prisijungimo eilutės  
   **Tikėtinas rezultatas:** Užduočių sąrašo programa su kūrimo/skaitymo/atnaujinimo/šalinimo funkcionalumu

3. **[Statinis tinklalapis - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Talpinti React statinį tinklalapį su Azure Static Web Apps  
   **Laikas:** 20-30 minutės | **Kaina:** $0-10/mėn  
   **Išmoksite:** Statinis talpinimas, serverless funkcijos, CDN diegimas  
   **Tikėtinas rezultatas:** React UI su API galiniu tašku, automatiniu SSL, globaliu CDN

### Vidutiniams vartotojams
4. **[Azure OpenAI pokalbių programa](../../../examples/azure-openai-chat)** (Vietinis) ⭐⭐  
   Diegti GPT-4 su pokalbių sąsaja ir saugiu API raktų valdymu  
   **Laikas:** 35-45 minutės | **Kaina:** $50-200/mėn  
   **Išmoksite:** Azure OpenAI diegimas, Key Vault integracija, žetonų stebėjimas  
   **Tikėtinas rezultatas:** Veikianti pokalbių programa su GPT-4 ir išlaidų stebėjimu

5. **[Konteinerių programa - mikroservisai](../../../examples/container-app/microservices)** (Vietinis) ⭐⭐⭐⭐  
   Parengta gamybai kelių paslaugų architektūra  
   **Laikas:** 45-60 minutės | **Kaina:** $50-150/mėn  
   **Išmoksite:** Paslaugų komunikacija, pranešimų eilės, paskirstytas sekimas  
   **Tikėtinas rezultatas:** 2 paslaugų sistema (API vartai + produktų paslauga) su stebėjimu

6. **[Duomenų bazės programa - C# su Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Tinklalapio programa su C# API ir Azure SQL duomenų baze  
   **Laikas:** 30-45 minutės | **Kaina:** $20-80/mėn  
   **Išmoksite:** Entity Framework, duomenų bazės migracijos, prisijungimo saugumas  
   **Tikėtinas rezultatas:** C# API su Azure SQL galiniu tašku, automatiniu schemos diegimu

7. **[Serverless funkcija - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions su HTTP trigeriais ir Cosmos DB  
   **Laikas:** 30-40 minutės | **Kaina:** $10-40/mėn  
   **Išmoksite:** Įvykių valdomos architektūros, serverless mastelio, NoSQL integracijos  
   **Tikėtinas rezultatas:** Funkcijų programa, reaguojanti į HTTP užklausas su Cosmos DB saugykla

8. **[Mikroservisai - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Kelių paslaugų Java programa su Container Apps ir API vartais  
   **Laikas:** 60-90 minutės | **Kaina:** $80-200/mėn  
   **Išmoksite:** Spring Boot diegimas, paslaugų tinklas, apkrovos balansavimas  
   **Tikėtinas rezultatas:** Kelių paslaugų Java sistema su paslaugų atradimu ir maršrutizavimu

### Azure AI Foundry šablonai

1. **[Azure OpenAI pokalbių programa - vietinis pavyzdys](../../../examples/azure-openai-chat)** ⭐⭐  
   Pilnas GPT-4 diegimas su pokalbių sąsaja  
   **Laikas:** 35-45 minutės | **Kaina:** $50-200/mėn  
   **Tikėtinas rezultatas:** Veikianti pokalbių programa su žetonų stebėjimu ir išlaidų sekimu

2. **[Azure paieška + OpenAI demonstracija](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelektuali pokalbių programa su RAG architektūra  
   **Laikas:** 60-90 minutės | **Kaina:** $100-300/mėn  
   **Tikėtinas rezultatas:** RAG pagrįsta pokalbių sąsaja su dokumentų paieška ir citatomis

3. **[AI dokumentų apdorojimas](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentų analizė naudojant Azure AI paslaugas  
   **Laikas:** 40-60 minutės | **Kaina:** $20-80/mėn  
   **Tikėtinas rezultatas:** API, ištraukianti tekstą, lenteles ir objektus iš įkeltų dokumentų

4. **[Mašininio mokymosi procesas](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps darbo eiga su Azure Machine Learning  
   **Laikas:** 2-3 valandos | **Kaina:** $150-500/mėn  
   **Tikėtinas rezultatas:** Automatinis ML procesas su mokymu, diegimu ir stebėjimu

### Realūs scenarijai

#### **Mažmeninės prekybos kelių agentų sprendimas** 🆕
**[Pilnas įgyvendinimo vadovas](./retail-scenario.md)**

Išsamus, parengtas gamybai kelių agentų klientų aptarnavimo sprendimas, demonstruojantis įmonės lygio AI programų diegimą su AZD
- **Gamybinė infrastruktūra**: Daugiaregioniai Azure OpenAI diegimai, AI paieška, Container Apps ir išsamus stebėjimas
- **Paruoštas diegimui ARM šablonas**: Vieno paspaudimo diegimas su keliais konfigūracijos režimais (Minimalus/Standartinis/Premium)
- **Pažangios funkcijos**: Saugumo patikrinimas (red teaming), agentų vertinimo sistema, kaštų optimizavimas ir trikčių šalinimo vadovai
- **Tikras verslo kontekstas**: Mažmeninės prekybos klientų aptarnavimo atvejis su failų įkėlimu, paieškos integracija ir dinamišku mastelio keitimu

**Technologijos**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Sudėtingumas**: ⭐⭐⭐⭐ (Pažangus - paruoštas gamybinei aplinkai)

**Puikiai tinka**: AI kūrėjams, sprendimų architektams ir komandoms, kuriančioms gamybinius daugiagentinius sistemas

**Greitas startas**: Diekite visą sprendimą per mažiau nei 30 minučių naudodami pridėtą ARM šabloną su `./deploy.sh -g myResourceGroup`

## 📋 Naudojimo instrukcijos

### Reikalavimai

Prieš paleidžiant bet kurį pavyzdį:
- ✅ Azure prenumerata su savininko arba bendradarbio prieiga
- ✅ Įdiegtas Azure Developer CLI ([Diegimo vadovas](../docs/getting-started/installation.md))
- ✅ Veikiantis Docker Desktop (konteinerių pavyzdžiams)
- ✅ Tinkamos Azure kvotos (patikrinkite konkretaus pavyzdžio reikalavimus)

> **💰 Įspėjimas dėl kaštų:** Visi pavyzdžiai sukuria realius Azure resursus, kurie sukelia išlaidas. Žr. atskirus README failus dėl kaštų įvertinimų. Nepamirškite paleisti `azd down`, kai baigsite, kad išvengtumėte nuolatinių išlaidų.

### Pavyzdžių paleidimas lokaliai

1. **Klonuokite arba nukopijuokite pavyzdį**
   ```bash
   # Pereikite prie norimo pavyzdžio
   cd examples/simple-web-app
   ```

2. **Inicializuokite AZD aplinką**
   ```bash
   # Inicializuoti naudojant esamą šabloną
   azd init
   
   # Arba sukurti naują aplinką
   azd env new my-environment
   ```

3. **Konfigūruokite aplinką**
   ```bash
   # Nustatykite reikalingus kintamuosius
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Diekite**
   ```bash
   # Diegti infrastruktūrą ir programą
   azd up
   ```

5. **Patikrinkite diegimą**
   ```bash
   # Gauti paslaugos galinius taškus
   azd env get-values
   
   # Išbandyti galinį tašką (pavyzdys)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Tikėtini sėkmės rodikliai:**
   - ✅ `azd up` baigiasi be klaidų
   - ✅ Paslaugos galutinis taškas grąžina HTTP 200
   - ✅ Azure portalas rodo „Veikia“ statusą
   - ✅ Application Insights gauna telemetriją

> **⚠️ Problemų?** Žr. [Dažnos problemos](../docs/troubleshooting/common-issues.md) dėl diegimo trikčių šalinimo

### Pavyzdžių pritaikymas

Kiekvienas pavyzdys apima:
- **README.md** - Išsamios nustatymo ir pritaikymo instrukcijos
- **azure.yaml** - AZD konfigūracija su komentarais
- **infra/** - Bicep šablonai su parametrų paaiškinimais
- **src/** - Pavyzdinis programos kodas
- **scripts/** - Pagalbiniai skriptai įprastoms užduotims

## 🎯 Mokymosi tikslai

### Pavyzdžių kategorijos

#### **Pagrindiniai diegimai**
- Vienos paslaugos programos
- Paprasti infrastruktūros modeliai
- Pagrindinis konfigūracijos valdymas
- Kaštams efektyvios kūrimo aplinkos

#### **Pažangūs scenarijai**
- Daugiaservisinės architektūros
- Sudėtingos tinklo konfigūracijos
- Duomenų bazių integracijos modeliai
- Saugumo ir atitikties įgyvendinimas

#### **Gamybiniai modeliai**
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
**Technologijos**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Sudėtingumas**: Pradedantysis  
**Koncepcijos**: Konteinerizacija, REST API, mastelio keitimas iki nulio, sveikatos patikros, stebėjimas  
**Vieta**: [Lokalus pavyzdys](../../../examples/container-app/simple-flask-api)

### Konteinerinė programa - Mikroservisų architektūra
**Technologijos**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Sudėtingumas**: Pažangus  
**Koncepcijos**: Daugiaservisinė architektūra, paslaugų komunikacija, pranešimų eilės, paskirstytas sekimas  
**Vieta**: [Lokalus pavyzdys](../../../examples/container-app/microservices)

### Duomenų bazės programa - C# su Azure SQL
**Technologijos**: C# ASP.NET Core, Azure SQL Database, App Service  
**Sudėtingumas**: Vidutinis  
**Koncepcijos**: Entity Framework, duomenų bazės jungtys, žiniatinklio API kūrimas

### Serverless funkcija - Python Azure Functions
**Technologijos**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Sudėtingumas**: Vidutinis  
**Koncepcijos**: Įvykių valdomos architektūros, serverless skaičiavimai, pilno ciklo plėtra

### Mikroservisai - Java Spring Boot
**Technologijos**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Sudėtingumas**: Vidutinis  
**Koncepcijos**: Mikroservisų komunikacija, paskirstytos sistemos, įmonių modeliai

### Azure AI Foundry pavyzdžiai

#### Azure OpenAI pokalbių programa
**Technologijos**: Azure OpenAI, Cognitive Search, App Service  
**Sudėtingumas**: Vidutinis  
**Koncepcijos**: RAG architektūra, vektorinė paieška, LLM integracija

#### AI dokumentų apdorojimas
**Technologijos**: Azure AI Document Intelligence, Storage, Functions  
**Sudėtingumas**: Vidutinis  
**Koncepcijos**: Dokumentų analizė, OCR, duomenų išgavimas

#### Mašininio mokymosi pipeline
**Technologijos**: Azure ML, MLOps, Container Registry  
**Sudėtingumas**: Pažangus  
**Koncepcijos**: Modelių mokymas, diegimo pipeline, stebėjimas

## 🛠 Konfigūracijos pavyzdžiai

Kataloge `configurations/` yra pakartotinai naudojami komponentai:

### Aplinkos konfigūracijos
- Kūrimo aplinkos nustatymai
- Testavimo aplinkos konfigūracijos
- Gamybinės aplinkos konfigūracijos
- Daugiaregioniai diegimai

### Bicep moduliai
- Pakartotinai naudojami infrastruktūros komponentai
- Įprasti resursų modeliai
- Saugumo sustiprinti šablonai
- Kaštų optimizuotos konfigūracijos

### Pagalbiniai skriptai
- Aplinkos nustatymo automatizavimas
- Duomenų bazės migracijos skriptai
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
   - Koreguokite aplinkos kintamuosius

3. **Kruopščiai testuokite**
   - Pirmiausia diekite kūrimo aplinkoje
   - Patikrinkite funkcionalumą
   - Testuokite mastelį ir našumą

4. **Saugumo peržiūra**
   - Peržiūrėkite prieigos kontrolę
   - Įgyvendinkite slaptų duomenų valdymą
   - Įjunkite stebėjimą ir įspėjimus

## 📊 Palyginimo matrica

| Pavyzdys | Paslaugos | Duomenų bazė | Autentifikacija | Stebėjimas | Sudėtingumas |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI pokalbis** (Lokalus) | 2 | ❌ | Key Vault | Pilnas | ⭐⭐ |
| **Python Flask API** (Lokalus) | 1 | ❌ | Pagrindinis | Pilnas | ⭐ |
| **Mikroservisai** (Lokalus) | 5+ | ✅ | Įmonių | Pažangus | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Pagrindinis | Pagrindinis | ⭐ |
| React SPA + Functions | 3 | ✅ | Pagrindinis | Pilnas | ⭐ |
| Python Flask Container | 2 | ❌ | Pagrindinis | Pilnas | ⭐ |
| C# Web API + SQL | 2 | ✅ | Pilnas | Pilnas | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Pilnas | Pilnas | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Pilnas | Pilnas | ⭐⭐ |
| Azure OpenAI pokalbis | 3 | ✅ | Pilnas | Pilnas | ⭐⭐⭐ |
| AI dokumentų apdorojimas | 2 | ❌ | Pagrindinis | Pilnas | ⭐⭐ |
| ML pipeline | 4+ | ✅ | Pilnas | Pilnas | ⭐⭐⭐⭐ |
| **Mažmeninės prekybos daugiagentis** (Lokalus) | **8+** | **✅** | **Įmonių** | **Pažangus** | **⭐⭐⭐⭐** |

## 🎓 Mokymosi kelias

### Rekomenduojama seka

1. **Pradėkite nuo paprastos žiniatinklio programos**
   - Sužinokite pagrindines AZD sąvokas
   - Supraskite diegimo eigą
   - Praktikuokite aplinkos valdymą

2. **Išbandykite statinę svetainę**
   - Ištyrinėkite skirtingas talpinimo galimybes
   - Sužinokite apie CDN integraciją
   - Supraskite DNS konfigūraciją

3. **Pereikite prie konteinerinės programos**
   - Sužinokite konteinerizacijos pagrindus
   - Supraskite mastelio keitimo sąvokas
   - Praktikuokite su Docker

4. **Pridėkite duomenų bazės integraciją**
   - Sužinokite duomenų bazės paruošimą
   - Supraskite jungčių eilutes
   - Praktikuokite slaptų duomenų valdymą

5. **Ištyrinėkite serverless**
   - Supraskite įvykių valdomą architektūrą
   - Sužinokite apie trigerius ir susiejimus
   - Praktikuokite su API

6. **Kurkite mikroservisus**
   - Sužinokite paslaugų komunikaciją
   - Supraskite paskirstytas sistemas
   - Praktikuokite sudėtingus diegimus

## 🔍 Tinkamo pavyzdžio paieška

### Pagal technologijų rinkinį
- **Container Apps**: [Python Flask API (Lokalus)](../../../examples/container-app/simple-flask-api), [Mikroservisai (Lokalus)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Mikroservisų API Gateway (Lokalus)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokalus)](../../../examples/container-app/simple-flask-api), [Mikroservisų produktų paslauga (Lokalus)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Mikroservisų užsakymų paslauga (Lokalus)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI pokalbių programa, ML pipeline
- **Go**: [Mikroservisų vartotojų paslauga (Lokalus)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Konteineriai**: [Python Flask (Lokalus)](../../../examples/container-app/simple-flask-api), [Mikroservisai (Lokalus)](../../../examples/container-app/microservices), Java Microservices
- **Duomenų bazės**: [Mikroservisai (Lokalus)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI pokalbis (Lokalus)](../../../examples/azure-openai-chat)**, Azure OpenAI pokalbių programa, AI dokumentų apdorojimas, ML pipeline, **Mažmeninės prekybos daugiagentis sprendimas**
- **Daugiagentės sistemos**: **Mažmeninės prekybos daugiagentis sprendimas**
- **OpenAI integracija**: **[Azure OpenAI pokalbis (Lokalus)](../../../examples/azure-openai-chat)**, Mažmeninės prekybos daugiagentis sprendimas
- **Įmonių gamyba**: [Mikroservisai (Lokalus)](../../../examples/container-app/microservices), **Mažmeninės prekybos daugiagentis sprendimas**

### Pagal architektūros modelį
- **Paprastas REST API**: [Python Flask API (Lokalus)](../../../examples/container-app/simple-flask-api)
- **Monolitinis**: Node.js Express Todo, C# Web API + SQL
- **Statinis + serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroservisai**: [Gamybiniai mikroservisai (Lokalus)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Konteinerizuotas**: [Python Flask (Lokalus)](../../../examples/container-app/simple-flask-api), [Mikroservisai (Lokalus)](../../../examples/container-app/microservices)
- **AI pagrįstas**: **[Azure OpenAI pokalbis (Lokalus)](../../../examples/azure-openai-chat)**, Azure OpenAI pokalbių programa, AI dokumentų apdorojimas, ML pipeline, **Mažmeninės prekybos daugiagentis sprendimas**
- **Daugiagentė architektūra**: **Mažmeninės prekybos daugiagentis sprendimas**
- **Įmonių daugiapaslaugis**: [Mikroservisai (Lokalus)](../../../examples/container-app/microservices), **Mažmeninės prekybos daugiagentis sprendimas**

### Pagal sudėtingumo lygį
- **Pradedantysis**: [Python Flask API (Lokalus)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Vidutinis**: **[Azure OpenAI pokalbis (Lokalus)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI pokalbių programa, AI dokumentų apdorojimas
- **Pažangus**: ML pipeline
- **Įmonių gamybinis**: [Mikroservisai (Lokalus)](../../../examples/container-app/microservices) (Daugiapaslaugis su pranešimų eilėmis), **Mažmeninės prekybos daugiagentis sprendimas** (Pilna daugiagentė sistema su ARM šablono diegimu)

## 📚 Papildomi ištekliai

### Dokumentacijos nuorodos
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-
- [Todo programėlė su Node.js ir PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [React internetinė programėlė su C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [Azure Container Apps darbas](https://github.com/Azure-Samples/container-apps-jobs)  
- [Azure Functions su Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)  

### Geriausios praktikos  
- [Azure gerai suprojektuotos architektūros struktūra](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [Debesų technologijų įsisavinimo struktūra](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

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

## 🚀 Pasiruošę pradėti?  

### Jūsų mokymosi kelias  

1. **Visiškas naujokas?** → Pradėkite nuo [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)  
2. **Turite pagrindinių AZD žinių?** → Išbandykite [Mikropaslaugas](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)  
3. **Kuriate AI programėles?** → Pradėkite nuo [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) arba išbandykite [Mažmeninės prekybos daugiaveikį agentą](retail-scenario.md) (⭐⭐⭐⭐, 2+ valandos)  
4. **Reikia specifinio technologijų rinkinio?** → Naudokite [Tinkamo pavyzdžio paieškos](../../../examples) skyrių aukščiau  

### Kiti žingsniai  

- ✅ Peržiūrėkite [Reikalavimus](../../../examples) aukščiau  
- ✅ Pasirinkite pavyzdį, atitinkantį jūsų įgūdžių lygį (žr. [Sudėtingumo legendą](../../../examples))  
- ✅ Prieš diegdami kruopščiai perskaitykite pavyzdžio README  
- ✅ Nustatykite priminimą paleisti `azd down` po testavimo  
- ✅ Pasidalinkite savo patirtimi per GitHub Issues arba Discussions  

### Reikia pagalbos?  

- 📖 [DUK](../resources/faq.md) - Atsakymai į dažniausiai užduodamus klausimus  
- 🐛 [Trikčių šalinimo vadovas](../docs/troubleshooting/common-issues.md) - Diegimo problemų sprendimas  
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Klauskite bendruomenės  
- 📚 [Mokymosi vadovas](../resources/study-guide.md) - Stiprinkite savo žinias  

---  

**Navigacija**  
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../README.md)  
- **📖 Mokymosi medžiaga**: [Mokymosi vadovas](../resources/study-guide.md) | [Špargalkė](../resources/cheat-sheet.md) | [Žodynas](../resources/glossary.md)  
- **🔧 Ištekliai**: [DUK](../resources/faq.md) | [Trikčių šalinimas](../docs/troubleshooting/common-issues.md)  

---  

*Paskutinį kartą atnaujinta: 2025 m. lapkritis | [Pranešti apie problemas](https://github.com/microsoft/AZD-for-beginners/issues) | [Prisidėti prie pavyzdžių kūrimo](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus aiškinimus, atsiradusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
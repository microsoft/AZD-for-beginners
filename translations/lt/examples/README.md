# Pavyzdžiai - Praktinės AZD šablonai ir konfigūracijos

**Mokymasis per pavyzdžius - suorganizuota pagal skyrių**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../README.md)
- **📖 Skyrių žemėlapis**: Pavyzdžiai surūšiuoti pagal mokymosi sudėtingumą
- **🚀 Vietinis pavyzdys**: [Mažmeninės prekybos daugiaagentis sprendimas](retail-scenario.md)
- **🤖 Išoriniai AI pavyzdžiai**: Nuorodos į Azure Samples saugyklas

> **📍 SVARBU: Vietiniai vs Išoriniai pavyzdžiai**  
> Ši saugykla talpina **4 pilnus vietinius pavyzdžius** su pilna įgyvendinimo apimtimi:  
> - **Azure OpenAI Chat** (GPT-4 diegimas su pokalbių sąsaja)  
> - **Container Apps** (Paprasta Flask API + mikroservisai)  
> - **Database App** (Tinklalapis + SQL duomenų bazė)  
> - **Retail Multi-Agent** (Įmoninis AI sprendimas)  
>  
> Papildomi pavyzdžiai yra **išorinės nuorodos** į Azure-Samples saugyklas, kurias galite nuklonuoti.

## Įvadas

Šis katalogas pateikia praktinių pavyzdžių ir nuorodų, kad galėtumėte išmokti Azure Developer CLI per praktinę patirtį. Retail Multi-Agent scenarijus yra pilnas, produkcijai tinkamas įgyvendinimas, įtrauktas į šią saugyklą. Papildomi pavyzdžiai nurodo oficialias Azure Samples, kurios demonstruoja įvairius AZD modelius.

### Kompleksumo įvertinimo legenda

- ⭐ **Pradedantysis** - Pagrindinės sąvokos, viena paslauga, 15-30 minučių
- ⭐⭐ **Tarpinis** - Kelios paslaugos, duomenų bazės integracija, 30-60 minučių
- ⭐⭐⭐ **Pažengęs** - Sudėtinga architektūra, AI integracija, 1-2 valandos
- ⭐⭐⭐⭐ **Ekspertas** - Produkcijai tinkamas, įmoniniai modeliai, 2+ valandos

## 🎯 Kas iš tikrųjų yra šioje saugykloje

### ✅ Vietinis įgyvendinimas (paruošta naudoti)

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**Pilnas GPT-4 diegimas su pokalbių sąsaja, įtrauktas į šią saugyklą**

- **Vieta:** `examples/azure-openai-chat/`
- **Sudėtingumas:** ⭐⭐ (Tarpinis)
- **Kas įtraukta:**
  - Pilnas Azure OpenAI diegimas (GPT-4)
  - Python komandine eilute pagrįsta pokalbių sąsaja
  - Key Vault integracija saugiems API raktams
  - Bicep infrastruktūros šablonai
  - Žetonų naudojimo ir sąnaudų sekimas
  - Greičio ribojimas ir klaidų valdymas

**Greitas startas:**
```bash
# Eikite į pavyzdį
cd examples/azure-openai-chat

# Įdiekite viską
azd up

# Įdiekite priklausomybes ir pradėkite susirašinėti
pip install -r src/requirements.txt
python src/chat.py
```

**Technologijos:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Išsamūs konteinerių diegimo pavyzdžiai, įtraukti į šią saugyklą**

- **Vieta:** `examples/container-app/`
- **Sudėtingumas:** ⭐-⭐⭐⭐⭐ (Nuo pradedančiojo iki pažengusio)
- **Kas įtraukta:**
  - [Pagrindinis vadovas](container-app/README.md) - Išsamus konteinerių diegimų apžvalga
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Pagrindinis REST API pavyzdys
  - [Microservices Architecture](../../../examples/container-app/microservices) - Produkcijai tinkamas daugiapaslapių paslaugų diegimas
  - Greitas startas, produkcija ir pažangūs modeliai
  - Stebėsena, saugumas ir sąnaudų optimizavimas

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

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Pilnas produkcijai tinkamas įgyvendinimas, įtrauktas į šią saugyklą**

- **Vieta:** `examples/retail-multiagent-arm-template/`
- **Sudėtingumas:** ⭐⭐⭐⭐ (Pažengęs)
- **Kas įtraukta:**
  - Pilnas ARM diegimo šablonas
  - Daugiaagentė architektūra (Klientų + Inventoriaus agentai)
  - Azure OpenAI integracija
  - AI Search su RAG
  - Išsami stebėsena
  - Vieno mygtuko diegimo skriptas

**Greitas startas:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologijos:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Išoriniai Azure pavyzdžiai (Klonuokite, kad naudotumėte)

Tolimesni pavyzdžiai yra palaikomi oficialiose Azure-Samples saugyklose. Nuklonuokite juos, kad ištirtumėte skirtingus AZD modelius:

### Paprastos programos (1–2 skyriai)

| Šablonas | Saugykla | Sudėtingumas | Paslaugos |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Vietinis: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Vietinis: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Daugiapaslapių paslaugų sistema, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Kaip naudoti:**
```bash
# Klonuoti bet kurį pavyzdį
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Diegti
azd up
```

### AI programų pavyzdžiai (Skyriai 2, 5, 8)

| Šablonas | Saugykla | Sudėtingumas | Paskirtis |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Vietinis: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 diegimas |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Pagrindinis AI pokalbis |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agentų karkasas |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG modelis |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Įmoninis AI |

### Duomenų bazės ir pažangūs modeliai (Skyriai 3–8)

| Šablonas | Saugykla | Sudėtingumas | Paskirtis |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Duomenų bazės integracija |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Daugiapaslapių paslaugų sistema |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Mokymosi tikslai

Dirbdami su šiais pavyzdžiais, jūs:
- Praktikuosite Azure Developer CLI darbo eigas su realiomis programų scenarijomis
- Suprasite skirtingas programų architektūras ir jų azd įgyvendinimus
- Įvaldysite Infrastructure as Code modelius su įvairiomis Azure paslaugomis
- Taikysite konfigūracijos valdymą ir aplinkai specifines diegimo strategijas
- Įgyvendinsite stebėsenos, saugumo ir skalavimo modelius praktiškose situacijose
- Sukaupsite patirties sprendžiant trikčių šalinimą ir derinimą realiuose diegimo scenarijuose

## Mokymosi rezultatai

Baigę šiuos pavyzdžius, jūs galėsite:
- Užtikrintai diegti įvairius programų tipus naudojant Azure Developer CLI
- Pritaikyti pateiktus šablonus savo programos reikalavimams
- Projektuoti ir įgyvendinti pasirinktines infrastruktūros schemas naudojant Bicep
- Konfigūruoti sudėtingas daugiapaslapių programų priklausomybes
- Taikyti saugumo, stebėsenos ir našumo gerąsias praktikas realiose situacijose
- Trikčių šalinimas ir diegimų optimizavimas remiantis praktine patirtimi

## Aplanko struktūra

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

## Greiti pradžios pavyzdžiai

> **💡 Naujokas AZD?** Pradėkite nuo pavyzdžio #1 (Flask API) - tai užtrunka ~20 minučių ir išmokys pagrindines sąvokas.

### Pradedantiesiems
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Vietinis) ⭐  
   Diegti paprastą REST API su scale-to-zero  
   **Laikas:** 20-25 minučių | **Kaina:** $0-5/mėn  
   **Ko išmoksite:** Pagrindinė azd darbo eiga, konteinerizacija, sveikatos patikros  
   **Tikėtinas rezultatas:** Veikiantis API galinis taškas grąžinantis "Hello, World!" su stebėsena

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Diegti Node.js Express tinklalapį su MongoDB  
   **Laikas:** 25-35 minučių | **Kaina:** $10-30/mėn  
   **Ko išmoksite:** Duomenų bazės integracija, aplinkos kintamieji, prisijungimo eilutės  
   **Tikėtinas rezultatas:** Užduočių sąrašo programa su kurimo/rodymo/atnaujinimo/naikinimo funkcionalumu

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Talpinti React statinį tinklalapį su Azure Static Web Apps  
   **Laikas:** 20-30 minučių | **Kaina:** $0-10/mėn  
   **Ko išmoksite:** Statinis talpinimas, serverless funkcijos, CDN diegimas  
   **Tikėtinas rezultatas:** React vartotojo sąsaja su API backend'u, automatinis SSL, globalus CDN

### Tarpiniams vartotojams
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Vietinis) ⭐⭐  
   Diegti GPT-4 su pokalbių sąsaja ir saugiu API rakto valdymu  
   **Laikas:** 35-45 minučių | **Kaina:** $50-200/mėn  
   **Ko išmoksite:** Azure OpenAI diegimas, Key Vault integracija, žetonų sekimas  
   **Tikėtinas rezultatas:** Veikianti pokalbių programa su GPT-4 ir sąnaudų stebėsena

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Vietinis) ⭐⭐⭐⭐  
   Produkcijai tinkama daugiapaslapių paslaugų architektūra  
   **Laikas:** 45-60 minučių | **Kaina:** $50-150/mėn  
   **Ko išmoksite:** Paslaugų tarpusavio komunikacija, žinučių eilės, paskirstytas stebėjimas  
   **Tikėtinas rezultatas:** 2-paslaugų sistema (API Gateway + Product Service) su stebėsena

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Tinklalapis su C# API ir Azure SQL duomenų baze  
   **Laikas:** 30-45 minučių | **Kaina:** $20-80/mėn  
   **Ko išmoksite:** Entity Framework, duomenų bazės migracijos, prisijungimo saugumas  
   **Tikėtinas rezultatas:** C# API su Azure SQL pagrindu, automatinis schemos diegimas

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions su HTTP trigeriais ir Cosmos DB  
   **Laikas:** 30-40 minučių | **Kaina:** $10-40/mėn  
   **Ko išmoksite:** Įvykių varoma architektūra, serverless skalavimas, NoSQL integracija  
   **Tikėtinas rezultatas:** Function app atsakantis į HTTP užklausas su Cosmos DB saugojimu

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Daugiapaslapių Java programa su Container Apps ir API gateway  
   **Laikas:** 60-90 minučių | **Kaina:** $80-200/mėn  
   **Ko išmoksite:** Spring Boot diegimas, paslaugų tinklas, apkrovos balansavimas  
   **Tikėtinas rezultatas:** Daugiapaslapių Java sistema su paslaugų atradimu ir maršruto nustatymu

### Microsoft Foundry šablonai

1. **[Azure OpenAI Chat App - Vietinis pavyzdys](../../../examples/azure-openai-chat)** ⭐⭐  
   Pilnas GPT-4 diegimas su pokalbių sąsaja  
   **Laikas:** 35-45 minučių | **Kaina:** $50-200/mėn  
   **Tikėtinas rezultatas:** Veikianti pokalbių programa su žetonų sekimu ir sąnaudų stebėsena

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelektuali pokalbių programa su RAG architektūra  
   **Laikas:** 60-90 minučių | **Kaina:** $100-300/mėn  
   **Tikėtinas rezultatas:** RAG varomas pokalbių sąsaja su dokumentų paieška ir citatomis

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentų analizė naudojant Azure AI paslaugas  
   **Laikas:** 40-60 minučių | **Kaina:** $20-80/mėn  
   **Tikėtinas rezultatas:** API, išskirianti tekstą, lenteles ir entites iš įkeltų dokumentų

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps darbo eiga su Azure Machine Learning  
   **Laikas:** 2-3 valandos | **Kaina:** $150-500/mėn  
   **Tikėtinas rezultatas:** Automatizuota ML eiga su treniravimu, diegimu ir stebėsena

### Realūs scenarijai

#### **Retail Multi-Agent Solution** 🆕
**[Pilnas įgyvendinimo vadovas](./retail-scenario.md)**

Išsamus, produkcijai tinkamas daugiaagentis klientų aptarnavimo sprendimas, demonstruojantis įmonės lygio AI programų diegimą su AZD. Šis scenarijus siūlo:

- **Pilna architektūra**: Daugiaagentė sistema su specializuotais klientų aptarnavimo ir inventoriaus valdymo agentais
- **Produkcijos infrastruktūra**: Daugiaregionės Azure OpenAI diegimai, Azure AI Search, Container Apps ir išsamus stebėjimas
- **Paruoštas diegti ARM šablonas**: Vieno paspaudimo diegimas su keliomis konfigūracijos režimais (Minimalus/Standartinis/Premium)
- **Išplėstiniai funkcionalumai**: Red team saugumo patikrinimai, agentų vertinimo sistema, kaštų optimizavimas ir trikčių šalinimo gairės
- **Tikras verslo kontekstas**: Mažmeninės prekybos klientų aptarnavimo scenarijus su failų įkėlimu, paieškos integracija ir dinamišku skalavimu

**Technologijos**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Sudėtingumas**: ⭐⭐⭐⭐ (Išplėstinis - paruošta įmonės gamybai)

**Puikiai tinka**: dirbtinio intelekto kūrėjams, sprendimų architektams ir komandoms, kuriant gamybines daugiagentines sistemas

**Greitas pradėjimas**: Išdėstykite visą sprendimą per mažiau nei 30 minučių naudodami įtrauktą ARM šabloną su `./deploy.sh -g myResourceGroup`

## 📋 Naudojimo instrukcijos

### Prieš pradedant

Prieš paleisdami bet kurį pavyzdį:
- ✅ Azure prenumerata su Owner arba Contributor prieiga
- ✅ Įdiegta Azure Developer CLI ([Diegimo vadovas](../docs/chapter-01-foundation/installation.md))
- ✅ Veikiantis Docker Desktop (konteinerių pavyzdžiams)
- ✅ Tinkami Azure kvotai (patikrinkite pavyzdžio specifinius reikalavimus)

> **💰 Įspėjimas dėl sąnaudų:** Visi pavyzdžiai sukuria tikrus Azure resursus, kurie gali būti apmokestinti. Peržiūrėkite atskirus README failus dėl sąnaudų įvertinimų. Atminkite paleisti `azd down` po darbų, kad išvengtumėte tęstinių išlaidų.

### Pavyzdžių paleidimas lokaliai

1. **Klonuoti arba nukopijuoti pavyzdį**
   ```bash
   # Eikite į norimą pavyzdį
   cd examples/simple-web-app
   ```

2. **Inicializuoti AZD aplinką**
   ```bash
   # Inicializuoti naudojant esamą šabloną
   azd init
   
   # Arba sukurti naują aplinką
   azd env new my-environment
   ```

3. **Konfigūruoti aplinką**
   ```bash
   # Nustatyti reikiamus kintamuosius
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Diegti**
   ```bash
   # Įdiegti infrastruktūrą ir taikomąją programą
   azd up
   ```

5. **Patikrinti diegimą**
   ```bash
   # Gauti paslaugos galinius taškus
   azd env get-values
   
   # Išbandyti galinį tašką (pavyzdys)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Laukiami sėkmės rodikliai:**
   - ✅ `azd up` baigiasi be klaidų
   - ✅ Paslaugos galinis taškas grąžina HTTP 200
   - ✅ Azure portale rodoma būsena "Running"
   - ✅ Application Insights gauna telemetriją

> **⚠️ Kyla problemų?** Peržiūrėkite [Dažnos problemos](../docs/chapter-07-troubleshooting/common-issues.md) dėl diegimo trikčių šalinimo

### Pavyzdžių pritaikymas

Kiekvienas pavyzdys apima:
- **README.md** - Išsamios sąrankos ir pritaikymo instrukcijos
- **azure.yaml** - AZD konfigūracija su komentarais
- **infra/** - Bicep šablonai su parametrų paaiškinimais
- **src/** - Pavyzdinis programos kodas
- **scripts/** - Pagalbiniai scenarijai įprastiems darbams

## 🎯 Mokymosi tikslai

### Pavyzdžių kategorijos

#### **Pagrindiniai diegimai**
- Vienos paslaugos programos
- Paprasti infrastruktūros modeliai
- Pagrindinis konfigūracijos valdymas
- Kaina efektyvios kūrimo sąrankos

#### **Išplėstiniai scenarijai**
- Daugiapaslaugės architektūros
- Sudėtingos tinklo konfigūracijos
- Duomenų bazių integracijos modeliai
- Saugumo ir atitikties įgyvendinimai

#### **Gamybai paruošti modeliai**
- Aukštos prieinamumo konfigūracijos
- Stebėjimas ir matomumas
- CI/CD integracija
- Atsarginio atkūrimo sprendimai

## 📖 Pavyzdžių aprašymai

### Paprasta žiniatinklio programa - Node.js Express
**Technologijos**: Node.js, Express, MongoDB, Container Apps  
**Sudėtingumas**: Pradedantysis  
**Konceptai**: Pagrindinis diegimas, REST API, NoSQL duomenų bazės integracija

### Statinis tinklalapis - React SPA
**Technologijos**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Sudėtingumas**: Pradedantysis  
**Konceptai**: statinis talpinimas, serverless backend, modernus žiniatinklio kūrimas

### Container App - Python Flask
**Technologijos**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Sudėtingumas**: Pradedantysis  
**Konceptai**: Konteinerizacija, REST API, scale-to-zero, sveikatos tikrinimai (health probes), stebėjimas  
**Vieta**: [Vietinis pavyzdys](../../../examples/container-app/simple-flask-api)

### Container App - Mikroservisų architektūra
**Technologijos**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Sudėtingumas**: Išplėstinis  
**Konceptai**: Daugiapaslaugų architektūra, paslaugų komunikacija, žinučių eilės, paskirstyta sekimo sistema (distributed tracing)  
**Vieta**: [Vietinis pavyzdys](../../../examples/container-app/microservices)

### Duomenų bazės programa - C# su Azure SQL
**Technologijos**: C# ASP.NET Core, Azure SQL Database, App Service  
**Sudėtingumas**: Tarpinis  
**Konceptai**: Entity Framework, duomenų bazių prisijungimai, žiniatinklio API kūrimas

### Serverless funkcija - Python Azure Functions
**Technologijos**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Sudėtingumas**: Tarpinis  
**Konceptai**: Įvykių varoma architektūra, serverless kompiuterija, full-stack vystymas

### Mikroservisai - Java Spring Boot
**Technologijos**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Sudėtingumas**: Tarpinis  
**Konceptai**: Mikroservisų komunikacija, paskirstytos sistemos, įmonės modeliai

### Microsoft Foundry pavyzdžiai

#### Azure OpenAI Chat programa
**Technologijos**: Azure OpenAI, Cognitive Search, App Service  
**Sudėtingumas**: Tarpinis  
**Konceptai**: RAG architektūra, vektorinė paieška, LLM integracija

#### AI dokumentų apdorojimas
**Technologijos**: Azure AI Document Intelligence, Storage, Functions  
**Sudėtingumas**: Tarpinis  
**Konceptai**: Dokumentų analizė, OCR, duomenų ekstrakcija

#### Mašininio mokymosi vamzdis
**Technologijos**: Azure ML, MLOps, Container Registry  
**Sudėtingumas**: Išplėstinis  
**Konceptai**: Modelio mokymas, diegimo vamzdynai, stebėjimas

## 🛠 Konfigūracijos pavyzdžiai

Katalogas `configurations/` turi pakartotinai naudojamus komponentus:

### Aplinkos konfigūracijos
- Kūrimo aplinkos nustatymai
- Parengimo (staging) aplinkos konfigūracijos
- Gamybai paruoštos konfigūracijos
- Daugiaregioniniai diegimo nustatymai

### Bicep moduliai
- Pakartotinai naudojami infrastruktūros komponentai
- Bendri išteklių modeliai
- Saugumui sustiprinti skirti šablonai
- Išlaidas optimizuojančios konfigūracijos

### Pagalbiniai scenarijai
- Aplinkos sąrankos automatizavimas
- Duomenų bazių migracijos scenarijai
- Diegimo tikrinimo įrankiai
- Išlaidų stebėjimo įrankiai

## 🔧 Pritaikymo vadovas

### Pavyzdžių pritaikymas jūsų atvejui

1. **Peržiūrėkite išankstinius reikalavimus**
   - Patikrinkite Azure paslaugų reikalavimus
   - Patikrinkite prenumeratos ribas
   - Supraskite kaštų pasekmes

2. **Redaguokite konfigūraciją**
   - Atnaujinkite `azure.yaml` paslaugų apibrėžimus
   - Pritaikykite Bicep šablonus
   - Koreguokite aplinkos kintamuosius

3. **Išsamiai išbandykite**
   - Pirmiausia diegkite į kūrimo aplinką
   - Patikrinkite funkcionalumą
   - Išbandykite mastelio keitimą ir našumą

4. **Saugumo peržiūra**
   - Peržiūrėkite prieigos valdymą
   - Įgyvendinkite slaptųjų duomenų valdymą
   - Įjunkite stebėjimą ir įspėjimus

## 📊 Palyginimo matrica

| Pavyzdys | Paslaugos | Duomenų bazė | Autentifikacija | Stebėjimas | Sudėtingumas |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Vietinis) | 2 | ❌ | Key Vault | Pilnas | ⭐⭐ |
| **Python Flask API** (Vietinis) | 1 | ❌ | Pagrindinis | Pilnas | ⭐ |
| **Microservices** (Vietinis) | 5+ | ✅ | Enterprise | Išplėstinis | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Pagrindinis | Pagrindinis | ⭐ |
| React SPA + Functions | 3 | ✅ | Pagrindinis | Pilnas | ⭐ |
| Python Flask Container | 2 | ❌ | Pagrindinis | Pilnas | ⭐ |
| C# Web API + SQL | 2 | ✅ | Pilnas | Pilnas | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Pilnas | Pilnas | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Pilnas | Pilnas | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Pilnas | Pilnas | ⭐⭐⭐ |
| AI dokumentų apdorojimas | 2 | ❌ | Pagrindinis | Pilnas | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Pilnas | Pilnas | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Vietinis) | **8+** | **✅** | **Enterprise** | **Išplėstinis** | **⭐⭐⭐⭐** |

## 🎓 Mokymosi kelias

### Rekomenduojama tvarka

1. **Pradėkite nuo paprastos žiniatinklio programos**
   - Sužinokite pagrindines AZD sąvokas
   - Supraskite diegimo darbo eigą
   - Praktikuokite aplinkos valdymą

2. **Išbandykite statinį tinklalapį**
   - Išnagrinėkite skirtingas talpinimo parinktis
   - Sužinokite apie CDN integraciją
   - Supraskite DNS konfigūraciją

3. **Peršokite prie konteinerių programos**
   - Sužinokite konteinerizacijos pagrindus
   - Supraskite mastelio keitimo koncepcijas
   - Praktikuokite su Docker

4. **Pridėkite duomenų bazės integraciją**
   - Sužinokite duomenų bazių teikimą (provisioning)
   - Supraskite prisijungimo eilutes
   - Praktikuokite slaptųjų duomenų valdymą

5. **Išnagrinėkite serverless**
   - Supraskite įvykių varomą architektūrą
   - Sužinokite apie trigerius ir bindings
   - Praktikuokite su API

6. **Kurti mikroservisus**
   - Sužinokite paslaugų komunikaciją
   - Supraskite paskirstytas sistemas
   - Praktikuokite sudėtingus diegimus

## 🔍 Kaip rasti tinkamą pavyzdį

### Pagal technologijų rinkinį
- **Container Apps**: [Python Flask API (Vietinis)](../../../examples/container-app/simple-flask-api), [Microservices (Vietinis)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo programa, [Microservices API Gateway (Vietinis)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Vietinis)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Vietinis)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Vietinis)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Vietinis)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Vietinis)](../../../examples/container-app/simple-flask-api), [Microservices (Vietinis)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Vietinis)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Vietinis)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI dokumentų apdorojimas, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (Vietinis)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Vietinis)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Pagal architektūros modelį
- **Paprastas REST API**: [Python Flask API (Vietinis)](../../../examples/container-app/simple-flask-api)
- **Monolitinė**: Node.js Express Todo, C# Web API + SQL
- **Statinis + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroservisai**: [Production Microservices (Vietinis)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Konteinerizuota**: [Python Flask (Vietinis)](../../../examples/container-app/simple-flask-api), [Microservices (Vietinis)](../../../examples/container-app/microservices), Java Microservices
- **AI varoma**: **[Azure OpenAI Chat (Vietinis)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI dokumentų apdorojimas, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent architektūra**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Vietinis)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Pagal sudėtingumo lygį
- **Pradedantysis**: [Python Flask API (Vietinis)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Tarpinis**: **[Azure OpenAI Chat (Vietinis)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI dokumentų apdorojimas
- **Išplėstinis**: ML Pipeline
- **Įmonės gamybai paruoštas**: [Microservices (Vietinis)](../../../examples/container-app/microservices) (Daugiapaslaugis su žinučių eiliavimu), **Retail Multi-Agent Solution** (Pilnas daugiagentis sprendimas su ARM šablono diegimu)

## 📚 Papildomi ištekliai

### Dokumentacijos nuorodos
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Bendruomenės pavyzdžiai
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Užduočių programa su Node.js ir PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React žiniatinklio programa su C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps užduotis](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions su Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Geriausios praktikos
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Prisidėti prie pavyzdžių

Turite naudingą pavyzdį? Kviečiame prisidėti!

### Pateikimo taisyklės
1. Laikykitės nustatytos katalogų struktūros
2. Įtraukite išsamų README.md
3. Pridėkite komentarus į konfigūracijos failus
4. Kruopščiai ištestuokite prieš pateikdami
5. Įtraukite sąnaudų įvertinimus ir išankstinius reikalavimus

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

**Pro patarimas**: Pradėkite nuo paprasčiausio pavyzdžio, atitinkančio jūsų technologijų rinkinį, tada palaipsniui pereikite prie sudėtingesnių scenarijų. Kiekvienas pavyzdys remiasi koncepcijomis iš ankstesnių!

## 🚀 Pasirengę pradėti?

### Jūsų mokymosi kelias

1. **Visiškai pradedate?** → Pradėkite nuo [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Turite pagrindinių AZD žinių?** → Išbandykite [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Kuriate AI programėles?** → Pradėkite nuo [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) arba išnaršykite [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ val.)
4. **Reikia konkretaus technologijų rinkinio?** → Naudokitės aukščiau esančia skiltimi [Kaip rasti tinkamą pavyzdį](../../../examples)

### Tolimesni žingsniai

- ✅ Peržiūrėkite aukščiau esančius [Išankstinius reikalavimus](../../../examples)
- ✅ Pasirinkite pavyzdį, atitinkantį jūsų įgūdžių lygį (žiūr. [Kompleksumo legenda](../../../examples))
- ✅ Atidžiai perskaitykite pavyzdžio README prieš diegdami
- ✅ Priminkite sau paleisti `azd down` po testavimo
- ✅ Pasidalinkite savo patirtimi per GitHub Issues arba Discussions

### Reikia pagalbos?

- 📖 [FAQ](../resources/faq.md) - Atsakymai į dažniausiai užduodamus klausimus
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - Išspręskite diegimo problemas
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Klauskite bendruomenės
- 📚 [Study Guide](../resources/study-guide.md) - Sustiprinkite savo žinias

---

**Naršymas**
- **📚 Kurso pradžia**: [AZD For Beginners](../README.md)
- **📖 Mokomosios medžiagos**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 Resursai**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Paskutinį kartą atnaujinta: 2025 m. lapkričio | [Report Issues](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribute Examples](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo originalo kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojame pasitelkti profesionalų žmogaus vertėją. Mes neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
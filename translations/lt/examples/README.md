# Pavyzdžiai - Praktinės AZD šablonai ir konfigūracijos

**Mokymasis per pavyzdžius - organizuota pagal skyrių**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../README.md)
- **📖 Skyrų žemėlapis**: Pavyzdžiai suskirstyti pagal mokymosi sudėtingumą
- **🚀 Vietinis pavyzdys**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 Išoriniai AI pavyzdžiai**: Nuorodos į Azure Samples saugyklas

> **📍 SVARBU: Vietiniai vs Išoriniai pavyzdžiai**  
> Ši saugykla talpina **4 pilnus vietinius pavyzdžius** su pilna įdiegimo implementacija:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 diegimas su pokalbių sąsaja)  
> - **Container Apps** (Paprastas Flask API + mikroservisai)  
> - **Duomenų bazės programa** (Tinklalapis + SQL duomenų bazė)  
> - **Retail Multi-Agent** (Įmonės lygio AI sprendimas)  
>  
> Papildomi pavyzdžiai yra **išorinės nuorodos** į Azure-Samples saugyklas, kurias galite klonuoti.

## Įvadas

Šis katalogas pateikia praktinius pavyzdžius ir nuorodas, padedančias išmokti Azure Developer CLI per praktinę veiklą. Retail Multi-Agent scenarijus yra pilna, gamybinei aplinkai paruošta implementacija, įtraukta į šią saugyklą. Papildomi pavyzdžiai nurodo oficialias Azure Samples saugyklas, kurios demonstruoja įvairius AZD šablonus.

### Sudėtingumo įvertinimo legenda

- ⭐ **Pradedantiesiems** - Pagrindinės sąvokos, vienas servisas, 15–30 minučių
- ⭐⭐ **Vidutinis** - Keli servisai, duomenų bazės integracija, 30–60 minučių
- ⭐⭐⭐ **Pažengęs** - Sudėtinga architektūra, AI integracija, 1–2 valandos
- ⭐⭐⭐⭐ **Ekspertas** - Gamybai paruošta, įmonės modeliai, 2+ valandos

## 🎯 Kas iš tikrųjų yra šioje saugykloje

### ✅ Vietinė implementacija (paruošta naudoti)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**Pilnas gpt-4.1 diegimas su pokalbių sąsaja, įtrauktas į šią saugyklą**

- **Vieta:** `examples/azure-openai-chat/`
- **Sudėtingumas:** ⭐⭐ (Vidutinis)
- **Įtraukta:**
  - Pilnas Microsoft Foundry Models diegimas (gpt-4.1)
  - Python komandų eilutės pokalbių sąsaja
  - Key Vault integracija saugiems API raktams
  - Bicep infrastruktūros šablonai
  - Žetonų naudojimo ir sąnaudų stebėjimas
  - Srauto ribojimas ir klaidų tvarkymas

**Greitas pradėjimas:**
```bash
# Pereikite į pavyzdį
cd examples/azure-openai-chat

# Įdiekite viską
azd up

# Įdiekite priklausomybes ir pradėkite pokalbį
pip install -r src/requirements.txt
python src/chat.py
```

**Technologijos:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Išsamūs konteinerių diegimo pavyzdžiai, įtraukti į šią saugyklą**

- **Vieta:** `examples/container-app/`
- **Sudėtingumas:** ⭐-⭐⭐⭐⭐ (Nuo pradedančiojo iki eksperto)
- **Įtraukta:**
  - [Master Guide](container-app/README.md) - Išsamus konteinerių diegimų apžvalga
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Pavyzdinis REST API
  - [Microservices Architecture](../../../examples/container-app/microservices) - Gamybai paruoštas kelių servisų diegimas
  - Greitas startas, gamybos ir pažangūs modeliai
  - Stebėsena, saugumas ir sąnaudų optimizavimas

**Greitas pradėjimas:**
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
**Pilna gamybinei aplinkai paruošta implementacija, įtraukta į šią saugyklą**

- **Vieta:** `examples/retail-multiagent-arm-template/`
- **Sudėtingumas:** ⭐⭐⭐⭐ (Pažengęs)
- **Įtraukta:**
  - Pilnas ARM diegimo šablonas
  - Kelių agentų architektūra (Klientas + Inventorius)
  - Microsoft Foundry Models integracija
  - AI paieška su RAG
  - Išsami stebėsena
  - Vieno spustelėjimo diegimo skriptas

**Greitas pradėjimas:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologijos:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Išoriniai Azure Samples (klonuokite norėdami naudoti)

Tolimesni pavyzdžiai palaikomi oficialiose Azure-Samples saugyklose. Klonuokite juos norėdami išnagrinėti skirtingus AZD modelius:

### Paprastos programos (Skyriai 1-2)

| Šablonas | Repozitorija | Sudėtingumas | Paslaugos |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Vietinis: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Vietinis: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Keli servisai, Service Bus, Cosmos DB, SQL |
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

| Šablonas | Repozitorija | Sudėtingumas | Dėmesys |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Vietinis: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 diegimas |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Pagrindinis AI pokalbis |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agentų sistema |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG modelis |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Įmonės lygio AI |

### Duomenų bazės ir pažangūs modeliai (Skyriai 3-8)

| Šablonas | Repozitorija | Sudėtingumas | Dėmesys |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Duomenų bazių integracija |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Keli servisai |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Mokymosi tikslai

Dirbdami su šiais pavyzdžiais jūs:
- Praktikuosite Azure Developer CLI darbo eigas su realiomis programų scenarijomis
- Suprasite skirtingas programų architektūras ir jų azd implementacijas
- Įvaldysite Infrastructure as Code šablonus įvairioms Azure paslaugoms
- Taikysite konfigūracijos valdymą ir aplinkai būdingas diegimo strategijas
- Įgyvendinsite stebėsenos, saugumo ir mastelio modelius praktiniuose kontekstuose
- Sukaupti patirtį sprendžiant trikčių šalinimą ir derinimą realiose diegimo situacijose

## Mokymosi rezultatai

Baigę šiuos pavyzdžius galėsite:
- Pasitikėdami diegti įvairių tipų programas naudojant Azure Developer CLI
- Priderinti pateiktus šablonus prie savo programų reikalavimų
- Kurti ir įgyvendinti pasirinktinius infrastruktūros modelius naudojant Bicep
- Konfigūruoti sudėtingas kelių servisų programas su tinkamomis priklausomybėmis
- Taikyti saugumo, stebėsenos ir našumo geriausias praktikas realiuose scenarijuose
- Spręsti ir optimizuoti diegimus remdamiesi praktine patirtimi

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

## Greito pradėjimo pavyzdžiai

> **💡 Naujas AZD?** Pradėkite nuo pavyzdžio Nr. 1 (Flask API) — jis užtrunka ~20 minučių ir moko pagrindinių sąvokų.

### Pradedantiesiems
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Vietinis) ⭐  
   Diegti paprastą REST API su scale-to-zero  
   **Laikas:** 20–25 minučių | **Kaina:** $0–5/mėn.  
   **Ką išmoksite:** Pagrindinė azd darbo eiga, konteinerizacija, sveikatos patikros  
   **Laukiamas rezultatas:** Veikiantis API galinis taškas grąžinantis "Hello, World!" su stebėsena

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Diegti Node.js Express tinklalapį su MongoDB  
   **Laikas:** 25–35 minučių | **Kaina:** $10–30/mėn.  
   **Ką išmoksite:** Duomenų bazės integracija, aplinkos kintamieji, ryšio eilutės  
   **Laukiamas rezultatas:** Užduočių sąrašo programa su sukūrimo/nuskaitymo/atnaujinimo/šalinimo funkcionalumu

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Talpinti React statinį tinklalapį su Azure Static Web Apps  
   **Laikas:** 20–30 minučių | **Kaina:** $0–10/mėn.  
   **Ką išmoksite:** Statinis talpinimas, serverless funkcijos, CDN diegimas  
   **Laukiamas rezultatas:** React vartotojo sąsaja su API backend, automatinis SSL, globalus CDN

### Vidutiniams vartotojams
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Vietinis) ⭐⭐  
   Diegti gpt-4.1 su pokalbių sąsaja ir saugiu API rakto valdymu  
   **Laikas:** 35–45 minučių | **Kaina:** $50–200/mėn.  
   **Ką išmoksite:** Microsoft Foundry Models diegimas, Key Vault integracija, žetonų stebėjimas  
   **Laukiamas rezultatas:** Veikianti pokalbių programa su gpt-4.1 ir sąnaudų stebėsena

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Vietinis) ⭐⭐⭐⭐  
   Gamybai paruošta kelių servisų architektūra  
   **Laikas:** 45–60 minučių | **Kaina:** $50–150/mėn.  
   **Ką išmoksite:** Servisų komunikacija, žinučių eilės, paskirstyta sekimo sistema  
   **Laukiamas rezultatas:** 2-servisių sistema (API Gateway + Product Service) su stebėsena

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Tinklalapis su C# API ir Azure SQL duomenų baze  
   **Laikas:** 30–45 minučių | **Kaina:** $20–80/mėn.  
   **Ką išmoksite:** Entity Framework, duomenų bazių migracijos, ryšių saugumas  
   **Laukiamas rezultatas:** C# API su Azure SQL backend'u, automatinis schemos diegimas

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions su HTTP trigeriais ir Cosmos DB  
   **Laikas:** 30–40 minučių | **Kaina:** $10–40/mėn.  
   **Ką išmoksite:** Įvykių varoma architektūra, serverless mastelis, NoSQL integracija  
   **Laukiamas rezultatas:** Funkcijų programa atsakanti į HTTP užklausas su Cosmos DB saugykla

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Kelių servisų Java programa su Container Apps ir API vartais  
   **Laikas:** 60–90 minučių | **Kaina:** $80–200/mėn.  
   **Ką išmoksite:** Spring Boot diegimas, servisų tinklas, apkrovos balansavimas  
   **Laukiamas rezultatas:** Kelių servisų Java sistema su servisų atradimu ir maršrutizacija

### Microsoft Foundry šablonai

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Pilnas gpt-4.1 diegimas su pokalbių sąsaja  
   **Laikas:** 35–45 minučių | **Kaina:** $50–200/mėn.  
   **Laukiamas rezultatas:** Veikianti pokalbių programa su žetonų stebėjimu ir sąnaudų monitoringu

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentiška pokalbių programa su RAG architektūra  
   **Laikas:** 60–90 minučių | **Kaina:** $100–300/mėn.  
   **Laukiamas rezultatas:** RAG varoma pokalbių sąsaja su dokumentų paieška ir citatomis

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentų analizė naudojant Azure AI paslaugas  
   **Laikas:** 40–60 minučių | **Kaina:** $20–80/mėn.  
   **Laukiamas rezultatas:** API, extrahuojanti tekstą, lenteles ir entites įkeltuose dokumentuose

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps darbo eiga su Azure Machine Learning  
   **Laikas:** 2–3 valandos | **Kaina:** $150–500/mėn.  
   **Laukiamas rezultatas:** Automatizuotas ML pipeline su treniravimu, diegimu ir stebėsena

### Realūs scenarijai

#### **Retail Multi-Agent Solution** 🆕
**[Pilnas įgyvendinimo vadovas](./retail-scenario.md)**

Visapusiškas, gamybai paruoštas kelių agentų klientų aptarnavimo sprendimas, demonstruojantis įmonės lygio AI programų diegimą naudojant AZD. Šis scenarijus pateikia:

- **Pilna architektūra**: Kelių agentų sistema su specializuotais klientų aptarnavimo ir inventoriaus valdymo agentais
- **Gamybinė infrastruktūra**: kelių regionų Microsoft Foundry Models diegimai, AI Search, Container Apps ir išsamus stebėjimas
- **Paruoštas diegimui ARM šablonas**: vieno paspaudimo diegimas su keliais konfigūracijos režimais (Minimalus/Standartinis/Premium)
- **Pažangios funkcijos**: red teaming saugumo patvirtinimas, agentų vertinimo sistema, kaštų optimizavimas ir trikčių šalinimo gairės
- **Tikras verslo kontekstas**: mažmeninės prekybos klientų aptarnavimo scenarijus su failų įkėlimais, paieškos integracija ir dinaminio mastelio keitimo galimybe

**Technologijos**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Sudėtingumas**: ⭐⭐⭐⭐ (Pažengęs - paruošta įmonės gamybai)

**Puikiai tinka**: AI kūrėjams, sprendimų architektams ir komandoms, kuriančioms gamybinius daugiagentinius sprendimus

**Greitas pradžios vadovas**: Diegkite visą sprendimą per mažiau nei 30 minučių naudojant pridėtą ARM šabloną su `./deploy.sh -g myResourceGroup`

## 📋 Naudojimo instrukcijos

### Išankstiniai reikalavimai

Prieš paleidžiant bet kurį pavyzdį:
- ✅ Azure prenumerata su Owner arba Contributor prieiga
- ✅ Azure Developer CLI įdiegta ([Įdiegimo vadovas](../docs/chapter-01-foundation/installation.md))
- ✅ Veikiantis Docker Desktop (konteineriniams pavyzdžiams)
- ✅ Tinkami Azure kvotai (patikrinkite konkretaus pavyzdžio reikalavimus)

> **💰 Išlaidų įspėjimas:** Visi pavyzdžiai sukuria tikrus Azure išteklius, kurie kelia išlaidas. Žiūrėkite atskirus README failus dėl išlaidų įvertinimų. Atminkite paleidus užbaigus naudoti `azd down`, kad išvengtumėte tolesnių išlaidų.

### Lokalus pavyzdžių paleidimas

1. **Klonuoti arba nukopijuoti pavyzdį**
   ```bash
   # Eikite į norimą pavyzdį
   cd examples/simple-web-app
   ```

2. **Inicijuoti AZD aplinką**
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
   # Diegti infrastruktūrą ir programą
   azd up
   ```

5. **Patvirtinti diegimą**
   ```bash
   # Gauti paslaugos galinius taškus
   azd env get-values
   
   # Išbandyti galinį tašką (pavyzdys)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Tikėtini sėkmės rodikliai:**
   - ✅ `azd up` užbaigiamas be klaidų
   - ✅ Paslaugos galinis taškas grąžina HTTP 200
   - ✅ Azure Portal rodo "Running" būseną
   - ✅ Application Insights gauna telemetriją

> **⚠️ Problemų?** Žiūrėkite [Dažnos problemos](../docs/chapter-07-troubleshooting/common-issues.md) dėl diegimo trikčių šalinimo

### Pritaikymas pavyzdžiams

Kiekvienas pavyzdys apima:
- **README.md** - Išsamios diegimo ir pritaikymo instrukcijos
- **azure.yaml** - AZD konfigūracija su komentarais
- **infra/** - Bicep šablonai su parametrų paaiškinimais
- **src/** - Pavyzdinio programos kodas
- **scripts/** - Pagalbiniai skriptai įprastoms užduotims

## 🎯 Mokymosi tikslai

### Pavyzdžių kategorijos

#### **Pagrindiniai diegimai**
- Vienos paslaugos programos
- Paprasti infrastruktūros šablonai
- Pagrindinis konfigūracijos valdymas
- Ekonomiški vystymo aplinkos nustatymai

#### **Pažangūs scenarijai**
- Daugiapaslaugės architektūros
- Sudėtingos tinklo konfigūracijos
- Duomenų bazės integravimo modeliai
- Saugumo ir atitikties įgyvendinimai

#### **Gamybai paruošti šablonai**
- Aukštos prieinamumo konfigūracijos
- Stebėjimas ir matomumas
- CI/CD integracija
- Avarinio atkūrimo nustatymai

## 📖 Pavyzdžių aprašymai

### Paprasta žiniatinklio programa - Node.js Express
**Technologijos**: Node.js, Express, MongoDB, Container Apps  
**Sudėtingumas**: Pradedantysis  
**Koncepcijos**: Pagrindinis diegimas, REST API, NoSQL duomenų bazės integracija

### Statinis tinklalapis - React SPA
**Technologijos**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Sudėtingumas**: Pradedantysis  
**Koncepcijos**: Statinis talpinimas, serverless backend, modernus žiniatinklio vystymas

### Konteinerinė programa - Python Flask
**Technologijos**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Sudėtingumas**: Pradedantysis  
**Koncepcijos**: Konteinerizacija, REST API, mastelio mažinimas iki nulio (scale-to-zero), sveikatos tikrinimai, stebėjimas  
**Lokacija**: [Vietinis pavyzdys](../../../examples/container-app/simple-flask-api)

### Konteinerinė programa - mikropaslaugų architektūra
**Technologijos**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Sudėtingumas**: Pažengęs  
**Koncepcijos**: Daugiapaslaugė architektūra, paslaugų komunikacija, žinučių eilės, paskirstytas trasavimas  
**Lokacija**: [Vietinis pavyzdys](../../../examples/container-app/microservices)

### Duomenų bazės programa - C# su Azure SQL
**Technologijos**: C# ASP.NET Core, Azure SQL Database, App Service  
**Sudėtingumas**: Tarpinis  
**Koncepcijos**: Entity Framework, duomenų bazių ryšiai, žiniatinklio API kūrimas

### Serverless funkcija - Python Azure Functions
**Technologijos**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Sudėtingumas**: Tarpinis  
**Koncepcijos**: Įvykių valdomos architektūros, serverless skaičiavimas, full-stack kūrimas

### Mikropaslaugos - Java Spring Boot
**Technologijos**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Sudėtingumas**: Tarpinis  
**Koncepcijos**: Mikropaslaugų komunikacija, paskirstytos sistemos, įmoninės praktikos

### Microsoft Foundry pavyzdžiai

#### Microsoft Foundry Models pokalbių programa
**Technologijos**: Microsoft Foundry Models, Azure AI Search, App Service  
**Sudėtingumas**: Tarpinis  
**Koncepcijos**: RAG architektūra, vektorinė paieška, LLM integracija

#### AI dokumentų tvarkymas
**Technologijos**: Azure AI Document Intelligence, Storage, Functions  
**Sudėtingumas**: Tarpinis  
**Koncepcijos**: Dokumentų analizė, OCR, duomenų išgavimas

#### Mašininio mokymosi pipeline
**Technologijos**: Azure ML, MLOps, Container Registry  
**Sudėtingumas**: Pažengęs  
**Koncepcijos**: Modelių mokymas, diegimo procesai, stebėjimas

## 🛠 Konfigūracijos pavyzdžiai

Kataloge `configurations/` yra pakartotinai naudojami komponentai:

### Aplinkos konfiguracijos
- Vystymo aplinkos nustatymai
- Paruošimo (staging) aplinkos konfigūracijos
- Gamybai paruoštos konfigūracijos
- Kelių regionų diegimo nustatymai

### Bicep moduliai
- Pakartotinai naudojami infrastruktūros komponentai
- Bendri išteklių šablonai
- Saugumui pritaikyti šablonai
- Kaštams optimizuotos konfigūracijos

### Pagalbiniai skriptai
- Aplinkos nustatymų automatizavimas
- Duomenų bazių migracijos skriptai
- Diegimo patikros įrankiai
- Išlaidų stebėjimo įrankiai

## 🔧 Pritaikymo vadovas

### Pavyzdžių pritaikymas jūsų atvejui

1. **Peržiūrėkite išankstinius reikalavimus**
   - Patikrinkite Azure paslaugų reikalavimus
   - Patikrinkite prenumeratos ribas
   - Supraskite išlaidų pasekmes

2. **Pakeiskite konfigūraciją**
   - Atnaujinkite `azure.yaml` paslaugų apibrėžimus
   - Pritaikykite Bicep šablonus
   - Pakeiskite aplinkos kintamuosius

3. **Išsamiai testuokite**
   - Pirmiausia diegkite į vystymo aplinką
   - Patikrinkite funkcionalumą
   - Patikrinkite mastelį ir našumą

4. **Saugumo peržiūra**
   - Peržiūrėkite prieigos kontrolę
   - Įgyvendinkite slaptų raktų valdymą
   - Įjunkite stebėjimą ir įspėjimus

## 📊 Palyginimo matrica

| Pavyzdys | Paslaugos | Duomenų bazė | Autentifikacija | Stebėjimas | Sudėtingumas |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Vietinis) | 2 | ❌ | Key Vault | Pilnas | ⭐⭐ |
| **Python Flask API** (Vietinis) | 1 | ❌ | Pagrindinė | Pilnas | ⭐ |
| **Mikropaslaugos** (Vietinis) | 5+ | ✅ | Įmoninis | Pažangus | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Pagrindinė | Pagrindinis | ⭐ |
| React SPA + Functions | 3 | ✅ | Pagrindinė | Pilnas | ⭐ |
| Python Flask Container | 2 | ❌ | Pagrindinė | Pilnas | ⭐ |
| C# Web API + SQL | 2 | ✅ | Pilna | Pilnas | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Pilna | Pilnas | ⭐⭐ |
| Java Mikropaslaugos | 5+ | ✅ | Pilna | Pilnas | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Pilna | Pilnas | ⭐⭐⭐ |
| AI dokumentų tvarkymas | 2 | ❌ | Pagrindinė | Pilnas | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Pilna | Pilnas | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Vietinis) | **8+** | **✅** | **Įmoninis** | **Pažangus** | **⭐⭐⭐⭐** |

## 🎓 Mokymosi kelias

### Rekomenduojama tvarka

1. **Pradėkite nuo paprastos žiniatinklio programos**
   - Išmokite pagrindinius AZD konceptus
   - Supraskite diegimo darbo eigą
   - Praktikuokite aplinkos valdymą

2. **Išbandykite statinį tinklalapį**
   - Išnagrinėkite skirtingus talpinimo variantus
   - Sužinokite apie CDN integraciją
   - Supraskite DNS konfigūraciją

3. **Pereikite prie konteinerinės programos**
   - Išmokite konteinerizacijos pagrindus
   - Supraskite mastelio keitimo koncepcijas
   - Praktikuokitės su Docker

4. **Pridėkite duomenų bazės integraciją**
   - Sužinokite, kaip aprūpinti duomenų bazę
   - Supraskite prisijungimo eilutes
   - Praktikuokite slaptų raktų valdymą

5. **Tyrinėkite serverless**
   - Supraskite įvykių valdomą architektūrą
   - Sužinokite apie trigerius ir susiejimus
   - Praktikuokitės su API

6. **Kurti mikropaslaugų architektūrą**
   - Išmokite paslaugų komunikaciją
   - Supraskite paskirstytas sistemas
   - Praktikuokitės su sudėtingais diegimais

## 🔍 Rasti tinkamą pavyzdį

### Pagal technologijų rinkinį
- **Konteinerių programos**: [Python Flask API (Vietinis)](../../../examples/container-app/simple-flask-api), [Mikropaslaugos (Vietinis)](../../../examples/container-app/microservices), Java Mikropaslaugos
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Vietinis)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Vietinis)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Vietinis)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Vietinis)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Vietinis)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Mikropaslaugos
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Vietinis)](../../../examples/container-app/simple-flask-api), [Mikropaslaugos (Vietinis)](../../../examples/container-app/microservices), Java Mikropaslaugos
- **Databases**: [Mikropaslaugos (Vietinis)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Vietinis)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI dokumentų tvarkymas, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Vietinis)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Mikropaslaugos (Vietinis)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Pagal architektūros modelį
- **Simple REST API**: [Python Flask API (Vietinis)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Produkcinės Mikropaslaugos (Vietinis)](../../../examples/container-app/microservices), Java Spring Boot Mikropaslaugos
- **Containerized**: [Python Flask (Vietinis)](../../../examples/container-app/simple-flask-api), [Mikropaslaugos (Vietinis)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Vietinis)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI dokumentų tvarkymas, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Mikropaslaugos (Vietinis)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Pagal sudėtingumo lygį
- **Pradedantysis**: [Python Flask API (Vietinis)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Tarpinis**: **[Microsoft Foundry Models Chat (Vietinis)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikropaslaugos, Microsoft Foundry Models Chat App, AI dokumentų tvarkymas
- **Pažengęs**: ML Pipeline
- **Įmonės gamybai paruošta**: [Mikropaslaugos (Vietinis)](../../../examples/container-app/microservices) (Daugiapaslaugė su žinučių eilėmis), **Retail Multi-Agent Solution** (Pilnas daugiagentinis sprendimas su ARM šablonu diegimui)

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
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Geriausios praktikos
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Pavyzdžių prisidėjimas

Turite naudingą pavyzdį, kuriuo norėtumėte pasidalinti? Kviečiame prisidėti!

### Pateikimo gairės
1. Laikykitės nustatytos katalogų struktūros
2. Įtraukite išsamų README.md
3. Pridėkite komentarus prie konfigūracijos failų
4. Atlikite išsamius bandymus prieš pateikdami
5. Įtraukite sąnaudų sąmatas ir išankstinius reikalavimus

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

**Naudingas patarimas**: Pradėkite nuo paprasčiausio pavyzdžio, atitinkančio jūsų technologijų rinkinį, o tada palaipsniui pereikite prie sudėtingesnių scenarijų. Kiekvienas pavyzdys remiasi ankstesnių pavyzdžių koncepcijomis!

## 🚀 Pasiruošę pradėti?

### Jūsų mokymosi kelias

1. **Visiškas pradedantysis?** → Pradėkite su [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min.)
2. **Turite pagrindinių AZD žinių?** → Išbandykite [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min.)
3. **Kuriate AI programėles?** → Pradėkite su [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min.) arba peržiūrėkite [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ val.)
4. **Reikia konkretaus technologijų paketo?** → Naudokitės aukščiau esančia skiltimi [Kaip rasti tinkamą pavyzdį](#-finding-the-right-example)

### Kiti veiksmai

- ✅ Peržiūrėkite [Prerequisites](#išankstiniai-reikalavimai) aukščiau
- ✅ Pasirinkite pavyzdį, atitinkantį jūsų įgūdžių lygį (žr. [Complexity Legend](#sudėtingumo-įvertinimo-legenda))
- ✅ Atidžiai perskaitykite pavyzdžio README prieš diegdami
- ✅ Nustatykite priminimą paleisti `azd down` po testavimo
- ✅ Pasidalinkite savo patirtimi per GitHub Issues arba Discussions

### Reikia pagalbos?

- 📖 [DUK](../resources/faq.md) - Dažnai užduodami klausimai
- 🐛 [Trikčių šalinimo vadovas](../docs/chapter-07-troubleshooting/common-issues.md) - Spręskite diegimo problemas
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Klauskite bendruomenės
- 📚 [Mokymosi vadovas](../resources/study-guide.md) - Sustiprinkite savo žinias

---

**Navigacija**
- **📚 Kurso pradžia**: [AZD For Beginners](../README.md)
- **📖 Mokymosi medžiaga**: [Mokymosi vadovas](../resources/study-guide.md) | [Atmintinė](../resources/cheat-sheet.md) | [Sąvokynas](../resources/glossary.md)
- **🔧 Ištekliai**: [DUK](../resources/faq.md) | [Trikčių šalinimas](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Paskutinį kartą atnaujinta: 2025 m. lapkričio | [Pranešti apie problemas](https://github.com/microsoft/AZD-for-beginners/issues) | [Prisidėti pavyzdžiais](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
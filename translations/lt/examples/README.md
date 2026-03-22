# Examples - Practical AZD Templates and Configurations

**Mokymasis per pavyzdžius - sugrupuota pagal skyrių**
- **📚 Kurso pradžia**: [AZD For Beginners](../README.md)
- **📖 Skyrių schema**: Pavyzdžiai suskirstyti pagal mokymosi sudėtingumą
- **🚀 Vietinis pavyzdys**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 Išoriniai AI pavyzdžiai**: Nuorodos į Azure Samples saugyklas

> **📍 SVARBU: Vietiniai vs Išoriniai pavyzdžiai**  
> Ši saugykla (repository) turi **4 pilnus vietinius pavyzdžius** su pilna implementacija:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 diegimas su pokalbių sąsaja)  
> - **Container Apps** (Paprastas Flask API + mikroservisai)  
> - **Duomenų bazės programa** (Web + SQL duomenų bazė)  
> - **Retail Multi-Agent** (Enterprise AI sprendimas)  
>  
> Papildomi pavyzdžiai yra **išorinės nuorodos** į Azure-Samples repozitorijas, kurias galite klonuoti.

## Įvadas

Šis katalogas pateikia praktinius pavyzdžius ir nuorodas, padedančias išmokti Azure Developer CLI per praktinius uždavinius. Retail Multi-Agent scenarijus yra pilna, gamybai paruošta implementacija, įtraukta į šią saugyklą. Papildomi pavyzdžiai nurodo oficialias Azure Samples demonstracijas, kurios iliustruoja įvairius AZD šablonus.

### Sudėtingumo įvertinimų legenda

- ⭐ **Pradedantiesiems** - Pagrindinės sąvokos, vienas servisas, 15–30 minučių
- ⭐⭐ **Vidutinis** - Keli servisai, duomenų bazės integracija, 30–60 minučių
- ⭐⭐⭐ **Pažengęs** - Sudėtinga architektūra, AI integracija, 1–2 valandos
- ⭐⭐⭐⭐ **Ekspertas** - Gamybai paruošta, įmonių modeliai, 2+ valandos

## 🎯 Kas iš tikrųjų yra šioje saugykloje

### ✅ Vietinė implementacija (paruošta naudoti)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**Pilnas gpt-4.1 diegimas su pokalbių sąsaja įtrauktas į šią saugyklą**

- **Vieta:** `examples/azure-openai-chat/`
- **Sudėtingumas:** ⭐⭐ (Vidutinis)
- **Įtraukta:**
  - Pilnas Microsoft Foundry Models diegimas (gpt-4.1)
  - Python komandų eilutės pokalbių sąsaja
  - Key Vault integracija saugiems API raktams
  - Bicep infrastruktūros šablonai
  - Tokenų naudojimo ir kaštų stebėjimas
  - Kainų ribojimas ir klaidų valdymas

**Greitas pradėjimas:**
```bash
# Eikite į pavyzdį
cd examples/azure-openai-chat

# Įdiekite viską
azd up

# Įdiekite priklausomybes ir pradėkite bendrauti
pip install -r src/requirements.txt
python src/chat.py
```

**Technologijos:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Išsamūs konteinerių diegimo pavyzdžiai įtraukti į šią saugyklą**

- **Vieta:** `examples/container-app/`
- **Sudėtingumas:** ⭐-⭐⭐⭐⭐ (Nuo pradedančiųjų iki pažengusių)
- **Įtraukta:**
  - [Vadovas](container-app/README.md) - Išsamus konteinerių diegimų apžvalga
  - [Vietinis: simple-flask-api](../../../examples/container-app/simple-flask-api) - Paprastas REST API pavyzdys
  - [Vietinis: microservices](../../../examples/container-app/microservices) - Gamybinio lygio kelių servisų diegimas
  - Greitas pradėjimas, gamybiniai ir pažangūs modeliai
  - Stebėjimas, saugumas ir kaštų optimizavimas

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
**Pilna gamybai paruošta implementacija įtraukta į šią saugyklą**

- **Vieta:** `examples/retail-multiagent-arm-template/`
- **Sudėtingumas:** ⭐⭐⭐⭐ (Pažengęs)
- **Įtraukta:**
  - Pilnas ARM diegimo šablonas
  - Multi-agent architektūra (Klientas + Inventorius)
  - Microsoft Foundry Models integracija
  - AI Search su RAG
  - Išsamus stebėjimas
  - Vieno paspaudimo diegimo skriptas

**Greitas pradėjimas:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologijos:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Išoriniai Azure Samples (Klonuoti ir naudoti)

Toliau pateikti pavyzdžiai yra palaikomi oficialiose Azure-Samples repozitorijose. Klonuokite juos, kad išnagrinėtumėte skirtingus AZD modelius:

### Paprastos programos (1–2 skyriams)

| Šablonas | Repozitorija | Sudėtingumas | Paslaugos |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Vieta: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Vieta: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Keli servisai, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Kaip naudoti:**
```bash
# Klonuokite bet kurį pavyzdį
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Diegti
azd up
```

### AI programų pavyzdžiai (2, 5, 8 skyriai)

| Šablonas | Repozitorija | Sudėtingumas | Dėmesys |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Vieta: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 diegimas |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Pagrindinis AI pokalbis |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agentų karkasas |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG modelis |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Duomenų bazės & pažangūs modeliai (3–8 skyriai)

| Šablonas | Repozitorija | Sudėtingumas | Dėmesys |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Duomenų bazės integracija |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Keli servisai |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Mokymosi tikslai

Perdirbdami šiuos pavyzdžius jūs:
- Praktikuosite Azure Developer CLI darbo eigas su realiomis programų scenarijomis
- Suprasite skirtingas programų architektūras ir jų azd įgyvendinimus
- Išmoksite Infrastructure as Code modelius įvairioms Azure paslaugoms
- Taikysite konfigūracijos valdymą ir aplinkai būdingas diegimo strategijas
- Įgyvendinsite stebėjimą, saugumą ir skalavimo modelius praktiškuose kontekstuose
- Įgysite patirties sprendžiant klaidas ir derinant realius diegimo scenarijus

## Išmokimo rezultatai

Baigę šiuos pavyzdžius, sugebėsite:
- Pasitikėdami diegti įvairius programų tipus naudojant Azure Developer CLI
- Priderinti pateiktus šablonus prie savo programos reikalavimų
- Kurti ir įgyvendinti pasirinktinius infrastruktūros modelius naudodami Bicep
- Konfigūruoti sudėtingas kelių servisų programas su tinkamomis priklausomybėmis
- Taikyti saugumo, stebėjimo ir našumo gerąsias praktikas realiuose scenarijuose
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

## Greitos pradžios pavyzdžiai

> **💡 Naujas AZD?** Pradėkite nuo 1 pavyzdžio (Flask API) - užtrunka ~20 minučių ir išmokina pagrindines sąvokas.

### Pradedantiesiems
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Vietinis) ⭐  
   Diegti paprastą REST API su scale-to-zero  
   **Laikas:** 20-25 minutės | **Kaina:** $0-5/month  
   **Ko išmoksite:** Pagrindinė azd darbo eiga, konteinerizacija, sveikatos tikrinimai  
   **Tikėtinas rezultatas:** Veikiantis API galinis taškas, grąžinantis "Hello, World!" su stebėjimu

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Diegti Node.js Express web programą su MongoDB  
   **Laikas:** 25-35 minutės | **Kaina:** $10-30/month  
   **Ko išmoksite:** Duomenų bazės integracija, aplinkos kintamieji, jungties eilutės  
   **Tikėtinas rezultatas:** Užduočių sąrašo aplikacija su kurimo/naršymo/atnaujinimo/šalinimo funkcionalumu

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Talpinti React statinį tinklalapį su Azure Static Web Apps  
   **Laikas:** 20-30 minutės | **Kaina:** $0-10/month  
   **Ko išmoksite:** Statinis talpinimas, serverless funkcijos, CDN diegimas  
   **Tikėtinas rezultatas:** React vartotojo sąsaja su API backend, automatinis SSL, globalus CDN

### Vidutinio lygio vartotojams
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Vietinis) ⭐⭐  
   Diegti gpt-4.1 su pokalbių sąsaja ir saugiu API rakto valdymu  
   **Laikas:** 35-45 minutės | **Kaina:** $50-200/month  
   **Ko išmoksite:** Microsoft Foundry Models diegimas, Key Vault integracija, tokenų sekimas  
   **Tikėtinas rezultatas:** Veikianti pokalbių programa su gpt-4.1 ir kaštų stebėjimu

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Vietinis) ⭐⭐⭐⭐  
   Gamybinio lygio kelių servisų architektūra  
   **Laikas:** 45-60 minutės | **Kaina:** $50-150/month  
   **Ko išmoksite:** Servisų komunikacija, žinučių eilės, paskirstytas sekimas  
   **Tikėtinas rezultatas:** 2-servisų sistema (API Gateway + Product Service) su stebėjimu

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web programa su C# API ir Azure SQL duomenų baze  
   **Laikas:** 30-45 minutės | **Kaina:** $20-80/month  
   **Ko išmoksite:** Entity Framework, duomenų bazės migracijos, jungties saugumas  
   **Tikėtinas rezultatas:** C# API su Azure SQL backend, automatinis schemos diegimas

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions su HTTP trigeriais ir Cosmos DB  
   **Laikas:** 30-40 minutės | **Kaina:** $10-40/month  
   **Ko išmoksite:** Įvykių varoma architektūra, serverless skalavimas, NoSQL integracija  
   **Tikėtinas rezultatas:** Function app atsakantis į HTTP užklausas su Cosmos DB saugykla

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Kelių servisų Java programa su Container Apps ir API gateway  
   **Laikas:** 60-90 minutės | **Kaina:** $80-200/month  
   **Ko išmoksite:** Spring Boot diegimas, servicų tinklas, apkrovos balansavimas  
   **Tikėtinas rezultatas:** Kelių servisų Java sistema su servisų atradimu ir maršrutizavimu

### Microsoft Foundry šablonai

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Pilnas gpt-4.1 diegimas su pokalbių sąsaja  
   **Laikas:** 35-45 minutės | **Kaina:** $50-200/month  
   **Tikėtinas rezultatas:** Veikianti pokalbių programa su tokenų sekimu ir kaštų stebėjimu

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Išmanioji pokalbių programa su RAG architektūra  
   **Laikas:** 60-90 minutės | **Kaina:** $100-300/month  
   **Tikėtinas rezultatas:** RAG varoma pokalbių sąsaja su dokumentų paieška ir citatomis

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentų analizė naudojant Azure AI paslaugas  
   **Laikas:** 40-60 minutės | **Kaina:** $20-80/month  
   **Tikėtinas rezultatas:** API ištraukianti tekstą, lenteles ir entitetus iš įkeltų dokumentų

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps darbo eiga su Azure Machine Learning  
   **Laikas:** 2-3 valandos | **Kaina:** $150-500/month  
   **Tikėtinas rezultatas:** Automatizuotas ML pipeline su treniravimu, diegimu ir stebėjimu

### Realūs scenarijai

#### **Retail Multi-Agent Solution** 🆕
**[Išsami įgyvendinimo vadovas](./retail-scenario.md)**

Išsamus, gamybai paruoštas kelių agentų klientų aptarnavimo sprendimas, demonstruojantis įmonės lygio AI programų diegimą su AZD. Šis scenarijus suteikia:
- **Pilna architektūra**: Daugiaprogramė sistema su specializuotais klientų aptarnavimo ir inventoriaus valdymo agentais
- **Gamybinė infrastruktūra**: Daugiaregioniai Microsoft Foundry Models diegimai, AI Search, Container Apps ir išsamus stebėjimas
- **Paruoštas ARM šablonas diegimui**: Vieno mygtuko diegimas su keliais konfigūracijos režimais (Minimalus/Standartinis/Premium)
- **Pažangios funkcijos**: Red teaming saugumo patikra, agentų vertinimo sistema, kaštų optimizavimas ir trikčių šalinimo vadovai
- **Reali verslo kontekstas**: Mažmeninės prekybos klientų aptarnavimo atvejis su bylų įkėlimu, paieškos integracija ir dinaminiu masteliavimu

**Technologijos**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Sudėtingumas**: ⭐⭐⭐⭐ (Pažengęs - Paruošta įmonės gamybai)

**Puikiai tinka**: AI kūrėjams, sprendimų architektams ir komandoms, kuriant gamybinius daugiaprogramius sprendimus

**Greitas pradžios vadovas**: Įdiekite visą sprendimą per mažiau nei 30 minučių naudodami pridedamą ARM šabloną su `./deploy.sh -g myResourceGroup`

## 📋 Naudojimo instrukcijos

### Išankstiniai reikalavimai

Prieš paleisdami bet kurį pavyzdį:
- ✅ Azure prenumerata su Owner arba Contributor prieiga
- ✅ Azure Developer CLI įdiegta ([Installation Guide](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop veikia (konteinerių pavyzdžiams)
- ✅ Tinkamos Azure kvotos (patikrinkite kiekvieno pavyzdžio reikalavimus)

> **💰 Įspėjimas dėl kaštų:** Visi pavyzdžiai kuria tikrus Azure išteklius, už kuriuos gali būti taikomi mokesčiai. Žr. atskirų README failų kaštų įvertinimus. Baigę darbą būtinai paleiskite `azd down`, kad išvengtumėte nuolatinių išlaidų.

### Pavyzdžių paleidimas lokaliai

1. **Klonuokite arba nukopijuokite pavyzdį**
   ```bash
   # Eikite į norimą pavyzdį
   cd examples/simple-web-app
   ```

2. **Inicializuokite AZD aplinką**
   ```bash
   # Inicializuoti naudojant esamą šabloną
   azd init
   
   # Arba sukurti naują aplinką
   azd env new my-environment
   ```

3. **Sukonfigūruokite aplinką**
   ```bash
   # Nustatyti reikiamus kintamuosius
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Diegimas**
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
   
   **Laukiami sėkmės indikatoriai:**
   - ✅ `azd up` užbaigiamas be klaidų
   - ✅ Paslaugos galinis taškas grąžina HTTP 200
   - ✅ Azure Portal rodo „Running“ būseną
   - ✅ Application Insights gauna telemetriją

> **⚠️ Problemos?** Žr. [Dažnos problemos](../docs/chapter-07-troubleshooting/common-issues.md) diegimo trikčių šalinimui

### Pavyzdžių pritaikymas

Kiekvienas pavyzdys apima:
- **README.md** - Išsamios diegimo ir pritaikymo instrukcijos
- **azure.yaml** - AZD konfigūracija su komentarais
- **infra/** - Bicep šablonai su parametrų paaiškinimais
- **src/** - Pavyzdinis programos kodas
- **scripts/** - Pagalbiniai skriptai įprastiems veiksmams

## 🎯 Mokymosi tikslai

### Pavyzdžių kategorijos

#### **Paprasti diegimai**
- Vienos paslaugos programos
- Paprasti infrastruktūros modeliai
- Pagrindinis konfigūravimo valdymas
- Kuo mažesni kaštai vystymui

#### **Pažangios scenarijos**
- Daugia paslaugų architektūros
- Sudėtingos tinklo konfigūracijos
- Duomenų bazių integracijos modeliai
- Saugumo ir atitikties įgyvendinimai

#### **Gamybai paruošti modeliai**
- Aukštos prieinamumo konfigūracijos
- Stebėjimas ir observacija
- CI/CD integracija
- Atsarginio atstatymo sprendimai

## 📖 Pavyzdžių aprašymai

### Simple Web App - Node.js Express
**Technologijos**: Node.js, Express, MongoDB, Container Apps  
**Sudėtingumas**: Pradedantysis  
**Konceptai**: Paprastas diegimas, REST API, NoSQL duomenų bazės integracija

### Static Website - React SPA
**Technologijos**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Sudėtingumas**: Pradedantysis  
**Konceptai**: Statinis talpinimas, serverless backend, modernus web kūrimas

### Container App - Python Flask
**Technologijos**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Sudėtingumas**: Pradedantysis  
**Konceptai**: Kontainerizacija, REST API, scale-to-zero, sveikatos patikros, stebėjimas  
**Vieta**: [Vietinis pavyzdys](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologijos**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Sudėtingumas**: Pažengęs  
**Konceptai**: Daugia paslaugų architektūra, paslaugų komunikacija, žinučių eilės, paskirstyta stebėsena  
**Vieta**: [Vietinis pavyzdys](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologijos**: C# ASP.NET Core, Azure SQL Database, App Service  
**Sudėtingumas**: Tarpinis  
**Konceptai**: Entity Framework, duomenų bazės prisijungimai, web API kūrimas

### Serverless Function - Python Azure Functions
**Technologijos**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Sudėtingumas**: Tarpinis  
**Konceptai**: Įvykių valdomos architektūros, serverless kompiuterija, full-stack kūrimas

### Microservices - Java Spring Boot
**Technologijos**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Sudėtingumas**: Tarpinis  
**Konceptai**: Mikropaslaugų komunikacija, paskirstytos sistemos, įmoniniai modeliai

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologijos**: Microsoft Foundry Models, Cognitive Search, App Service  
**Sudėtingumas**: Tarpinis  
**Konceptai**: RAG architektūra, vektorinė paieška, LLM integracija

#### AI Document Processing
**Technologijos**: Azure AI Document Intelligence, Storage, Functions  
**Sudėtingumas**: Tarpinis  
**Konceptai**: Dokumentų analizė, OCR, duomenų išgavimas

#### Machine Learning Pipeline
**Technologijos**: Azure ML, MLOps, Container Registry  
**Sudėtingumas**: Pažengęs  
**Konceptai**: Modelių mokymas, diegimo vamzdynai, stebėjimas

## 🛠 Konfigūracijos pavyzdžiai

`configurations/` kataloge yra pakartotinai naudojami komponentai:

### Aplinkos konfigūracijos
- Vystymo aplinkos nustatymai
- Staging aplinkos konfigūracijos
- Gamybai paruoštos konfigūracijos
- Daugiaregioniai diegimai

### Bicep moduliai
- Pakartotinai naudojami infrastruktūros komponentai
- Bendri resursų modeliai
- Saugumu sustiprinti šablonai
- Kaštų optimizuotos konfigūracijos

### Pagalbiniai skriptai
- Aplinkos pasiruošimo automatizavimas
- Duomenų bazių migracijos skriptai
- Diegimo validacijos įrankiai
- Kaštų stebėjimo įrankiai

## 🔧 Pritaikymo gidas

### Pavyzdžių pritaikymas jūsų naudojimo atvejui

1. **Peržvelkite išankstinius reikalavimus**
   - Patikrinkite Azure paslaugų reikalavimus
   - Patvirtinkite prenumeratos ribas
   - Supraskite kaštų pasekmes

2. **Modifikuokite konfigūraciją**
   - Atitinkamai atnaujinkite `azure.yaml` paslaugų apibrėžtis
   - Pritaikykite Bicep šablonus
   - Koreguokite aplinkos kintamuosius

3. **Atlikite išsamius testus**
   - Pirmiausia diegkite į vystymo aplinką
   - Patikrinkite funkcionalumą
   - Išbandykite mastelio keitimą ir našumą

4. **Saugumo apžvalga**
   - Peržiūrėkite prieigos kontrolę
   - Įgyvendinkite slaptumo valdymą
   - Įjunkite stebėjimą ir įspėjimus

## 📊 Palyginimo matrica

| Pavyzdys | Paslaugos | Duomenų bazė | Autentifikacija | Stebėjimas | Sudėtingumas |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Pilnas | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Pagrindinis | Pilnas | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Įmoninis | Pažengęs | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Pagrindinis | Pagrindinis | ⭐ |
| React SPA + Functions | 3 | ✅ | Pagrindinis | Pilnas | ⭐ |
| Python Flask Container | 2 | ❌ | Pagrindinis | Pilnas | ⭐ |
| C# Web API + SQL | 2 | ✅ | Pilnas | Pilnas | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Pilnas | Pilnas | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Pilnas | Pilnas | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Pilnas | Pilnas | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Pagrindinis | Pilnas | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Pilnas | Pilnas | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Įmoninis** | **Pažengęs** | **⭐⭐⭐⭐** |

## 🎓 Mokymosi kelias

### Rekomenduojama eiga

1. **Pradėkite nuo Paprasto Web App**
   - Išmokite pagrindines AZD sąvokas
   - Supraskite diegimo darbo eigą
   - Praktikuokite aplinkos valdymą

2. **Išbandykite Statinį puslapį**
   - Išnagrinėkite skirtingas talpinimo parinktis
   - Sužinokite apie CDN integraciją
   - Supraskite DNS konfigūraciją

3. **Pereikite prie Container App**
   - Išmokite kontainerizacijos pagrindus
   - Supraskite mastelio keitimo koncepcijas
   - Praktikuokite su Docker

4. **Pridėkite duomenų bazės integraciją**
   - Išmokite duomenų bazių teikimą
   - Supraskite connection string'us
   - Praktikuokitės su slaptumo valdymu

5. **Ištyrinėkite serverless**
   - Supraskite įvykių valdomą architektūrą
   - Sužinokite apie trigerius ir binding'us
   - Praktikuokite su API

6. **Kurkite mikropaslaugas**
   - Išmokite paslaugų tarpusavio komunikaciją
   - Supraskite paskirstytas sistemas
   - Praktikuokitės sudėtingus diegimus

## 🔍 Kaip rasti tinkamą pavyzdį

### Pagal technologijų rinkinį
- **Container Apps**: [Python Flask API (Vietinis)](../../../examples/container-app/simple-flask-api), [Microservices (Vietinis)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Vietinis)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Vietinis)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Vietinis)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Vietinis)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Vietinis)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Vietinis)](../../../examples/container-app/simple-flask-api), [Microservices (Vietinis)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Vietinis)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Vietinis)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Vietinis)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Vietinis)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Pagal architektūros modelį
- **Simple REST API**: [Python Flask API (Vietinis)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Vietinis)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Vietinis)](../../../examples/container-app/simple-flask-api), [Microservices (Vietinis)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Vietinis)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Vietinis)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Pagal sudėtingumo lygį
- **Pradedantysis**: [Python Flask API (Vietinis)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Tarpinis**: **[Microsoft Foundry Models Chat (Vietinis)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Pažengęs**: ML Pipeline
- **Paruošta įmonės gamybai**: [Microservices (Vietinis)](../../../examples/container-app/microservices) (Daugia paslaugų su žinučių eilėmis), **Retail Multi-Agent Solution** (Pilna daugiaprogramė sistema su ARM šablono diegimu)

## 📚 Papildomi ištekliai

### Dokumentacijos nuorodos
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Bendruomenės pavyzdžiai
- [Azure pavyzdžiai AZD šablonai](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry šablonai](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI galerija](https://azure.github.io/awesome-azd/)
- [Todo programa su C# ir Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo programa su Python ir MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo programa su Node.js ir PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React žiniatinklio programa su C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps užduotis](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions naudojant Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Geriausios praktikos
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Prisidėti prie pavyzdžių

Ar turite naudingą pavyzdį, kuriuo norėtumėte pasidalinti? Laukiame jūsų indėlių!

### Pateikimo gairės
1. Laikykitės nustatytos katalogų struktūros
2. Pateikite išsamų README.md
3. Pridėkite komentarus prie konfigūracijos failų
4. Išsamiai išbandykite prieš pateikiant
5. Pateikite sąnaudų įvertinimus ir išankstinius reikalavimus

### Pavyzdinio šablono struktūra
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

**Pro patarimas**: Pradėkite nuo paprasčiausio pavyzdžio, atitinkančio jūsų technologinį rinkinį, ir palaipsniui pereikite prie sudėtingesnių scenarijų. Kiekvienas pavyzdys statomas ant ankstesnių koncepcijų!

## 🚀 Pasirengę pradėti?

### Jūsų mokymosi kelias

1. **Visiškai pradedantysis?** → Pradėkite nuo [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Turite pagrindinių AZD žinių?** → Išbandykite [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Kuriate AI programėles?** → Pradėkite nuo [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) arba išnagrinėkite [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ val.)
4. **Reikia konkretaus technologijų rinkinio?** → Naudokite aukščiau esančią skiltį [Rasti tinkamą pavyzdį](#-finding-the-right-example)

### Kiti žingsniai

- ✅ Peržvelkite aukščiau esančius [Išankstinius reikalavimus](#išankstiniai-reikalavimai)
- ✅ Pasirinkite pavyzdį, atitinkantį jūsų įgūdžių lygį (žr. [Sudėtingumo legendą](#sudėtingumo-įvertinimų-legenda))
- ✅ Prieš diegdami kruopščiai perskaitykite pavyzdžio README
- ✅ Nustatykite priminimą paleisti `azd down` po bandymų
- ✅ Pasidalinkite savo patirtimi per GitHub Issues arba Discussions

### Reikia pagalbos?

- 📖 [DUK](../resources/faq.md) - Atsakymai į dažniausiai užduodamus klausimus
- 🐛 [Trikčių šalinimo vadovas](../docs/chapter-07-troubleshooting/common-issues.md) - Išspręskite diegimo problemas
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Klauskite bendruomenės
- 📚 [Mokymosi vadovas](../resources/study-guide.md) - Įtvirtinkite savo žinias

---

**Naršymas**
- **📚 Kurso pradžia**: [AZD For Beginners](../README.md)
- **📖 Mokymo medžiaga**: [Mokymosi vadovas](../resources/study-guide.md) | [Atmintinė](../resources/cheat-sheet.md) | [Žodynas](../resources/glossary.md)
- **🔧 Ištekliai**: [DUK](../resources/faq.md) | [Trikčių šalinimas](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Paskutinį kartą atnaujinta: 2025 m. lapkričio mėn. | [Pranešti apie problemas](https://github.com/microsoft/AZD-for-beginners/issues) | [Prisidėti pavyzdžiais](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas patikimu šaltiniu. Esant kritinei informacijai, rekomenduojamas profesionalus žmogaus atliktas vertimas. Mes neatsakome už jokius nesusipratimus ar klaidingas interpretacijas, kylančias dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
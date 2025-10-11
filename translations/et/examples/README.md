<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-10-11T15:39:56+00:00",
  "source_file": "examples/README.md",
  "language_code": "et"
}
-->
# Näited - Praktilised AZD mallid ja konfiguratsioonid

**Õppimine näidete kaudu - jaotatud peatükkide kaupa**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Peatükkide jaotus**: Näited jaotatud õppimise keerukuse järgi
- **🚀 Alusta lihtsast**: [1. peatüki näited](../../../examples)
- **🤖 AI näited**: [2. ja 5. peatüki AI lahendused](../../../examples)

## Sissejuhatus

See kataloog sisaldab praktilisi näiteid, malle ja päriselulisi stsenaariume, mis aitavad sul õppida Azure Developer CLI-d praktilise harjutamise kaudu. Iga näide pakub täielikku töötavat koodi, infrastruktuuri malle ja üksikasjalikke juhiseid erinevate rakenduste arhitektuuride ja juurutusmustrite kohta.

## Õppimise eesmärgid

Näidete läbimisega saad:
- Harjutada Azure Developer CLI töövooge realistlike rakenduste stsenaariumidega
- Mõista erinevaid rakenduste arhitektuure ja nende AZD rakendusi
- Valdada infrastruktuuri kui koodi mustreid erinevate Azure'i teenuste jaoks
- Rakendada konfiguratsioonihaldust ja keskkonnaspetsiifilisi juurutusstrateegiaid
- Rakendada monitooringu, turvalisuse ja skaleerimise mustreid praktilises kontekstis
- Omandada kogemusi juurutuste tõrkeotsingus ja optimeerimises

## Õppimise tulemused

Näidete läbimise järel oled võimeline:
- Juurutama erinevaid rakendustüüpe Azure Developer CLI abil enesekindlalt
- Kohandama pakutud malle oma rakenduse nõuetele vastavaks
- Kavandama ja rakendama kohandatud infrastruktuuri mustreid Bicepiga
- Konfigureerima keerukaid mitmeteenuselisi rakendusi õige sõltuvuste haldusega
- Rakendama turvalisuse, monitooringu ja jõudluse parimaid praktikaid päriselulistes stsenaariumides
- Lahendama probleeme ja optimeerima juurutusi praktilise kogemuse põhjal

## Kataloogi struktuur

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

## Kiire alguse näited

### Algajatele
1. **[Lihtne veebirakendus - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Juuruta Node.js Express veebirakendus MongoDB-ga
2. **[Staatiline veebisait - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Hostige React staatiline veebisait Azure Static Web Apps abil
3. **[Konteinerirakendus - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Juuruta konteineriseeritud Python Flask rakendus

### Kesktaseme kasutajatele
4. **[Andmebaasirakendus - C# koos Azure SQL-ga](https://github.com/Azure-Samples/todo-csharp-sql)** - Veebirakendus C# API ja Azure SQL andmebaasiga
5. **[Serverless funktsioon - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions HTTP triggerite ja Cosmos DB-ga
6. **[Mikroteenused - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Mitmeteenuseline Java rakendus Container Apps ja API gateway-ga

### Azure AI Foundry mallid

1. **[Azure OpenAI vestlusrakendus](https://github.com/Azure-Samples/azure-search-openai-demo)** - Nutikas vestlusrakendus Azure OpenAI-ga
2. **[AI dokumenditöötlus](https://github.com/Azure-Samples/azure-ai-document-processing)** - Dokumentide analüüs Azure AI teenuste abil
3. **[Masinõppe torujuhe](https://github.com/Azure-Samples/mlops-v2)** - MLOps töövoog Azure Machine Learninguga

### Päriselulised stsenaariumid

#### **Jaemüügi mitmeagendiline lahendus** 🆕
**[Täielik rakendusjuhend](./retail-scenario.md)**

Terviklik, tootmisvalmis mitmeagendiline klienditoe lahendus, mis demonstreerib ettevõtte tasemel AI rakenduse juurutamist AZD-ga. See stsenaarium pakub:

- **Täielik arhitektuur**: Mitmeagendiline süsteem spetsialiseeritud klienditeeninduse ja inventari halduse agentidega
- **Tootmise infrastruktuur**: Mitme piirkonna Azure OpenAI juurutused, AI otsing, Container Apps ja ulatuslik monitooring
- **Valmis ARM mall**: Ühe klõpsuga juurutus mitme konfiguratsioonirežiimiga (Minimal/Standard/Premium)
- **Täiustatud funktsioonid**: Turvalisuse valideerimine, agentide hindamise raamistik, kulude optimeerimine ja tõrkeotsingu juhendid
- **Päris ärikontekst**: Jaemüüja klienditoe kasutusjuht failide üleslaadimise, otsingu integreerimise ja dünaamilise skaleerimisega

**Tehnoloogiad**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Keerukus**: ⭐⭐⭐⭐ (Edasijõudnud - ettevõtte tootmisvalmis)

**Sobib ideaalselt**: AI arendajatele, lahenduste arhitektidele ja meeskondadele, kes loovad tootmisvalmis mitmeagendilisi süsteeme

**Kiire algus**: Juurutage täielik lahendus vähem kui 30 minutiga kaasasoleva ARM malli abil, kasutades `./deploy.sh -g myResourceGroup`

## 📋 Kasutusjuhised

### Näidete käivitamine kohapeal

1. **Näite kloonimine või kopeerimine**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **AZD keskkonna initsialiseerimine**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Keskkonna konfigureerimine**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Juurutamine**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Näidete kohandamine

Iga näide sisaldab:
- **README.md** - Üksikasjalikud seadistus- ja kohandamisjuhised
- **azure.yaml** - AZD konfiguratsioon kommentaaridega
- **infra/** - Bicep mallid parameetrite selgitustega
- **src/** - Näidisrakenduse kood
- **scripts/** - Abiskriptid tavapäraste ülesannete jaoks

## 🎯 Õppimise eesmärgid

### Näidete kategooriad

#### **Põhilised juurutused**
- Ühe teenuse rakendused
- Lihtsad infrastruktuuri mustrid
- Põhiline konfiguratsioonihaldus
- Kulutõhusad arenduskeskkonnad

#### **Keerukad stsenaariumid**
- Mitmeteenuselised arhitektuurid
- Keerukad võrgukonfiguratsioonid
- Andmebaasi integreerimise mustrid
- Turvalisuse ja vastavuse rakendused

#### **Tootmisvalmis mustrid**
- Kõrge saadavuse konfiguratsioonid
- Monitooring ja jälgitavus
- CI/CD integratsioon
- Katastroofide taastamise seadistused

## 📖 Näidete kirjeldused

### Lihtne veebirakendus - Node.js Express
**Tehnoloogiad**: Node.js, Express, MongoDB, Container Apps  
**Keerukus**: Algaja  
**Kontseptsioonid**: Põhiline juurutus, REST API, NoSQL andmebaasi integreerimine

### Staatiline veebisait - React SPA
**Tehnoloogiad**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Keerukus**: Algaja  
**Kontseptsioonid**: Staatiline hostimine, serverless backend, kaasaegne veebiarendus

### Konteinerirakendus - Python Flask
**Tehnoloogiad**: Python Flask, Docker, Container Apps, Container Registry  
**Keerukus**: Algaja  
**Kontseptsioonid**: Konteineriseerimine, mikroteenuste arhitektuur, API arendus

### Andmebaasirakendus - C# koos Azure SQL-ga
**Tehnoloogiad**: C# ASP.NET Core, Azure SQL Database, App Service  
**Keerukus**: Kesktase  
**Kontseptsioonid**: Entity Framework, andmebaasiühendused, veebirakenduse API arendus

### Serverless funktsioon - Python Azure Functions
**Tehnoloogiad**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Keerukus**: Kesktase  
**Kontseptsioonid**: Sündmuspõhine arhitektuur, serverless arvutus, täisstack arendus

### Mikroteenused - Java Spring Boot
**Tehnoloogiad**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Keerukus**: Kesktase  
**Kontseptsioonid**: Mikroteenuste kommunikatsioon, hajutatud süsteemid, ettevõtte mustrid

### Azure AI Foundry näited

#### Azure OpenAI vestlusrakendus
**Tehnoloogiad**: Azure OpenAI, Cognitive Search, App Service  
**Keerukus**: Kesktase  
**Kontseptsioonid**: RAG arhitektuur, vektorotsing, LLM integreerimine

#### AI dokumenditöötlus
**Tehnoloogiad**: Azure AI Document Intelligence, Storage, Functions  
**Keerukus**: Kesktase  
**Kontseptsioonid**: Dokumentide analüüs, OCR, andmete ekstraheerimine

#### Masinõppe torujuhe
**Tehnoloogiad**: Azure ML, MLOps, Container Registry  
**Keerukus**: Edasijõudnud  
**Kontseptsioonid**: Mudelite treenimine, juurutustorud, monitooring

## 🛠 Konfiguratsiooni näited

Kataloog `configurations/` sisaldab taaskasutatavaid komponente:

### Keskkonna konfiguratsioonid
- Arenduskeskkonna seadistused
- Staging-keskkonna konfiguratsioonid
- Tootmisvalmis konfiguratsioonid
- Mitme piirkonna juurutuse seadistused

### Bicep moodulid
- Taaskasutatavad infrastruktuuri komponendid
- Ühised ressursimustrid
- Turvalisuse tugevdamise mallid
- Kulutõhusad konfiguratsioonid

### Abiskriptid
- Keskkonna seadistamise automatiseerimine
- Andmebaasi migratsiooni skriptid
- Juurutuse valideerimise tööriistad
- Kulude jälgimise utiliidid

## 🔧 Kohandamise juhend

### Näidete kohandamine oma kasutusjuhuks

1. **Eeltingimuste ülevaatamine**
   - Kontrolli Azure'i teenuste nõudeid
   - Veendu tellimuse piirangutes
   - Mõista kulude mõju

2. **Konfiguratsiooni muutmine**
   - Uuenda `azure.yaml` teenuse määratlusi
   - Kohanda Bicep malle
   - Muuda keskkonnamuutujaid

3. **Testi põhjalikult**
   - Juuruta esmalt arenduskeskkonda
   - Valideeri funktsionaalsus
   - Testi skaleerimist ja jõudlust

4. **Turvalisuse ülevaatus**
   - Kontrolli juurdepääsukontrolle
   - Rakenda saladuste haldust
   - Luba monitooring ja hoiatused

## 📊 Võrdlustabel

| Näide | Teenused | Andmebaas | Autentimine | Monitooring | Keerukus |
|-------|----------|-----------|-------------|-------------|----------|
| Node.js Express Todo | 2 | ✅ | Põhiline | Põhiline | ⭐ |
| React SPA + Functions | 3 | ✅ | Põhiline | Täielik | ⭐ |
| Python Flask Container | 2 | ❌ | Põhiline | Täielik | ⭐ |
| C# Web API + SQL | 2 | ✅ | Täielik | Täielik | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Täielik | Täielik | ⭐⭐ |
| Java Mikroteenused | 5+ | ✅ | Täielik | Täielik | ⭐⭐ |
| Azure OpenAI vestlus | 3 | ✅ | Täielik | Täielik | ⭐⭐⭐ |
| AI dokumenditöötlus | 2 | ❌ | Põhiline | Täielik | ⭐⭐ |
| ML torujuhe | 4+ | ✅ | Täielik | Täielik | ⭐⭐⭐⭐ |
| **Jaemüügi mitmeagent** | **8+** | **✅** | **Ettevõtte tasemel** | **Täiustatud** | **⭐⭐⭐⭐** |

## 🎓 Õppimise teekond

### Soovitatav järjekord

1. **Alusta lihtsast veebirakendusest**
   - Õpi AZD põhimõisteid
   - Mõista juurutuse töövoogu
   - Harjuta keskkonna haldust

2. **Proovi staatilist veebisaiti**
   - Uuri erinevaid hostimisvõimalusi
   - Õpi CDN integreerimist
   - Mõista DNS konfiguratsiooni

3. **Liigu konteinerirakenduse juurde**
   - Õpi konteineriseerimise põhitõdesid
   - Mõista skaleerimise kontseptsioone
   - Harjuta Dockeriga

4. **Lisa andmebaasi integreerimine**
   - Õpi andmebaasi ettevalmistamist
   - Mõista ühendusstringe
   - Harjuta saladuste haldust

5. **Uuri serverless arhitektuuri**
   - Mõista sündmuspõhist arhitektuuri
   - Õpi triggerite ja sidumiste kohta
   - Harjuta API-dega

6. **Ehita mikroteenuseid**
   - Õpi teenuste kommunikatsiooni
   - Mõista hajutatud süsteeme
   - Harjuta keerukaid juurutusi

## 🔍 Õige näite leidmine

### Tehnoloogiapõhiselt
- **Node.js**: Node.js Express Todo rakendus
- **Python**: Python Flask konteinerirakendus, Python Functions + SPA
- **C#**: C# Web API + SQL andmebaas, Azure OpenAI vestlusrakendus, ML torujuhe
- **Java**: Java Spring Boot mikroteenused
- **React**: React SPA + Functions
- **Konteinerid**: Python Flask konteinerirakendus, Java mikroteenused
- **Andmebaasid**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI vestlusrakendus, AI dokumenditöötlus, ML torujuhe, **Jaemüügi mitmeagent**
- **Mitmeagendilised süsteemid**: **Jaemüügi mitmeagent**
- **Ettevõtte tootmisvalmis**: **Jaemüügi mitmeagent**

### Arhitektuurimustri järgi
- **Monoliitne**: Node.js Express Todo, C# Web API + SQL
- **Staatiline + serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroteenused**: Java Spring Boot mikroteenused
- **Konteineriseeritud**: Python Flask konteinerirakendus
- **AI-põhine**: Azure OpenAI vestlusrakendus, AI dokumenditöötlus, ML torujuhe, **Jaemüügi mitmeagent**
- **Mitmeagendiline arhitektuur**: **Jaemüügi mitmeagent**
- **Ettevõtte mitmeteenuseline**: **Jaemüügi mitmeagent**

### Keerukuse taseme järgi
- **Algaja**: Node.js Express Todo, React SPA + Functions, Python Flask konteinerirakendus
- **Kesktase**: C# Web API + SQL, Python Functions + SPA, Java mikroteenused, Azure OpenAI vestlusrakendus, AI dokumenditöötlus
- **Edasijõudnud**: ML torujuhe
- **Ettevõtte tootmisvalmis**: **Jaemüügi mitmeagent** (Täielik mitmeagendiline süsteem ARM malli juurutusega)

## 📚 Lisamaterjalid

### Dokumentatsiooni lingid
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD mallid](https://github.com/Azure/ai-foundry-templates)
- [Bicep dokumentatsioon](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure arhitektuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)

### Kogukonna näited
- [Azure näidised AZD mallid](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry mallid](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI galerii](https
- [Todo rakendus C# ja Azure SQL-iga](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo rakendus Pythoniga ja MongoDB-ga](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo rakendus Node.js ja PostgreSQL-iga](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React veebirakendus C# API-ga](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps töö](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java-ga](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Parimad tavad
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Näidete panustamine

Kas sul on kasulik näide, mida jagada? Me tervitame panuseid!

### Esitamise juhised
1. Järgi kehtestatud kataloogistruktuuri
2. Lisa põhjalik README.md
3. Lisa kommentaarid konfiguratsioonifailidesse
4. Testi põhjalikult enne esitamist
5. Lisa kuluhinnangud ja eeldused

### Näidise mallistruktuur
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

**Pro nõuanne**: Alusta kõige lihtsamast näitest, mis sobib sinu tehnoloogiakomplektiga, ja liigu järk-järgult keerukamate stsenaariumide poole. Iga näide tugineb eelmistele kontseptsioonidele!

**Järgmised sammud**: 
- Vali näide, mis vastab sinu oskuste tasemele
- Järgi näite README juhiseid seadistamiseks
- Katseta kohandusi
- Jaga oma õpitut kogukonnaga

---

**Navigeerimine**
- **Eelmine õppetund**: [Õppejuhend](../resources/study-guide.md)
- **Tagasi**: [Peamine README](../README.md)

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
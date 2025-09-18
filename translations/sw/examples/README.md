<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-18T09:02:23+00:00",
  "source_file": "examples/README.md",
  "language_code": "sw"
}
-->
# Mifano - Violezo vya AZD vya Kivitendo na Usanidi

**Kujifunza kwa Mifano - Imeandaliwa kwa Sura**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Anayeanza](../README.md)
- **📖 Ulinganifu wa Sura**: Mifano imepangwa kulingana na ugumu wa kujifunza
- **🚀 Anza Rahisi**: [Mifano ya Sura ya 1](../../../examples)
- **🤖 Mifano ya AI**: [Sura ya 2 & 5 Suluhisho za AI](../../../examples)

## Utangulizi

Hii ni saraka yenye mifano ya kivitendo, violezo, na hali halisi za maisha ili kukusaidia kujifunza Azure Developer CLI kwa mazoezi ya vitendo. Kila mfano unatoa msimbo kamili unaofanya kazi, violezo vya miundombinu, na maelekezo ya kina kwa usanifu tofauti wa programu na mifumo ya usambazaji.

## Malengo ya Kujifunza

Kwa kufanya kazi kupitia mifano hii, utaweza:
- Kufanya mazoezi ya mtiririko wa kazi wa Azure Developer CLI kwa hali halisi za programu
- Kuelewa usanifu tofauti wa programu na utekelezaji wake kwa azd
- Kumudu mifumo ya Miundombinu kama Msimbo kwa huduma mbalimbali za Azure
- Kutumia usimamizi wa usanidi na mikakati ya usambazaji maalum kwa mazingira
- Kutekeleza mifumo ya ufuatiliaji, usalama, na upanuzi katika hali za kivitendo
- Kujenga uzoefu wa kutatua matatizo na kurekebisha hali halisi za usambazaji

## Matokeo ya Kujifunza

Baada ya kukamilisha mifano hii, utaweza:
- Kusambaza aina mbalimbali za programu kwa kutumia Azure Developer CLI kwa ujasiri
- Kubadilisha violezo vilivyotolewa ili kukidhi mahitaji yako ya programu
- Kubuni na kutekeleza mifumo maalum ya miundombinu kwa kutumia Bicep
- Kusimamia programu za huduma nyingi kwa utegemezi sahihi
- Kutumia mbinu bora za usalama, ufuatiliaji, na utendaji katika hali halisi
- Kutatua matatizo na kuboresha usambazaji kwa msingi wa uzoefu wa vitendo

## Muundo wa Saraka

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

## Mifano ya Kuanza Haraka

### Kwa Anayeanza
1. **[Programu Rahisi ya Wavuti - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Sambaza programu ya wavuti ya Node.js Express na MongoDB  
2. **[Tovuti Tulivu - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Karibisha tovuti tulivu ya React kwa Azure Static Web Apps  
3. **[Programu ya Kontena - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Sambaza programu ya Python Flask iliyowekwa kwenye kontena  

### Kwa Watumiaji wa Kati
4. **[Programu ya Hifadhidata - C# na Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Programu ya wavuti yenye API ya C# na Hifadhidata ya Azure SQL  
5. **[Kazi ya Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions na vichocheo vya HTTP na Cosmos DB  
6. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Programu ya huduma nyingi ya Java yenye Container Apps na API gateway  

### Violezo vya Azure AI Foundry

1. **[Programu ya Mazungumzo ya Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Programu ya mazungumzo yenye akili kwa Azure OpenAI  
2. **[Usindikaji wa Nyaraka za AI](https://github.com/Azure-Samples/azure-ai-document-processing)** - Uchambuzi wa nyaraka kwa kutumia huduma za Azure AI  
3. **[Mfumo wa Kujifunza kwa Mashine](https://github.com/Azure-Samples/mlops-v2)** - Mtiririko wa MLOps kwa Azure Machine Learning  

### Hali Halisi za Maisha

#### **Suluhisho la Wakala Wengi kwa Biashara ya Rejareja** 🆕  
**[Mwongozo Kamili wa Utekelezaji](./retail-scenario.md)**  

Suluhisho kamili, tayari kwa uzalishaji la msaada wa wateja kwa wakala wengi linaloonyesha usambazaji wa programu ya AI ya daraja la biashara kwa AZD. Hali hii inatoa:

- **Usanifu Kamili**: Mfumo wa wakala wengi wenye wakala maalum wa huduma kwa wateja na usimamizi wa hesabu  
- **Miundombinu ya Uzalishaji**: Usambazaji wa Azure OpenAI wa mikoa mingi, AI Search, Container Apps, na ufuatiliaji wa kina  
- **Violezo vya ARM Tayari Kusambazwa**: Usambazaji wa kubofya mara moja na hali nyingi za usanidi (Minimal/Standard/Premium)  
- **Vipengele vya Juu**: Uthibitishaji wa usalama wa red teaming, mfumo wa tathmini ya wakala, uboreshaji wa gharama, na miongozo ya kutatua matatizo  
- **Muktadha Halisi wa Biashara**: Hali ya msaada wa wateja wa rejareja yenye upakiaji wa faili, ujumuishaji wa utafutaji, na upanuzi wa nguvu  

**Teknolojia**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Ugumu**: ⭐⭐⭐⭐ (Juu - Tayari kwa Uzalishaji wa Biashara)  

**Inafaa kwa**: Watengenezaji wa AI, wasanifu wa suluhisho, na timu zinazojenga mifumo ya wakala wengi kwa uzalishaji  

**Kuanza Haraka**: Sambaza suluhisho kamili chini ya dakika 30 kwa kutumia kiolezo cha ARM kilichojumuishwa na `./deploy.sh -g myResourceGroup`  

## 📋 Maelekezo ya Matumizi

### Kuendesha Mifano Laini

1. **Nakili au Clone Mfano**  
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```  

2. **Anzisha Mazingira ya AZD**  
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```  

3. **Sanidi Mazingira**  
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```  

4. **Sambaza**  
   ```bash
   # Deploy infrastructure and application
   azd up
   ```  

### Kubadilisha Mifano

Kila mfano unajumuisha:
- **README.md** - Maelekezo ya kina ya usanidi na ubinafsishaji  
- **azure.yaml** - Usanidi wa AZD wenye maoni  
- **infra/** - Violezo vya Bicep vyenye maelezo ya vigezo  
- **src/** - Msimbo wa programu ya mfano  
- **scripts/** - Hati za kusaidia kwa kazi za kawaida  

## 🎯 Malengo ya Kujifunza

### Makundi ya Mifano

#### **Usambazaji Rahisi**
- Programu za huduma moja  
- Mifumo rahisi ya miundombinu  
- Usimamizi wa usanidi wa msingi  
- Mazingira ya maendeleo yenye gharama nafuu  

#### **Hali za Juu**
- Usanifu wa huduma nyingi  
- Usanidi wa mitandao tata  
- Mifumo ya ujumuishaji wa hifadhidata  
- Utekelezaji wa usalama na kufuata sheria  

#### **Mifumo Tayari kwa Uzalishaji**
- Usanidi wa upatikanaji wa juu  
- Ufuatiliaji na uangalizi  
- Ujumuishaji wa CI/CD  
- Mipango ya urejeshaji wa maafa  

## 📖 Maelezo ya Mifano

### Programu Rahisi ya Wavuti - Node.js Express  
**Teknolojia**: Node.js, Express, MongoDB, Container Apps  
**Ugumu**: Anayeanza  
**Mafunzo**: Usambazaji wa msingi, REST API, ujumuishaji wa hifadhidata ya NoSQL  

### Tovuti Tulivu - React SPA  
**Teknolojia**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Ugumu**: Anayeanza  
**Mafunzo**: Ukaribishaji tulivu, backend ya serverless, maendeleo ya wavuti ya kisasa  

### Programu ya Kontena - Python Flask  
**Teknolojia**: Python Flask, Docker, Container Apps, Container Registry  
**Ugumu**: Anayeanza  
**Mafunzo**: Uwekaji kwenye kontena, usanifu wa huduma ndogo, maendeleo ya API  

### Programu ya Hifadhidata - C# na Azure SQL  
**Teknolojia**: C# ASP.NET Core, Azure SQL Database, App Service  
**Ugumu**: Kati  
**Mafunzo**: Entity Framework, miunganisho ya hifadhidata, maendeleo ya API ya wavuti  

### Kazi ya Serverless - Python Azure Functions  
**Teknolojia**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Ugumu**: Kati  
**Mafunzo**: Usanifu unaotegemea matukio, hesabu ya serverless, maendeleo ya full-stack  

### Microservices - Java Spring Boot  
**Teknolojia**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Ugumu**: Kati  
**Mafunzo**: Mawasiliano ya huduma ndogo, mifumo iliyosambazwa, mifumo ya biashara  

### Mifano ya Azure AI Foundry

#### Programu ya Mazungumzo ya Azure OpenAI  
**Teknolojia**: Azure OpenAI, Cognitive Search, App Service  
**Ugumu**: Kati  
**Mafunzo**: Usanifu wa RAG, utafutaji wa vector, ujumuishaji wa LLM  

#### Usindikaji wa Nyaraka za AI  
**Teknolojia**: Azure AI Document Intelligence, Storage, Functions  
**Ugumu**: Kati  
**Mafunzo**: Uchambuzi wa nyaraka, OCR, uchimbaji wa data  

#### Mfumo wa Kujifunza kwa Mashine  
**Teknolojia**: Azure ML, MLOps, Container Registry  
**Ugumu**: Juu  
**Mafunzo**: Mafunzo ya modeli, mifumo ya usambazaji, ufuatiliaji  

## 🛠 Mifano ya Usanidi

Saraka ya `configurations/` ina vipengele vinavyoweza kutumika tena:

### Usanidi wa Mazingira
- Mipangilio ya mazingira ya maendeleo  
- Usanidi wa mazingira ya majaribio  
- Usanidi tayari kwa uzalishaji  
- Usanidi wa usambazaji wa mikoa mingi  

### Moduli za Bicep
- Vipengele vya miundombinu vinavyoweza kutumika tena  
- Mifumo ya rasilimali ya kawaida  
- Violezo vilivyoboreshwa kwa usalama  
- Usanidi ulioboreshwa kwa gharama  

### Hati za Kusaidia
- Uwekaji wa mazingira kiotomatiki  
- Hati za uhamishaji wa hifadhidata  
- Zana za uthibitishaji wa usambazaji  
- Huduma za ufuatiliaji wa gharama  

## 🔧 Mwongozo wa Kubinafsisha

### Kubadilisha Mifano kwa Matumizi Yako

1. **Kagua Mahitaji ya Awali**
   - Angalia mahitaji ya huduma za Azure  
   - Thibitisha mipaka ya usajili  
   - Elewa athari za gharama  

2. **Badilisha Usanidi**
   - Sasisha ufafanuzi wa huduma kwenye `azure.yaml`  
   - Badilisha violezo vya Bicep  
   - Rekebisha vigezo vya mazingira  

3. **Jaribu Kwa Kina**
   - Sambaza kwenye mazingira ya maendeleo kwanza  
   - Thibitisha utendaji  
   - Jaribu upanuzi na utendaji  

4. **Kagua Usalama**
   - Kagua udhibiti wa ufikiaji  
   - Tekeleza usimamizi wa siri  
   - Washa ufuatiliaji na arifa  

## 📊 Jedwali la Ulinganisho

| Mfano | Huduma | Hifadhidata | Uthibitishaji | Ufuatiliaji | Ugumu |
|-------|--------|-------------|---------------|-------------|-------|
| Node.js Express Todo | 2 | ✅ | Msingi | Msingi | ⭐ |
| React SPA + Functions | 3 | ✅ | Msingi | Kamili | ⭐ |
| Python Flask Container | 2 | ❌ | Msingi | Kamili | ⭐ |
| C# Web API + SQL | 2 | ✅ | Kamili | Kamili | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Kamili | Kamili | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Kamili | Kamili | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Kamili | Kamili | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Msingi | Kamili | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Kamili | Kamili | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Biashara** | **Juu** | **⭐⭐⭐⭐** |

## 🎓 Njia ya Kujifunza

### Mpangilio Unaopendekezwa

1. **Anza na Programu Rahisi ya Wavuti**
   - Jifunze dhana za msingi za AZD  
   - Elewa mtiririko wa kazi wa usambazaji  
   - Fanya mazoezi ya usimamizi wa mazingira  

2. **Jaribu Tovuti Tulivu**
   - Chunguza chaguo tofauti za ukaribishaji  
   - Jifunze kuhusu ujumuishaji wa CDN  
   - Elewa usanidi wa DNS  

3. **Hamia kwenye Programu ya Kontena**
   - Jifunze misingi ya uwekaji kwenye kontena  
   - Elewa dhana za upanuzi  
   - Fanya mazoezi na Docker  

4. **Ongeza Ujumuishaji wa Hifadhidata**
   - Jifunze kuhusu utoaji wa hifadhidata  
   - Elewa nyuzi za muunganisho  
   - Fanya mazoezi ya usimamizi wa siri  

5. **Chunguza Serverless**
   - Elewa usanifu unaotegemea matukio  
   - Jifunze kuhusu vichocheo na viunganishi  
   - Fanya mazoezi na API  

6. **Jenga Microservices**
   - Jifunze mawasiliano ya huduma  
   - Elewa mifumo iliyosambazwa  
   - Fanya mazoezi ya usambazaji tata  

## 🔍 Kupata Mfano Sahihi

### Kwa Stack ya Teknolojia
- **Node.js**: Node.js Express Todo App  
- **Python**: Python Flask Container App, Python Functions + SPA  
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **Containers**: Python Flask Container App, Java Microservices  
- **Databases**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**  
- **Enterprise Production**: **Retail Multi-Agent Solution**  

### Kwa Muundo wa Usanifu
- **Monolithic**: Node.js Express Todo, C# Web API + SQL  
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Microservices**: Java Spring Boot Microservices  
- **Containerized**: Python Flask Container App  
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**  
- **Enterprise Multi-Service**: **Retail Multi-Agent Solution**  

### Kwa Kiwango cha Ugumu
- **Anayeanza**: Node.js Express Todo, React SPA + Functions, Python Flask Container App  
- **Kati**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing  
- **Juu**: ML Pipeline  
- **Tayari kwa Uzalishaji wa Biashara**: **Retail Multi-Agent Solution** (Mfumo kamili wa wakala wengi na usambazaji wa kiolezo cha ARM)  

## 📚 Rasilimali za Ziada

### Viungo vya Nyaraka
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Violezo vya Azure AI Foundry AZD](https://github.com/Azure/ai-foundry-templates)  
- [Nyaraka za Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Kituo cha Usanifu wa Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Mifano ya Jamii
- [Violezo vya Azure Samples AZD](https://github.com/Azure-Samples/azd-templates)  
- [Violezo vya Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [Matunzio ya Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [Programu ya Todo na C# na Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Programu ya Todo na Python na MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Programu ya Todo na Node.js na PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Programu ya Mtandao ya React na API ya C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Kazi za Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions na Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Mazoea Bora
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Mifano ya Kuchangia

Una mfano mzuri wa kushiriki? Tunakaribisha michango!

### Miongozo ya Uwasilishaji
1. Fuata muundo wa saraka uliowekwa
2. Jumuisha README.md iliyo kamili
3. Ongeza maoni kwenye faili za usanidi
4. Fanya majaribio ya kina kabla ya kuwasilisha
5. Jumuisha makadirio ya gharama na mahitaji ya awali

### Muundo wa Kiolezo cha Mfano
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

**Ushauri wa Wataalamu**: Anza na mfano rahisi zaidi unaolingana na teknolojia yako, kisha polepole endelea hadi hali ngumu zaidi. Kila mfano unajenga juu ya dhana kutoka kwa zile za awali!

**Hatua Zifuatazo**: 
- Chagua mfano unaolingana na kiwango chako cha ujuzi
- Fuata maelekezo ya usanidi katika README ya mfano
- Jaribu kubadilisha kulingana na mahitaji yako
- Shiriki mafunzo yako na jamii

---

**Urambazaji**
- **Somo la Awali**: [Mwongozo wa Kujifunza](../resources/study-guide.md)
- **Rudi kwa**: [README Kuu](../README.md)

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya kutafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
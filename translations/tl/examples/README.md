<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:20:55+00:00",
  "source_file": "examples/README.md",
  "language_code": "tl"
}
-->
# Mga Halimbawa - Praktikal na AZD Templates at Configurations

## Panimula

Ang direktoryong ito ay naglalaman ng mga praktikal na halimbawa, templates, at mga totoong senaryo upang matulungan kang matutunan ang Azure Developer CLI sa pamamagitan ng hands-on na pagsasanay. Bawat halimbawa ay nagbibigay ng kumpletong gumaganang code, mga template ng imprastraktura, at detalyadong mga tagubilin para sa iba't ibang arkitektura ng aplikasyon at mga pattern ng deployment.

## Mga Layunin sa Pag-aaral

Sa pamamagitan ng pagtrabaho sa mga halimbawang ito, ikaw ay:
- Magpapraktis ng mga workflow ng Azure Developer CLI gamit ang makatotohanang mga senaryo ng aplikasyon
- Mauunawaan ang iba't ibang arkitektura ng aplikasyon at ang kanilang mga implementasyon sa azd
- Magiging bihasa sa mga pattern ng Infrastructure as Code para sa iba't ibang serbisyo ng Azure
- Mag-aaplay ng pamamahala ng configuration at mga deployment strategy na partikular sa environment
- Magpapatupad ng mga pattern para sa monitoring, seguridad, at scaling sa mga praktikal na konteksto
- Magkakaroon ng karanasan sa pag-troubleshoot at pag-debug ng mga totoong senaryo ng deployment

## Mga Resulta ng Pag-aaral

Kapag natapos mo ang mga halimbawang ito, magagawa mo nang:
- Mag-deploy ng iba't ibang uri ng aplikasyon gamit ang Azure Developer CLI nang may kumpiyansa
- Iangkop ang mga ibinigay na template sa iyong sariling mga pangangailangan sa aplikasyon
- Magdisenyo at magpatupad ng mga custom na pattern ng imprastraktura gamit ang Bicep
- Mag-configure ng mga kumplikadong multi-service na aplikasyon na may tamang dependencies
- Mag-aplay ng mga pinakamahusay na kasanayan sa seguridad, monitoring, at performance sa mga totoong senaryo
- Mag-troubleshoot at mag-optimize ng mga deployment batay sa praktikal na karanasan

## Estruktura ng Direktoryo

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

## Mga Halimbawa para sa Mabilisang Pagsisimula

### Para sa mga Baguhan
1. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Mag-deploy ng Node.js Express web application na may MongoDB
2. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Mag-host ng React static website gamit ang Azure Static Web Apps
3. **[Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Mag-deploy ng containerized Python Flask application

### Para sa mga Intermediate na User
4. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Web application na may C# API at Azure SQL Database
5. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions na may HTTP triggers at Cosmos DB
6. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Multi-service Java application na may Container Apps at API gateway

### Azure AI Foundry Templates

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Matalinong chat application gamit ang Azure OpenAI
2. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** - Pagsusuri ng dokumento gamit ang mga serbisyo ng Azure AI
3. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** - MLOps workflow gamit ang Azure Machine Learning

## 📋 Mga Tagubilin sa Paggamit

### Pagpapatakbo ng Mga Halimbawa sa Lokal

1. **I-clone o Kopyahin ang Halimbawa**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **I-initialize ang AZD Environment**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **I-configure ang Environment**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Mag-deploy**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Pag-aangkop ng Mga Halimbawa

Bawat halimbawa ay naglalaman ng:
- **README.md** - Detalyadong mga tagubilin sa setup at pagpapasadya
- **azure.yaml** - AZD configuration na may mga komento
- **infra/** - Mga template ng Bicep na may mga paliwanag sa parameter
- **src/** - Sample na code ng aplikasyon
- **scripts/** - Mga helper script para sa karaniwang mga gawain

## 🎯 Mga Layunin sa Pag-aaral

### Mga Kategorya ng Halimbawa

#### **Mga Pangunahing Deployment**
- Mga single-service na aplikasyon
- Simpleng mga pattern ng imprastraktura
- Pangunahing pamamahala ng configuration
- Mga cost-effective na setup para sa development

#### **Mga Advanced na Senaryo**
- Mga multi-service na arkitektura
- Kumplikadong mga configuration ng networking
- Mga pattern ng integrasyon ng database
- Mga implementasyon ng seguridad at pagsunod

#### **Mga Pattern na Handa sa Produksyon**
- Mga configuration para sa mataas na availability
- Monitoring at observability
- Integrasyon ng CI/CD
- Mga setup para sa disaster recovery

## 📖 Mga Deskripsyon ng Halimbawa

### Simple Web App - Node.js Express
**Mga Teknolohiya**: Node.js, Express, MongoDB, Container Apps  
**Kumpleksidad**: Baguhan  
**Mga Konsepto**: Pangunahing deployment, REST API, integrasyon ng NoSQL database

### Static Website - React SPA
**Mga Teknolohiya**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kumpleksidad**: Baguhan  
**Mga Konsepto**: Static hosting, serverless backend, modernong web development

### Container App - Python Flask
**Mga Teknolohiya**: Python Flask, Docker, Container Apps, Container Registry  
**Kumpleksidad**: Baguhan  
**Mga Konsepto**: Containerization, microservices architecture, API development

### Database App - C# with Azure SQL
**Mga Teknolohiya**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kumpleksidad**: Intermediate  
**Mga Konsepto**: Entity Framework, koneksyon sa database, web API development

### Serverless Function - Python Azure Functions
**Mga Teknolohiya**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kumpleksidad**: Intermediate  
**Mga Konsepto**: Event-driven architecture, serverless computing, full-stack development

### Microservices - Java Spring Boot
**Mga Teknolohiya**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kumpleksidad**: Intermediate  
**Mga Konsepto**: Komunikasyon ng microservices, distributed systems, enterprise patterns

### Azure AI Foundry Examples

#### Azure OpenAI Chat App
**Mga Teknolohiya**: Azure OpenAI, Cognitive Search, App Service  
**Kumpleksidad**: Intermediate  
**Mga Konsepto**: RAG architecture, vector search, LLM integration

#### AI Document Processing
**Mga Teknolohiya**: Azure AI Document Intelligence, Storage, Functions  
**Kumpleksidad**: Intermediate  
**Mga Konsepto**: Pagsusuri ng dokumento, OCR, pagkuha ng data

#### Machine Learning Pipeline
**Mga Teknolohiya**: Azure ML, MLOps, Container Registry  
**Kumpleksidad**: Advanced  
**Mga Konsepto**: Pagsasanay ng modelo, deployment pipelines, monitoring

## 🛠 Mga Halimbawa ng Configuration

Ang direktoryong `configurations/` ay naglalaman ng mga reusable na bahagi:

### Mga Configuration ng Environment
- Mga setting para sa development environment
- Mga configuration para sa staging environment
- Mga configuration na handa sa produksyon
- Mga setup para sa multi-region deployment

### Mga Module ng Bicep
- Mga reusable na bahagi ng imprastraktura
- Karaniwang mga pattern ng resource
- Mga template na pinatibay para sa seguridad
- Mga configuration na optimized para sa gastos

### Mga Helper Script
- Automation ng setup ng environment
- Mga script para sa migration ng database
- Mga tool para sa validation ng deployment
- Mga utility para sa monitoring ng gastos

## 🔧 Gabay sa Pagpapasadya

### Pag-aangkop ng Mga Halimbawa para sa Iyong Gamit

1. **Suriin ang Mga Prerequisite**
   - Suriin ang mga kinakailangan sa serbisyo ng Azure
   - I-verify ang mga limitasyon ng subscription
   - Unawain ang mga implikasyon sa gastos

2. **I-modify ang Configuration**
   - I-update ang mga service definition sa `azure.yaml`
   - I-customize ang mga template ng Bicep
   - I-adjust ang mga environment variable

3. **Subukan nang Mabuti**
   - Mag-deploy muna sa development environment
   - I-validate ang functionality
   - Subukan ang scaling at performance

4. **Review ng Seguridad**
   - Suriin ang mga access control
   - Magpatupad ng pamamahala ng mga secrets
   - I-enable ang monitoring at alerting

## 📊 Matrix ng Paghahambing

| Halimbawa | Mga Serbisyo | Database | Auth | Monitoring | Kumpleksidad |
|-----------|--------------|----------|------|------------|--------------|
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |

## 🎓 Landas ng Pag-aaral

### Inirerekomendang Pagkakasunod-sunod

1. **Simulan sa Simple Web App**
   - Matutunan ang mga pangunahing konsepto ng AZD
   - Unawain ang workflow ng deployment
   - Magpraktis ng pamamahala ng environment

2. **Subukan ang Static Website**
   - Tuklasin ang iba't ibang opsyon sa hosting
   - Matutunan ang integrasyon ng CDN
   - Unawain ang configuration ng DNS

3. **Lumipat sa Container App**
   - Matutunan ang mga pangunahing kaalaman sa containerization
   - Unawain ang mga konsepto ng scaling
   - Magpraktis gamit ang Docker

4. **Magdagdag ng Integrasyon ng Database**
   - Matutunan ang provisioning ng database
   - Unawain ang mga connection string
   - Magpraktis ng pamamahala ng mga secrets

5. **Tuklasin ang Serverless**
   - Unawain ang event-driven architecture
   - Matutunan ang tungkol sa triggers at bindings
   - Magpraktis gamit ang APIs

6. **Bumuo ng Microservices**
   - Matutunan ang komunikasyon ng serbisyo
   - Unawain ang distributed systems
   - Magpraktis ng mga kumplikadong deployment

## 🔍 Paghahanap ng Tamang Halimbawa

### Batay sa Teknolohiya
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: Python Flask Container App, Java Microservices
- **Databases**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Batay sa Pattern ng Arkitektura
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Containerized**: Python Flask Container App
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Batay sa Antas ng Kumpleksidad
- **Baguhan**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Intermediate**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Advanced**: ML Pipeline

## 📚 Karagdagang Mga Mapagkukunan

### Mga Link sa Dokumentasyon
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Mga Halimbawa ng Komunidad
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Mga Pinakamahusay na Kasanayan
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Pag-aambag ng Mga Halimbawa

May kapaki-pakinabang na halimbawa na nais ibahagi? Malugod naming tinatanggap ang mga kontribusyon!

### Mga Alituntunin sa Pagsusumite
1. Sundin ang itinatag na estruktura ng direktoryo
2. Isama ang komprehensibong README.md
3. Magdagdag ng mga komento sa mga configuration file
4. Subukan nang mabuti bago magsumite
5. Isama ang mga pagtatantya sa gastos at mga prerequisite

### Estruktura ng Template ng Halimbawa
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

**Pro Tip**: Simulan sa pinakasimpleng halimbawa na tumutugma sa iyong teknolohiyang stack, pagkatapos ay unti-unting magtrabaho patungo sa mas kumplikadong mga senaryo. Ang bawat halimbawa ay bumubuo sa mga konsepto mula sa mga nauna.

**Susunod na Hakbang**: 
- Pumili ng halimbawa na tumutugma sa iyong antas ng kasanayan
- Sundin ang mga tagubilin sa setup sa README ng halimbawa
- Mag-eksperimento sa mga pagpapasadya
- Ibahagi ang iyong mga natutunan sa komunidad

---

**Navigation**
- **Nakaraang Aralin**: [Study Guide](../resources/study-guide.md)
- **Bumalik sa**: [Main README](../README.md)

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.
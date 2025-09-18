<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-18T08:35:13+00:00",
  "source_file": "examples/README.md",
  "language_code": "tl"
}
-->
# Mga Halimbawa - Praktikal na AZD Templates at Konfigurasyon

**Pag-aaral sa Pamamagitan ng Halimbawa - Inayos ayon sa Kabanata**
- **📚 Home ng Kurso**: [AZD Para sa Mga Baguhan](../README.md)
- **📖 Pagmamapa ng Kabanata**: Mga halimbawa na inayos ayon sa antas ng kahirapan sa pag-aaral
- **🚀 Simulan nang Simple**: [Mga Halimbawa sa Kabanata 1](../../../examples)
- **🤖 Mga Halimbawa ng AI**: [Mga Halimbawa sa Kabanata 2 & 5 AI Solutions](../../../examples)

## Panimula

Ang direktoryong ito ay naglalaman ng mga praktikal na halimbawa, templates, at mga senaryo sa totoong mundo upang matulungan kang matutunan ang Azure Developer CLI sa pamamagitan ng aktwal na pagsasanay. Ang bawat halimbawa ay nagbibigay ng kumpletong gumaganang code, mga template ng imprastraktura, at detalyadong mga tagubilin para sa iba't ibang arkitektura ng aplikasyon at mga pattern ng pag-deploy.

## Mga Layunin sa Pag-aaral

Sa pamamagitan ng pagtrabaho sa mga halimbawang ito, ikaw ay:
- Magpapraktis ng mga workflow ng Azure Developer CLI gamit ang makatotohanang mga senaryo ng aplikasyon
- Mauunawaan ang iba't ibang arkitektura ng aplikasyon at ang kanilang mga implementasyon sa azd
- Magiging bihasa sa mga pattern ng Infrastructure as Code para sa iba't ibang serbisyo ng Azure
- Mag-aaplay ng pamamahala ng konfigurasyon at mga estratehiya sa pag-deploy na partikular sa kapaligiran
- Magpapatupad ng mga pattern ng monitoring, seguridad, at scaling sa praktikal na konteksto
- Magtatayo ng karanasan sa pag-troubleshoot at pag-debug ng mga totoong senaryo ng pag-deploy

## Mga Resulta ng Pag-aaral

Kapag natapos mo ang mga halimbawang ito, magagawa mo:
- Mag-deploy ng iba't ibang uri ng aplikasyon gamit ang Azure Developer CLI nang may kumpiyansa
- Iangkop ang mga ibinigay na template sa iyong sariling mga pangangailangan sa aplikasyon
- Magdisenyo at magpatupad ng mga custom na pattern ng imprastraktura gamit ang Bicep
- Mag-configure ng mga kumplikadong multi-service na aplikasyon na may tamang dependencies
- Mag-aplay ng mga pinakamahusay na kasanayan sa seguridad, monitoring, at performance sa totoong mga senaryo
- Mag-troubleshoot at mag-optimize ng mga deployment batay sa praktikal na karanasan

## Istruktura ng Direktoryo

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

## Mga Halimbawa ng Mabilisang Pagsisimula

### Para sa Mga Baguhan
1. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Mag-deploy ng Node.js Express web application na may MongoDB
2. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Mag-host ng React static website gamit ang Azure Static Web Apps
3. **[Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Mag-deploy ng containerized Python Flask application

### Para sa Mga Intermediate na Gumagamit
4. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Web application na may C# API at Azure SQL Database
5. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions na may HTTP triggers at Cosmos DB
6. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Multi-service Java application na may Container Apps at API gateway

### Azure AI Foundry Templates

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Matalinong chat application gamit ang Azure OpenAI
2. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** - Pagsusuri ng dokumento gamit ang mga serbisyo ng Azure AI
3. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** - Workflow ng MLOps gamit ang Azure Machine Learning

### Mga Senaryo sa Totoong Mundo

#### **Retail Multi-Agent Solution** 🆕
**[Kumpletong Gabay sa Implementasyon](./retail-scenario.md)**

Isang komprehensibo, production-ready multi-agent customer support solution na nagpapakita ng enterprise-grade AI application deployment gamit ang AZD. Ang senaryong ito ay nagbibigay ng:

- **Kumpletong Arkitektura**: Multi-agent system na may espesyal na customer service at inventory management agents
- **Production Infrastructure**: Multi-region Azure OpenAI deployments, AI Search, Container Apps, at komprehensibong monitoring
- **Handa nang I-deploy na ARM Template**: One-click deployment na may iba't ibang configuration modes (Minimal/Standard/Premium)
- **Mga Advanced na Tampok**: Red teaming security validation, agent evaluation framework, cost optimization, at troubleshooting guides
- **Totoong Konteksto ng Negosyo**: Retailer customer support use case na may file uploads, search integration, at dynamic scaling

**Mga Teknolohiya**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Kahirapan**: ⭐⭐⭐⭐ (Advanced - Enterprise Production Ready)

**Perpekto para sa**: Mga AI developer, solution architects, at mga team na gumagawa ng production multi-agent systems

**Mabilisang Pagsisimula**: I-deploy ang kumpletong solusyon sa loob ng 30 minuto gamit ang kasama na ARM template na `./deploy.sh -g myResourceGroup`

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

4. **I-deploy**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Pag-aangkop ng Mga Halimbawa

Ang bawat halimbawa ay naglalaman ng:
- **README.md** - Detalyadong mga tagubilin sa setup at pagpapasadya
- **azure.yaml** - AZD configuration na may mga komento
- **infra/** - Mga template ng Bicep na may mga paliwanag sa parameter
- **src/** - Sample na code ng aplikasyon
- **scripts/** - Mga helper script para sa mga karaniwang gawain

## 🎯 Mga Layunin sa Pag-aaral

### Mga Kategorya ng Halimbawa

#### **Mga Pangunahing Deployment**
- Mga single-service na aplikasyon
- Simpleng mga pattern ng imprastraktura
- Pangunahing pamamahala ng konfigurasyon
- Mga cost-effective na development setup

#### **Mga Advanced na Senaryo**
- Mga multi-service na arkitektura
- Kumplikadong mga networking configuration
- Mga pattern ng integrasyon ng database
- Mga implementasyon ng seguridad at pagsunod

#### **Mga Production-Ready na Pattern**
- Mga high availability configuration
- Monitoring at observability
- CI/CD integration
- Mga setup ng disaster recovery

## 📖 Mga Deskripsyon ng Halimbawa

### Simple Web App - Node.js Express
**Mga Teknolohiya**: Node.js, Express, MongoDB, Container Apps  
**Kahirapan**: Baguhan  
**Mga Konsepto**: Pangunahing deployment, REST API, integrasyon ng NoSQL database

### Static Website - React SPA
**Mga Teknolohiya**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kahirapan**: Baguhan  
**Mga Konsepto**: Static hosting, serverless backend, modernong web development

### Container App - Python Flask
**Mga Teknolohiya**: Python Flask, Docker, Container Apps, Container Registry  
**Kahirapan**: Baguhan  
**Mga Konsepto**: Containerization, microservices architecture, API development

### Database App - C# with Azure SQL
**Mga Teknolohiya**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kahirapan**: Intermediate  
**Mga Konsepto**: Entity Framework, database connections, web API development

### Serverless Function - Python Azure Functions
**Mga Teknolohiya**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kahirapan**: Intermediate  
**Mga Konsepto**: Event-driven architecture, serverless computing, full-stack development

### Microservices - Java Spring Boot
**Mga Teknolohiya**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kahirapan**: Intermediate  
**Mga Konsepto**: Microservices communication, distributed systems, enterprise patterns

### Azure AI Foundry Examples

#### Azure OpenAI Chat App
**Mga Teknolohiya**: Azure OpenAI, Cognitive Search, App Service  
**Kahirapan**: Intermediate  
**Mga Konsepto**: RAG architecture, vector search, LLM integration

#### AI Document Processing
**Mga Teknolohiya**: Azure AI Document Intelligence, Storage, Functions  
**Kahirapan**: Intermediate  
**Mga Konsepto**: Pagsusuri ng dokumento, OCR, data extraction

#### Machine Learning Pipeline
**Mga Teknolohiya**: Azure ML, MLOps, Container Registry  
**Kahirapan**: Advanced  
**Mga Konsepto**: Model training, deployment pipelines, monitoring

## 🛠 Mga Halimbawa ng Konfigurasyon

Ang direktoryong `configurations/` ay naglalaman ng mga reusable na bahagi:

### Mga Konfigurasyon ng Kapaligiran
- Mga setting ng development environment
- Mga konfigurasyon ng staging environment
- Mga production-ready na konfigurasyon
- Mga multi-region deployment setup

### Mga Bicep Modules
- Mga reusable na bahagi ng imprastraktura
- Mga karaniwang pattern ng resource
- Mga template na pinatibay sa seguridad
- Mga konfigurasyon na optimized sa gastos

### Mga Helper Script
- Automation ng setup ng environment
- Mga script para sa database migration
- Mga tool sa pag-validate ng deployment
- Mga utility para sa monitoring ng gastos

## 🔧 Gabay sa Pagpapasadya

### Pag-aangkop ng Mga Halimbawa sa Iyong Gamit

1. **Suriin ang Mga Kinakailangan**
   - Suriin ang mga kinakailangan sa serbisyo ng Azure
   - I-verify ang mga limitasyon ng subscription
   - Unawain ang mga implikasyon sa gastos

2. **Baguhin ang Konfigurasyon**
   - I-update ang mga kahulugan ng serbisyo sa `azure.yaml`
   - I-customize ang mga template ng Bicep
   - Ayusin ang mga environment variable

3. **Subukan nang Mabuti**
   - I-deploy muna sa development environment
   - I-validate ang functionality
   - Subukan ang scaling at performance

4. **Suriin ang Seguridad**
   - Suriin ang mga access control
   - Magpatupad ng pamamahala ng mga lihim
   - Paganahin ang monitoring at alerting

## 📊 Matrix ng Paghahambing

| Halimbawa | Mga Serbisyo | Database | Auth | Monitoring | Kahirapan |
|-----------|--------------|----------|------|------------|-----------|
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Landas ng Pag-aaral

### Inirerekomendang Pag-unlad

1. **Simulan sa Simple Web App**
   - Matutunan ang mga pangunahing konsepto ng AZD
   - Unawain ang workflow ng pag-deploy
   - Magpraktis ng pamamahala ng environment

2. **Subukan ang Static Website**
   - Tuklasin ang iba't ibang opsyon sa hosting
   - Matutunan ang integrasyon ng CDN
   - Unawain ang konfigurasyon ng DNS

3. **Lumipat sa Container App**
   - Matutunan ang mga pangunahing kaalaman sa containerization
   - Unawain ang mga konsepto ng scaling
   - Magpraktis gamit ang Docker

4. **Magdagdag ng Integrasyon ng Database**
   - Matutunan ang pag-provision ng database
   - Unawain ang mga connection string
   - Magpraktis ng pamamahala ng mga lihim

5. **Tuklasin ang Serverless**
   - Unawain ang event-driven architecture
   - Matutunan ang tungkol sa triggers at bindings
   - Magpraktis gamit ang APIs

6. **Bumuo ng Microservices**
   - Matutunan ang komunikasyon ng serbisyo
   - Unawain ang mga distributed systems
   - Magpraktis ng mga kumplikadong deployment

## 🔍 Paghahanap ng Tamang Halimbawa

### Ayon sa Teknolohiya
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

### Ayon sa Pattern ng Arkitektura
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Containerized**: Python Flask Container App
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: **Retail Multi-Agent Solution**

### Ayon sa Antas ng Kahirapan
- **Baguhan**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Intermediate**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: **Retail Multi-Agent Solution** (Kumpletong multi-agent system na may ARM template deployment)

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
- [Todo App gamit ang C# at Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App gamit ang Python at MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App gamit ang Node.js at PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App gamit ang C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions gamit ang Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Mga Pinakamahusay na Praktika
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Pag-aambag ng Mga Halimbawa

May kapaki-pakinabang na halimbawa na nais ibahagi? Malugod naming tinatanggap ang mga kontribusyon!

### Mga Alituntunin sa Pagsusumite
1. Sundin ang itinatag na istruktura ng direktoryo
2. Isama ang komprehensibong README.md
3. Magdagdag ng mga komento sa mga configuration file
4. Subukan nang mabuti bago magsumite
5. Isama ang mga pagtatantya ng gastos at mga kinakailangan

### Istruktura ng Template ng Halimbawa
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

**Tip**: Magsimula sa pinakasimpleng halimbawa na tumutugma sa iyong teknolohiya, pagkatapos ay unti-unting magtrabaho patungo sa mas kumplikadong mga senaryo. Ang bawat halimbawa ay nagtatayo sa mga konsepto mula sa mga nauna!

**Susunod na Hakbang**: 
- Pumili ng halimbawa na tumutugma sa iyong antas ng kasanayan
- Sundin ang mga tagubilin sa setup sa README ng halimbawa
- Mag-eksperimento sa mga pagpapasadya
- Ibahagi ang iyong mga natutunan sa komunidad

---

**Pag-navigate**
- **Nakaraang Aralin**: [Study Guide](../resources/study-guide.md)
- **Bumalik sa**: [Main README](../README.md)

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakatandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
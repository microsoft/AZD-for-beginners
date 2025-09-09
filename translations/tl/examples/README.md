<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9b7074c8a39e77d2f10fb08b3c6ce34f",
  "translation_date": "2025-09-09T22:14:41+00:00",
  "source_file": "examples/README.md",
  "language_code": "tl"
}
-->
# Mga Halimbawa - Praktikal na AZD Templates at Konfigurasyon

## Panimula

Ang direktoryong ito ay naglalaman ng mga praktikal na halimbawa, templates, at mga totoong senaryo upang matulungan kang matutunan ang Azure Developer CLI sa pamamagitan ng aktwal na pagsasanay. Bawat halimbawa ay nagbibigay ng kumpletong gumaganang code, mga template ng imprastraktura, at detalyadong mga tagubilin para sa iba't ibang arkitektura ng aplikasyon at mga pattern ng pag-deploy.

## Mga Layunin sa Pag-aaral

Sa pamamagitan ng pagtrabaho sa mga halimbawang ito, ikaw ay:
- Magpapraktis ng mga workflow ng Azure Developer CLI gamit ang makatotohanang mga senaryo ng aplikasyon
- Mauunawaan ang iba't ibang arkitektura ng aplikasyon at ang kanilang mga implementasyon sa azd
- Magiging bihasa sa mga pattern ng Infrastructure as Code para sa iba't ibang serbisyo ng Azure
- Mag-aaplay ng pamamahala ng konfigurasyon at mga estratehiya sa pag-deploy na partikular sa kapaligiran
- Magpapatupad ng mga pattern sa monitoring, seguridad, at scaling sa praktikal na konteksto
- Magkakaroon ng karanasan sa pag-troubleshoot at pag-debug ng mga totoong senaryo ng pag-deploy

## Mga Resulta sa Pag-aaral

Kapag natapos mo ang mga halimbawang ito, magagawa mo:
- Mag-deploy ng iba't ibang uri ng aplikasyon gamit ang Azure Developer CLI nang may kumpiyansa
- Iangkop ang mga ibinigay na template sa iyong sariling mga pangangailangan sa aplikasyon
- Magdisenyo at magpatupad ng mga custom na pattern ng imprastraktura gamit ang Bicep
- Mag-configure ng mga kumplikadong multi-service na aplikasyon na may tamang dependencies
- Mag-aplay ng mga pinakamahusay na kasanayan sa seguridad, monitoring, at performance sa totoong mga senaryo
- Mag-troubleshoot at mag-optimize ng mga deployment batay sa praktikal na karanasan

## Estruktura ng Direktoryo

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Mga Halimbawa para sa Mabilisang Pagsisimula

### Para sa mga Baguhan
1. **[Simple Web App](../../../examples/simple-web-app)** - Mag-deploy ng basic na Node.js web application
2. **[Static Website](../../../examples/static-website)** - Mag-host ng static na website sa Azure Storage
3. **[Container App](../../../examples/container-app)** - Mag-deploy ng containerized na aplikasyon

### Para sa mga Intermediate na Gumagamit
4. **[Database App](../../../examples/database-app)** - Web application na may PostgreSQL database
5. **[Serverless Function](../../../examples/serverless-function)** - Azure Functions na may HTTP triggers
6. **[Microservices](../../../examples/microservices)** - Multi-service na aplikasyon na may API gateway

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
- Mga aplikasyon na may isang serbisyo
- Simpleng mga pattern ng imprastraktura
- Pangunahing pamamahala ng konfigurasyon
- Mga cost-effective na setup para sa development

#### **Mga Advanced na Senaryo**
- Multi-service na arkitektura
- Kumplikadong mga konfigurasyon ng networking
- Mga pattern ng integrasyon ng database
- Mga implementasyon ng seguridad at pagsunod

#### **Mga Pattern na Handa sa Produksyon**
- Mga konfigurasyon para sa mataas na availability
- Monitoring at observability
- Integrasyon ng CI/CD
- Mga setup para sa disaster recovery

## 📖 Mga Deskripsyon ng Halimbawa

### Simple Web App
**Mga Teknolohiya**: Node.js, App Service, Application Insights  
**Kumplikado**: Baguhan  
**Mga Konsepto**: Pangunahing deployment, environment variables, health checks

### Static Website
**Mga Teknolohiya**: HTML/CSS/JS, Storage Account, CDN  
**Kumplikado**: Baguhan  
**Mga Konsepto**: Static hosting, CDN integration, custom domains

### Container App
**Mga Teknolohiya**: Docker, Container Apps, Container Registry  
**Kumplikado**: Intermediate  
**Mga Konsepto**: Containerization, scaling, ingress configuration

### Database App
**Mga Teknolohiya**: Python Flask, PostgreSQL, App Service  
**Kumplikado**: Intermediate  
**Mga Konsepto**: Mga koneksyon sa database, pamamahala ng mga secrets, migrations

### Serverless Function
**Mga Teknolohiya**: Azure Functions, Cosmos DB, API Management  
**Kumplikado**: Intermediate  
**Mga Konsepto**: Event-driven architecture, bindings, API management

### Microservices
**Mga Teknolohiya**: Maraming serbisyo, Service Bus, API Gateway  
**Kumplikado**: Advanced  
**Mga Konsepto**: Komunikasyon ng serbisyo, message queuing, load balancing

## 🛠 Mga Halimbawa ng Konfigurasyon

Ang direktoryong `configurations/` ay naglalaman ng mga reusable na components:

### Mga Konfigurasyon ng Environment
- Mga setting para sa development environment
- Mga konfigurasyon para sa staging environment
- Mga konfigurasyong handa sa produksyon
- Mga setup para sa multi-region deployment

### Mga Module ng Bicep
- Mga reusable na component ng imprastraktura
- Karaniwang mga pattern ng resource
- Mga template na pinatibay ang seguridad
- Mga konfigurasyong cost-optimized

### Mga Helper Script
- Automation ng environment setup
- Mga script para sa database migration
- Mga tool para sa pag-validate ng deployment
- Mga utility para sa monitoring ng gastos

## 🔧 Gabay sa Pagpapasadya

### Pag-aangkop ng Mga Halimbawa para sa Iyong Gamit

1. **Suriin ang Mga Kinakailangan**
   - Tingnan ang mga kinakailangan sa serbisyo ng Azure
   - I-verify ang mga limitasyon ng subscription
   - Unawain ang mga implikasyon sa gastos

2. **Baguhin ang Konfigurasyon**
   - I-update ang `azure.yaml` service definitions
   - I-customize ang mga template ng Bicep
   - Ayusin ang mga environment variables

3. **Subukan nang Mabuti**
   - Mag-deploy muna sa development environment
   - I-validate ang functionality
   - Subukan ang scaling at performance

4. **Suriin ang Seguridad**
   - Suriin ang mga access controls
   - Magpatupad ng pamamahala ng mga secrets
   - I-enable ang monitoring at alerting

## 📊 Matrix ng Paghahambing

| Halimbawa | Mga Serbisyo | Database | Auth | Monitoring | Kumplikado |
|-----------|--------------|----------|------|------------|------------|
| Simple Web App | 1 | ❌ | Basic | Basic | ⭐ |
| Static Website | 1 | ❌ | ❌ | Basic | ⭐ |
| Container App | 1 | ❌ | Basic | Full | ⭐⭐ |
| Database App | 2 | ✅ | Full | Full | ⭐⭐⭐ |
| Serverless Function | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| Microservices | 5+ | ✅ | Full | Full | ⭐⭐⭐⭐ |

## 🎓 Landas sa Pag-aaral

### Inirerekomendang Pagkakasunod-sunod

1. **Simulan sa Simple Web App**
   - Matutunan ang mga pangunahing konsepto ng AZD
   - Unawain ang workflow ng deployment
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
   - Matutunan ang provisioning ng database
   - Unawain ang mga connection string
   - Magpraktis ng pamamahala ng mga secrets

5. **Galugarin ang Serverless**
   - Unawain ang event-driven architecture
   - Matutunan ang tungkol sa triggers at bindings
   - Magpraktis gamit ang APIs

6. **Bumuo ng Microservices**
   - Matutunan ang komunikasyon ng serbisyo
   - Unawain ang distributed systems
   - Magpraktis ng mga kumplikadong deployment

## 🔍 Paghahanap ng Tamang Halimbawa

### Batay sa Teknolohiya
- **Node.js**: Simple Web App, Microservices
- **Python**: Database App, Serverless Function
- **Static Sites**: Static Website
- **Containers**: Container App, Microservices
- **Databases**: Database App, Serverless Function

### Batay sa Pattern ng Arkitektura
- **Monolithic**: Simple Web App, Database App
- **Static**: Static Website
- **Microservices**: Microservices example
- **Serverless**: Serverless Function
- **Hybrid**: Container App

### Batay sa Antas ng Kumplikado
- **Baguhan**: Simple Web App, Static Website
- **Intermediate**: Container App, Database App, Serverless Function  
- **Advanced**: Microservices

## 📚 Karagdagang Mga Mapagkukunan

### Mga Link sa Dokumentasyon
- [AZD Template Specification](https://aka.ms/azd/templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Mga Halimbawa ng Komunidad
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)

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
5. Isama ang mga pagtatantya sa gastos at mga kinakailangan

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

**Pro Tip**: Simulan sa pinakasimpleng halimbawa na tumutugma sa iyong teknolohiya, pagkatapos ay unti-unting mag-level up sa mas kumplikadong mga senaryo. Ang bawat halimbawa ay bumubuo sa mga konsepto mula sa naunang mga halimbawa!

**Mga Susunod na Hakbang**: 
- Pumili ng halimbawa na tumutugma sa iyong antas ng kasanayan
- Sundin ang mga tagubilin sa setup sa README ng halimbawa
- Mag-eksperimento sa pagpapasadya
- Ibahagi ang iyong mga natutunan sa komunidad

---

**Navigation**
- **Nakaraang Aralin**: [Study Guide](../resources/study-guide.md)
- **Bumalik sa**: [Main README](../README.md)

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
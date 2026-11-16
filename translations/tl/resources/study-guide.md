# Gabay sa Pag-aaral - Komprehensibong Mga Layunin sa Pagkatuto

**Pag-navigate ng Landas sa Pagkatuto**
- **📚 Bahay ng Kurso**: [AZD Para sa mga Nagsisimula](../README.md)
- **📖 Simulan ang Pag-aaral**: [Kabanata 1: Pundasyon & Mabilis na Pagsisimula](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Pagsubaybay ng Progreso**: [Pagkumpleto ng Kurso](../README.md#-course-completion--certification)

## Panimula

Ang komprehensibong gabay sa pag-aaral na ito ay nagbibigay ng istrukturadong mga layunin sa pagkatuto, mga pangunahing konsepto, mga pagsasanay, at mga materyales sa pagsusuri upang matulungan kang maging dalubhasa sa Azure Developer CLI (azd). Gamitin ang gabay na ito upang subaybayan ang iyong progreso at tiyakin na natalakay mo ang lahat ng mahahalagang paksa.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng gabay na ito sa pag-aaral, ikaw ay:
- Masterin ang lahat ng pangunahing at advanced na konsepto ng Azure Developer CLI
- Paunlarin ang praktikal na kasanayan sa pag-deploy at pamamahala ng mga Azure application
- Bumuo ng kumpiyansa sa pag-troubleshoot at pag-optimize ng mga deployment
- Maunawaan ang mga kasanayan sa production-ready deployment at mga konsiderasyon sa seguridad

## Mga Kinalabasan ng Pagkatuto

Pagkatapos makumpleto ang lahat ng seksyon ng gabay na ito sa pag-aaral, magagawa mong:
- Magdisenyo, mag-deploy, at mag-manage ng buong arkitektura ng aplikasyon gamit ang azd
- Magpatupad ng komprehensibong mga estratehiya para sa monitoring, seguridad, at pag-optimize ng gastusin
- Mag-troubleshoot ng komplikadong mga isyu sa deployment nang mag-isa
- Gumawa ng custom na mga template at mag-ambag sa komunidad ng azd

## Istruktura sa Pagkatuto na may 8 Kabanata

### Kabanata 1: Pundasyon & Mabilis na Pagsisimula (Linggo 1)
**Tagal**: 30-45 minuto | **Kahirapan**: ⭐

#### Mga Layunin sa Pagkatuto
- Maunawaan ang mga pangunahing konsepto at terminolohiya ng Azure Developer CLI
- Matagumpay na mai-install at mai-configure ang AZD sa iyong development platform
- Mai-deploy ang iyong unang aplikasyon gamit ang umiiral na template
- Mabisang mag-navigate sa AZD command-line interface

#### Mga Pangunahing Konsepto na Dapat Pag-aralan
- Estruktura ng AZD proyekto at mga bahagi (azure.yaml, infra/, src/)
- Mga workflow ng deployment batay sa template
- Mga batayan ng configuration ng kapaligiran
- Pamamahala ng resource group at subscription

#### Mga Praktikal na Pagsasanay
1. **Pagpapatunay ng Pag-install**: I-install ang AZD at patunayan gamit ang `azd version`
2. **Unang Deployment**: I-deploy nang matagumpay ang todo-nodejs-mongo na template
3. **Pagsasaayos ng Kapaligiran**: I-configure ang iyong unang mga environment variable
4. **Pagsisiyasat sa Resource**: Mag-navigate sa mga na-deploy na resource sa Azure Portal

#### Mga Tanong sa Pagsusuri
- Ano ang mga pangunahing bahagi ng isang AZD proyekto?
- Paano ka mag-i-initialize ng bagong proyekto mula sa isang template?
- Ano ang pagkakaiba ng `azd up` at `azd deploy`?
- Paano mo pinamamahalaan ang maraming mga kapaligiran gamit ang AZD?

---

### Kabanata 2: AI-First na Pag-unlad (Linggo 2)
**Tagal**: 1-2 oras | **Kahirapan**: ⭐⭐

#### Mga Layunin sa Pagkatuto
- Isama ang mga serbisyo ng Microsoft Foundry sa mga workflow ng AZD
- Mag-deploy at mag-configure ng mga AI-powered na aplikasyon
- Maunawaan ang mga pattern ng implementasyon ng RAG (Retrieval-Augmented Generation)
- Pamahalaan ang deployment at scaling ng AI modelo

#### Mga Pangunahing Konsepto na Dapat Pag-aralan
- Integrasyon ng Microsoft Foundry Models service at pamamahala ng API
- Configuration ng AI Search at vector indexing
- Mga estratehiya sa deployment ng modelo at pagpaplano ng kapasidad
- Monitoring ng AI application at pag-optimize ng performance

#### Mga Praktikal na Pagsasanay
1. **AI Chat Deployment**: I-deploy ang azure-search-openai-demo na template
2. **Implementasyon ng RAG**: I-configure ang document indexing at retrieval
3. **Configuration ng Modelo**: I-set up ang maraming AI na modelo na may iba't ibang layunin
4. **Monitoring ng AI**: Magpatupad ng Application Insights para sa AI workloads

#### Mga Tanong sa Pagsusuri
- Paano mo kino-configure ang Microsoft Foundry Models services sa isang AZD template?
- Ano ang mga pangunahing bahagi ng isang RAG na arkitektura?
- Paano mo pinamamahalaan ang kapasidad at scaling ng AI modelo?
- Ano ang mga mahahalagang monitoring metrics para sa mga AI na aplikasyon?

---

### Kabanata 3: Configuration & Authentication (Linggo 3)
**Tagal**: 45-60 minuto | **Kahirapan**: ⭐⭐

#### Mga Layunin sa Pagkatuto
- Masterin ang mga estratehiya sa configuration at pamamahala ng kapaligiran
- Magpatupad ng mga secure na authentication pattern at managed identity
- Ayusin ang mga resource gamit ang tamang naming conventions
- I-configure ang multi-environment deployments (dev, staging, prod)

#### Mga Pangunahing Konsepto na Dapat Pag-aralan
- Hierarchy ng kapaligiran at precedence ng configuration
- Managed identity at service principal authentication
- Integrasyon ng Key Vault para sa pamamahala ng mga sikreto
- Pamamahala ng parameter na espesipiko sa kapaligiran

#### Mga Praktikal na Pagsasanay
1. **Pagsasaayos ng Maramihang Kapaligiran**: I-configure ang dev, staging, at prod na mga kapaligiran
2. **Configuration ng Seguridad**: Magpatupad ng managed identity authentication
3. **Pamamahala ng Sekreto**: Isama ang Azure Key Vault para sa sensitibong datos
4. **Pamamahala ng Parameter**: Gumawa ng configuration na espesipiko sa kapaligiran

#### Mga Tanong sa Pagsusuri
- Paano mo kino-configure ang iba't ibang mga kapaligiran gamit ang AZD?
- Ano ang mga benepisyo ng paggamit ng managed identity kumpara sa service principals?
- Paano mo ligtas na pinamamahalaan ang mga sikreto ng aplikasyon?
- Ano ang hierarchy ng configuration sa AZD?

---

### Kabanata 4: Infrastructure as Code & Deployment (Linggo 4-5)
**Tagal**: 1-1.5 oras | **Kahirapan**: ⭐⭐⭐

#### Mga Layunin sa Pagkatuto
- Gumawa at i-customize ang mga Bicep infrastructure template
- Magpatupad ng advanced na deployment pattern at workflow
- Maunawaan ang mga estratehiya sa provision ng resource
- Magdisenyo ng scalable na multi-service architecture

- Mag-deploy ng containerized na aplikasyon gamit ang Azure Container Apps at AZD


#### Mga Pangunahing Konsepto na Dapat Pag-aralan
- Estruktura ng Bicep template at mga best practice
- Mga dependency ng resource at pagkakasunod ng deployment
- Parameter files at modularity ng template
- Custom hooks at automation sa deployment
- Mga pattern ng deployment ng container app (mabilis na pagsisimula, produksyon, microservices)

#### Mga Praktikal na Pagsasanay
1. **Paggawa ng Custom na Template**: Gumawa ng template para sa multi-service na aplikasyon
2. **Mastery sa Bicep**: Gumawa ng modular, reusable na mga infrastructure component
3. **Automation ng Deployment**: Magpatupad ng pre/post deployment hooks
4. **Disenyo ng Arkitektura**: Mag-deploy ng komplikadong microservices architecture
5. **Deployment ng Container App**: I-deploy ang [Simple Flask API](../../../examples/container-app/simple-flask-api) at [Microservices Architecture](../../../examples/container-app/microservices) na mga halimbawa gamit ang AZD

#### Mga Tanong sa Pagsusuri
- Paano gumawa ng custom na Bicep template para sa AZD?
- Ano ang mga best practice sa pag-organisa ng infrastructure code?
- Paano mo hinaharap ang mga dependency ng resource sa mga template?
- Anong mga deployment pattern ang sumusuporta sa zero-downtime updates?

---

### Kabanata 5: Multi-Agent AI Solutions (Linggo 6-7)
**Tagal**: 2-3 oras | **Kahirapan**: ⭐⭐⭐⭐

#### Mga Layunin sa Pagkatuto
- Magdisenyo at magpatupad ng multi-agent AI architecture
- I-orchestrate ang koordinasyon at komunikasyon ng mga agent
- Mag-deploy ng production-ready AI solution na may monitoring
- Maunawaan ang specialization ng agent at mga pattern ng workflow
- Isama ang mga containerized microservices bilang bahagi ng mga multi-agent solution

#### Mga Pangunahing Konsepto na Dapat Pag-aralan
- Mga pattern ng multi-agent architecture at prinsipyo ng disenyo
- Mga protocol ng komunikasyon ng agent at daloy ng data
- Mga estratehiya sa load balancing at scaling para sa AI agents
- Monitoring ng produksyon para sa multi-agent na sistema
- Komunikasyon sa pagitan ng serbisyo sa mga containerized na kapaligiran

#### Mga Praktikal na Pagsasanay
1. **Pagsusuri ng Retail Architecture**: Suriin ang retail blueprint at tukuyin kung alin sa mga bahagi ng aplikasyon ang kailangang ipatupad bago ang deployment
2. **Pag-customize ng Agent**: Baguhin ang mga behavior ng Customer at Inventory agent
3. **Pag-scale ng Arkitektura**: Magpatupad ng load balancing at auto-scaling
4. **Monitoring sa Produksyon**: Mag-set up ng komprehensibong monitoring at alerting
5. **Integrasyon ng Microservices**: Palawakin ang [Microservices Architecture](../../../examples/container-app/microservices) na halimbawa upang suportahan ang mga workflow na base sa agent

#### Mga Tanong sa Pagsusuri
- Paano mo dinisenyo ang epektibong mga pattern ng komunikasyon ng multi-agent?
- Ano ang mga pangunahing konsiderasyon sa pag-scale ng AI agent workloads?
- Paano mo minomonitor at dini-debug ang mga multi-agent AI system?
- Anong mga pattern ng produksyon ang nagsisiguro ng pagiging maaasahan para sa AI agents?

---

### Kabanata 6: Pre-Deployment Validation & Planning (Linggo 8)
**Tagal**: 1 oras | **Kahirapan**: ⭐⭐

#### Mga Layunin sa Pagkatuto
- Magsagawa ng komprehensibong capacity planning at validation ng resource
- Pumili ng optimal na Azure SKU para sa cost-effectiveness
- Magpatupad ng automated na pre-flight check at validation
- Magplano ng deployment gamit ang mga estratehiya sa pag-optimize ng gastusin

#### Mga Pangunahing Konsepto na Dapat Pag-aralan
- Mga quota at limitasyon ng kapasidad ng Azure resource
- Mga criteria sa pagpili ng SKU at pag-optimize ng gastusin
- Mga automated validation script at testing
- Plano ng deployment at pagtatasa ng panganib

#### Mga Praktikal na Pagsasanay
1. **Pagsusuri ng Kapasidad**: Suriin ang mga pangangailangan sa resource para sa iyong mga aplikasyon
2. **Pag-optimize ng SKU**: Ihambing at piliin ang mga cost-effective na service tier
3. **Automation ng Validation**: Magpatupad ng mga script para sa pre-deployment check
4. **Pagpaplano ng Gastos**: Gumawa ng mga pagtatantya sa gastos at budget para sa deployment

#### Mga Tanong sa Pagsusuri
- Paano mo vavalidate ang kapasidad ng Azure bago ang deployment?
- Anong mga salik ang nakakaapekto sa desisyon sa pagpili ng SKU?
- Paano mo ina-automate ang pre-deployment validation?
- Anong mga estratehiya ang nakakatulong sa pag-optimize ng gastos sa deployment?

---

### Kabanata 7: Troubleshooting & Debugging (Linggo 9)
**Tagal**: 1-1.5 oras | **Kahirapan**: ⭐⭐

#### Mga Layunin sa Pagkatuto
- Bumuo ng sistematikong mga pamamaraan sa debugging para sa AZD deployment
- Lutasin ang mga karaniwang isyu sa deployment at configuration
- Mag-debug ng mga AI-specific na problema at performance issues
- Magpatupad ng monitoring at alerting para sa maagap na pagtuklas ng problema

#### Mga Pangunahing Konsepto na Dapat Pag-aralan
- Mga teknik sa diagnostic at mga estratehiya sa logging
- Karaniwang pattern ng failure at ang mga solusyon nito
- Monitoring ng performance at pag-optimize
- Mga pamamaraan sa pagtugon at pag-recover sa insidente

#### Mga Praktikal na Pagsasanay
1. **Kasanayan sa Diagnostic**: Magsanay gamit ang mga sinadyang sirang deployment
2. **Pagsusuri ng Log**: Gamitin ang Azure Monitor at Application Insights nang epektibo
3. **Pag-tune ng Performance**: I-optimize ang mga mabagal na aplikasyon
4. **Mga Pamamaraan sa Pag-recover**: Magpatupad ng backup at disaster recovery

#### Mga Tanong sa Pagsusuri
- Ano ang mga pinaka-karaniwang failure sa AZD deployment?
- Paano mo dinidebug ang mga isyu sa authentication at permission?
- Anong mga estratehiya sa monitoring ang nakakatulong maiwasan ang mga isyu sa produksyon?
- Paano mo ini-optimize ang performance ng aplikasyon sa Azure?

---

### Kabanata 8: Mga Pattern sa Produksyon & Enterprise (Linggo 10-11)
**Tagal**: 2-3 oras | **Kahirapan**: ⭐⭐⭐⭐

#### Mga Layunin sa Pagkatuto
- Magpatupad ng mga enterprise-grade na estratehiya sa deployment
- Magdisenyo ng mga security pattern at compliance framework
- Magtatag ng monitoring, governance, at pamamahala ng gastusin
- Gumawa ng scalable na mga CI/CD pipeline na may integrasyon ng AZD
- Ipatupad ang mga best practice para sa produksyon ng container app deployment (security, monitoring, gastusin, CI/CD)

#### Mga Pangunahing Konsepto na Dapat Pag-aralan
- Mga requirement sa enterprise security at compliance
- Mga framework sa governance at pagpapatupad ng polisiya
- Advanced na monitoring at pamamahala ng gastusin
- Integrasyon ng CI/CD at automated deployment pipeline
- Blue-green at canary deployment strategy para sa containerized workloads

#### Mga Praktikal na Pagsasanay
1. **Enterprise Security**: Magpatupad ng komprehensibong security pattern
2. **Governance Framework**: Mag-set up ng Azure Policy at pamamahala ng resource
3. **Advanced Monitoring**: Gumawa ng mga dashboard at automated alerting
4. **CI/CD Integration**: Bumuo ng automated deployment pipeline
5. **Production Container Apps**: Ipatupad ang seguridad, monitoring, at pag-optimize ng gastusin sa [Microservices Architecture](../../../examples/container-app/microservices) na halimbawa

#### Mga Tanong sa Pagsusuri
- Paano mo ipinatutupad ang enterprise security sa AZD deployment?
- Anong mga pattern ng governance ang nagsisiguro ng compliance at kontrol sa gastusin?
- Paano mo ididisenyo ang scalable na monitoring para sa produksyon na sistema?
- Anong mga pattern ng CI/CD ang pinakamainam para sa mga workflow ng AZD?

#### Mga Layunin sa Pagkatuto
- Maunawaan ang mga pundamental at pangunahing konsepto ng Azure Developer CLI
- Matagumpay na mai-install at mai-configure ang azd sa iyong development environment
- Makumpleto ang iyong unang deployment gamit ang umiiral na template
- Mag-navigate sa estruktura ng azd proyekto at maunawaan ang mga pangunahing bahagi

#### Mga Pangunahing Konsepto na Dapat Pag-aralan
- Mga template, kapaligiran, at serbisyo
- Estruktura ng configuration ng azure.yaml
- Mga pangunahing utos ng azd (init, up, down, deploy)
- Mga prinsipyo ng Infrastructure as Code
- Authentication at authorization ng Azure

#### Mga Pagsasanay

**Pagsasanay 1.1: Pag-install at Setup**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Pagsasanay 1.2: Unang Deployment**
```text
# Deploy a simple web application:
1. Initialize project in an empty directory: azd init --template todo-nodejs-mongo .
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Pagsasanay 1.3: Pagsusuri ng Estruktura ng Proyekto**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Mga Tanong sa Self-Assessment
1. Ano ang tatlong pangunahing konsepto ng azd arkitektura?
2. Ano ang layunin ng azure.yaml na file?
3. Paano tinutulungan ng mga kapaligiran ang pamamahala ng iba't ibang target na deployment?
4. Anong mga paraan ng authentication ang maaaring gamitin sa azd?
5. Ano ang nangyayari kapag ginamit mo ang `azd up` sa unang pagkakataon?

---

## Pagsubaybay ng Progreso at Balangkas ng Pagsusuri
```text
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Pagsasanay 2.2: Advanced Configuration**
```text
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Pagsasanay 2.3: Configuration ng Seguridad**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Mga Tanong sa Self-Assessment
1. Paano hinahandle ng azd ang precedence ng environment variable?
2. Ano ang mga deployment hooks at kailan mo ito dapat gamitin?
3. Paano ka nagko-configure ng iba't ibang SKU para sa iba't ibang kapaligiran?
4. Ano ang mga implikasyon sa seguridad ng iba't ibang paraan ng authentication?
5. Paano mo pinamamahalaan ang mga sikreto at sensitibong configuration data?

### Module 3: Deployment at Provisioning (Linggo 4)

#### Mga Layunin sa Pagkatuto
- Masterin ang mga workflow sa deployment at mga best practice
- Maunawaan ang Infrastructure as Code gamit ang mga Bicep template
- Magpatupad ng kumplikadong multi-service architecture
- I-optimize ang performance at reliability ng deployment

#### Mga Pangunahing Konsepto na Dapat Pag-aralan
- Estruktura ng Bicep template at mga module
- Mga dependency ng resource at pagkakasunod-sunod
- Mga estratehiya sa deployment (blue-green, rolling updates)
- Deployment sa maramihang rehiyon
- Database migration at pamamahala ng datos

#### Mga Pagsasanay

**Pagsasanay 3.1: Custom Infrastructure**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Pagsasanay 3.2: Multi-Service Application**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Pagsasanay 3.3: Integrasyon ng Database**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Mga Tanong sa Self-Assessment
1. Ano ang mga kalamangan ng paggamit ng Bicep kumpara sa ARM template?
2. Paano mo hinaharap ang database migrations sa azd deployment?
3. Anong mga estratehiya ang umiiral para sa zero-downtime deployment?
4. Paano mo pinamamahalaan ang mga dependency sa pagitan ng mga serbisyo?
5. Ano ang mga konsiderasyon para sa deployment sa maramihang rehiyon?

### Module 4: Pre-Deployment Validation (Linggo 5)

#### Mga Layunin sa Pagkatuto
- Magpatupad ng komprehensibong mga pre-deployment check
- Magsanay sa capacity planning at beripikasyon ng mga resource
- Unawain ang pagpili ng SKU at pag-optimize ng gastos
- Gumawa ng automated validation pipelines

#### Mga Pangunahing Konsepto na Dapat Maging Eksperto
- Mga quota at limitasyon ng resource sa Azure
- Mga pamantayan sa pagpili ng SKU at mga implikasyon sa gastos
- Mga script at tool para sa automated validation
- Mga metodolohiya sa capacity planning
- Testing ng performance at pag-optimize

#### Mga Pagsasanay

**Exercise 4.1: Capacity Planning**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercise 4.2: Pre-flight Validation**
```text
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercise 4.3: SKU Optimization**
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Mga Tanong para sa Sariling Pagsusuri
1. Anu-anong mga salik ang dapat makaapekto sa desisyon sa pagpili ng SKU?
2. Paano mo bina-validate ang pagkakaroon ng Azure resource bago ang deployment?
3. Ano ang mga pangunahing bahagi ng sistema ng pre-flight check?
4. Paano mo tinatantiya at kinokontrol ang mga gastos sa deployment?
5. Anong monitoring ang mahalaga para sa capacity planning?

### Module 5: Pag-troubleshoot at Pag-debug (Linggo 6)

#### Mga Layunin sa Pagkatuto
- Magsanay ng mga sistematikong metodolohiya sa pag-troubleshoot
- Paunlarin ang kasanayan sa pag-debug ng mga komplikadong isyu sa deployment
- Magpatupad ng komprehensibong monitoring at alerting
- Gumawa ng mga pamamaraan para sa incident response at recovery

#### Mga Pangunahing Konsepto na Dapat Maging Eksperto
- Karaniwang mga pattern ng pagkabigo sa deployment
- Mga teknik sa pagsusuri at korelasyon ng mga log
- Pagmamanman ng performance at pag-optimize
- Pagtuklas at pagresponde sa security incident
- Disaster recovery at business continuity

#### Mga Pagsasanay

**Exercise 5.1: Mga Senaryo sa Pag-troubleshoot**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercise 5.2: Implementasyon ng Monitoring**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercise 5.3: Incident Response**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Mga Tanong para sa Sariling Pagsusuri
1. Ano ang sistematikong pamamaraan sa pag-troubleshoot ng mga azd deployment?
2. Paano mo kinokorelasyon ang mga log sa pagitan ng maraming serbisyo at mga resource?
3. Aling mga metric sa monitoring ang pinaka-kritikal para sa maagang pagtuklas ng problema?
4. Paano mo ipinatutupad ang epektibong mga pamamaraan sa disaster recovery?
5. Ano ang mga pangunahing bahagi ng isang plano sa incident response?

### Module 6: Mga Advanced na Paksa at Pinakamahusay na Kasanayan (Linggo 7-8)

#### Mga Layunin sa Pagkatuto
- Magpatupad ng mga enterprise-grade na pattern sa deployment
- Magsanay sa CI/CD integration at automation
- Paunlarin ang mga custom template at mag-ambag sa komunidad
- Unawain ang mga advanced na pangangailangan sa seguridad at pagsunod

#### Mga Pangunahing Konsepto na Dapat Maging Eksperto
- Mga pattern ng integration para sa CI/CD pipeline
- Pag-develop at pamamahagi ng custom na template
- Pamamahala ng enterprise governance at compliance
- Mga advanced na network at seguridad na konfigurasyon
- Pag-optimize ng performance at pamamahala ng gastos

#### Mga Pagsasanay

**Exercise 6.1: CI/CD Integration**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Exercise 6.2: Pag-develop ng Custom Template**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercise 6.3: Implementasyon para sa Enterprise**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Mga Tanong para sa Sariling Pagsusuri
1. Paano mo ini-integrate ang azd sa umiiral na mga CI/CD workflow?
2. Ano ang mga pangunahing isyung dapat isaalang-alang sa pag-develop ng custom template?
3. Paano mo ipinatutupad ang governance at compliance sa mga azd deployment?
4. Ano ang mga pinakamahuhusay na kasanayan para sa mga enterprise-scale na deployment?
5. Paano ka makakatulong nang epektibo sa komunidad ng azd?

## Mga Praktikal na Proyekto

### Proyekto 1: Personal na Portfolio Website
**Kalakihan**: Nagsisimula  
**Tagal**: 1-2 linggo

Bumuo at mag-deploy ng personal na portfolio website gamit ang:
- Static website hosting sa Azure Storage
- Custom na domain configuration
- CDN integration para sa global na performance
- Automated deployment pipeline

**Mga Deliverable**:
- Gumaganang website na naka-deploy sa Azure
- Custom na azd template para sa mga portfolio deployments
- Dokumentasyon ng proseso ng deployment
- Pagsusuri ng gastos at mga rekomendasyon sa pag-optimize

### Proyekto 2: Task Management Application
**Kalakihan**: Intermediate  
**Tagal**: 2-3 linggo

Gumawa ng full-stack task management application na may:
- React frontend na naka-deploy sa App Service
- Node.js API backend na may authentication
- PostgreSQL database na may migrations
- Application Insights monitoring

**Mga Deliverable**:
- Kumpletong application na may user authentication
- Database schema at migration scripts
- Monitoring dashboards at mga panuntunan sa alerting
- Multi-environment deployment configuration

### Proyekto 3: Microservices E-commerce Platform
**Kalakihan**: Advanced  
**Tagal**: 4-6 na linggo

Idiseño at ipatupad ang microservices-based na e-commerce platform:
- Maramihang API services (catalog, orders, payments, users)
- Integrasyon ng message queue gamit ang Service Bus
- Redis cache para sa pag-optimize ng performance
- Komprehensibong pag-log at monitoring

**Halimbawa ng Sanggunian**: Tingnan ang [Microservices Architecture](../../../examples/container-app/microservices) para sa dalawang-serbisyong sample ng pag-aaral at gabay sa deployment. Ang mga queues, persistence, authentication, pagproseso ng bayad, at production hardening ay mga hiwalay na gawain sa proyekto.

**Mga Deliverable**:
- Kumpletong microservices architecture
- Mga pattern ng komunikasyon sa pagitan ng mga serbisyo
- Testing ng performance at pag-optimize
- Production-ready na pagpapatupad ng seguridad

## Pagsusuri at Sertipikasyon

### Mga Knowledge Checks

Kumpletuhin ang mga pagsusuring ito pagkatapos ng bawat module:

**Module 1 Assessment**: Mga pangunahing konsepto at instalasyon
- Mga katanungang multiple choice tungkol sa mga pangunahing konsepto
- Mga praktikal na gawain sa instalasyon at konfigurasyon
- Simpleng exercise sa deployment

**Module 2 Assessment**: Konfigurasyon at mga environment
- Mga senaryo sa pamamahala ng environment
- Mga pagsasanay sa pag-troubleshoot ng konfigurasyon
- Implementasyon ng security configuration

**Module 3 Assessment**: Deployment at provisioning
- Mga hamon sa disenyo ng imprastruktura
- Mga senaryo ng multi-service deployment
- Mga exercise sa pag-optimize ng performance

**Module 4 Assessment**: Pre-deployment validation
- Pag-aaral ng kaso sa capacity planning
- Mga senaryo sa pag-optimize ng gastos
- Implementasyon ng validation pipeline

**Module 5 Assessment**: Pag-troubleshoot at pag-debug
- Mga exercise sa diagnosis ng problema
- Mga gawain sa implementasyon ng monitoring
- Mga simulation ng incident response

**Module 6 Assessment**: Mga advanced na paksa
- Disenyo ng CI/CD pipeline
- Pag-develop ng custom na template
- Mga senaryo ng enterprise architecture

### Huling Capstone Project

Idiseño at ipatupad ang isang kompletong solusyon na nagpapakita ng kahusayan sa lahat ng mga konsepto:

**Mga Kinakailangan**:
- Multi-tier na arkitektura ng aplikasyon
- Maramihang deployment environments
- Komprehensibong monitoring at alerting
- Pagpapatupad ng seguridad at pagsunod
- Pag-optimize ng gastos at tuning ng performance
- Kumpletong dokumentasyon at runbooks

**Pamantayan sa Pagsusuri**:
- Kalidad ng teknikal na implementasyon
- Kompleto ng dokumentasyon
- Pagsunod sa seguridad at pinakamahusay na kasanayan
- Pag-optimize ng performance at gastos
- Bisa ng pag-troubleshoot at monitoring

## Mga Mapagkukunan sa Pag-aaral at Sanggunian

### Opisyal na Dokumentasyon
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Mga Mapagkukunan mula sa Komunidad
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Mga Practice Environment
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Karagdagang Mga Tool
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Mga Rekomendasyon sa Iskedyul ng Pag-aaral

### Buong Panahon ng Pag-aaral (8 linggo)
- **Mga Linggo 1-2**: Mga Module 1-2 (Panimula, Konfigurasyon)
- **Mga Linggo 3-4**: Mga Module 3-4 (Deployment, Pre-deployment)
- **Mga Linggo 5-6**: Mga Module 5-6 (Pag-troubleshoot, Mga Advanced na Paksa)
- **Mga Linggo 7-8**: Mga Praktikal na Proyekto at Pangwakas na Pagsusuri

### Part-Time na Pag-aaral (16 na linggo)
- **Mga Linggo 1-4**: Module 1 (Panimula)
- **Mga Linggo 5-7**: Module 2 (Konfigurasyon at Mga Environment)
- **Mga Linggo 8-10**: Module 3 (Deployment at Provisioning)
- **Mga Linggo 11-12**: Module 4 (Pre-deployment Validation)
- **Mga Linggo 13-14**: Module 5 (Pag-troubleshoot at Pag-debug)
- **Mga Linggo 15-16**: Module 6 (Mga Advanced na Paksa at Pagsusuri)

---

## Balangkas para sa Pagsusubaybay sa Progreso at Pagsusuri

### Checklist para sa Pagtatapos ng Kabanata

Subaybayan ang iyong pag-unlad sa bawat kabanata gamit ang mga nasusukat na resulta:

#### 📚 Kabanata 1: Pundasyon at Mabilis na Panimula
- [ ] **Tapos ang Instalasyon**: Na-install at na-verify ang AZD sa iyong platform
- [ ] **Unang Deployment**: Matagumpay na na-deploy ang todo-nodejs-mongo template
- [ ] **Paghahanda ng Environment**: Na-configure ang unang mga environment variable
- [ ] **Pag-navigate ng Resource**: Na-explore ang mga deployed na resource sa Azure Portal
- [ ] **Kasanayan sa Command**: Kumportable sa mga pangunahing utos ng AZD

#### 🤖 Kabanata 2: AI-First Development  
- [ ] **Deployment ng AI Template**: Matagumpay na na-deploy ang azure-search-openai-demo
- [ ] **Pagpapatupad ng RAG**: Na-configure ang pag-index at retrieval ng dokumento
- [ ] **Konfigurasyon ng Modelo**: Na-set up ang maraming AI models para sa iba't ibang layunin
- [ ] **Monitoring ng AI**: Naipatupad ang Application Insights para sa AI workloads
- [ ] **Pag-optimize ng Performance**: Na-tune ang performance ng AI application

#### ⚙️ Kabanata 3: Konfigurasyon at Pag-authenticate
- [ ] **Pagsasaayos ng Multi-Environment**: Na-configure ang dev, staging, at prod environments
- [ ] **Pagpapatupad ng Seguridad**: Na-set up ang managed identity authentication
- [ ] **Pamamahala ng Sekreto**: Naka-integrate ang Azure Key Vault para sa sensitibong data
- [ ] **Pamamahala ng Parameter**: Nilikha ang environment-specific na mga konfigurasyon
- [ ] **Kasanayan sa Authentication**: Naipatupad ang mga secure access pattern

#### 🏗️ Kabanata 4: Infrastructure as Code at Deployment
- [ ] **Paggawa ng Custom Template**: Nilikha ang template para sa multi-service application
- [ ] **Kasanayan sa Bicep**: Nilikha ang modular, reusable na mga sangkap ng imprastruktura
- [ ] **Automation ng Deployment**: Naipatupad ang pre/post deployment hooks
- [ ] **Disenyo ng Arkitektura**: Na-deploy ang kumplikadong microservices architecture
- [ ] **Pag-optimize ng Template**: Na-optimize ang mga template para sa performance at gastos

#### 🎯 Kabanata 5: Multi-Agent AI Solutions
- [ ] **Review ng Retail Architecture**: Natukoy ang nawawalang mga bahagi ng application at pinlano ang implementasyon at pag-validate nito
- [ ] **Pag-customize ng Agent**: Binago ang mga behavior ng Customer at Inventory agents
- [ ] **Pag-scale ng Arkitektura**: Naipatupad ang load balancing at auto-scaling
- [ ] **Monitoring sa Production**: Na-set up ang komprehensibong monitoring at alerting
- [ ] **Pag-tune ng Performance**: Na-optimize ang performance ng multi-agent system

#### 🔍 Kabanata 6: Pre-Deployment Validation at Planning
- [ ] **Pagsusuri sa Kapasidad**: Sinaliksik ang pangangailangan sa resource para sa mga aplikasyon
- [ ] **Pag-optimize ng SKU**: Pinili ang cost-effective na mga tier ng serbisyo
- [ ] **Automation ng Validation**: Naipatupad ang mga pre-deployment check script
- [ ] **Pagplano ng Gastos**: Nilikha ang mga estima at budget sa deployment cost
- [ ] **Pagtatasa ng Panganib**: Natukoy at na-mitigate ang mga panganib sa deployment

#### 🚨 Kabanata 7: Pag-troubleshoot at Pag-debug
- [ ] **Kasanayan sa Diagnostic**: Matagumpay na na-debug ang mga sinadyang sirang deployment
- [ ] **Pagsusuri ng Log**: Epektibong ginamit ang Azure Monitor at Application Insights
- [ ] **Pag-tune ng Performance**: Na-optimize ang mabagal na applications
- [ ] **Pamamaraan sa Pag-recover**: Naipatupad ang backup at disaster recovery
- [ ] **Pag-set up ng Monitoring**: Nilikha ang proactive monitoring at alerting

#### 🏢 Kabanata 8: Mga Pattern para sa Production at Enterprise
- [ ] **Seguridad ng Enterprise**: Naipatupad ang komprehensibong security pattern
- [ ] **Balangkas ng Pamamahala**: Na-set up ang Azure Policy at pamamahala ng resource
- [ ] **Advanced Monitoring**: Nilikha ang mga dashboard at automated alerting
- [ ] **Integrasyon ng CI/CD**: Nilikha ang automated deployment pipeline
- [ ] **Implementasyon ng Pagsunod**: Naabot ang mga pangangailangan sa enterprise compliance

### Timeline at Mga Milestone sa Pagkatuto

#### Linggo 1-2: Pagtatatag ng Pundasyon
- **Milestone**: I-deploy ang unang AI application gamit ang AZD
- **Pagpapatunay**: Gumaganang application na ma-access sa pamamagitan ng pampublikong URL
- **Kasanayan**: Pangunahing mga workflow sa AZD at integrasyon ng AI service

#### Linggo 3-4: Kasanayan sa Konfigurasyon
- **Milestone**: Multi-environment deployment na may secure na authentication
- **Pagpapatunay**: Ang parehong application ay na-deploy sa dev/staging/prod
- **Kasanayan**: Pamamahala ng environment at pagpapatupad ng seguridad

#### Linggo 5-6: Ekspertis sa Infrastructure
- **Milestone**: Custom template para sa komplikadong multi-service application
- **Pagpapatunay**: Template na reusable na na-deploy ng ibang kasapi ng koponan
- **Kasanayan**: Kasanayan sa Bicep at automation ng imprastruktura

#### Linggo 7-8: Advanced na Implementasyon ng AI
- **Milestone**: Production-ready na multi-agent AI solution
- **Pagpapatunay**: Sistema na nakakayanan ang totoong gamit na load na may monitoring
- **Kasanayan**: Orchestration ng multi-agent at pag-optimize ng performance

#### Linggo 9-10: Kahandaan para sa Production
- **Milestone**: Enterprise-grade na deployment na may buong pagsunod
- **Pagpapatunay**: Nakapasa sa review ng seguridad at audit sa pag-optimize ng gastos
- **Kasanayan**: Pamamahala, pagmamanman, at integrasyon ng CI/CD

### Pagsusuri at Sertipikasyon

#### Mga Paraan ng Pagpapatunay ng Kaalaman
1. **Praktikal na Deployment**: Gumaganang mga application para sa bawat kabanata
2. **Pagsusuri ng Code**: Pagtatasa ng kalidad ng template at konfigurasyon
3. **Pagsosolba ng Problema**: Mga senaryo at solusyon sa pag-troubleshoot
4. **Pagtuturo sa Kapwa**: Ipaliwanag ang mga konsepto sa ibang mga nag-aaral
5. **Ambag sa Komunidad**: Magbahagi ng mga template o pagpapabuti

#### Mga Resulta sa Propesyonal na Pag-unlad
- **Mga Proyekto sa Portfolio**: Mga pagsasanay sa deployment at arkitektura; ang kahandaan sa production ay nangangailangan ng hiwalay na implementasyon at pagsusuri
- **Teknikal na Kasanayan**: Industriya-standard na kasanayan sa AZD at AI deployment
- **Kakayahan sa Pagsosolba ng Problema**: Malaya na pag-troubleshoot at pag-optimize
- **Pagkilala ng Komunidad**: Aktibong paglahok sa komunidad ng Azure developer
- **Pag-unlad ng Karera**: Mga kasanayang direktang naaangkop sa mga papel sa cloud at AI

#### Mga Sukatan ng Tagumpay
- **Rate ng Tagumpay sa Deployment**: >95% matagumpay na deployments
- **Oras sa Pag-troubleshoot**: <30 minuto para sa mga karaniwang isyu
- **Pag-optimize ng Performance**: Maipapakitang mga pagpapabuti sa gastos at performance
- **Pagsusuri sa Seguridad**: Dokumentuhin ang mga kontrol at mga natitirang kakulangan laban sa mga kinakailangan ng iyong organisasyon; hindi nagpapatunay ang pagtatapos ng kurso ng pagsunod
- **Paglipat ng Kaalaman**: Kakayahang maging mentor sa ibang mga developer

### Patuloy na Pag-aaral at Pakikilahok sa Komunidad

#### Manatiling Napapanahon
- **Mga Update sa Azure**: Sundan ang mga release notes ng Azure Developer CLI
- **Mga Kaganapan sa Komunidad**: Lumahok sa mga Azure at AI developer events
- **Dokumentasyon**: Mag-ambag sa dokumentasyon at mga halimbawa ng komunidad
- **Feedback Loop**: Magbigay ng puna sa nilalaman ng kurso at mga serbisyo ng Azure

#### Pag-unlad ng Karera
- **Propesyonal na Network**: Kumonekta sa mga eksperto ng Azure at AI
- **Mga Oportunidad sa Pagsasalita**: I-presenta ang mga natutunan sa mga kumperensya o mga meetups
- **Ambag sa Open Source**: Mag-ambag sa mga AZD templates at mga tool
- **Mentor**: Gabayan ang iba pang mga developer sa kanilang paglalakbay sa pag-aaral ng AZD

---

**Pag-navigate sa Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD For Beginners](../README.md)
- **📖 Simulan ang Pag-aaral**: [Kabanata 1: Pundasyon at Mabilis na Simula](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Pagsubaybay sa Progreso**: Subaybayan ang iyong pag-unlad sa pamamagitan ng komprehensibong 8-kabanatang sistema ng pag-aaral
- **🤝 Komunidad**: [Azure Discord](https://discord.gg/microsoft-azure) para sa suporta at talakayan

**Pagsubaybay sa Progreso sa Pag-aaral**: Gamitin ang istrukturadong gabay na ito upang maging bihasa sa Azure Developer CLI sa pamamagitan ng progresibo, praktikal na pag-aaral na may masukat na mga resulta at mga benepisyo sa propesyonal na pag-unlad.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
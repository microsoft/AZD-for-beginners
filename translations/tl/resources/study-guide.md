# Gabay sa Pag-aaral - Komprehensibong Mga Layunin sa Pagkatuto

**Navigasyon ng Landas ng Pagkatuto**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Start Learning**: [Kabanata 1: Pundasyon & Mabilis na Pagsisimula](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Progress Tracking**: [Pagkumpleto ng Kurso](../README.md#-course-completion--certification)

## Panimula

Ang komprehensibong gabay na ito sa pag-aaral ay nagbibigay ng istrukturadong mga layunin sa pagkatuto, mga pangunahing konsepto, mga praktikal na gawain, at mga materyales para sa pagsusuri upang tulungan kang maging bihasa sa Azure Developer CLI (azd). Gamitin ang gabay na ito upang subaybayan ang iyong pag-unlad at tiyaking natakpan mo ang lahat ng mahahalagang paksa.

## Mga Layunin sa Pagkatuto

Sa pamamagitan ng pagtatapos ng gabay na ito, ikaw ay:
- Maging dalubhasa sa lahat ng pangunahing at advanced na konsepto ng Azure Developer CLI
- Bumuo ng praktikal na kakayahan sa pag-deploy at pamamahala ng mga aplikasyon sa Azure
- Magkaroon ng kumpiyansa sa pag-troubleshoot at pag-optimize ng mga deployment
- Maunawaan ang mga kasanayan para sa production-ready na deployment at mga konsiderasyon sa seguridad

## Mga Kinalabasan ng Pagkatuto

Matapos makumpleto ang lahat ng bahagi ng gabay na ito, magagawa mong:
- Mag-disenyo, mag-deploy, at mag-manage ng kumpletong arkitektura ng aplikasyon gamit ang azd
- Magpatupad ng komprehensibong monitoring, seguridad, at mga estratehiya sa pag-optimize ng gastos
- Mag-troubleshoot ng kumplikadong mga isyu sa deployment nang mag-isa
- Lumikha ng mga custom na template at mag-ambag sa komunidad ng azd

## Istruktura ng Pagkatuto na Binubuo ng 8 Kabanata

### Kabanata 1: Pundasyon & Mabilis na Pagsisimula (Linggo 1)
**Tagal**: 30-45 minuto | **Kompleksidad**: ⭐

#### Mga Layunin sa Pagkatuto
- Maunawaan ang mga pangunahing konsepto at terminolohiya ng Azure Developer CLI
- Matagumpay na mai-install at ma-configure ang AZD sa iyong development platform
- I-deploy ang iyong unang aplikasyon gamit ang umiiral na template
- Mag-navigate nang epektibo sa AZD command-line interface

#### Mga Mahalagang Konsepto na Dapat Mabisang Matutunan
- Istruktura ng proyekto ng AZD at mga bahagi (azure.yaml, infra/, src/)
- Mga workflow ng deployment na batay sa template
- Mga batayan ng konfigurasyon ng environment
- Pamamahala ng resource group at subscription

#### Mga Praktikal na Ehersisyo
1. **Pagpapatunay ng Instalasyon**: I-install ang AZD at i-verify gamit ang `azd version`
2. **Unang Deployment**: I-deploy nang matagumpay ang todo-nodejs-mongo template
3. **Pag-setup ng Environment**: I-configure ang iyong unang mga environment variable
4. **Eksplorasyon ng Mga Resource**: Mag-navigate sa mga na-deploy na resource sa Azure Portal

#### Mga Tanong sa Pagsusuri
- Ano ang mga pangunahing bahagi ng isang proyekto ng AZD?
- Paano ka mag-i-initialize ng bagong proyekto mula sa isang template?
- Ano ang pagkakaiba sa pagitan ng `azd up` at `azd deploy`?
- Paano mo pinamamahalaan ang maramihang mga environment gamit ang AZD?

---

### Kabanata 2: AI-First Development (Linggo 2)
**Tagal**: 1-2 oras | **Kompleksidad**: ⭐⭐

#### Mga Layunin sa Pagkatuto
- I-integrate ang Microsoft Foundry services sa mga workflow ng AZD
- Mag-deploy at mag-configure ng mga aplikasyon na pinapagana ng AI
- Maunawaan ang mga pattern ng implementasyon ng RAG (Retrieval-Augmented Generation)
- Pamahalaan ang deployment at scaling ng mga AI model

#### Mga Mahalagang Konsepto na Dapat Mabisang Matutunan
- Integrasyon ng Microsoft Foundry Models service at pamamahala ng API
- Konfigurasyon ng AI Search at pag-index ng vector
- Mga estratehiya sa deployment ng modelo at pagpaplano ng kapasidad
- Pagmo-monitor ng AI application at pag-optimize ng performance

#### Mga Praktikal na Ehersisyo
1. **AI Chat Deployment**: I-deploy ang azure-search-openai-demo template
2. **RAG Implementation**: I-configure ang pag-index at retrieval ng dokumento
3. **Model Configuration**: Mag-set up ng maraming AI model para sa iba’t ibang layunin
4. **AI Monitoring**: Ipatupad ang Application Insights para sa AI workloads

#### Mga Tanong sa Pagsusuri
- Paano mo iko-configure ang Microsoft Foundry Models services sa isang AZD template?
- Ano ang mga pangunahing bahagi ng isang RAG architecture?
- Paano mo pinamamahalaan ang capacity at scaling ng AI model?
- Anong mga metric sa monitoring ang mahalaga para sa mga AI application?

---

### Kabanata 3: Konfigurasyon & Pag-authenticate (Linggo 3)
**Tagal**: 45-60 minuto | **Kompleksidad**: ⭐⭐

#### Mga Layunin sa Pagkatuto
- Maging eksperto sa mga estratehiya ng konfigurasyon at pamamahala ng environment
- Magpatupad ng mga secure na pattern ng authentication at managed identity
- Ayusin ang mga resource gamit ang tamang naming conventions
- I-configure ang multi-environment deployments (dev, staging, prod)

#### Mga Mahalagang Konsepto na Dapat Mabisang Matutunan
- Hierarchy ng environment at precedence ng konfigurasyon
- Managed identity at service principal authentication
- Integrasyon ng Key Vault para sa pamamahala ng mga secret
- Pamamahala ng parameter na naka-specify para sa bawat environment

#### Mga Praktikal na Ehersisyo
1. **Multi-Environment Setup**: I-configure ang dev, staging, at prod environments
2. **Security Configuration**: Magpatupad ng managed identity authentication
3. **Secrets Management**: I-integrate ang Azure Key Vault para sa sensitibong data
4. **Parameter Management**: Lumikha ng environment-specific na mga konfigurasyon

#### Mga Tanong sa Pagsusuri
- Paano ka nagko-configure ng iba't ibang environment gamit ang AZD?
- Ano ang mga benepisyo ng paggamit ng managed identity kumpara sa service principals?
- Paano mo ligtas na pinamamahalaan ang mga secret ng aplikasyon?
- Ano ang hierarchy ng konfigurasyon sa AZD?

---

### Kabanata 4: Infrastructure as Code & Deployment (Linggo 4-5)
**Tagal**: 1-1.5 oras | **Kompleksidad**: ⭐⭐⭐

#### Mga Layunin sa Pagkatuto
- Lumikha at i-customize ang mga Bicep infrastructure template
- Magpatupad ng advanced na mga pattern at workflow ng deployment
- Maunawaan ang mga estratehiya sa provisioning ng resource
- Mag-disenyo ng scalable na multi-service architectures

- I-deploy ang mga containerized na aplikasyon gamit ang Azure Container Apps at AZD


#### Mga Mahalagang Konsepto na Dapat Mabisang Matutunan
- Istruktura ng Bicep template at mga best practice
- Mga dependency ng resource at ordering ng deployment
- Mga parameter file at modularity ng template
- Custom hooks at automation ng deployment
- Mga pattern sa pag-deploy ng container app (quick start, production, microservices)

#### Mga Praktikal na Ehersisyo
1. **Custom Template Creation**: Bumuo ng multi-service application template
2. **Bicep Mastery**: Lumikha ng modular, reusable na mga bahagi ng infrastructure
3. **Deployment Automation**: Magpatupad ng pre/post deployment hooks
4. **Architecture Design**: I-deploy ang kumplikadong microservices architecture
5. **Container App Deployment**: I-deploy ang [Simple Flask API](../../../examples/container-app/simple-flask-api) at [Microservices Architecture](../../../examples/container-app/microservices) na mga halimbawa gamit ang AZD

#### Mga Tanong sa Pagsusuri
- Paano ka lumikha ng custom Bicep templates para sa AZD?
- Ano ang mga best practice para sa pag-oorganisa ng infrastructure code?
- Paano mo hinahandle ang mga dependency ng resource sa mga template?
- Anong mga pattern ng deployment ang sumusuporta sa zero-downtime updates?

---

### Kabanata 5: Multi-Agent AI Solutions (Linggo 6-7)
**Tagal**: 2-3 oras | **Kompleksidad**: ⭐⭐⭐⭐

#### Mga Layunin sa Pagkatuto
- Mag-disenyo at magpatupad ng multi-agent AI architectures
- I-orchestrate ang koordinasyon at komunikasyon ng mga agent
- Mag-deploy ng production-ready na AI solutions na may monitoring
- Maunawaan ang agent specialization at mga workflow pattern
- I-integrate ang containerized microservices bilang bahagi ng multi-agent solutions

#### Mga Mahalagang Konsepto na Dapat Mabisang Matutunan
- Mga pattern ng multi-agent architecture at prinsipyo ng disenyo
- Mga protocol ng komunikasyon ng agent at daloy ng data
- Mga estratehiya sa load balancing at scaling para sa AI agents
- Production monitoring para sa multi-agent systems
- Serbisyo-sa-serbisyo na komunikasyon sa containerized na mga environment

#### Mga Praktikal na Ehersisyo
1. **Retail Solution Deployment**: I-deploy ang kumpletong multi-agent retail scenario
2. **Agent Customization**: I-modify ang pag-uugali ng Customer at Inventory agent
3. **Architecture Scaling**: Magpatupad ng load balancing at auto-scaling
4. **Production Monitoring**: Mag-set up ng komprehensibong monitoring at alerting
5. **Microservices Integration**: I-extend ang [Microservices Architecture](../../../examples/container-app/microservices) na halimbawa upang suportahan ang agent-based workflows

#### Mga Tanong sa Pagsusuri
- Paano ka mag-didisenyo ng epektibong mga pattern ng komunikasyon ng multi-agent?
- Ano ang mga pangunahing konsiderasyon para sa scaling ng AI agent workloads?
- Paano mo imo-monitor at ida-debug ang multi-agent AI systems?
- Anong mga production pattern ang nagsisiguro ng pagiging maaasahan para sa mga AI agent?

---

### Kabanata 6: Pre-Deployment Validation & Planning (Linggo 8)
**Tagal**: 1 oras | **Kompleksidad**: ⭐⭐

#### Mga Layunin sa Pagkatuto
- Magsagawa ng komprehensibong capacity planning at resource validation
- Pumili ng pinakamainam na Azure SKUs para sa cost-effectiveness
- Magpatupad ng automated na pre-flight checks at validation
- Magplano ng deployment na may mga estratehiya sa pag-optimize ng gastos

#### Mga Mahalagang Konsepto na Dapat Mabisang Matutunan
- Azure resource quotas at mga limitasyon ng kapasidad
- Mga kriteriya sa pagpili ng SKU at pag-optimize ng gastos
- Mga automated validation script at testing
- Pagpaplano ng deployment at pagtatasa ng panganib

#### Mga Praktikal na Ehersisyo
1. **Capacity Analysis**: Suriin ang mga kinakailangan sa resource para sa iyong mga aplikasyon
2. **SKU Optimization**: Ihambing at piliin ang cost-effective na service tiers
3. **Validation Automation**: Magpatupad ng mga script para sa pre-deployment checks
4. **Cost Planning**: Lumikha ng mga pagtatantya ng gastos at mga budget para sa deployment

#### Mga Tanong sa Pagsusuri
- Paano mo vinavalidate ang kapasidad ng Azure bago ang deployment?
- Anong mga salik ang nakakaapekto sa mga desisyon sa pagpili ng SKU?
- Paano mo ina-automate ang pre-deployment validation?
- Anong mga estratehiya ang tumutulong mag-optimize ng gastos sa deployment?

---

### Kabanata 7: Troubleshooting & Debugging (Linggo 9)
**Tagal**: 1-1.5 oras | **Kompleksidad**: ⭐⭐

#### Mga Layunin sa Pagkatuto
- Bumuo ng sistematikong mga pamamaraan sa debugging para sa mga AZD deployment
- Lutasin ang mga karaniwang isyu sa deployment at konfigurasyon
- I-debug ang mga AI-specific na problema at mga isyu sa performance
- Magpatupad ng monitoring at alerting para sa proaktibong pagtuklas ng mga isyu

#### Mga Mahalagang Konsepto na Dapat Mabisang Matutunan
- Mga teknik sa diagnosis at mga estratehiya sa pag-log
- Mga karaniwang pattern ng pagkabigo at ang kanilang mga solusyon
- Monitoring ng performance at pag-optimize
- Mga pamamaraan sa incident response at recovery

#### Mga Praktikal na Ehersisyo
1. **Diagnostic Skills**: Magsanay sa mga sinadyang sira na deployment
2. **Log Analysis**: Epektibong gamitin ang Azure Monitor at Application Insights
3. **Performance Tuning**: I-optimize ang mga mabagal na aplikasyon
4. **Recovery Procedures**: Magpatupad ng backup at disaster recovery

#### Mga Tanong sa Pagsusuri
- Ano ang mga pinaka-karaniwang pagkabigo sa AZD deployment?
- Paano mo ido-debug ang mga isyu sa authentication at permission?
- Anong mga estratehiya sa monitoring ang tumutulong maiwasan ang mga isyu sa production?
- Paano mo i-o-optimize ang performance ng aplikasyon sa Azure?

---

### Kabanata 8: Production & Enterprise Patterns (Linggo 10-11)
**Tagal**: 2-3 oras | **Kompleksidad**: ⭐⭐⭐⭐

#### Mga Layunin sa Pagkatuto
- Magpatupad ng enterprise-grade na mga estratehiya sa deployment
- Mag-disenyo ng mga pattern ng seguridad at mga framework para sa pagsunod
- Magtatag ng monitoring, governance, at pamamahala ng gastos
- Lumikha ng scalable na CI/CD pipelines na may integrasyon ng AZD
- I-apply ang mga best practice para sa production container app deployments (seguridad, monitoring, gastos, CI/CD)

#### Mga Mahalagang Konsepto na Dapat Mabisang Matutunan
- Mga kinakailangan sa enterprise security at compliance
- Mga framework ng governance at pagpapatupad ng polisiya
- Advanced monitoring at pamamahala ng gastos
- CI/CD integration at automated deployment pipelines
- Mga estratehiya ng blue-green at canary deployment para sa containerized workloads

#### Mga Praktikal na Ehersisyo
1. **Enterprise Security**: Magpatupad ng komprehensibong mga pattern ng seguridad
2. **Governance Framework**: Mag-set up ng Azure Policy at pamamahala ng resource
3. **Advanced Monitoring**: Lumikha ng mga dashboard at automated alerting
4. **CI/CD Integration**: Bumuo ng automated deployment pipelines
5. **Production Container Apps**: I-apply ang seguridad, monitoring, at pag-optimize ng gastos sa [Microservices Architecture](../../../examples/container-app/microservices) na halimbawa

#### Mga Tanong sa Pagsusuri
- Paano mo ipinatutupad ang enterprise security sa mga AZD deployment?
- Anong mga pattern ng governance ang nagsisiguro ng pagsunod at pagkontrol ng gastos?
- Paano ka mag-didisenyo ng scalable na monitoring para sa mga production system?
- Anong mga pattern ng CI/CD ang pinakamahusay na gumagana sa mga workflow ng AZD?

#### Mga Layunin sa Pagkatuto
- Maunawaan ang mga pundasyon at pangunahing konsepto ng Azure Developer CLI
- Matagumpay na mai-install at ma-configure ang azd sa iyong development environment
- Makumpleto ang iyong unang deployment gamit ang umiiral na template
- Mag-navigate sa istruktura ng proyekto ng azd at maunawaan ang mga pangunahing bahagi

#### Mga Mahalagang Konsepto na Dapat Mabisang Matutunan
- Templates, environments, at services
- Istruktura ng azure.yaml konfigurasyon
- Mga pangunahing azd commands (init, up, down, deploy)
- Mga prinsipyo ng Infrastructure as Code
- Azure authentication at authorization

#### Mga Praktikal na Ehersisyo

**Exercise 1.1: Installation and Setup**
```bash
# Kumpletuhin ang mga gawaing ito:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Exercise 1.2: First Deployment**
```bash
# I-deploy ang isang simpleng web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Exercise 1.3: Project Structure Analysis**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Mga Tanong para sa Sariling Pagsusuri
1. Ano ang tatlong pangunahing konsepto ng arkitektura ng azd?
2. Ano ang layunin ng azure.yaml file?
3. Paano nakakatulong ang mga environment sa pamamahala ng iba't ibang deployment target?
4. Anong mga paraan ng authentication ang maaaring gamitin sa azd?
5. Ano ang nangyayari kapag pinatakbo mo ang `azd up` sa unang pagkakataon?

---

## Pagsubaybay sa Progreso at Balangkas ng Pagtatasa
```bash
# Gumawa at i-configure ang maramihang kapaligiran:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Exercise 2.2: Advanced Configuration**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Exercise 2.3: Security Configuration**
```bash
# Ipatupad ang pinakamahusay na mga gawi sa seguridad:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Mga Tanong para sa Sariling Pagsusuri
1. Paano hinahandle ng azd ang precedence ng environment variable?
2. Ano ang mga deployment hooks at kailan mo dapat gamitin ang mga ito?
3. Paano mo iko-configure ang iba't ibang SKU para sa iba't ibang environment?
4. Ano ang mga implikasyon sa seguridad ng iba't ibang paraan ng authentication?
5. Paano mo pinamamahalaan ang mga secret at sensitibong konfigurasyon?

### Modyul 3: Deployment at Provisioning (Linggo 4)

#### Mga Layunin sa Pagkatuto
- Maging eksperto sa mga workflow ng deployment at mga best practice
- Maunawaan ang Infrastructure as Code gamit ang Bicep templates
- Magpatupad ng kumplikadong multi-service architectures
- I-optimize ang performance at reliability ng deployment

#### Mga Mahalagang Konsepto na Dapat Mabisang Matutunan
- Istruktura ng Bicep template at mga module
- Mga dependency ng resource at ordering
- Mga estratehiya sa deployment (blue-green, rolling updates)
- Multi-region deployments
- Database migrations at pamamahala ng data

#### Mga Praktikal na Ehersisyo

**Exercise 3.1: Custom Infrastructure**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Exercise 3.2: Multi-Service Application**
```bash
# Mag-deploy ng arkitektura ng microservices:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Exercise 3.3: Database Integration**
```bash
# Ipatupad ang mga pattern ng deployment ng database:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Mga Tanong para sa Sariling Pagsusuri
1. Ano ang mga pakinabang ng paggamit ng Bicep kumpara sa ARM templates?
2. Paano mo hinahandle ang database migrations sa mga azd deployment?
3. Anong mga estratehiya ang umiiral para sa zero-downtime deployments?
4. Paano mo pinamamahalaan ang dependencies sa pagitan ng mga serbisyo?
5. Ano ang mga konsiderasyon para sa multi-region deployments?

### Modyul 4: Pre-Deployment Validation (Linggo 5)
- Ipatupad ang komprehensibong mga tseke bago i-deploy
- Maging bihasa sa pagpaplano ng kapasidad at pagpapatunay ng mga resource
- Unawain ang pagpili ng SKU at pag-optimize ng gastos
- Magtayo ng awtomatikong mga pipeline ng pag-validate

#### Mga Pangunahing Konsepto na Dapat Mabisang Matutunan
- Mga quota at limitasyon ng mga Azure resource
- Mga pamantayan sa pagpili ng SKU at mga implikasyon sa gastos
- Awtomatikong mga script at tool para sa pag-validate
- Mga metodolohiya ng pagpaplano ng kapasidad
- Pagsusuri sa pagganap at pag-optimize

#### Mga Ehersisyong Pang-praktis

**Ehersisyo 4.1: Pagpaplano ng Kapasidad**
```bash
# Ipatupad ang pagpapatunay ng kapasidad:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Ehersisyo 4.2: Paunang Pagpapatunay**
```powershell
# Bumuo ng komprehensibong pipeline ng pagpapatunay:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Ehersisyo 4.3: Pag-optimize ng SKU**
```bash
# I-optimize ang mga konfigurasyon ng serbisyo:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Mga Tanong para sa Sariling Pagsusuri
1. Anong mga salik ang dapat makaapekto sa mga desisyon sa pagpili ng SKU?
2. Paano mo pinapatunayan ang availability ng mga Azure resource bago mag-deploy?
3. Ano ang mga pangunahing bahagi ng isang sistema para sa paunang tseke?
4. Paano mo tinatantya at kinokontrol ang mga gastos sa deployment?
5. Anong pagsubaybay ang mahalaga para sa pagpaplano ng kapasidad?

### Modyul 5: Troubleshooting at Debugging (Linggo 6)

#### Mga Layunin sa Pagkatuto
- Maging bihasa sa sistematikong metodolohiya ng troubleshooting
- Paunlarin ang kadalubhasaan sa pag-debug ng kumplikadong mga isyu sa deployment
- Magpatupad ng komprehensibong pagsubaybay at pag-alerto
- Bumuo ng mga pamamaraan ng pagtugon sa insidente at pagbawi

#### Mga Pangunahing Konsepto na Dapat Mabisang Matutunan
- Karaniwang mga pattern ng pagkabigo ng deployment
- Mga teknik sa pagsusuri ng log at korelasyon
- Pagsubaybay sa pagganap at pag-optimize
- Pag-detect at pagtugon sa mga security incident
- Pagbawi mula sa sakuna at pagpapatuloy ng negosyo

#### Mga Ehersisyong Pang-praktis

**Ehersisyo 5.1: Mga Senaryong Pag-troubleshoot**
```bash
# Magsanay sa paglutas ng mga karaniwang isyu:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Ehersisyo 5.2: Implementasyon ng Monitoring**
```bash
# Itakda ang komprehensibong pagmamanman:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Ehersisyo 5.3: Pagtugon sa Insidente**
```bash
# Bumuo ng mga pamamaraan para sa pagtugon sa insidente:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Mga Tanong para sa Sariling Pagsusuri
1. Ano ang sistematikong paraan sa pag-troubleshoot ng mga azd deployment?
2. Paano mo kinokorelasyon ang mga log sa pagitan ng maraming serbisyo at mga resource?
3. Aling mga monitoring metric ang pinaka-krusyal para sa maagang pagtuklas ng problema?
4. Paano ka magpapatupad ng epektibong mga pamamaraan ng disaster recovery?
5. Ano ang mga pangunahing bahagi ng isang plano ng pagtugon sa insidente?

### Modyul 6: Mga Advanced na Paksa at Pinakamahuhusay na Praktika (Linggo 7-8)

#### Mga Layunin sa Pagkatuto
- Magpatupad ng mga deployment pattern na pang-enterprise
- Maging dalubhasa sa integrasyon at awtomasyon ng CI/CD
- Bumuo ng mga custom na template at mag-ambag sa komunidad
- Unawain ang mga advanced na kinakailangan sa seguridad at pagsunod

#### Mga Pangunahing Konsepto na Dapat Mabisang Matutunan
- Mga pattern ng integrasyon ng CI/CD pipeline
- Pag-develop at pamamahagi ng custom na mga template
- Pamamahala at pagsunod para sa enterprise
- Mga advanced na network at configuration ng seguridad
- Pag-optimize ng pagganap at pamamahala ng gastos

#### Mga Ehersisyong Pang-praktis

**Ehersisyo 6.1: Integrasyon ng CI/CD**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Ehersisyo 6.2: Pag-develop ng Custom na Template**
```bash
# Lumikha at ilathala ang mga pasadyang template:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Ehersisyo 6.3: Implementasyon sa Enterprise**
```bash
# Magpatupad ng mga tampok na pang-enterprise:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Mga Tanong para sa Sariling Pagsusuri
1. Paano mo i-iintegrate ang azd sa umiiral na mga daloy ng trabaho ng CI/CD?
2. Ano ang mga pangunahing konsiderasyon sa pag-develop ng custom na template?
3. Paano mo ipinatutupad ang governance at compliance sa mga azd deployment?
4. Ano ang mga pinakamahuhusay na praktika para sa enterprise-scale na mga deployment?
5. Paano ka epektibong makapag-aambag sa komunidad ng azd?

## Mga Praktikal na Proyekto

### Proyekto 1: Personal na Portfolio na Website
**Kompleksidad**: Baguhan  
**Tagal**: 1-2 linggo

Buuin at i-deploy ang isang personal na portfolio na website gamit ang:
- Pagho-host ng static na website sa Azure Storage
- Konfigurasyon ng custom na domain
- Integrasyon ng CDN para sa pandaigdigang pagganap
- Awtomatikong deployment pipeline

**Mga Ihahain**:
- Gumaganang website na na-deploy sa Azure
- Custom na azd template para sa mga deployment ng portfolio
- Dokumentasyon ng proseso ng deployment
- Pagsusuri sa gastos at mga rekomendasyon para sa pag-optimize

### Proyekto 2: Aplikasyon para sa Pamamahala ng Gawain
**Kompleksidad**: Katamtaman  
**Tagal**: 2-3 linggo

Gumawa ng full-stack na aplikasyon para sa pamamahala ng gawain na may:
- React frontend na na-deploy sa App Service
- Node.js API backend na may authentication
- PostgreSQL database na may migrations
- Pagsubaybay gamit ang Application Insights

**Mga Ihahain**:
- Kumpletong aplikasyon na may user authentication
- Database schema at mga script para sa migration
- Mga dashboard para sa pagsubaybay at mga patakaran sa pag-alerto
- Konfigurasyon para sa deployment sa maraming environment

### Proyekto 3: Microservices na E-commerce Plataporma
**Kompleksidad**: Mataas  
**Tagal**: 4-6 linggo

Idisenyo at ipatupad ang isang e-commerce plataporma na batay sa microservices:
- Maramihang mga API service (catalog, orders, payments, users)
- Integrasyon ng message queue gamit ang Service Bus
- Redis cache para sa pag-optimize ng pagganap
- Komprehensibong logging at pagsubaybay

**Halimbawa na Sanggunian**: Tingnan ang [Microservices Architecture](../../../examples/container-app/microservices) para sa isang production-ready na template at gabay sa deployment

**Mga Ihahain**:
- Kumpletong arkitektura ng microservices
- Mga pattern ng komunikasyon sa pagitan ng mga serbisyo
- Pagsusuri sa pagganap at pag-optimize
- Implementasyon ng seguridad na handa para sa production

## Pagtatasa at Sertipikasyon

### Mga Pagsusuri ng Kaalaman

Kumpletuhin ang mga pagtatasa na ito pagkatapos ng bawat modyul:

**Pagtatasa ng Modyul 1**: Mga pangunahing konsepto at instalasyon
- Mga tanong na multiple choice tungkol sa mga pangunahing konsepto
- Praktikal na mga gawain sa instalasyon at konfigurasyon
- Simpleng ehersisyo sa deployment

**Pagtatasa ng Modyul 2**: Konfigurasyon at mga environment
- Mga senaryo sa pamamahala ng environment
- Mga ehersisyong pag-troubleshoot ng konfigurasyon
- Pagsasagawa ng mga konfigurasyon sa seguridad

**Pagtatasa ng Modyul 3**: Deployment at provisioning
- Mga hamon sa disenyo ng imprastruktura
- Mga senaryo ng multi-service deployment
- Mga ehersisyo sa pag-optimize ng pagganap

**Pagtatasa ng Modyul 4**: Paunang pag-validate bago ang deployment
- Mga case study sa pagpaplano ng kapasidad
- Mga senaryo ng pag-optimize ng gastos
- Implementasyon ng validation pipeline

**Pagtatasa ng Modyul 5**: Troubleshooting at debugging
- Mga ehersisyo sa diagnosis ng problema
- Mga gawain sa implementasyon ng pagsubaybay
- Mga simulation ng pagtugon sa insidente

**Pagtatasa ng Modyul 6**: Mga advanced na paksa
- Disenyo ng CI/CD pipeline
- Pag-develop ng custom na template
- Mga senaryo ng arkitekturang pang-enterprise

### Pangwakas na Capstone na Proyekto

Idisenyo at ipatupad ang isang kumpletong solusyon na magpapakita ng kahusayan sa lahat ng mga konsepto:

**Mga Kinakailangan**:
- Multi-tier na arkitektura ng aplikasyon
- Maramihang deployment environment
- Komprehensibong pagsubaybay at pag-alerto
- Implementasyon ng seguridad at pagsunod
- Pag-optimize ng gastos at pag-tune ng pagganap
- Kumpletong dokumentasyon at mga runbook

**Pamantayan sa Pagtatasa**:
- Kalidad ng teknikal na implementasyon
- Kumpletong dokumentasyon
- Pagsunod sa seguridad at pinakamahuhusay na praktika
- Pag-optimize ng pagganap at gastos
- Epektibidad ng troubleshooting at pagsubaybay

## Mga Mapagkukunan ng Pag-aaral at Sanggunian

### Opisyal na Dokumentasyon
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Dokumentasyon ng Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Mga Mapagkukunang Pang-komunidad
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Mga Kapaligiran para sa Pagsasanay
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Karagdagang Mga Tool
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Mga Rekomendasyon sa Iskedyul ng Pag-aaral

### Buong-panahong Pag-aaral (8 linggo)
- **Linggo 1-2**: Mga Modyul 1-2 (Pagpapakilala, Konfigurasyon)
- **Linggo 3-4**: Mga Modyul 3-4 (Deployment, Paunang Pag-validate)
- **Linggo 5-6**: Mga Modyul 5-6 (Troubleshooting, Advanced na Paksa)
- **Linggo 7-8**: Mga Praktikal na Proyekto at Pangwakas na Pagtatasa

### Part-Time na Pag-aaral (16 linggo)
- **Linggo 1-4**: Modyul 1 (Pagpapakilala)
- **Linggo 5-7**: Modyul 2 (Konfigurasyon at Mga Environment)
- **Linggo 8-10**: Modyul 3 (Deployment at Provisioning)
- **Linggo 11-12**: Modyul 4 (Paunang Pag-validate)
- **Linggo 13-14**: Modyul 5 (Troubleshooting at Debugging)
- **Linggo 15-16**: Modyul 6 (Mga Advanced na Paksa at Pagtatasa)

---

## Balangkas ng Pagsubaybay sa Progreso at Pagtatasa

### Checklist ng Pagkumpleto ng Kabanata

Subaybayan ang iyong progreso sa bawat kabanata gamit ang mga nasusukat na resulta na ito:

#### 📚 Kabanata 1: Pundasyon at Mabilisang Pagsisimula
- [ ] **Instalasyon Kumpleto**: Na-install at napatunayan ang AZD sa iyong platform
- [ ] **Unang Deployment**: Matagumpay na na-deploy ang todo-nodejs-mongo template
- [ ] **Pag-set up ng Environment**: Nakonpigura ang unang mga environment variable
- [ ] **Pag-navigate ng Mga Resource**: Na-explore ang mga na-deploy na resource sa Azure Portal
- [ ] **Kasanayan sa Command**: Kumportable sa mga pangunahing AZD command

#### 🤖 Kabanata 2: Pag-develop na Inuuna ang AI
- [ ] **Deployment ng AI Template**: Matagumpay na na-deploy ang azure-search-openai-demo
- [ ] **Implementasyon ng RAG**: Nakonpigura ang pag-index at retrieval ng dokumento
- [ ] **Pagkonpigura ng Modelo**: Naitakda ang maraming AI model para sa iba't ibang layunin
- [ ] **AI Monitoring**: Ipinatupad ang Application Insights para sa mga AI workload
- [ ] **Pag-optimize ng Pagganap**: Naayos ang pagganap ng AI application

#### ⚙️ Kabanata 3: Konfigurasyon at Pagpapatunay
- [ ] **Pag-set up ng Maramihang Environment**: Nakonpigura ang dev, staging, at prod na mga environment
- [ ] **Implementasyon ng Seguridad**: Naitakda ang managed identity authentication
- [ ] **Pamamahala ng Mga Sekreto**: Inintegrate ang Azure Key Vault para sa sensitibong data
- [ ] **Pamamahala ng Parameter**: Nilikha ang mga konfigurasyong tukoy sa environment
- [ ] **Kasanayan sa Pagpapatunay**: Ipinatupad ang mga secure na pattern ng access

#### 🏗️ Kabanata 4: Imprastruktura bilang Code at Deployment
- [ ] **Paglikha ng Custom na Template**: Nagtayo ng multi-service application template
- [ ] **Kasanayan sa Bicep**: Nilikha ang modular, reusable na mga component ng imprastruktura
- [ ] **Awtomasyon ng Deployment**: Ipinatupad ang pre/post deployment hooks
- [ ] **Disenyo ng Arkitektura**: Na-deploy ang kumplikadong arkitektura ng microservices
- [ ] **Pag-optimize ng Template**: In-optimize ang mga template para sa pagganap at gastos

#### 🎯 Kabanata 5: Mga Solusyong Multi-Agent AI
- [ ] **Deployment ng Retail na Solusyon**: Na-deploy ang kumpletong multi-agent retail scenario
- [ ] **Pag-customize ng Agent**: Binago ang mga behavior ng Customer at Inventory agent
- [ ] **Pag-scale ng Arkitektura**: Ipinatupad ang load balancing at auto-scaling
- [ ] **Monitoring sa Production**: Naitakda ang komprehensibong pagsubaybay at pag-alerto
- [ ] **Pag-tune ng Pagganap**: In-optimize ang pagganap ng multi-agent system

#### 🔍 Kabanata 6: Paunang Pag-validate at Pagpaplano bago ang Deployment
- [ ] **Pagsusuri ng Kapasidad**: Sinuri ang mga kinakailangan sa resource para sa mga aplikasyon
- [ ] **Pag-optimize ng SKU**: Pinili ang mga cost-effective na service tier
- [ ] **Awtomasyon ng Pag-validate**: Ipinatupad ang mga script para sa pre-deployment checks
- [ ] **Pagpaplano ng Gastos**: Nilikha ang mga pagtatantya ng gastos sa deployment at badyet
- [ ] **Pagsusuri ng Panganib**: Natukoy at nabawasan ang mga panganib sa deployment

#### 🚨 Kabanata 7: Troubleshooting at Pag-debug
- [ ] **Kasanayan sa Diagnostiko**: Matagumpay na na-debug ang mga sinadyang sirang deployment
- [ ] **Pagsusuri ng Log**: Epektibong ginamit ang Azure Monitor at Application Insights
- [ ] **Pag-tune ng Pagganap**: In-optimize ang mga aplikasyon na mabagal ang takbo
- [ ] **Mga Pamamaraan sa Pagbawi**: Ipinatupad ang backup at disaster recovery
- [ ] **Pag-set up ng Monitoring**: Nilikha ang proactive na pagsubaybay at pag-alerto

#### 🏢 Kabanata 8: Mga Pattern sa Production at Enterprise
- [ ] **Seguridad sa Enterprise**: Ipinatupad ang komprehensibong mga pattern ng seguridad
- [ ] **Balangkas ng Pamamahala**: Naitakda ang Azure Policy at pamamahala ng resource
- [ ] **Advanced na Pagsubaybay**: Nilikha ang mga dashboard at awtomatikong pag-alerto
- [ ] **Integrasyon ng CI/CD**: Nagtayo ng mga awtomatikong pipeline ng deployment
- [ ] **Implementasyon ng Pagsunod**: Tinugunan ang mga kinakailangan sa pagsunod ng enterprise

### Timeline ng Pagkatuto at Mga Milestone

#### Linggo 1-2: Pagbuo ng Pundasyon
- **Milestone**: I-deploy ang unang AI application gamit ang AZD
- **Validation**: Gumagana ang aplikasyon at naa-access via public URL
- **Kasanayan**: Mga pangunahing workflow ng AZD at integrasyon ng AI service

#### Linggo 3-4: Kasanayan sa Konfigurasyon
- **Milestone**: Multi-environment deployment na may secure authentication
- **Validation**: Parehong aplikasyon na-deploy sa dev/staging/prod
- **Kasanayan**: Pamamahala ng environment at pagpapatupad ng seguridad

#### Linggo 5-6: Ekspertis sa Imprastruktura
- **Milestone**: Custom na template para sa kumplikadong multi-service application
- **Validation**: Reusable na template na na-deploy ng ibang miyembro ng koponan
- **Kasanayan**: Kasanayan sa Bicep at awtomasyon ng imprastruktura

#### Linggo 7-8: Advanced na Implementasyon ng AI
- **Milestone**: Production-ready na multi-agent AI solution
- **Validation**: Sistemang nakakahawak ng totoong load na may pagsubaybay
- **Kasanayan**: Orkestrasyon ng multi-agent at pag-optimize ng pagganap

#### Linggo 9-10: Kahandaan para sa Production
- **Milestone**: Enterprise-grade na deployment na may kumpletong pagsunod
- **Validation**: Pumasa sa security review at audit sa pag-optimize ng gastos
- **Kasanayan**: Pamamahala, pagsubaybay, at integrasyon ng CI/CD

### Pagtatasa at Sertipikasyon

#### Mga Paraan ng Pagpapatunay ng Kaalaman
1. Praktikal na Pag-deploy: Gumaganang aplikasyon para sa bawat kabanata
2. Mga Code Review: Pagtatasa ng kalidad ng template at konfigurasyon
3. Paglutas ng Problema: Mga senaryo ng troubleshooting at mga solusyon
4. Pagtuturo sa Kapwa: Ipaliwanag ang mga konsepto sa ibang mga nag-aaral
5. Ambag sa Komunidad: Magbahagi ng mga template o pagpapabuti

#### Mga Kinalabasan ng Propesyonal na Pag-unlad
- **Mga Proyektong Portfolio**: 8 mga deployment na handa para sa produksyon
- **Mga Teknikal na Kasanayan**: Ekspertis sa AZD at AI deployment na alinsunod sa pamantayan ng industriya
- **Kakayahan sa Paglutas ng Problema**: Nakakapag-troubleshoot at mag-optimize nang mag-isa
- **Pagkilala mula sa Komunidad**: Aktibong pakikilahok sa komunidad ng mga developer ng Azure
- **Pagsulong sa Karera**: Mga kasanayang direktang magagamit sa cloud at AI na mga tungkulin

#### Mga Sukatan ng Tagumpay
- **Rate ng Tagumpay ng Deployment**: >95% matagumpay na deployment
- **Oras ng Pag-troubleshoot**: <30 minuto para sa mga karaniwang isyu
- **Pag-optimize ng Performance**: Mapapatunayang pagpapabuti sa gastos at performance
- **Pagsunod sa Seguridad**: Lahat ng deployment ay tumutugon sa mga pamantayan sa seguridad ng enterprise
- **Paglilipat ng Kaalaman**: Kakayahang mag-mentor ng ibang mga developer

### Patuloy na Pagkatuto at Pakikilahok sa Komunidad

#### Manatiling Napapanahon
- **Mga Update ng Azure**: Sundan ang release notes ng Azure Developer CLI
- **Mga Kaganapan sa Komunidad**: Lumahok sa mga kaganapan ng mga developer ng Azure at AI
- **Dokumentasyon**: Mag-ambag sa dokumentasyon at mga halimbawa ng komunidad
- **Feedback Loop**: Magbigay ng puna sa nilalaman ng kurso at mga serbisyo ng Azure

#### Pagpapaunlad ng Karera
- **Propesyonal na Network**: Kumonekta sa mga eksperto sa Azure at AI
- **Mga Oportunidad sa Pagsasalita**: Ibahagi ang mga natutunan sa mga kumperensya o meetups
- **Ambag sa Open Source**: Mag-ambag sa mga AZD template at mga tool
- **Mentorship**: Gabayan ang ibang mga developer sa kanilang paglalakbay sa pag-aaral ng AZD

---

**Pag-navigate ng Kabanata:**
- **📚 Home ng Kurso**: [AZD Para sa mga Nagsisimula](../README.md)
- **📖 Magsimulang Matuto**: [Kabanata 1: Pundasyon at Mabilis na Pagsisimula](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Pagsubaybay sa Pag-unlad**: Subaybayan ang iyong pag-usad sa pamamagitan ng komprehensibong 8-kabanatang sistema ng pag-aaral
- **🤝 Komunidad**: [Discord ng Azure](https://discord.gg/microsoft-azure) para sa suporta at diskusyon

**Pagsubaybay sa Pag-unlad ng Pag-aaral**: Gamitin ang estrukturadong gabay na ito upang pag-aralan nang lubusan ang Azure Developer CLI sa pamamagitan ng progresibo, praktikal na pagkatuto na may nasusukat na mga resulta at benepisyo sa pag-unlad ng propesyon.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtanggi ng Pananagutan**:
Ang dokumentong ito ay isinalin gamit ang serbisyong pagsasalin na gumagamit ng AI [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi tumpak na impormasyon. Ang orihinal na dokumento sa likas nitong wika ang dapat ituring na awtoritatibong sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaintindihan o maling interpretasyon na nagmumula sa paggamit ng salin na ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
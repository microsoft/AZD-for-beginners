# Gabay sa Pag-aaral - Komprehensibong Layunin sa Pagkatuto

**Pag-navigate sa Learning Path**
- **📚 Home ng Kurso**: [AZD Para sa Mga Baguhan](../README.md)
- **📖 Simulan ang Pag-aaral**: [Kabanata 1: Pundasyon at Mabilisang Simula](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Pagsubaybay sa Pag-unlad**: [Pagkumpleto ng Kurso](../README.md#-course-completion--certification)

## Panimula

Ang komprehensibong gabay sa pag-aaral na ito ay nagbibigay ng maayos na layunin sa pagkatuto, mahahalagang konsepto, mga pagsasanay, at materyales sa pagsusuri upang matulungan kang ma-master ang Azure Developer CLI (azd). Gamitin ang gabay na ito upang subaybayan ang iyong progreso at tiyaking natutunan mo ang lahat ng mahahalagang paksa.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng gabay na ito, ikaw ay:
- Magiging bihasa sa lahat ng pangunahing at advanced na konsepto ng Azure Developer CLI
- Magkakaroon ng praktikal na kasanayan sa pag-deploy at pamamahala ng mga Azure application
- Magkakaroon ng kumpiyansa sa pag-troubleshoot at pag-optimize ng mga deployment
- Maiintindihan ang mga praktika sa production-ready deployment at mga konsiderasyon sa seguridad

## Mga Resulta ng Pagkatuto

Pagkatapos makumpleto ang lahat ng seksyon ng gabay na ito, magagawa mo:
- Magdisenyo, mag-deploy, at mag-manage ng kumpletong application architectures gamit ang azd
- Magpatupad ng komprehensibong monitoring, seguridad, at mga estratehiya sa cost optimization
- Mag-troubleshoot ng mga komplikadong isyu sa deployment nang mag-isa
- Gumawa ng mga custom na template at mag-ambag sa komunidad ng azd

## 8-Kabanatang Estruktura ng Pagkatuto

### Kabanata 1: Pundasyon at Mabilisang Simula (Linggo 1)
**Tagal**: 30-45 minuto | **Kompleksidad**: ⭐

#### Mga Layunin sa Pagkatuto
- Maunawaan ang mga pangunahing konsepto at terminolohiya ng Azure Developer CLI
- Matagumpay na mai-install at ma-configure ang AZD sa iyong development platform
- Ma-deploy ang iyong unang application gamit ang isang umiiral na template
- Mabisang mag-navigate sa AZD command-line interface

#### Mahahalagang Konsepto na Dapat Ma-master
- Estruktura ng proyekto ng AZD at mga bahagi nito (azure.yaml, infra/, src/)
- Mga workflow sa deployment na batay sa template
- Mga pangunahing kaalaman sa configuration ng environment
- Pamamahala ng resource group at subscription

#### Mga Praktikal na Pagsasanay
1. **Pag-verify ng Installation**: I-install ang AZD at i-verify gamit ang `azd version`
2. **Unang Deployment**: Matagumpay na i-deploy ang todo-nodejs-mongo template
3. **Setup ng Environment**: I-configure ang iyong unang environment variables
4. **Pag-explore ng Resource**: Mag-navigate sa mga na-deploy na resources sa Azure Portal

#### Mga Tanong sa Pagsusuri
- Ano ang mga pangunahing bahagi ng isang AZD project?
- Paano mo ini-initialize ang isang bagong proyekto mula sa template?
- Ano ang pagkakaiba ng `azd up` at `azd deploy`?
- Paano mo pinamamahalaan ang maraming environment gamit ang AZD?

---

### Kabanata 2: AI-First Development (Linggo 2)
**Tagal**: 1-2 oras | **Kompleksidad**: ⭐⭐

#### Mga Layunin sa Pagkatuto
- Isama ang Microsoft Foundry services sa mga workflow ng AZD
- Mag-deploy at mag-configure ng mga AI-powered application
- Maunawaan ang mga pattern ng implementasyon ng RAG (Retrieval-Augmented Generation)
- Pamahalaan ang mga deployment ng AI model at scaling

#### Mahahalagang Konsepto na Dapat Ma-master
- Integrasyon ng Azure OpenAI service at pamamahala ng API
- Configuration ng AI Search at vector indexing
- Mga estratehiya sa deployment ng model at capacity planning
- Monitoring ng AI application at pag-optimize ng performance

#### Mga Praktikal na Pagsasanay
1. **Deployment ng AI Chat**: I-deploy ang azure-search-openai-demo template
2. **Implementasyon ng RAG**: I-configure ang document indexing at retrieval
3. **Configuration ng Model**: Mag-set up ng maraming AI models para sa iba't ibang layunin
4. **Monitoring ng AI**: Magpatupad ng Application Insights para sa AI workloads

#### Mga Tanong sa Pagsusuri
- Paano mo kino-configure ang Azure OpenAI services sa isang AZD template?
- Ano ang mga pangunahing bahagi ng isang RAG architecture?
- Paano mo pinamamahalaan ang kapasidad at scaling ng AI model?
- Anong mga monitoring metrics ang mahalaga para sa AI applications?

---

### Kabanata 3: Configuration at Authentication (Linggo 3)
**Tagal**: 45-60 minuto | **Kompleksidad**: ⭐⭐

#### Mga Layunin sa Pagkatuto
- Ma-master ang mga estratehiya sa configuration at pamamahala ng environment
- Magpatupad ng secure authentication patterns at managed identity
- Mag-organisa ng mga resources gamit ang tamang naming conventions
- Mag-configure ng multi-environment deployments (dev, staging, prod)

#### Mahahalagang Konsepto na Dapat Ma-master
- Hierarchy ng environment at configuration precedence
- Managed identity at service principal authentication
- Integrasyon ng Key Vault para sa pamamahala ng mga secrets
- Pamamahala ng environment-specific parameters

#### Mga Praktikal na Pagsasanay
1. **Setup ng Multi-Environment**: I-configure ang dev, staging, at prod environments
2. **Configuration ng Seguridad**: Magpatupad ng managed identity authentication
3. **Pamamahala ng Secrets**: Isama ang Azure Key Vault para sa sensitibong data
4. **Pamamahala ng Parameter**: Gumawa ng environment-specific configurations

#### Mga Tanong sa Pagsusuri
- Paano mo kino-configure ang iba't ibang environment gamit ang AZD?
- Ano ang mga benepisyo ng paggamit ng managed identity kumpara sa service principals?
- Paano mo securely pinamamahalaan ang application secrets?
- Ano ang hierarchy ng configuration sa AZD?

---

### Kabanata 4: Infrastructure as Code at Deployment (Linggo 4-5)
**Tagal**: 1-1.5 oras | **Kompleksidad**: ⭐⭐⭐

#### Mga Layunin sa Pagkatuto
- Gumawa at mag-customize ng Bicep infrastructure templates
- Magpatupad ng advanced deployment patterns at workflows
- Maunawaan ang mga estratehiya sa resource provisioning
- Magdisenyo ng scalable multi-service architectures

- Mag-deploy ng containerized applications gamit ang Azure Container Apps at AZD

#### Mahahalagang Konsepto na Dapat Ma-master
- Estruktura ng Bicep template at mga best practices
- Mga dependencies ng resource at pagkakasunod-sunod ng deployment
- Mga parameter files at modularity ng template
- Custom hooks at automation ng deployment
- Mga pattern ng deployment ng container app (quick start, production, microservices)

#### Mga Praktikal na Pagsasanay
1. **Paglikha ng Custom Template**: Gumawa ng multi-service application template
2. **Mastery ng Bicep**: Gumawa ng modular, reusable infrastructure components
3. **Automation ng Deployment**: Magpatupad ng pre/post deployment hooks
4. **Disenyo ng Arkitektura**: Mag-deploy ng complex microservices architecture
5. **Deployment ng Container App**: I-deploy ang [Simple Flask API](../../../examples/container-app/simple-flask-api) at [Microservices Architecture](../../../examples/container-app/microservices) examples gamit ang AZD

#### Mga Tanong sa Pagsusuri
- Paano ka gumagawa ng custom Bicep templates para sa AZD?
- Ano ang mga best practices sa pag-organisa ng infrastructure code?
- Paano mo hinahandle ang mga dependencies ng resource sa templates?
- Anong mga pattern ng deployment ang sumusuporta sa zero-downtime updates?

---

### Kabanata 5: Multi-Agent AI Solutions (Linggo 6-7)
**Tagal**: 2-3 oras | **Kompleksidad**: ⭐⭐⭐⭐

#### Mga Layunin sa Pagkatuto
- Magdisenyo at magpatupad ng multi-agent AI architectures
- Mag-orchestrate ng coordination at communication ng agent
- Mag-deploy ng production-ready AI solutions na may monitoring
- Maunawaan ang specialization ng agent at mga workflow patterns
- Isama ang containerized microservices bilang bahagi ng multi-agent solutions

#### Mahahalagang Konsepto na Dapat Ma-master
- Mga pattern ng multi-agent architecture at prinsipyo ng disenyo
- Mga protocol ng komunikasyon ng agent at daloy ng data
- Mga estratehiya sa load balancing at scaling para sa AI agents
- Monitoring ng production para sa multi-agent systems
- Komunikasyon ng service-to-service sa containerized environments

#### Mga Praktikal na Pagsasanay
1. **Deployment ng Retail Solution**: I-deploy ang kumpletong multi-agent retail scenario
2. **Customization ng Agent**: I-modify ang mga behavior ng Customer at Inventory agent
3. **Scaling ng Arkitektura**: Magpatupad ng load balancing at auto-scaling
4. **Monitoring ng Production**: Mag-set up ng komprehensibong monitoring at alerting
5. **Integrasyon ng Microservices**: Palawakin ang [Microservices Architecture](../../../examples/container-app/microservices) example upang suportahan ang agent-based workflows

#### Mga Tanong sa Pagsusuri
- Paano ka nagdidisenyo ng epektibong mga pattern ng komunikasyon ng multi-agent?
- Ano ang mga pangunahing konsiderasyon para sa scaling ng AI agent workloads?
- Paano mo mino-monitor at dine-debug ang multi-agent AI systems?
- Anong mga production patterns ang nagsisiguro ng reliability para sa AI agents?

---

### Kabanata 6: Pre-Deployment Validation at Planning (Linggo 8)
**Tagal**: 1 oras | **Kompleksidad**: ⭐⭐

#### Mga Layunin sa Pagkatuto
- Magsagawa ng komprehensibong capacity planning at resource validation
- Pumili ng optimal na Azure SKUs para sa cost-effectiveness
- Magpatupad ng automated pre-flight checks at validation
- Magplano ng deployments gamit ang mga estratehiya sa cost optimization

#### Mahahalagang Konsepto na Dapat Ma-master
- Mga quota ng Azure resource at mga limitasyon sa kapasidad
- Mga pamantayan sa pagpili ng SKU at cost optimization
- Mga automated validation scripts at testing
- Pagpaplano ng deployment at risk assessment

#### Mga Praktikal na Pagsasanay
1. **Pagsusuri ng Kapasidad**: Suriin ang mga kinakailangan sa resource para sa iyong mga application
2. **Optimization ng SKU**: Ihambing at pumili ng cost-effective na service tiers
3. **Automation ng Validation**: Magpatupad ng pre-deployment check scripts
4. **Pagpaplano ng Gastos**: Gumawa ng mga pagtatantya ng deployment cost at budget

#### Mga Tanong sa Pagsusuri
- Paano mo vinalidate ang kapasidad ng Azure bago ang deployment?
- Anong mga salik ang nakakaapekto sa mga desisyon sa pagpili ng SKU?
- Paano mo ina-automate ang pre-deployment validation?
- Anong mga estratehiya ang nakakatulong sa pag-optimize ng deployment costs?

---

### Kabanata 7: Troubleshooting at Debugging (Linggo 9)
**Tagal**: 1-1.5 oras | **Kompleksidad**: ⭐⭐

#### Mga Layunin sa Pagkatuto
- Bumuo ng sistematikong mga approach sa debugging para sa AZD deployments
- Lutasin ang mga karaniwang isyu sa deployment at configuration
- Mag-debug ng mga AI-specific na problema at isyu sa performance
- Magpatupad ng monitoring at alerting para sa proactive na pag-detect ng isyu

#### Mahahalagang Konsepto na Dapat Ma-master
- Mga teknik sa diagnostic at mga estratehiya sa logging
- Mga karaniwang pattern ng failure at kanilang mga solusyon
- Monitoring ng performance at optimization
- Mga pamamaraan sa incident response at recovery

#### Mga Praktikal na Pagsasanay
1. **Mga Kasanayan sa Diagnostic**: Mag-practice gamit ang intentionally broken deployments
2. **Pagsusuri ng Log**: Gamitin ang Azure Monitor at Application Insights nang epektibo
3. **Pag-tune ng Performance**: Mag-optimize ng mga application na mabagal ang performance
4. **Mga Pamamaraan sa Recovery**: Magpatupad ng backup at disaster recovery

#### Mga Tanong sa Pagsusuri
- Ano ang mga pinakakaraniwang failure sa AZD deployment?
- Paano mo dine-debug ang mga isyu sa authentication at permission?
- Anong mga estratehiya sa monitoring ang nakakatulong sa pag-iwas sa mga isyu sa production?
- Paano mo ina-optimize ang performance ng application sa Azure?

---

### Kabanata 8: Production at Enterprise Patterns (Linggo 10-11)
**Tagal**: 2-3 oras | **Kompleksidad**: ⭐⭐⭐⭐

#### Mga Layunin sa Pagkatuto
- Magpatupad ng mga estratehiya sa enterprise-grade deployment
- Magdisenyo ng mga pattern sa seguridad at compliance frameworks
- Magtatag ng monitoring, governance, at cost management
- Gumawa ng scalable CI/CD pipelines na may integrasyon ng AZD
- Magpatupad ng mga best practices para sa production container app deployments (seguridad, monitoring, gastos, CI/CD)

#### Mahahalagang Konsepto na Dapat Ma-master
- Mga kinakailangan sa seguridad at compliance ng enterprise
- Mga framework ng governance at implementasyon ng policy
- Advanced monitoring at cost management
- Integrasyon ng CI/CD at automated deployment pipelines
- Mga estratehiya sa blue-green at canary deployment para sa containerized workloads

#### Mga Praktikal na Pagsasanay
1. **Seguridad ng Enterprise**: Magpatupad ng komprehensibong mga pattern sa seguridad
2. **Framework ng Governance**: Mag-set up ng Azure Policy at pamamahala ng resource
3. **Advanced Monitoring**: Gumawa ng mga dashboard at automated alerting
4. **Integrasyon ng CI/CD**: Bumuo ng automated deployment pipelines
5. **Production Container Apps**: Magpatupad ng seguridad, monitoring, at cost optimization sa [Microservices Architecture](../../../examples/container-app/microservices) example

#### Mga Tanong sa Pagsusuri
- Paano mo ipinatutupad ang seguridad ng enterprise sa AZD deployments?
- Anong mga pattern ng governance ang nagsisiguro ng compliance at cost control?
- Paano mo dinisenyo ang scalable monitoring para sa production systems?
- Anong mga pattern ng CI/CD ang pinakamahusay na gumagana sa AZD workflows?

#### Mga Layunin sa Pagkatuto
- Maunawaan ang mga pangunahing konsepto ng Azure Developer CLI
- Matagumpay na mai-install at ma-configure ang azd sa iyong development environment
- Kumpletuhin ang iyong unang deployment gamit ang isang umiiral na template
- Mag-navigate sa estruktura ng azd project at maunawaan ang mga pangunahing bahagi

#### Mahahalagang Konsepto na Dapat Ma-master
- Mga template, environment, at serbisyo
- Estruktura ng configuration ng azure.yaml
- Mga pangunahing utos ng azd (init, up, down, deploy)
- Mga prinsipyo ng Infrastructure as Code
- Azure authentication at authorization

#### Mga Pagsasanay

**Pagsasanay 1.1: Installation at Setup**
```bash
# Kumpletuhin ang mga gawaing ito:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Pagsasanay 1.2: Unang Deployment**
```bash
# Mag-deploy ng isang simpleng web application:
1. Initialize project: azd init --template todo-nodejs-mongo
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

#### Mga Tanong sa Sariling Pagsusuri
1. Ano ang tatlong pangunahing konsepto ng azd architecture?
2. Ano ang layunin ng azure.yaml file?
3. Paano nakakatulong ang mga environment sa pamamahala ng iba't ibang deployment targets?
4. Anong mga authentication methods ang maaaring gamitin sa azd?
5. Ano ang nangyayari kapag nag-run ka ng `azd up` sa unang pagkakataon?

---

## Pagsubaybay sa Progreso at Framework ng Pagsusuri
```bash
# Lumikha at i-configure ang maraming kapaligiran:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Pagsasanay 2.2: Advanced Configuration**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Pagsasanay 2.3: Configuration ng Seguridad**
```bash
# Ipatupad ang pinakamahusay na mga kasanayan sa seguridad:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Mga Tanong sa Sariling Pagsusuri
1. Paano hinahandle ng azd ang environment variable precedence?
2. Ano ang mga deployment hooks at kailan mo dapat gamitin ang mga ito?
3. Paano mo kino-configure ang iba't ibang SKUs para sa iba't ibang environment?
4. Ano ang mga implikasyon sa seguridad ng iba't ibang authentication methods?
5. Paano mo pinamamahalaan ang mga secrets at sensitibong configuration data?

### Module 3: Deployment at Provisioning (Linggo 4)

#### Mga Layunin sa Pagkatuto
- Ma-master ang mga workflow sa deployment at best practices
- Maunawaan ang Infrastructure as Code gamit ang Bicep templates
- Magpatupad ng mga komplikadong multi-service architectures
- Mag-optimize ng performance at reliability ng deployment

#### Mahahalagang Konsepto na Dapat Ma-master
- Estruktura ng Bicep template at mga modules
- Mga dependencies ng resource at pagkakasunod-sunod
- Mga estratehiya sa deployment (blue-green, rolling updates)
- Mga deployment sa multi-region
- Mga database migrations at pamamahala ng data

#### Mga Pagsasanay

**Pagsasanay 3.1: Custom Infrastructure**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Pagsasanay 3.2: Multi-Service Application**
```bash
# Mag-deploy ng arkitektura ng microservices:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Pagsasanay 3.3: Integrasyon ng Database**
```bash
# Ipatupad ang mga pattern ng deployment ng database:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Mga Tanong sa Sariling Pagsus
5. Ano ang mga konsiderasyon para sa multi-region deployments?

### Module 4: Pre-Deployment Validation (Linggo 5)

#### Mga Layunin sa Pagkatuto
- Magpatupad ng komprehensibong pre-deployment checks
- Maging bihasa sa capacity planning at resource validation
- Maunawaan ang pagpili ng SKU at pag-optimize ng gastos
- Bumuo ng automated validation pipelines

#### Mga Pangunahing Konsepto na Dapat Matutunan
- Mga quota at limitasyon ng Azure resources
- Mga pamantayan sa pagpili ng SKU at epekto sa gastos
- Mga automated validation script at tools
- Mga pamamaraan sa capacity planning
- Pagsusuri ng performance at pag-optimize

#### Mga Ehersisyo sa Pagsasanay

**Ehersisyo 4.1: Capacity Planning**  
```bash
# Ipatupad ang pagpapatunay ng kapasidad:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**Ehersisyo 4.2: Pre-flight Validation**  
```powershell
# Bumuo ng komprehensibong pipeline ng pagpapatunay:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```
  
**Ehersisyo 4.3: SKU Optimization**  
```bash
# I-optimize ang mga configuration ng serbisyo:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```
  

#### Mga Tanong sa Self-Assessment
1. Anong mga salik ang dapat makaapekto sa mga desisyon sa pagpili ng SKU?
2. Paano mo nava-validate ang availability ng Azure resources bago ang deployment?
3. Ano ang mga pangunahing bahagi ng isang pre-flight check system?
4. Paano mo tinatantiya at kinokontrol ang mga gastos sa deployment?
5. Anong monitoring ang mahalaga para sa capacity planning?

### Module 5: Troubleshooting at Debugging (Linggo 6)

#### Mga Layunin sa Pagkatuto
- Maging bihasa sa sistematikong mga pamamaraan ng troubleshooting
- Magkaroon ng kadalubhasaan sa pag-debug ng mga kumplikadong isyu sa deployment
- Magpatupad ng komprehensibong monitoring at alerting
- Bumuo ng mga pamamaraan para sa incident response at recovery

#### Mga Pangunahing Konsepto na Dapat Matutunan
- Mga karaniwang pattern ng pagkabigo sa deployment
- Mga pamamaraan sa pagsusuri at pag-uugnay ng logs
- Monitoring ng performance at pag-optimize
- Pagtuklas ng insidente sa seguridad at pagtugon
- Disaster recovery at business continuity

#### Mga Ehersisyo sa Pagsasanay

**Ehersisyo 5.1: Troubleshooting Scenarios**  
```bash
# Magsanay sa paglutas ng mga karaniwang isyu:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```
  
**Ehersisyo 5.2: Monitoring Implementation**  
```bash
# Mag-set up ng komprehensibong pagmamanman:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```
  
**Ehersisyo 5.3: Incident Response**  
```bash
# Bumuo ng mga pamamaraan para sa pagtugon sa insidente:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  

#### Mga Tanong sa Self-Assessment
1. Ano ang sistematikong paraan sa pag-troubleshoot ng azd deployments?
2. Paano mo inuugnay ang mga logs sa iba't ibang serbisyo at resources?
3. Anong mga monitoring metrics ang pinakamahalaga para sa maagang pagtuklas ng problema?
4. Paano mo ipinatutupad ang epektibong mga pamamaraan sa disaster recovery?
5. Ano ang mga pangunahing bahagi ng isang incident response plan?

### Module 6: Advanced Topics at Best Practices (Linggo 7-8)

#### Mga Layunin sa Pagkatuto
- Magpatupad ng mga deployment pattern na pang-enterprise
- Maging bihasa sa CI/CD integration at automation
- Bumuo ng mga custom na template at mag-ambag sa komunidad
- Maunawaan ang mga advanced na pangangailangan sa seguridad at pagsunod

#### Mga Pangunahing Konsepto na Dapat Matutunan
- Mga pattern ng CI/CD pipeline integration
- Pagbuo at pamamahagi ng custom na template
- Pamamahala at pagsunod sa enterprise
- Mga advanced na networking at security configurations
- Pag-optimize ng performance at pamamahala ng gastos

#### Mga Ehersisyo sa Pagsasanay

**Ehersisyo 6.1: CI/CD Integration**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```
  
**Ehersisyo 6.2: Custom Template Development**  
```bash
# Lumikha at maglathala ng mga pasadyang template:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**Ehersisyo 6.3: Enterprise Implementation**  
```bash
# Ipatupad ang mga tampok na pang-enterprise:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  

#### Mga Tanong sa Self-Assessment
1. Paano mo ini-integrate ang azd sa umiiral na CI/CD workflows?
2. Ano ang mga pangunahing konsiderasyon sa pagbuo ng custom na template?
3. Paano mo ipinatutupad ang pamamahala at pagsunod sa azd deployments?
4. Ano ang mga best practices para sa mga deployment na pang-enterprise scale?
5. Paano ka epektibong nag-aambag sa azd community?

## Mga Praktikal na Proyekto

### Proyekto 1: Personal Portfolio Website  
**Kumplikado**: Baguhan  
**Tagal**: 1-2 linggo  

Gumawa at mag-deploy ng personal portfolio website gamit ang:
- Static website hosting sa Azure Storage
- Custom domain configuration
- CDN integration para sa global performance
- Automated deployment pipeline  

**Mga Output**:
- Gumaganang website na naka-deploy sa Azure
- Custom na azd template para sa portfolio deployments
- Dokumentasyon ng deployment process
- Mga rekomendasyon sa cost analysis at optimization  

### Proyekto 2: Task Management Application  
**Kumplikado**: Intermediate  
**Tagal**: 2-3 linggo  

Gumawa ng full-stack task management application na may:
- React frontend na naka-deploy sa App Service
- Node.js API backend na may authentication
- PostgreSQL database na may migrations
- Application Insights monitoring  

**Mga Output**:
- Kumpletong application na may user authentication
- Database schema at migration scripts
- Monitoring dashboards at alerting rules
- Multi-environment deployment configuration  

### Proyekto 3: Microservices E-commerce Platform  
**Kumplikado**: Advanced  
**Tagal**: 4-6 linggo  

Disenyo at implementasyon ng microservices-based e-commerce platform:
- Maramihang API services (catalog, orders, payments, users)
- Message queue integration gamit ang Service Bus
- Redis cache para sa performance optimization
- Komprehensibong logging at monitoring  

**Halimbawa ng Sanggunian**: Tingnan ang [Microservices Architecture](../../../examples/container-app/microservices) para sa production-ready template at deployment guide  

**Mga Output**:
- Kumpletong microservices architecture
- Mga pattern ng inter-service communication
- Pagsusuri ng performance at pag-optimize
- Production-ready na implementasyon ng seguridad  

## Pagtatasa at Sertipikasyon

### Mga Pagsusuri sa Kaalaman

Kumpletuhin ang mga pagsusuri pagkatapos ng bawat module:

**Module 1 Assessment**: Mga pangunahing konsepto at pag-install  
- Mga multiple choice na tanong sa core concepts  
- Praktikal na pag-install at configuration tasks  
- Simpleng deployment exercise  

**Module 2 Assessment**: Configuration at environments  
- Mga senaryo sa environment management  
- Mga troubleshooting exercises sa configuration  
- Implementasyon ng security configuration  

**Module 3 Assessment**: Deployment at provisioning  
- Mga hamon sa disenyo ng infrastructure  
- Mga senaryo sa multi-service deployment  
- Mga pagsasanay sa pag-optimize ng performance  

**Module 4 Assessment**: Pre-deployment validation  
- Mga case study sa capacity planning  
- Mga senaryo sa cost optimization  
- Implementasyon ng validation pipeline  

**Module 5 Assessment**: Troubleshooting at debugging  
- Mga pagsasanay sa problem diagnosis  
- Mga task sa monitoring implementation  
- Mga simulation ng incident response  

**Module 6 Assessment**: Advanced topics  
- Disenyo ng CI/CD pipeline  
- Pagbuo ng custom template  
- Mga senaryo sa enterprise architecture  

### Final Capstone Project

Disenyo at implementasyon ng kumpletong solusyon na nagpapakita ng mastery ng lahat ng konsepto:

**Mga Kinakailangan**:
- Multi-tier application architecture  
- Maramihang deployment environments  
- Komprehensibong monitoring at alerting  
- Implementasyon ng seguridad at pagsunod  
- Pag-optimize ng gastos at performance tuning  
- Kumpletong dokumentasyon at runbooks  

**Pamantayan sa Pagsusuri**:
- Kalidad ng teknikal na implementasyon  
- Kumpletong dokumentasyon  
- Pagsunod sa seguridad at best practices  
- Pag-optimize ng performance at gastos  
- Epektibo sa troubleshooting at monitoring  

## Mga Sanggunian at Resources sa Pag-aaral

### Opisyal na Dokumentasyon
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Mga Resource ng Komunidad
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

## Rekomendasyon sa Iskedyul ng Pag-aaral

### Full-Time Study (8 linggo)
- **Linggo 1-2**: Modules 1-2 (Getting Started, Configuration)  
- **Linggo 3-4**: Modules 3-4 (Deployment, Pre-deployment)  
- **Linggo 5-6**: Modules 5-6 (Troubleshooting, Advanced Topics)  
- **Linggo 7-8**: Praktikal na Proyekto at Final Assessment  

### Part-Time Study (16 linggo)
- **Linggo 1-4**: Module 1 (Getting Started)  
- **Linggo 5-7**: Module 2 (Configuration and Environments)  
- **Linggo 8-10**: Module 3 (Deployment and Provisioning)  
- **Linggo 11-12**: Module 4 (Pre-deployment Validation)  
- **Linggo 13-14**: Module 5 (Troubleshooting and Debugging)  
- **Linggo 15-16**: Module 6 (Advanced Topics and Assessment)  

---

## Pagsubaybay sa Progreso at Framework ng Pagtatasa

### Checklist ng Pagkumpleto ng Kabanata

Subaybayan ang iyong progreso sa bawat kabanata gamit ang mga sumusunod na measurable outcomes:

#### 📚 Kabanata 1: Foundation & Quick Start  
- [ ] **Natapos ang Pag-install**: Na-install at na-verify ang AZD sa iyong platform  
- [ ] **Unang Deployment**: Matagumpay na na-deploy ang todo-nodejs-mongo template  
- [ ] **Setup ng Environment**: Na-configure ang unang environment variables  
- [ ] **Pag-navigate sa Resource**: Na-explore ang mga na-deploy na resources sa Azure Portal  
- [ ] **Mastery ng Command**: Kumportable sa mga pangunahing AZD commands  

#### 🤖 Kabanata 2: AI-First Development  
- [ ] **Deployment ng AI Template**: Matagumpay na na-deploy ang azure-search-openai-demo  
- [ ] **Implementasyon ng RAG**: Na-configure ang document indexing at retrieval  
- [ ] **Configuration ng Model**: Na-setup ang maraming AI models na may iba't ibang layunin  
- [ ] **AI Monitoring**: Naipatupad ang Application Insights para sa AI workloads  
- [ ] **Pag-optimize ng Performance**: Na-tune ang performance ng AI application  

#### ⚙️ Kabanata 3: Configuration & Authentication  
- [ ] **Setup ng Multi-Environment**: Na-configure ang dev, staging, at prod environments  
- [ ] **Implementasyon ng Seguridad**: Na-setup ang managed identity authentication  
- [ ] **Pamahala ng Secrets**: Na-integrate ang Azure Key Vault para sa sensitibong data  
- [ ] **Pamahala ng Parameter**: Nalikha ang environment-specific configurations  
- [ ] **Mastery ng Authentication**: Naipatupad ang secure access patterns  

#### 🏗️ Kabanata 4: Infrastructure as Code & Deployment  
- [ ] **Paglikha ng Custom Template**: Naitayo ang multi-service application template  
- [ ] **Mastery ng Bicep**: Nalikha ang modular, reusable infrastructure components  
- [ ] **Automation ng Deployment**: Naipatupad ang pre/post deployment hooks  
- [ ] **Disenyo ng Arkitektura**: Na-deploy ang complex microservices architecture  
- [ ] **Pag-optimize ng Template**: Na-optimize ang templates para sa performance at gastos  

#### 🎯 Kabanata 5: Multi-Agent AI Solutions  
- [ ] **Deployment ng Retail Solution**: Na-deploy ang kumpletong multi-agent retail scenario  
- [ ] **Pag-customize ng Agent**: Na-modify ang Customer at Inventory agent behaviors  
- [ ] **Scaling ng Arkitektura**: Naipatupad ang load balancing at auto-scaling  
- [ ] **Monitoring ng Production**: Na-setup ang komprehensibong monitoring at alerting  
- [ ] **Pag-optimize ng Performance**: Na-optimize ang performance ng multi-agent system  

#### 🔍 Kabanata 6: Pre-Deployment Validation & Planning  
- [ ] **Pagsusuri ng Capacity**: Na-analyze ang resource requirements para sa applications  
- [ ] **Pag-optimize ng SKU**: Napili ang cost-effective service tiers  
- [ ] **Automation ng Validation**: Naipatupad ang pre-deployment check scripts  
- [ ] **Pagpaplano ng Gastos**: Nalikha ang deployment cost estimates at budgets  
- [ ] **Pagtatasa ng Risk**: Natukoy at na-mitigate ang deployment risks  

#### 🚨 Kabanata 7: Troubleshooting & Debugging  
- [ ] **Kasanayan sa Diagnostic**: Matagumpay na na-debug ang intentionally broken deployments  
- [ ] **Pagsusuri ng Log**: Epektibong nagamit ang Azure Monitor at Application Insights  
- [ ] **Pag-optimize ng Performance**: Na-optimize ang mabagal na applications  
- [ ] **Mga Pamamaraan sa Recovery**: Naipatupad ang backup at disaster recovery  
- [ ] **Setup ng Monitoring**: Nalikha ang proactive monitoring at alerting  

#### 🏢 Kabanata 8: Production & Enterprise Patterns  
- [ ] **Seguridad ng Enterprise**: Naipatupad ang komprehensibong security patterns  
- [ ] **Framework ng Pamamahala**: Na-setup ang Azure Policy at resource management  
- [ ] **Advanced Monitoring**: Nalikha ang dashboards at automated alerting  
- [ ] **Integration ng CI/CD**: Naitayo ang automated deployment pipelines  
- [ ] **Implementasyon ng Pagsunod**: Naabot ang mga enterprise compliance requirements  

### Timeline ng Pag-aaral at Milestones

#### Linggo 1-2: Foundation Building  
- **Milestone**: Ma-deploy ang unang AI application gamit ang AZD  
- **Validation**: Gumaganang application na accessible via public URL  
- **Kasanayan**: Mga pangunahing workflow ng AZD at AI service integration  

#### Linggo 3-4: Mastery ng Configuration  
- **Milestone**: Multi-environment deployment na may secure authentication  
- **Validation**: Parehong application na na-deploy sa dev/staging/prod  
- **Kasanayan**: Pamamahala ng environment at implementasyon ng seguridad  

#### Linggo 5-6: Kadalubhasaan sa Infrastructure  
- **Milestone**: Custom na template para sa complex multi-service application  
- **Validation**: Reusable template na na-deploy ng ibang miyembro ng team  
- **Kasanayan**: Mastery ng Bicep at automation ng infrastructure  

#### Linggo 7-8: Advanced AI Implementation  
- **Milestone**: Production-ready na multi-agent AI solution  
- **Validation**: System na kayang humawak ng real-world load na may monitoring  
- **Kasanayan**: Orkestrasyon ng multi-agent at pag-optimize ng performance  

#### Linggo 9-10: Kahandaan sa Production  
- **Milestone**: Deployment na pang-enterprise na may full compliance  
- **Validation**: Pumasa sa security review at cost optimization audit  
- **Kasanayan**: Pamamahala, monitoring, at integration ng CI/CD  

### Pagtatasa at Sertipikasyon

#### Mga Paraan ng Pagsusuri ng Kaalaman
1. **Praktikal na Deployments**: Gumaganang applications para sa bawat kabanata  
2. **Code Reviews**: Pagtatasa ng kalidad ng template at configuration  
3. **Paglutas ng Problema**: Mga senaryo ng troubleshooting at solusyon  
4. **Peer Teaching**: Pagpapaliwanag ng mga konsepto sa ibang mag-aaral  
5. **Ambag ng Komunidad**: Magbahagi ng mga template o mga pagpapabuti

#### Mga Resulta ng Propesyonal na Pag-unlad
- **Mga Proyekto sa Portfolio**: 8 deployment na handa na para sa produksyon
- **Mga Teknikal na Kasanayan**: Ekspertong kaalaman sa AZD at AI deployment na naaayon sa industriya
- **Kakayahan sa Paglutas ng Problema**: Kakayahang mag-troubleshoot at mag-optimize nang mag-isa
- **Pagkilala ng Komunidad**: Aktibong pakikilahok sa Azure developer community
- **Pag-unlad sa Karera**: Mga kasanayang direktang naaangkop sa mga tungkulin sa cloud at AI

#### Mga Sukatan ng Tagumpay
- **Rate ng Tagumpay ng Deployment**: >95% matagumpay na deployment
- **Oras ng Troubleshooting**: <30 minuto para sa mga karaniwang isyu
- **Pag-optimize ng Performance**: Mapapatunayang mga pagpapabuti sa gastos at performance
- **Pagsunod sa Seguridad**: Lahat ng deployment ay sumusunod sa mga pamantayan ng seguridad ng enterprise
- **Paglipat ng Kaalaman**: Kakayahang magturo sa ibang mga developer

### Patuloy na Pag-aaral at Pakikilahok sa Komunidad

#### Manatiling Napapanahon
- **Mga Update sa Azure**: Sundan ang mga release notes ng Azure Developer CLI
- **Mga Kaganapan sa Komunidad**: Makilahok sa mga kaganapan ng Azure at AI developer
- **Dokumentasyon**: Mag-ambag sa dokumentasyon ng komunidad at mga halimbawa
- **Feedback Loop**: Magbigay ng feedback sa nilalaman ng kurso at mga serbisyo ng Azure

#### Pag-unlad sa Karera
- **Propesyonal na Network**: Kumonekta sa mga eksperto sa Azure at AI
- **Mga Pagkakataon sa Pagsasalita**: Ibahagi ang mga natutunan sa mga kumperensya o meetups
- **Ambag sa Open Source**: Mag-ambag sa mga template at tools ng AZD
- **Mentorship**: Gabayan ang ibang mga developer sa kanilang pag-aaral ng AZD

---

**Pag-navigate sa Kabanata:**
- **📚 Home ng Kurso**: [AZD Para sa Mga Baguhan](../README.md)
- **📖 Simulan ang Pag-aaral**: [Kabanata 1: Pundasyon at Mabilisang Simula](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Pagsubaybay sa Pag-unlad**: Subaybayan ang iyong pag-unlad sa pamamagitan ng komprehensibong 8-kabanatang sistema ng pag-aaral
- **🤝 Komunidad**: [Azure Discord](https://discord.gg/microsoft-azure) para sa suporta at talakayan

**Pagsubaybay sa Pag-aaral**: Gamitin ang naka-istrukturang gabay na ito upang ma-master ang Azure Developer CLI sa pamamagitan ng progresibo, praktikal na pag-aaral na may nasusukat na resulta at benepisyo sa propesyonal na pag-unlad.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagamat sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
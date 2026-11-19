# Gabay sa Pag-aaral - Komprehensibong Mga Layunin sa Pagkatuto

**Paglalakbay sa Landas ng Pagkatuto**
- **📚 Bahay ng Kurso**: [AZD For Beginners](../README.md)
- **📖 Simulan ang Pagkatuto**: [Kabanata 1: Pundasyon at Mabilis na Pagsisimula](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Pagsubaybay ng Progreso**: [Pagkumpleto ng Kurso](../README.md#-course-completion--certification)

## Panimula

Ang komprehensibong gabay sa pag-aaral na ito ay nagbibigay ng mga estrukturadong layunin sa pagkatuto, mahahalagang konsepto, mga pagsasanay, at mga materyal sa pagtatasa upang matulungan kang maging bihasa sa Azure Developer CLI (azd). Gamitin ang gabay na ito upang subaybayan ang iyong progreso at tiyakin na napag-aralan mo ang lahat ng mahahalagang paksa.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng gabay na ito, ikaw ay:
- Maghahari sa lahat ng pangunahing at advanced na konsepto ng Azure Developer CLI
- Magpapaunlad ng mga praktikal na kasanayan sa pag-deploy at pamamahala ng mga Azure application
- Magtatamo ng kumpiyansa sa pag-troubleshoot at pag-optimize ng mga deployment
- Mauunawaan ang mga patakaran para sa production-ready deployment at mga konsiderasyon sa seguridad

## Mga Kinalabasan ng Pagkatuto

Matapos makumpleto ang lahat ng bahagi ng gabay na ito, kaya mong:
- Magdisenyo, mag-deploy, at mag-manage ng kumpletong app architectures gamit ang azd
- Magpatupad ng komprehensibong monitoring, seguridad, at mga estratehiya sa pag-optimize ng gastos
- Magsagawa ng troubleshooting sa mga komplikadong isyu sa deployment nang mag-isa
- Lumikha ng custom na mga template at mag-ambag sa azd community

## Estruktura ng Pag-aaral na Binubuo ng 8 Kabanata

### Kabanata 1: Pundasyon at Mabilis na Pagsisimula (Linggo 1)
**Tagal**: 30-45 minuto | **Kumpleksidad**: ⭐

#### Mga Layunin sa Pagkatuto
- Mauunawaan ang mga pangunahing konsepto at terminolohiya ng Azure Developer CLI
- Matagumpay na mai-install at maayos ang AZD sa iyong development platform
- I-deploy ang iyong unang application gamit ang isang umiiral na template
- Epektibong mag-navigate sa AZD command-line interface

#### Mga Mahahalagang Konsepto na Dapat Matutunan
- Estruktura at mga bahagi ng AZD project (azure.yaml, infra/, src/)
- Mga workflow ng deployment batay sa template
- Mga pangunahing kaalaman sa pag-configure ng kapaligiran
- Pamamahala ng resource group at subscription

#### Mga Praktikal na Pagsasanay
1. **Pag-verify ng Pag-install**: I-install ang AZD at i-verify gamit ang `azd version`
2. **Unang Deployment**: Matagumpay na i-deploy ang todo-nodejs-mongo template
3. **Pagsasaayos ng Kapaligiran**: I-configure ang iyong unang mga environment variables
4. **Paggalugad ng Resources**: Mag-navigate sa mga na-deploy na resource sa Azure Portal

#### Mga Tanong sa Pagsusuri
- Ano ang mga pangunahing bahagi ng isang AZD project?
- Paano ka mag-i-initialize ng bagong proyekto mula sa isang template?
- Ano ang pagkakaiba ng `azd up` at `azd deploy`?
- Paano mo pinamamahalaan ang maramihang mga kapaligiran gamit ang AZD?

---

### Kabanata 2: AI-First Development (Linggo 2)
**Tagal**: 4-5 oras kasama ang workshop | **Kumpleksidad**: ⭐⭐

#### Mga Layunin sa Pagkatuto
- Isama ang Microsoft Foundry services sa AZD workflows
- Gamitin ang GA `microsoft.foundry` bundle kasama ang AZD 1.37.0+ para sa hosted-agent development
- Mag-deploy at mag-configure ng AI-powered applications
- Mauunawaan ang mga pattern ng RAG (Retrieval-Augmented Generation)
- Pamahalaan ang deployment at scaling ng AI models

#### Mga Mahahalagang Konsepto na Dapat Matutunan
- Integrasyon ng Microsoft Foundry Models service at pamamahala ng API
- Pag-configure ng AI Search at vector indexing
- Mga estratehiya sa deployment ng modelo at pagpaplano ng kapasidad
- Monitoring ng AI application at pag-optimize ng performance
- Local Agent Inspector kumpara sa cloud traces, source-code deployment, at mga evaluation assets sa version control

#### Mga Praktikal na Pagsasanay
1. **AI Chat Deployment**: I-deploy ang azure-search-openai-demo template
2. **Implementasyon ng RAG**: I-configure ang document indexing at retrieval
3. **Pag-configure ng Modelo**: Mag-set up ng maraming AI models para sa iba't ibang layunin
4. **AI Monitoring**: Magpatupad ng Application Insights para sa AI workloads
5. **GA Hosted Agent**: Sundan ang [hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga); ihambing ang mga tugon mula sa lokal at cloud, repasuhin ang isang evaluation result, at i-verify ang cleanup ownership

#### Mga Tanong sa Pagsusuri
- Paano mo iko-configure ang Microsoft Foundry Models services sa isang AZD template?
- Ano ang mga pangunahing bahagi ng arkitekturang RAG?
- Paano mo pinamamahalaan ang kapasidad at scaling ng AI models?
- Ano ang mga mahalagang monitoring metrics para sa AI applications?
- Aling mga extension ang kasama sa `microsoft.foundry`, at bakit hiwalay na ini-install ang evaluations?
- Bakit naniningil pa rin ng Azure model charges ang lokal na agent tests?
- Ano ang iniwan ng `azd down` kapag ginamit muli mo ang isang umiiral na Foundry project?

---

### Kabanata 3: Configuration at Authentication (Linggo 3)
**Tagal**: 45-60 minuto | **Kumpleksidad**: ⭐⭐

#### Mga Layunin sa Pagkatuto
- Magmalasakit sa mga estratehiya sa pag-configure at pamamahala ng kapaligiran
- Magpatupad ng mga secure na authentication pattern at managed identity
- Ayusin ang mga resources gamit ang tamang mga convention sa pagbibigay ng pangalan
- Mag-configure ng multi-environment deployments (dev, staging, prod)

#### Mga Mahahalagang Konsepto na Dapat Matutunan
- Hierarchy ng environment at prioridad sa configuration
- Managed identity at service principal authentication
- Integrasyon ng Key Vault para sa pamamahala ng mga lihim
- Pamamahala ng mga parameter na partikular sa environment

#### Mga Praktikal na Pagsasanay
1. **Pag-setup ng Maramihang Kapaligiran**: I-configure ang dev, staging, at prod environments
2. **Pag-configure ng Seguridad**: Magpatupad ng managed identity authentication
3. **Pamamahala sa Lihim**: Isama ang Azure Key Vault para sa sensitibong data
4. **Pamamahala ng Parameter**: Lumikha ng mga configuration para sa partikular na kapaligiran

#### Mga Tanong sa Pagsusuri
- Paano mo kino-configure ang mga iba't ibang kapaligiran gamit ang AZD?
- Ano ang mga benepisyo ng paggamit ng managed identity kumpara sa service principals?
- Paano mo ligtas na pinamamahalaan ang mga lihim ng application?
- Ano ang hierarchy ng configuration sa AZD?

---

### Kabanata 4: Infrastructure as Code at Deployment (Linggo 4-5)
**Tagal**: 1-1.5 oras | **Kumpleksidad**: ⭐⭐⭐

#### Mga Layunin sa Pagkatuto
- Lumikha at mag-customize ng mga Bicep infrastructure template
- Magpatupad ng advanced deployment patterns at workflows
- Mauunawaan ang mga estratehiya sa pag-provide ng resources
- Magdisenyo ng scalable na multi-service architectures

- Mag-deploy ng mga containerized applications gamit ang Azure Container Apps at AZD


#### Mga Mahahalagang Konsepto na Dapat Matutunan
- Estruktura ng Bicep template at mga pinakamahusay na kasanayan
- Mga dependency sa resource at pag-ayos ng deployment
- Mga parameter file at modularity ng template
- Custom na hooks at automation ng deployment
- Mga pattern sa pag-deploy ng container app (mabilis na pagsisimula, produksyon, microservices)

#### Mga Praktikal na Pagsasanay
1. **Paglikha ng Custom Template**: Bumuo ng isang multi-service application template
2. **Mastery sa Bicep**: Lumikha ng modular, reusable infrastructure components
3. **Automation ng Deployment**: Magpatupad ng pre/post deployment hooks
4. **Disenyo ng Arkitektura**: Mag-deploy ng komplikadong microservices architecture
5. **Deployment ng Container App**: I-deploy ang mga halimbawa ng [Simple Flask API](../../../examples/container-app/simple-flask-api) at [Microservices Architecture](../../../examples/container-app/microservices) gamit ang AZD

#### Mga Tanong sa Pagsusuri
- Paano ka gagawa ng custom Bicep templates para sa AZD?
- Ano ang mga pinakamahuhusay na kasanayan sa pag-oorganisa ng infrastructure code?
- Paano mo hinaharap ang mga dependency sa resource sa mga template?
- Anong mga pattern sa deployment ang sumusuporta sa zero-downtime na mga update?

---

### Kabanata 5: Multi-Agent AI Solutions (Linggo 6-7)
**Tagal**: 2-3 oras | **Kumpleksidad**: ⭐⭐⭐⭐

#### Mga Layunin sa Pagkatuto
- Magdisenyo at magpatupad ng multi-agent AI architectures
- I-orchestrate ang koordinasyon at komunikasyon ng mga agent
- Mag-deploy ng mga production-ready AI solutions na may monitoring
- Mauunawaan ang espesyalidad ng mga agent at mga pattern ng workflow
- Isama ang containerized microservices bilang bahagi ng multi-agent solutions

#### Mga Mahahalagang Konsepto na Dapat Matutunan
- Mga pattern ng multi-agent architecture at mga prinsipyo ng disenyo
- Mga protocol sa komunikasyon ng agent at daloy ng datos
- Mga estratehiya sa load balancing at scaling para sa mga AI agent
- Monitoring sa produksyon para sa mga multi-agent system
- Serbisyo-sa-serbisyo na komunikasyon sa mga containerized na kapaligiran

#### Mga Praktikal na Pagsasanay
1. **Pagsusuri ng Arkitekturang Retail**: Suriin ang blueprint ng retail at tukuyin kung aling mga bahagi ng application ang kailangang ipatupad bago ang deployment
2. **Customization ng Agent**: Baguhin ang mga pag-uugali ng Customer at Inventory agent
3. **Scaling ng Arkitektura**: Magpatupad ng load balancing at auto-scaling
4. **Monitoring sa Produksyon**: Mag-set up ng komprehensibong monitoring at alerting
5. **Integrasyon ng Microservices**: Palawakin ang halimbawa ng [Microservices Architecture](../../../examples/container-app/microservices) upang suportahan ang agent-based workflows

#### Mga Tanong sa Pagsusuri
- Paano mo idinisenyo ang epektibong mga pattern ng komunikasyon sa multi-agent?
- Ano ang mga pangunahing konsiderasyon sa pag-scale ng AI agent workloads?
- Paano mo minomonitor at dine-debug ang multi-agent AI system?
- Anong mga pattern sa produksyon ang nagsisiguro ng pagiging maaasahan para sa mga AI agent?

---

### Kabanata 6: Pre-Deployment Validation at Pagpaplano (Linggo 8)
**Tagal**: 1 oras | **Kumpleksidad**: ⭐⭐

#### Mga Layunin sa Pagkatuto
- Gawin ang komprehensibong capacity planning at resource validation
- Pumili ng mga optimal na Azure SKU para sa cost-effectiveness
- Magpatupad ng automated na pre-flight checks at validation
- Magplano ng mga deployment na may estratehiya sa pag-optimize ng gastos

#### Mga Mahahalagang Konsepto na Dapat Matutunan
- Mga quota at limitasyon sa kapasidad ng Azure resource
- Mga criteria sa pagpili ng SKU at pag-optimize ng gastos
- Mga automated validation script at pagsubok
- Pagpaplano ng deployment at pagsusuri ng panganib

#### Mga Praktikal na Pagsasanay
1. **Pagsusuri ng Kapasidad**: Suriin ang mga kinakailangan para sa iyong mga application
2. **Pag-optimize ng SKU**: Ihambing at pumili ng cost-effective na service tier
3. **Automation ng Validation**: Magpatupad ng pre-deployment check scripts
4. **Pagpaplano ng Gastos**: Lumikha ng mga pagtataya at badyet para sa deployment

#### Mga Tanong sa Pagsusuri
- Paano mo ba vi-validate ang kapasidad ng Azure bago ang deployment?
- Anong mga salik ang nakakaapekto sa desisyon sa pagpili ng SKU?
- Paano mo i-automate ang pre-deployment validation?
- Anong mga estratehiya ang tumutulong upang ma-optimize ang gastos sa deployment?

---

### Kabanata 7: Troubleshooting at Debugging (Linggo 9)
**Tagal**: 1-1.5 oras | **Kumpleksidad**: ⭐⭐

#### Mga Layunin sa Pagkatuto
- Bumuo ng sistematikong mga pamamaraan sa debugging para sa mga AZD deployment
- Lutasin ang mga karaniwang isyu sa deployment at configuration
- I-debug ang mga AI-specific na problema at issue sa performance
- Magpatupad ng monitoring at alerting para sa maagap na pagtuklas ng isyu

#### Mga Mahahalagang Konsepto na Dapat Matutunan
- Mga teknik sa diagnostic at mga estratehiya sa pag-log
- Mga pangkaraniwang failure pattern at ang mga solusyon nito
- Monitoring sa performance at pag-optimize
- Mga pamamaraan sa pagtugon sa insidente at recovery

#### Mga Praktikal na Pagsasanay
1. **Kasanayan sa Diagnostic**: Magsanay gamit ang sinadya o sirang mga deployment
2. **Pagsusuri ng Log**: Gamitin nang epektibo ang Azure Monitor at Application Insights
3. **Tuning ng Performance**: I-optimize ang mga mabagal na application
4. **Pamamaraan sa Recovery**: Magpatupad ng backup at disaster recovery

#### Mga Tanong sa Pagsusuri
- Ano ang mga pinaka-karaniwang pagkabigo sa AZD deployment?
- Paano mo dine-debug ang mga isyu sa authentication at permiso?
- Anong mga estratehiya sa monitoring ang nakakatulong na maiwasan ang mga isyu sa produksyon?
- Paano mo i-ooptimize ang performance ng application sa Azure?

---

### Kabanata 8: Mga Pattern sa Produksyon at Enterprise (Linggo 10-11)
**Tagal**: 2-3 oras | **Kumpleksidad**: ⭐⭐⭐⭐

#### Mga Layunin sa Pagkatuto
- Magpatupad ng mga estratehiya sa deployment na pang-enterprise-grade
- Magdisenyo ng mga pattern sa seguridad at mga framework sa pagsunod sa regulasyon
- Magtatag ng monitoring, pamamahala, at pamamahala ng gastos
- Lumikha ng scalable na CI/CD pipelines na may integrasyon ng AZD
- I-apply ang mga pinakamahusay na kasanayan para sa production container app deployments (seguridad, monitoring, gastos, CI/CD)

#### Mga Mahahalagang Konsepto na Dapat Matutunan
- Mga pangangailangan sa seguridad at pagsunod ng enterprise
- Mga framework sa pamamahala at pagpapatupad ng mga patakaran
- Advanced na monitoring at pamamahala ng gastos
- Integrasyon ng CI/CD at mga automated deployment pipeline
- Mga blue-green at canary deployment strategies para sa containerized workloads

#### Mga Praktikal na Pagsasanay
1. **Seguridad ng Enterprise**: Magpatupad ng komprehensibong security patterns
2. **Framework ng Pamamahala**: Mag-set up ng Azure Policy at resource management
3. **Advanced Monitoring**: Lumikha ng mga dashboard at automated alerting
4. **Integrasyon ng CI/CD**: Bumuo ng mga automated deployment pipeline
5. **Produksyon ng Container Apps**: I-apply ang seguridad, monitoring, at pag-optimize ng gastos sa [Microservices Architecture](../../../examples/container-app/microservices) na halimbawa

#### Mga Tanong sa Pagsusuri
- Paano ka magpapatupad ng enterprise security sa AZD deployments?
- Anong mga pattern sa pamamahala ang nagsisiguro ng pagsunod sa regulasyon at pagkontrol sa gastos?
- Paano ka magdidisenyo ng scalable monitoring para sa mga production system?
- Anong mga CI/CD pattern ang pinakamainam sa mga AZD workflow?

#### Mga Layunin sa Pagkatuto
- Mauunawaan ang mga pundamental ng Azure Developer CLI at mga pangunahing konsepto
- Matagumpay na mai-install at maayos ang azd sa iyong development environment
- Makumpleto ang iyong unang deployment gamit ang umiiral na template
- Mag-navigate sa estruktura ng azd project at maunawaan ang mga mahahalagang bahagi

#### Mga Mahahalagang Konsepto na Dapat Matutunan
- Mga template, environment, at mga service
- Estruktura ng configuration ng azure.yaml
- Mga pangunahing azd command (init, up, down, deploy)
- Mga prinsipyo ng Infrastructure as Code
- Azure authentication at authorization

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

#### Mga Tanong para sa Sariling Pagsusuri
1. Ano ang tatlong pangunahing konsepto ng azd architecture?
2. Ano ang layunin ng azure.yaml file?
3. Paano nakakatulong ang mga environment sa pamamahala ng iba't ibang deployment target?
4. Ano ang mga paraan ng authentication na maaaring gamitin sa azd?
5. Ano ang nangyayari kapag unang pinatakbo mo ang `azd up`?

---

## Pagsubaybay ng Progreso at Framework ng Pagtatasa
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

**Pagsasanay 2.3: Pag-configure ng Seguridad**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Mga Tanong para sa Sariling Pagsusuri
1. Paano hinaharap ng azd ang precedence ng environment variables?
2. Ano ang mga deployment hooks at kailan mo ito ginagamit?
3. Paano ka nagko-configure ng iba't ibang SKU para sa iba't ibang environment?
4. Ano ang mga implikasyon sa seguridad ng iba't ibang paraan ng authentication?
5. Paano mo pinamamahalaan ang mga lihim at sensitibong configuration data?

### Module 3: Deployment at Provisioning (Linggo 4)

#### Mga Layunin sa Pagkatuto
- Maging bihasa sa mga workflow at pinakamahuhusay na kasanayan sa deployment
- Mauunawaan ang Infrastructure as Code gamit ang Bicep templates
- Magpatupad ng kumplikadong multi-service architecture
- I-optimize ang performance at pagiging maaasahan ng deployment

#### Mga Mahahalagang Konsepto na Dapat Matutunan
- Estruktura ng Bicep template at mga module
- Mga dependency sa resource at pag-aayos ng deployment
- Mga estratehiya sa deployment (blue-green, rolling updates)
- Deployment sa maramihang rehiyon
- Mga migration ng database at pamamahala ng data

#### Mga Pagsasanay

**Pagsasanay 3.1: Pasadyang Imprastruktura**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Pagsasanay 3.2: Multi-Serbisyo na Aplikasyon**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Pagsasanay 3.3: Pagsasama ng Database**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Mga Tanong sa Sariling Pagsusuri
1. Ano ang mga pakinabang ng paggamit ng Bicep kumpara sa mga ARM template?
2. Paano mo hinaharap ang mga database migrations sa mga azd deployment?
3. Anu-ano ang mga estratehiya para sa zero-downtime deployment?
4. Paano mo pinamamahalaan ang mga dependencies sa pagitan ng mga serbisyo?
5. Ano ang mga dapat isaalang-alang para sa multi-region deployment?

### Module 4: Pre-Deployment Validation (Linggo 5)

#### Mga Layunin sa Pagkatuto
- Magpatupad ng komprehensibong mga pagsusuri bago ang deployment
- Maging bihasa sa capacity planning at resource validation
- Maunawaan ang pagpili ng SKU at pag-optimize ng gastos
- Bumuo ng automated validation pipelines

#### Mga Pangunahing Konsepto na Dapat Maging Eksperto
- Mga quota at limitasyon ng Azure resource
- Mga pamantayan sa pagpili ng SKU at mga implikasyon sa gastos
- Mga automated validation script at tool
- Mga metodolohiya ng capacity planning
- Pagsubok ng performance at optimization

#### Mga Pagsasanay sa Praktis

**Pagsasanay 4.1: Capacity Planning**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Pagsasanay 4.2: Pre-flight Validation**
```text
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Pagsasanay 4.3: SKU Optimization**
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Mga Tanong sa Sariling Pagsusuri
1. Anu-ano ang mga salik na dapat makaapekto sa mga desisyon sa pagpili ng SKU?
2. Paano mo pinapatunayan ang availability ng Azure resource bago mag-deploy?
3. Ano ang mga pangunahing bahagi ng isang pre-flight check system?
4. Paano mo tinatayang at kinokontrol ang mga gastusin sa deployment?
5. Anong monitoring ang mahalaga para sa capacity planning?

### Module 5: Troubleshooting at Debugging (Linggo 6)

#### Mga Layunin sa Pagkatuto
- Maging bihasa sa sistematikong mga metodolohiya ng troubleshooting
- Paunlarin ang kasanayan sa pag-debug ng mga kumplikadong isyu sa deployment
- Magpatupad ng komprehensibong monitoring at alerting
- Bumuo ng mga pamamaraan sa incident response at recovery

#### Mga Pangunahing Konsepto na Dapat Maging Eksperto
- Mga karaniwang pattern ng pagkabigo sa deployment
- Teknik sa pagsusuri at correlation ng log
- Monitoring ng performance at optimization
- Pagtuklas at pagtugon sa security incident
- Disaster recovery at business continuity

#### Mga Pagsasanay sa Praktis

**Pagsasanay 5.1: Mga Senaryo sa Troubleshooting**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Pagsasanay 5.2: Implementasyon ng Monitoring**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Pagsasanay 5.3: Incident Response**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Mga Tanong sa Sariling Pagsusuri
1. Ano ang sistematikong pamamaraan sa troubleshooting ng azd deployment?
2. Paano mo ginawa ang correlation ng mga log mula sa iba't ibang serbisyo at resource?
3. Anong mga monitoring metrics ang pinakamahalaga para sa maagang pagtuklas ng problema?
4. Paano ka nagpatupad ng epektibong mga pamamaraan sa disaster recovery?
5. Ano ang mga pangunahing bahagi ng isang incident response plan?

### Module 6: Mga Advanced na Paksa at Mga Pinakamahusay na Kasanayan (Linggo 7-8)

#### Mga Layunin sa Pagkatuto
- Magpatupad ng enterprise-grade deployment patterns
- Maging bihasa sa CI/CD integration at automation
- Bumuo ng pasadyang mga template at mag-ambag sa komunidad
- Unawain ang advanced na mga pangangailangan sa seguridad at pagsunod

#### Mga Pangunahing Konsepto na Dapat Maging Eksperto
- Mga pattern ng integrasyon sa CI/CD pipeline
- Pagbuo at distribusyon ng pasadyang template
- Pamamahala ng enterprise at pagsunod sa regulasyon
- Advanced na networking at security configuration
- Pag-optimize ng performance at pamamahala ng gastos

#### Mga Pagsasanay sa Praktis

**Pagsasanay 6.1: Integrasyon ng CI/CD**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Pagsasanay 6.2: Pagbuo ng Pasadyang Template**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Pagsasanay 6.3: Implementasyon sa Enterprise**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Mga Tanong sa Sariling Pagsusuri
1. Paano mo i-integrate ang azd sa umiiral na mga workflow ng CI/CD?
2. Ano ang mga pangunahing konsiderasyon sa pagbuo ng pasadyang template?
3. Paano mo ipinatutupad ang governance at pagsunod sa azd deployment?
4. Ano ang mga pinakamahusay na kasanayan para sa enterprise-scale na deployment?
5. Paano ka mabisang nakakatulong sa komunidad ng azd?

## Mga Praktikal na Proyekto

### Proyekto 1: Personal na Portfolio Website
**Kumplikado**: Panimulang Antas  
**Tagal**: 1-2 linggo

Bumuo at mag-deploy ng personal na portfolio website gamit ang:
- Static website hosting sa Azure Storage
- Pasadyang domain configuration
- CDN integration para sa global na performance
- Automated deployment pipeline

**Mga Deliverable**:
- Gumaganang website na na-deploy sa Azure
- Pasadyang azd template para sa mga deployment ng portfolio
- Dokumentasyon ng proseso ng deployment
- Pagsusuri ng gastos at mga rekomendasyon sa optimization

### Proyekto 2: Task Management Application
**Kumplikado**: Intermediate  
**Tagal**: 2-3 linggo

Gumawa ng full-stack task management application na may:
- React frontend na na-deploy sa App Service
- Node.js API backend na may authentication
- PostgreSQL database na may migrations
- Application Insights monitoring

**Mga Deliverable**:
- Kumpletong application na may user authentication
- Database schema at migration script
- Monitoring dashboard at mga alerting rule
- Multi-environment deployment configuration

### Proyekto 3: Microservices E-commerce Platform
**Kumplikado**: Advanced  
**Tagal**: 4-6 na linggo

Disenyo at implementasyon ng microservices-based na e-commerce platform:
- Maramihang API services (catalog, orders, payments, users)
- Message queue integration gamit ang Service Bus
- Redis cache para sa pag-optimize ng performance
- Komprehensibong logging at monitoring

**Halimbawa ng Sanggunian**: Tingnan ang [Microservices Architecture](../../../examples/container-app/microservices) para sa sample na may dalawang serbisyo at gabay sa deployment. Ang queues, persistence, authentication, payment processing, at production hardening ay hiwalay na gawain sa proyekto.

**Mga Deliverable**:
- Kumpletong arkitektura ng microservices
- Mga pattern ng komunikasyon sa pagitan ng serbisyo
- Pagsubok ng performance at pag-optimize
- Production-ready na implementasyon ng seguridad

## Pagsusuri at Sertipikasyon

### Mga Pagsusuri ng Kaalaman

Kumpletuhin ang mga pagsusuring ito pagkatapos ng bawat module:

**Pagsusuri sa Module 1**: Mga pangunahing konsepto at pag-install
- Mga tanong na multiple choice tungkol sa mga pangunahing konsepto
- Mga praktikal na gawain sa pag-install at configuration
- Simpleng pagsasanay sa deployment

**Pagsusuri sa Module 2**: Configuration at mga environment
- Mga senaryo ng pamamahala ng environment
- Mga pagsasanay sa troubleshooting ng configuration
- Implementasyon ng security configuration

**Pagsusuri sa Module 3**: Deployment at provisioning
- Mga hamon sa disenyo ng imprastruktura
- Mga senaryo ng multi-service deployment
- Mga pagsasanay sa pag-optimize ng performance

**Pagsusuri sa Module 4**: Pre-deployment validation
- Mga kaso sa capacity planning
- Mga senaryo ng pag-optimize ng gastos
- Implementasyon ng validation pipeline

**Pagsusuri sa Module 5**: Troubleshooting at debugging
- Mga pagsasanay sa pagsusuri ng problema
- Mga gawain sa implementasyon ng monitoring
- Mga simulasyon ng incident response

**Pagsusuri sa Module 6**: Mga advanced na paksa
- Disenyo ng CI/CD pipeline
- Pagbuo ng pasadyang template
- Mga senaryo ng enterprise architecture

### Pangwakas na Capstone Project

Disenyo at implementasyon ng kompletong solusyon na nagpapakita ng kahusayan sa lahat ng konsepto:

**Mga Kinakailangan**:
- Arkitektura ng multi-tier na aplikasyon
- Maramihang deployment environment
- Komprehensibong monitoring at alerting
- Implementasyon ng seguridad at pagsunod sa regulasyon
- Pag-optimize ng gastos at performance tuning
- Kumpletong dokumentasyon at runbook

**Mga Pamantayan sa Pagsusuri**:
- Kalidad ng teknikal na implementasyon
- Kumpletong dokumentasyon
- Pagsunod sa seguridad at pinakamahusay na kasanayan
- Pag-optimize ng performance at gastos
- Bisa sa troubleshooting at monitoring

## Mga Mapagkukunan sa Pag-aaral at Sanggunian

### Opisyal na Dokumentasyon
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Mga Mapagkukunan mula sa Komunidad
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Mga Kapaligiran para sa Praktis
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Mga Karagdagang Tool
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Mga Rekomendasyon sa Iskedyul ng Pag-aaral

### Full-Time na Pag-aaral (8 Linggo)
- **Linggo 1-2**: Mga Module 1-2 (Pagsisimula, Configuration)
- **Linggo 3-4**: Mga Module 3-4 (Deployment, Pre-deployment)
- **Linggo 5-6**: Mga Module 5-6 (Troubleshooting, Advanced Topics)
- **Linggo 7-8**: Mga Praktikal na Proyekto at Pangwakas na Pagsusuri

### Part-Time na Pag-aaral (16 Linggo)
- **Linggo 1-4**: Module 1 (Pagsisimula)
- **Linggo 5-7**: Module 2 (Configuration at mga Environment)
- **Linggo 8-10**: Module 3 (Deployment at Provisioning)
- **Linggo 11-12**: Module 4 (Pre-deployment Validation)
- **Linggo 13-14**: Module 5 (Troubleshooting at Debugging)
- **Linggo 15-16**: Module 6 (Mga Advanced na Paksa at Pagsusuri)

---

## Framework para sa Pagsubaybay ng Progreso at Pagsusuri

### Checklist para sa Pagtatapos ng Kabanata

Subaybayan ang iyong progreso sa bawat kabanata gamit ang mga sumusunod na nasusukat na kinalabasan:

#### 📚 Kabanata 1: Pundasyon at Mabilis na Pagsisimula
- [ ] **Kumpletong Pag-install**: Na-install at na-verify ang AZD sa iyong platform
- [ ] **Unang Deployment**: Matagumpay na na-deploy ang todo-nodejs-mongo template
- [ ] **Pagsasaayos ng Environment**: Na-configure ang unang environment variables
- [ ] **Paggalugad sa Resources**: Na-explore ang mga naka-deploy na resources sa Azure Portal
- [ ] **Kasanayan sa Command**: Komportable sa mga pangunahing AZD command

#### 🤖 Kabanata 2: AI-First Development  
- [ ] **AI Template Deployment**: Matagumpay na na-deploy ang azure-search-openai-demo
- [ ] **RAG Implementation**: Na-configure ang document indexing at retrieval
- [ ] **Pag-configure ng Model**: Na-set up ang maramihang AI models na may iba't ibang layunin
- [ ] **AI Monitoring**: Naipatupad ang Application Insights para sa AI workloads
- [ ] **Pag-optimize ng Performance**: Naayos ang performance ng AI application

#### ⚙️ Kabanata 3: Configuration at Authentication
- [ ] **Multi-Environment Setup**: Na-configure ang dev, staging, at prod na environment
- [ ] **Pag-implement ng Seguridad**: Na-set up ang managed identity authentication
- [ ] **Pangangalaga ng Secrets**: Na-integrate ang Azure Key Vault para sa sensitibong data
- [ ] **Pamamahala ng Parameter**: Nakagawa ng specific configurations para sa bawat environment
- [ ] **Kasanayan sa Authentication**: Naipatupad ang secure access patterns

#### 🏗️ Kabanata 4: Infrastructure as Code at Deployment
- [ ] **Paglikha ng Pasadyang Template**: Nakabuo ng multi-service application template
- [ ] **Kasanayan sa Bicep**: Nakagawa ng modular at reusable infrastructure components
- [ ] **Automation ng Deployment**: Naipatupad ang pre/post deployment hooks
- [ ] **Disenyo ng Arkitektura**: Na-deploy ang kumplikadong microservices architecture
- [ ] **Pag-optimize ng Template**: Na-optimize ang mga template para sa performance at gastos

#### 🎯 Kabanata 5: Multi-Agent AI Solutions
- [ ] **Review ng Retail Architecture**: Natukoy ang mga nawawalang bahagi ng application at naplano ang implementasyon at validation nito
- [ ] **Customization ng Agent**: Binago ang mga behavior ng Customer at Inventory agents
- [ ] **Scaling ng Architecture**: Naipatupad ang load balancing at auto-scaling
- [ ] **Monitoring sa Produksyon**: Na-set up ang komprehensibong monitoring at alerting
- [ ] **Pag-aayos ng Performance**: Na-optimize ang performance ng multi-agent system

#### 🔍 Kabanata 6: Pre-Deployment Validation at Pagpaplano
- [ ] **Pagsusuri ng Kapasidad**: Sinuri ang mga pangangailangan sa resource para sa mga aplikasyon
- [ ] **Pag-optimize ng SKU**: Pinili ang mga cost-effective na tier ng serbisyo
- [ ] **Automation ng Validation**: Naipatupad ang mga pre-deployment check script
- [ ] **Pagpaplano ng Gastos**: Nakagawa ng mga pagtataya sa gastos ng deployment at budget
- [ ] **Pagsusuri ng Panganib**: Natukoy at na-mitigate ang mga risgo sa deployment

#### 🚨 Kabanata 7: Troubleshooting at Debugging
- [ ] **Kasanayan sa Diagnostiko**: Matagumpay na na-debug ang mga sinadyang sirang deployment
- [ ] **Pagsusuri ng Log**: Epektibong ginamit ang Azure Monitor at Application Insights
- [ ] **Pag-aayos ng Performance**: Na-optimize ang mga mabagal na application
- [ ] **Mga Pamamaraan sa Pag-recover**: Naipatupad ang backup at disaster recovery
- [ ] **Setup ng Monitoring**: Nakagawa ng proaktibong monitoring at alerting

#### 🏢 Kabanata 8: Pattern sa Produksyon at Enterprise
- [ ] **Enterprise Security**: Naipatupad ang komprehensibong security patterns
- [ ] **Governance Framework**: Na-set up ang Azure Policy at pamamahala ng resource
- [ ] **Advanced Monitoring**: Nakagawa ng dashboard at automated alerting
- [ ] **Integrasyon ng CI/CD**: Nakabuo ng automated deployment pipeline
- [ ] **Implementasyon ng Compliance**: Nasunod ang mga kinakailangan sa enterprise compliance

### Timeline ng Pagkatuto at Mga Milestone

#### Linggo 1-2: Pagtatatag ng Pundasyon
- **Milestone**: Na-deploy ang unang AI application gamit ang AZD
- **Pagpapatunay**: Gumaganang application na naa-access sa pamamagitan ng pampublikong URL
- **Kasanayan**: Mga pangunahing workflow ng AZD at integrasyon ng AI service

#### Linggo 3-4: Kasanayan sa Configuration
- **Milestone**: Multi-environment na deployment na may secure authentication
- **Pagpapatunay**: Parehong application na na-deploy sa dev/staging/prod
- **Kasanayan**: Pamamahala ng environment at implementasyon ng seguridad

#### Linggo 5-6: Ekspertis sa Imprastruktura
- **Milestone**: Pasadyang template para sa kumplikadong multi-service application
- **Pagpapatunay**: Reusable template na na-deploy ng iba pang miyembro ng koponan
- **Kasanayan**: Kasanayan sa Bicep at automation ng imprastruktura

#### Linggo 7-8: Advanced na Implementasyon ng AI
- **Milestone**: Production-ready na multi-agent AI solution
- **Pagpapatunay**: Sistemang kaya ang totoong dami ng load na may monitoring
- **Kasanayan**: Orkestrasyon ng multi-agent at pag-optimize ng performance

#### Linggo 9-10: Kahandaan sa Produksyon
- **Milestone**: Enterprise-grade na deployment na may kumpletong pagsunod
- **Pagpapatunay**: Nakapasa sa security review at audit ng pag-optimize ng gastos
- **Kasanayan**: Pamamahala, monitoring, at integrasyon ng CI/CD

### Pagsusuri at Sertipikasyon

#### Mga Paraan ng Pagpapatunay ng Kaalaman
1. **Praktikal na Pag-deploy**: Gumaganang aplikasyon para sa bawat kabanata
2. **Pagsusuri ng Code**: Pagsusuri sa template at kalidad ng konfigurasyon
3. **Pagsosolusyon ng Problema**: Mga senaryo ng troubleshooting at mga solusyon
4. **Pagtuturo sa Kapwa**: Ipaliwanag ang mga konsepto sa ibang mga mag-aaral
5. **Ambag sa Komunidad**: Ibahagi ang mga template o mga pagpapabuti

#### Mga Resulta ng Propesyonal na Pag-unlad
- **Mga Proyektong Portfolio**: Mga pag-aaral ng deployment at ehersisyo sa arkitektura; ang kahandaan para sa produksyon ay nangangailangan ng hiwalay na implementasyon at pagsusuri
- **Mga Teknikal na Kasanayan**: Ekspertis sa industry-standard na AZD at AI deployment
- **Kakayahan sa Pagsosolusyon ng Problema**: Mapanuring troubleshooting at optimisasyon nang mag-isa
- **Pagkilala ng Komunidad**: Aktibong pakikilahok sa Azure developer community
- **Pagsulong ng Karera**: Mga kasanayang direktang magagamit sa mga papel sa cloud at AI

#### Mga Pamantayan sa Tagumpay
- **Rate ng Tagumpay sa Deployment**: >95% na matagumpay na deployments
- **Oras sa Troubleshooting**: <30 minuto para sa mga karaniwang isyu
- **Pagpapahusay ng Performance**: Nakikitang mga pagbuti sa gastos at pagganap
- **Pagsusuri sa Seguridad**: Dokumentahin ang mga kontrol at natitirang mga puwang laban sa mga kinakailangan ng inyong organisasyon; ang pagtatapos ng kurso ay hindi nagpapatunay ng pagsunod
- **Paglilipat ng Kaalaman**: Kakayahang maging mentor sa ibang mga developer

### Patuloy na Pag-aaral at Pakikilahok sa Komunidad

#### Manatiling Napapanahon
- **Mga Update sa Azure**: Sundan ang Azure Developer CLI release notes
- **Mga Kaganapan sa Komunidad**: Makilahok sa mga kaganapan ng Azure at AI developer
- **Dokumentasyon**: Mag-ambag sa dokumentasyon at mga halimbawa ng komunidad
- **Feedback Loop**: Magbigay ng puna sa nilalaman ng kurso at mga serbisyo ng Azure

#### Pag-unlad ng Karera
- **Propesyonal na Network**: Kumonekta sa mga eksperto sa Azure at AI
- **Mga Oportunidad sa Pagsasalita**: Ipresenta ang mga natutunan sa mga kumperensya o meetup
- **Ambag sa Open Source**: Mag-ambag sa mga AZD template at tools
- **Mentorsip**: Gabayan ang ibang mga developer sa kanilang paglalakbay sa pag-aaral ng AZD

---

**Pag-navigate sa Kabanata:**
- **📚 Bahay ng Kurso**: [AZD For Beginners](../README.md)
- **📖 Simulan ang Pag-aaral**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Pagsubaybay sa Progreso**: Subaybayan ang iyong pag-usad sa pamamagitan ng komprehensibong 8-kababataang sistema ng pag-aaral
- **🤝 Komunidad**: [Azure Discord](https://discord.gg/microsoft-azure) para sa suporta at diskusyon

**Pagsubaybay sa Progreso sa Pag-aaral**: Gamitin ang istrukturadong gabay na ito upang maging dalubhasa sa Azure Developer CLI sa pamamagitan ng progresibo, praktikal na pag-aaral na may nasusukat na mga resulta at benepisyo sa propesyonal na pag-unlad.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
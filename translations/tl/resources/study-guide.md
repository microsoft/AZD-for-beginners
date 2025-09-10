<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T22:31:29+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "tl"
}
-->
# Gabay sa Pag-aaral - AZD Para sa Mga Baguhan

## Panimula

Ang komprehensibong gabay sa pag-aaral na ito ay nagbibigay ng maayos na mga layunin sa pag-aaral, mahahalagang konsepto, mga pagsasanay, at mga materyales sa pagsusuri upang matulungan kang ma-master ang Azure Developer CLI (azd). Gamitin ang gabay na ito upang subaybayan ang iyong progreso at tiyaking natutunan mo ang lahat ng mahahalagang paksa.

## Mga Layunin sa Pag-aaral

Sa pagtatapos ng gabay na ito, ikaw ay:
- Magiging bihasa sa lahat ng pangunahing at advanced na konsepto ng Azure Developer CLI
- Magkakaroon ng praktikal na kasanayan sa pag-deploy at pamamahala ng mga Azure application
- Magkakaroon ng kumpiyansa sa pag-troubleshoot at pag-optimize ng mga deployment
- Maiintindihan ang mga praktika para sa production-ready deployment at mga konsiderasyon sa seguridad

## Mga Resulta ng Pag-aaral

Pagkatapos makumpleto ang lahat ng seksyon ng gabay na ito, magagawa mo ang:
- Magdisenyo, mag-deploy, at mag-manage ng kumpletong application architectures gamit ang azd
- Magpatupad ng komprehensibong monitoring, seguridad, at mga estratehiya sa pag-optimize ng gastos
- Mag-troubleshoot ng mga komplikadong isyu sa deployment nang mag-isa
- Gumawa ng mga custom na template at mag-ambag sa komunidad ng azd

## Estruktura ng Kurso

### Module 1: Pagsisimula (Linggo 1-2)

#### Mga Layunin sa Pag-aaral
- Maunawaan ang mga pangunahing konsepto ng Azure Developer CLI
- Matagumpay na mai-install at ma-configure ang azd sa iyong development environment
- Makumpleto ang iyong unang deployment gamit ang isang umiiral na template
- Mag-navigate sa azd project structure at maunawaan ang mga pangunahing bahagi nito

#### Mahahalagang Konsepto na Dapat Ma-master
- Mga template, environment, at serbisyo
- azure.yaml configuration structure
- Mga pangunahing utos ng azd (init, up, down, deploy)
- Mga prinsipyo ng Infrastructure as Code
- Azure authentication at authorization

#### Mga Pagsasanay

**Exercise 1.1: Pag-install at Setup**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Exercise 1.2: Unang Deployment**  
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Exercise 1.3: Pagsusuri ng Project Structure**  
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Mga Tanong sa Pagsusuri ng Sarili
1. Ano ang tatlong pangunahing konsepto ng azd architecture?
2. Ano ang layunin ng azure.yaml file?
3. Paano nakakatulong ang mga environment sa pamamahala ng iba't ibang deployment target?
4. Anong mga authentication method ang maaaring gamitin sa azd?
5. Ano ang nangyayari kapag unang beses mong pinatakbo ang `azd up`?

### Module 2: Configuration at Environments (Linggo 3)

#### Mga Layunin sa Pag-aaral
- Ma-master ang pamamahala at configuration ng environment
- Maunawaan ang advanced azure.yaml configurations
- Magpatupad ng environment-specific settings at variables
- Mag-configure ng authentication para sa iba't ibang senaryo

#### Mahahalagang Konsepto na Dapat Ma-master
- Hierarchy ng environment at precedence ng variable
- Configuration ng serbisyo at mga parameter
- Hooks at lifecycle events
- Mga authentication method (user, service principal, managed identity)
- Pamamahala ng configuration file

#### Mga Pagsasanay

**Exercise 2.1: Multi-Environment Setup**  
```bash
# Create and configure multiple environments:
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
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Mga Tanong sa Pagsusuri ng Sarili
1. Paano hinahandle ng azd ang precedence ng environment variable?
2. Ano ang deployment hooks at kailan mo ito dapat gamitin?
3. Paano mo iko-configure ang iba't ibang SKUs para sa iba't ibang environment?
4. Ano ang mga implikasyon sa seguridad ng iba't ibang authentication method?
5. Paano mo pinamamahalaan ang mga secrets at sensitibong configuration data?

### Module 3: Deployment at Provisioning (Linggo 4)

#### Mga Layunin sa Pag-aaral
- Ma-master ang mga workflow at best practices sa deployment
- Maunawaan ang Infrastructure as Code gamit ang Bicep templates
- Magpatupad ng mga komplikadong multi-service architectures
- Mag-optimize ng performance at reliability ng deployment

#### Mahahalagang Konsepto na Dapat Ma-master
- Estruktura ng Bicep template at mga module
- Dependencies ng resource at pagkakasunod-sunod
- Mga estratehiya sa deployment (blue-green, rolling updates)
- Multi-region deployments
- Database migrations at pamamahala ng data

#### Mga Pagsasanay

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
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Exercise 3.3: Database Integration**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Mga Tanong sa Pagsusuri ng Sarili
1. Ano ang mga benepisyo ng paggamit ng Bicep kumpara sa ARM templates?
2. Paano mo hinahandle ang database migrations sa azd deployments?
3. Anong mga estratehiya ang umiiral para sa zero-downtime deployments?
4. Paano mo pinamamahalaan ang dependencies sa pagitan ng mga serbisyo?
5. Ano ang mga konsiderasyon para sa multi-region deployments?

### Module 4: Pre-Deployment Validation (Linggo 5)

#### Mga Layunin sa Pag-aaral
- Magpatupad ng komprehensibong pre-deployment checks
- Ma-master ang capacity planning at resource validation
- Maunawaan ang SKU selection at cost optimization
- Gumawa ng automated validation pipelines

#### Mahahalagang Konsepto na Dapat Ma-master
- Azure resource quotas at limits
- Mga pamantayan sa pagpili ng SKU at mga implikasyon sa gastos
- Mga automated validation script at tools
- Mga metodolohiya sa capacity planning
- Performance testing at optimization

#### Mga Pagsasanay

**Exercise 4.1: Capacity Planning**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercise 4.2: Pre-flight Validation**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercise 4.3: SKU Optimization**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Mga Tanong sa Pagsusuri ng Sarili
1. Anong mga salik ang dapat makaapekto sa mga desisyon sa pagpili ng SKU?
2. Paano mo vavalidate ang availability ng Azure resources bago ang deployment?
3. Ano ang mga pangunahing bahagi ng isang pre-flight check system?
4. Paano mo tinatantiya at kinokontrol ang mga gastos sa deployment?
5. Anong monitoring ang mahalaga para sa capacity planning?

### Module 5: Troubleshooting at Debugging (Linggo 6)

#### Mga Layunin sa Pag-aaral
- Ma-master ang sistematikong mga metodolohiya sa troubleshooting
- Mag-develop ng expertise sa pag-debug ng mga komplikadong isyu sa deployment
- Magpatupad ng komprehensibong monitoring at alerting
- Gumawa ng mga procedure para sa incident response at recovery

#### Mahahalagang Konsepto na Dapat Ma-master
- Mga karaniwang pattern ng failure sa deployment
- Mga teknik sa pagsusuri ng log at correlation
- Performance monitoring at optimization
- Pagtuklas ng security incident at response
- Disaster recovery at business continuity

#### Mga Pagsasanay

**Exercise 5.1: Troubleshooting Scenarios**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercise 5.2: Monitoring Implementation**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercise 5.3: Incident Response**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Mga Tanong sa Pagsusuri ng Sarili
1. Ano ang sistematikong approach sa troubleshooting ng azd deployments?
2. Paano mo iko-correlate ang mga log sa iba't ibang serbisyo at resources?
3. Anong monitoring metrics ang pinakamahalaga para sa maagang pagtuklas ng problema?
4. Paano mo ipapatupad ang epektibong disaster recovery procedures?
5. Ano ang mga pangunahing bahagi ng isang incident response plan?

### Module 6: Advanced Topics at Best Practices (Linggo 7-8)

#### Mga Layunin sa Pag-aaral
- Magpatupad ng mga enterprise-grade deployment patterns
- Ma-master ang CI/CD integration at automation
- Mag-develop ng mga custom template at mag-ambag sa komunidad
- Maunawaan ang advanced security at compliance requirements

#### Mahahalagang Konsepto na Dapat Ma-master
- Mga pattern sa CI/CD pipeline integration
- Pag-develop at pamamahagi ng custom templates
- Enterprise governance at compliance
- Advanced networking at security configurations
- Performance optimization at cost management

#### Mga Pagsasanay

**Exercise 6.1: CI/CD Integration**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Exercise 6.2: Custom Template Development**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercise 6.3: Enterprise Implementation**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Mga Tanong sa Pagsusuri ng Sarili
1. Paano mo i-integrate ang azd sa umiiral na CI/CD workflows?
2. Ano ang mga pangunahing konsiderasyon sa pag-develop ng custom templates?
3. Paano mo ipapatupad ang governance at compliance sa azd deployments?
4. Ano ang mga best practices para sa enterprise-scale deployments?
5. Paano ka epektibong makakapag-ambag sa komunidad ng azd?
3. **Mag-ambag sa Open Source**: Ibahagi ang iyong mga template at solusyon sa komunidad  
4. **Magturo sa Iba**: Ang pagpapaliwanag ng mga konsepto sa iba ay nakakatulong sa mas malalim na pag-unawa  
5. **Maging Mausisa**: Patuloy na tuklasin ang mga bagong serbisyo ng Azure at mga pattern ng integrasyon  

---

**Pag-navigate**  
- **Nakaraang Aralin**: [FAQ](faq.md)  
- **Susunod na Aralin**: [Changelog](../changelog.md)  

**Pagsubaybay sa Pag-aaral**: Gamitin ang gabay na ito upang subaybayan ang iyong paglalakbay sa pag-aaral at tiyakin ang komprehensibong pag-unawa sa lahat ng konsepto at kasanayan ng Azure Developer CLI.  

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na pinagmulan. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
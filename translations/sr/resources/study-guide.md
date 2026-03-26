# Study Guide - Comprehensive Learning Objectives

**Learning Path Navigation**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Start Learning**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Progress Tracking**: [Course Completion](../README.md#-course-completion--certification)

## Introduction

This comprehensive study guide provides structured learning objectives, key concepts, practice exercises, and assessment materials to help you master Azure Developer CLI (azd). Use this guide to track your progress and ensure you've covered all essential topics.

## Learning Goals

By completing this study guide, you will:
- Master all fundamental and advanced concepts of Azure Developer CLI
- Develop practical skills in deploying and managing Azure applications
- Build confidence in troubleshooting and optimizing deployments
- Understand production-ready deployment practices and security considerations

## Learning Outcomes

After completing all sections of this study guide, you will be able to:
- Design, deploy, and manage complete application architectures using azd
- Implement comprehensive monitoring, security, and cost optimization strategies
- Troubleshoot complex deployment issues independently
- Create custom templates and contribute to the azd community

## 8-Chapter Learning Structure

### Chapter 1: Foundation & Quick Start (Week 1)
**Duration**: 30-45 minutes | **Complexity**: ⭐

#### Learning Objectives
- Understand Azure Developer CLI core concepts and terminology
- Successfully install and configure AZD on your development platform
- Deploy your first application using an existing template
- Navigate the AZD command-line interface effectively

#### Key Concepts to Master
- AZD project structure and components (azure.yaml, infra/, src/)
- Template-based deployment workflows
- Environment configuration basics
- Resource group and subscription management

#### Practical Exercises
1. **Installation Verification**: Install AZD and verify with `azd version`
2. **First Deployment**: Deploy todo-nodejs-mongo template successfully
3. **Environment Setup**: Configure your first environment variables
4. **Resource Exploration**: Navigate deployed resources in Azure Portal

#### Assessment Questions
- What are the core components of an AZD project?
- How do you initialize a new project from a template?
- What is the difference between `azd up` and `azd deploy`?
- How do you manage multiple environments with AZD?

---

### Chapter 2: AI-First Development (Week 2)
**Duration**: 1-2 hours | **Complexity**: ⭐⭐

#### Learning Objectives
- Integrate Microsoft Foundry services with AZD workflows
- Deploy and configure AI-powered applications
- Understand RAG (Retrieval-Augmented Generation) implementation patterns
- Manage AI model deployments and scaling

#### Key Concepts to Master
- Microsoft Foundry Models service integration and API management
- AI Search configuration and vector indexing
- Model deployment strategies and capacity planning
- AI application monitoring and performance optimization

#### Practical Exercises
1. **AI Chat Deployment**: Deploy azure-search-openai-demo template
2. **RAG Implementation**: Configure document indexing and retrieval
3. **Model Configuration**: Set up multiple AI models with different purposes
4. **AI Monitoring**: Implement Application Insights for AI workloads

#### Assessment Questions
- How do you configure Microsoft Foundry Models services in an AZD template?
- What are the key components of a RAG architecture?
- How do you manage AI model capacity and scaling?
- What monitoring metrics are important for AI applications?

---

### Chapter 3: Configuration & Authentication (Week 3)
**Duration**: 45-60 minutes | **Complexity**: ⭐⭐

#### Learning Objectives
- Master environment configuration and management strategies
- Implement secure authentication patterns and managed identity
- Organize resources with proper naming conventions
- Configure multi-environment deployments (dev, staging, prod)

#### Key Concepts to Master
- Environment hierarchy and configuration precedence
- Managed identity and service principal authentication
- Key Vault integration for secrets management
- Environment-specific parameter management

#### Practical Exercises
1. **Multi-Environment Setup**: Configure dev, staging, and prod environments
2. **Security Configuration**: Implement managed identity authentication
3. **Secrets Management**: Integrate Azure Key Vault for sensitive data
4. **Parameter Management**: Create environment-specific configurations

#### Assessment Questions
- How do you configure different environments with AZD?
- What are the benefits of using managed identity over service principals?
- How do you securely manage application secrets?
- What is the configuration hierarchy in AZD?

---

### Chapter 4: Infrastructure as Code & Deployment (Week 4-5)
**Duration**: 1-1.5 hours | **Complexity**: ⭐⭐⭐

#### Learning Objectives
- Create and customize Bicep infrastructure templates
- Implement advanced deployment patterns and workflows
- Understand resource provisioning strategies
- Design scalable multi-service architectures

- Deploy containerized applications using Azure Container Apps and AZD


#### Key Concepts to Master
- Bicep template structure and best practices
- Resource dependencies and deployment ordering
- Parameter files and template modularity
- Custom hooks and deployment automation
- Container app deployment patterns (quick start, production, microservices)

#### Practical Exercises
1. **Custom Template Creation**: Build a multi-service application template
2. **Bicep Mastery**: Create modular, reusable infrastructure components
3. **Deployment Automation**: Implement pre/post deployment hooks
4. **Architecture Design**: Deploy complex microservices architecture
5. **Container App Deployment**: Deploy the [Simple Flask API](../../../examples/container-app/simple-flask-api) and [Microservices Architecture](../../../examples/container-app/microservices) examples using AZD

#### Assessment Questions
- How do you create custom Bicep templates for AZD?
- What are the best practices for organizing infrastructure code?
- How do you handle resource dependencies in templates?
- What deployment patterns support zero-downtime updates?

---

### Chapter 5: Multi-Agent AI Solutions (Week 6-7)
**Duration**: 2-3 hours | **Complexity**: ⭐⭐⭐⭐

#### Learning Objectives
- Design and implement multi-agent AI architectures
- Orchestrate agent coordination and communication
- Deploy production-ready AI solutions with monitoring
- Understand agent specialization and workflow patterns
- Integrate containerized microservices as part of multi-agent solutions

#### Key Concepts to Master
- Multi-agent architecture patterns and design principles
- Agent communication protocols and data flow
- Load balancing and scaling strategies for AI agents
- Production monitoring for multi-agent systems
- Service-to-service communication in containerized environments

#### Practical Exercises
1. **Retail Solution Deployment**: Deploy the complete multi-agent retail scenario
2. **Agent Customization**: Modify Customer and Inventory agent behaviors
3. **Architecture Scaling**: Implement load balancing and auto-scaling
4. **Production Monitoring**: Set up comprehensive monitoring and alerting
5. **Microservices Integration**: Extend the [Microservices Architecture](../../../examples/container-app/microservices) example to support agent-based workflows

#### Assessment Questions
- How do you design effective multi-agent communication patterns?
- What are the key considerations for scaling AI agent workloads?
- How do you monitor and debug multi-agent AI systems?
- What production patterns ensure reliability for AI agents?

---

### Chapter 6: Pre-Deployment Validation & Planning (Week 8)
**Duration**: 1 hour | **Complexity**: ⭐⭐

#### Learning Objectives
- Perform comprehensive capacity planning and resource validation
- Select optimal Azure SKUs for cost-effectiveness
- Implement automated pre-flight checks and validation
- Plan deployments with cost optimization strategies

#### Key Concepts to Master
- Azure resource quotas and capacity limitations
- SKU selection criteria and cost optimization
- Automated validation scripts and testing
- Deployment planning and risk assessment

#### Practical Exercises
1. **Capacity Analysis**: Analyze resource requirements for your applications
2. **SKU Optimization**: Compare and select cost-effective service tiers
3. **Validation Automation**: Implement pre-deployment check scripts
4. **Cost Planning**: Create deployment cost estimates and budgets

#### Assessment Questions
- How do you validate Azure capacity before deployment?
- What factors influence SKU selection decisions?
- How do you automate pre-deployment validation?
- What strategies help optimize deployment costs?

---

### Chapter 7: Troubleshooting & Debugging (Week 9)
**Duration**: 1-1.5 hours | **Complexity**: ⭐⭐

#### Learning Objectives
- Develop systematic debugging approaches for AZD deployments
- Resolve common deployment and configuration issues
- Debug AI-specific problems and performance issues
- Implement monitoring and alerting for proactive issue detection

#### Key Concepts to Master
- Diagnostic techniques and logging strategies
- Common failure patterns and their solutions
- Performance monitoring and optimization
- Incident response and recovery procedures

#### Practical Exercises
1. **Diagnostic Skills**: Practice with intentionally broken deployments
2. **Log Analysis**: Use Azure Monitor and Application Insights effectively
3. **Performance Tuning**: Optimize slow-performing applications
4. **Recovery Procedures**: Implement backup and disaster recovery

#### Assessment Questions
- What are the most common AZD deployment failures?
- How do you debug authentication and permission issues?
- What monitoring strategies help prevent production issues?
- How do you optimize application performance in Azure?

---

### Chapter 8: Production & Enterprise Patterns (Week 10-11)
**Duration**: 2-3 hours | **Complexity**: ⭐⭐⭐⭐

#### Learning Objectives
- Implement enterprise-grade deployment strategies
- Design security patterns and compliance frameworks
- Establish monitoring, governance, and cost management
- Create scalable CI/CD pipelines with AZD integration
- Apply best practices for production container app deployments (security, monitoring, cost, CI/CD)

#### Key Concepts to Master
- Enterprise security and compliance requirements
- Governance frameworks and policy implementation
- Advanced monitoring and cost management
- CI/CD integration and automated deployment pipelines
- Blue-green and canary deployment strategies for containerized workloads

#### Practical Exercises
1. **Enterprise Security**: Implement comprehensive security patterns
2. **Governance Framework**: Set up Azure Policy and resource management
3. **Advanced Monitoring**: Create dashboards and automated alerting
4. **CI/CD Integration**: Build automated deployment pipelines
5. **Production Container Apps**: Apply security, monitoring, and cost optimization to the [Microservices Architecture](../../../examples/container-app/microservices) example

#### Assessment Questions
- How do you implement enterprise security in AZD deployments?
- What governance patterns ensure compliance and cost control?
- How do you design scalable monitoring for production systems?
- What CI/CD patterns work best with AZD workflows?

#### Learning Objectives
- Understand Azure Developer CLI fundamentals and core concepts
- Successfully install and configure azd on your development environment
- Complete your first deployment using an existing template
- Navigate the azd project structure and understand key components

#### Key Concepts to Master
- Templates, environments, and services
- azure.yaml configuration structure
- Basic azd commands (init, up, down, deploy)
- Infrastructure as Code principles
- Azure authentication and authorization

#### Practice Exercises

**Exercise 1.1: Installation and Setup**
```bash
# Завршите ове задатке:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Exercise 1.2: First Deployment**
```bash
# Разместити једноставну веб апликацију:
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

#### Self-Assessment Questions
1. What are the three core concepts of azd architecture?
2. What is the purpose of the azure.yaml file?
3. How do environments help manage different deployment targets?
4. What authentication methods can be used with azd?
5. What happens when you run `azd up` for the first time?

---

## Progress Tracking and Assessment Framework
```bash
# Креирајте и конфигуришите више окружења:
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
# Примените најбоље безбедносне праксе:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Self-Assessment Questions
1. How does azd handle environment variable precedence?
2. What are deployment hooks and when should you use them?
3. How do you configure different SKUs for different environments?
4. What are the security implications of different authentication methods?
5. How do you manage secrets and sensitive configuration data?

### Module 3: Deployment and Provisioning (Week 4)

#### Learning Objectives
- Master deployment workflows and best practices
- Understand Infrastructure as Code with Bicep templates
- Implement complex multi-service architectures
- Optimize deployment performance and reliability

#### Key Concepts to Master
- Bicep template structure and modules
- Resource dependencies and ordering
- Deployment strategies (blue-green, rolling updates)
- Multi-region deployments
- Database migrations and data management

#### Practice Exercises

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
# Поставите архитектуру микросервиса:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Exercise 3.3: Database Integration**
```bash
# Имплементирајте шаблоне за распоређивање базе података:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Self-Assessment Questions
1. What are the advantages of using Bicep over ARM templates?
2. How do you handle database migrations in azd deployments?
3. What strategies exist for zero-downtime deployments?
4. How do you manage dependencies between services?
5. What are the considerations for multi-region deployments?

### Module 4: Pre-Deployment Validation (Week 5)
- Спровести свеобухватне провере пре распоређивања
- Савладати планирање капацитета и валидацију ресурса
- Разумети избор SKU-а и оптимизацију трошкова
- Изградити аутоматизоване процесе валидације

#### Кључни концепти за овладавање
- Квоте и ограничења Azure ресурса
- Критеријуми за избор SKU-а и утицај на трошкове
- Аутоматизовани скрипти и алати за валидацију
- Методологије планирања капацитета
- Тестирање перформанси и оптимизација

#### Практичне вежбе

**Exercise 4.1: Capacity Planning**
```bash
# Имплементирајте валидацију капацитета:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercise 4.2: Pre-flight Validation**
```powershell
# Изградити свеобухватан процес валидације:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercise 4.3: SKU Optimization**
```bash
# Оптимизовати конфигурације сервиса:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Питања за самооцењивање
1. Који фактори треба да утичу на одлуке о избору SKU-а?
2. Како проверити доступност Azure ресурса пре распоређивања?
3. Које су кључне компоненте система провера пре распоређивања?
4. Како проценити и контролисати трошкове распоређивања?
5. Које праћење је суштинско за планирање капацитета?

### Модул 5: Решавање проблема и дебаговање (Недеља 6)

#### Циљеви учења
- Овладати систематским методологијама решавања проблема
- Развити експертизу у дебаговању сложених проблема распоређивања
- Спровести свеобухватно праћење и алармирање
- Израдити процедуре за одговор на инциденте и опоравак

#### Кључни концепти за овладавање
- Уобичајени обрасци неуспеха при распоређивању
- Технике анализе и корелације логова
- Праћење перформанси и оптимизација
- Детекција и реаговање на безбедносне инциденте
- Опоравак од катастрофе и континуитет пословања

#### Практичне вежбе

**Exercise 5.1: Troubleshooting Scenarios**
```bash
# Вежбајте решавање уобичајених проблема:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercise 5.2: Monitoring Implementation**
```bash
# Поставите свеобухватно праћење:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercise 5.3: Incident Response**
```bash
# Израдите процедуре за реаговање на инциденте:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Питања за самооцењивање
1. Који је систематски приступ за решавање проблема при распоређивању azd?
2. Како повезујете логове кроз више сервиса и ресурса?
3. Који метрики праћења су најкритичнији за рано откривање проблема?
4. Како спроводите ефикасне процедуре опоравка после катастрофе?
5. Које су кључне компоненте плана за реаговање на инциденте?

### Модул 6: Напредне теме и најбоље праксе (Недеље 7-8)

#### Циљеви учења
- Спровести обрасце распоређивања предузећног нивоа
- Овладати интеграцијом и аутоматизацијом CI/CD
- Развити прилагођене шаблоне и допринети заједници
- Разумети напредне захтеве за безбедност и усаглашеност

#### Кључни концепти за овладавање
- Обрасци интеграције CI/CD цевовода
- Развој и дистрибуција прилагођених шаблона
- Управљање и усаглашеност предузећа
- Напредне мреже и безбедносне конфигурације
- Оптимизација перформанси и управљање трошковима

#### Практичне вежбе

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
# Креирајте и објавите прилагођене шаблоне:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercise 6.3: Enterprise Implementation**
```bash
# Имплементирајте функције корпоративног нивоа:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Питања за самооцењивање
1. Како интегришете azd у постојеће CI/CD токове рада?
2. Који су кључни аспекти развоја прилагођених шаблона?
3. Како спроводите управљање и усаглашеност у azd распоређивањима?
4. Које су најбоље праксе за распоређивања у предузећу на великој скали?
5. Како ефикасно доприносите azd заједници?

## Практични пројекти

### Пројекат 1: Лични портфолио веб-сајт
**Сложеност**: Почетник  
**Трајање**: 1-2 недеље

Изградите и распоредите лични портфолио веб-сајт користећи:
- Хостинг статичног веб-сајта на Azure Storage
- Конфигурација прилагођеног домена
- Интеграција CDN-а за глобалне перформансе
- Аутоматизовани процес за распоређивање

**Испоруке**:
- Функционалан сајт распоређен на Azure
- Прилагођени azd шаблон за распоређивања портфолија
- Документација процеса распоређивања
- Анализа трошкова и препоруке за оптимизацију

### Пројекат 2: Апликација за управљање задацима
**Сложеност**: Средњи ниво  
**Трајање**: 2-3 недеље

Креирајте full-stack апликацију за управљање задацима са:
- React фронтенд распоређен на App Service
- Node.js API бекенд са аутентикацијом
- PostgreSQL база података са миграцијама
- Праћење преко Application Insights

**Испоруке**:
- Целокупна апликација са корисничком аутентикацијом
- Шема базе података и скрипте за миграције
- Контролне табле за праћење и правила за алармирање
- Конфигурација распоређивања за више окружења

### Пројекат 3: Микросервисна платформа за е-трговину
**Сложеност**: Напредни  
**Трајање**: 4-6 недеља

Дизајнирајте и имплементирајте платформу за е-трговину базирану на микросервисима:
- Више API сервиса (каталог, поруџбине, плаћања, корисници)
- Интеграција реда порука са Service Bus
- Redis кеш за оптимизацију перформанси
- Свеобухватно бележење и праћење

**Референтни пример**: Погледајте [Архитектуру микросервиса](../../../examples/container-app/microservices) за шаблон спреман за продукцију и упутство за распоређивање

**Испоруке**:
- Комплетна микросервисна архитектура
- Обрасци међусервисне комуникације
- Тестирање перформанси и оптимизација
- Имплементација безбедности спремна за продукцију

## Процена и сертификовање

### Провере знања

Завршите ове провере након сваког модула:

**Процена модула 1**: Основни концепти и инсталација
- Питања са вишеструким избором о основним концептима
- Практични задаци инсталације и конфигурације
- Једноставна вежба распоређивања

**Процена модула 2**: Конфигурација и окружења
- Сценарији управљања окружењем
- Вежбе за решавање проблема у конфигурацији
- Имплементација безбедносних конфигурација

**Процена модула 3**: Распоређивање и провизионисање
- Изазови дизајна инфраструктуре
- Сценарији распоређивања више сервиса
- Вежбе оптимизације перформанси

**Процена модула 4**: Валидација пре распоређивања
- Студије случаја планирања капацитета
- Сценарији оптимизације трошкова
- Имплементација валидационих цевовода

**Процена модула 5**: Решавање проблема и дебаговање
- Вежбе дијагнозе проблема
- Задаци имплементације праћења
- Симулације реаговања на инциденте

**Процена модула 6**: Напредне теме
- Дизајн CI/CD цевовода
- Развој прилагођених шаблона
- Сценарији архитектуре за предузећа

### Финални завршни пројекат

Дизајнирајте и имплементирајте комплетно решење које демонстрира овладавање свим концептима:

**Захтеви**:
- Архитектура апликације у више нивоа
- Више окружења за распоређивање
- Свеобухватно праћење и алармирање
- Имплементација безбедности и усаглашености
- Оптимизација трошкова и подешавање перформанси
- Комплетна документација и оперативни приручници

**Критеријуми оцењивања**:
- Квалитет техничке имплементације
- Потпуност документације
- Придржавање безбедносних стандарда и најбољих пракси
- Оптимизација перформанси и трошкова
- Ефикасност у решавању проблема и праћењу

## Ресурси и референце

### Званична документација
- [Документација за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep документација](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Ресурси заједнице
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Практична окружења
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Додатни алати
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Препоруке распореда учења

### Пуно радно време (8 недеља)
- **Недеље 1-2**: Модули 1-2 (Увод, Конфигурација)
- **Недеље 3-4**: Модули 3-4 (Распоређивање, Пре-распоређивање)
- **Недеље 5-6**: Модули 5-6 (Решавање проблема, Напредне теме)
- **Недеље 7-8**: Практични пројекти и завршна процена

### Студије непуним радним временом (16 недеља)
- **Недеље 1-4**: Модул 1 (Увод)
- **Недеље 5-7**: Модул 2 (Конфигурација и окружења)
- **Недеље 8-10**: Модул 3 (Распоређивање и провизионисање)
- **Недеље 11-12**: Модул 4 (Валидација пре распоређивања)
- **Недеље 13-14**: Модул 5 (Решавање проблема и дебаговање)
- **Недеље 15-16**: Модул 6 (Напредне теме и процена)

---

## Праћење напретка и оквир за оцену

### Контролна листа завршетка поглавља

Пратите свој напредак кроз свако поглавље помоћу ових мерљивих исхода:

#### 📚 Поглавље 1: Основе и брзи почетак
- [ ] **Инсталација завршена**: AZD инсталиран и верификован на вашој платформи
- [ ] **Прво распоређивање**: Успешно распоређен шаблон todo-nodejs-mongo
- [ ] **Подешавање окружења**: Конфигурисане прве променљиве окружења
- [ ] **Навигација ресурса**: Истражени распоређени ресурси у Azure порталу
- [ ] **Владање командама**: Удобно са основним AZD командама

#### 🤖 Поглавље 2: Развој оријентисан на AI
- [ ] **Распоређивање AI шаблона**: Успешно распоређен azure-search-openai-demo
- [ ] **Имплементација RAG-а**: Конфигурисано индексирање и преузимање докумената
- [ ] **Конфигурација модела**: Подешени различити AI модели са различитим сврхама
- [ ] **Праћење AI**: Имплементиран Application Insights за AI радне оптерећења
- [ ] **Оптимизација перформанси**: Подешене перформансе AI апликације

#### ⚙️ Поглавље 3: Конфигурација и аутентикација
- [ ] **Подешавање више окружења**: Конфигурисана dev, staging и prod окружења
- [ ] **Имплементација безбедности**: Подешена аутентикација управљаним идентитетом
- [ ] **Управљање тајнама**: Интегрисан Azure Key Vault за осетљиве податке
- [ ] **Управљање параметрима**: Креиране конфигурације специфичне за окружење
- [ ] **Мастерство аутентикације**: Имплементирани сигурни обрасци приступа

#### 🏗️ Поглавље 4: Инфраструктура као код и распоређивање
- [ ] **Креирање прилагођеног шаблона**: Изграђен шаблон апликације са више сервиса
- [ ] **Вештина у Bicep-у**: Креирани модуларни, поново употребљиви инфраструктурни компоненти
- [ ] **Аутоматизација распоређивања**: Имплементиране скрипте пре/после распоређивања
- [ ] **Дизајн архитектуре**: Распоређена сложена микросервисна архитектура
- [ ] **Оптимизација шаблона**: Оптимизовани шаблони за перформансе и трошкове

#### 🎯 Поглавље 5: Решења AI са више агената
- [ ] **Распоређивање малопродајног решења**: Распоређен комплетан сценарио за више агената у малопродаји
- [ ] **Прилагођавање агената**: Модификовано понашање Customer и Inventory агената
- [ ] **Скалирање архитектуре**: Имплементирано балансирање оптерећења и аутоматско скалирање
- [ ] **Праћење у продукцији**: Постављено свеобухватно праћење и алармирање
- [ ] **Подешавање перформанси**: Оптимизовани перформанси система са више агената

#### 🔍 Поглавље 6: Валидација и планирање пре распоређивања
- [ ] **Анализа капацитета**: Анализирани захтеви ресурса за апликације
- [ ] **Оптимизација SKU-а**: Одабрани економични нивои услуга
- [ ] **Аутоматизација валидације**: Имплементиране скрипте за провере пре распоређивања
- [ ] **Планирање трошкова**: Креиране процене трошкова распоређивања и буџети
- [ ] **Оцењивање ризика**: Идентификовани и ублажени ризици распоређивања

#### 🚨 Поглавље 7: Решавање проблема и дебаговање
- [ ] **Дијагностичке вештине**: Успешно дебаговани намерно покварени деплоји
- [ ] **Анализа логова**: Ефикасно коришћење Azure Monitor и Application Insights
- [ ] **Подешавање перформанси**: Оптимизоване споро извршавајуће апликације
- [ ] **Процедуре опоравка**: Имплементирани резервни и процедури опоравка
- [ ] **Подешавање праћења**: Креирано проактивно праћење и алармирање

#### 🏢 Поглавље 8: Продукцијски и предузетнички обрасци
- [ ] **Индустријска безбедност**: Имплементирани свеобухватни безбедносни обрасци
- [ ] **Оквир управљања**: Подешен Azure Policy и управљање ресурсима
- [ ] **Напредно праћење**: Креиране контролне табле и аутоматско алармирање
- [ ] **CI/CD интеграција**: Изграђени аутоматизовани деплоyмент цевоводи
- [ ] **Имплементација усаглашености**: Испуњени захтеви усаглашености предузећа

### Временска линија учења и прекретнице

#### Недеље 1-2: Изградња основа
- **Циљ**: Распоредити прву AI апликацију користећи AZD
- **Валидација**: Функционална апликација доступна преко јавног URL-а
- **Вештине**: Основни AZD токови рада и интеграција AI сервиса

#### Недеље 3-4: Савладавање конфигурације
- **Циљ**: Распоређивање у више окружења са сигурном аутентикацијом
- **Валидација**: Иста апликација распоређена у dev/staging/prod
- **Вештине**: Управљање окружењима и имплементација безбедности

#### Недеље 5-6: Стручност у инфраструктури
- **Циљ**: Прилагођени шаблон за сложену апликацију са више сервиса
- **Валидација**: Поново употребљив шаблон распоређен од стране другог члана тима
- **Вештине**: Мастерство у Bicep-у и аутоматизација инфраструктуре

#### Недеље 7-8: Напредна AI имплементација
- **Циљ**: Решење са више агената спремно за продукцију
- **Валидација**: Систем подноси реално оптерећење са праћењем
- **Вештине**: Оркестрација више агената и оптимизација перформанси

#### Недеље 9-10: Спремност за продукцију
- **Циљ**: Распоређивање у предузећу са пуном усаглашеношћу
- **Валидација**: Прошао безбедносни преглед и ревизију оптимизације трошкова
- **Вештине**: Управљање, праћење и CI/CD интеграција

### Методе провере знања
1. **Практична распоређивања**: Функционалне апликације за свако поглавље
2. **Прегледи кода**: Процена квалитета шаблона и конфигурације
3. **Решавање проблема**: Сценарији и решења за дијагнозу
4. **Подучавање вршњака**: Објашњавање концепата другим ученицима
5. **Допринос заједници**: Дељење шаблона или унапређења

#### Исходи професионалног развоја
- **Портфолио пројекти**: 8 production-ready deployments
- **Техничке вештине**: Industry-standard AZD and AI deployment expertise
- **Сопствене способности у решавању проблема**: Independent troubleshooting and optimization
- **Признање у заједници**: Active participation in Azure developer community
- **Напредовање у каријери**: Skills directly applicable to cloud and AI roles

#### Метрике успеха
- **Стопа успешности имплементација**: >95% successful deployments
- **Време за отклањање проблема**: <30 minutes for common issues
- **Оптимизација перформанси**: Demonstrable improvements in cost and performance
- **Сагласност са безбедносним стандардима**: All deployments meet enterprise security standards
- **Пренос знања**: Ability to mentor other developers

### Континуирано учење и ангажман заједнице

#### Останите у току
- **Ажурирања Azure**: Follow Azure Developer CLI release notes
- **Догађаји заједнице**: Participate in Azure and AI developer events
- **Документација**: Contribute to community documentation and examples
- **Повратна информација**: Provide feedback on course content and Azure services

#### Развој каријере
- **Професионална мрежа**: Connect with Azure and AI experts
- **Могућности за говор**: Present learnings at conferences or meetups
- **Допринесци отвореном коду**: Contribute to AZD templates and tools
- **Менторство**: Guide other developers in their AZD learning journey

---

**Навигација кроз поглавља:**
- **📚 Почетна страница курса**: [AZD за почетнике](../README.md)
- **📖 Почните са учењем**: [Поглавље 1: Основа & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Праћење напретка**: Track your advancement through the comprehensive 8-chapter learning system
- **🤝 Заједница**: [Azure Discord](https://discord.gg/microsoft-azure) за подршку и дискусију

**Праћење напретка учења**: Користите овај структурисани водич да савладате Azure Developer CLI кроз прогресивно, практично учење са мерљивим резултатима и користима за професионални развој.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање од одговорности**:
Овај документ је преведен уз помоћ AI сервиса за превођење [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да будемо прецизни, молимо имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на свом изворном језику треба сматрати обавезујућим извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
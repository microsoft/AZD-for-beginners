<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-10T07:14:51+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "sr"
}
-->
# Водич за учење - AZD за почетнике

## Увод

Овај свеобухватни водич за учење пружа структуиране циљеве учења, кључне концепте, вежбе и материјале за процену како би вам помогао да савладате Azure Developer CLI (azd). Користите овај водич за праћење напретка и осигурајте да сте обрадили све важне теме.

## Циљеви учења

Завршетком овог водича за учење, моћи ћете:
- Савладати све основне и напредне концепте Azure Developer CLI
- Развити практичне вештине у распоређивању и управљању Azure апликацијама
- Стекнути самопоуздање у решавању проблема и оптимизацији распоређивања
- Разумети праксе за продукцијско распоређивање и безбедносне аспекте

## Исходи учења

Након завршетка свих секција овог водича, бићете у могућности да:
- Дизајнирате, распоређујете и управљате комплетним архитектурама апликација користећи azd
- Примените свеобухватне стратегије за мониторинг, безбедност и оптимизацију трошкова
- Самостално решавате сложене проблеме са распоређивањем
- Креирате прилагођене шаблоне и доприносите azd заједници

## Структура курса

### Модул 1: Почетак рада (1-2 недеље)

#### Циљеви учења
- Разумети основе и кључне концепте Azure Developer CLI
- Успешно инсталирати и конфигурисати azd у вашем развојном окружењу
- Завршити прво распоређивање користећи постојећи шаблон
- Снаћи се у azd структури пројекта и разумети кључне компоненте

#### Кључни концепти за савладавање
- Шаблони, окружења и услуге
- azure.yaml структура конфигурације
- Основне azd команде (init, up, down, deploy)
- Принципи Infrastructure as Code
- Azure аутентикација и ауторизација

#### Вежбе

**Вежба 1.1: Инсталација и подешавање**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Вежба 1.2: Прво распоређивање**  
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Вежба 1.3: Анализа структуре пројекта**  
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Питања за самопроцену
1. Која су три основна концепта azd архитектуре?
2. Која је сврха azure.yaml датотеке?
3. Како окружења помажу у управљању различитим циљевима распоређивања?
4. Које методе аутентикације могу да се користе са azd?
5. Шта се дешава када први пут покренете `azd up`?

### Модул 2: Конфигурација и окружења (3. недеља)

#### Циљеви учења
- Савладати управљање окружењима и конфигурацијом
- Разумети напредне azure.yaml конфигурације
- Применити подешавања и променљиве специфичне за окружење
- Конфигурисати аутентикацију за различите сценарије

#### Кључни концепти за савладавање
- Хијерархија окружења и приоритет променљивих
- Конфигурација услуга и параметара
- Хукови и животни циклус догађаја
- Методе аутентикације (корисник, service principal, managed identity)
- Управљање конфигурационим датотекама

#### Вежбе

**Вежба 2.1: Подешавање више окружења**  
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Вежба 2.2: Напредна конфигурација**  
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Вежба 2.3: Безбедносна конфигурација**  
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Питања за самопроцену
1. Како azd управља приоритетом променљивих у окружењима?
2. Шта су хукови за распоређивање и када их треба користити?
3. Како конфигурисати различите SKUs за различита окружења?
4. Које су безбедносне импликације различитих метода аутентикације?
5. Како управљати тајнама и осетљивим подацима у конфигурацији?

### Модул 3: Распоређивање и провизионисање (4. недеља)

#### Циљеви учења
- Савладати токове рада и најбоље праксе за распоређивање
- Разумети Infrastructure as Code са Bicep шаблонима
- Применити сложене архитектуре са више услуга
- Оптимизовати перформансе и поузданост распоређивања

#### Кључни концепти за савладавање
- Структура и модули Bicep шаблона
- Зависности ресурса и редослед
- Стратегије распоређивања (blue-green, rolling updates)
- Распоређивање у више региона
- Миграције база података и управљање подацима

#### Вежбе

**Вежба 3.1: Прилагођена инфраструктура**  
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Вежба 3.2: Апликација са више услуга**  
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Вежба 3.3: Интеграција базе података**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Питања за самопроцену
1. Које су предности коришћења Bicep-а у односу на ARM шаблоне?
2. Како се управља миграцијама база података у azd распоређивањима?
3. Које стратегије постоје за распоређивање без застоја?
4. Како управљати зависностима између услуга?
5. Који су кључни аспекти распоређивања у више региона?

### Модул 4: Провера пре распоређивања (5. недеља)

#### Циљеви учења
- Применити свеобухватне провере пре распоређивања
- Савладати планирање капацитета и валидацију ресурса
- Разумети избор SKU-ова и оптимизацију трошкова
- Изградити аутоматизоване валидационе процесе

#### Кључни концепти за савладавање
- Azure квоте ресурса и ограничења
- Критеријуми за избор SKU-ова и импликације на трошкове
- Аутоматизовани валидациони скриптови и алати
- Методологије за планирање капацитета
- Тестирање перформанси и оптимизација

#### Вежбе

**Вежба 4.1: Планирање капацитета**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Вежба 4.2: Провера пре распоређивања**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Вежба 4.3: Оптимизација SKU-ова**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Питања за самопроцену
1. Који фактори утичу на одлуке о избору SKU-ова?
2. Како проверити доступност Azure ресурса пре распоређивања?
3. Који су кључни елементи система за проверу пре распоређивања?
4. Како проценити и контролисати трошкове распоређивања?
5. Који мониторинг је неопходан за планирање капацитета?

### Модул 5: Решавање проблема и отклањање грешака (6. недеља)

#### Циљеви учења
- Савладати систематске методологије за решавање проблема
- Развити експертизу у отклањању сложених проблема са распоређивањем
- Применити свеобухватан мониторинг и алармирање
- Изградити процедуре за одговор на инциденте и опоравак

#### Кључни концепти за савладавање
- Уобичајени обрасци неуспеха распоређивања
- Анализа логова и технике корелације
- Мониторинг перформанси и оптимизација
- Детекција безбедносних инцидената и одговор
- Опоравак од катастрофа и континуитет пословања

#### Вежбе

**Вежба 5.1: Сценарији за решавање проблема**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Вежба 5.2: Имплементација мониторинга**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Вежба 5.3: Одговор на инциденте**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Питања за самопроцену
1. Који је систематски приступ решавању проблема са azd распоређивањима?
2. Како корелирати логове из више услуга и ресурса?
3. Који су најважнији метрици за рано откривање проблема?
4. Како имплементирати ефикасне процедуре за опоравак од катастрофа?
5. Који су кључни елементи плана за одговор на инциденте?

### Модул 6: Напредне теме и најбоље праксе (7-8 недеља)

#### Циљеви учења
- Применити обрасце распоређивања на нивоу предузећа
- Савладати интеграцију и аутоматизацију CI/CD
- Развити прилагођене шаблоне и допринети заједници
- Разумети напредне безбедносне и регулаторне захтеве

#### Кључни концепти за савладавање
- Обрасци интеграције CI/CD процеса
- Развој и дистрибуција прилагођених шаблона
- Управљање и усклађеност на нивоу предузећа
- Напредне мрежне и безбедносне конфигурације
- Оптимизација перформанси и управљање трошковима

#### Вежбе

**Вежба 6.1: Интеграција CI/CD**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Вежба 6.2: Развој прилагођених шаблона**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Вежба 6.3: Имплементација на нивоу предузећа**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Питања за самопроцену
1. Како интегрисати azd у постојеће CI/CD токове рада?
2. Који су кључни аспекти развоја прилагођених шаблона?
3. Како имплементирати управљање и усклађеност у azd распоређивањима?
4. Које су најбоље праксе за распоређивања на нивоу предузећа?
5. Како ефикасно допринети azd заједници?
3. **Доприносите отвореном коду**: Делите своје шаблоне и решења са заједницом  
4. **Подучавајте друге**: Објашњавање концепата другима јача ваше сопствено разумевање  
5. **Будите радознали**: Стално истражујте нове Azure услуге и обрасце интеграције  

---

**Навигација**  
- **Претходна лекција**: [FAQ](faq.md)  
- **Следећа лекција**: [Changelog](../changelog.md)  

**Праћење напретка у учењу**: Користите овај водич да пратите своје путовање у учењу и осигурате свеобухватно покривање свих концепата и пракси Azure Developer CLI.  

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да обезбедимо тачност, молимо вас да имате у виду да аутоматизовани преводи могу садржати грешке или нетачности. Оригинални документ на изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људи. Не сносимо одговорност за било каква погрешна тумачења или неспоразуме који могу произаћи из коришћења овог превода.
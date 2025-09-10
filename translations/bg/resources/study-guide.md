<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-10T07:13:11+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "bg"
}
-->
# Учебно ръководство - AZD за начинаещи

## Въведение

Това изчерпателно учебно ръководство предоставя структурирани учебни цели, ключови концепции, практически упражнения и материали за оценка, за да ви помогне да овладеете Azure Developer CLI (azd). Използвайте това ръководство, за да следите напредъка си и да се уверите, че сте покрили всички основни теми.

## Цели на обучението

След завършване на това учебно ръководство, ще можете:
- Да овладеете всички основни и напреднали концепции на Azure Developer CLI
- Да развиете практически умения за разгръщане и управление на приложения в Azure
- Да изградите увереност в диагностицирането и оптимизирането на разгръщания
- Да разберете практиките за разгръщане в продукционна среда и съображенията за сигурност

## Резултати от обучението

След завършване на всички секции от това ръководство, ще можете:
- Да проектирате, разгръщате и управлявате цялостни архитектури на приложения с azd
- Да внедрявате цялостни стратегии за мониторинг, сигурност и оптимизация на разходите
- Да диагностицирате сложни проблеми с разгръщането самостоятелно
- Да създавате персонализирани шаблони и да допринасяте към общността на azd

## Структура на курса

### Модул 1: Първи стъпки (Седмици 1-2)

#### Цели на обучението
- Да разберете основите и ключовите концепции на Azure Developer CLI
- Да инсталирате и конфигурирате успешно azd във вашата среда за разработка
- Да завършите първото си разгръщане, използвайки съществуващ шаблон
- Да навигирате в структурата на проектите на azd и да разберете основните компоненти

#### Ключови концепции за овладяване
- Шаблони, среди и услуги
- Структура на конфигурацията в azure.yaml
- Основни команди на azd (init, up, down, deploy)
- Принципи на Infrastructure as Code
- Автентикация и авторизация в Azure

#### Практически упражнения

**Упражнение 1.1: Инсталация и настройка**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Упражнение 1.2: Първо разгръщане**  
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Упражнение 1.3: Анализ на структурата на проекта**  
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Въпроси за самооценка
1. Кои са трите основни концепции на архитектурата на azd?
2. Каква е целта на файла azure.yaml?
3. Как средите помагат за управление на различни цели за разгръщане?
4. Какви методи за автентикация могат да се използват с azd?
5. Какво се случва, когато за първи път изпълните `azd up`?

### Модул 2: Конфигурация и среди (Седмица 3)

#### Цели на обучението
- Да овладеете управлението и конфигурацията на среди
- Да разберете напреднали конфигурации в azure.yaml
- Да внедрите настройки и променливи, специфични за средата
- Да конфигурирате автентикация за различни сценарии

#### Ключови концепции за овладяване
- Йерархия на средите и приоритет на променливите
- Конфигурация на услуги и параметри
- Хуки и събития в жизнения цикъл
- Методи за автентикация (потребител, service principal, managed identity)
- Управление на конфигурационни файлове

#### Практически упражнения

**Упражнение 2.1: Настройка на множество среди**  
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Упражнение 2.2: Напреднала конфигурация**  
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Упражнение 2.3: Конфигурация на сигурността**  
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Въпроси за самооценка
1. Как azd обработва приоритета на променливите в средите?
2. Какво представляват хуковете за разгръщане и кога трябва да ги използвате?
3. Как конфигурирате различни SKUs за различни среди?
4. Какви са съображенията за сигурност при различните методи за автентикация?
5. Как управлявате тайни и чувствителни данни за конфигурация?

### Модул 3: Разгръщане и провизиране (Седмица 4)

#### Цели на обучението
- Да овладеете работните потоци за разгръщане и най-добрите практики
- Да разберете Infrastructure as Code с Bicep шаблони
- Да внедрите сложни архитектури с множество услуги
- Да оптимизирате производителността и надеждността на разгръщането

#### Ключови концепции за овладяване
- Структура и модули на Bicep шаблони
- Зависимости и ред на ресурсите
- Стратегии за разгръщане (blue-green, rolling updates)
- Разгръщания в множество региони
- Миграции на бази данни и управление на данни

#### Практически упражнения

**Упражнение 3.1: Персонализирана инфраструктура**  
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Упражнение 3.2: Приложение с множество услуги**  
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Упражнение 3.3: Интеграция на база данни**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Въпроси за самооценка
1. Какви са предимствата на използването на Bicep вместо ARM шаблони?
2. Как обработвате миграции на бази данни при разгръщания с azd?
3. Какви стратегии съществуват за разгръщания без прекъсване?
4. Как управлявате зависимостите между услугите?
5. Какви са съображенията за разгръщания в множество региони?

### Модул 4: Валидация преди разгръщане (Седмица 5)

#### Цели на обучението
- Да внедрите цялостни проверки преди разгръщане
- Да овладеете планирането на капацитет и валидирането на ресурси
- Да разберете избора на SKU и оптимизацията на разходите
- Да изградите автоматизирани валидиращи потоци

#### Ключови концепции за овладяване
- Квоти и ограничения на ресурсите в Azure
- Критерии за избор на SKU и разходни съображения
- Автоматизирани скриптове и инструменти за валидиране
- Методи за планиране на капацитет
- Тестване на производителността и оптимизация

#### Практически упражнения

**Упражнение 4.1: Планиране на капацитет**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Упражнение 4.2: Валидация преди разгръщане**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Упражнение 4.3: Оптимизация на SKU**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Въпроси за самооценка
1. Какви фактори трябва да влияят на решенията за избор на SKU?
2. Как валидирате наличността на ресурси в Azure преди разгръщане?
3. Какви са ключовите компоненти на система за проверка преди разгръщане?
4. Как оценявате и контролирате разходите за разгръщане?
5. Какъв мониторинг е необходим за планиране на капацитет?

### Модул 5: Диагностика и отстраняване на проблеми (Седмица 6)

#### Цели на обучението
- Да овладеете систематични методологии за диагностика
- Да развиете експертиза в отстраняването на сложни проблеми с разгръщането
- Да внедрите цялостен мониторинг и известяване
- Да изградите процедури за реакция при инциденти и възстановяване

#### Ключови концепции за овладяване
- Чести модели на провал при разгръщане
- Анализ на логове и техники за корелация
- Мониторинг на производителността и оптимизация
- Откриване и реакция при инциденти със сигурността
- Възстановяване след бедствия и непрекъснатост на бизнеса

#### Практически упражнения

**Упражнение 5.1: Сценарии за диагностика**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Упражнение 5.2: Внедряване на мониторинг**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Упражнение 5.3: Реакция при инциденти**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Въпроси за самооценка
1. Какъв е систематичният подход за диагностика на разгръщания с azd?
2. Как корелирате логове между множество услуги и ресурси?
3. Какви метрики за мониторинг са най-важни за ранно откриване на проблеми?
4. Как внедрявате ефективни процедури за възстановяване след бедствия?
5. Какви са ключовите компоненти на план за реакция при инциденти?

### Модул 6: Напреднали теми и най-добри практики (Седмици 7-8)

#### Цели на обучението
- Да внедрите модели за разгръщане на корпоративно ниво
- Да овладеете интеграцията и автоматизацията на CI/CD
- Да разработите персонализирани шаблони и да допринесете към общността
- Да разберете напреднали изисквания за сигурност и съответствие

#### Ключови концепции за овладяване
- Модели за интеграция на CI/CD потоци
- Разработка и разпространение на персонализирани шаблони
- Управление и съответствие на корпоративно ниво
- Напреднали конфигурации за мрежи и сигурност
- Оптимизация на производителността и управление на разходите

#### Практически упражнения

**Упражнение 6.1: Интеграция на CI/CD**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Упражнение 6.2: Разработка на персонализирани шаблони**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Упражнение 6.3: Внедряване на корпоративно ниво**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Въпроси за самооценка
1. Как интегрирате azd в съществуващи CI/CD потоци?
2. Какви са ключовите съображения при разработката на персонализирани шаблони?
3. Как внедрявате управление и съответствие в разгръщания с azd?
4. Какви са най-добрите практики за разгръщания на корпоративно ниво?
5. Как ефективно допринасяте към общността на azd?

## Практически проекти

### Проект 1: Личен уебсайт портфолио  
**Сложност**: Начинаещ  
**Продължителност**: 1-2 седмици  

Създайте и разгръщайте личен уебсайт портфолио, използвайки:
- Хостинг на статичен уебсайт в Azure Storage
- Конфигурация на персонализиран домейн
- Интеграция на CDN за глобална производителност
- Автоматизиран поток за разгръщане  

**Резултати**:
- Работещ уебсайт, разположен в Azure
- Персонализиран azd шаблон за разгръщания на портфолио
- Документация на процеса на разгръщане
- Препоръки за анализ и оптимизация на разходите  

### Проект 2: Приложение за управление на задачи  
**Сложност**: Средно напреднал  
**Продължителност**: 2-3 седмици  

Създайте приложение за управление на задачи с пълна функционалност, включващо:
- React фронтенд, разположен в App Service
- Node.js API бекенд с автентикация
- PostgreSQL база данни с миграции
- Мониторинг с Application Insights  

**Резултати**:
- Завършено приложение с автентикация на потребители
- Скриптове за схема на база данни и миграции
- Табла за мониторинг и правила за известяване
- Конфигурация за разгръщане в множество среди  

### Проект 3: Платформа за електронна търговия с микросървиси  
**Сложност**: Напреднал  
**Продължителност**: 4-6 седмици  

Проектирайте и внедрете платформа за електронна търговия, базирана на микросървиси:
- Множество API услуги (каталог, поръчки, плащания, потребители)
- Интеграция на опашка за съобщения със Service Bus
- Redis кеш за оптимизация на производителността
- Цялостен мониторинг и логване  

**Резултати**:
- Завършена архитектура с микросървиси
- Модели за комуникация между услугите
- Тестване и оптимизация на производителността
- Внедряване на сигурност, готова за продукция  

## Оценка и сертификация

### Проверки на знанията

Завършете тези оценки след всеки модул:

**Оценка за модул 1**: Основни концепции и инсталация  
- Въпроси с избор на отговори за основни концепции  
- Практически задачи за инсталация и конфигурация  
- Упражнение за просто разгръщане  

**Оценка за модул 2**: Конфигурация и среди  
- Сценарии за управление на среди  
- Упражнения за диагностика на конфигурация  
- Внедряване на конфигурация за сигурност  

**Оценка за модул 3**: Разгръщане и провизиране  
- Предизвикателства за дизайн на инфраструктура  
- Сценарии за разгръщане с множество услуги  
- Упражнения за оптимизация на производителността  

**Оценка за модул 4**: Валидация преди разгръщане  
- Казуси за планиране на капацитет  
- Сценарии за оптимизация на разходите  
- Внедряване на валидиращи потоци  

**Оценка за модул 5**: Диагностика и отстраняване на проблеми  
- Упражнения за диагностика на проблеми  
- Задачи за внедряване на мониторинг  
- Симулации за реакция при инциденти  

**Оценка за модул 6**: Напреднали теми  
- Дизайн на CI/CD потоци  
- Разработка на персонализирани шаблони  
- Сценарии за архитектура на корпоративно ниво  

### Финален проект

Проектирайте и внедрете цялостно решение, което демонстрира овладяване на всички концепции:

**Изисквания**:
- Архитектура на приложение с множество слоеве  
- Множество среди за разгръщане  
- Цялостен мониторинг и известяване  
- Внедряване на сигурност и съответствие  
- Оптимизация на разходите и производителността  
- Пълна документация и ръководства  

**Критерии за оценка**:
- Качество на техническата реализация  
- Пълнота на документацията  
- Спазване на сигурността и най-добрите практики  
- Оптимизация на производителността и разходите  
- Ефективност на диагностика и мониторинг  

## Учебни ресурси и препратки

### Официална документация
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Ресурси от общността
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)  

### Практически среди
- [Azure Free Account](https://azure.microsoft.com/free/)  
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Допълнителни инструменти
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code
3. **Допринасяйте за отворен код**: Споделяйте вашите шаблони и решения с общността  
4. **Обучавайте другите**: Обясняването на концепции на другите укрепва вашето собствено разбиране  
5. **Бъдете любопитни**: Постоянно изследвайте нови услуги на Azure и модели за интеграция  

---

**Навигация**  
- **Предишен урок**: [FAQ](faq.md)  
- **Следващ урок**: [Changelog](../changelog.md)  

**Проследяване на напредъка в обучението**: Използвайте това ръководство, за да следите вашето учебно пътуване и да осигурите цялостно покритие на всички концепции и практики на Azure Developer CLI.  

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия изходен език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод от човек. Ние не носим отговорност за каквито и да е недоразумения или погрешни интерпретации, произтичащи от използването на този превод.
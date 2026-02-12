# AZD For Beginners: Course Outline & Learning Framework

## Course Overview

Master Azure Developer CLI (azd) through structured chapters designed for progressive learning. **Special focus on AI application deployment with Microsoft Foundry integration.**

### Why This Course is Essential for Modern Developers

Based on Microsoft Foundry Discord community insights, **45% of developers want to use AZD for AI workloads** but encounter challenges with:
- Complex multi-service AI architectures
- Production AI deployment best practices  
- Azure AI service integration and configuration
- Cost optimization for AI workloads
- Troubleshooting AI-specific deployment issues

### Core Learning Objectives

By completing this structured course, you will:
- **Master AZD Fundamentals**: Core concepts, installation, and configuration
- **Deploy AI Applications**: Use AZD with Microsoft Foundry services
- **Implement Infrastructure as Code**: Manage Azure resources with Bicep templates
- **Troubleshoot Deployments**: Resolve common issues and debug problems
- **Optimize for Production**: Security, scaling, monitoring, and cost management
- **Build Multi-Agent Solutions**: Deploy complex AI architectures

## 🎓 Workshop Learning Experience

### Flexible Learning Delivery Options
This course is designed to support both **self-paced individual learning** and **facilitated workshop sessions**, enabling learners to get hands-on experience with AZD while developing practical skills through interactive exercises.

#### 🚀 Self-Paced Learning Mode
**Perfect for individual developers and continuous learning**

**Features:**
- **Browser-Based Interface**: Complete MkDocs-powered workshop accessible through any web browser
- **GitHub Codespaces Integration**: One-click development environment with pre-configured tools
- **Interactive DevContainer Environment**: No local setup required - start coding immediately
- **Progress Tracking**: Built-in checkpoints and validation exercises
- **Community Support**: Access to Azure Discord channels for questions and collaboration

**Learning Structure:**
- **Flexible Timing**: Complete chapters at your own pace over days or weeks
- **Checkpoint System**: Validate learning before advancing to complex topics
- **Resource Library**: Comprehensive documentation, examples, and troubleshooting guides
- **Portfolio Development**: Build deployable projects for professional portfolios

**Getting Started (Self-Paced):**
```bash
# Варіант 1: GitHub Codespaces (Рекомендовано)
# Перейдіть до репозиторію та натисніть "Code" → "Create codespace on main"

# Варіант 2: Локальна розробка
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Дотримуйтесь інструкцій з налаштування у workshop/README.md
```

#### 🏛️ Facilitated Workshop Sessions
**Ideal for corporate training, bootcamps, and educational institutions**

**Workshop Format Options:**

**📚 Academic Course Integration (8-12 weeks)**
- **University Programs**: Semester-long course with weekly 2-hour sessions
- **Bootcamp Format**: Intensive 3-5 day program with daily 6-8 hour sessions
- **Corporate Training**: Monthly team sessions with practical project implementation
- **Assessment Framework**: Graded assignments, peer reviews, and final projects

**🚀 Intensive Workshop (1-3 days)**
- **Day 1**: Foundation + AI Development (Chapters 1-2) - 6 hours
- **Day 2**: Configuration + Infrastructure (Chapters 3-4) - 6 hours  
- **Day 3**: Advanced Patterns + Production (Chapters 5-8) - 8 hours
- **Follow-up**: Optional 2-week mentorship for project completion

**⚡ Executive Briefing (4-6 hours)**
- **Strategic Overview**: AZD value proposition and business impact (1 hour)
- **Hands-On Demo**: Deploy AI application end-to-end (2 hours)
- **Architecture Review**: Enterprise patterns and governance (1 hour)
- **Implementation Planning**: Organizational adoption strategy (1-2 hours)

#### 🛠️ Workshop Learning Methodology
**Discovery → Deployment → Customization approach for hands-on skill development**

**Phase 1: Discovery (45 minutes)**
- **Template Exploration**: Evaluate Microsoft Foundry templates and services
- **Architecture Analysis**: Understand multi-agent patterns and deployment strategies
- **Requirement Assessment**: Identify organizational needs and constraints
- **Environment Setup**: Configure development environment and Azure resources

**Phase 2: Deployment (2 hours)**
- **Guided Implementation**: Step-by-step deployment of AI applications with AZD
- **Service Configuration**: Configure Azure AI services, endpoints, and authentication
- **Security Implementation**: Apply enterprise security patterns and access controls
- **Validation Testing**: Verify deployments and troubleshoot common issues

**Phase 3: Customization (45 minutes)**
- **Application Modification**: Adapt templates for specific use cases and requirements
- **Production Optimization**: Implement monitoring, cost management, and scaling strategies
- **Advanced Patterns**: Explore multi-agent coordination and complex architectures
- **Next Steps Planning**: Define learning path for continued skill development

#### 🎯 Workshop Learning Outcomes
**Measurable skills developed through hands-on practice**

**Technical Competencies:**
- **Deploy Production AI Applications**: Successfully deploy and configure AI-powered solutions
- **Infrastructure as Code Mastery**: Create and manage custom Bicep templates
- **Multi-Agent Architecture**: Implement coordinated AI agent solutions
- **Production Readiness**: Apply security, monitoring, and governance patterns
- **Troubleshooting Expertise**: Independently resolve deployment and configuration issues

**Professional Skills:**
- **Project Leadership**: Lead technical teams in cloud deployment initiatives
- **Architecture Design**: Design scalable, cost-effective Azure solutions
- **Knowledge Transfer**: Train and mentor colleagues in AZD best practices
- **Strategic Planning**: Influence organizational cloud adoption strategies

#### 📋 Workshop Resources and Materials
**Comprehensive toolkit for facilitators and learners**

**For Facilitators:**
- **Instructor Guide**: [Workshop Overview](workshop/README.md) - Session planning and delivery guidance
- **Presentation Materials**: Slide decks, architecture diagrams, and demo scripts
- **Assessment Tools**: Practical exercises, knowledge checks, and evaluation rubrics
- **Technical Setup**: Environment configuration, troubleshooting guides, and backup plans

**For Learners:**
- **Interactive Workshop Environment**: [Workshop Materials](workshop/README.md) - Browser-based learning platform
- **Step-by-Step Instructions**: [Guided Exercises](../../workshop/docs/instructions) - Detailed implementation walkthroughs  
- **Reference Documentation**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI-focused deep dives
- **Community Resources**: Azure Discord channels, GitHub discussions, and expert support

#### 🏢 Enterprise Workshop Implementation
**Organizational deployment and training strategies**

**Corporate Training Programs:**
- **Developer Onboarding**: New hire orientation with AZD fundamentals (2-4 weeks)
- **Team Upskilling**: Quarterly workshops for existing development teams (1-2 days)
- **Architecture Review**: Monthly sessions for senior engineers and architects (4 hours)
- **Leadership Briefings**: Executive workshops for technical decision makers (half-day)

**Implementation Support:**
- **Custom Workshop Design**: Tailored content for specific organizational needs
- **Pilot Program Management**: Structured rollout with success metrics and feedback loops  
- **Ongoing Mentorship**: Post-workshop support for project implementation
- **Community Building**: Internal Azure AI developer communities and knowledge sharing

**Success Metrics:**
- **Skill Acquisition**: Pre/post assessments measuring technical competency growth
- **Deployment Success**: Percentage of participants successfully deploying production applications
- **Time to Productivity**: Reduced onboarding time for new Azure AI projects
- **Knowledge Retention**: Follow-up assessments 3-6 months post-workshop

## 8-Chapter Learning Structure

### Chapter 1: Foundation & Quick Start (30-45 minutes) 🌱
**Prerequisites**: Azure subscription, basic command line knowledge  
**Complexity**: ⭐

#### What You'll Learn
- Understanding Azure Developer CLI fundamentals
- Installing AZD on your platform  
- Your first successful deployment
- Core concepts and terminology

#### Learning Resources
- [AZD Basics](docs/getting-started/azd-basics.md) - Core concepts
- [Installation & Setup](docs/getting-started/installation.md) - Platform-specific guides
- [Your First Project](docs/getting-started/first-project.md) - Hands-on tutorial
- [Command Cheat Sheet](resources/cheat-sheet.md) - Quick reference

#### Practical Outcome
Successfully deploy a simple web application to Azure using AZD

---

### Chapter 2: AI-First Development (1-2 hours) 🤖
**Prerequisites**: Chapter 1 completed  
**Complexity**: ⭐⭐

#### What You'll Learn
- Microsoft Foundry integration with AZD
- Deploying AI-powered applications
- Understanding AI service configurations
- RAG (Retrieval-Augmented Generation) patterns

#### Learning Resources
- [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - **НОВЕ**: Comprehensive 2-3 hour hands-on lab
- [Interactive Workshop Guide](workshop/README.md) - **НОВЕ**: Browser-based workshop with MkDocs preview
- [Microsoft Foundry Templates](README.md#featured-microsoft-foundry-templates)
- [Workshop Instructions](../../workshop/docs/instructions) - **НОВЕ**: Step-by-step guided exercises

#### Practical Outcome
Deploy and configure an AI-powered chat application with RAG capabilities

#### Workshop Learning Path (Optional Enhancement)
**НОВИЙ інтерактивний досвід**: [Complete Workshop Guide](workshop/README.md)
1. **Discovery** (30 mins): Template selection and evaluation
2. **Deployment** (45 mins): Deploy and validate AI template functionality  
3. **Deconstruction** (30 mins): Understand template architecture and components
4. **Configuration** (30 mins): Customize settings and parameters
5. **Customization** (45 mins): Modify and iterate to make it yours
6. **Teardown** (15 mins): Clean up resources and understand lifecycle
7. **Wrap-up** (15 mins): Next steps and advanced learning paths

---

### Chapter 3: Configuration & Authentication (45-60 minutes) ⚙️
**Prerequisites**: Chapter 1 completed  
**Complexity**: ⭐⭐

#### What You'll Learn
- Environment configuration and management
- Authentication and security best practices
- Resource naming and organization
- Multi-environment deployments

#### Learning Resources
- [Configuration Guide](docs/getting-started/configuration.md) - Environment setup
- [Authentication & Security Patterns](docs/getting-started/authsecurity.md) - Managed identity and Key Vault integration
- Multi-environment examples

#### Practical Outcome
Manage multiple environments with proper authentication and security

---

### Chapter 4: Infrastructure as Code & Deployment (1-1.5 hours) 🏗️
**Prerequisites**: Chapters 1-3 completed  
**Complexity**: ⭐⭐⭐

#### What You'll Learn
- Advanced deployment patterns
- Infrastructure as Code with Bicep
- Resource provisioning strategies
- Custom template creation

- Containerized application deployment with Azure Container Apps and AZD

#### Learning Resources
- [Deployment Guide](docs/deployment/deployment-guide.md) - Complete workflows
- [Provisioning Resources](docs/deployment/provisioning.md) - Resource management
- Container and microservices examples
- [Container App Examples](examples/container-app/README.md) - Quick start, production, and advanced deployment patterns

#### Practical Outcome
Deploy complex multi-service applications using custom infrastructure templates

---

### Chapter 5: Multi-Agent AI Solutions (2-3 hours) 🤖🤖
**Prerequisites**: Chapters 1-2 completed  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- Multi-agent architecture patterns
- Agent orchestration and coordination
- Production-ready AI deployments
- Customer and Inventory agent implementations

- Integrating containerized microservices as part of agent-based solutions

#### Learning Resources
- [Retail Multi-Agent Solution](examples/retail-scenario.md) - Complete implementation
- [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- Multi-agent coordination patterns
- [Microservices Architecture Example](../../examples/container-app/microservices) - Service-to-service communication, async messaging, and production deployment

#### Practical Outcome
Deploy and manage a production-ready multi-agent AI solution

---

### Chapter 6: Pre-Deployment Validation & Planning (1 hour) 🔍
**Prerequisites**: Chapter 4 completed  
**Complexity**: ⭐⭐

#### What You'll Learn
- Capacity planning and resource validation
- SKU selection strategies
- Pre-flight checks and automation
- Cost optimization planning

#### Learning Resources
- [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Resource validation
- [SKU Selection](docs/pre-deployment/sku-selection.md) - Cost-effective choices
- [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automated scripts
- [Application Insights Integration](docs/pre-deployment/application-insights.md) - Monitoring and observability
- [Multi-Agent Coordination Patterns](docs/pre-deployment/coordination-patterns.md) - Agent orchestration strategies

#### Practical Outcome
Validate and optimize deployments before execution

---

### Розділ 7: Усунення несправностей та налагодження (1-1.5 години) 🔧
**Передумови**: Будь-який розділ з розгортання завершено  
**Складність**: ⭐⭐

#### Чого ви навчитеся
- Системні підходи до налагодження
- Поширені проблеми та рішення
- Усунення несправностей, специфічних для ШІ
- Оптимізація продуктивності

#### Ресурси для навчання
- [Common Issues](docs/troubleshooting/common-issues.md) - FAQ та рішення
- [Debugging Guide](docs/troubleshooting/debugging.md) - Покрокові стратегії
- [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Проблеми сервісів ШІ

#### Практичний результат
Самостійно діагностувати та вирішувати поширені проблеми при розгортанні

---

### Розділ 8: Продукційні та корпоративні патерни (2-3 години) 🏢
**Передумови**: Розділи 1-4 завершено  
**Складність**: ⭐⭐⭐⭐

#### Чого ви навчитеся
- Стратегії продукційного розгортання
- Патерни безпеки для підприємств
- Моніторинг та оптимізація витрат
- Масштабованість та управління

- Найкращі практики для розгортання контейнерних додатків у продакшні (безпека, моніторинг, витрати, CI/CD)

#### Ресурси для навчання
- [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - Корпоративні патерни
- Приклади мікросервісів та корпоративних рішень
- Фреймворки моніторингу та управління
- [Microservices Architecture Example](../../examples/container-app/microservices) - Blue-green/канарне розгортання, розподілене трасування та оптимізація витрат

#### Практичний результат
Розгорнути готові до підприємства додатки з повними продукційними можливостями

---

## Прогрес навчання та складність

### Поетапне нарощування навичок

- **🌱 Початківці**: Почніть з Розділу 1 (Основи) → Розділ 2 (Розробка ШІ)
- **🔧 Середній рівень**: Розділи 3-4 (Конфігурація & Інфраструктура) → Розділ 6 (Валідація)
- **🚀 Просунутий**: Розділ 5 (Багатоагентні рішення) → Розділ 7 (Усунення несправностей)
- **🏢 Корпоративний**: Завершити всі розділи, зосередитися на Розділі 8 (Продукційні патерни)

- **Шлях для контейнерних додатків**: Розділи 4 (Контейнеризоване розгортання), 5 (Інтеграція мікросервісів), 8 (Кращі практики для продакшну)

### Індикатори складності

- **⭐ Базовий**: Одна концепція, керовані навчальні матеріали, 30-60 хвилин
- **⭐⭐ Середній**: Декілька концепцій, практика, 1-2 години  
- **⭐⭐⭐ Просунутий**: Складні архітектури, індивідуальні рішення, 1-3 години
- **⭐⭐⭐⭐ Експерт**: Продукційні системи, корпоративні патерни, 2-4 години

### Гнучкі шляхи навчання

#### 🎯 Швидкий трек для розробника ШІ (4-6 годин)
1. **Розділ 1**: Основи та швидкий старт (45 хв)
2. **Розділ 2**: Розробка з фокусом на ШІ (2 години)  
3. **Розділ 5**: Багатоагентні ШІ-рішення (3 години)
4. **Розділ 8**: Кращі практики для продукційного ШІ (1 година)

#### 🛠️ Шлях спеціаліста з інфраструктури (5-7 годин)
1. **Розділ 1**: Основи та швидкий старт (45 хв)
2. **Розділ 3**: Конфігурація та автентифікація (1 година)
3. **Розділ 4**: Інфраструктура як код та розгортання (1.5 години)
4. **Розділ 6**: Попередня валідація та планування перед розгортанням (1 година)
5. **Розділ 7**: Усунення несправностей і налагодження (1.5 години)
6. **Розділ 8**: Продукційні та корпоративні патерни (2 години)

#### 🎓 Повний шлях навчання (8-12 годин)
Послідовне завершення всіх 8 розділів з практичними вправами та валідацією

## Структура завершення курсу

### Валідація знань
- **Контрольні точки розділів**: Практичні вправи з вимірюваними результатами
- **Практична перевірка**: Розгорніть працездатні рішення для кожного розділу
- **Відстеження прогресу**: Візуальні індикатори та значки завершення
- **Валідація спільноти**: Діліться досвідом у каналах Azure Discord

### Оцінювання результатів навчання

#### Завершення розділів 1-2 (Основи + ШІ)
- ✅ Розгорнути базовий веб-додаток за допомогою AZD
- ✅ Розгорнути чат-додаток на базі ШІ з RAG
- ✅ Зрозуміти основні концепції AZD та інтеграцію ШІ

#### Завершення розділів 3-4 (Конфігурація + Інфраструктура)  
- ✅ Керувати розгортаннями в кількох середовищах
- ✅ Створювати власні Bicep-шаблони інфраструктури
- ✅ Реалізувати надійні схеми автентифікації

#### Завершення розділів 5-6 (Багатоагентні + Валідація)
- ✅ Розгорнути складне багатоагентне ШІ-рішення
- ✅ Виконати планування потужностей та оптимізацію витрат
- ✅ Реалізувати автоматизовану попередню валідацію перед розгортанням

#### Завершення розділів 7-8 (Усунення несправностей + Продукційне)
- ✅ Налагоджувати та самостійно вирішувати проблеми розгортання  
- ✅ Впровадити моніторинг та безпеку рівня підприємства
- ✅ Розгорнути додатки, готові до продакшну, із впровадженими політиками управління

### Сертифікація та визнання
- **Бейдж за завершення курсу**: Завершити всі 8 розділів з практичною валідацією
- **Визнання спільноти**: Активна участь у Microsoft Foundry Discord
- **Професійний розвиток**: Галузево актуальні навички розгортання AZD та ШІ
- **Кар'єрний розвиток**: Здатність виконувати розгортання в хмарі на корпоративному рівні

## 🎓 Комплексні результати навчання

### Рівень: Основи (Розділи 1-2)
Після завершення базових розділів учні продемонструють:

**Технічні можливості:**
- Розгортати прості веб-додатки в Azure за допомогою команд AZD
- Налаштовувати та розгортати чат-додатки на базі ШІ з можливостями RAG
- Розуміти основні концепції AZD: шаблони, середовища, процеси розгортання
- Інтегрувати сервіси Microsoft Foundry з розгортаннями AZD
- Орієнтуватися в налаштуваннях сервісів Azure AI та кінцевих точках API

**Професійні навички:**
- Дотримуватися структурованих робочих процесів розгортання для послідовних результатів
- Усувати базові проблеми розгортання за допомогою логів та документації
- Ефективно комунікувати про процеси розгортання в хмарі
- Застосовувати найкращі практики для безпечної інтеграції сервісів ШІ

**Підтвердження навчання:**
- ✅ Успішно розгорнути шаблон `todo-nodejs-mongo`
- ✅ Розгорнути та налаштувати `azure-search-openai-demo` з RAG
- ✅ Виконати інтерактивні вправи воркшопу (фаза Discovery)
- ✅ Брати участь у дискусіях спільноти Azure Discord

### Рівень: Середній (Розділи 3-4)
Після завершення проміжних розділів учні продемонструють:

**Технічні можливості:**
- Керувати розгортаннями в кількох середовищах (dev, staging, production)
- Створювати власні Bicep-шаблони для інфраструктури як коду
- Реалізувати безпечні схеми автентифікації з використанням керованої ідентичності
- Розгортати складні багатосервісні додатки з користувацькими налаштуваннями
- Оптимізувати стратегії забезпечення ресурсів для зниження витрат і підвищення продуктивності

**Професійні навички:**
- Проектувати масштабовані архітектури інфраструктури
- Впроваджувати найкращі практики безпеки для хмарних розгортань
- Документувати шаблони інфраструктури для командної співпраці
- Оцінювати та вибирати відповідні сервіси Azure відповідно до вимог

**Підтвердження навчання:**
- ✅ Налаштувати окремі середовища з параметрами, специфічними для кожного середовища
- ✅ Створити та розгорнути власний Bicep-шаблон для багатосервісного додатка
- ✅ Реалізувати автентифікацію з використанням керованої ідентичності для безпечного доступу
- ✅ Виконати вправи з управління конфігураціями на реальних сценаріях

### Рівень: Просунутий (Розділи 5-6)
Після завершення просунутих розділів учні продемонструють:

**Технічні можливості:**
- Розгортати та оркеструвати багатоагентні ШІ-рішення зі скоординованими робочими процесами
- Реалізувати архітектури агентів для обробки клієнтів і інвентаризації для роздрібних сценаріїв
- Проводити комплексне планування потужностей та валідацію ресурсів
- Виконувати автоматизовану попередню валідацію та оптимізацію перед розгортанням
- Проектувати економічно ефективний вибір SKU на основі вимог навантаження

**Професійні навички:**
- Проектувати складні ШІ-рішення для продукційних середовищ
- Очолювати технічні дискусії щодо стратегій розгортання ШІ
- Наставляти молодших розробників щодо найкращих практик AZD і розгортання ШІ
- Оцінювати та рекомендувати патерни архітектури ШІ відповідно до бізнес-вимог

**Підтвердження навчання:**
- ✅ Розгорнути повне багатоагентне роздрібне рішення за допомогою ARM-шаблонів
- ✅ Демонструвати координацію агентів та оркестрацію робочих процесів
- ✅ Виконати вправи з планування потужностей з реальними обмеженнями ресурсів
- ✅ Перевірити готовність до розгортання через автоматизовані попередні перевірки

### Рівень: Експерт (Розділи 7-8)
Після завершення експертних розділів учні продемонструють:

**Технічні можливості:**
- Діагностувати та самостійно вирішувати складні проблеми розгортання
- Впроваджувати корпоративні схеми безпеки та рамки управління
- Проектувати всебічні стратегії моніторингу та оповіщення
- Оптимізувати продукційні розгортання для масштабування, витрат та продуктивності
- Налагоджувати CI/CD-пайплайни з належним тестуванням та валідацією

**Професійні навички:**
- Керувати ініціативами з трансформації хмари на рівні підприємства
- Проектувати та впроваджувати організаційні стандарти розгортання
- Навчати та наставляти команди розробників щодо просунутих практик AZD
- Впливати на технічне прийняття рішень щодо корпоративних розгортань ШІ

**Підтвердження навчання:**
- ✅ Вирішувати складні відмови при розгортанні багатосервісних систем
- ✅ Впровадити корпоративні патерни безпеки з вимогами відповідності
- ✅ Проектувати та розгортати продукційний моніторинг з Application Insights
- ✅ Завершити впровадження корпоративної рамки управління

## 🎯 Сертифікація після завершення курсу

### Система відстеження прогресу
Відстежуйте свій прогрес у навчанні через структуровані контрольні точки:

- [ ] **Розділ 1**: Основи та швидкий старт ✅
- [ ] **Розділ 2**: Розробка з фокусом на ШІ ✅  
- [ ] **Розділ 3**: Конфігурація & Автентифікація ✅
- [ ] **Розділ 4**: Інфраструктура як код & Розгортання ✅
- [ ] **Розділ 5**: Багатоагентні ШІ-рішення ✅
- [ ] **Розділ 6**: Попередня валідація & Планування ✅
- [ ] **Розділ 7**: Усунення несправностей & Налагодження ✅
- [ ] **Розділ 8**: Продукційні & Корпоративні патерни ✅

### Процес перевірки
Після завершення кожного розділу перевірте свої знання за допомогою:

1. **Виконання практичних вправ**: Розгорніть працездатні рішення для кожного розділу
2. **Оцінювання знань**: Перегляньте розділи FAQ та пройдіть самооцінки
3. **Залучення до спільноти**: Діліться досвідом та отримуйте відгуки в Azure Discord
4. **Розробка портфоліо**: Документуйте свої розгортання та набуті уроки
5. **Рецензія від колег**: Співпрацюйте з іншими учнями над складними сценаріями

### Переваги після завершення курсу
Після завершення всіх розділів із перевіркою випускники отримають:

**Технічна експертиза:**
- **Досвід у продакшні**: Розгорнуті реальні ШІ-додатки в середовищах Azure
- **Професійні навички**: Здатність виконувати розгортання та усунення несправностей на корпоративному рівні  
- **Знання архітектури**: Багатоагентні ШІ-рішення та складні шаблони інфраструктури
- **Майстерність усунення несправностей**: Самостійне вирішення проблем розгортання та конфігурації

**Професійний розвиток:**
- **Визнання в індустрії**: Підтверджувані навички в затребуваних галузях розгортання AZD та ШІ
- **Кар'єрне зростання**: Кваліфікації для ролей cloud-архітектора та спеціаліста з розгортання ШІ
- **Лідерство в спільноті**: Активне членство в спільнотах розробників Azure та ШІ
- **Безперервне навчання**: Підґрунтя для поглибленої спеціалізації в Microsoft Foundry

**Активи портфоліо:**
- **Розгорнуті рішення**: Працюючі приклади ШІ-додатків та шаблонів інфраструктури
- **Документація**: Всеохопні посібники з розгортання та процедури усунення несправностей  
- **Внесок у спільноту**: Дискусії, приклади та покращення, якими діляться з спільнотою Azure
- **Професійна мережа**: Зв'язки з експертами Azure та практиками розгортання ШІ

### Наступні кроки після курсу
Випускники готові до поглибленої спеціалізації в:
- **Експерт Microsoft Foundry**: Глибока спеціалізація в розгортанні моделей ШІ та оркестрації
- **Лідерство в хмарній архітектурі**: Проектування розгортань масштабу підприємства та управління
- **Лідерство в спільноті розробників**: Внесок у приклади для Azure та ресурси спільноти
- **Корпоративне навчання**: Викладання навичок AZD та розгортання ШІ в організаціях

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Відмова від відповідальності:
Цей документ було перекладено з використанням сервісу автоматичного перекладу ШІ [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ мовою оригіналу слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний переклад, виконаний людиною. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->